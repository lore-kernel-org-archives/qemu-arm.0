Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp253879njm;
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjv44c8GWmwOXAtUek8n9zj4ayMFs1B3kmFlZLUB1XO1kO4ZDzVXMFs6E/FzGtp5mqvSwkC+qQ7WUzkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFfUeXmHa5tuS28bRDwLGNzWgXBf7dvLxC+QcsasfTp9jNxZKfagg1u4P79nY4Z3j3bmit5
X-Received: by 2002:a05:620a:284d:b0:7c4:c38a:ca24 with SMTP id af79cd13be357-7cabe49585emr399877885a.1.1745932989479;
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745932989; cv=none;
        d=google.com; s=arc-20240605;
        b=DUXzX9n7ysQe4BaF3KiavGgwejKCBPXkB97bm+Uc7vl5Aim2lyol7AKuY/I0lisZOJ
         hhNMYOKe+y4Zv3SXTEffNNdbr7xztewMLHiOaT8dePMqKUlg9wRWsF6sL0fYD83w10T7
         ASOS9sKBuvD28I3qWkjwxTyQmYit5c7eNfSJYIHIY/XCpKcLb0aS+kpQIjwhtbcSTx6Q
         7Ybgfh4tHI9mixnUgMxm8kwXyCOGUBT+nsds5OleD0wwQUyUnyclTxAadsRQbNOHNB81
         mhQ+cXK9pxtAvZbQFo1W/1mKTL5uEPw1th3MnP2RJWD4PzDK7R3okvPSI4hrURBYYm2G
         VdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mr1QFeW43XnVmNc1okA19chi54m5Uhrocgufe8XGZeE=;
        fh=IUJDqsqe7thKzGjg2tEzLm8ihsFAVxwlDscjrnqubNw=;
        b=ljHZkHot4NmHRSgXq+5SGz3mjEXcdqWtPMq7P4TX4pQ5G0KTCyMDOomBH+9I+U8fxe
         /CsZdqe50mcitBFxyeVurCixY2PFT/6HgiKGkJNkWVyPtaqD3/nLnNSh/W8xPfTpQ6pP
         pgIOm4S6kPwjQD7b40VLWnXFei/pRwFGppHAWX4rEdqrqojWDKMEilzGRKIRqeirUd2u
         6ppBcTIXr1nYF3/CpDh3xlqY9TnGwfn8qk8hokpJWGCLF/xOptegynYHLHMvC6rR4lz+
         vRhJlbcb8h/Ywng3KyE3Bf9MahZB0A4nFcQF5WQgNP4kBOXbDH1D/hZ7uwCMgarmyfIu
         A1TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fimfy1hZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958c9ee33si1269933985a.30.2025.04.29.06.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 06:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fimfy1hZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9kvG-0005C2-9A; Tue, 29 Apr 2025 09:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuj-00056h-Fa
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kud-0005fH-DC
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 09:22:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso4489801f8f.1
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 06:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745932928; x=1746537728; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mr1QFeW43XnVmNc1okA19chi54m5Uhrocgufe8XGZeE=;
 b=Fimfy1hZCqj9dBy+pnD2LXz+giyQ9NXAKMy6tAyh4DsLYAKRfwirGFyoHDRv4b/wPB
 IJ1xHveMe3WFvfDJb7JlgbuBDMy3QF7MZTNj9MIUux7tJ+dQO8cvF9oCBaYH9yrFGX7s
 UFILSyfbT+c9Xoa8Edk/u17Ar304sACafKuZOUYSwYvTU8VmvGeH8ruMiy54Cfz33GIC
 WA6EfusRYthay8E6JaTSHKys1P+9EJvN2fj0z26AxqcLp7DnWLgkZFQEee7XRDouo+it
 qNVe9+54JWdL3zIt8snBvs+Rao5Lf8YoBSyw/U6kZd3d4nUyLUPgAhhmPd1O+xupaqCo
 AafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932928; x=1746537728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mr1QFeW43XnVmNc1okA19chi54m5Uhrocgufe8XGZeE=;
 b=D3IIhASBDIWzZLqZXZbwPEHL/UaILgDofZdxKi+bfBVBm3FRo3UeqVlfltTYU0UAm7
 VY9Dpc/pUJc1Ik5dE7qrh/2IbLHSnY66n/IS9fW51OTha7/znEnWxN5nCtyV33T3Fqmj
 SlevMRYe4l/+rPqDxKcgtAMnuDjT9VzsAqXLXXpvhWH8wDr4Wstxucnh1r7EXjrRrz5t
 et9UsVkuSptjNiPHuFq7mhu7q2xechyinbNHTICdSXxDsnoACQUIfsLu5djgPdAGLO1g
 eCoDTz70ICXLR7Dr+jybJHD3E7h2l3HacBWCRia4NycRkGnHkbG/eRrluHqZQaub+biH
 Glrg==
X-Gm-Message-State: AOJu0YzJhWsMYz8WM3DcyurN76JKABg3Gcizm/frWSY5ajuAj+wwQ3qP
 U7G7o+/egCkvaTRoevJOzKgPZEAm+XSSbnzRlDABoSTikG2E3uFFaWgUN5QHpM6vt3trbhLoKUo
 X
X-Gm-Gg: ASbGncvi17g3OvXZHAop9d4EDCla6zU46kDIbmZU9JgujB9e++83xVrDmMve4Q/u7gb
 P2pXZn6UeyhFcjK1ZgJi9E5O5GYeAbVUGElECTNuYPwDU91yFHFwA/ZU26arhJs2NTTB9dvyqw/
 YE7NQe01F+2wsbvnuWJsubUQ1b6AXZdAp/gKn6z4Q1S4OcXESmMHF/52pFIPQ3rz/B4SG2ccVXB
 TRxlleMINh276h6dZcRnimeLwZp62Jp+5g0Uum/M2J1+1ulydkaMo393kIZEwhym9LuV1jtNdDw
 F6wZOLeT9YVqibmjIGyzsHhvha1H6TBC9InghHsjSn7YdHU=
X-Received: by 2002:a05:6000:2a1:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-3a08a516363mr2851581f8f.8.1745932928518; 
 Tue, 29 Apr 2025 06:22:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm13729371f8f.27.2025.04.29.06.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:22:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 6/7] target/arm/kvm: don't check TYPE_AARCH64_CPU
Date: Tue, 29 Apr 2025 14:21:59 +0100
Message-ID: <20250429132200.605611-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429132200.605611-1-peter.maydell@linaro.org>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ctmKv119OrGO

We want to merge TYPE_AARCH64_CPU with TYPE_ARM_CPU, so enforcing in
kvm_arch_init_vcpu() that the CPU class is a subclass of
TYPE_AARCH64_CPU will no longer be possible.

It's safe to just remove this test, because any purely-AArch32 CPU
will fail the "kvm_target isn't set" check, because we no longer
support the old AArch32-host KVM setup and so CPUs like the Cortex-A7
no longer set cpu->kvm_target. Only the 'host', 'max', and the
odd special cases 'cortex-a53' and 'cortex-a57' set kvm_target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 97de8c7e939..6b2c788e0fa 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1882,8 +1882,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint64_t psciver;
 
-    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
-        !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
+    if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE) {
         error_report("KVM is not supported for this guest CPU type");
         return -EINVAL;
     }
-- 
2.43.0

