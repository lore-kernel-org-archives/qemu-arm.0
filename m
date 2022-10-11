Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2883708ocg;
        Mon, 10 Oct 2022 20:20:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+ZbhS3SKJsJI3STVW8vEvZ1osNkh7iHv0REs14ALtBwqj6Tn5ueoPVOPsVCLAGh411RSK
X-Received: by 2002:ac8:7d85:0:b0:35b:f5b1:63df with SMTP id c5-20020ac87d85000000b0035bf5b163dfmr17415021qtd.113.1665458420549;
        Mon, 10 Oct 2022 20:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458420; cv=none;
        d=google.com; s=arc-20160816;
        b=Zc3r+uCC97l0xa7LCuYt2CFl1XOK/SNx2PowSwtmD4CcDGmzuPIssKqLUvduqF2iYo
         bnVlxumuyK7dIx+XEbhLNlq2CoqBfqvttzdOeUu1UThAS3RW6YW6akEAiAs2cF30dOP9
         PWE37knXRIIMrZe/DLI1TTgE0zvLewp5Or1+5yvp4YER0qW18fHPqs3c62hm0gMz0AhQ
         8L334NlU9NcpVdFMTM8enE4uAP6TfZhNTuFizj0HiBzS53hDf8RWuh8Evrv9aDVTur3W
         o77W6qUpaJDjk6AiGqe3+3an5XPQ2fpuKinBfiRDYZSsIO0EM9SEaRcoZfUXUaRRjsHz
         c4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sfKD/zCeIYRQKq3df3kFwiCr1YlgQpiKDEPmo1WYAa8=;
        b=neQOzRuAu2lJA1WHm7t5xcy4eqOA3LnHuk0lThdwLwlgkx9heprFGeP9WEpYpdr3Lw
         5f7DweUYfJRAUvaER7hl/NKJJhE21eAmx1AuZjTyGCBiy7Iq2efxVKmKgP40m6fOA0fT
         qsJVFzUht0tkttjn5JjYviR1lDbU/yMt+yV3NdNi5NNOrxrkDtjY5tSpagQHUCm+UYud
         V9gyi6w7OO8ywRZF9ZJ5oEj9S5jw9kch827UYeL3lLRhUu60N7Oqdb6Wh6E+vmBIV0Op
         ixuNBTRrGIoM9z2RzfKvZzaJa+jzn5T7mJJMhJljOEDu+TIM1oqqbJeF0OBjNAu2IqWN
         Q+VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4Kh+Ofq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac84990000000b0039ade112135si1812288qtq.130.2022.10.10.20.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q4Kh+Ofq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5oZ-0002Fr-QH
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ng-0002ES-W7
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5na-0002zQ-4n
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso6960059pja.5
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfKD/zCeIYRQKq3df3kFwiCr1YlgQpiKDEPmo1WYAa8=;
 b=Q4Kh+OfqNBXwng1azAIntY1pAvDIHMjnS2eC0EHHYt65A/Kf+28QHRAuE9SHWYKsUZ
 971fd0G1QiQjr1u/+O4OziUJDZRwGyVddapTadoeh2tbrJ2VmjEs2XH8YRtujbBw/Kwb
 jLgCmYoPtUgFkKCbSgZNK6gbYvzbXgb3N9pVME5yl9fPb2C3ljzj9EfR58EgcQW1LF2F
 f+Ad3x2+12ss248p6BT7qXRGlBCsH4EcMeY91Hh0YnC3Y3gkHEmNpHb7HrkV6BxWxQFu
 O9JQjfc5KYrgjZ/m36UPWIdHC6OfvMupzqDqAE4MqYacFQYgquYMOsvVSy18r5eMi95l
 E2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sfKD/zCeIYRQKq3df3kFwiCr1YlgQpiKDEPmo1WYAa8=;
 b=oFQmEyxdxh5dHZ3SGNrpvt5Do1hcNTxTfwbbcTgvtvNooAkUzM9grK0FAQEZ/MzwTn
 te8td0umxcPGkpeK/Y2ThYSBtzhEZ+7wg9SxKxzDoWdgTrb9D8yBpJMX9XgqcfXVvNEU
 jcNfQNGWZToAkOuMOKYao23IwyuUeOSqNg6YfiDYe9zyqnDqaLc24XI/JzhvbaD0PYq4
 1A7vsA9hQKQQGHr1iHK+5/2AW8W8i/FtZFrO9cONKKDUaa53Htv130RbygjnqW3z8DAt
 uAC+yfOfMkA7VMqQi/TyD52yhVHYaJHTVirm9avPPK+XhnS31KcHPyBCWzgcr+Hd8imf
 jnxw==
X-Gm-Message-State: ACrzQf0Bw6Ck7jZ6Ho9JN+FK0O9vkk2uizD5VY1iBeLtuTqJQ5K0FeJQ
 rwxrMIO6UsviXZqxoLcnlqS8lQ==
X-Received: by 2002:a17:902:f7cf:b0:17f:9081:a3f7 with SMTP id
 h15-20020a170902f7cf00b0017f9081a3f7mr21742207plw.3.1665458355565; 
 Mon, 10 Oct 2022 20:19:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 01/24] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 10 Oct 2022 20:18:48 -0700
Message-Id: <20221011031911.2408754-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f5pMtEsEDDBF

Copy attrs and shareability, into the TLB.  This will eventually
be used by S1_ptw_translate to report stage1 translation failures,
and by do_ats_write to fill in PAR_EL1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  | 12 ++++++++++++
 target/arm/tlb_helper.c |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 08681828ac..38347b0d20 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,18 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+
+/*
+ * Cache the attrs and shareability fields from the page table entry.
+ *
+ * For ARMMMUIdx_Stage2*, pte_attrs is the S2 descriptor bits [5:2].
+ * Otherwise, pte_attrs is the same as the MAIR_EL1 8-bit format.
+ * For shareability, as in the SH field of the VMSAv8-64 PTEs.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA  \
+     uint8_t pte_attrs;           \
+     uint8_t shareability;
+
 #endif
 
 #define NB_MMU_MODES 8
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 49601394ec..353edbeb1d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             arm_tlb_mte_tagged(&res.f.attrs) = true;
         }
 
+        res.f.pte_attrs = res.cacheattrs.attrs;
+        res.f.shareability = res.cacheattrs.shareability;
+
         tlb_set_page_full(cs, mmu_idx, address, &res.f);
         return true;
     } else if (probe) {
-- 
2.34.1

