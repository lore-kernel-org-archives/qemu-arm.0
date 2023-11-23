Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp151218ejj;
        Wed, 22 Nov 2023 20:48:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQMZgP1INbLFo1OGAreUyvgUh0Bax0kLvCUKnN72MG51USFE0RvnDH9nT1R9hP8tWtvU/a
X-Received: by 2002:a05:622a:8104:b0:423:7b1e:e252 with SMTP id jx4-20020a05622a810400b004237b1ee252mr3535657qtb.33.1700714903283;
        Wed, 22 Nov 2023 20:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714903; cv=none;
        d=google.com; s=arc-20160816;
        b=UHr++b3FN+CuqskuFd2WpeOGOOYVZnSeWZd8X1sqnSr+ZPThx9lXJqpduRyqAbLVYK
         oteu59iPztukri0YiTSi18STkA+Parkr0reRSV8kecCTfykFlEXep1E7zMS57vWiiF3J
         blwU6tqqWVg2e5oN/2OE2y9+WdzDKvXH3iM8T0p51fy0hIwyvjN9bPFLgx3aHv5a3Rdh
         Vecm8UKknopvuvYi36D++tZDBviDkmbQ+gG1z0bXLbdrMvDOcwqoavZSpqMpOHzBDKM/
         rYEC5UsitFRx28eavWR4oFb9x4aYaHCtFuWiC8L/UoDS3wyZtdno1q/3BE9lc3oollkI
         EL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VkzgPDpougz5Puiw+xECKRO2grc7zzyhXDofA8x6EVo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gN9NW6kBct3Uj8UiCeYfmvV/zmxFzMyRF2SN/FYH6qkYOhGg4GQFaQdUrvBuR+37wH
         cbowLbyJLFjIRD5nK0AMc9C0/2AwmeSQt60XZ05s27NZ8WFcLJPsUxqH8yFMfMXv9Z6r
         GGUlU6mEj3SDREV5D0/b2WJKywM3bsjC/9lD9Y3nutqaATfZOhYQdRU/VT0QKttXSrHf
         zZhVkl1KLyBw5bgBCHIyk/5S1Ro1zgwBqcfBVmcj7kFinnLNvcVnP3/dCRRoowTxhFSZ
         qZiEba4+7Qj2t+uqwpP9QdfzRHfjtv5qoOY9H36sY0GW84A11g96xXrnyEWBfiFgWjVA
         xgag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIsCGMJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a05622a061000b004237399ab9esi442798qta.655.2023.11.22.20.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:48:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIsCGMJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YK-0006bm-FC; Wed, 22 Nov 2023 23:43:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y5-0006Pb-54
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:46 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y0-0006FV-Ly
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:44 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3b842e28917so287694b6e.1
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714559; x=1701319359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkzgPDpougz5Puiw+xECKRO2grc7zzyhXDofA8x6EVo=;
 b=KIsCGMJSLmMU2uh2gWtRGgysQTCHa9m8QvpLIEWYeqXR9IVJRwNqT/eGEoEiMM7wQW
 nsw5K+esvnSmD5rJ8SX+DIAaJaLsNN7C30p3u0O/fniPj+F0srlpIDTe+csmRwnDFfIJ
 bi1jOpO2JdXE0UExME5rCpOLkDasD2eqvJOoUArDZPeV3KcChZCWWbnYBAAghqWtyKEm
 2GGqEcGkTZRXUM3CEWIfe45WUfyyryYoLT+PPxIlszk1qT1SM9ZlT6ozsPUJiNnYnKYR
 iuKcpd1VmcNc3rr9VIs1rdmCL6pygj2HNAod2HvhDAtPJwDD43+y16zljMEo24VIin/0
 qUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714559; x=1701319359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VkzgPDpougz5Puiw+xECKRO2grc7zzyhXDofA8x6EVo=;
 b=NLl5zxAvXQ9uCUoa+wmiQ0Yd4j1ZH1+/xTkBIvIwnxIHMhp3iBs7L/ohoV1Mr7B5Rx
 v6pp6/4YhH+4wFfGZTcCxSPi4fLk3XUraxyfcB+OXK/UEb4vYiT3AB3iWLFNFRoxRl1g
 6498/gu/2UJfNljOJMC1Wpevqyd5Nj4dwbera1aHS2UnFZgcutCg0YzbKSzPb4l3Ktko
 AG061wmX2PlrM37C8byZ+T8WhlY+4TtClfjLWsPnkvuprARS4JizuVfAAQ/qeP2ix+zi
 dz0s+nUVsV0KeyJM6MVwzY8XmQwoIygmbB6ZS9QsqX2DPI/yNhRnB36blWKRvoLbW0Ug
 wZBg==
X-Gm-Message-State: AOJu0Yxn+aOsiw+sIhu4WmvCC6/+MO2/bQSPe0EctwPjNJG9S+mWR7c5
 /7bBHhw3sRnS/8WhxF6hrdSdmA==
X-Received: by 2002:a05:6808:16ab:b0:3a9:cfb5:462a with SMTP id
 bb43-20020a05680816ab00b003a9cfb5462amr5140144oib.36.1700714558778; 
 Wed, 22 Nov 2023 20:42:38 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/21] target/arm/kvm: Unexport kvm_arm_init_cpreg_list
Date: Wed, 22 Nov 2023 22:42:15 -0600
Message-Id: <20231123044219.896776-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: hS17bUOlCebK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 12 ------------
 target/arm/kvm.c     | 10 ++++++++--
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 9b630a1631..350ba6cb96 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -39,18 +39,6 @@
 void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
                              uint64_t attr, int dev_fd, uint64_t addr_ormask);
 
-/**
- * kvm_arm_init_cpreg_list:
- * @cpu: ARMCPU
- *
- * Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
- *
- * Returns: 0 if success, else < 0 error code
- */
-int kvm_arm_init_cpreg_list(ARMCPU *cpu);
-
 /**
  * write_list_to_kvmstate:
  * @cpu: ARMCPU
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 20d8c81667..bc4ba7628b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -789,11 +789,17 @@ static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
     }
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
+/**
+ * kvm_arm_init_cpreg_list:
+ * @cpu: ARMCPU
+ *
+ * Initialize the ARMCPU cpreg list according to the kernel's
  * definition of what CPU registers it knows about (and throw away
  * the previous TCG-created cpreg list).
+ *
+ * Returns: 0 if success, else < 0 error code
  */
-int kvm_arm_init_cpreg_list(ARMCPU *cpu)
+static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
     struct kvm_reg_list rl;
     struct kvm_reg_list *rlp;
-- 
2.34.1

