Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4521993wrw;
        Tue, 13 Nov 2018 07:44:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5e9ry/4CX9gfbwiDvc9KrffGUp/x3aHBPSDIA1g/47Zi9PUXGVsAr3EuS866/Ta7bR6uN+D
X-Received: by 2002:a0c:f689:: with SMTP id p9mr5825954qvn.52.1542123851126;
        Tue, 13 Nov 2018 07:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542123851; cv=none;
        d=google.com; s=arc-20160816;
        b=qubp6NATGqNyY2edCOjeNxvyqfmZV/rV1CsnS5ZSDNWOL398WyBWdUgo/Lu2llo01q
         fmIeQ5tZph6cW/fKTQuA6cdKTbUy2i43znukmCLkbKVS+JBfrcXYdOL4j3ipk905gh+n
         0IYEPpm8Gv5XmxclOvgODBmgYdJ7mExHqD69WIzVoP1FOU1zHqCNYPq2NnhyiyeQ6b/x
         3cVqIIfmhpPa/x3gEjjJ75m/HU2cu2zJijx2GctQoZN4OBDyHq/J2lAHwNzMzh9ORmzB
         2M6XdS/2acUSiVptrho8adF9xQ89JHaVVToKa2M1NdPqNuvlM/7sD6ZHFqxvMnyleh69
         Wqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
        b=GQnF1RqLwNljHkOr6gVVL3TP8m3XmENHOmf5s0OGQZyp6+IMECzb3Vhc7IrP+9SuSS
         9fhUU9o/kzOwdSaEGDADBIjB07ltL3MZkNjpx/mr4GOzJJFem+S5chuelaXuKncczxrd
         tCjgXPjBV9v+hNpxhbWWJO/qWXdvnyEveyoTIxXh4sDWqZmUSD3V4pWWt1qosYSZG+Vw
         GMvvY1j/9/c26KAnNcCAgnRUnauwOlbMTSBEtDmEr5qeKFxC0HDBFxxWm0hAJxGkqV5A
         7S8d9IKVGmgt7lWV3q4FBU67c02r/6aCynERMnJsc9VFI+bErpM49ZpZNo52f8CXwbcC
         cWxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CQYSFym/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si2635639qvh.10.2018.11.13.07.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CQYSFym/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMarJ-0002cV-4y
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:44:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqv-0002Uv-UN
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqi-0002Mj-N2
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:39 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMaqb-0002ET-5r
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:27 -0500
Received: by mail-wm1-x341.google.com with SMTP id f10-v6so12380364wme.3
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 07:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
	b=CQYSFym/mpDJaS2O7s58ALjxKVW9ZbChGXKhr8BuyjHJC3L+4RVrw/EcFGr8n+fpKQ
	uCuGbGWpk9cZywAnGvvrfU0LGrvhzOpLGOz8C1fWKgsCWEfr2KQXzmtV0MtmtkrEyiDF
	febYWJzxQx1MG37tgzqDLid6kAPxI72+Ghi1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gcjpzBDmc2ewtCNL6rBuAyjW01R7ZlfO8tHcOjDumO0=;
	b=k7mkYmzTYIctmhlF9Dt11IJfmVONM2BE93XwchO/swhWgG26tR0Fxebwe99JWY9GZq
	LXBUroRFI0G6030LEu55XzvIYsefvvlyBdNwMm9HtJZIuJicQZ1HA0KFF1TBdLt+LS/A
	4N6x8UieDIWvQhQ10gb7ljHK1z3YqLh/e5j0NMT1H2xggQwTrPpvrqbTNp8RiE778kVe
	gPfE9A1Sc2s7XlnrrDoJGHUKa+Pb4FXYy+N9NEsvlZ7WDPHBziGkbCK0qGwC2PQpJi0m
	mn7+FA65fqOFUnjIS6pRxYNl6HJIKDwzNNBLWNIWhsWq1wsyST0XaUUdK0IY8uzmDWam
	272A==
X-Gm-Message-State: AGRZ1gInZkPud1b75G4mDRFHQlUicaLfrKEdAGVgS2xGqzVouZSjLQzS
	VS3Yhw7U8HcbuXclzyacfwzMTJ6Z25fzXA==
X-Received: by 2002:a1c:545e:: with SMTP id
	p30-v6mr3586289wmi.69.1542123799947; 
	Tue, 13 Nov 2018 07:43:19 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	s16sm3479709wrt.77.2018.11.13.07.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 07:43:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 16:42:25 +0100
Message-Id: <20181113154226.14396-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181113154226.14396-1-richard.henderson@linaro.org>
References: <20181113154226.14396-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH v4 3/4] target/arm: Introduce read_sys_reg32 for
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
X-TUID: JZ2+L46EUM2e

Assert that the value to be written is the correct size.
No change in functionality here, just mirroring the same
function from kvm64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm32.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index cb3fb73a96..bc0badf53d 100644
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

