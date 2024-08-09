Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp933429njc;
        Fri, 9 Aug 2024 09:06:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkGOdB2jFU+eC2FVCXbdN0NVF+YsHK9F9+7mrR11Q3m0cPzVybusiBodWeBGwnPmxrmbM5Bxy+prvtGbiy1ZArYGl3O5Yp
X-Google-Smtp-Source: AGHT+IF/7S3+KgqgkELKMqBWpnCDtYBFvon4kMzEvSoAVNmMMC0Zl8GJ7FurTWFsvkU8c/9S0hPl
X-Received: by 2002:a05:6808:178d:b0:3d9:32db:e2fa with SMTP id 5614622812f47-3dc416dc8famr1802334b6e.36.1723219566829;
        Fri, 09 Aug 2024 09:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723219566; cv=none;
        d=google.com; s=arc-20160816;
        b=JgEPZj6MFrD/G85Jrya3kb6k1zFkxgNX/GJYg93VaP22jY4uVlfrpRNnoU+mJILYKf
         av5f8S8WUAnyexnsqsaU60njn5J3SyjUI1rGxyh4hG9n69xw6GnhKzGZYhwPm35eBpDF
         Ryz9HrT0efweFDB1yD3rEffeAIV9FBDmps7oYG9Vtgd1hrppPCvCQjF6BPpmdBkhUAb0
         D8AAb3BgcOlXmlLglDhoFcfVkERciAonIfticgf+9w6id8jaoeBQ+Gdt2ui0sJRqU4Op
         2kMdU1YX4sTUQ2H942XPXM1t43bnnO/N0AUn0IjN/9hHJtTD6ZRd/6IL+uKIWeGAMGGk
         mCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ICJBhRzXeSHxiQ/p/CxRsyTFTBxBWWvxj76zvD9iTsA=;
        fh=Ipx6keqCeQmB8+an3EloduDy52/7qT2w0SH6aDvHf5w=;
        b=qiZnCuQvfyzwhuCGWgxM50c1yGrOJ+P5uKOfohtBznY4Pza/INquo7m4kXTmxRBfn6
         bpdFo5K4iTw10tKW1R8Ynt010BkhIg7pXspEu8wqegKQRzUEonopiaJU2N+T4us40WXF
         QpBx7mDvpVkV7ktl5775eoTTfRRD6CBbE9uQLONG1J4lK2FlOseuJf42aFuUMwl748Vk
         ib1L9K7SqUDlsz8Y/UrdvHMR2tOoqOQs3++peGal5XMnoKDUjQUj3LJK0FqtPSSOdODe
         fYjqtHlA8MC5YavdEw2IuyiCLesddzugUrKEvqudLVvYwED2PRvn5ZiQe4h9vUUmDEla
         /Htw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5Abe9i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945dbeea81si3427651137.549.2024.08.09.09.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 09:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5Abe9i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scS7B-0004Vk-4g; Fri, 09 Aug 2024 12:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scS6p-0004JD-9B
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 12:04:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scS6c-0005wL-1G
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 12:04:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3687ea0521cso1565646f8f.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723219477; x=1723824277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICJBhRzXeSHxiQ/p/CxRsyTFTBxBWWvxj76zvD9iTsA=;
 b=b5Abe9i1vt616+EgPJfr4bTfwx8KG3TRTHTadQp6ljSdXsis+pPhd1Fe6kJ/sEzQIP
 QUT0EXsvuh99U7+S/kQT6gBdsXrRIc37jKRMQPlqToBB+hmQLRcvb5eH1RLbkdYqD7TO
 0861UWTULG64oy8KBGI1jHByUqmi3J0Ku+iAphQuUrU3ZOctcbWhiATw0jtQqWvc7AXE
 5RgYiikbnc+oKG3lMaF8FxvuyMXbhx8iOnWfhloaCxRdq3qcMB+Dht6jS6IVOmwDAE85
 lu1if1B8vB6JzKr3uz8Ym45QZGL7p0nVgiWTpT6ZzLtvzYA7G6lwJ0RfN24GYuPrZdgf
 htwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723219477; x=1723824277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICJBhRzXeSHxiQ/p/CxRsyTFTBxBWWvxj76zvD9iTsA=;
 b=v55rd5TE1scdxzqdf/GBn5RhGUfHj1GR/d5dbAMH+yetY8gHDryUlmkQ2C+mhg+47h
 Db3DKUBnbkXLzOSt44DS6Vw2cbVvgWmOLV2Xc9MKiESZS4YWAmsTziCOJEXDKnKaJPI8
 XL4bILbeuN2Z9xMMq0SJ6eQHp5gnXAGmLXgZmz30mxaMDQYOVUPjIpb2M8BbKox5rQw5
 J0keliFbzhAT8pCJkBf2EisLu5e5Nikr3B6XsF2BmxAsmK5Xh5IIRgZX/0rtdpSCiDO3
 CVUU3Mh23c8gmGbeZE7haS4JFII9oZi2sZXFAFugiM13Y4lwRuVvNWsy8PoalCkm99Nc
 UwUw==
