Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C91606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsZAewhx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA5S-0005el-2n; Wed, 28 Oct 2026 16:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA5N-0005Zz-Fn
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:17:25 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA5L-0002Mk-BY
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:17:25 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-35b2c599f43so2975145eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218642; x=1793823442; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qeJic+QEw42e1R7DnD3Kz3eNjwxP8HN6flh/y3Ftq3M=;
 b=hsZAewhxJs9pRBCpOVtHdP7DjVbPuwRsc7TCdkOKS/bXEOQYVMJbVNrGmXfWsbnmAX
 BysNciOFt5iCU/Ijq3WF0phN0u7XiCDnXeckrmwmfDNKD/mIPecpqcvtHiqt2J3FMkWw
 kF/Ml+YU/8UMLH9Zy0+jiqUkDVaSerN4CAFzE/ZRHQjgVAHmyGdyyDM4/zZevpeCiJso
 wk2UxSTIURmvbDSEkL8tmSwwHmrYUeqG433YVFa0JRO+aQw1h15EElww80J/xour8QIp
 OIfvT7f6LJyErKtoaxL3UfGAQREOuUtQKPx1q9zd+h/d5awOhwfZwBUzwSvhGI0K2Mrx
 7j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218642; x=1793823442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qeJic+QEw42e1R7DnD3Kz3eNjwxP8HN6flh/y3Ftq3M=;
 b=wD3jrqQWXWml0hbKAxFKm/A/Aoh4cE6kIbjUgRaMcQu3mUHA/djM+zYcJGmekq/4eB
 R4YN1quKh4sUbmk1+SELFjAS/7dqoeT60qMtj/HuWAngE2e7OWHCYozkc/TCG/kHeKVm
 j0MAZHP3BnrVQ/AGd0iWlYI5z4POHgxztRqcghOsQ3y81MWLLbLnoB2yh8VUeC4YenAm
 7JOPYeLoDtrOMjysZEdf0KDnb2x8J/iwtsIdfbtpIwwCbMQnsjkV9ypZbBt6GMtn9etR
 0hc8eNiDm0tSQlC5ghOlJVfguVeHdqUE9ZKH7CwoC8SdrMA6+mCQ1OLcCFuudi/TSxCu
 2Y6Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBygpG2grmngx1RHbMT23SAK1llTJdmuvTtwkrmj45UrCPhvlCRlDe/S7t+w1GELw3hwyjpI7Ao/Vg==@nongnu.org
X-Gm-Message-State: AFq9FYJAj665cygm63S/rU4fdpjV2Blk17kZ5DQx16oNjhvD6XrY7hOX
 BLUpXKc4xpiEp92F+V+ZAtZLQPCRnGc5T8mcmOFr1JDLjsx0hsE5YjtH
X-Gm-Gg: AYBFou0QBC/ntTwrK8JZZlDIBfbH2IN74wdJQdaDKa25WT7l6+HRkCI0ibpM4aPoEKo
 Sty0InoiAI+Fxh5da9Sc2qdYKhrLzpScvmv4RQRl5lHQCFP6v+NrCBMMY4Vz1quG5kRhFfCgCgc
 5Q8ZtmsdV4ULWapzz0I4ZCbp+TGOXBPs+qpMh1eQtP6+uiaAahuAp9I4eRwdlMw9Mu0P0ju6nzc
 pZtXDPbgY1c8JbVdYywUDVaw16pVpJIRLkfj+ez1BfwJgdbtusKo4DDkgorlDnO+oYZJPBkvYPR
 y9wKaV2u0bHlwMEruuj6A196Qk6MoTtpquyAR1YjV6/jJX3UvEobKokWnad49cyRXNQoXClklh0
 cyaPRJvsUGj7Ax7buH9eGodOBsbAKAa3dATymFHiYZH5E51GbDVqVwtfBupsbFT2eDxU2m/1TP9
 hr9tmEOIFWDhoG7mmMUIg0qT19CsuNN30aq0KeNAQkgmK563RXt2pjWDS5J68IPh2oTMGbMShnT
 Wx4gHN2kHtA96B/N/LmDCnnwLehKv0h2H0QSXHGs+oLqBjITHJ8MpMavpUDq8MuFNQlzSVVJj4A
 NwW/hsv/U+YB6V0tkfTawTyYWNmK4dN9ZBHdDLCgPWZIy1SH
X-Received: by 2002:a05:693c:61cb:b0:369:f277:7f09 with SMTP id
 5a478bee46e88-36a2046b1dcmr5271033eec.25.1793218641889; 
 Wed, 28 Oct 2026 13:17:21 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:17:21 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 12/12] hw/microblaze: defer PetaLogix endianness default until
 init
Date: Thu, 29 Oct 2026 04:15:56 +0800
Message-ID: <20261028201557.2688-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PetaLogix machine read its endianness default from
target_big_endian() in class_init. In a multi-target binary the target
is not selected yet at class_init, so the default cannot be computed
there. Set the property default to "unspecified" instead, and resolve
it to big or little in petalogix_s3adsp1800_init(), where the target is
known.

Until the machine is initialized, endianness reads back as
"unspecified" rather than big or little.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index c5f64319009..4abb6e0f0bf 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -83,7 +83,13 @@ petalogix_s3adsp1800_init(MachineState *machine)
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
     MemoryRegion *sysmem = get_system_memory();
-    EndianMode endianness = psms->endianness;
+    EndianMode endianness;
+
+    if (psms->endianness == ENDIAN_MODE_UNSPECIFIED) {
+        psms->endianness = target_big_endian() ? ENDIAN_MODE_BIG :
+                                                 ENDIAN_MODE_LITTLE;
+    }
+    endianness = psms->endianness;
 
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
     object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
@@ -178,8 +184,7 @@ static void petalogix_s3adsp1800_machine_class_init(ObjectClass *oc,
                                           &EndianMode_lookup,
                                           machine_get_endianness,
                                           machine_set_endianness);
-    object_property_set_default_str(prop, target_big_endian() ? "big"
-                                                              : "little");
+    object_property_set_default_str(prop, "unspecified");
     object_class_property_set_description(oc, "endianness",
             "Defines whether the machine runs in big or little endian mode");
 }
-- 
2.55.0.windows.3


