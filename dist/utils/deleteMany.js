export const deleteAllDocuments = async (YourModel) => {
    try {
        const result = await YourModel.deleteMany({});
        console.log(`Nombre de documents supprimés : ${result.deletedCount}`);
    }
    catch (error) {
        console.error('Erreur lors de la suppression des documents :', error);
    }
};
