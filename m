Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6222ACA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:25:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNf1-0005LP-Oi; Sat, 30 Aug 2025 11:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5OU-0006lU-Iu
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:08:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5OS-0005LG-Gs
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756498095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc9okNpMYt4DXDWcpMg2ynUqZTjLFOeZYVXE63oU0yM=;
 b=GBA6NeOuMNtVpYjXiw6CBTPwIVfMkkJMWL0pwXXfPeUkp3033Ul2km5jIIasI7OniuqdBE
 rAMS1mkMxq+MTTq+pboFVtd/sPJBgM7D8mLION63W1xwYIJVyMCvkcKr6mInWmIqjdGi08
 nmRSq9ibRrbHhYBC7hLI5Dq71Bg7euE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-R19V7AqtNaux4o0cBXYB3g-1; Fri, 29 Aug 2025 16:08:14 -0400
X-MC-Unique: R19V7AqtNaux4o0cBXYB3g-1
X-Mimecast-MFC-AGG-ID: R19V7AqtNaux4o0cBXYB3g_1756498094
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-325e31cece1so3633439a91.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756498094; x=1757102894;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vc9okNpMYt4DXDWcpMg2ynUqZTjLFOeZYVXE63oU0yM=;
 b=wkkAPqhmuptzM9VkvbsDhYw6zGcHNsC23eeLl72JS4Jxq/H+30LLudDOH+xj8vJI9s
 rJnCploc7Y0AAr7J21lYylhbUUmQNijbjhxtH920PzvP/wJafoP5d7YIcTAFEZqkNmM6
 TbsCNG4QJBZP0nUnPqc4fUop8UWcruHay4anGZ2Bu8teB6aRsFSA2MkoadMnfg4QULFD
 yuTXxqk7Bta4HPsf/8k1ir5gztXDIa8eSceT7uUd3klRsNdKA4am+S/JgB+bNbW78nyy
 HHq4tnPr7pKjONOms60B+cxUH7+kIydbRGAWnWmr4hJTKFlhewrn4bzxmfS/R3ccv0I7
 TG8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB62f0IgwADhP2j7+Ne7G5EiBITypHaFlxJt6Rvzmnt/XSnfUujJRosESq+Kx8aeiRpWkB+9LAOA==@nongnu.org
X-Gm-Message-State: AOJu0Yww87CQcAwMGaemPmKni1qrTgyYIlVksAYyYFpSVgjwEFT1REPx
 a9SuFYlt85UIk1bdLWIdU8MwxZbG9CLqBqtt8RGaJNrHiL0U79gZcz4WPRNzvZvAn3ksEOAiIr8
 ch/VsJsCfxYe01ZA1S6H+OxPJZtwHrTTq6eLa+zRHOVnhBtyIOjEwLw==
X-Gm-Gg: ASbGncuvnI88BUAGfU9RefC5yt9Gt5DTEM5DKprI/BVhd1B2RX/ukHT7krkdCHZwPe4
 b5TmV7fEcJoM9/7k0DvVq2yXdeO7kx1qd7CP2jUSyXbZm+kAf7PuFKQ3J/ZkQbp8Wl6KXFmHdup
 ppxpaXR+KrDdui8X+ghkQbOSfojrBOuCme/Yw1EAj6AlMAX2gtvB1Bq6xvwIaqnSS5LdlXGIfRY
 xFSy17PChR1mhXxZYb0AbRwHs8u5zxRSHstaJTycTXc9eoO5u/oXslV9jVTobGhnyJytll2LGls
 JLxi9OyanKEFQ2FiNSlMpRezxIDVRE8vVIVNuKJD5dCl9b22IOoT7w==
X-Received: by 2002:a17:90a:d403:b0:327:7334:403d with SMTP id
 98e67ed59e1d1-3277334435cmr15906368a91.26.1756498093586; 
 Fri, 29 Aug 2025 13:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhhXSX2eCLxAvWt7EvUR1swwAMrlBlt350y/9PRxwjHXPTpxnRCJrDDncu9hYyB0LWMaCANQ==
X-Received: by 2002:a17:90a:d403:b0:327:7334:403d with SMTP id
 98e67ed59e1d1-3277334435cmr15906316a91.26.1756498093195; 
 Fri, 29 Aug 2025 13:08:13 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:08:12 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:32:06 +0530
Subject: [PATCH v13 26/27] migration: Add error-parameterized function
 variants in VMSD struct
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-26-a4e777b7eb2c@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6945; i=armenon@redhat.com;
 h=from:subject:message-id; bh=mV3iaTC209YJUAdA9bqx8Vyx3XlTmai9n7FrOGzxR9o=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdj+/nV3C61nVvXI3iCyO4BA6Wuz51FvC1vvg14Wt/
 tH7TlV1lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmEjcSUaG/fHWLRtFZdXeCHQ+
 5P7+R9fJRD9s+Xv3QLsPvbp+Xil/GRkWVBfzJPya1WSh5adme6TGK2divO3RC6tiHnKa1+zI92I
 GAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pQsTs5uo80ooAG7pkrX2jF5bvFXzOmE_r5YKdHXvcdM_1756498094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

- We need to have good error reporting in the callbacks in
  VMStateDescription struct. Specifically pre_save, pre_load
  and post_load callbacks.
- It is not possible to change these functions everywhere in one
  patch, therefore, we introduce a duplicate set of callbacks
  with Error object passed to them.
- So, in this commit, we implement 'errp' variants of these callbacks,
  introducing an explicit Error object parameter.
- This is a functional step towards transitioning the entire codebase
  to the new error-parameterized functions.
- Deliberately called in mutual exclusion from their counterparts,
  to prevent conflicts during the transition.
