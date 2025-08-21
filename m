Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A64ECA0EEB
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 08:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up0y0-000770-IV; Thu, 21 Aug 2025 04:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wZ-0003zE-II
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armenon@redhat.com>)
 id 1up0wT-0001EF-CU
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 04:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755765998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkIBrmqU3UmVPpuTfGUkQi3Qo/t7acfxhstmxrihGOE=;
 b=WotecWwW74j04MPwShPGavUbxHXV3kVEYfa6Mjdow6tXRQa6+FSJrwnGPRnZ6JcAwPZfwF
 pNhsz9W4VV1YYKa1sr593nEOMBZWZuUGRYdsnM6aKguxlvn9pGnT1sAyGHuzSAHbOVQkSk
 5CDpIgBFpnO3XANzu+BIWjdSctllxG4=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-nibMu9PHNCKJpjnEmATkUw-1; Thu, 21 Aug 2025 04:46:37 -0400
X-MC-Unique: nibMu9PHNCKJpjnEmATkUw-1
X-Mimecast-MFC-AGG-ID: nibMu9PHNCKJpjnEmATkUw_1755765996
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-246088fc25cso5463765ad.1
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 01:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755765996; x=1756370796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkIBrmqU3UmVPpuTfGUkQi3Qo/t7acfxhstmxrihGOE=;
 b=DwIFakJJwGs7OEucnsZtjZm0b1f8xMgD6ACOVh5lY8vIaoG0pX1MjdHCaTDqVw1gYI
 GQN3/2qoZdUytP1QWShK2vc27A8TXRhdE4IZTMrbBrXhtBtM91cEQ6Gmx0dqr5cfiZ6Z
 l48nnfmEcu4Ou+ntMjKc2ASHYyDnLMaHrubQgxnwFeThUVh1ptAcl69jYGObDyxP+UNl
 UbGFNNHYWZp6Q4Kw9MTurUPVDxPPS/P4SIaER/6UsRRwv6MNfQE79qGIdy6lcwcnIV4N
 qM6t1nZ3xhSQDhZV4gDuxP+kfg5rcaQDFrM03CrB/nsXHtdfucinDXqXGrMDe0Lg98RJ
 Feew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo95Njput7wLaHi5F/qhavZRKZjbsgCQT4lYKZNYw1KnVw4Ud+3MRK2rx48BWk1exZoepxmwv+vg==@nongnu.org
X-Gm-Message-State: AOJu0Yy2Mu39KgdsMbURT4X+12JstKFEHONZEwlHMs+mp7kZuVhgJOR1
 l22kRFGQNX12bjfOogxjHeBigfIOaeS1SrPkKKv2LTGNuDPoSl36pCslYNhSd2rC7DQc5nqoCdd
 Haqi7p2Yz75lU6PJ/EtI9UTthyHrsQzDaldo+kJLq5XgMgCNsE7c+5Q==
X-Gm-Gg: ASbGnctBLP7BakaXo0YPMMBsSvdSy2rfQ87JmLolH6sJLUCM9VDEizpW9o8HH/wnPRO
 Juy4GF9+jjBPqY4uowItjFqky/+DlFlZ6UzlIX0D5pomhMl+cbrsPgZxOQnJ7hMuvzQCT4Xp0ZU
 +S0UnsYcvnzzxRJ8omkBNsnqwxWPzH4n+nPE41P0vw3Numznw1NPvm7aZNFbNIz38ouICd6ADyg
 k6ugDuu1VQeXBHwDHWE+os3SbbXXOVCS4+3caUbDBsGgrtNZOByLdWedPwSfccOTm2SM3tiUaZ5
 cp8NO6D4AuEQTM3350FyPwYEnKIRVDXxd4UzDYuTVzM9M1QxN95f
X-Received: by 2002:a17:902:e783:b0:246:2e9:dac2 with SMTP id
 d9443c01a7336-24602e9dd52mr21310765ad.1.1755765995684; 
 Thu, 21 Aug 2025 01:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg3tbka06dAd9/eOpFctNaRhInu/oFrGI2JTSXsiQMRwBfOi4gOVGcVXWlNbCnXQM4x6jbcA==
X-Received: by 2002:a17:902:e783:b0:246:2e9:dac2 with SMTP id
 d9443c01a7336-24602e9dd52mr21310285ad.1.1755765995056; 
 Thu, 21 Aug 2025 01:46:35 -0700 (PDT)
