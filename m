Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3723558ejm;
        Tue, 25 Apr 2023 12:49:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0f8Xh51AhFXWQakZCT394xehbBQjQpacVg5JvccyqM4sVyEqnS2BU/SIE2YvvDzCSaR0j
X-Received: by 2002:a05:6214:124c:b0:5cd:1adc:30e2 with SMTP id r12-20020a056214124c00b005cd1adc30e2mr32462715qvv.11.1682452158195;
        Tue, 25 Apr 2023 12:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452158; cv=none;
        d=google.com; s=arc-20160816;
        b=iYlHwdI06ZVmWObWerqRcv0crMcTfhPkF7TjqZxymyXUMPDPFgnjmMRxfFvxH3G6FN
         UODanU6lTnL16P25dW2mzaLWSAFN/B1M43fKKYnBm5qQmM/4Kdazr22ZKWDCgIAqSRvc
         JtVVDEiOPgt77qPeASBRwDpuTbmJReRAGPfUoaDON5Q2lFwdbMF7ds5N56NWMBolgXR4
         c22KoDUn2NmXKe+MRcORllLF2LyJyuQkzEJUgBENXeZis/Sozq56GkXHDyE9mllCNdvK
         kFC2UHvdV17+T5mc6b4KqDW1Lwv1R9T52Nfv2Ck4ScZtjlo7jpQ2595YYOdsiaOKzw53
         KIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
        b=AIv9kGAaBIOHk9LyE1fTXQZfwSuwMHxcq1jj1MeYsmSyvAXH//z8PBx010Kdh/dJjE
         9Nrg6bc6fh+aQlS7wFN+tEQTap8UbCw1pNVtiBAkq52FJTw7Ru+xGgaetZiEfcXbfAO5
         mN+I5JAU2khrvCPOxRg0422/SbjDBjh54cmrZP30GHWJkB//VqXjAQdstxD/g0h9MvHW
         /qbfD4+UnBGReWceR2Prdv0QwSvAgcJhZVvSEqP0305QJvyYungBZsw0YvsBQMRDZijG
         U5Qxca1UWDWeanappcpKnS0SZroLUPPkzR8tTujU17+lN03Ihety9BmsIJGXMkY0VIrx
         33AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/zlNyC8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js4-20020a0562142aa400b005e1ff013f8csi9271956qvb.204.2023.04.25.12.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/zlNyC8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOQl-0003dy-RJ; Tue, 25 Apr 2023 15:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQe-0003Un-BN
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:21 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQO-0004cM-EM
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:19 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a8b3ecf59fso60903221fa.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451243; x=1685043243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=R/zlNyC8qxd196HlYiCC9/vwJTwepJoGZsPEFWSQ5HQyVKdlmNGasKcgnbJvBFvx0E
 b2l6ViMUKHLPU2tLs/+Z+eXPdMcmyC9k+hqYZci9ytdQhscf7dimLEks12eqeDkAc6IU
 sgkZ10yN276J6NamTcDCiBq+mOurj+GbPX7MwwBIPVV+vJOoGNUxQRBKT+YNgyUMvEtu
 5Az8E6sHM0fIAH28J5E0ExKaeia2uBLBQU5HgykUOd47xn/EU79RFxSc3qgNwgGnKO/A
 JjtyiaTrvuIPauaTG2H+IfZTHr9mjyO0h6q70FaVI6pB+J5ns78czZxjtDZWX7piLDWS
 zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451243; x=1685043243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fOANmGOo5iyv6fa4+ddDWc+mmS1WoR4SXYoPSJOnShA=;
 b=AYlpI81ZexXrtlowZSvLT43eHVm+1ujOR2ft5KjPf1ZvRDhbTSJpgdaQtYBMtpuaFR
 JdYzxySb+onG0IgyY2gdtzuBAzF6qbMT67+M/Ep3l6Fo/4gFLEr55IhmHjTiVk4nGqNv
 pT0eL9tUwOuJe7Leo2O0cbxjwuAIp0YnyHJs3ijtfwjVq5iPrS/SwfwIHgYQMWLBudI2
 r2V5UdDFNp8sIMntk3Yibp5mAU7G65x7O8l2bGcZZfHsyHN+PRNdXPRFZMNhItlaF4Wm
 PbZNnUx/78uVU5hSzMVIQRbR6YiFDjJE0C+NPYsFy9O4f8fRsSl9euzSmOgrPJWsrWOI
 z4oA==
X-Gm-Message-State: AAQBX9fUSV5nHut1ypPlQezJBDvro3dleXyUa1KiaMah3s0HTM5CbC0G
 d59+WCT2ygTT392y73/63T7myQ==
X-Received: by 2002:a05:651c:40e:b0:2a7:a779:eae4 with SMTP id
 14-20020a05651c040e00b002a7a779eae4mr3738988lja.9.1682451243658; 
 Tue, 25 Apr 2023 12:34:03 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 17/57] tcg/aarch64: Detect have_lse, have_lse2 for linux
Date: Tue, 25 Apr 2023 20:31:06 +0100
Message-Id: <20230425193146.2106111-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: Oiy0m7i1/Nof

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

