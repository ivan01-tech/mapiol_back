export async function findDocumentById(model, id) {
    try {
        const document = await model.findById(id);
        return document || false;
    }
    catch (err) {
        console.error(`Error finding document by ID in model ${model.modelName}:`, err);
        throw err;
    }
}
