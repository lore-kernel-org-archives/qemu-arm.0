Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3675CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 04:24:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Rqc-0003kw-HK; Tue, 30 Sep 2025 00:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3RqF-0003Gy-5P
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1v3Rq4-0002Lq-DR
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 00:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759205981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BHqQEys25VDInV4tMhybM5zLRTf2PUynoguPJtWYxY=;
 b=bW2F25KlY+3pflbHa2CfP+GUUEMThN0MlBAHCAOYVZyNwQUTe58wAzlGJW6gBf/1VHR84F
 GDLWW0sQ1UJZCvxCIOdpjPjnSC/iKC76m0y4dug+h6zjO0EatFq1QmEA1o5VCPFFreziAM
 jm26mpLeO675kDVO/br9OOjwIJIpseg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-rZKAZSJ8O--O7plzqZH2qg-1; Tue, 30 Sep 2025 00:19:35 -0400
X-MC-Unique: rZKAZSJ8O--O7plzqZH2qg-1
X-Mimecast-MFC-AGG-ID: rZKAZSJ8O--O7plzqZH2qg_1759205974
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-33826e101ecso1779217a91.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 21:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759205974; x=1759810774;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/BHqQEys25VDInV4tMhybM5zLRTf2PUynoguPJtWYxY=;
 b=b5LN9++lsUniYgMLNIyOgeCQ3Kcw/+E/O8rpn0Sijmr9VcBJyjuZwgUuMoGtRzD0Bi
 T6fFB/KkaWL8WIlZIMbScNCQfoNjSTRBcFqjymyrkQvrBriVacYWpqBzXMu5/nYbDjLh
 iMEht4liqmiW+xlXlfBHrKSdwtW9hJTsAZ5MGU6qgkgiOdIDsaaDk80Yvw5NYaWbhd9K
 NBJuQ/QOiPP3c/BrZuuWPecVbe7grJUxRFpNVM8iIVkAUHT7wdy6xvxZZmf7IdX9C1Eu
 IhVXocSNHmiPx4wfIoZaKYOgjBDHg5nCs4Q5SYEELi2n4NiOyIu8YfWhxEAEW572bzOD
 8+zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjdW+8AuQBRyRDxu7AO9ZwzfVCncaffdbhBFa1Gwwk9nrNp9TKf9xUnJQMEIyH/B9RAY7Ec4eVag==@nongnu.org
X-Gm-Message-State: AOJu0YzFj2snfHSvzbTf1CJ1hv+I2oPD4Bhf3nFroqprvxuwpmCx+Etm
 t6c3UQ6vMEwbHFEMfIcYmcL4kAeNcj1IbGQsWNG2J1cxKgPlgD49n6tvqDEad2JrQ6xLRYMPrDv
 6tePwSBCx39nTUVJjqR1i/hKQ3klP6AmeiHsrHxLe/dNFdLyeijL1jw==
X-Gm-Gg: ASbGncv2GUFvQO1SnUSD8Br32yTOxICwxVq2+BBp2vSmWHipN8+SktzzgneeuPIHAdT
 YXwEDgnvt60XBRqyC1CxCZ3xuRtvWT+1fAHa3Ej++D60mlOhYZG/10ybvaRGZZBJdwivb3I9NCD
 n7Q1NDyYmLoltwoOwf3Zp6pHFR1iDApoR9okVaG03/dN/IlmXQOfhHEYt201696nD1gwA7E0oeP
 xeuxgPXXRfOwvv9Djhpx/7E9d81wurXHHNvMf93AMXBKDYSP1EMdec7oEhilDu/jQIQr1CfqGK5
 xqVzYa6KSKmP88fSDlQ2FZWLV3WNO7SoOAfigaqiHS4+52LaDSitxqc44A==
