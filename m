Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFFCA1013
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 15:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzGUO-0003FU-2q; Thu, 18 Sep 2025 11:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUM-0003Aj-70
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1uzGUI-0002WP-Sd
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 11:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758209037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8x1fPRiLk+q98Zq/PxzJ1EQGy5pEsHLkUkWHdcN4ADk=;
 b=SAmeR7VPlZLO6pho+x09xT9wWh9aWKWmTsS2HHKIx7fv3Qi1EZ+0Fgdb7N+obRQwT1umA9
 YvYMvcYQAzbmCsRl97gkEEeP+bXxyClB8wJAW25yWxUo4XUsK1TopBxgSfWiAHNnKUpR8q
 2q1srPinCRAmAVecxcIFtrIEUxBdOYI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-1saK0FriPPGSpgBiJOAA2A-1; Thu, 18 Sep 2025 11:23:56 -0400
X-MC-Unique: 1saK0FriPPGSpgBiJOAA2A-1
X-Mimecast-MFC-AGG-ID: 1saK0FriPPGSpgBiJOAA2A_1758209035
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b549a25ade1so1304409a12.3
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 08:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758209035; x=1758813835;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8x1fPRiLk+q98Zq/PxzJ1EQGy5pEsHLkUkWHdcN4ADk=;
 b=FxIYWsGA6hO5GOj7hGzKJjW0FD5HeR1Ug0C0qmX/y5QkyOQaznjm1h9BYOXcK8pdDq
 6SaZn7JQdmtJGN7ZF0c2s4oXTpbIO17nEubW1NWYeELM3WW0bS0Dy6Me7yC8KjDNH2oV
 U4mkptBL6k9HeIWYN6va0NvIpKy8Q+K7qkIvpU9oRqrGcm0t2umWxRCNVqRiuzqRkKJE
 p0vqcILi1Sk7VqwE1lDI1dL9+DeUvTSB7csT+UV4Y/AkpFjz2X0HquBb1Fx98rv6e1kJ
 leJ5bDrMQdy6OOxnaJ9IRQNKUtJBf6lcZJUJDukfu6MAbjRCq8x2G6cfdikUPS8mmDCP
 d3Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC9qugmJCT/JUHnWK1fLm6DcZL2yot59zbkYF3vxF5DKshkbreqPfPQQ9vfAfAFhwajZAfkiT+Vg==@nongnu.org
X-Gm-Message-State: AOJu0YxM/GyTGSOL5hZiBzHIc0O9vJ3tt9zlbtARLs3Oz8DkZo65HbDa
 02R4Ar9I5kTocPn7HvCoTaSBika/Kd2akztRbCbkXxxxT/knUIjrWAutbTPYBpPvgFryDR6xVjj
 tJoCeM6gP28MYPIGHpFhOB/LyrLOscuDf7Y56qMNYJXWMD7O1DwL3Yw==
X-Gm-Gg: ASbGncsgLkxtNg92TW1cIm3IuQMGUDct/63FjfZ/bnbwi2OQSSSaK2+fqlBozC1yxD+
 vLLM2mD4W/YKJuKymolUsC+PTQ9KWzq6k1YFdM7E6NKdDQOWz+FwoiXeOEtECogv0WpajUDlbuN
 egbjrUVThAIBbY6eWySG/ssVrEZB2QrGpenR1+l7sOdL5Bz5q8mwIvlxY5Qbbid55dySs6RDtKR
 kI1GvxP4rOfH+WAYHX2PltZ3EnTQjWmeSTFvukeWBGOnw1QecelBkDGQD3Z2MS9co0GOBgJRDOo
 q/CirzYuOg48oRMkdsLLeRj4FTkT2QqW56O+BkohRo12lV++hbTQOQ==
X-Received: by 2002:a05:6a21:999b:b0:246:2c:10c with SMTP id
 adf61e73a8af0-27ab2a5d169mr9508889637.40.1758209034917; 
 Thu, 18 Sep 2025 08:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdNfs7/6z48EHockKWM2rs1Vgch7BGFVNHsfB1mtfPzgOxsJOjZ7ea+b52R9iZ+FWfNBZoFg==
