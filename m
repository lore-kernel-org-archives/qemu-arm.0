Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2655494ejm;
        Wed, 3 May 2023 00:15:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47Gr9JxPdKCVR1LsNyDtgLqqAvHNumo+kd+pLdfvfoKcle1uXDBL8z3YQDLABtI9N6bST7
X-Received: by 2002:a05:6214:2689:b0:615:a787:6d31 with SMTP id gm9-20020a056214268900b00615a7876d31mr8687384qvb.38.1683098125145;
        Wed, 03 May 2023 00:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098125; cv=none;
        d=google.com; s=arc-20160816;
        b=eA2S/pgO0Akd+zOLhJp4WcWuWBGOswYsNJwAzWFzwCjGVso+/stScbTtRFHFHUKoml
         03zGODGsuy1ShY7Ahmtym60Lw28gEMN9JNtqeH+nYNYBeZf88w7B+JtrB3M3GG6Q1vsg
         BIEEmPdpQoaM5OKDOkkY356Tv2MWZ5rUmkQfdhUAyhU8Ui6fWaG65u4g+KDM9I+pjWqj
         c4qnVM99Sbbl7QpiDhztIJAIyoXNAsLwMCRmA0mUqKzzGfawQ5OoWh0sB1XMhJ1N/epT
         5hH4VNnOstyOw9M32E4LOi/84/DkpnHrEItQ2n1Vt4d3NCuY3eLHX5kUbr44EqpVBMf0
         VtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
        b=DeY3nkvbOQSwli4kmhts3nP9+RH2x3rmy0/IV3h8ry9Jp0ufi0LvM5XklvQEvNH+vU
         lXuBedGOYHWcGKf/VfzLRTp2QUXB5holD66bW7w3j+ciFYUGaN5OlACxTrsxQhhbDwko
         XGN8DxDei+Zl1mITpo1PMYTJaNfiBhuUgDkxMWHHetij48JPifStnz86vFQYbM9d4g19
         mLAP1wEFuqwGZcDEyQaKQGEvGFtCAi3MFkvuOL+NCJ6d6e/WP1ZeFh9Zl3T/FSE1VnTn
         lDeicBHPTdtMZbJvEXBpAY2xuuAaCwPlbFXIG/S1xfzbx60Zri5fEs95omCcZILgY2/I
         W3Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CO0Sw3lt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im3-20020a056214246300b0060651039cc6si8585169qvb.587.2023.05.03.00.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:15:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CO0Sw3lt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bp-0004wd-PE; Wed, 03 May 2023 03:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ap-0008Lh-1r
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005qM-PK
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:08:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso47410935e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=CO0Sw3ltI+LRP4jx8Sqcg7I/yQ9ZmMrVpTIL7MErWesdzwUdYs8CFLkEwMpecXxhgL
 hW6J1wQrEAHyIDwYHd+UMWEqR691ODuMDVugiZTf3v1mz+tU3k46xGq/xsswx8XOTK4s
 F869utksGgjQDdnKRb8HTgml/Dgj+RJnBhcuujUBc7ioIIdeIbm3vsoEapBuWZbnGCu4
 n2C/ln00C+GetzoLzEYzS6FtNT3Q+wgZq3QaLlnBawcL8sTM0XqM7tYcJTlLa/y92ppU
 2Jn8k1tpbmMZeDrJENpog13oTS0wNLcfgaPVRaIBWZohvuD30aw3O8Dg6knSNbsR0taZ
 d7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097645; x=1685689645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=XH4gtly/h/lv8SAi+gcRQuPht7xSuuDAev7sIop5Ah6Eb3waWu3XThLhyNtnAMbk6u
 yeFAFDC1yGYPgJsIUum8jkNnKS4KAY1H2FdZJssDuqeBiLH59SFWx49QQL2ykK8+Bs17
 0UoS6N8PPQ78h2Ab/BXFxklfkpLlJmQkHGTxu4ulnGgJqVZTvaCWP+O2CyDJD6sz68R1
 rVymzw3Zv3r88L0slxSKigNhLMABAydSG9ErMFCbkGWU8LYBQaRauc9sK05h1lgzTwzA
 Ak2wuCMgP5u7IHlGX4OBYLReRBj2WGLEbOpfk2wDypFbbEHsx2cNAY5aOPWW2KlFVR4E
 yVoQ==
X-Gm-Message-State: AC+VfDxsTFS5RlnoNaD/Qtm/HNdN/TWwhsTaV8wiL2QfAK+Qyx6PhqYx
 MnGOsnJ6SQFjB4dxJKJifSQdB2d0yXHR5iKBthlQcQ==
X-Received: by 2002:a1c:7502:0:b0:3ee:36f:3485 with SMTP id
 o2-20020a1c7502000000b003ee036f3485mr14848011wmc.8.1683097644870; 
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Wed,  3 May 2023 08:06:35 +0100
Message-Id: <20230503070656.1746170-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CJq1qKyQy/Sj

This should be true of all server class loongarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e651ec5c71..ccc13ffdb4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -30,6 +30,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
@@ -1674,6 +1675,11 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    /* All server class loongarch have UAL; only embedded do not. */
+    assert(hwcap & HWCAP_LOONGARCH_UAL);
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
-- 
2.34.1

