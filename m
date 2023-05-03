Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652416ejm;
        Wed, 3 May 2023 00:08:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5k1BMSRkYr5N7nA5H8SLohfx5KagasxMq9hHF9lrxD8yG40WGX8BtzFpbF8N3l9UIBVmOB
X-Received: by 2002:ad4:596b:0:b0:61a:ec71:ed9a with SMTP id eq11-20020ad4596b000000b0061aec71ed9amr8571598qvb.30.1683097708150;
        Wed, 03 May 2023 00:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097708; cv=none;
        d=google.com; s=arc-20160816;
        b=tugtq9C9kbdurbHhqjOttrGQsdnbsjifas2J6tPAi6FaqzFbOMvszYu805VCvqFToG
         CCp+EYiNOBdCAIErx8kJ08busC5Q+2WX9Xu2H25vc+8ikSBDLv84w28VDYqH5vWYytLF
         LAMUzjSp0jKbmQwzbvmZfnuiV6BhA6YCjCkSkd5zxkT5HvBfIKWeKYxRRek+wuJ4dk/X
         Lm3V++GVgjGdLXPPeZ2BNHiOCqFQUq362v13N7tIh3Jv7CCwonHrv6/+EyPqebxZwXD6
         te4EEJh42hynU/YL5l0J/HZTlJDLmwAR7ewtfxBt3x2DOPFkkxCjWsB/XpPvsIR0/f+x
         v68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
        b=0WGZ6AzGJpaIcQonJ5pTZfTu+S8KZYTflk9OTdVEZzIoHMoOtMaPudkuhn+gYHTAYo
         U6TUyNn9P5shWWW4D+z7IIzmhG87VsFybbCk3cIrAWLUPe2iZwKYUr70eMClOAQ/MbRc
         YX+HMEQ3hXPjQrq4hC+JR1KRL6yaQ06y/rHsMuTtRQCErx350i/Ek1fTo+SeDjiWQmp2
         F6fvwXFi6OM3Hw9UPvBVltEdcnRfR+/YTSn7tqnRUZBVRJxBe4rihIl3jHQN2EmwK2/8
         cT6a58uQoL4PyMoFYuAfYaTp+KOstGRpKeRdfEgji18jGvZnEIm2uuwk+WbW4N9CrUpS
         BA3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3d17Kvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac85e0f000000b003e380d625casi18914537qtx.782.2023.05.03.00.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3d17Kvu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6b1-0000Ev-18; Wed, 03 May 2023 03:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aP-0006TT-RM
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a1-0005hv-0Z
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so48952905e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097630; x=1685689630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=k3d17Kvueqex9aG45mnR1zw6wt4u+8PpKuHTBDvqvE5W5rOFlfW3s0+gj55SySzoK8
 VLsaXUqX4X+GrAFsRZMgBLCePNTqUt/vOI09X4k8bEiCq5UjxB/+Ae3lQU/3o1GDLmxx
 7ERyNpk9OgtKJNgc2dwjRQbgTrfkeZrRfYJ/5yDQSHiebnO+yVivTOd+vqWPkS3MyeQD
 IBHiAxbQ31lHoyLIoyL5qe556AQeSBF9myL+/UhyQhM6lAmbgxRllkn0OvBWzBQkaJxF
 GuJe0GA4yXXvIpOpF/TXEovAfDlMWNghZXXMn0YcnpBhb2Iqlae6S59XP3TSrW6fpsPy
 Badg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097630; x=1685689630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=enDY4PhKIPeUVBroJBUXZCzr26mF1a5QCmmN+YYfsqHIeZuvPOpQ4xCLgiTl5m6waM
 h7+3XVhNT+zzUp27nvtAd0FP3H5jNU3+oRaE/piOci8JzO3CBobd0Znf7Vx67FeadsnL
 O+ZaMoinzQSNUy7pclsXo5Srvvh/ON1RBxZUKp5yNzuHQp0x87WmUpk8IxaE7RagZjd4
 qOXiWGATf+X0vxjBKFfl6YHuIlSXxqCWqWz0AUvtng7NS4/yiwOkCnBt8/Q6zfiGPvXI
 SW6bH2D6/uQgI/kuWLVfG+Dbsj01gTWnmtcvzKW1zLAMCfLLSp8PYNRMzZyBoT35CHk5
 qrPA==
X-Gm-Message-State: AC+VfDyxzups6JvE3uu72/a+8vhQmnQKXMgfCH11hIP8FmJRC2igUCud
 URiY8N38baGvgCcqSb3oXAUFiQ==
X-Received: by 2002:a05:600c:2195:b0:3f3:295c:58fc with SMTP id
 e21-20020a05600c219500b003f3295c58fcmr11410141wme.39.1683097630679; 
 Wed, 03 May 2023 00:07:10 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 17/57] tcg/aarch64: Detect have_lse, have_lse2 for linux
Date: Wed,  3 May 2023 08:06:16 +0100
Message-Id: <20230503070656.1746170-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: p82LKu5crmfx

Notice when the host has additional atomic instructions.
The new variables will also be used in generated code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +++
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index c0b0f614ba..3c0b0d312d 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -57,6 +57,9 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+extern bool have_lse;
+extern bool have_lse2;
+
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e6636c1f8b..fc551a3d10 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -13,6 +13,9 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#ifdef __linux__
+#include <asm/hwcap.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -71,6 +74,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
+bool have_lse;
+bool have_lse2;
+
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
 
@@ -2899,6 +2905,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
+#ifdef __linux__
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    have_lse = hwcap & HWCAP_ATOMICS;
+    have_lse2 = hwcap & HWCAP_USCAT;
+#endif
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
-- 
2.34.1

