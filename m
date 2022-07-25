Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1019152lfg;
        Mon, 25 Jul 2022 11:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sg9j5DaA8/JtZVFTW4aOcuOl3dvdZx9sG24kFqf9kcCvf+YE/ZpSn1iRiA+2U4DKROSTe6
X-Received: by 2002:ac8:5a02:0:b0:31f:3761:9dda with SMTP id n2-20020ac85a02000000b0031f37619ddamr5343501qta.158.1658772995081;
        Mon, 25 Jul 2022 11:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658772995; cv=none;
        d=google.com; s=arc-20160816;
        b=onNyEOUFc5K1deQnix2/y3Ag1E7ALYaSvis+/MZRS9xchFf8PtnzODyWPJgN2tTIr6
         ZQZhJjmreBGB2jLHVnT4JhDQLXO61xgi3ALID1mKvEN/PnAF0lJ9eYd+s0EUDcUZNn86
         7LwAWhGl1KHq1JFEzYybSCyByfku0xrC95ZbqYBN06a7k9niOV1QHpQ3s+vkv2oEDtCH
         t4tImZ/C2K1vuc6bsx2Ql3QNF2A/iS1i9Mxpct1tPT8uq/z0RMYGeY9d8FlgK36v2sdt
         lXRhS/hNqxP2rmKZdXQ0S2UZeNnu7PDaLOSAzXZfMPkpxJY5lluErywL1uDVmkrsze4f
         k1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yEs9SFwgwTuqEnbJkZEUd2ZZZGNmQAbrUyEKBuLlY20=;
        b=CSdpn7unYO5LzpWo9soLTsNOsT+y+MmONWPZ4RE4u0KBcidg5REzRRgFYYGuTHtvM2
         /kgkczUir5bA6F6nvc8KpLFP4guU/mlhukOF/CG3g1iNzeeiQuLs79vSxfrKBaWXdqMF
         fZ0x5yPfitKxQzfmvtUhJ2pLQo+UHOrH3LXxHeJEee+3U7Sp49j973/OYUBzxJbnpR5n
         jE+WxNGdQ1O7dqz89wQYCxnSW7k5tWScGVY56VfsAc/dG1MuKm7gNmDVagxCA4DYkLrr
         NZ1cY6hv9WjzBoD/tqbcZoYVPO/p6qmVHtB17jdfXhSqe6wAwtD1tVGAJMfIGq19eMkX
         hG6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9cUo9c6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 82-20020a370b55000000b006b5fdccfe9esi7233632qkl.357.2022.07.25.11.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 11:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9cUo9c6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG2d8-0004pe-IV
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 14:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bm-0004me-Qq
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bk-0005pu-RC
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11045548pjl.0
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEs9SFwgwTuqEnbJkZEUd2ZZZGNmQAbrUyEKBuLlY20=;
 b=E9cUo9c644yNmMSr8+ErgCNlM4ry7ody/uDbFBVCPIaRMhDwEb55p1mrNlIW7Me/Oa
 Zm0dumNVZiFVjjtIc4eeUAp4ytDK0OJmxcVez2CQkkBznkT1RZelCvOJNtWpJe7bu1En
 7TrDIWNhc2g/ttqD15MxHCGfX7Jaci8et8Z7H6HY72Ufi5mElEHxv35ValEb5v/sNcCk
 pFzycWRnmQys6TxPbw/O4azt5G9GoP8yd1jt/UGRxCiBISmxTRStGA6TFS0B6vsUzVYI
 tKZtvdNpwpbcF3m6i8MtRB25yGJh5nZYG1nReMGzbwDCRodBPEZWk9YRMm0k1hAZwzfs
 RFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEs9SFwgwTuqEnbJkZEUd2ZZZGNmQAbrUyEKBuLlY20=;
 b=BhtPv/rTInge6zodcmLSSf1C2i9oVBw2G4h5V24sIunlbPLA8oYv7FplaHvy7mkMku
 3CFJVoRFtDmn48eBGliYpkemNiDEyu9PnGMkgWS1H7wvUBpc//5rTyDqraJhoiuLlxkB
 0ITDTzL4pNu9RMkKElsqwcTxJzMehcc7DOElZGzOzEGOjNrU4S0paxO6RtIdYuIuMUfr
 xwlfzpGdVL/kZ8Vt9HH6iy8VA6uO4wfOcf1tDZYxw5e2DhSbvEpRQZZGYdboRGbpJHH9
 EplAK4/92FyvveMHaiMJVI0UAghiHPfga61rJ3FQDS5hYBY77AH77uZQ8iYNvroq9Hzn
 +GGQ==
X-Gm-Message-State: AJIora9W347o1zasAKOm7/wdJbTLK8XCkwLuOGVlsrX6llc93/h4RS/g
 aGmHaRw3lOScffX73y+nxPvZrg==
X-Received: by 2002:a17:902:7c0d:b0:16d:500b:1255 with SMTP id
 x13-20020a1709027c0d00b0016d500b1255mr12369828pll.98.1658772906915; 
 Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Create kvm_arm_svm_supported
Date: Mon, 25 Jul 2022 11:14:55 -0700
Message-Id: <20220725181457.41083-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: K1yGwb7ZhFvF

Indication for support for SVE will not depend on whether we
perform the query on the main kvm_state or the temp vcpu.
Mirror kvm_arm_pauth_supported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d16d4ea250..36ff20c9e3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -496,6 +496,11 @@ static bool kvm_arm_pauth_supported(void)
             kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
 }
 
+static bool kvm_arm_svm_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -675,7 +680,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    sve_supported = kvm_arm_svm_supported();
 
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-- 
2.34.1

