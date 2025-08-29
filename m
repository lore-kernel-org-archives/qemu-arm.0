Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C73CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNf6-0005ZJ-IE; Sat, 30 Aug 2025 11:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Ol-0006rO-6q
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Od-0005MW-SN
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756498106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFx1//LdCNq+XYf5MolNY5wtarm8we+wGLU/Uo30GXs=;
 b=HLnA5PkJXCzVUKcOMxnijmBXlNg3MAjJEHOfEvhRGzFYjYBac/zbSB+TZ0FJ1GTVOHoTJZ
 DX4JXI+u+YTHEnaMf939ZpU1MpK0kLuEivJ4wFZDrBRgS3UesrJnOYotWbNf3owuTzKb/1
 nOvOkHws6W9YaG2sT3CeGK07/ku/0n8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-RuShqxuNMgmbDl-tlgVOCQ-1; Fri, 29 Aug 2025 16:08:24 -0400
X-MC-Unique: RuShqxuNMgmbDl-tlgVOCQ-1
X-Mimecast-MFC-AGG-ID: RuShqxuNMgmbDl-tlgVOCQ_1756498104
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458264c5aso22915015ad.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756498104; x=1757102904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFx1//LdCNq+XYf5MolNY5wtarm8we+wGLU/Uo30GXs=;
 b=lW1+87OBJUN3iCj8FZ8P6fNDUD7cjhDlmZCVLmI4uonBYUncP1WR6sBkUZT6Lc8rYM
 dIcbHkYSWCVRXc7VbJ7OsZ+0PKRGcLySuZ+jvLsdxqUnBgWVzLHnR5E0aQFljGtZjSB+
 gbWEGA3mdb3yWdgi2OrV3DlRJhNGgp0SLSbPC1p62mkZ0U0So+LExEvo43pEIvHaKTSM
 +YIirm6216+d56VQxlZYuw5t33hkh80WWd3ticEaafrl2Yr2J570/L/0GSGh1yeSHZGC
 yOlcIj04F3qYtw0wNolUDi9z6HanYjCOfLUwOrAUAdEib0zr6xzzh/O1K5r15BWlUE85
 wPIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPLV8NF7rj5iKiuU+yP2tXNgn9/2rjAtq4uOM3g3cFijMCvTeJAYTqRnlHNQhFG4W0CVXyO1SrgQ==@nongnu.org
X-Gm-Message-State: AOJu0YwgUBO9hNbHm8GoISbEcZaTcKZlDf84jlsSHgEwktTJQvyuI+/t
 gJ+YGiEHlWVQr0P29TqW1hR4MeUWx9DzcF8aJENCaReZt8yHpadNM9F2MSQI4TdPa4mQeLFFhFy
 aF5jA2N7L1pwh2Ftkv6F/p6JyAEMNDBXLq6ZgwFKts+McA3eE7CowFA==
X-Gm-Gg: ASbGncu9EQF5RY2nJ6r3wE956aECX9Ij9LdviyH2Hh8kz3AAqYscBAPV3vTec2NHE6G
 v5Vtv+2Av7oNVdVUbCjXrJevRjxQ0EG6+PPMpDEUDU+5aGB27N1d5J8dK+9zeTwphMAGZf3puSh
 lwQ8qteaeR/RvuxKffCeBd0s4KP+SdJ0L/5gbXSWgejEsELmg/TyAMdQM267QQxCUU0K+gJCRsY
 9joXSgat8+yuI9WLa0jcAz9iU8rAfjtZq9oHTu3qecdow+/8U8sKHGIdE8h76rLO6lgXrg6YPDG
 AWoiE7BrjMAkz51To66sKg1uF0CMfs4sCDmsrdV5OGmzvh/XbKfsoQ==
X-Received: by 2002:a17:903:38d0:b0:246:2e9:daaa with SMTP id
 d9443c01a7336-2462edd744bmr431677615ad.2.1756498103661; 
 Fri, 29 Aug 2025 13:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6T6Du1EDUzjXwO/D95bgmt283f7NgPyWR8oL5hyg3xYqtiTFPllPJJFX6ZpkykJUC2AZxhA==