Received: from armenon-kvm.bengluru.csb ([49.47.192.65])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed33e05dsm48789985ad.3.2025.08.21.01.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 01:46:34 -0700 (PDT)
From: Arun Menon <armenon@redhat.com>
Date: Thu, 21 Aug 2025 14:14:05 +0530
Subject: [PATCH v12 11/27] migration: push Error **errp into
 qemu_loadvm_section_part_end()
MIME-Version: 1.0
Message-Id: <20250821-propagate_tpm_error-v12-11-72b803e707dc@redhat.com>
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
 Arun Menon <armenon@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319; i=armenon@redhat.com;
 h=from:subject:message-id; bh=EwE1vk6Jgm3Xnj0Q1uNXL1tpRUqGyiHG8RIWqMlxQcM=;
 b=owGbwMvMwCWWVaVqcZPfqI/xtFoSQ8ayO8nvjLY3PhYqP/Rx6fSeUwZuhxfMtrA98H77oe05+
 vtZ70xJ7yhlYRDjYpAVU2Rp+Bog2xRQGBFp+/I6zBxWJpAhDFycAjARjnJGhukTz65jyrrw2D7n
 8PQ0oSSB5d8i4w55uXTd/s0VLLLhiikjw9NqT96WTNlz8qcC7k/ZwbvuQdpiUS6GL7WByW3N8Wt
 XsgIA
X-Developer-Key: i=armenon@redhat.com; a=openpgp;
 fpr=80F5501D82507158593DE9D76A7A2538D90F328E
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rp4T7a7Mwo4JxXJ4pIhtQ2lCZL7g_6CH4FdifKKzmd4_1755765996
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

This is an incremental step in converting vmstate loading
code to report error via Error objects instead of directly
printing it to console/monitor.
It is ensured that qemu_loadvm_section_part_end() must report an error
in errp, in case of failure.
This patch also removes the setting of errp when errp is NULL in the
out section as it is no longer required in the series.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Arun Menon <armenon@redhat.com>
---
 migration/savevm.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index b55adb7468e5356ecb636734241f1a356a42a284..8e0ee14cc86dfffee86e46e32c7500d23924dc8e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2803,21 +2803,20 @@ qemu_loadvm_section_start_full(QEMUFile *f, uint8_t type, Error **errp)
 }
 
 static int
-qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
+qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type, Error **errp)
 {
+    ERRP_GUARD();
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
 
@@ -2828,7 +2827,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         }
     }
     if (se == NULL) {
-        error_report("Unknown savevm section %d", section_id);
+        error_setg(errp, "Unknown section %d", section_id);
         return -EINVAL;
     }
 
@@ -2836,11 +2835,10 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
         start_ts = qemu_clock_get_us(QEMU_CLOCK_REALTIME);
     }
 
-    ret = vmstate_load(f, se, &local_err);
+    ret = vmstate_load(f, se, errp);
     if (ret < 0) {
-        error_report("error while loading state section id %d(%s)",
-                     section_id, se->idstr);
-        warn_report_err(local_err);
+        error_prepend(errp, "error while loading state section id %d(%s): ",
+                      section_id, se->idstr);
         return ret;
     }
 
@@ -2851,6 +2849,8 @@ qemu_loadvm_section_part_end(QEMUFile *f, uint8_t type)
     }
 
     if (!check_section_footer(f, se)) {
+        error_setg(errp, "Section footer error, section_id: %d",
+                   section_id);
         return -EINVAL;
     }
 
@@ -3110,7 +3110,7 @@ retry:
             break;
         case QEMU_VM_SECTION_PART:
         case QEMU_VM_SECTION_END:
-            ret = qemu_loadvm_section_part_end(f, section_type);
+            ret = qemu_loadvm_section_part_end(f, section_type, errp);
             if (ret < 0) {
                 goto out;
             }
@@ -3134,9 +3134,6 @@ retry:
 
 out:
     if (ret < 0) {
-        if (*errp == NULL) {
-            error_setg(errp, "Loading VM state failed: %d", ret);
-        }
         qemu_file_set_error(f, ret);
 
         /* Cancel bitmaps incoming regardless of recovery */

-- 
2.50.1


