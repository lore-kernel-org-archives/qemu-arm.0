Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1037066wrm;
        Fri, 11 Oct 2019 09:15:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9E3RXo/6I1iYm2x3/jZEpB8RLkYdWl0QveRhLG7cjpvui5LEuEQKW0jZCBeYo1NzOvIGj
X-Received: by 2002:a17:906:fcd4:: with SMTP id qx20mr14885521ejb.257.1570810556251;
        Fri, 11 Oct 2019 09:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570810556; cv=none;
        d=google.com; s=arc-20160816;
        b=uE312wgJbOFBA1RyNIw1GedIIY119FRbsWFdrzV/Tlis8EJlppSD07hc3QgRNb51ZO
         Zjtrh0xEaItnW2Xr1baAKhO/DT4HfK8eyvvocC+61kanyxXXtSD1ArR/CKS023T/r+Lg
         yTxsSTBl9OCv5dHk+nx4JGlCHsKfrVjUNVVRGr1bjLsEcsxLmCkd0nUCLbdkVXtj49Nz
         HWj/Z1cje3psqqgMG4KN3tWjtmXkcP9OTgctmDXMP8/7ogd52FuxoHCsjZccpHbMX/D1
         pa/mr1VL3x6eTxdtjFZfUl2gGT4UwW6dtaAT7Jqy9KsSpei0+rUVaJhHfvxeVaXatMcP
         DV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=0kUXqC720LILsCV2g+/0quuhAdJiaFyOvoOqO9J/BUY=;
        b=FLWeZqzI+fDLAS83zeYlNsYYZ+MAvYHXeW2QTG17B7jnNlxznFvLYbfGJsIjt1WT+U
         38RKpncSFf/w/MoWT1o1X6J4RAnAj/RPt1Kxz7z9eE0Nzu1xs67LADsRbKWFPLwkVaRo
         lZ6XzOhK84oRue9eB2j4S1Lg8ZvI06bCnoHZUCSO4hyNqw89keQXlGK3FVSsSiacQQOg
         iriAyPmU8G+clcAa2jcX9Dg2c940AWw0HLOB7RTHxblcbNLHDEIRMMjHkS6cWsA38j99
         +4KFE4WbDlvKAw3WypMh8hyFe8PHFVy1E3RTT8c9TYL1k0GhC4lRkGUAOy0ImM4hmpaN
         ZtAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qU3xCe+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id re18si5748044ejb.96.2019.10.11.09.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 09:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qU3xCe+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIxa6-00011w-I3
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 12:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxH0-0002jJ-Os
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIxGz-0007qZ-Pe
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:10 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:34611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIxGz-0007pt-Kd
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 11:56:09 -0400
Received: by mail-yw1-xc42.google.com with SMTP id d192so3653826ywa.1
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0kUXqC720LILsCV2g+/0quuhAdJiaFyOvoOqO9J/BUY=;
 b=qU3xCe+rTvxtcdUGZdLBjsDDrxtB0ERic7bACzJDH3nvPWQCgZ8IPfp3NJjpuHnjGS
 z9irNej9DIL1eMEMbJNRvVgDZFygYAAw4rKA6yP72Ku40VmNgLBEOsimqRLauFKI6icg
 1540DitB4QwfHSRdu5294JNAWRg0aHJzbwZvnwcE+iWPovstFudWJ/GusjkHJ9kQeZ4Q
 l4oYB+CjGlbCgD3XaZb8v8UfsFyz6429JfK+1U6Q/nWWkT9Ptc/tMfvnOquEhbfrP5cP
 x45f4Cznm8KjDPFV/8p/7Ee4/KN36IDHkY3P+BbE03+EcPVM6r/Fx3LZZ2+BxsSaFenC
 74fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0kUXqC720LILsCV2g+/0quuhAdJiaFyOvoOqO9J/BUY=;
 b=D4WiYCjVpCG3KoL+pATwTz+bMJkqzExotOxiiZ0mv8rXEw4yZdadHCRftvc0N+iXLt
 5JJVjOZzWtgB3KKLsTAfIJ8YAyhiSxEOr+V9bl5X2rn0F9mPV4JkPY/fsQmCIWL2uVxx
 uXXhM2u/pken4oTUqoF1qnLXcqVpog/QWFfN3owK8l2Ed9TGOr4g2b6VKmw8jnYrA5nN
 KpCw/jXs11WB/elX9FNLckujPsmpV9yNWr1IIiQcd+Rt7i0nqkEpVCkXRdLJbS1GZZJ1
 H4h8ht8SmhX38dNe9MEYqtPeyFflZbQO9HehqUTUekm+8QQr8paoNW7dpdoXuN8mOo1e
 2XCg==
X-Gm-Message-State: APjAAAWungUFQqGn04mt4NrnI2otsgOe2SykAtlZ35BI/w8dsZ/m/lb6
 w9oH55xg1XK1A1RtsS2KCtAqvpgNqVE=
X-Received: by 2002:a0d:c646:: with SMTP id i67mr2985197ywd.499.1570809369038; 
 Fri, 11 Oct 2019 08:56:09 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id d17sm2473139ywb.95.2019.10.11.08.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 08:56:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/20] target/arm: Rebuild hflags at CPSR writes
Date: Fri, 11 Oct 2019 11:55:44 -0400
Message-Id: <20191011155546.14342-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011155546.14342-1-richard.henderson@linaro.org>
References: <20191011155546.14342-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QBVtgXdnd67z

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ccc2cecb46..b529d6c1bf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
 void HELPER(setend)(CPUARMState *env)
 {
     env->uncached_cpsr ^= CPSR_E;
+    arm_rebuild_hflags(env);
 }
 
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
@@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     cpsr_write(env, val, mask, CPSRWriteByInstr);
+    /* TODO: Not all cpsr bits are relevant to hflags.  */
+    arm_rebuild_hflags(env);
 }
 
 /* Write the CPSR for a 32-bit exception return */
-- 
2.17.1

