Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90452C44501
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:47:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVx-0001Ny-9A; Tue, 07 Jul 2026 18:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVv-0001Mk-7k
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:39 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVs-0004Ae-HO
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:38 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2caea3f742bso1659495ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464215; x=1784069015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sdhTsW4I+bhY4ihV01HmgTW3Yi5b9306awX7r7PmOk0=;
 b=ogVc/WI3hgXRsWc5fpP9BT77MSh/ya0CE55/2JVNIrud8VGTEHSksFui6CEjsFqlcr
 aiTVbsJyA1Wg7VzNkCbsKzpPJ6ns5HaYW9hED6cMSeqOwOFfgeu2leTPf7HX2jkACHA9
 8JAmv/hMOMKSYFY0YK0WCFtxn9gjoQbuAAx6kXLPAkdcmfFRqbcL33X7v5lLYOM/zXj0
 0qizbzWgrL2Da80K5HwY0PmdWpHaUyIonYd4S5fDQGtZTjouR+ti52E1pX7doUcnieU2
 lqXFXZbQj/jwN7umsJUk9ndeNIyTiztfhcE4iP5sI1B3A0/Z4Dy1QcIC7UkzXkA1dfIy
 eP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464215; x=1784069015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sdhTsW4I+bhY4ihV01HmgTW3Yi5b9306awX7r7PmOk0=;
 b=dC5BQ0xP9hVJkuc2pmqZ1gNEmc3mbMp2D5WdyiEYMZwKo9oli7tmgY/o2JE8h8bcKS
 WcLg8g95OT6830CNhYeTwBXk3uaqS9B5ShDqiheTkHd+w8aXRER+zpj0ckVxLlYRI+Ab
 14ensFMu4AkSrTF3+S0D+eYt5Ueqmi8XOS8Ysd0rfYMfTwHTvOMuGZ12N10rirtxcgHo
 680RiAP4Wl2CQGZROXyNiLscwvErGIpADJForkzYGQ6D7NyL6/AyW8FwwI/ttykzCvIG
 In7oAI/rlM1gXBLI+j33cZme7ofeRvV1hQvfEw0zeaOQXOEu1UKAkoryOGpTBk2BMxAQ
 7wWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpsqGQz2ZeTiVrBMIZpQiKnAT61YtvHZzwrvSUp8LtPBCcSSpPY/NtEuegJzC2vZfJ5H1OsfYe7vg==@nongnu.org
X-Gm-Message-State: AOJu0YwmWU7BCl/jN8UWHcB5EkUff7Phtc17mAQGpNnwu5iGSKySuv3z
 vr+XOoaCkeRN9n6mW+w3ELGaPddjaj4CVZ38MbZcicR5P3l58FDF6JtwCTYg8ATFFK0=
X-Gm-Gg: AfdE7cl7fyzVaC22tKIi5yQhi3oC9252hCPY4eVSraoKUpB+y3qA9Otq2d4qwQeN071
 xoI2JJ5wQT2wvvNomntbR88S5k2dfyxrgWrD7FPy/J/qK2YWqBNtNR4jPxQJBvLO9wDCHuS/tv1
 IBdQuo0mxQWTlHDKDaIjLw/U0gtH8tq8Mjyx7iq6dMm3x8Yi8ZlyFCq6Yd46M2yEFTRW0HqVo2D
 QQLDd55M0ETbBnpGqaxy31a/kidiuYJL/ycaFuKeC4Sw1s8RiaKuluU7Ylybv8bvKaCtJOCCVNK
 +cwpz6DkFnatBRw84rJSn91O1qDlCPIQg+BhlJWIZWWWZsSQbZKSpTkMEuY03tlC6wMFSInQIYX
 WmtF6QvcKpuwAr98yjn/KtV/bYjvbMCT3fVN6+jECugn+8BP9ps2Mn6UIkHovnwUztmsXo+4sxC
 O2/sJDSiEq7pVC13A5BUaUqdXOYpjz9DzeDowkx42O3tLBqCZUSQ==
X-Received: by 2002:a17:902:ff8e:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2ccbe628ac2mr67463975ad.16.1783464215210; 
 Tue, 07 Jul 2026 15:43:35 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:34 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 12/25] target/arm/kvm-rme: Populate Realm with runtime images
Date: Tue,  7 Jul 2026 16:42:53 -0600
Message-ID: <20260707224306.1202330-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Once the Realm descriptor has been created, tell KVM to transfer runtime
images (kernel, DT, and rootfs) from guest memory to Realm memory.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm-rme.c | 56 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 97ec7c8934c9..58669f4a50f1 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -44,12 +44,68 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
 
 static RmeGuest *rme_guest;
 
+static int rme_populate_range(const RmeRamRegion *region, bool measure,
+                              Error **errp)
+{
+    int ret;
+    void *host_ua;
+    hwaddr size = region->size;
+    hwaddr base = region->base;
+    hwaddr start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    hwaddr end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
+    struct kvm_arm_rmi_populate populate_args;
+
+    host_ua = address_space_map(region->as, base, &size, false,
+                                MEMTXATTRS_UNSPECIFIED);
+
+    populate_args = (struct kvm_arm_rmi_populate) {
+        .base = start,
+        .size = end - start,
+        .source_uaddr = (uintptr_t)host_ua,
+        .flags = measure ? KVM_ARM_RMI_POPULATE_FLAGS_MEASURE : 0,
+    };
+
+    while (populate_args.size > 0) {
+        ret = kvm_vm_ioctl(kvm_state, KVM_ARM_RMI_POPULATE, &populate_args, 0);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                start, end);
+            break;
+        }
+    }
+
+    address_space_unmap(region->as, host_ua, size, false, 0);
+
+    return ret;
+}
+
+static void rme_populate_ram_region(gpointer data, gpointer err)
+{
+    Error **errp = err;
+    const RmeRamRegion *region = data;
+
+    if (*errp) {
+        return;
+    }
+
+    rme_populate_range(region, /* measure */ true, errp);
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
+    Error *errp = NULL;
+
     if (!running) {
         return;
     }
 
+    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, &errp);
+    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
+    if (errp) {
+        return;
+    }
+
     kvm_mark_guest_state_protected();
 }
 
-- 
2.43.0


