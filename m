Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03253C79FB7
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 18:17:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcp7X-00019p-N4; Mon, 05 Jan 2026 13:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7P-00015b-6Y
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:51 -0500
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp79-00035r-Gk
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:39 -0500
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-4f1aecac2c9so1864941cf.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767636934; x=1768241734; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ml7un2JYan4JZ2DqFFqoRcBOVZLlzSMUuwc+EQI1f+k=;
 b=BmSIoYKHZ11h9uRRVEEqRFavpEHotqqcEx/RTcCnZCJ5TwDyRnd70u8RHO43ieA6aX
 TatOU0ZmtXVVzLcNgcvX5PgKImwdSZTUdXNW04Un+Ox9ORLP1g6TIEJjKX5AzDHp4m/T
 gISy8ddmR9ijry+84jEc1oIRGKYna2msYWKn+3RX94F/s6uibCy0F2agU6aNgCU6x4QK
 CLf3v1viGAfyfSJKlHmIz2FyeVRN2snE2kmg37vZvrIT8ZeQq73f+AQ0xZWD9zJPmCeD
 fR7J+GWwtXaToDDYXDQ5mjxVZs4eXzMg9Zm/EMeRpuou7jFC3739DYTc2hBtEu0eyllQ
 on4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767636934; x=1768241734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ml7un2JYan4JZ2DqFFqoRcBOVZLlzSMUuwc+EQI1f+k=;
 b=dV7xDOdR8UCpFQcuWJDung2lbIVRknF6HqNgywNMUrm8tcZ1FsTNSoWk1QxyoZZL8o
 kGAtNtH+at+/cPNXub0Qu9JNkNy9p+EXwgeQy5hpwuPj/GSAAAzlv292UXLSgiIPLeie
 cd691VLhitqRTUXRUuR0QhDkZct7fmEDHB0oCM1wXu+5Z+XK+32SH6fai6kKVr3gTMvC
 nJPaf9R4KAZ2VgWmwGEu3NBajytHKrB7aaBEsi4RarbXPeDYvKJoNW9ZJmaGO3WB4R4C
 jkIH8hlHCKYVXDx7u2hTR3p4U+9eGoFPAllii0Y+eYeVR7EJ0ixJOVNPLrRSR6ZCyt8B
 4XtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCovELQUr0u2+Ux/LdaZvB9aZauDkSvJtRXAzYRFZwpWm/W+7h4yJitqLgPsZgMTGUGi1Ob4CKcA==@nongnu.org
X-Gm-Message-State: AOJu0YwiTuhyf4ZCVfzXfQIQ/f7vGEU6lDTtgqDj16dW7v7gjafYHiL1
 owv0BAbXYaLdfPYywxpktQxUDdeSYra6k+4Ow9UlUarL86kv7BsuwdqV
X-Gm-Gg: AY/fxX4mXei6TgbvvP6pbAGNWPbfBK/zoF2W5ieyq52gjYHEinKalhBiX5gWstUJPDi
 c+/7WB3rjGDBSHAlTQJ/d9HBXCXk7r62hPVPYZcGMjnRpLSsKfafrubV5gP2SXUxP/5Esex3Wa5
 J0BbazXCAwaRGRJcjS9s8PZlks4SPNnRogK8Mxurfxzv78vyGOQGb70tc1tO2UFz7gGMuO1fHIe
 MFqnFVWAZG9gpEjZkjDnf/oS/DFaKfkHBtT4iZkXakJpz22ZeYt4PPOP6Z7Cusu1GHHKFXbuRJn
 S8luKvXaHgq3PZ7mAkKfaMzC5IVK3ZEVMI0Kbu7JN8437lLrQ/uYU4Iy4op/7OLz+INWiiuFGe2
 fZKLtnTOHBYbko5gHGTkv8NRuIGlE3MYJBw2JR5Al//adpIPLsGjViouBCGonEuo+yppnzbRupy
 eCGhpTDmmNIxLe+p5IiemwMQ1A
