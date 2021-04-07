Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp19214lfr;
        Tue, 6 Apr 2021 19:03:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXkChbxQsek9nJEqC0+9KQdPhdCCQykwJkxPLTddzRC6GfBlCAAWo0ALokGpX6d4F/7F/q
X-Received: by 2002:ab0:7702:: with SMTP id z2mr706249uaq.107.1617760999225;
        Tue, 06 Apr 2021 19:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617760999; cv=none;
        d=google.com; s=arc-20160816;
        b=dTg3YZnUlipNhbdqkzdVXv9uZEuswe0Av+/yHKYsOU/TKoLui/xMnZkXphbvdbv+Gj
         xmLtNwUrJ6QmK0DN7N1AJ7iHgyYNpqu8A2K7spfzxJsxlvWqirABXTh1YJAniaYqCx5L
         8PNMKCyiX6iMWcArgtPCo5zDO5m16U/7NBy3mwYMB0vtSH65zKyvv64HOxUML4Cu2ms0
         p0YFbICPnYobtHOUclXvtq9bxfN74bmjGeQtSWp9eO0m12oTXx8G9Y2/s1+GEbShFVPh
         Yk9yITycKrixfljJtXy5SZOqUITWDeSZ9bqXd8Tl/mPnl98GK0hkx/2/KfY2G0LfXfTh
         4oeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=puMm9exJjlsbW1miEc1jOLuNGha77Fd9MACz8dzLPGs=;
        b=a8a6Vsu6tatnH42/2CpHsSy0GGTWe0cbBw2xSaXtou+5GDdXHiUPOiROiXBPhj9fUW
         8KIvHIhfJCp7LzL7FXILGa6Jsb0vbMPtH839GQLhJPfNhxfDL6nhont9318zOmtgRLmp
         2hD7lCz2WSwvWdvZHizlSuiUV0auXfWz+iFJxc1Z8vwrM6P4gsX3kWKLPlzNzDhvDq+4
         GTly4eofogjWsbaMzsg6oZAW0AI8EAoezbZusm91HAyROSKTg0/5eLhiIZFAXONb6VQm
         G27i/gYzLPPGMY4fqbcnS+d3xz7cydH8Qx1lY5IAjp5/DbRZnSq1ziI78ohyKaQ+vrYu
         XJ/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fbb4/Ftc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si4639748vkb.31.2021.04.06.19.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 19:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fbb4/Ftc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTxXK-0007dw-EK
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 22:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVY-0006gC-3g
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVW-0003Y7-Gq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617760885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puMm9exJjlsbW1miEc1jOLuNGha77Fd9MACz8dzLPGs=;
 b=fbb4/FtcIi3NOSgb9PSS6fttNH/g39utB/YbVf6TtVn/v/rOVfKJ27eiLFAPXi3Z+vY87e
 3ykMRausdOvSZ8NU2jHmutMxjJE8SNWuMChoFChINoqFu0zCpMGowVoxgcVI7vdNyY5BDM
 2xB7lNvEi0v3hU9xHqRVdDhM5bjg8u0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-of-DBZoyMHWYmurS7ShRPw-1; Tue, 06 Apr 2021 22:01:22 -0400
X-MC-Unique: of-DBZoyMHWYmurS7ShRPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 978A72AB;
 Wed,  7 Apr 2021 02:01:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-160.bne.redhat.com [10.64.54.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBDE9627DC;
 Wed,  7 Apr 2021 02:01:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Initlaize PMU feature for scratch vcpu
Date: Wed,  7 Apr 2021 12:01:00 +0800
Message-Id: <20210407040100.9933-2-gshan@redhat.com>
In-Reply-To: <20210407040100.9933-1-gshan@redhat.com>
References: <20210407040100.9933-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, marcin.juszkiewicz@linaro.org, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWArepM0nGoJ

If the scratch vCPU is initialized without PMU feature, we receive
error on reading PMCR_EL0 as it's invisible in this case. It leads
to host probing failure.

This fixes the issue by initializing the scratch vcpu with the PMU
feature enabled and reading PMCR_EL0 from host. Otherwise, its value
is set according to the detected target.

Fixes: f7fb73b8cdd3 ("target/arm: Make number of counters in PMCR follow the CPU")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm64.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 79800f00a7..7311e86d1d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -516,11 +516,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         QEMU_KVM_ARM_TARGET_NONE
     };
     struct kvm_vcpu_init init = {
-        .features[0] = 0;
+        .features[0] = (1 << KVM_ARM_VCPU_PMU_V3),
     };
 
-    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
-        return false;
+    if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
+        init.features[0] = 0;
+        if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
+            return false;
+        }
     }
 
     ahcf->target = init.target;
@@ -564,8 +567,27 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                              ARM64_SYS_REG(3, 3, 9, 12, 0));
+
+        /*
+         * Read PMCR_EL0 from host if PMU feature has been enabled
+         * successfully. Otherwise, the value is set according to
+         * the detected target.
+         */
+        if (init.features[0] & (1 << KVM_ARM_VCPU_PMU_V3)) {
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+        } else {
+            switch (init.target) {
+            case KVM_ARM_TARGET_CORTEX_A53:
+                ahcf->isar.reset_pmcr_el0 = 0x41033000;
+                break;
+            case KVM_ARM_TARGET_CORTEX_A57:
+                ahcf->isar.reset_pmcr_el0 = 0x41013000;
+                break;
+            default:
+                ahcf->isar.reset_pmcr_el0 = 0x41023000;
+            }
+        }
 
         /*
          * Note that if AArch32 support is not present in the host,
-- 
2.23.0

