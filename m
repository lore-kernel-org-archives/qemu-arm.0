Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7057FCAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:25:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Rtw-000062-Jt; Tue, 30 Sep 2025 00:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RtG-0006yi-0d
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rt8-0003UH-Og
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:23:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759206171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwtHdo40Ubbz5T9WQXMHuDDStDH3aq6sTqis/zRfQds=;
 b=Tnd72rLYpNyO5Clh9J3xKI6tMkbqx76eJOZ8LuGLteu3hT7MEZcVjrWtVpIHqX9jDJdDN4
 B+orT6swg0X1fgf22CZh9L6vNOyGZM39YibycrDYGI3sH8tasVQP3wRW63GzruTpuryZvp
 JPGEvB4kFFPfCgEHzUrjlpUI2PaHKCU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-cfvIiNsEOdO8_2MoxGPh9g-1; Tue, 30 Sep 2025 00:22:49 -0400
X-MC-Unique: cfvIiNsEOdO8_2MoxGPh9g-1
X-Mimecast-MFC-AGG-ID: cfvIiNsEOdO8_2MoxGPh9g_1759206168
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33428befc3aso5957326a91.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759206168; x=1759810968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwtHdo40Ubbz5T9WQXMHuDDStDH3aq6sTqis/zRfQds=;
 b=tNzyLUPJ4CULDI1IU6UnH9Oe7Rq9fTbACG4h15BDiBirQhUqj44OSCSSbzPVGHjzCb
 v7H4LCe406kGbBF7NbMgLQaRxyrdN8CXXP5LnbZ89dZi7fnT43i0/dCK6qtbzuYgSMZB
 /2R6D6eBVh6sUWfbZSFl9UafGY4y7c5M5VT+i4+hBi3gOgNV4SCxOJpVz9E9e8c/QQm8
 pNUVS4mx1aOnaXMK6eDkPfaqLI1MggJDYn+mXLrm8COPDkZZMVJzdPGQqUWQQ9WC+h+e
 379lxMiQD1rm/QkOQoVCCrPIFQgM3VPGbdf7fMJoDkhpbHXPJg+oE14Jw4p1G1kW/3C6
 0iFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkBbxUcQcDd9CwYq54aw7ONDKst+Iq8Y+vy+lM2LrRfJzH0Ohld6u9wEAGBOnQC60Bq8nl1PYOYQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywgo6tlLgO1tedtT3vD4FPXa8TUsitBJR4pD2Legz0r8VM+3psJ
 vFVY7KTFATuZee2VjqwZLoUBIcleaWx7ZC8Gsf35esl3A++//Wh1QCDM2WOmNcV6G/oFAZWGG3X
 +KccGXWRDdlf1JgnpjHY5rskTzQcNQTgs6wL+99Wxmt6EHqQJN02Tfw==
X-Gm-Gg: ASbGncvF9qxyvEC9EjKXYfPsUWWh36FV4jl0P3SabPrRXe3na0Nb3kmghfTb8TRx6x2
 H3E0WsvN72ziH0AGMtjw263imszEp35vLXwa7AbpInWidPuDqR48buIBGO7nhrcTlJAC938Hsta
 74TT8cYBGkwUhTm17xACvnxoSrqoCaY61Qy6ZsC9lqIeYMPAerfmwv3zF5Ixwq49dxGe49unT8j
 EHN9UQkuwdW9z93FNOrGzUnxi6huySj1CO7CeJqMCHA1Wf7uodwXJYoKb6/TdQviXmwXwgo+NJ0
 B5hR1W9PksYGeMmFHablkiAE2qe7hSe9pjCYt1gKcuKR0G+tB2WHOuhxsg==
X-Received: by 2002:a05:6a20:975a:b0:2f6:6d95:69db with SMTP id
 adf61e73a8af0-2f66d957c82mr14035777637.57.1759206168096; 
 Mon, 29 Sep 2025 21:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnw7gTnIW2+vK/A5gNuWDzoyhk8NWg44PbbImZFchUy7B4zfSl9IEwi+KGVP3m1lAQ4Mi+hw==
X-Received: by 2002:a05:6a20:975a:b0:2f6:6d95:69db with SMTP id
 adf61e73a8af0-2f66d957c82mr14035735637.57.1759206167720; 
 Mon, 29 Sep 2025 21:22:47 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:22:47 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:35 +0530
Subject: [PATCH v15 26/26] backends/tpm: Propagate vTPM error on migration
 failure
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-26-84afd3af1e47@redhat.com>
References: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
In-Reply-To: <20250930-propagate_tpm_error-v15-0-84afd3af1e47@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6844; i=armenon@redhat.com;
 h=from:subject:message-id; bh=A5j2AA7VZek1kkU+LeIGdhwVuZTv6xXluxZXB+cJtoU=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKKFnmxUP+KdksR6vcYsrmv5mVural5/XbbV1TH64h
 El2d/3NjlIWBjEuBlkxRZaGrwGyTQGFEZG2L6/DzGFlAhnCwMUpABPRz2Fk6J6mIsidzcfA1nvS
 7/Wl1uXa3WvW5Trs9QmSN+I3kkquZvifYt62XsUvzOf33gk/tNpCvAx3lue9le9g4RUxkqos+8g
 FAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1IgxWnnETBzfS_CT1VAua3EotJYY36gkXoqcJp9TeIQ_1759206168
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
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