X-Received: by 2002:a17:90b:1c91:b0:32e:7ff6:6dbd with SMTP id
 98e67ed59e1d1-3383ab1c984mr3496589a91.0.1759205974229; 
 Mon, 29 Sep 2025 21:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXzWjh8kDSfRbxRfoZ8if5oeGKLB+2WXfzJD5pmOX4dsz9fTSVxA8skyWa/XTLmNA1bKeJzQ==
X-Received: by 2002:a17:90b:1c91:b0:32e:7ff6:6dbd with SMTP id
 98e67ed59e1d1-3383ab1c984mr3496535a91.0.1759205973793; 
 Mon, 29 Sep 2025 21:19:33 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.36.108.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c55a339dsm12534158a12.40.2025.09.29.21.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 21:19:33 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Tue, 30 Sep 2025 09:48:15 +0530
Subject: [PATCH v15 06/26] migration: push Error **errp into
 loadvm_handle_cmd_packaged()
MIME-Version: 1.0
Message-Id: <20250930-propagate_tpm_error-v15-6-84afd3af1e47@redhat.com>
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
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872; i=armenon@redhat.com;
 h=from:subject:message-id; bh=InVVNoEy2g1zpO8kJPGk7ZyyaFhdbz8TWnnxAHWCl+M=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8btKAGOyNi4jK7AWxO0189LbD131vnj1J0iO56taX+2L
 XzGprXNHaUsDGJcDLJiiiwNXwNkmwIKIyJtX16HmcPKBDKEgYtTACaiwMbIsEYrqF2L6fKz33PD
 WBMbQnOKLlx6aLXI6EbVE5VTZ6U5xBgZ7hxkyNUs55pmfvnxZHv3khnsic8fMjRwZDK1ZX56O2E
 pNwA=
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wJ1GAktGMz_bhvWl9kDvM8LL0C7WlpmJ2Gz78HaggeM_1759205974
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
It is ensured that loadvm_handle_cmd_packaged() must report an error
in errp, in case of failure.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index d1ed2e1cde54913d7fcc4b6808d08cd5b3a17745..5e54651652e9562939e61cf488c809a369824edb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2405,7 +2405,7 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
  * Returns: Negative values on error
  *
  */
-static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
+static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis, Error **errp)
 {
     int ret;
     size_t length;
@@ -2415,7 +2415,7 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
     trace_loadvm_handle_cmd_packaged(length);
 
     if (length > MAX_VM_CMD_PACKAGED_SIZE) {
-        error_report("Unreasonably large packaged state: %zu", length);
+        error_setg(errp, "Unreasonably large packaged state: %zu", length);
         return -1;
     }
 
@@ -2426,8 +2426,8 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
                           length);
     if (ret != length) {
         object_unref(OBJECT(bioc));
-        error_report("CMD_PACKAGED: Buffer receive fail ret=%d length=%zu",
-                     ret, length);
+        error_setg(errp, "CMD_PACKAGED: Buffer receive fail ret=%d length=%zu",
+                   ret, length);
         return (ret < 0) ? ret : -EAGAIN;
     }
     bioc->usage += length;
@@ -2457,6 +2457,9 @@ static int loadvm_handle_cmd_packaged(MigrationIncomingState *mis)
     } while (1);
 
     ret = qemu_loadvm_state_main(packf, mis);
+    if (ret < 0) {
+        error_setg(errp, "VM state load failed: %d", ret);
+    }
     trace_loadvm_handle_cmd_packaged_main(ret);
     qemu_fclose(packf);
     object_unref(OBJECT(bioc));
@@ -2620,11 +2623,7 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
         break;
 
     case MIG_CMD_PACKAGED:
-        ret = loadvm_handle_cmd_packaged(mis);
-        if (ret < 0) {
-            error_setg(errp, "Failed to load device state command: %d", ret);
-        }
-        return ret;
+        return loadvm_handle_cmd_packaged(mis, errp);
 
     case MIG_CMD_POSTCOPY_ADVISE:
         ret = loadvm_postcopy_handle_advise(mis, len);

-- 
2.51.0


