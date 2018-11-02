Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2209058wro;
        Fri, 2 Nov 2018 07:55:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fhnz+c5CZH3Lz8RPH/0decr6ddsjryjq2RcJZweZCfo2HWDxHtFzoihyD50FLbntMtW05r
X-Received: by 2002:a37:654b:: with SMTP id z72mr11158734qkb.226.1541170532289;
        Fri, 02 Nov 2018 07:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541170532; cv=none;
        d=google.com; s=arc-20160816;
        b=l4wAn3D1YSQlXmEESbn2lg7hWyEw2JEXl5XaJoUD55OB7E+gT+mkJEmJXshoUeqbf1
         90P8aGxul+tg1v8dCepRBs9PGrgbFVInv21w/xJAMIr3Oj/5IJoUXACQbZ8+6eS3q3jY
         c51tysL79UWK2+bhTOyM9sIaRU7HL/sajrWZHJwtY1KEILQCjRFWi9RCevbdYr6D1EqT
         VCC56TKM6Vdq04Tzedvwxzdavqp7oVEQpKgIzf8n5Tblek7ML0dDhTJj07G+odwApiB0
         zNCZj4vzF5Ua6n1ySgXQw1lk0YcwPvLNJPcEyvZx9X5l0D4zLlSky3BRpOerauoGWVfk
         C1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
        b=Ijs6XYraHV/BJtHPU2MYK/RoNDTkHqk8GpT/C2/m1DJKZvNeDIQYs5YneZR5tZM09D
         FeDusV3xjcMSJviLyoRAILuCxyxlTBh+IFJNNxzBK7iPeuveqN39CFiIu4TezHuePM3d
         K+4yUF0ikJFAuQXZKO3AszDYd46RCepH6t8JM4JchMwahXva+mCUKkbCsxA20xKBvWV2
         mRg+FU/GN6hShlzE6O3adfNBpjU/qu2iDviVs9G9uvddjl+RJrQOWD/bPVEHtENOj/0f
         FHG+H5XTMrPPWxz/HSAMJvPbJwNK0QIvPsIfad4ZqMmjuea9EqwkCcMaCX+bAXpJWfGn
         MEUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NlzmD2um;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12-v6si28330qty.161.2018.11.02.07.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 07:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NlzmD2um;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIarD-0002Sw-R7
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 10:55:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqW-0002FE-Ff
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 10:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIaqV-0003Hg-88
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 10:54:48 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIaqS-0003Eg-Lz
	for qemu-devel@nongnu.org; Fri, 02 Nov 2018 10:54:45 -0400
Received: by mail-wr1-x443.google.com with SMTP id y15-v6so2268974wru.9
	for <qemu-devel@nongnu.org>; Fri, 02 Nov 2018 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
	b=NlzmD2um85jnNtbQreq82Y8JljxMO30WfdEPB+lQBBWK1BunEJzJOAIaKCCTbRb3IR
	zoVGyO5XX8zwLHuK1vcOokvHfXLnIyQ6q2NwnYfe/uV1FI7cx2E6+7iA4yjKsgrgZf4g
	dlGBZkWCT9Z3n+PwWq1DVOPQy8J7Z1JjGk+7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PpLXpocO/xsWRefCIa8us272LlmFyb71GTp1lXZH/b8=;
	b=uQR7GGZW5/84RkK2s8g7b8ce89in9Yf4Cyy8vF7GJVWXYjGDubOdKoz024ATrYjVVO
	KCU22QSdViO0nBfeuujYOQpQ9bRN/VtIpKp9zeexwzgfFn8m7io89U2V4lruQvYPkE/s
	hYHPPhuObienqSNE2r38Vqu1upxPqJYk52oHvhYCJbC63u6LCXzeUibV0OOVfqd1x/PC
	KA/RiuqC30p/M7T7W4ahyQGKV9xrYbjwnRxZT4NCNnbT0AMV7fLBRfqpVgEpIn+vJDcU
	1/6dR3a3AS1x3lOOBwBnG6gbtvP+k+0JXL9oeEmOuh3lEPrVrIobjnOAE0D9IOibQNte
	0Rsg==
X-Gm-Message-State: AGRZ1gJnS2PkRD1gPLu7hdmDyd6kTBpJ4VZ/syEHq5LxeqG8u64GbqMM
	IjNrLxUjhy+wFwPfHGqnBNGTPjeiQWU=
X-Received: by 2002:a5d:6585:: with SMTP id
	q5-v6mr10150692wru.141.1541170478979; 
	Fri, 02 Nov 2018 07:54:38 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	l5-v6sm10698454wrv.84.2018.11.02.07.54.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 07:54:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 14:54:29 +0000
Message-Id: <20181102145433.4553-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102145433.4553-1-richard.henderson@linaro.org>
References: <20181102145433.4553-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v2 1/5] target/arm: Install ARMISARegisters
 from kvm host
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +R8LqdmedupZ

The ID registers are replacing (some of) the feature bits.
We need (some of) these values to determine the set of data
to be handled during migration.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 1 +
 target/arm/kvm.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 21c0129da2..6393455b1d 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -183,6 +183,7 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
  * by asking the host kernel)
  */
 typedef struct ARMHostCPUFeatures {
+    ARMISARegisters isar;
     uint64_t features;
     uint32_t target;
     const char *dtb_compatible;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 09a86e2820..44dd0ce6ce 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -158,6 +158,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
 
     cpu->kvm_target = arm_host_cpu_features.target;
     cpu->dtb_compatible = arm_host_cpu_features.dtb_compatible;
+    cpu->isar = arm_host_cpu_features.isar;
     env->features = arm_host_cpu_features.features;
 }
 
-- 
2.17.2