X-Received: by 2002:a05:6a21:999b:b0:246:2c:10c with SMTP id
 adf61e73a8af0-27ab2a5d169mr9508843637.40.1758209034487; 
 Thu, 18 Sep 2025 08:23:54 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.110.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc2481d7sm2675512b3a.32.2025.09.18.08.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 08:23:54 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 18 Sep 2025 20:53:18 +0530
Subject: [PATCH v14 01/27] migration: push Error **errp into
 vmstate_subsection_load()
MIME-Version: 1.0
Message-Id: <20250918-propagate_tpm_error-v14-1-36f11a6fb9d3@redhat.com>
References: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
In-Reply-To: <20250918-propagate_tpm_error-v14-0-36f11a6fb9d3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3492; i=armenon@redhat.com;
 h=from:subject:message-id; bh=jjVnj4GpDkFjmsw4frYXnt3FkfLdgzOUkOtwV8FPcDs=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8YZ5e8TD66dNUlJ5GU3c8TclnKlpZO9tTbyijEF3/itd
 Ex8637vjlIWBjEuBlkxRZaGrwGyTQGFEZG2L6/DzGFlAhnCwMUpABOxq2Zk+DThgM4H/hmPw3Oq
 7HX/fHtx9uAeqYtPpz7WdZb8yfHx5V1Ghtc3Cv/P2bLkaXNhjkBBl2LVvawPuzr9b/+aWrs0w/2
 vMzMA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nI-H0V6FwGKK3AJ5LDW3j7LHANAKb5O5pAB20AWiw48_1758209035
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armenon@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.005,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that vmstate_subsection_load() must report an error
in errp, in case of failure.

The errors are temporarily reported using error_report_err().
This is removed in the subsequent patches in this series,
when we are actually able to propagate the error to the calling
function using errp.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/vmstate.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index 5feaa3244d259874f03048326b2497e7db32e47c..08f2b562e3a5ec0e186336215ccfb378a7675f0c 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -25,7 +25,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
                                    void *opaque, JSONWriter *vmdesc,
                                    Error **errp);
 static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
-                                   void *opaque);
+                                   void *opaque, Error **errp);
 
 /* Whether this field should exist for either save or load the VM? */
 static bool
@@ -136,6 +136,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
 {
     const VMStateField *field = vmsd->fields;
     int ret = 0;
+    Error *local_err = NULL;
 
     trace_vmstate_load_state(vmsd->name, version_id);
     if (version_id > vmsd->version_id) {
@@ -225,9 +226,10 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         field++;
     }
     assert(field->flags == VMS_END);
-    ret = vmstate_subsection_load(f, vmsd, opaque);
+    ret = vmstate_subsection_load(f, vmsd, opaque, &local_err);
     if (ret != 0) {
         qemu_file_set_error(f, ret);
+        error_report_err(local_err);
         return ret;
     }
     if (vmsd->post_load) {
@@ -566,7 +568,7 @@ vmstate_get_subsection(const VMStateDescription * const *sub,
 }
 
 static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
-                                   void *opaque)
+                                   void *opaque, Error **errp)
 {
     trace_vmstate_subsection_load(vmsd->name);
 
@@ -598,6 +600,8 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
         sub_vmsd = vmstate_get_subsection(vmsd->subsections, idstr);
         if (sub_vmsd == NULL) {
             trace_vmstate_subsection_load_bad(vmsd->name, idstr, "(lookup)");
+            error_setg(errp, "VM subsection '%s' in '%s' does not exist",
+                       idstr, vmsd->name);
             return -ENOENT;
         }
         qemu_file_skip(f, 1); /* subsection */
@@ -608,6 +612,9 @@ static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
         ret = vmstate_load_state(f, sub_vmsd, opaque, version_id);
         if (ret) {
             trace_vmstate_subsection_load_bad(vmsd->name, idstr, "(child)");
+            error_setg(errp,
+                       "Loading VM subsection '%s' in '%s' failed: %d",
+                       idstr, vmsd->name, ret);
             return ret;
         }
     }

-- 
2.51.0


