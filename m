Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1609804njm;
        Thu, 6 Mar 2025 08:41:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQ4Xv0fD+RSnQYYAks7wB4LchutoCpnxMu+RT2GFv90elyu1bd5VRAGVrFp0yQIYYSzjmACrYcZ3qkYw==@linaro.org
X-Google-Smtp-Source: AGHT+IGNgaOITxJ4e08rEr7mjmpDDjgYUgH5v7soUAvp86WlzDnC2GS/ajgPqvDKj+/+LCIZd/BJ
X-Received: by 2002:a05:6102:2ac4:b0:4c1:6feb:83aa with SMTP id ada2fe7eead31-4c2e27be1b9mr5352158137.9.1741279318890;
        Thu, 06 Mar 2025 08:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279318; cv=none;
        d=google.com; s=arc-20240605;
        b=lEok62/0U+9OGjfnw410sZ4bMSZVGH2rVrYEqL9dpixW90MC+9ZVdUsm2+reciJ6m+
         P7VIgPHBlKauQxvHgoKCJjRQFERcrdj++1Rxkd7EC6ooUWFmofJKyFR50X3z7j9BCYga
         +bEHPCGFspZcUSB8zDL2yUte1UayyCU76zx9rEb7u1ynmxpikpfyMCvhePZYSUZp/xBG
         j4Li9Nw6hhdA6KF/i2z20sV3T9Tr9xysqrCy5hr3JkvzXzGRnfcNHflWXZr7uyZds/WT
         ZvdfxSmvTDUgUUzwtQATY3Fu+AbkRtrbsWK59wr/9JKFABRyNVL7yh8i7h1w21KcwBmR
         5Mbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0WIG0SaEOnTT7Vl+CcOLcRx6EDCmK/EJvLZA/gTBtzQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=JPM1SoXE8bLIB8xtqujg2+BDRLT65NVYIM5bt2OAG5oq88wvPG8liVS67+Cj6h5LOT
         5wJXAQe1E20RC+0epdVUUAaE1gSsbLPFf0FE+/ILPQnP4XOXZqN1kCIshKCMOtvg+cmP
         YzV25NtRb0nHDvPzMPI75GSI7Q0zr4lOoqcPZSGUUH0JtFaXS0Sw3sVRM+lH2H/8w2bH
         O+v/GGw4Kj2KxTGlYXpiZLAM/CaBjtyXJpAHZ5tz1rW3L6HHhHFX7JlFUc60cGa/Y7oZ
         K3oswR5J1h9AWnTlCD8A0wd1V5viKzom1sRxDUHjqFOwa7TYsKeGXfrQXEA0vF/WUxw8
         TVsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOUs+GU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbcc6569si377423137.433.2025.03.06.08.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOUs+GU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEGC-0006xz-22; Thu, 06 Mar 2025 11:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEG2-0006nu-B5
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEG0-0004bi-AA
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso532855f8f.3
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279174; x=1741883974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0WIG0SaEOnTT7Vl+CcOLcRx6EDCmK/EJvLZA/gTBtzQ=;
 b=HOUs+GU02ulIkn54U9ZPk0a4nSMACpeUf9svog4JIY4UKovzPG5xkL/jI6JHiLPhaD
 mm3ZCM91PFWj7y2llp2HpM+kL1Ja43vYqhX1WZeQ9D2hg2YZy6hSSxYg4kjevtmuK2Wc
 NZ1A9WXfOmgGdSBCvVSixCHscWwp+NyP2JyJjjTgfhWM5M9TCU7nac+8wMcRBYtmGUt8
 kaKgIgEn/5UaQeKYbpAGw8dMsdhoR15aNpmSb92upTIMpDSvbeHe8VfMp5Pu0YE8uGGb
 PDQwdxFoHEcC6oUaKHqASPcLhY1ztbgXD7V+0NkdxVD9eCLEbFQ+7cxsKM6icA+MVLfJ
 ED2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279174; x=1741883974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WIG0SaEOnTT7Vl+CcOLcRx6EDCmK/EJvLZA/gTBtzQ=;
 b=Spzd2Wo63DrcPgS/oreomKKYfWfO9CXsza6R2cXp60qd8Zgzj4BgvV44mNDDtwmH74
 BxnMzg0wbWRBTdjZpvnzji1vr9r/5n0V/Bex7g/NNL3r61odoSsejGIZpGjvPMBVihYm
 vtqyNqR4CgVuBtyB6C+UlCt30P2XV5iR7VxFqlCw84lQkr1QlBbkKu7w7sFGGL7AiAcz
 f+LOiFYU7Nj3KVlpSS4PZwaJpuhw6ygKKyu0OsrsWHbG/W/8tb2+XFw1MFd70I/xzVZ4
 2ZBSg65gcnL+zUdSE6WB/xTTuzoBW6TcxSZsa3bUAi3qSZ2k5youudxA2OWLuIhr+pwR
 oVpA==
