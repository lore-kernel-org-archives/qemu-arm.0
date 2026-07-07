Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E86C43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:45:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVj-0001IG-Sl; Tue, 07 Jul 2026 18:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVh-0001Gr-Rd
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:25 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVd-000460-VV
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:25 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cab973140bso1141335ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464200; x=1784069000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LPqEyUzT++gNY9WDAWkbqlVC0xxiLcUKrinmqOFE5ZQ=;
 b=QQOLSDrQRmS708rQdWI9huj2NuCRPbphgJ1qeMDh4HtIaR1kSaxLn96KJQvVqCYd3+
 XuwUj4ZMvbiFXQ+kwu+IfRW17oRbqeslaMquloOYcu+vpXJYwLCF8jn4UfuBLKLjQEEb
 p7z5X9f88uWDGSyqjjhCXkRAd06heUtpRehv8a/fSKzG7aMkcqRlxKJ3dqraVTfQ+fIN
 eQXRfgubqntKHNfno9LW4CK1Dfz8fmPIEoF8IuOB3jkv29UvLuXb8O+hG6gEx5bmRLUo
 f8JB8NpofW7B4V3puxE2ZeKVwW1qH4SdeFObzFxb8bgfNuuktaYCdYpv5bOjpJF+5UzW
 fbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464200; x=1784069000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LPqEyUzT++gNY9WDAWkbqlVC0xxiLcUKrinmqOFE5ZQ=;
 b=ePsFdKlPIOEKfU+KE9U/eYOp0I4c5jupBlwMTsyo4vrMjyVux+Qs7HB9IQlimrgtUM
 M2IwxOR96RseDQRhuVSoForgh9+8mSpv0NWCQxPg76+g4iQiRyzz5Qvy1HjKHFiTIUPE
 2452KY8zkCobW1u/Snr/oY5ISv0DMArcb2ug9pihE4CT6EQiey+N7fAPFPWxZzSJl8Yv
 HLMNpU4wfDYi+D1fwEPzfrEUxecSLzJEUxhuSkh7r5zdiagcsl50fvzJvIRlnRsRDas9
 v8erCAhevsPnbMque/1ubioYGBxN+h4hW8UWx9jHq9uDKuKvDFi8gdhT47S/YWnSsdsk
 lqcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1yMNQTKILXDkixUMivCRrRpGssH+tReFDc+JkKeUDNb/Fsx/Hn6+kNSOPT5mXvnwZ77TjO8Tcow==@nongnu.org
X-Gm-Message-State: AOJu0Yw4xxDojmCTPbJmG3xTPd4/G2fQ1kaLlCWDZmJOa2ndNKFlgOGA
 F5hxGP5QKLkJXYBgwoBff2dBhjkQmnWIwKcNkf/T7KJNg6yZoWVkWcVOMd2Tn0lfExA=
X-Gm-Gg: AfdE7cmEPZJnu5Yrx6J8sm4OYBhPN1bs66wtb5HK7bqzTnQjRv8ESu2xIR4x0+9+f3w
 LtKDhs38CwKP5Wo77rpUWaBsShLV4LALa/5NAg88/vVwUdfwASH1DOzmwLtUhYb5aFPTyNyzv1H
 nJ88ictew6F2ggun7AekJ9vAMjZqJQfKkkcq/f931MMK6CR0361xbr8oJ70tMUhxrPBPqPsA/sp
 Wz+IiuA+PM7xvP5WewsJoOc8hIPalGG7NNT6tvBDMA7V7GAQdotXHFd/JQmtY2CjK/jQeX4+k6p
 l/HRfCIIUsggFZGxbmMzf5/OT76YwE8a6oIuvoVNmPqhJXqFuzd3CC37IKn8uYFfjO17kVMLRbX
 WeCZJNt8ElXtP6frggPMUorlHZnTBPt2ttyvwxuu1+eh8fjehzNHzeyWS8bUCdP/qZD/EF23OT4
 EAKxZOVZ3Fuh0wiJgWqFSYRrDoNQNkhM2ecYD1kKk=
X-Received: by 2002:a17:902:d4c7:b0:2ca:ce91:f027 with SMTP id
 d9443c01a7336-2ccbf08784fmr61937065ad.36.1783464200536; 
 Tue, 07 Jul 2026 15:43:20 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:20 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 05/25] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Tue,  7 Jul 2026 16:42:46 -0600
Message-ID: <20260707224306.1202330-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

For a Realm, KVM is much more restrictive on the registers a VMM can
initialize.  To prepare for Realm VM initialization, split the get/put
register functions for a non-secure VM in their own function.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 28d5643d6779..b609f29c11c6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2163,7 +2163,7 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2266,6 +2266,19 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
         return ret;
     }
 
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_put_core_regs(cs, errp);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -2348,7 +2361,7 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs, Error **errp)
+static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     unsigned int el;
@@ -2451,6 +2464,19 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     }
     vfp_set_fpcr(env, fpr);
 
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_get_core_regs(cs, errp);
+    if (ret) {
+        return ret;
+    }
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.43.0


