Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056546dye;
        Tue, 1 Jul 2025 03:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGuFzb9xS9nvi92XqxMu+7IQr/wPR4FjGo4+z13J5YQlctU6paY2cG1pw1Zcd77tgXzCryn5yW+iywRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGwQFV51gC9aTT3OnQaB90x/SCMYY1aNHG+p6GzZvbVpT1x5x/CewVbIQzT1pziMLd4rtNl
X-Received: by 2002:a05:6214:c45:b0:6fa:ccb6:601f with SMTP id 6a1803df08f44-70001c5f0edmr219259716d6.21.1751366044624;
        Tue, 01 Jul 2025 03:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366044; cv=none;
        d=google.com; s=arc-20240605;
        b=fQWTQgeoRGb4F0OgOhMdDmww1mhAPVJNvyfjx7VjZS5QBm+NAzwhMA70sPbQdGtYpp
         3SJpNAV/Q0bWZZHAolXgceuGp4k/Z2LwKudHgpp2jFxu2CowjrbtEVrDrrXJIave8KCn
         TYnzhIEBNBRbhKxleqf/V4AKyvGUjGbo44PgGm2nU8M4/7/BMyP9B+H0JZ7CLcTCSRB9
         OkfxSsqVIsbC4NB7v4q9XpySR69IGaMnihMPwhaq4EyeBIEG/U+oQxmffF83TNi/zZxz
         vYd+tu2Jfw48U+/xoB+ezzBfsVuuyTf5Hdj5OaUu/l1NjrVsieV0dp+VXlQ2uaIv9sW1
         fLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JyGD103OZ4Hk2SYZr4SYZ7rCbtWK1S69PA+W1WpCH/w=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=SUmiEEzb/e4bw05PCybjW3fvzu38OFdZK7MIzzqiZDstXYKJYsua9lIzemVHTShKw/
         3aDklZLQlfwMmu59MpRqnF94ulxq0eH60K8TO/MPMKovX3QoDW7S/tg1rGAqiFITupsp
         N1Zj30mIF3cYqZ6rMBdcKs3Zr8eY7TQEmBTJO7xuUztFY+RXxV+X8E8UF+CkEZWqGbWk
         bkHNbfeo30Cu+61eRUV+H/smQ4SMSFaurRrlaKNppSLpwgfwq1GwAmEkGWOV64/IwWDH
         dlI5OW0xtbXxbYBrKW2ZYRCLyVdSltN0MHUsrIYzR19aif1vvn7qFf5MliXYPYxw0FKA
         Cw7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MV1iWUTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77288d3csi117201006d6.102.2025.07.01.03.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MV1iWUTi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWYJ5-0005eT-EU; Tue, 01 Jul 2025 06:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIr-0005Og-71; Tue, 01 Jul 2025 06:33:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIo-0002NF-Eb; Tue, 01 Jul 2025 06:33:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso3847694b3a.0; 
 Tue, 01 Jul 2025 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751366003; x=1751970803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyGD103OZ4Hk2SYZr4SYZ7rCbtWK1S69PA+W1WpCH/w=;
 b=MV1iWUTi4oTVFHgnkuLPV5sKjUkjgnj17SGchmHqFMfR3TNz+2wO/msmYoswO8RaTI
 4jecV5L+o9XhD3RfHv3kDf+4JJePK3CKKhLEVdUG7Y97IHPHgNlOJ4afRUbBjQjiKaFV
 76WfN3q3ZOG/qJm1krtnE7wbR/CJkoa+NnEU4PTGoc8V0niBimyH8cwM+TsKuEOPAW+6
 0jvkIfU1IOEm9MiKwyniaxk1ylK+pOBUv/8ErgSFycwGddFaYIud1G7qf7Rs+TGnM09s
 oKBS7L/z7iw8NLcBmjhCGSDU02pWSgoU0RcaN4HayHGWcGE8qbVMCvu1v815ITIbSzW7
 6N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751366003; x=1751970803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JyGD103OZ4Hk2SYZr4SYZ7rCbtWK1S69PA+W1WpCH/w=;
 b=O3DB0xpxI1ymLboe23thdBgF3jENmOgkVk1VDVc9HjBJ3sVqwRd+9cqT8x/OaoLHLR
 BAdAskG47tC6SbpkVNVc4EIhuy9UohXCWg3INkXREOF8P+S6WiDNNXp6SQ+OGQXFrt/v
 4i+XZXGGkZ1nhMFQjEdIMi/lOrNifNxS1OLEcJ6lkPhGKhJU6JhPx411VZbBJQ1+DmSL
 loiwLIxFSClWrFNKOKQ0k9H1R3ZUElyjP19AFXJh3aY7xxdjuOJmV57M5r3/DqHlYtK8
 wo2omVkwOrH7TxXjWj/fqCxOUgyXI9m7UpR0L0ffEQ3IRhBmNS5gAne1LtFSZvvI8Kd5
 MhLA==
