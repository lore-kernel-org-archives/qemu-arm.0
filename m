Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3722923ejm;
        Tue, 25 Apr 2023 12:47:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350bqvrQAVTjK2A+m3iBwOlSx/8AeXAXcRnSj1t3GEiJ1+kWDRqE0VGnhonv6vO9B0dBLftJP
X-Received: by 2002:a05:622a:198f:b0:3ef:3960:a1b4 with SMTP id u15-20020a05622a198f00b003ef3960a1b4mr27820515qtc.10.1682452060922;
        Tue, 25 Apr 2023 12:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452060; cv=none;
        d=google.com; s=arc-20160816;
        b=cYhYu2tvUeVXtypf9y1MyKy9BaUAykUj+CyO/iZU9XLozxP2PdOxgoXbdCQGl6NsKh
         Aur6u+HO9Db/xzm4wttD5Dz6rhaCat37vHMBW+X7nkeRU6LC0OzZ1Tcs58EOyscxfkmn
         +2r++FvYQiNdKYaApsLRpsj4Muq+B4c2k5nYYP/HUMfPoghq6MHhGbcqFmg16nIqkimi
         QcrvURG1M2p/BmBEEIgV6F0oe13hKn97MUEGOA6y1mWEIlHx9mssklyQ8jidDMFKr5OT
         XVeZWalDrXrG4Rmtv1SiJ48+rrdZr6IvZZ2rOsS0QJBiRtIvnbt60W9V9PqjSiAHVMV6
         JQNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
        b=0yDzCKqC+vACESLRMTY8331zhJQWi9a17ojN1op1Os4NtfqxA0dNpT6kXl4neKJhQt
         o+MQNkcKborZXeCP+V77Fbtkb3hYvM3a3I2pX9iqDh+tENV+8LLu85o64VeEzTrxnYzX
         ysMte1lKVotfkiHMCrwZAeGbxStRKCU+Dd4hPxuSp982jZ9Oe1cfV0+VR81b1mzOtggs
         9uoS2MjCwxvR8B5HbSxF9lzwdk+PJq7pIsvr4ZYjyb7UDkOO8uJXAMIKa8vdrXz4Mphi
         AP7pMAdBQRM3MGrs4ovcJvw2/ddTgKvbub35LwGxBkvXmfuWuGE18mm19gh1hQQSeJcX
         rIIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jY9Pccdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj13-20020a05620a190d00b0074fc523b35dsi1053012qkb.311.2023.04.25.12.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jY9Pccdy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prORz-0005mE-G5; Tue, 25 Apr 2023 15:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORl-0005c0-5Y
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:29 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORQ-0005NI-Dm
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:28 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4eff055d4d3so3380819e87.3
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451307; x=1685043307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=jY9PccdyiHArO3/JJSCICJ7FGAdsOcrBmmU33RDGy7T3AeAsX3mCVdJYeUHy052XTT
 FXFJ1d4O7nCxSQCJFC3BMWdxW/D07gQEnomYuof4BHfOriO25C7GurU1Rjo5gi6KzoZF
 IhIEEdPgF823nEyzy2LX9rYKaoJMtXWGPO1so+BqeX+x56jAXG0w7Dz7KqI+wdKSupwF
 NtVkltM8XWCQ3bXiUdEm7UCNGNGBvOZ2OGnH8CoLNg6EnWMqXJlZmxp/hp6MVZ0HOUPv
 7DutXNFNajw+SHefo8lE4zbiapraLb0hEosaF0Fw+hIc9eHWDS9cXIzGviPHkTuGqAwA
 vmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451307; x=1685043307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=POrBjrf4gh+nYc2+7ZooHA4s9y4hR7rM7vWB2912lD4iuRshWBYuWdObbIWsz9bVri
 F5kqhwaXrVe2fZM7aZO7AN7KOH4A8+ONwwoeB1jFAHTy6nZP66cBSnCdwoA5B2XRsY9Z
 q6R1XtkMQIhQJMFgHA7mm6z1D83WWXcBpQCU31/NLFeE5pB6pb4aQ7ztKa6voXMq8/gT
 737RYvLVx5tjwT6mn+elEiVuH7FUSSePc6F/LiuyVRigU1H0mXDWbEPq2965rAGYVrL+
 u0kxVpPUUaMwvrwjibHHZ3+UGVf/kBKMwtz4zsCpaIyV90nsMDxH6f2iuMOr0Byqb3NK
 6sAg==
X-Gm-Message-State: AAQBX9fbCYWqYN2moK+1BZte05bt+EIsO27XTKrCGIgk7ncxdYJbYs4K
 6VKmUxAhCaKSylunqhh2gnUT4w==
X-Received: by 2002:a05:6512:374b:b0:4b6:eca8:f6ca with SMTP id
 a11-20020a056512374b00b004b6eca8f6camr5131335lfs.67.1682451306802; 
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Tue, 25 Apr 2023 20:31:25 +0100
Message-Id: <20230425193146.2106111-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rifYlkO9slkf

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

