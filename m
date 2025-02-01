Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143053njb;
        Sat, 1 Feb 2025 08:43:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVI98bsWAWl7/V4yPQkyfoud9DkXZqPR5ch+ZJNbuRkauIBP85Tnda7AZjkhNOYGqF309687w2zpRS9GQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG8U4/n9lIGzobafvwhKJZi/a4T4TAC5KEf8DQZHHCGsLD9AaDZa8/5CGZeXKHT1RhfPqo8
X-Received: by 2002:a05:620a:19a1:b0:7b1:4ddc:165d with SMTP id af79cd13be357-7bffccdd278mr2463644285a.13.1738428187858;
        Sat, 01 Feb 2025 08:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428187; cv=none;
        d=google.com; s=arc-20240605;
        b=G1tI9jH80kO4qExS0CZ27sjNAgbwFdFl907XRhYLkNcvcWnfXPUv65i2UbNgxinWcE
         4ypgZNWrrMu610YXt2JazLoYcfxedV8HDNdjNERrBkz7yDXKmo/GIijfzLJacxnJE+GW
         3NDKkOFfZ7Mx6hlvWdsXLa9qJ8+jVaA/cuSoDAFOln5XSrogL4PERXpLZHVWbdFVZDC0
         i3lUlDU9DDeai3LcuXdfD6b4FFo+6Lqxsz+jiGJyQxTy58TdO1Lpm532YmQVDOlJUtRO
         DBMrDcG1xVA1DErrIlxvrqnsfAXhL5n508Xkee5xSYDkoUydOyz+LxKVz7Nu8JngX8Nv
         LDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yh1n6FmEPulTUWbKWOS6FNq8sYNNIAAaiYa9QDAAcD0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=eh3R5wdWSHC7jCSolZz77k8ydscj5dHZixRVo8sdMXOW8Y/ke1NhwJK0qyuhA8tx6z
         IMm4Dvas1ai7qAncHarUVpJEwAk0aELnJ8/7KXbICHeCI3alt3XLTxdCSDUFQOeAa7Ad
         VmXsURn/3W2dM+mBlv4PRcda1LQHWfLGIm/8Ua2gc28JWIlqEvfQgTWtGBpEgaX7b/CJ
         CD2JW4Qiuq09pizVv7XZqPdQa61i46sAm3GdGqYLVrtXumUP6ZdtUjWRG9FgNDx6bxGf
         QSZ8GptFvhVQ5hkSxhBHxnDLRuRgnzBGP1DZvevf1IwrhNdHGX04mrRohjNd0GaigDlT
         +H2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wIQVascc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a9040b4si598422085a.248.2025.02.01.08.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wIQVascc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGZM-0001gU-Ds; Sat, 01 Feb 2025 11:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYv-0007f7-Fw
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYt-0001Ol-RG
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso31081665e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428098; x=1739032898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Yh1n6FmEPulTUWbKWOS6FNq8sYNNIAAaiYa9QDAAcD0=;
 b=wIQVascc+hbeUlYIh1FvLwQIw1eHAwVxdYYsi7cePHqPd4ketUfJ9SKqZbnEx8dOeB
 JF/EXfxcuqiExczN9acXtlm9qzYYikbmE7yubuputB9VynE9yzzhCZulFbdK8/I2bIdi
 4VoeOJm+M/d+5fmSuehTpGJF4vgZZyXDMPXzLwv/1N0F1fOy8lon8LaqbdUincgeZSHr
 HAXvwQQVX+8o84Hncf/gWahWbIKYmKrgPnSHFscuPZxbKpjtaLv+16uAqkDOq4kd/mNt
 ixYAp7O2ztGt2zaEE+prQ31343uPQPVaTx0kLToPUqNyUjA++MgjEWMkuQP60lhr5AIl
 wPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428098; x=1739032898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yh1n6FmEPulTUWbKWOS6FNq8sYNNIAAaiYa9QDAAcD0=;
 b=k11ORHWTsees6nOnvZ70BBHRWOwbynUhKxVcKiblOSESWwQtNpwarCOr+vf3RkMkyt
 a5PhEnHrRmNAeYxXh6sr8j5Mi6uySaIjkhKE0M5Veaco++SXhZ6+xR2TxlFFpLf6Fyax
 TO7IIlbDOR6ZT8AtftB2p+jsneAhzqBeIWpDjfaYf79xEYtJE6gd+cmfqQMGnpR7y9ST
 QbKZvBVnF5WEEwAogKEovXMApBBNYE6DkPPVWuYSLVmFBqAJsi5YxeSsRD7HZi3nCVYF
 uTUTnuRCsEIMLrNy0s1Sp42f2a3umF7rVgpzqYeU//rexDZ/YvDTadwqTo6fxOgztwGi
 3T8g==
