Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2427649lfy;
        Fri, 7 Aug 2020 01:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6rgUpFmpLIWrC7mgTEUVHhK8Q8vvSn2E3CYNvulgyBXQxqH2ISpWDQ5ulnRzXok04B/9m
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr18055007ybf.162.1596788024197;
        Fri, 07 Aug 2020 01:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596788024; cv=none;
        d=google.com; s=arc-20160816;
        b=MDbZFam62GNkKANqAcS5v/J5NGe5GrMSGp0Em52lei8H+qgBNijAdrJBkhZfGoXZcj
         343GbNSN+KmsJ7jEE/H24rqGNe34ndKbIuEx8OcIYW2TKIBPjTFgppLfpkpOqGrfKWG8
         WYNRC3lM6jaFVCcof/xXCSzCrau1uOmhyscAy+TSqYqed3txaNqAuwX3wAZkxO3lzmON
         DQbGVbe/yNXZhw+INy1dUjcnGCnN9zmJIFwEVj9QlU0DRgUPq/cgWrmoZCW9MB2ynFLh
         kMHjOQ9n2+gMsEY3EC3KFRKomLdBVlt+xQZwXEFCGZgehxbznpXgE7eQ0ucEklm4SMeE
         tJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TviGzmtVooeSyONCBmDeM4dNkoolotdPP8RSZaeKQ7o=;
        b=IlGHFxosc3v6Zv5VfUv9mg4lb/kxDpPEwlkMZZ4nqRRM4gEUXEHOT4sxtP18vjpzBq
         0EUHtUW4aceL1cqyRNoGdgiomB8GgkxBY4EvsFlxR5xcSgwimlBpPoLuN+TAnxoHJO7S
         i9A0jk0q7fMFLmFu44z4q0I/IQHnBw9+z/B3jD6XadJii486h3BD5d0/77H2GIdS0JYZ
         e1Ddtas/fn3v+ITgid8Lp7u8mYGu4OgkBojtsFCdvKdssx/Lz/zr/gtZ/2RFkI1Fwf6l
         Dctsxb04DiIcR9kkXAarUz5hmHkiye9u4aQ8zswp/5fnsmLQRGvzrrkMNWbJoasu9LPB
         fT0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NnLuiKB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si7470771ybr.271.2020.08.07.01.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NnLuiKB3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xVX-0004Ok-DM
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSj-0007Bg-Sr
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:49 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:45483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSh-0001iY-Kd
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:49 -0400
Received: by mail-io1-xd41.google.com with SMTP id u126so1037472iod.12
 for <qemu-arm@nongnu.org>; Fri, 07 Aug 2020 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TviGzmtVooeSyONCBmDeM4dNkoolotdPP8RSZaeKQ7o=;
 b=NnLuiKB3M9BBUwK6Ivp+tfr1wgrcB2dVtHLFJLK3G5M7zD8ZVcpU+F8n1mLDr+8QX7
 jEwIsOVdjpwqq5wwpQbmgBnzV9U+J6n+aoT8+z3R+iedUYm8Sgrymxsb4sBNMDm46jdi
 OoZtB/mh1L99BGq99JUGlHhsROt4PcYEyGGaM28kH99B8T7GiszCu9tlab4pn+VW/EfL
 wVFSfWlHzJo3TSK+b0IRS3cnNVCydf+zItie7bCmpjvdMlXCUc0kG1YCTTKelDnkvTPS
 CwnX+vWK8IdqIEcz306Dj+u4Kb37g7NJQM4pOaOZPN9RXzqzisygEg1OmHGLagiH4raL
 5EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TviGzmtVooeSyONCBmDeM4dNkoolotdPP8RSZaeKQ7o=;
 b=sPOzb9HDvfFlrTJbZG6MDXPQ/NDwtjEZ8i2CfnyurwOzVV60Y4pD0NsF+xFn+VKYVx
 +D1w/p4LHv8yK8j86RRUJ/dGWqsG/AQpm+pG14R2pjXSNRfdpT3x099GuVJYOmmYrdZu
 MnLZHEMugRfYEr2+KwfkG9VhQHmb0nZz7atv8uJL9mIF80Hp3HtqyT615VV4Ke2DfWt0
 gAEsLV1WfWvS8Yd6VWDuQo5Gavr8SS4BQPYcNmrnFcTl2OtRWcsbKxe+Iqt1WFLCyZ5p
 JMTXH8YUoonuOMXkdpoLDW0V+7wLiSNRxrTPDgdjukc05IJbCPj+6ozDmfJd+W6h2zKM
 v2ng==
X-Gm-Message-State: AOAM531GZ6+kJ6BJ1ZkZLXbEIcqu3UmgxXojR1IsseNqVcRVzKthlunW
 tlgAuopj5fCQmjK2RQyhrJk3j1deSSTqcfc=
X-Received: by 2002:a6b:5d05:: with SMTP id r5mr3266184iob.14.1596787846498;
 Fri, 07 Aug 2020 01:10:46 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
Date: Fri,  7 Aug 2020 08:10:37 +0000
Message-Id: <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OYeVgKAYCjbG

Turn on the spe cpu property by default when working with host
cpu type in KVM mode, i.e. we can now do '-cpu host' to add the 
vSPE, and '-cpu host,spe=off' to remove it. 

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/cpu.c   | 4 ++++
 target/arm/kvm64.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 67ab0089fd..42fa99953c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1719,6 +1719,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->pmceid1 = 0;
     }   
 
+    if (!cpu->has_spe || !kvm_enabled()) {
+        unset_feature(env, ARM_FEATURE_SPE);
+    }
+
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
         /* Disable the hypervisor feature bits in the processor feature
          * registers if we don't have EL2. These are id_pfr1[15:12] and
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index be045ccc5f..4ea58afc1d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -679,6 +679,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     features |= 1ULL << ARM_FEATURE_AARCH64;
     features |= 1ULL << ARM_FEATURE_PMU;
     features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
+    features |= 1ULL << ARM_FEATURE_SPE;

     ahcf->features = features;

@@ -826,6 +827,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
     } else {
         env->features &= ~(1ULL << ARM_FEATURE_PMU);
     }
+    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SPE_V1)) {
+        cpu->has_spe = false;
+    }
+    if (cpu->has_spe) {
+        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SPE_V1;
+    } else {
+        env->features &= ~(1ULL << ARM_FEATURE_SPE);
+    }
     if (cpu_isar_feature(aa64_sve, cpu)) {
         assert(kvm_arm_sve_supported());
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
-- 
2.17.1