X-Gm-Message-State: AOJu0YzscQvdaRczMjE9MEw0CTZ8R+cOaQnD38+zF6RhdfhT2TLFqYbL
 B453j5J7MKoPEA6duXuZY5dWKSJ/sP4ehm98NZfmuO7uXiGtTeHXG24o1iEPWrvsYN8Y9auRkKM
 w
X-Received: by 2002:a05:6000:b89:b0:368:3b5c:7a5d with SMTP id
 ffacd0b85a97d-36d5e1c7656mr2289108f8f.20.1723219477084; 
 Fri, 09 Aug 2024 09:04:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059714d5sm135171295e9.13.2024.08.09.09.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:04:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/2] target/arm: Update translation regime comment for new
 features
Date: Fri,  9 Aug 2024 17:04:29 +0100
Message-Id: <20240809160430.1144805-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809160430.1144805-1-peter.maydell@linaro.org>
References: <20240809160430.1144805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SmbXTkhHhOZd

We have a long comment describing the Arm architectural translation
regimes and how we map them to QEMU MMU indexes.  This comment has
got a bit out of date:

 * FEAT_SEL2 allows Secure EL2 and corresponding new regimes
 * FEAT_RME introduces Realm state and its translation regimes
 * We now model the Cortex-R52 so that is no longer a hypothetical
 * We separated Secure Stage 2 and NonSecure Stage 2 MMU indexes
 * We have an MMU index per physical address spacea

Add the missing pieces so that the list of architectural translation
regimes matches the Arm ARM, and the list and count of QEMU MMU
indexes in the comment matches the enum.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a12859fc533..216774f5d3a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2772,8 +2772,14 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  *  + NonSecure EL1 & 0 stage 2
  *  + NonSecure EL2
  *  + NonSecure EL2 & 0   (ARMv8.1-VHE)
- *  + Secure EL1 & 0
- *  + Secure EL3
+ *  + Secure EL1 & 0 stage 1
+ *  + Secure EL1 & 0 stage 2 (FEAT_SEL2)
+ *  + Secure EL2 (FEAT_SEL2)
+ *  + Secure EL2 & 0 (FEAT_SEL2)
+ *  + Realm EL1 & 0 stage 1 (FEAT_RME)
+ *  + Realm EL1 & 0 stage 2 (FEAT_RME)
+ *  + Realm EL2 (FEAT_RME)
+ *  + EL3
  * If EL3 is 32-bit:
  *  + NonSecure PL1 & 0 stage 1
  *  + NonSecure PL1 & 0 stage 2
@@ -2805,10 +2811,12 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  *     table over and over.
  *  6. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
  *     Never (PAN) bit within PSTATE.
- *  7. we fold together the secure and non-secure regimes for A-profile,
+ *  7. we fold together most secure and non-secure regimes for A-profile,
  *     because there are no banked system registers for aarch64, so the
  *     process of switching between secure and non-secure is
  *     already heavyweight.
+ *  8. we cannot fold together Stage 2 Secure and Stage 2 NonSecure,
+ *     because both are in use simultaneously for Secure EL2.
  *
  * This gives us the following list of cases:
  *
@@ -2820,14 +2828,15 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 EL2&0 +PAN
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
- * Physical (NS & S)
- * Stage2 (NS & S)
+ * Stage2 Secure
+ * Stage2 NonSecure
+ * plus one TLB per Physical address space: S, NS, Realm, Root
  *
- * for a total of 12 different mmu_idx.
+ * for a total of 14 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
- * EL2 if we ever model a Cortex-R52).
+ * EL2 for cores like the Cortex-R52).
  *
  * M profile CPUs are rather different as they do not have a true MMU.
  * They have the following different MMU indexes:
-- 
2.34.1