X-Gm-Message-State: AOJu0Ywc+6dzH/GMLjAg52bsQea0G1vplquUypbgsECW1Bh0tj9z6OBK
 w+TsMFJ9Wf01vpbtaJPoDhgoGCu04p6TpEsgxY3petBkHelEXZU8eAEx11xApoAYP8kYAlHn0A+
 d
X-Gm-Gg: ASbGncu4Lgc9IQeB3Gl0qTztx5dYcPycxWQ/ccMdL+UC2zIm9x9W8VX2bUMegiOCI40
 OwxL8fifnFIr9A3DIQgiGJ3EiQ1nZSOAe9M0FGDT3HPneUN+J02FlSXWOE42alcs9LmFrpk4BUo
 fi19/iL31Jlkt14lLJN68I7KmyDOf4WgDR1hGLFSxaprig25oP+P2ywIbSboupvYEP/MbTbVVGf
 n7yWaYeToc9BEv55RORkGVqwqOuiycRiia9hwl8hgtOMZVrPoZH43gspFpZkrowEK/V86GUMzFN
 EdCnQyAJe3pBtCPkMk3c
X-Received: by 2002:a05:600c:35d1:b0:436:fb9e:26c with SMTP id
 5b1f17b1804b1-438dc3cb50fmr138595475e9.17.1738428098436; 
 Sat, 01 Feb 2025 08:41:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 67/69] target/arm: Simplify DO_VFP_cmp in vfp_helper.c
Date: Sat,  1 Feb 2025 16:40:10 +0000
Message-Id: <20250201164012.1660228-68-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: MvyJu9v8Hjk3

From: Richard Henderson <richard.henderson@linaro.org>

Pass ARMFPStatusFlavour index instead of fp_status[FOO].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20250129013857.135256-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index dd3f868a16e..ff4b25bf280 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -489,16 +489,16 @@ static void softfloat_to_vfp_compare(CPUARMState *env, FloatRelation cmp)
 void VFP_HELPER(cmp, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env)  \
 { \
     softfloat_to_vfp_compare(env, \
-        FLOATTYPE ## _compare_quiet(a, b, &env->vfp.FPST)); \
+        FLOATTYPE ## _compare_quiet(a, b, &env->vfp.fp_status[FPST])); \
 } \
 void VFP_HELPER(cmpe, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env) \
 { \
     softfloat_to_vfp_compare(env, \
-        FLOATTYPE ## _compare(a, b, &env->vfp.FPST)); \
+        FLOATTYPE ## _compare(a, b, &env->vfp.fp_status[FPST])); \
 }
-DO_VFP_cmp(h, float16, dh_ctype_f16, fp_status[FPST_A32_F16])
-DO_VFP_cmp(s, float32, float32, fp_status[FPST_A32])
-DO_VFP_cmp(d, float64, float64, fp_status[FPST_A32])
+DO_VFP_cmp(h, float16, dh_ctype_f16, FPST_A32_F16)
+DO_VFP_cmp(s, float32, float32, FPST_A32)
+DO_VFP_cmp(d, float64, float64, FPST_A32)
 #undef DO_VFP_cmp
 
 /* Integer to float and float to integer conversions */
-- 
2.34.1