X-Gm-Message-State: AOJu0Yw06t8wzuR2FNMJjG9JveSCD1vFduw8+fmXvG6a9aAKM2alnNpn
 pFuv9/z26ACPAQYKYwWVQipsDaOgQGB76yraxgehGT0KCKip/yFlOxREJ4bqS9jjEH2WS418AxU
 3
X-Gm-Gg: ASbGncvbzLPYxKibC7b3qGYpJOVr2C11aEvx2t1/waXsJq5QugzpFfNxarmSwSTG6nm
 6vyFr5dTaFyX6qNJ6EAWD/vLcYj+24kd4WZdwWYM3KoQUD3BLJirKh2WT2IpIGuGWRdLH4j7jDz
 xpg9lTp+/I7YsP6f+gh4lVophnRk8Zts7mU7HGE9n9sejF1TmJricJFlYkZEY08ZEf85lBGKm6K
 CPea7wF2FhN8iQ7XYoK91rR9Y8e6UPDQ+hWQU6XfRp5uJ400XN5QBJT/rNcp4OSMJI7xek7S5fl
 uQOqHJQsTyZvUXgAc/UJKbnKzipyrNpgJq2C3kfgh5cqTBjh0e8=
X-Received: by 2002:a5d:64cf:0:b0:390:fe13:e0ba with SMTP id
 ffacd0b85a97d-3911f756fd2mr7745130f8f.27.1741279174616; 
 Thu, 06 Mar 2025 08:39:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/10] target/arm: HCR_EL2.RW should be RAO/WI if EL1 doesn't
 support AArch32
Date: Thu,  6 Mar 2025 16:39:22 +0000
Message-ID: <20250306163925.2940297-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +QLWAw8UJhN1

When EL1 doesn't support AArch32, the HCR_EL2.RW bit is supposed to
be RAO/WI.  We don't enforce this.  This isn't a problem yet because
at the moment all of our CPU types with AArch64 support AArch32 at
all exception levels, but in the future this is likely to no longer
be true. Enforce the RAO/WI behaviour.

Note that we handle "reset value should honour RES1 bits" in the same
way that SCR_EL3 does, via a reset function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1085bff0ec5..6dc6f3858fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5167,6 +5167,11 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
+    /* RW is RAO/WI if EL1 is AArch64 only */
+    if (!cpu_isar_feature(aa64_aa32_el1, cpu)) {
+        value |= HCR_RW;
+    }
+
     /*
      * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
@@ -5224,6 +5229,12 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
     do_hcr_write(env, value, MAKE_64BIT_MASK(32, 32));
 }
 
+static void hcr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* hcr_write will set the RES1 bits on an AArch64-only CPU */
+    hcr_write(env, ri, 0);
+}
+
 /*
  * Return the effective value of HCR_EL2, at the given security state.
  * Bits that are not included here:
@@ -5459,6 +5470,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .nv2_redirect_offset = 0x78,
+      .resetfn = hcr_reset,
       .writefn = hcr_write, .raw_writefn = raw_write },
     { .name = "HCR", .state = ARM_CP_STATE_AA32,
       .type = ARM_CP_ALIAS | ARM_CP_IO,
-- 
2.43.0