X-Received: by 2002:a17:903:38d0:b0:246:2e9:daaa with SMTP id
 d9443c01a7336-2462edd744bmr431677175ad.2.1756498103240; 
 Fri, 29 Aug 2025 13:08:23 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:08:22 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:32:07 +0530
Subject: [PATCH v13 27/27] backends/tpm: Propagate vTPM error on migration
 failure
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-27-a4e777b7eb2c@redhat.com>
References: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
In-Reply-To: <20250830-propagate_tpm_error-v13-0-a4e777b7eb2c@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Steve Sistare <steven.sistare@oracle.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, 
 Hailiang Zhang <zhanghailiang@xfusion.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Arun Menon <armenon@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6741; i=armenon@redhat.com;
 h=from:subject:message-id; bh=xJOfJwiqBhYlRBnodOx/pfgX2IXLy1xjBTSVIQV4ib8=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdr9w+Q7WVe8ybHj3KnwK+n2ozc2Uf/qPm8+lE6XFv
 5zPcZrUUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCKROgx/hQP1TZd0RXceZBE2
 evJUMc1Qan9X16I/fw/brlu08MAeVob/AQfzXsTsEpnIeaznnFT70uNPFiznXfNl8acIxqmTXIy
 YOQE=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D3Mf7t3IeCUd2c-_XRs5IUJJ6m7NGn1g1ovfYYuGRX8_1756498104
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

- When migration of a VM with encrypted vTPM fails on the
  destination host, (e.g., due to a mismatch in secret values),
  the error message displayed on the source host is generic and unhelpful.
- For example, a typical error looks like this:
  "operation failed: job 'migration out' failed: Sibling indicated error 1.
  operation failed: job 'migration in' failed: load of migration failed:
  Input/output error"
- Such generic errors are logged using error_report(), which prints to
  the console/monitor but does not make the detailed error accessible via
  the QMP query-migrate command.
- This change, along with the set of changes of passing errp Error object
  to the VM state loading functions, help in addressing the issue.
  We use the post_load_errp hook of VMStateDescription to propagate errors
  by setting Error **errp objects in case of failure in the TPM backend.
- It can then be retrieved using QMP command:
  {"execute" : "query-migrate"}