- New impls should preferentally use 'errp' variants of
  these methods, and existing impls incrementally converted.
  The variants without 'errp' are intended to be removed
  once all usage is converted.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 docs/devel/migration/main.rst | 19 +++++++++++++++++++
 include/migration/vmstate.h   | 14 ++++++++++++++
 migration/vmstate.c           | 31 ++++++++++++++++++++++++++++---
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/docs/devel/migration/main.rst b/docs/devel/migration/main.rst
index a39fec2e21c26c4315c0cf13b105176d70679d4d..93620102ae875e7477af2e26eeffe636ca0cdbca 100644
--- a/docs/devel/migration/main.rst
+++ b/docs/devel/migration/main.rst
@@ -444,6 +444,25 @@ The functions to do that are inside a vmstate definition, and are called:
   This function is called after we save the state of one device
   (even upon failure, unless the call to pre_save returned an error).
 
+Following are the errp variants of these functions.
+
+- ``int (*pre_load_errp)(void *opaque, Error **errp);``
+
+  This function is called before we load the state of one device.
+
+- ``int (*post_load_errp)(void *opaque, int version_id, Error **errp);``
+
+  This function is called after we load the state of one device.
+
+- ``int (*pre_save_errp)(void *opaque, Error **errp);``
+
+  This function is called before we save the state of one device.
+
+New impls should preferentally use 'errp' variants of these
+methods and existing impls incrementally converted.
+The variants without 'errp' are intended to be removed
+once all usage is converted.
+
 Example: You can look at hpet.c, that uses the first three functions
 to massage the state that is transferred.
 
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index c1d8e5b7a7d9d544fc8ce181372660f5538ef66b..647d7a35ce5f2c8b8ca5fdb15b54c10a0896cea8 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -200,14 +200,28 @@ struct VMStateDescription {
      * exclusive. For this reason, also early_setup VMSDs are migrated in a
      * QEMU_VM_SECTION_FULL section, while save_setup() data is migrated in
      * a QEMU_VM_SECTION_START section.
+     *
+     * There are duplicate impls of the post/pre save/load hooks.
+     * New impls should preferentally use 'errp' variants of these
+     * methods and existing impls incrementally converted.
+     * The variants without 'errp' are intended to be removed
+     * once all usage is converted.
+     *
+     * For the errp variants,
+     * Returns: 0 on success,
+     *          <0 on error where -value is an error number from errno.h
      */
+
     bool early_setup;
     int version_id;
     int minimum_version_id;
     MigrationPriority priority;
     int (*pre_load)(void *opaque);
+    int (*pre_load_errp)(void *opaque, Error **errp);
     int (*post_load)(void *opaque, int version_id);
+    int (*post_load_errp)(void *opaque, int version_id, Error **errp);
     int (*pre_save)(void *opaque);
+    int (*pre_save_errp)(void *opaque, Error **errp);
     void (*cleanup_save)(void *opaque);
     bool (*needed)(void *opaque);
     bool (*dev_unplug_pending)(void *opaque);
diff --git a/migration/vmstate.c b/migration/vmstate.c
index a7562a5cfd8627e20c90e286e35c5e3429c48150..86293593e0fbb8409409b22d3f0653327d727c32 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -134,6 +134,7 @@ static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id, Error **errp)
 {
+    ERRP_GUARD();
     const VMStateField *field = vmsd->fields;
     int ret = 0;
 
@@ -152,7 +153,16 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         trace_vmstate_load_state_end(vmsd->name, "too old", -EINVAL);
         return -EINVAL;
     }
-    if (vmsd->pre_load) {
+    if (vmsd->pre_load_errp) {
+        ret = vmsd->pre_load_errp(opaque, errp);
+        if (ret < 0) {
+            error_prepend(errp, "pre load hook failed for: '%s', "
+                          "version_id: %d, minimum version_id: %d, "
+                          "ret: %d: ", vmsd->name, vmsd->version_id,
+                          vmsd->minimum_version_id, ret);
+            return ret;
+        }
+    } else if (vmsd->pre_load) {
         ret = vmsd->pre_load(opaque);
         if (ret) {
             error_setg(errp, "pre load hook failed for: '%s', "
@@ -245,7 +255,14 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         qemu_file_set_error(f, ret);
         return ret;
     }
-    if (vmsd->post_load) {
+    if (vmsd->post_load_errp) {
+        ret = vmsd->post_load_errp(opaque, version_id, errp);
+        if (ret < 0) {
+            error_prepend(errp, "post load hook failed for: %s, version_id: "
+                          "%d, minimum_version: %d, ret: %d: ", vmsd->name,
+                          vmsd->version_id, vmsd->minimum_version_id, ret);
+        }
+    } else if (vmsd->post_load) {
         ret = vmsd->post_load(opaque, version_id);
         if (ret < 0) {
             error_setg(errp,
@@ -414,12 +431,20 @@ int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
 int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                          void *opaque, JSONWriter *vmdesc, int version_id, Error **errp)
 {
+    ERRP_GUARD();
     int ret = 0;
     const VMStateField *field = vmsd->fields;
 
     trace_vmstate_save_state_top(vmsd->name);
 
-    if (vmsd->pre_save) {
+    if (vmsd->pre_save_errp) {
+        ret = vmsd->pre_save_errp(opaque, errp);
+        trace_vmstate_save_state_pre_save_res(vmsd->name, ret);
+        if (ret < 0) {
+            error_prepend(errp, "pre-save for %s failed, ret: %d: ",
+                          vmsd->name, ret);
+        }
+    } else if (vmsd->pre_save) {
         ret = vmsd->pre_save(opaque);
         trace_vmstate_save_state_pre_save_res(vmsd->name, ret);
         if (ret) {

-- 
2.51.0


