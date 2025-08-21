Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADC8CA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:52:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0zw-0004Lt-90; Thu, 21 Aug 2025 04:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0zH-0002Bo-P3
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0zB-0001p5-Qr
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755766167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrmyOFbIa0k81LCSi2crfagyGp2pAVLdS4CCVD46SsM=;
 b=K00502wmvpgExndwWIsa50pIqQqA8HoXF1igIyOk/QeMVMiVEZRWKzPaoDIlUfIe0pRzp8
 NZDqXNci2Pm4P7nyD9/nXuKDLUUy5kOIBwVJ1rhJa+h4iO5Dmr986BUysXXiNf4KifxQQm
 tee9C8jNvHraeXS1rHgnotfUXVmbHaQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-fDOqqv_wPrWaEGSna9kI0g-1; Thu, 21 Aug 2025 04:49:26 -0400
X-MC-Unique: fDOqqv_wPrWaEGSna9kI0g-1
X-Mimecast-MFC-AGG-ID: fDOqqv_wPrWaEGSna9kI0g_1755766165
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47253319b8so573273a12.3
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755766165; x=1756370965;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrmyOFbIa0k81LCSi2crfagyGp2pAVLdS4CCVD46SsM=;
 b=Eh/Rg2IsvMsZLYSHzqmdXDG9TONqfdk4hmwf76HHUry09iwxDbMoPETtGlrc+Gqu7B
 LyC1rKzi9ya9qohDqGdJ8Z1VRQZNERICsgfk8l62nKyUdi42Wgvbpm9jJIEHZv0GqFGN
 PCN6zT8hst7IhBgZKm+NThKpedrZb7zlZHQRDT3llCi/zlGfkupKq1cBxGWUpuCJdFqd
 lBDPq/3B8ZBNZBeUd0e6hQG9qutxGncFliuDfWKha+x/mwE9/Gwccfd4kpY2aRgJNJ+A
 KtheF9boGU46fV6y+9hUWuxNIQgEca1P1VJPV+gVu3pkbY3gQgFlnCUnUVp2nhcpzJfW
 IGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgQYPqhOpIkDdVmL3XILq1e9yWP5G5bJsN4xW/i36StlSHcUJ/r0i2p42PAdcJwcN/op1K0Dg7Dw==@nongnu.org
X-Gm-Message-State: AOJu0YxZzMXikOcaFo8mDapSzvzdva+dvowfdKkSoxqZ8tncy1j3CIHy
 98MxsM79p8MxfqIltcLwM8QX836QX1bKKIQl/7nF0CoPjChg5eeMl3BP0FLI3qvuCKbgm8PUJ4i
 6wWV/MmBhog56Lb0njQrmQFvonyfStjuugJ71tD6VY4WlNd+YcTv/RQ==
X-Gm-Gg: ASbGncsmFqbnE+ODMJZASz7RiRGeoylOsabhWHXhX3SqyGj5SWa5qv19SnrpKv9n2h5
 xrb9zjOMfS+f3sNb3FN88ok5PkOcFcV7zBfVK6OOqV97oNNlTryOHlDzHrakgjHR5GSh5sKDwEr
 O1q2leewiGynRhGONr5ttw8BTFOQ1ZrmJ3GvGrIdjTS+y+744+N0Af24UkB219JndFfm3xKWbgT
 +YBoneoWBE1m43eDSTcRZ1SW5vp0sJPWmCKCqwB47K+IN9rVh2dCqjfXicsLSgZQBWJCZ2JjIh/
 Lp1KQ3oaulJrhWB5BzKm2VTpCjsc1PwSbl7N5bX9D+NoLZXnIr9c
X-Received: by 2002:a17:902:e945:b0:240:763d:e999 with SMTP id
 d9443c01a7336-245fed7d1a4mr21733025ad.29.1755766164930; 
 Thu, 21 Aug 2025 01:49:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELsoSd1Ft8mZKfa4ozKlB1OUzuJGZBpbSuOdrCcMzeCg3VC/p6ep/p6GmCONhTwqGp/qF1Hw==
X-Received: by 2002:a17:902:e945:b0:240:763d:e999 with SMTP id
 d9443c01a7336-245fed7d1a4mr21732445ad.29.1755766164524; 
 Thu, 21 Aug 2025 01:49:24 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:49:24 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:21 +0530
Subject: [PATCH v12 27/27] backends/tpm: Propagate vTPM error on migration
 failure
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-27-72b803e707dc@redhat.com>
References: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
In-Reply-To: <20250821-propagate_tpm_error-v12-0-72b803e707dc@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6695; i=armenon@redhat.com;
 h=from:subject:message-id; bh=qkfEA7ojmGiLCP4BOBgR+X9tFhQoPaG7uEYFJBJjL/Q=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO6mNp7hFtDmWPrVY68O70oqnNf5O39Ty7gXHe7ZJL
 455/lm2o5SFQYyLQVZMkaXha4BsU0BhRKTty+swc1iZQIYwcHEKwESqJzL8r5B5afPH1sYj6UVP
 bOdntv1lcxtaMlY//+vobP56eaxKC8MvpjNaLXsdDcK8X3bmSJ+WmMHzuHDNsXYT5addAp8a1un
 yAwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xW2qFq9_t58zGmDHEZkJVRyj6C_DCRFI3NM8S75avi0_1755766165
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.50.1