Buglink: https://issues.redhat.com/browse/RHEL-82826

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 backends/tpm/tpm_emulator.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 4a234ab2c0b19b2604bf0dd8cb5f4540c72a9438..dacfca5ab7eb0445ddc1ced97513068501b468bf 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -819,7 +819,8 @@ static int tpm_emulator_get_state_blobs(TPMEmulator *tpm_emu)
 static int tpm_emulator_set_state_blob(TPMEmulator *tpm_emu,
                                        uint32_t type,
                                        TPMSizedBuffer *tsb,
-                                       uint32_t flags)
+                                       uint32_t flags,
+                                       Error **errp)
 {
     ssize_t n;
     ptm_setstate pss;
@@ -838,17 +839,18 @@ static int tpm_emulator_set_state_blob(TPMEmulator *tpm_emu,
     /* write the header only */
     if (tpm_emulator_ctrlcmd(tpm_emu, CMD_SET_STATEBLOB, &pss,
                              offsetof(ptm_setstate, u.req.data), 0, 0) < 0) {
-        error_report("tpm-emulator: could not set state blob type %d : %s",
-                     type, strerror(errno));
+        error_setg_errno(errp, errno,
+                         "tpm-emulator: could not set state blob type %d",
+                         type);
         return -1;
     }
 
     /* now the body */
     n = qemu_chr_fe_write_all(&tpm_emu->ctrl_chr, tsb->buffer, tsb->size);
     if (n != tsb->size) {
-        error_report("tpm-emulator: Writing the stateblob (type %d) "
-                     "failed; could not write %u bytes, but only %zd",
-                     type, tsb->size, n);
+        error_setg(errp, "tpm-emulator: Writing the stateblob (type %d) "
+                   "failed; could not write %u bytes, but only %zd",
+                   type, tsb->size, n);
         return -1;
     }
 
@@ -856,17 +858,17 @@ static int tpm_emulator_set_state_blob(TPMEmulator *tpm_emu,
     n = qemu_chr_fe_read_all(&tpm_emu->ctrl_chr,
                              (uint8_t *)&pss, sizeof(pss.u.resp));
     if (n != sizeof(pss.u.resp)) {
-        error_report("tpm-emulator: Reading response from writing stateblob "
-                     "(type %d) failed; expected %zu bytes, got %zd", type,
-                     sizeof(pss.u.resp), n);
+        error_setg(errp, "tpm-emulator: Reading response from writing "
+                   "stateblob (type %d) failed; expected %zu bytes, "
+                   "got %zd", type, sizeof(pss.u.resp), n);
         return -1;
     }
 
     tpm_result = be32_to_cpu(pss.u.resp.tpm_result);
     if (tpm_result != 0) {
-        error_report("tpm-emulator: Setting the stateblob (type %d) failed "
-                     "with a TPM error 0x%x %s", type, tpm_result,
-                     tpm_emulator_strerror(tpm_result));
+        error_setg(errp, "tpm-emulator: Setting the stateblob (type %d) "
+                   "failed with a TPM error 0x%x %s", type, tpm_result,
+                   tpm_emulator_strerror(tpm_result));
         return -1;
     }
 
@@ -880,7 +882,7 @@ static int tpm_emulator_set_state_blob(TPMEmulator *tpm_emu,
  *
  * Returns a negative errno code in case of error.
  */
-static int tpm_emulator_set_state_blobs(TPMBackend *tb)
+static int tpm_emulator_set_state_blobs(TPMBackend *tb, Error **errp)
 {
     TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
     TPMBlobBuffers *state_blobs = &tpm_emu->state_blobs;
@@ -894,13 +896,13 @@ static int tpm_emulator_set_state_blobs(TPMBackend *tb)
 
     if (tpm_emulator_set_state_blob(tpm_emu, PTM_BLOB_TYPE_PERMANENT,
                                     &state_blobs->permanent,
-                                    state_blobs->permanent_flags) < 0 ||
+                                    state_blobs->permanent_flags, errp) < 0 ||
         tpm_emulator_set_state_blob(tpm_emu, PTM_BLOB_TYPE_VOLATILE,
                                     &state_blobs->volatil,
-                                    state_blobs->volatil_flags) < 0 ||
+                                    state_blobs->volatil_flags, errp) < 0 ||
         tpm_emulator_set_state_blob(tpm_emu, PTM_BLOB_TYPE_SAVESTATE,
                                     &state_blobs->savestate,
-                                    state_blobs->savestate_flags) < 0) {
+                                    state_blobs->savestate_flags, errp) < 0) {
         return -EIO;
     }
 
@@ -948,12 +950,12 @@ static void tpm_emulator_vm_state_change(void *opaque, bool running,
  *
  * Returns negative errno codes in case of error.
  */
-static int tpm_emulator_post_load(void *opaque, int version_id)
+static int tpm_emulator_post_load(void *opaque, int version_id, Error **errp)
 {
     TPMBackend *tb = opaque;
     int ret;
 
-    ret = tpm_emulator_set_state_blobs(tb);
+    ret = tpm_emulator_set_state_blobs(tb, errp);
     if (ret < 0) {
         return ret;
     }
@@ -969,7 +971,7 @@ static const VMStateDescription vmstate_tpm_emulator = {
     .name = "tpm-emulator",
     .version_id = 0,
     .pre_save = tpm_emulator_pre_save,
-    .post_load = tpm_emulator_post_load,
+    .post_load_errp = tpm_emulator_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(state_blobs.permanent_flags, TPMEmulator),
         VMSTATE_UINT32(state_blobs.permanent.size, TPMEmulator),

-- 
2.51.0


