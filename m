Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2208833wro;
        Fri, 2 Nov 2018 07:55:18 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dmzQTizUq1PJHr2j00q4hnKU6TgDmk5C0SfrtbTj+xmNUMY3g6qOoepHY6GbqzIbGeqhKg
X-Received: by 2002:aed:2fc4:: with SMTP id m62-v6mr9202273qtd.154.1541170518715;
        Fri, 02 Nov 2018 07:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170518; cv=none;
        d=google.com; s=arc-20160816;
        b=C06JckQwmWadPIedFox3TAgUSL9gIRk2PlY4j0i6lsEUyDlY9LBZK3IkKlqmAtswXt
         McXN0QjsdjnJPiYUOinBgA9Q/mgF6kNjiokLoRkXUJGNpfG28VArDznD2v2+V46/muCs
         +2ZVpg+SIvs0a3LUOIK74bPx8VZucvAMCUY2fZVaYg57L5nx4lgXM+If0Xu8vukqlVNO
         rERqgjPN31Mqpbds/7wDIla1bMqYeV8TVTVX2zRG5Zt7o9vxplND/Or8zpCoLep7utH+
         wFDrwjMBqjWugZFPw4nLkTcAQxM0sz7ltXRP6tPx2kPwrPJUwmvre6zFMW0u6wmWDKVH
         9ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
        b=SL/dPu+K52WHaqURLEdHZJDEq4EDpgN0WZOlip0+dl97MSHYyyce/d9Ii771IZeRyZ
         Jx/8ZhIXUlUEnZb/9JniX/HHCCNpmG3EWiu7WfpgPaBHf76sD1aRMyWLJIhHhyPtGKWx
         5k9eWR1JLLIozXqT9+vcBa1NDSwJU+bHJjnZZ++SgLjlyjcV04bIYocKeKbAft5IFxf0
         P4EzvHv872Ju75okSH3PndhFPmFojbtDRH9QjDlepOmSFbHmlFtd1VEgG8+QYYMFQCmV
         K4YYvLq0NSGtxpGGxcYLdkT1MoUf6APnuR4/jKlOCXjjFf6mWi10+kSlzqtnahcGzmnE
         2nHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UYvBjr3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f47si5635772qte.179.2018.11.02.07.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UYvBjr3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIar0-0002SK-7a
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:55:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqW-0002FQ-R8
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0003IF-PR
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:48 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqV-0003F9-Bt
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 10:54:47 -0400
Received: by mail-wm1-x342.google.com with SMTP id w7-v6so2230071wmc.1
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
	b=UYvBjr3z8o1dCoQo5frgyu7JKU+sxs/+594og/R7epdFtVon5VsHsxFftKoK3ZUO/q
	taM1Tu9gs/rBnCvDOfjxdJJb+jYa/ae432U9pXWDpdteEJ2XlOWpYSSjV3+jqDYA5SBd
	cLB//WbNeKx8ugwCGd7aXEew8S02Gy4c6YCAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wAAqQsydo91GFkx0Iu9I74oQUpqdHqV7ni9QirCbmpY=;
	b=tmLYXrFJKoGN7JDEValPPFPEYkh6j+c0hzKwJEFRr12wjX6+VZ0O7WJJKkWdud9Auz
	GWLrQ3L3wwpnqQ3RNEPV+LK2ZKAcmDVCTfGHPoJIeopTvXI+4XTRc0rt1ZEo+CYFVQsY
	kHk7Yz86zxLylzJfGTAtyy6GaJmRkGBPmEDMuwlcNMDSTPP4k5prVrPiz1/+Hj1G8+cf
	N9ExWPOmPut5ucKkSUL1u6yBJQOqdeNvanKc+7b4KrpS9qz8lG9ErO85WTHXk23ccsfj
	rMEYQ63WpcpASt6d/5BmKSJCmlCW4XsdqQIIdzcz1kbJobRe4chpEJshaVQtTrSeLyCN
	xYYQ==
X-Gm-Message-State: AGRZ1gIchRA9nPmokTz9vtZkGIzlJIvVM86wUIMHKrBzgKz2QJUi/Cp/
	cOmAC12vyIWIUu3uyN02gq4bSQ==
X-Received: by 2002:a1c:49c2:: with SMTP id
	w185-v6mr38843wma.144.1541170480873; 
	Fri, 02 Nov 2018 07:54:40 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:31 +0000
Message-Id: <20181102145433.4553-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH v2 3/5] target/arm: Introduce read_sys_reg32 for
 kvm32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Xf+EG8FGlRb

Assert that the value to be written is the correct size.
No change in functionality here, just mirroring the same
function from kvm64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 0f1e94c7b5..de573f9aa8 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -28,6 +28,14 @@ static inline void set_feature(uint64_t *features, int feature)
     *features |= 1ULL << feature;
 }
 
+static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
+{
+    struct kvm_one_reg idreg = { .id = id, .addr = (uintptr_t)pret };
+
+    assert((id & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U32);
+    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -35,9 +43,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      * we have to create a scratch VM, create a single CPU inside it,
      * and then query that CPU for the relevant ID registers.
      */
-    int i, ret, fdarray[3];
+    int err = 0, fdarray[3];
     uint32_t midr, id_pfr0, mvfr1;
     uint64_t features = 0;
+
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
      * we know these will only support creating one kind of guest CPU,
      * which is its preferred CPU type.
@@ -47,23 +56,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         QEMU_KVM_ARM_TARGET_NONE
     };
     struct kvm_vcpu_init init;
-    struct kvm_one_reg idregs[] = {
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | ENCODE_CP_REG(15, 0, 0, 0, 0, 0, 0),
-            .addr = (uintptr_t)&midr,
-        },
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | ENCODE_CP_REG(15, 0, 0, 0, 1, 0, 0),
-            .addr = (uintptr_t)&id_pfr0,
-        },
-        {
-            .id = KVM_REG_ARM | KVM_REG_SIZE_U32
-            | KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1,
-            .addr = (uintptr_t)&mvfr1,
-        },
-    };
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
@@ -77,16 +69,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     ahcf->dtb_compatible = "arm,arm-v7";
 
-    for (i = 0; i < ARRAY_SIZE(idregs); i++) {
-        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &idregs[i]);
-        if (ret) {
-            break;
-        }
-    }
+    err |= read_sys_reg32(fdarray[2], &midr, ARM_CP15_REG32(0, 0, 0, 0));
+    err |= read_sys_reg32(fdarray[2], &id_pfr0, ARM_CP15_REG32(0, 0, 1, 0));
+    err |= read_sys_reg32(fdarray[2], &mvfr1,
+                          KVM_REG_ARM | KVM_REG_SIZE_U32 |
+                          KVM_REG_ARM_VFP | KVM_REG_ARM_VFP_MVFR1);
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
-    if (ret) {
+    if (err < 0) {
         return false;
     }
 
-- 
2.17.2

