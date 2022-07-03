Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439519lft;
        Sun, 3 Jul 2022 01:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tOsImahmCbqKtNRnBwQ2SN0csY59/iPetouKwkvlp6CK3IyicqeMkRuRrvzxys9XtElSCg
X-Received: by 2002:a81:1d09:0:b0:31c:8d86:a743 with SMTP id d9-20020a811d09000000b0031c8d86a743mr1121046ywd.372.1656837757571;
        Sun, 03 Jul 2022 01:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837757; cv=none;
        d=google.com; s=arc-20160816;
        b=H+RDBywTwwr60nRXXtqAldeuUTjJhylNt2iuTgARUNd5F3LbpG6/J9IXRvIJ6qzJXx
         tihV5Pfr1VuD4iXH6pAefDtuVxYQ0I5hQtetCFDAwBTWhsvr1liwohw2dp71U9iJTFRG
         3YefDrPCz+WdLHGStOTwhG15Jopo4DX3Nx3fCJoLtN6hrMqZ0/2KawRUWzQAiDpogahX
         rOUpmg0k75SciduppkpjV7YNyzC6T+HGSNj7TIrrx/gijiLA2ATUHDzUyfcyY4GrQ/Si
         WM650RpZPhGEXiMBhQ1xIpSEwtjYmdZ56Vgb1Caqtq7+fpWgS9L/sPy5knQz7vUZddk/
         1nHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f33EhXDWkHjxsmDh1J20IKySocqOzXPOfiocCVykyDU=;
        b=bzydYig9P2yTJAAACyGYthjb+0n5dKkBzjWqCfpWGLqmt8djAPbQQ15XmWHLCFbmNC
         HSma3lKIGQGthxzzfKkPA0CxAXVUQQ/yT0dSr6VgHGFYZHbyFrC0s65SfPYrqkShgwAo
         wWJDqWnsUGXhUwmHz2W66MT0kDj2vCHSk7ifc3AUSZpCv7MJHmbodmjwJ0NDXEYmiSWi
         KEsMWBXQ8fkDDRYcGQoiYFqC4Ch+r0KD3dk4iv6TavNIp9wpK7MnKBtVqrkL1Fm5JHU4
         8WsRDjh/hRn3P5euQoH4nuDZdDLLk7ilUAFtQZhCs494338unWc8SNUIfrpfv+F883+1
         m8BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lq70iUy0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020a811514000000b0031c86b2dc14si2940217ywv.192.2022.07.03.01.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lq70iUy0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vBd-0004Qi-01
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvO-0008F8-N6
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvN-0006Ci-3T
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso1074692pjb.1
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f33EhXDWkHjxsmDh1J20IKySocqOzXPOfiocCVykyDU=;
 b=lq70iUy0Hv805W0w2eGiA/Irj3gUkmwej/K2uc+xXgnnvDpeUPd8o5B2Umnl+u8pZH
 NWHXfIrIfDBD3JT+sC2gI0zdNiKXMnPT0Hi2EEhIxLWZs7Eh/XFPLvy10SOdM0m5PgvF
 vqJbFd0A9UKi1nUgtWOGf/IWQe8VZ65s0l4rlK6tIDWMqdNEvNy69P/J+4Ez+GoIuJh5
 O+Vkc/If2uCaa3NC56ZWla+4HOym+Q8Z7u6Od3d0dv3nZcCkhitTta59ARq4YPTXzpVs
 RLzESkKmyQYVckKjrZ6IVty2k5RiqzgsR/Qmoy6oVMlFNjFZqxfxXGadaeotffTqlvrN
 5tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f33EhXDWkHjxsmDh1J20IKySocqOzXPOfiocCVykyDU=;
 b=gTpjUeMo8TwR768T7mDqOFPKQxFx5OhI578K1AndntLANehrhQtC0mfKdyIDKxS0Ni
 WozYSt+jpoaBWcrN3I3YHCjaNI7vSyxU8hQ8dL6G2hRtOzclvbocc0E7BR2BxF5OX48t
 O2G7ZYmC3OP41TzLpIHHk83baHLfgyAxYFQX2Jxe0MNolkdYcPTblI5VTEbRZs9xkmGj
 Vue4jRgQ62lhs79OUVlxemwYGooYishbe0JAKDtW9XZq4QosGKCvSW1xlurbZXiDtobK
 vlK38yZbxPfrhzOQekKJSCyNveLIb0XA82h2rkzUHh0OrIOn2NKFJS8f9Vi+YW5Ud0X1
 6+2w==
X-Gm-Message-State: AJIora9OQ7JAIvoj/MDmrEGX+BJGSchU5YRUPD/xo8PBKY+I8Q/WUoNI
 GJ3HClxyVlyJrcEVvg+FIedM6A==
X-Received: by 2002:a17:90b:35c9:b0:1ef:2242:1838 with SMTP id
 nb9-20020a17090b35c900b001ef22421838mr25799849pjb.114.1656836747834; 
 Sun, 03 Jul 2022 01:25:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
Date: Sun,  3 Jul 2022 13:53:44 +0530
Message-Id: <20220703082419.770989-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: eec2URGF6mML

Remove the use of regime_is_secure from get_phys_addr_pmsav5.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8313a2d74a..340f73997a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1346,13 +1346,12 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool is_secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
     uint32_t mask;
     uint32_t base;
-    bool is_secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
@@ -2417,7 +2416,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1

