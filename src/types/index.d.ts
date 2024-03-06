export interface IFile {
  id: number;
  s3Key: string;
  bucket: string;
  mime: string;
  comment: string | null;
}
