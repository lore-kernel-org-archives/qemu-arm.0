Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2444823lft;
        Sun, 3 Jul 2022 01:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sepp+Nfb3YYfY8Q1GVEeX/NbVdsxc/pVY6aeV4k/CaDM4sOhJ+yzDfqr0FxF7aruMkqYlp
X-Received: by 2002:a81:854:0:b0:31c:85bf:2fca with SMTP id 81-20020a810854000000b0031c85bf2fcamr4752648ywi.359.1656838697935;
        Sun, 03 Jul 2022 01:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656838697; cv=none;
        d=google.com; s=arc-20160816;
        b=MoKzRaHWb4C+10G6Tij1LLgf3jaxCooh/3Yl8ewQMTU+Y2DOZ47iY8F6Qadft/V9yH
         2QPZ3igGiQ2dF3EX7L5Mj8FJ5uAofxk7fYFI9n8IX3Q9bapkmwTdBQMHnCZsfhHGyxXW
         YN4PI/vLvaT6Hv1c+0ZX/i9HnxcMbrmZoiA1kmGxCSzJmXmB/xbs7uJIMolkTc3Jxf4L
         ffiK4J06bKRsRP8YGEW5xXCdChRUNnod7ucH/+heFqAkKwvlaEkksY2+TEEDlgQzsAzG
         FkxMZ+Lf2cYZfxSNRLEykO/bavcXGOts/H57TQK4yODLtOlLh8Yt0JG3m4Ws2exN5rnS
         X7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UJliRv7SE0glwKqdJ6L5blCFVHOfbsAKHLHPwEgHUps=;
        b=FzQeg51ap9/q51mWOOBTTB+4FlRxtEH8iDMTK/hnnp10uJwaihAqPNnQ+AwIJt/fO9
         bbiD4DPC9XoYo8IXuuY40FuEx4BlEB965pYq0MrP5eh0zVbFeCGV1Kicy0YSG4nm+WiP
         HRwuyncEwQPiAlW6G9/K2AlDAU6LXg71PReJg9+vXw64+OuA+jXcgAhXM3hv3s4E5Uls
         0RLwFfu/v2vl6w0L5+yu9PFopD14lL6sCvt9LeNln093z7YWc9LXhNMMNGLgkrBoGq7E
         lFH4dxkXmWU9GmSRuFIUAlPHpH41Rkgn4ToSXz/SAes9TmDxpVYiH4Fwlvw/+1lajBS7
         Zqew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U+j9d/Xo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128-20020a250c86000000b0066e189f7b75si4885564ybm.258.2022.07.03.01.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U+j9d/Xo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vQn-0000GO-9E
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uva-0000bE-Is
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:26:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvY-0006ES-TM
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:26:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso1389228pjo.0
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJliRv7SE0glwKqdJ6L5blCFVHOfbsAKHLHPwEgHUps=;
 b=U+j9d/XoNpX5IrAE4k0QnuMu9bEypcuS09wIlA1dnUU8ow8Ri7bwG3WuhU1bzcBQEY
 tjlgsYq+r9uqvY0VOqMUbeQw4ukl/+AxMYJct+2MncLKrZ/fWP1LPiY42oN1xLKP3WP3
 Sxh8JQcy4SvCu/BGlgG7T9PUBgXgKrg4h3QtM0y9kFn4+5H3euDRSwDuNQdDHA41pjLz
 9buNLkGUm7dqFbLYxdmEZJK9as4lagEul1vDaFdIrY/ta5s/JTPabCa+Pr042BKDbGjp
 j2H4jY1ngYZR7i0SWlxzwL9BxJTReOO6nu5029sXPKBeKqtgErzP+jDIUHZ4y2KH7+kB
 zgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJliRv7SE0glwKqdJ6L5blCFVHOfbsAKHLHPwEgHUps=;
 b=ROJ11wMpxgIk1pTjcBuKx0j8AGDSrie/JC8SjSg+XK60SrIZu0bDKlUwNCv9kPeq8S
 mel8vsw/1zpjE7o1trhM8tMgwOukEUSpN1NbB6bcOoGF4SIpDUsnwMYIdbKVXm4BqjC/
 ZzS2jkhi3IRS6l2CflIvKSiKn8BMDEjazdPoYbbEj31XGCFfYL/gXeFC0KRxp1t3kipH
 +estTPLXeR+cLaeXTyu4tPtAlMyvNKc5OtXJEXFJOn+yLdtD16tZmYmWjHr2gesgil+c
 6B/a/xlHn9rxKYrsEj/1YsP2Gpfn3B1PNfscW/G3N+vFGO6LL/VoCE014FDI5+bkTmgO
 bTHQ==
X-Gm-Message-State: AJIora/93mzZOYDjIuGhZH1jy3wP7TEngn77ZfCHKlAJ521w/MfvyAXE
 DXFc5O1NPamXrqSrMJlnS65EUQ==
X-Received: by 2002:a17:90a:5101:b0:1ef:7fbb:7a22 with SMTP id
 t1-20020a17090a510100b001ef7fbb7a22mr2806355pjh.24.1656836759719; 
 Sun, 03 Jul 2022 01:25:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 31/62] target/arm: Merge regime_is_secure into get_phys_addr
Date: Sun,  3 Jul 2022 13:53:48 +0530
Message-Id: <20220703082419.770989-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 35rr3KyozHhE

This is the last use of regime_is_secure; remove it
entirely before changing the layout of ARMMMUIdx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 42 ----------------------------------------
 target/arm/ptw.c       | 44 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 81c386ee15..d7062c6503 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -676,48 +676,6 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b25e3a8c87..a7c0d616a0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2515,9 +2515,49 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
+    bool is_secure;
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+        is_secure = false;
+        break;
+    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        is_secure = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     regime_is_secure(env, mmu_idx),
-                                     result, fi);
+                                     is_secure, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.34.1

