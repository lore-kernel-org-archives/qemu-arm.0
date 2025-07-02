Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3739204dye;
        Wed, 2 Jul 2025 04:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx75Vp3tW3qN8DtwkqbZ+IFvSY4+cwW7AOkRyKpTwzy4948JA3/Y2fHk/I03uBdCQGN0DyoGCnmlWiFA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTY8NRBqiJYBUQFD2neA3gEVXGCy0JB0Jyn8SqGRdKkVjcAcxfz/TAHpvXu9BY/ofWh2Lw
X-Received: by 2002:a05:622a:98b:b0:4a7:c4d:1a51 with SMTP id d75a77b69052e-4a976913b28mr52698571cf.13.1751455326258;
        Wed, 02 Jul 2025 04:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455326; cv=none;
        d=google.com; s=arc-20240605;
        b=fONBdJLtIkfYg4h1G4bStwgr30lWYa0FHK0GGEAprLboumT6p4OCNx7ojT0cB4XYe3
         Dq/rfFWqdRCkr2Bc+FrsgRv/3eBoWs+X9oLb4yeva6x8UETcX+8srOHKcWnLrlVYSVvd
         atYXrJx4OR9ZBddbu82+ZU1BsyKc8D+EJw+jvLDaWIY26KH1AgMD0EZS9DugDCMkMaJY
         QFp+Oyhs+BBQQ5JpDIfwugkH/9bpWnf8Y0duhWTyVLseELaMiSaqZElj4lRs70RU9YoN
         DpxLUBABobYi8WMDGq0uCcQUJ+IPA10ap6Mc94SobJVh+haA61APioGPgUHBWJGXntWT
         8qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=san6//J2Bh6vdrxuitot85Z9Yr39VPnyAsBLC3xaxGM=;
        fh=ivB++8vVYYud0G9JF3A+mdvbn6RH/WD56fSW6OIHerM=;
        b=JF9XBObaDh/X+rfwUf3OmcrgD92NoHP/eleozaLSQr5aS1YVqL/hWs/f6SU1VlwWge
         ATbehWccc1AOoRzRe8zbT0YkQ/7YmNY/3jlBgPf6jAYNGVrhTEAjiTbmw/EJcjtMTs5E
         44qP+Xh8KyhfT59bnXNSIN/TtucqKUY0dLUMZFlnP99Az9mKCaBSCubGYliGpYoJrfr3
         6+U3M4JDX9M6YLoetFcq1sbc9kg3S1NkfFeTDds6eQ7POqR/QVEU/nOmlkZtx/D4Ljk9
         VpvJiVhLg0E64cTZf9An5ia3ur3aWWDwWWKIQx5JTIeXusQnV3tjosIOt6yQijgan4FH
         BC1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bthzqdRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc20a075si129924771cf.225.2025.07.02.04.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bthzqdRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWvWT-0007pZ-7T; Wed, 02 Jul 2025 07:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvW5-0007gj-IR; Wed, 02 Jul 2025 07:20:49 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVz-0002RG-KN; Wed, 02 Jul 2025 07:20:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso6396243b3a.3; 
 Wed, 02 Jul 2025 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455232; x=1752060032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=san6//J2Bh6vdrxuitot85Z9Yr39VPnyAsBLC3xaxGM=;
 b=bthzqdRepDQp98Ksu7Ye+9QrxT/79uUIZCZW3WrLWf4Xef4jOJp+doaxC+CEHkOTtC
 s8xE9DrRC11QeV0rQH+vQTiRteXTKJElCmQC+pcBQ7CVWM+nMTgooSjs4ZjBjnUcytDG
 87exz1WGCZBzSF57n+W+L4JWnLU2mMYt3XVyisSjNGwYUGqMrCt85tl/Vy1DGrrfiWlh
 I7l2eqjtXYSokTuAHWklCXaM3iaYDU5YWO8wfolJiTohavpixZCeqeUV32GE6DNyA1ge
 XPabTvhhMU8jWYoCICaierstjNJjLQujKWQQAMLyJvqPrsRW2fk7D7n7xyNLvQGedYOq
 qyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455232; x=1752060032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=san6//J2Bh6vdrxuitot85Z9Yr39VPnyAsBLC3xaxGM=;
 b=AUdjx1mqJ+yfcqC8Kt2fs5HRTWs1uwjuwtsr8HKGTlpc+CUPvN4uotNUa4S5M/MWEL
 EkyqRaeSvOXj3cXud3vPRctFLPoGSrfgqkOjD07kcVOmjOPc1iWGVB2aqB+MRfWNAQEk
 FsdQzJAnWxzSRsrkqnJriYdhi05BsgiVQf9ovV7saHbgFtiURIRWH5NKQOXQaQDycjGN
 JcRWSQIdIMMwsG/HgbHY+N30MKd0aySMuOkq8Cqg1LcwCw4k0QjqR+QP1VBnl516XDZE
 EV0RLi8c2yuH9N19MFkUTAeA+RMv1o50mquK5K0etEanIUDRrPBa05TY9f6CFuu5RSLT
 Llaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5uWYZRHmHRzghL02705TbVGZPr54TPKFqfdV9cJzUOH/XYkQYISwfUFolLZXRdXYmX7ZrjssRtw==@nongnu.org
X-Gm-Message-State: AOJu0YzsVWk+QgVLKIpecud7A066dfLjUwhdFbdPyxfDx5XaUR0gVCKO
 T020HvQ6dtvLJ1NuLQAiWUHlzi2fME6m4n6Lux4zbQYGClmktgKcWId3TPu2ZO4ufLk=
X-Gm-Gg: ASbGnctp+7n7jwSs2qbXGBxRJlc4+bbFvYbOak+i2FGMKXKTvQepp2X5zR/cFxQJeN2
 yhbHKN91art8pP0MQwyLBqvBz5x/1Yj4wMPk9hHzxL81Or6DRXzZCTDS8wjHLfRwVTwsTT4OXrk
 Y5n+F76OoZVzyX/7fuhwKqt+XnzjWcmKDRbQKjPSAj6wjLEadwYRN5q3FQHTq/Vse5/+JYLB5zW
 vHPgUabIT9ex6LcoMoUYdISFW5GN7DkJelkcQC9XjcNvuztqvNEqCY+fvsYaw394qYvb4O822Oi
 6w4e8g4JYsBz5LgtUOBFYuQKv1NaVCilfKIQk5FLUSJewGWqaB5VaUb2PjuIZh8zqWVQhBwPBVc
 Tbs6LfAaKMUSNc5odJiy3nBrpp32416fk79ovzxTLX3Y=
X-Received: by 2002:a05:6a20:729a:b0:21f:7430:148a with SMTP id
 adf61e73a8af0-222d7ee7a65mr4653793637.28.1751455232184; 
 Wed, 02 Jul 2025 04:20:32 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74af55c6d49sm14174909b3a.119.2025.07.02.04.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:31 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 08/12] target/arm: Fix VLD4 helper load alignment checks
Date: Wed,  2 Jul 2025 20:49:50 +0930
Message-ID: <20250702111954.128563-9-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mszWhwa2o9oS

This patch adds alignment checks in the load operations in the VLD4
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 60e61ee538..86eef54426 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -403,13 +403,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
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
@@ -427,13 +429,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
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
@@ -452,13 +456,15 @@ DO_VSTR64_SG(vstrd_sg_wb_ud, ADDR_ADD, true)
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

