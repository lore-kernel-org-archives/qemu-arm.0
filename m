Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp3251838ejs;
        Sun, 20 Aug 2023 19:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvCa/lYVH/020eN6ZiQck/ALgs2hWghIWSYfb2NzRdr/9M9V/jN2DrStN2Ex/Wk5bCyx86
X-Received: by 2002:ad4:58a9:0:b0:635:f921:de18 with SMTP id ea9-20020ad458a9000000b00635f921de18mr5194829qvb.53.1692584455848;
        Sun, 20 Aug 2023 19:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692584455; cv=none;
        d=google.com; s=arc-20160816;
        b=cBbckoAfakFLy4nJs996A6FRr3/H5vsYpFq/XO0a/Xd2iYOIEHPn1X1q9SMNpqNDel
         uumi90i6hyePSpihek1t0EH+29Fj9fK5LZNumXDv+x2n/vAy4aJoaRRss7moTXDI4m8A
         mXMpeQa/65fMCvpmUY3M/HyJGhzuixfH0TScy98n/l80lqB5f8pOhUdlMJmTlpJWqaaY
         WMup+vPM3XzGdFgrLXI02YTe6Si1V+egEi3eRMyU5KNa5B8xF9POBz+iSEzdHonVwLzT
         yBE+R4pmKvoLCeWNcfHY2P+s5cJZyG5VI0Y6jydFC0pO0STbxtLbn1CzZXzOzRRrHPYd
         hyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ImPZelBE/lkw2uDypiK5+Vxi3S+R2CKyybX8jsMobhU=;
        fh=j4Z1An09Ve/stdydd/yoEYU5jCtTlZP/o+LZJGsiADc=;
        b=VIHESzAIfsf68GYKISHNhAwyJ/p82Bj1OCiV34bD+IC2uQk2Q1q2Y4csIcxgQZ490c
         3j9Zc+N3zcL7B4lXo27Q6D195jD+3Mr7x38s0dzPCiM8C1bVdUUxsIE8tOHHblTK4WRu
         CjMKVqCqaiup2WQNj0MxwHddYpR/KJH04hPbhTALi6Dtb9htQOGB85KxS3kytkmFWjdr
         /hSPfHgfTSBjj4BfcJ4eUQfGFHKD68r8UfOXX5B8soCus7MerRX4yJ8AOMtjvDcei1jR
         YoWhjfHM56IKhZ3GoUtTARBq12Bnd8vGvAhgdF3xGBxZir8zdMwDpBW/PMwS+nFwk41b
         lbdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGYrjDNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a0ce504000000b0064c3132be1csi3326268qvm.85.2023.08.20.19.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Aug 2023 19:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGYrjDNz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qXuWw-0002NP-5M; Sun, 20 Aug 2023 22:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qXuWt-0002Me-8p
 for qemu-arm@nongnu.org; Sun, 20 Aug 2023 22:20:31 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qXuWq-0002Z6-VR
 for qemu-arm@nongnu.org; Sun, 20 Aug 2023 22:20:31 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26d49cf1811so1087897a91.0
 for <qemu-arm@nongnu.org>; Sun, 20 Aug 2023 19:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692584427; x=1693189227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ImPZelBE/lkw2uDypiK5+Vxi3S+R2CKyybX8jsMobhU=;
 b=dGYrjDNzj/xAKhR8bkKVR2Iww+w1VlSmCoEstYWChks+ze2yXHez+2sUCNDciY/sCh
 PMNx/sT77fU4dJ/jZiD8NXhvU463NqrIx7QOrIvmAk00EhPskBexkp03l26eJhz+sNNq
 qGtGd+WEP9e9ug5PjdQFYAwxBft4QtYef61bIDz+b6CbDuRg+HAl36vxtFinfJIrENM3
 FQ0rk/HNZl5xA1DaeBasnRrx+3T09Qep6iR9UnqRTOMRkQ7XIep9W3FkyviYNnopqxla
 p2LI9ESc13vu6JZzs9s1mz4Qv+3vIpyl7c/FidjHqVg1XkbcrE12F1W3KB5wdwNWZfsX
 v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692584427; x=1693189227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ImPZelBE/lkw2uDypiK5+Vxi3S+R2CKyybX8jsMobhU=;
 b=kFycgPR0KzbliHj7xUcWsR+JNF7HqXHIHnL5gAwcV4t/Bju/UfniIZUaGhZCBvcort
 6Oqizgq+aXrvYFNr54jccvFfQyJMYc/jRuXO0Slc4staOmDOEvnCuito0sdttvMEFn7u
 btL6gQXpnLQPlLZPBcXxNNbBUnFozN5HJ5GWA9uDOV3Ok/AotQNzrLjFlJ5C/Zykz+VQ
 Bki57AEguUec3CIbD5dnaYB1s+KhKPjHZvxniR4NmP6gHPtbTwYPfpPVEhSp80TWjvnC
 MoMqj3/zS4LxBc4LnQHwuri7zlvSFxtHSnEYzt8J60rIUv6UbkjiQYR5DUR2WmvB+pJe
 90bw==
X-Gm-Message-State: AOJu0YxO5k1nydbsZ60avUs98royKyL+P/NanyXtPftcxWgTT3KLjZE6
 ZZpqjR/6jvYeQIYhjKqGvODmaKzUIiRY1V+MjKE=
X-Received: by 2002:a17:90a:d347:b0:262:d661:2963 with SMTP id
 i7-20020a17090ad34700b00262d6612963mr2770735pjx.39.1692584427173; 
 Sun, 20 Aug 2023 19:20:27 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:7da6:8db:fd7a:4d62])
 by smtp.gmail.com with ESMTPSA id
 24-20020a17090a035800b00256b67208b1sm7269720pjf.56.2023.08.20.19.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 19:20:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix 64-bit SSRA
Date: Sun, 20 Aug 2023 19:20:25 -0700
Message-Id: <20230821022025.397682-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: EOV8nB2kNxfg

Typo applied byte-wise shift instead of double-word shift.

Cc: qemu-stable@nongnu.org
Fixes: 631e565450c ("target/arm: Create gen_gvec_[us]sra")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1779
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b71ac2d0d5..39541ecdf0 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3053,7 +3053,7 @@ void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
           .vece = MO_32 },
         { .fni8 = gen_ssra64_i64,
           .fniv = gen_ssra_vec,
-          .fno = gen_helper_gvec_ssra_b,
+          .fno = gen_helper_gvec_ssra_d,
           .prefer_i64 = TCG_TARGET_REG_BITS == 64,
           .opt_opc = vecop_list,
           .load_dest = true,
-- 
2.34.1

