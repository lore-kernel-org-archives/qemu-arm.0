Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF225CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:05:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNe0-0002g4-QY; Sat, 30 Aug 2025 11:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Jp-0004y9-K3
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1us5Jm-0004b1-QR
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 16:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756497806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFESQmOnhzZW2+hXaXl8rxhwnVtiVIyzJTwYSrM4JVM=;
 b=U1IWEeVkMpgdjMAlVUKja4pxudEHg6Xsonzy0rU0P/QUgkvOGevKBBStySfkx8rfbNPgwo
 L67N9MnaLn9NPpPSa9YB3p2Q05L8h20aFNlRktxZHZQO8lU4kc9RXIAtS2PQBXcOyiuqtk
 7AyCHRalinhWi1GCYbll2pfRTqR04j0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-JWn9qlzuM1q9C692d4uZpQ-1; Fri, 29 Aug 2025 16:03:23 -0400
X-MC-Unique: JWn9qlzuM1q9C692d4uZpQ-1
X-Mimecast-MFC-AGG-ID: JWn9qlzuM1q9C692d4uZpQ_1756497803
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32769224506so2474375a91.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756497802; x=1757102602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFESQmOnhzZW2+hXaXl8rxhwnVtiVIyzJTwYSrM4JVM=;
 b=pcinIJhlYnVkRhRbFtid+lr0/gUlIy0W89Jw3jds/Lat/uV3cq+59j+gQuECKnc1N6
 IlLaNCnd4hTI03WPNGOeWO0tDgrlFpOBvsMJDwiq7vAiSQbZOL8c3gyCWVooczw3HHSW
 AjDJVbirl9YcFfgPhvqeDJT0kWtcjpejAzcAilQXYWImhkH6xBNZaETe18hSXLeBSNTm
 ajkBAGUvUhT74PEIpnnhSc50rLw3mvwW+3sInRKX6QJsrkBdsCgQLMcl5x545oxOTypv
 1Y20YyaoFOz2hdZur9t9zikFa+viC2H68K6xQMHm+0LxfA1sJhBoRN/FlRnBu8rC6ZfX
 AnJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+9Lpv91hC/b5aMawOw9JOSRxOSrcgOu1S8qu9JVwGdemUrvZb60LUy63bXS0Tpk5pPPeisxY+zg==@nongnu.org
X-Gm-Message-State: AOJu0YynxALw5gtuZM2+aI2GivKESRS+wKbs7OPpx0fMYNjlRzC4PN0/
 stRmMTKELkpfRbeKxNEOeDYvDGSVd0/r7qtmdkF1eXERQEpTmagyzm6I71C4NV31Z3bLyWEKedl
 GdamrRZ2iGjNw0w/RfuU8wK2LIiZ6PxGxQxkKhqMjQ/ha5btp0cMOqg==
X-Gm-Gg: ASbGncvVwWXzSFUqOd0QuGBJ6w6ATzM8qIwZoftOIHI93joKwZ1wf6VhoMWWE2Zd7GX
 9dsMqnvZmFh1zn4wyMG0wYcpEh8PJhV7J8zrYVhc+0gso/UVcG/+LGNkU1QELLYpOV1fEROK6Lx
 aOZBqrrLatdcJ2IpBmgQHGlSpj3LS4XIRBKnzLf+AhPmxEANhqOa3t6jLaymLQeRDJHDfFW0uF7
 Fey9405vibF1xLw5Uo67oopEmGS3hJoLhm5z0XVfThxlXOVTTyfTNpwnSSMBDV/c/2caXDwSoUY
 +scALcH62RSVcqarEyWRcN75dtBdKlD59HuUaK3a8bQ5hc4VpfgrdA==
X-Received: by 2002:a17:90b:5623:b0:327:531b:b85c with SMTP id
 98e67ed59e1d1-327531bbae0mr20325775a91.35.1756497802081; 
 Fri, 29 Aug 2025 13:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8A8uS0uqOelXhs9DBp6fb5ZkfvkmxeLH2gvetngK75nnlCPkyySJrntUu8N1qe1W2sPzaNQ==
X-Received: by 2002:a17:90b:5623:b0:327:531b:b85c with SMTP id
 98e67ed59e1d1-327531bbae0mr20325744a91.35.1756497801696; 
 Fri, 29 Aug 2025 13:03:21 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.195.108])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327d8f66f16sm3570543a91.0.2025.08.29.13.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:03:21 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Sat, 30 Aug 2025 01:31:44 +0530
Subject: [PATCH v13 04/27] migration: push Error **errp into vmstate_load()
MIME-Version: 1.0
Message-Id: <20250830-propagate_tpm_error-v13-4-a4e777b7eb2c@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264; i=armenon@redhat.com;
 h=from:subject:message-id; bh=XNWOL0PRpe00C/2zRFfhJytxVRezN65+i4XThQwPhbg=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8Ymdp8J1vnT36vJ8F/ZU2R5qqSq2uNau8f1GUvTFdVSr
 ntwFBR0lLIwiHExyIopsjR8DZBtCiiMiLR9eR1mDisTyBAGLk4BmMh9M4b/sVea6pJ+LmpLftjj
 pBQ5KdatfYePs4y4Xyz/Ol+fS9a+DP8LWoufT+STe/mxrUucc0pQXdW2ou6v/8WTRb6WhUfYS7I
 CAA==
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IGo96ovWZJGMBjITVsOnqDU_dvPuriNwz88of7G8ivg_1756497803
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
It is ensured that vmstate_load() must report an error
in errp, in case of failure.

The errors are temporarily reported using error_report_err().
This is removed in the subsequent patches in this series
when we are actually able to propagate the error to the calling
function.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0c445a957fc99f826e6753ed3795bcdd51f1e3f5..40dae406db22dc9ddbff2f5ada92a32626b58e3b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -963,14 +963,20 @@ void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
     }
 }
 
-static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
+static int vmstate_load(QEMUFile *f, SaveStateEntry *se, Error **errp)
 {
+    int ret;
     trace_vmstate_load(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
     if (!se->vmsd) {         /* Old style */
-        return se->ops->load_state(f, se->opaque, se->load_version_id);
+        ret = se->ops->load_state(f, se->opaque, se->load_version_id);
+        if (ret < 0) {
+            error_setg(errp, "Failed to load vmstate version_id: %d, ret: %d",
+                       se->load_version_id, ret);
+        }
+        return ret;
     }
     return vmstate_load_state(f, se->vmsd, se->opaque, se->load_version_id,
-                              &error_fatal);
+                              errp);
 }
 
 static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
@@ -2692,6 +2698,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
     SaveStateEntry *se;
     char idstr[256];
     int ret;
+    Error *local_err = NULL;
 
     /* Read section start */
     section_id = qemu_get_be32(f);
@@ -2741,10 +2748,11 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se);
+    ret = vmstate_load(f, se, &local_err);
     if (ret < 0) {
         error_report("error while loading state for instance 0x%"PRIx32" of"
                      " device '%s'", instance_id, idstr);
+        error_report_err(local_err);
         return ret;
     }
 
@@ -2769,6 +2777,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     uint32_t section_id;
     SaveStateEntry *se;
     int ret;
+    Error *local_err = NULL;
 
     section_id = qemu_get_be32(f);
 
@@ -2794,10 +2803,9 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se);
+    ret = vmstate_load(f, se, &local_err);
     if (ret < 0) {
-        error_report("error while loading state section id %d(%s)",
-                     section_id, se->idstr);
+        error_report_err(local_err);
         return ret;
     }
 

-- 
2.51.0


