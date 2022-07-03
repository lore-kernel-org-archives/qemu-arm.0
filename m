Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2457678lft;
        Sun, 3 Jul 2022 02:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMad8/3xKnIm6eiNIL7Nssfa5JG8FDfR9npMuPcf06k+nnR04QXW1BXjclUxmuBOeDm4m2
X-Received: by 2002:a81:5857:0:b0:31b:8e8b:ded4 with SMTP id m84-20020a815857000000b0031b8e8bded4mr27030581ywb.70.1656840429155;
        Sun, 03 Jul 2022 02:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656840429; cv=none;
        d=google.com; s=arc-20160816;
        b=LtCHbPXEZh2EpCytEiTBPc6fPMMkjpKvgYCLemobfmrFB3X/j5+XK7Coh8HYzr6Rcl
         /99Dln6OGNSC3Toe7fe5ZPdbEw1xEZzq5VgBmnACuuURWwWXnNBSBoiUcP13BkFq07by
         38Jz9jDnf1wVFqHxjJUyzBee4DeBGXoltKRQi/zRC76ZQM5+CMXw4HK8cNDRbVAvcuxA
         gVjinOjiBn9i8CQZ6p/OFiW+9jjFWleIWCWrpmckjMXNqvlKelGHwHN/cT3pLPNX2TtF
         2kZ6Z51kmRf0SdzazqUdoy/Py1W7t6F5cg1fE7UVdYfQgEsSNtHOgvjK6akVmmovSutT
         +bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liHUuzibAUDh7PNtlnTFX/CxPtgHbz6rTpMJQG/D23M=;
        b=POfPq3+oKDjYknDUbmWCCtq6XdceJDfl2NqjIfri4jwy1fSOyGbQzi8QMWcbpJwAMj
         gsBtT5lbHIsIMKVZTqtWLIXCn3WH/jPyqAjd2nM0EHI5TBnJDlMcY2WRYkfTq/KNCo2B
         fXtfLDnBc9TxkC9+tfCA80hKPEqU6XV0ClJvWfshJJr9KQsvdxolxxIaqO5+nj249HrB
         kuMtY8rmLPqwPNTvyfaQ/NvOw4NcDbWPGTOpfEmb+gdjty3Y5PZTIqhP8xTiJqfabTSp
         kSHY4Fn99oraSly+65sj/5P8hzPXtIUxSZhLbP+ixyeJu4qfB+9CQwxxQDwHkmuyQ+yU
         BTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FefgVOYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127-20020a251185000000b0066d92aba03bsi15033542ybr.126.2022.07.03.02.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FefgVOYL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vse-0002Lm-A4
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzl-0001jo-Ou
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:23 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzk-0006q5-7k
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:30:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id k14so6037681plh.4
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=liHUuzibAUDh7PNtlnTFX/CxPtgHbz6rTpMJQG/D23M=;
 b=FefgVOYLqXZTUaTmrcUc52wm19fTpHiPmdmOmtkb5XLFts1M71Mx6iD/3/nYnjrTjg
 KFT+Ws5DEk39v4yrGfz+kvXDcsrnDRKGqBwZCXA0FfW7eYrfVmJIpXG88X8ctf4fyyWn
 IoVxGBs8IeQR+7SOFW00yXtABMoN6YAXVHu7BGGlXZkkV5jsytYTyD0Aunr5nTMj7fVh
 6TPh22TVDE2iQv0AkiKP5bXKzV2i5OSfX1t9jm+eAre0NcWTL93iIhcUDxnipbv8fsiu
 /c3EWLNiiEAHLGg3GiAHOBVSJmsa7jzM9ASw6EXJav0MRKeLdHSGLqJVDlf4URdTSz6T
 o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=liHUuzibAUDh7PNtlnTFX/CxPtgHbz6rTpMJQG/D23M=;
 b=zivAsnlTHvBptN+gzeK/s/eqRhLF7Mm6kNTXJX0dIA2zTUsPMZYSbqnLL0xRop1nOS
 tveKFXB9viK7zbQcCPW2EdAPO8OfRgu9tmtAXGHqiqkON5gV8jknezlcXHveRe/iBIX3
 N16qIimY17CNn26ySAbVodD6BZig+J89WpbWX2ZAmMF8u19jXodyJyreIy2ra98y1rcm
 TSyZpXuMTr7TFRrMHS/+3l0GD6bD0JZYQmcZwnL7Bc27VDUF8c/1itLfS8C+pHX8uA23
 PqMZeWyqXKwkczNxxwY54Ew8+aLKt4WvTe7qJD3FoKefFtTta98Q2E12IiZ1DDagZdQV
 BFFg==
X-Gm-Message-State: AJIora/Br8/PdXGNboA7bDiuIlWWlmacGSvFXwq9Hqbqz99CPDYDehe4
 GBTTl7pAktnGEEe07qM3TXZiKw==
X-Received: by 2002:a17:90b:1651:b0:1ec:f358:3dbd with SMTP id
 il17-20020a17090b165100b001ecf3583dbdmr29206163pjb.157.1656837019037; 
 Sun, 03 Jul 2022 01:30:19 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 57/62] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Sun,  3 Jul 2022 13:54:14 +0530
Message-Id: <20220703082419.770989-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7H2BJe9uiSdV

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f2a421972e..b1a5219aa3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -344,6 +344,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -530,6 +531,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1

