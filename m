Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133129eje;
        Fri, 14 Jul 2023 08:48:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXPUm6Kl/BsSsncN+SLo87ThTrXeX43hb91c9E3KOVDcJF7+SHrI8kIt1XHJx7qOA/vqQF
X-Received: by 2002:a05:620a:408e:b0:766:77bb:8989 with SMTP id f14-20020a05620a408e00b0076677bb8989mr3974563qko.0.1689349692563;
        Fri, 14 Jul 2023 08:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349692; cv=none;
        d=google.com; s=arc-20160816;
        b=jW+G65nM8R1zM0u78+X6Q+hdvLy0n+hvBUThgiyaJV3+0iE8yFtOvW63Y15+nPH6Bz
         njRmGjOYjjvSi2PHOmJPvQdooYehUWe260Wq27wriOdbr+6g4ngTISXIBMUvp5EnNMd0
         4FgmAm6fCUqcdYOJqrwERluPl9brd7XlNt4fAhDnvPedSgw5swQ+gLodLDGDtbdogFNT
         McmFk84ctszLpxx4ygZValDZgvvnTytzYPlpzJgnsbRHN9FYq5kj6ad1utDkNQo+hOTB
         1nWLBSKp+384l7N5fr87fKtUVChjelC3MmxUlEIQuXFDOhUGdyaR8Lq94M11lMcvkVM2
         5pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zHxdCpbn/xikj26GCA5/nQ2FBBTjRyE6yEPZb7eG12g=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=cj+ow0pr7u+xGI/EtXWI+4dsYixt8YloJgY3ZAdwPG1s/oAb05PrvY/XKP2f6UICwn
         OmH4MiF9idG9mRHvH/CcMBEMguKPLg30aqf/Ev4y1tgU4bjnXv770hsGrJnBlgjtzukn
         MCn1UAj6nr84azHEsaIlv6aHxNTlYm3Xi7O/3pWdQ8+wMtkdxMDKdhBxhJGr8lUhDiQG
         hT/467Jk7zQRoBhlC2nYGaDwkhUB8V6ieaRX7mcmH3POt/7bu1dm+e1Xar/Bw/RmzHCr
         SR+rS/X0rnlonSMGxcGraYuDeEQDUYjQXihU4hH7SMVY0UKv/Jgwsn/UO1Sw9RmEL3s+
         IRIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ipnxl87x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05620a430900b00767471599e3si4665240qko.253.2023.07.14.08.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ipnxl87x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0s-0007VN-30; Fri, 14 Jul 2023 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0n-0007Om-Of
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0U-00077G-6U
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so19554015e9.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349617; x=1691941617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zHxdCpbn/xikj26GCA5/nQ2FBBTjRyE6yEPZb7eG12g=;
 b=ipnxl87x549TRe9EtTjHYF2xm42ZgXqEq8ek6wx3n03IvK4SsqMDWJcCZVY9G/RhFJ
 s+IM6A9RxATPwiqoizS7n3rI/DnecPCrHmG8k+Tvr99LDaz+EsdvGq74JOUC9GVuO/UE
 P7xNMTECYBcGkkloTIDoMdMdlRZY6jDaDhFOKcEYtB6hknL7afVx35qlJ1HNfXxJlasE
 iNw0M+ZGxa/sO8vrSJDa4RlWAljKyD8sqFQ8W/9BrYQ1sBOc/gO+m90vYYL7bZPVstW+
 LsRUYqtUIB33b8HVMeiBTtGIeYIegRo2tw7Uf5xUz173l6EDEg35JNG/rUeO8i+u889l
 PcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349617; x=1691941617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHxdCpbn/xikj26GCA5/nQ2FBBTjRyE6yEPZb7eG12g=;
 b=FihsrhiB950LTxcBm+WyFWUjUg67sfsxLFUJU2CcCI/SIo7twFpFwoN7Y26IZAnZij
 5L8vo98R69hOFG3DtvcM3YSINgcPKz9XpFS1d6osuhXkpQqNWf4x7SRwPZ5rKYWGFnMI
 RK5i0gSb1WDcB072945ibE0rc/liLmZLdW6SmwgcyMk3t5D3QYpNu+JwU4rYiVQSb+bs
 5j/andGfLnEEFzMqq5whcsFJznawj6I5vxmM9fy3HC1AyYq5rzDfbhE9ueio+QoLRE8e
 bpteOvUIuCVgBWpMJ21zvmZoV8suP5RLhKqQfqd8OZV8P+3Ukn96LujylqHhBDsRwDe9
 +qnA==
X-Gm-Message-State: ABy/qLbCgCl+MQ55ggXLHGB7GrXUfWXzhOIxIrwkL+lpatcYREs8lCJS
 OQbnce2YBnJLUCoFYy+Gx6bdw7aPFvCfCnqJzL8=
X-Received: by 2002:adf:d088:0:b0:313:ee2e:dae5 with SMTP id
 y8-20020adfd088000000b00313ee2edae5mr4133319wrh.21.1689349616826; 
 Fri, 14 Jul 2023 08:46:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/14] target/arm/ptw: Check for block descriptors at invalid
 levels
Date: Fri, 14 Jul 2023 16:46:46 +0100
Message-Id: <20230714154648.327466-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y2IEsYui0sgv

The architecture doesn't permit block descriptors at any arbitrary
level of the page table walk; it depends on the granule size which
levels are permitted.  We implemented only a partial version of this
check which assumes that block descriptors are valid at all levels
except level 3, which meant that we wouldn't deliver the Translation
fault for all cases of this sort of guest page table error.

Implement the logic corresponding to the pseudocode
AArch64.DecodeDescriptorType() and AArch64.BlockDescSupported().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e4210abc148..ed46bb82a75 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1549,6 +1549,25 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
     return INT_MIN;
 }
 
+static bool lpae_block_desc_valid(ARMCPU *cpu, bool ds,
+                                  ARMGranuleSize gran, int level)
+{
+    /*
+     * See pseudocode AArch46.BlockDescSupported(): block descriptors
+     * are not valid at all levels, depending on the page size.
+     */
+    switch (gran) {
+    case Gran4K:
+        return (level == 0 && ds) || level == 1 || level == 2;
+    case Gran16K:
+        return (level == 1 && ds) || level == 2;
+    case Gran64K:
+        return (level == 1 && arm_pamax(cpu) == 52) || level == 2;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
@@ -1784,8 +1803,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     new_descriptor = descriptor;
 
  restart_atomic_update:
-    if (!(descriptor & 1) || (!(descriptor & 2) && (level == 3))) {
-        /* Invalid, or the Reserved level 3 encoding */
+    if (!(descriptor & 1) ||
+        (!(descriptor & 2) &&
+         !lpae_block_desc_valid(cpu, param.ds, param.gran, level))) {
+        /* Invalid, or a block descriptor at an invalid level */
         goto do_translation_fault;
     }
 
-- 
2.34.1