X-Google-Smtp-Source: AGHT+IHr+x/IjT0QIT2CbklXqqMp8ADrlLfoRgJchHV/9VmUJ6XIgdqXs0tTLRVjaAcV9bbl8Nk/iQ==
X-Received: by 2002:ac8:5fc6:0:b0:4f1:b362:eed7 with SMTP id
 d75a77b69052e-4ffa854b3e4mr606101cf.42.1767636934288; 
 Mon, 05 Jan 2026 10:15:34 -0800 (PST)
Received: from [192.168.1.204] ([185.213.193.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907540e24csm3855706d6.25.2026.01.05.10.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 10:15:33 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 05 Jan 2026 11:14:55 -0700
Subject: [PATCH RFC v3 06/12] target/arm: add canonical and no-address tag
 logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-feat-mte4-v3-6-86a0d99ef2e4@gmail.com>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
In-Reply-To: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767636923; l=3168;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=tIJl4Lc02rje7QgPc8RjqQ13vUOzyLWd41MME0JFBQ0=;
 b=/LQio/HGOHXTZjTFlmqyPvTkg0cmfFCRKQ/AzQEYUXMR7AT5ArmXBp3R6dd0eH89Fk5lbqwkO
 KQeuXP7eVHSDM7pg/QlMOIqdZB6MHItzkK0J/kjaApGjCzVFvakhgvy
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x833.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This feature causes tag checks to compare logical address tags against
their canonical form rather than against allocation tags. Described in
the ARM ARM section "Logical Address Tagging".

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/internals.h      | 29 +++++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9cd4bf74ef..31d37b80fb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1633,6 +1633,35 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
     return tcma && match;
 }
 
+/* Return whether or not the second nibble of a VA matches bit 55.  */
+static inline bool tag_is_canonical(int ptr_tag, int bit55)
+{
+    return ((ptr_tag + bit55) & 0xf) == 0;
+}
+
+/* Return true if mtx bits mean that the access is canonically checked.  */
+static inline bool mtx_check(CPUARMState *env, bool bit55)
+{
+    int mmu_idx;
+    uint64_t tcr, mtx_bit;
+
+    /* If mte4 is not implemented, then mtx is by definition not enabled */
+    if (!cpu_isar_feature(aa64_mte4, env_archcpu(env))) {
+        return false;
+    }
+
+    mmu_idx = arm_mmu_idx_el(env, arm_current_el(env));
+    tcr = regime_tcr(env, mmu_idx);
+
+    /*
+     * In two-range regimes, mtx is governed by bit 60 or 61 of TCR, and in
+     * one-range regimes, bit 33 is used.
+     */
+    mtx_bit = regime_has_2_ranges(mmu_idx) ? 60 + bit55 : 33;
+
+    return extract64(tcr, mtx_bit, 1);
+}
+
 /*
  * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
  * for the tag to be present in the FAR_ELx register.  But for user-only
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index f0880991b6..6827d030dd 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -825,6 +825,14 @@ static int mte_probe_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
         return 1;
     }
 
+    /*
+     * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
+     * otherwise it is MemTag_AllocationTagged. See AArch64.CheckTag.
+     */
+    if (mtx_check(env, bit55)) {
+        return tag_is_canonical(ptr_tag, bit55);
+    }
+
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
     sizem1 = FIELD_EX32(desc, MTEDESC, SIZEM1);
@@ -961,6 +969,18 @@ uint64_t HELPER(mte_check_zva)(CPUARMState *env, uint32_t desc, uint64_t ptr)
         goto done;
     }
 
+    /*
+     * If mtx is enabled, then the access is MemTag_CanonicallyTagged,
+     * otherwise it is MemTag_AllocationTagged. See AArch64.CheckTag.
+     */
+    if (mtx_check(env, bit55)) {
+        if (tag_is_canonical(ptr_tag, bit55)) {
+            goto done;
+        }
+        mte_check_fail(env, desc, ptr, ra);
+    }
+
+
     /*
      * In arm_cpu_realizefn, we asserted that dcz > LOG2_TAG_GRANULE+1,
      * i.e. 32 bytes, which is an unreasonably small dcz anyway, to make

-- 
2.52.0


