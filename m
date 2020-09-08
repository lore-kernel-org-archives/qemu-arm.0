Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp393268lfq;
        Tue, 8 Sep 2020 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRzu1J6ztqTXCsN4QhUpHcKO+QmH/tUmXU5IJ1xRJHKuscSmdkPrZt7I7aeAY3HWluPQw/
X-Received: by 2002:a25:cf54:: with SMTP id f81mr34481128ybg.227.1599552848182;
        Tue, 08 Sep 2020 01:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552848; cv=none;
        d=google.com; s=arc-20160816;
        b=MNjk/Wx4oknUmlsTaldqO4FSQ0mkZ24xRr9DPQvDMl91IUuTpmBGp+eLezK2wTbUZq
         ATpY7tgI2ELZDyUJW4rmuE728vm/73/TvdN4GcRAwNOFmG04mZxnu8LvNzwVwC9dKxmq
         1kTIfwp4D41qlMurfTIZOqWbBhqOVVzAVsSIv8l/bnCek4nKLiX1xonUDb+eDt267/nm
         mBlF+vTlg/nccLhz0fBMQTCln8qqF3DqquVsZQR0doC5ifXa2Iu4wNRwsZ0oB0QUZ4ut
         2CwxFY2iM8oeJQs98CNDSR4jwTv82qpYzaRuX5068YvMxrNelrRg0GgP6A+CVY46ocWa
         aYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bjXqJB5fZDovb5keozBFqhrjyKCJ3LE/1kjYNOFtg8s=;
        b=QOL1OhIslB9TjSFoKxt/r04ZRtjvjk3L/rwQ7CWIyD/8MXOI+IpNTVU12cAevu7F/Z
         Bx/Nv0elQxwufwWLieDXRjT5JpbTRCGxICaSrNLEn/TLj2tbZgUDdlkoCNiSgZmRIfcy
         wMJM3PLuUjQAwK3UVO3GTPRiZLAqLsL/xs1SiJrxLZj0vJvhP+VnytzWIqMqFoPT0Agc
         fGxaUefG6SDb+cEtwCFmiz1HWS8agfZAoF1ayNHhK/m5p6sTamWxEowlL66QpyMx8AOS
         HiNgPoSfbL3dbl8J9Z6wz2h75H8d7QRUV8KLrv/hHWhQZ5E4PB6YmKi3pvafgYAA1bUD
         kXGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lsduiPeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si18429293ybg.348.2020.09.08.01.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lsduiPeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYlT-00064h-HD
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlD-0005if-JC
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:51 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlB-0000Rj-KM
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:51 -0400
Received: by mail-pg1-x541.google.com with SMTP id 5so9511906pgl.4
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bjXqJB5fZDovb5keozBFqhrjyKCJ3LE/1kjYNOFtg8s=;
 b=lsduiPeW2KAAqBLIvyI/8FZJf9DdqV11oODQYW+mHmktQWlrq8JKQhBNqHOYftlV8h
 kXnXOB4iC+DAgzeakNlWC4mNsxowb3AjsLhw7SoVQJLykH3p+XSU1EE7DnAEgZ2v2p1X
 ekkD+zYHj1MiH5pEojjHtb4uT+E64xMw7Ntu4A3PH9GBAkrFbIVm4tKz7m5UUO2PU5af
 P/1yJq0WITCZQ9wSs2lqC0gSjozPi7bDCHT49gJPophxYlo9LQdEcLLQDrA73F7HYFkH
 bxh7JFNVg+Xim7DSmlptXBxIEGjWo8q70Ds6gbW0/vxky7gsUI7f5Uzralry/LBmvac0
 hyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjXqJB5fZDovb5keozBFqhrjyKCJ3LE/1kjYNOFtg8s=;
 b=o45VGGCtkXxpEk9K0aqyVM5q3Gny+hqbUVwBMw3O/Wjf9KSx4i5ZJFO6S/il/xHMks
 cfyQMBKoxhJwDvOeRedgWGM60wCL5RgsjJ/cI3XWBIR5CKdYlqD3JVd/ZlhSrojZVDJ2
 Jvf0e0UZExQi+tymozXTK6ml1MpVhXeg+1B1ckMitungz/zXXE02EjIADF7wIbh2Vt9G
 GcNecoWRLSzZig8ahvh3bY/kAwMnUB4u2aR2xt4eigrPwDOiToUTh9ZhOeWcc9wcngpC
 z6dtjnCrJHbRL+pT1rbwLXKw3iIamzXrKQR0pwjWBOoTDYv70VAwUk+AiX7GW21AwK4r
 yu7Q==
X-Gm-Message-State: AOAM531Qo0gRVf7/7vkgL9P/vSdlkaRXZxmeXHysoASTQDDKkJAp4zu5
 3zA8A0EhOWbRR5s1fhRxMAZt
X-Received: by 2002:a17:902:465:b029:d0:89f1:9e2a with SMTP id
 92-20020a1709020465b02900d089f19e2amr21643144ple.6.1599552828430; 
 Tue, 08 Sep 2020 01:13:48 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:48 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 05/12] target/arm/kvm: spe: Unify device attr operation
 helper
Date: Tue,  8 Sep 2020 08:13:23 +0000
Message-Id: <45eecae26272efc7a09837573cd5278296b58dc5.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x541.google.com
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
X-TUID: ysZahl7rVLaO

From: Andrew Jones <drjones@redhat.com>

Rename kvm_arm_pmu_set_attr() to kvm_arm_set_device_attr(),
So both the vPMU and vSPE device can share the same API.

Signed-off-by: Andrew Jones <drjones@redhat.com>
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

