Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E834C87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 13:14:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukMuS-0001Ef-4a; Fri, 08 Aug 2025 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHN8-0005dh-Kb
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1ukHN6-0007gB-IB
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 03:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754637514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dhef1bWqCBnHsqo81IOYSvfjFHPgxwE/BpAV/qv/2F8=;
 b=ct2SNZuQfC+m+6ASbV7GpotVG7jmCKxnHsuRsDeXXM1pH+qM1BcXx14cpGWZNkG9uWR73j
 mnF4TUyEo7R9L/k1e0W5Rzl6aL68CMQ07pL6DG7iXTN2QqGx3TbhuO72E+SrKxFMbxrKgW
 JiHHlL7EDvQqVntP0oQHYzg23nQW9IQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-uhtzLOwFPCaUwHKTV11YuQ-1; Fri, 08 Aug 2025 03:18:33 -0400
X-MC-Unique: uhtzLOwFPCaUwHKTV11YuQ-1
X-Mimecast-MFC-AGG-ID: uhtzLOwFPCaUwHKTV11YuQ_1754637513
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23ff063d087so16746785ad.1
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 00:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754637513; x=1755242313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhef1bWqCBnHsqo81IOYSvfjFHPgxwE/BpAV/qv/2F8=;
 b=N7NWb/6Ob4Rtli37Kx3Mj5PBXjTkRPQY2Ex814I7lQRV/+hK1rNOdawFYQCUd7MugP
 CSwy553m0X5QS+2XtsFVeVmnEHeoYUblvmYA4SxlZJzWWmWW/Z5yZv5zmvxlVaZq70Nl
 1wVly+6kw+6jWqSWjN3jAUSE77pUhCQYp6o/d9zAPOW5Cnz5EvsOfr2fB29da9gRUr1S
 0tq4Jujjl1W9EF3aLRfyD19E7npXTO7HJHUKWHOPu+kqTmEO6UrOKAteqO0/VdEdpzhx
 WnADf7lDLls2XFZwkEcSTaPIQNbpm6+RAUxwtDXuNdnsyYZDTMvSckh4zESGFwrP4Wkk
 4tAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8y9MLJFn/MsuAG5jENOdi8q+37ii+Ui/H9av+gq77yf3jHs998bq8PFuDPb63byEqJzgnZoEtpg==@nongnu.org
X-Gm-Message-State: AOJu0Yzrle8OTk/6FNxWtpJpJzJ605ftVIC2eWElQvUB3G0IVH/rQNQL
 mPor5RtnY+hWyp6awCa4Ha25/csmFVIjfW4b9S1E53rOGZi0jYXUnYzE0OmJjdxHOgL+k7Cjwfu
 n8kByxrc9HJwVlySDTN44wdbABv1kHOClymH4B6GrweE0XwSYJkOuaw==
X-Gm-Gg: ASbGncs0O+5q/myaW5ETQoSWm5vp1hFeBT613ps6E7SN7sRLYX2bouTIAHvIF+ce94w
 NpvnrCXDLoLiNrywQVplND7xnFLrwJiLR4LM5T8zdbTNEwGHYCbzwFdOImGkfQuEoghc03iqOSL
 zcAwDbvCoIdUdDJgRugaBAqFSH8ZmCoS2RSnkilvUMWRVd3ciPdaF1JZk/SJfQT20Vrs7/LSwvl
 ANUifbTP7Vo8RZwb4H3Odo5SA4yBehV+ZqsoQCK234ksYzQzvTcUpx7A5EOo9DEJFrSRzNYGUnV
 qlg2ejnLcaoZAZkTKPJLGUpMcV7a0VxOGZTr1tInCAbnEZWki19bBA==
X-Received: by 2002:a17:902:da85:b0:242:b14b:15ab with SMTP id
 d9443c01a7336-242c224335amr35195475ad.42.1754637512346; 
 Fri, 08 Aug 2025 00:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhBt04nK4ds6+acJefUIh+9hAZTw5/MfkA8h4Id3AvzNSD954pghMqn77ZF11N8vbXht3jAw==
X-Received: by 2002:a17:902:da85:b0:242:b14b:15ab with SMTP id
 d9443c01a7336-242c224335amr35194755ad.42.1754637511713; 
 Fri, 08 Aug 2025 00:18:31 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.101.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d347sm199659385ad.140.2025.08.08.00.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 00:18:31 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Fri, 08 Aug 2025 12:43:52 +0530
Subject: [PATCH v10 26/27] migration: Add error-parameterized function
 variants in VMSD struct
MIME-Version: 1.0
Message-Id: <20250808-propagate_tpm_error-v10-26-3e81a1d419b2@redhat.com>
References: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
In-Reply-To: <20250808-propagate_tpm_error-v10-0-3e81a1d419b2@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6567; i=armenon@redhat.com;
 h=from:subject:message-id; bh=W/Hlf0gBooyL6AaFAjxmJF/O13Y4+R8MIdYD0ZBo0ZU=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8bUxdciTtyWMYzYsLkpyX7+6su7L65/8k2txaJWRn+eR
 V7PeZmFHaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACbikMXwP/Dy2z4T/a4jOt3Z
 d86UFBpdPbpE/Pz3KUtttrfqflt5vJfhF9NjtzXMBdvSzHYaHrN/q36jZhqj5dNLm2Ny0ld5agk
 3MAIA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cAaV75gqIPprZWWcVyzHFcWJNYhjB8YTVQF_MjqJFNo_1754637513
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Aug 2025 09:13:20 -0400
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

Signed-off-by: Arun Menon <armenon@redhat.com>
---
 docs/devel/migration/main.rst | 19 +++++++++++++++++++
 include/migration/vmstate.h   | 14 ++++++++++++++
 migration/vmstate.c           | 30 +++++++++++++++++++++++++++---
 3 files changed, 60 insertions(+), 3 deletions(-)

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
index fdb8c118721a11dd88d55eadb471a61788c3eee6..1724d198a85df06a42111622d308f202a3f350a1 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -152,7 +152,16 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         trace_vmstate_load_state_end(vmsd->name, "too old", -EINVAL);
         return -EINVAL;
     }
-    if (vmsd->pre_load) {
+    if (vmsd->pre_load_errp) {
+        ret = vmsd->pre_load_errp(opaque, errp);
+        if (ret < 0) {
+            error_prepend(errp, "VM pre load failed for: '%s', "
+                          "version_id: %d, minimum version_id: %d, "
+                          "ret: %d: ", vmsd->name, vmsd->version_id,
+                          vmsd->minimum_version_id, ret);
+            return ret;
+        }
+    } else if (vmsd->pre_load) {
         ret = vmsd->pre_load(opaque);
         if (ret) {
             error_setg(errp, "VM pre load failed for: '%s', "
@@ -242,7 +251,14 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         qemu_file_set_error(f, ret);
         return ret;
     }
-    if (vmsd->post_load) {
+    if (vmsd->post_load_errp) {
+        ret = vmsd->post_load_errp(opaque, version_id, errp);
+        if (ret < 0) {
+            error_prepend(errp, "VM Post load failed for: %s, version_id: %d, "
+                          "minimum_version: %d, ret: %d: ", vmsd->name,
+                          vmsd->version_id, vmsd->minimum_version_id, ret);
+        }
+    } else if (vmsd->post_load) {
         ret = vmsd->post_load(opaque, version_id);
         if (ret < 0) {
             error_setg(errp,
@@ -411,12 +427,20 @@ int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
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
2.50.1


