Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2795769lfq;
        Mon, 14 Sep 2020 20:12:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqFAmXqC8Y2U2ddKRceM0OqgmOPvd0V50OeOIKlUj7n7AcQBzIoKg/0oXNjOxXVji7pLlb
X-Received: by 2002:a25:103:: with SMTP id 3mr6077448ybb.295.1600139566404;
        Mon, 14 Sep 2020 20:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139566; cv=none;
        d=google.com; s=arc-20160816;
        b=fY39T0p9JPLUm1YD4+NF6PB+ZTCWwOipWvddIjtXMNrJwP3ku3E9/KWbjTiDqP4fsh
         7TBJEFAByLjAyvDjm88hlpifdTRFPpAPNK7M8CPGbRqkdfdB53LvzBo++HUXrcPrncmr
         IF4XGTzaL6VK02nzhJH7pX8mbi5e+1QXvJR8iC/3incAEeFDL+NRPqm52ik4gPz9ivRx
         K3NCyh2ZL4+bdqkAzyinqWbn1NkzzJQcL3rJ7oBeDZH7hA2PScMLECgHL/wSnyCB60SD
         JDdSIxeJXV2PFsmF8BVffBBNB97Txm3tRNv1OiUqsxuvCvgrWskWBnXI/9WhNWuZ53sO
         plcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oRDNCGgDBV3Hs+I8rUYyH4/axR+nkyINEYfVA07Svm8=;
        b=i/fadCBo5nI3+hCLtmOpOoD7HUTmr9+COi4mtBD1i30YkHWfqWAhafPpMlO9Oehag3
         vaE2Qw+qTiZIbwFDxvA57jYUi0OAGhZcbhwg6KRB1UZO2G7Us3XKmwFx59xcH56oY4NU
         +VJjsZR2WTlD2wLD9y0sFDlkZWxQplycUyeyldh33SE6ymmcK/euW15GDld66Ed2Dj2+
         wGLEpQwHNZLc8GWucixhR05iNzZR2bY0+SbiceggX4IZBh6DAJhNGCzDDLWEk6p/iLm+
         7kYR23bt/boa9yvRbpMF02WGYkz386Ce1IR87ObIIsSWkBMwXjhPlLfubk0zySMy4b6w
         zeew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="r/eqxy6q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si13451855ybt.223.2020.09.14.20.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="r/eqxy6q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1Of-0000u6-OW
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O9-0000I7-F8
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:13 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O7-0001iA-LZ
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:13 -0400
Received: by mail-pj1-x1043.google.com with SMTP id gf14so998112pjb.5
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oRDNCGgDBV3Hs+I8rUYyH4/axR+nkyINEYfVA07Svm8=;
 b=r/eqxy6qNaDEoTjVfM6kNl/hY0aJpJrlyf1Oz3HZ4edMewD3MeeOniccB1j/AFr2Jh
 tEXsXevlGxa9TezG/q61uthkpCtsy48vvx4kUEoJRlFh6uCyT13O7llV1NobBI1frDPR
 VeCXMqNJx1y5xmkogrn3PIRXOIV10RYOPcAKwZOUu6eAK+HPPVNrpy8nlae9uLA+Im6L
 1Zd/TDp8Yb22vn821HqZpR4doJj+JhH/0TBkb6UxW2A3vvpBlOvMOsVi3uSpeE8ng2DO
 6+V32BJcGcMuMBq0v+YlKJGcSK9WGHqoClLpE+0E1T5sLStehreaoyNI8O6q0MptfkvK
 Pl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oRDNCGgDBV3Hs+I8rUYyH4/axR+nkyINEYfVA07Svm8=;
 b=RSVz3SdTTJ+6TLMFc3QGCsqMbOSzeSK6D5qCuwQp6BSyPqWpkzZoh5OeMxzGXCUJmd
 1Bk89wmz7lqmrg2rqqIY+Yt6qkN22bIgze4rbzMDS4Y9CU3/q3fzwWmGFpwyVO8LJG9+
 vbnI5jgkTT7MU5P58i00yt1FAVdkUOnfp0O8Vg3HsyTXBSKdudfE+GNmoTPts/k8XIoE
 kaJV3p5lQ8mrqJAYIcPLX0AqZVqCdCUiqCla7NL0UuDIoIILeNIIB3KetZC1SguRjS1s
 P0aqVILB9HkVKANltmDnHPaqJKjcPR3GWkwYvhnoE4T50nnwEEuvaeYL2+km1B+azt3f
 5DEw==
X-Gm-Message-State: AOAM532SCOMW2Ic664Wkog0r94r4wvwfldzN9+HxhuDgMMSECGttwVQx
 ULXJmtm8xNhUJN5mYBjVPQ1A
X-Received: by 2002:a17:90a:4005:: with SMTP id u5mr2126190pjc.7.1600139530286; 
 Mon, 14 Sep 2020 20:12:10 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:09 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 05/12] target/arm/kvm: spe: Unify device attr operation
 helper
Date: Tue, 15 Sep 2020 03:11:41 +0000
Message-Id: <ed8d8d525139ac67569293d089e5508e37811b1c.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x1043.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b5vemHEtVi0i

From: Andrew Jones <drjones@redhat.com>

Rename kvm_arm_pmu_set_attr() to kvm_arm_set_device_attr(),
So both the vPMU and vSPE device can share the same API.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ef1e960285..8ffd31ffdf 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -397,19 +397,20 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
     return NULL;
 }
 
-static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
+static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
+                                    const char *name)
 {
     int err;
 
     err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
     if (err != 0) {
-        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
+        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
         return false;
     }
 
     err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
     if (err != 0) {
-        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
+        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
         return false;
     }
 
@@ -426,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
     if (!ARM_CPU(cs)->has_pmu) {
         return;
     }
-    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
+    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
         error_report("failed to init PMU");
         abort();
     }
@@ -443,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     if (!ARM_CPU(cs)->has_pmu) {
         return;
     }
-    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
+    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
         error_report("failed to set irq for PMU");
         abort();
     }
-- 
2.17.1

