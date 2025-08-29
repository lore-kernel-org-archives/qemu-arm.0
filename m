Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A7CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:21:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNcm-0000Vp-I1; Sat, 30 Aug 2025 11:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5LW-0005XM-2s
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5LS-0004x4-7j
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm02YWFPgXK6tLalWRdl7gepF4qWtk92F6eyDxpJHBE=;
 b=eHq1xw9tq5jUwlNmIm5jqkM1bK0tzqrhpfVou42+H1rJDVAcXJHXiZrrxFxr/NVqIKkvlE
 N7z0drgMKlFbQgf1EfQesVprn8y+BvdRzAeDs3qo3qvcoLuBPevwEEOsT4TwCEaJPAb6A/
 kdryxZMRIcuj2JB+TbanTbzHrDeXMpE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-l6ukomdUMMOOS3HQwcgjAA-1; Fri, 29 Aug 2025 16:05:07 -0400
X-MC-Unique: l6ukomdUMMOOS3HQwcgjAA-1
X-Mimecast-MFC-AGG-ID: l6ukomdUMMOOS3HQwcgjAA_1756497906
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3259ff53c2eso3589052a91.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497906; x=1757102706;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wm02YWFPgXK6tLalWRdl7gepF4qWtk92F6eyDxpJHBE=;
 b=Ti3O7Ri5EmtTU1I4oyUpPdzpZfNQgvEPV02+cYsZCjZUH1FwJv+ucd13Mc3pOS4UtG
 3QfyftaFDRMhoz21UWx6Puy8mpgoQ+BAIYimu2u/9K+ghmTNuDC+fHXkafTKQlzQHhNV
 7X5s8mctuNK/4Z0QJUDJOC7Wwo9u9430ZMGu2xvXLW0n43f6EZEHVRizTAsF6wG+juJz
 LG3n/MXygJ+bkUzSCALGNQW+zUJwpK8/LnU0/6QN/VJk7OARhWtJHqHtm1R8shKyBI0q
 iDWR3plTA4XtfG1tD98eGXj8UQJMSrSkLJ030qK6kitChOLOE8EB8kWo7EV9IVdCWnxn
 c2IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnTXh2dsEPEUbIxb5k04bNNKr40IlqEfTzkua9gJo/g+0OQnKG44x+hhmY3ud3IguLTY+GhmdD+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx6J1+YOqnblcRsgpP4gIK28DEuBXif14gy+wgPoxirhzv/HZNu
 LJqiCkNkN6fmsekgAIolTYp61FcaG53olj1EpCC0aBVoN1rZu2m0BSwJl33bWuTYzk3lzuF0Vpf
 rp4Me74FiPYx7L9QhQcaCSSMyz51fx3E2mn4E6Rwo9C7WZodAVTfBRw==
X-Gm-Gg: ASbGncu0noIW+Q0mxB68eE4K2P8kxQxpinh3zNVVvAuH79uov3wY/mAoMEGHpo3/5dZ
 Z51nupk6OC2ugKiStvSIPwIUAO8qX9tqi0LqRF9PKVRz2Yh2zkBi+ngBnj2Hd0J/cVMs5rPBf5l
 5nivNkWI+x/nXXiYF7Uz/6XD7f5mH1+gCL5ElUPv280plTar/w/kLPx2isATYkiHo3g+N5E27A3
 XVo7rUjUS0wFICK6SveuOKc/fvtSerl1DzsVxrtlgvD5OOQQSozBwD6zEhe9yG3dHvnHiSwVcRP
 GD4KPDy5sUUykugcyHt6QlTgvtxSsxcVy8cyqQN7FYqmZomyfvGAQg==
X-Received: by 2002:a17:90b:5627:b0:31e:ec58:62e2 with SMTP id
 98e67ed59e1d1-32515eaafdcmr40744263a91.19.1756497906038; 
 Fri, 29 Aug 2025 13:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlLHP+tT/LriDsdFC737V2EcYVvDdYR+0Tbu/PHzwEggq5Qw/fGkv9NeBWXVjw8VDQTAu+TQ==
X-Received: by 2002:a17:90b:5627:b0:31e:ec58:62e2 with SMTP id
 98e67ed59e1d1-32515eaafdcmr40744196a91.19.1756497905451; 
 Fri, 29 Aug 2025 13:05:05 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:05:05 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:51 +0530
Subject: [PATCH v13 11/27] migration: push Error **errp into
 qemu_loadvm_section_part_end()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-11-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3094; i=armenon@redhat.com;
 h=from:subject:message-id; bh=CgLPVCj6slw8FkUxePJRDJzlIhYmWPhKwDSIMzJ0/CA=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdl/Wz1qhOT+auW8d+f9ap8nmVEhhjPdL9elLNTIWq
 6xUT9/ZUcrCIMbFICumyNLwNUC2KaAwItL25XWYOaxMIEMYuDgFYCKxfYwMB3VWZS44I7HwT/Id
 jy23q1+evpa53SNFfdGSSl+3JxazLzL8M4097hE54+Zc3/a+Da3nju5385pxLfMur13Z70zdDCM
 FHgA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _lkDA-YjVcBwMPjSSzxmGqufMIXrl203PZDJ36Jqp78_1756497906
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

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that qemu_loadvm_section_part_end() must report an error
in errp, in case of failure.
This patch also removes the setting of errp when errp is NULL in the
out section as it is no longer required in the series.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 01e1a9739aa784d90f80bf2b561fd62f5e4678f8..c8234f2ef7f413b207aebae7192c82f1f4d6d91d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2803,21 +2803,19 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 }
 
 static int
-qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type, Error **errp)
 {
     bool trace_downtime = (type == QEMU_VM_SECTION_END);
     int64_t start_ts, end_ts;
     uint32_t section_id;
     SaveStateEntry *se;
     int ret;
-    Error *local_err = NULL;
 
     section_id = qemu_get_be32(f);
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read section ID: %d",
-                     __func__, ret);
+        error_setg(errp, "Failed to read section ID: %d", ret);
         return ret;
     }
 
@@ -2828,7 +2826,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         }
     }
     if (se == NULL) {
-        error_report("Unknown savevm section %d", section_id);
+        error_setg(errp, "Unknown section %d", section_id);
         return -EINVAL;
     }
 
@@ -2836,9 +2834,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &local_err);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report_err(local_err);
         return ret;
     }
 
@@ -2849,6 +2846,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Section footer error, section_id: %d",
+                   section_id);
         return -EINVAL;
     }
 
@@ -3108,7 +3107,7 @@ retry:
             break;
         case QEMU_VM_SECTION_PART:
         case QEMU_VM_SECTION_END:
-            ret = qemu_loadvm_section_part_end(f, section_type);
+            ret = qemu_loadvm_section_part_end(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }
@@ -3132,9 +3131,6 @@ retry:
 
 out:
     if (ret < 0) {
-        if (*errp == NULL) {
-            error_setg(errp, "Loading VM state failed: %d", ret);
-        }
         qemu_file_set_error(f, ret);
 
         /* Cancel bitmaps incoming regardless of recovery */

-- 
2.51.0