X-Gm-Message-State: AOJu0YzGYVnTpQQHvnfWcL988bsGqdPQjx3MfNzCBZAIXCgXrVj9MZtQ
 Y45rZo7ZiQDkpEIdHieNu8O4MczOuLnHZ3+k/SaCJY0DfSGcPq1wnWiZZE5n174HPWU=
X-Gm-Gg: ASbGncswSG/C53Vk0caqMWRR9jDlqtIrUxpStBZ+8Uf0anCwGMdsDWfB2QMO02csD2H
 kStXb6TOZo//btETp//2bimCxLiJX9UdXvttRh57dtaSuYOS9NxNXm4s5JG6UC8c5AUs/gUbO/m
 /K/POYKzdFX8MVhA8FM8txhcekwdY7TLTLCdYzDCL6g+EbPhwHnEHXzup7UVGkfS3rOsBSp2yNL
 xgFp3Iy92h5nBUST8PwDX2fTeHvAx+Xgk4M40mVMFHNx7xbsSpfBgiaauYgC7Jtx4rifek0UDWZ
 AemgROg2/eI4m52igGPhk0oQxhXq4LIkEL41SRuTehsDLZY4VgLV4Oo7xEGi8zA3PBHhW3ntIxQ
 xqdG1mTNNU8WW7rs340QDM9Z68i+wtx3NUhgNx7ttUXG4aTmxxur3mQ==
X-Received: by 2002:aa7:88c3:0:b0:736:35d4:f03f with SMTP id
 d2e1a72fcca58-74af6e6620fmr23199013b3a.6.1751366003127; 
 Tue, 01 Jul 2025 03:33:23 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74af56d91d7sm11185740b3a.141.2025.07.01.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:33:22 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 08/12] target/arm: Fix VLD4 helper load alignment checks
Date: Tue,  1 Jul 2025 20:01:55 +0930
Message-ID: <20250701103159.62661-9-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: 1PmF/Z94YrkY

This patch adds alignment checks in the load operations in the VLD4
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 5b04fa4425..2d2936abde 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -421,13 +421,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         uint16_t mask = mve_eci_mask(env);                              \
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 4;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             for (e = 0; e < 4; e++, data >>= 8) {                       \
                 uint8_t *qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + e); \
                 qd[H1(off[beat])] = data;                               \
@@ -445,13 +447,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         uint32_t addr, data;                                            \
         int y; /* y counts 0 2 0 2 */                                   \
         uint16_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 8 + (beat & 1) * 4;               \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y);             \
             qd[H2(off[beat])] = data;                                   \
             data >>= 16;                                                \
@@ -470,13 +474,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
         int y;                                                          \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 4;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             y = (beat + (O1 & 2)) & 3;                                  \
             qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + y);             \
             qd[H4(off[beat] >> 2)] = data;                              \
-- 
2.48.1

