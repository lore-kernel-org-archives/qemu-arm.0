Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149813ejj;
        Wed, 22 Nov 2023 20:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ3stBCAKRvojIax4ch/QXypraIoiynNrKid9WFqO8PxN65LKFP6W/5LCZTrLq3VW8HYQH
X-Received: by 2002:a05:620a:8d4:b0:775:93aa:cb91 with SMTP id z20-20020a05620a08d400b0077593aacb91mr4561401qkz.35.1700714631858;
        Wed, 22 Nov 2023 20:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714631; cv=none;
        d=google.com; s=arc-20160816;
        b=u7/yBTIOFp/TOfxoLp/lmF4VfgxmkP1cjVZRDCUCia//XfpEgjEViR7XuDamnFnBiQ
         azEUuKukCW1neqmzW+ZSDvQe5QZbo5jPcXkgKkW05myFe6TM5cohDqYEvZWxigrJHugT
         uDeDaWGXA5Dt55WsUvzVhWY430LhppwvAxcnfJzTJL1w+hKRHN3aTRBiJdWK5cBZagT5
         NYO8v2oYujJ0uZRL75JFjOeuJWrTu7QjVpUtUCHYeCvixIANDDDJQlQUk//o+bi2xTCE
         4duR8ZSrAwtqkBCl342dEaFjWKpSMS6ET6Hq6dx1QZkqmfnFtEpWyz1vnmlju3BxKMsV
         mouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EiNpx4DVO1rGLOpbcBfDBEuJhBAvBoc+N7iWO5VmOEE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=j0+EP1HLMM0TIKQV8qinoTBM0UIZ1V9oqSmRgpWn3kuqdErTtT37bJLaQ5tAAWgbRG
         e3Wlovs5cDfUuZ9UzxKNd/fZV7dJNJgo6Lay6Q9we0WVIPTGe7R1YBuTGD+tRvjGdpfX
         H8An7WmTsY8agrdwpmxbcuvy1E00W35LBNHqIMSsunlzifsPKio3QgHW7E6+DppxgN7a
         4IW/xX+4TlWYMQ7GeHAAF3APQZKUAYxzFDO795GpDDu0OxrIv7ATC/f7xJpw7NKnnz2J
         2FBRTetFZtdSRBGs6XmQhb7PcjGkN8LSq+YUjMPeQyvaUAfp4bAvMOnVdXzrfAExZlK5
         tzhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NTwJuNk/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pb13-20020a05620a838d00b0077bc86c43dasi399668qkn.762.2023.11.22.20.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NTwJuNk/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YJ-0006bE-Ng; Wed, 22 Nov 2023 23:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xw-0006Nq-Vh
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:38 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xs-00068n-Rp
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:35 -0500
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3b52360cdf0so282925b6e.2
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714549; x=1701319349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EiNpx4DVO1rGLOpbcBfDBEuJhBAvBoc+N7iWO5VmOEE=;
 b=NTwJuNk/9NzC+EtIXoKWKaROf69Iqf2dmtqUG7X7AdzRZaI5lg3QwOKUonvPUvLajO
 GpiDQUKfkGswrOv1VkovgAPA7mmFgzcBtu2hbGaMkwDKUoa6lMvZTANJcW10SSh41eTD
 1wMuDxG9cwTFG/oBGydqQ51Gnnw8ESPc78dQB+RSwVU+GgnvW+25+ZRrbDXoJPglHPq9
 PNJOXB4HPjOhplVk3fLamuMPMB6mdQe/cQDNSrpIwvPYnBQWLN0YA+hAgIHL3SZgEvP1
 I18r8Vp/hZeEa7FSyPqJGGVUVlLme6E0GMdB5D4yB6qrILrIFMopXm0DhQ0eVteEFr+D
 F8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714549; x=1701319349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EiNpx4DVO1rGLOpbcBfDBEuJhBAvBoc+N7iWO5VmOEE=;
 b=kISm8TCHlKp7VOyeLnYW+gltsnNwvnzZtjij1njKgLd9HJ13qfEqq09BshCmlBw4TS
 ZN6hQczwC7AXVwwsgtjGmShno47p167F2xJrWpmJ+u43Dn0nj0D4yTwN1dP3VZzjsmcY
 pxzYvtGEtIdnaK4u8nYcAma7zyaiYA0GfEVW6Eu5FpqQSl3ANsUWhndeDRXVN7NpABZ3
 gCfpL6U3Ae19hfKzgEbkF7fyvSMz9Nee4BXd9ir8z24m70//jWfNvUP4k2f6pXMqItGk
 oauGmXiVq/lFYXqrxVRrEamov89/k/fW3ge0ouv1Aum495Mf/HtOveMW8+dWMG9c3fnA
 eZiA==
X-Gm-Message-State: AOJu0YwaEdIbSBds4T6ievFSu93OVIyvnw8BDF6owxig+zacxiVSW6NA
 ZVSxLC3HJqFsnldjMfkwK9cSfW2jxKR4rdt7JZhDzn5F
X-Received: by 2002:a05:6808:1247:b0:3b2:dd32:2fe9 with SMTP id
 o7-20020a056808124700b003b2dd322fe9mr4916569oiv.35.1700714549632; 
 Wed, 22 Nov 2023 20:42:29 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/21] target/arm/kvm: Unexport kvm_arm_{get, put}_virtual_time
Date: Wed, 22 Nov 2023 22:42:06 -0600
Message-Id: <20231123044219.896776-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
X-TUID: niFi8jESw6iX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 16 ----------------
 target/arm/kvm.c     | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 9fa9cb7f76..e7c32f6ed0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -335,22 +335,6 @@ int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu);
  */
 int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
 
-/**
- * kvm_arm_get_virtual_time:
- * @cs: CPUState
- *
- * Gets the VCPU's virtual counter and stores it in the KVM CPU state.
- */
-void kvm_arm_get_virtual_time(CPUState *cs);
-
-/**
- * kvm_arm_put_virtual_time:
- * @cs: CPUState
- *
- * Sets the VCPU's virtual counter to the value stored in the KVM CPU state.
- */
-void kvm_arm_put_virtual_time(CPUState *cs);
-
 void kvm_arm_vm_state_change(void *opaque, bool running, RunState state);
 
 int kvm_arm_vgic_probe(void);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 55e1b4f26e..84f300c602 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -704,7 +704,13 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
     return 0;
 }
 
-void kvm_arm_get_virtual_time(CPUState *cs)
+/**
+ * kvm_arm_get_virtual_time:
+ * @cs: CPUState
+ *
+ * Gets the VCPU's virtual counter and stores it in the KVM CPU state.
+ */
+static void kvm_arm_get_virtual_time(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     int ret;
@@ -722,7 +728,13 @@ void kvm_arm_get_virtual_time(CPUState *cs)
     cpu->kvm_vtime_dirty = true;
 }
 
-void kvm_arm_put_virtual_time(CPUState *cs)
+/**
+ * kvm_arm_put_virtual_time:
+ * @cs: CPUState
+ *
+ * Sets the VCPU's virtual counter to the value stored in the KVM CPU state.
+ */
+static void kvm_arm_put_virtual_time(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     int ret;
-- 
2.34.1

