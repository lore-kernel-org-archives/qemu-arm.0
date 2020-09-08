Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp397158lfq;
        Tue, 8 Sep 2020 01:20:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaEehbKfFLUesp+u7EpDcuZ5K3mph7He4ERNh1eKr/NZVdtj5qED5RN7tui+s4miFnQyI1
X-Received: by 2002:a25:9b81:: with SMTP id v1mr9663069ybo.129.1599553220616;
        Tue, 08 Sep 2020 01:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599553220; cv=none;
        d=google.com; s=arc-20160816;
        b=dkcU6y2vmWNs5Run1WMgaBtG/Y5EK9lVHAlIbEhL2BWI3EvEDxjdVF75JW6n2qcw1M
         5kbLNq1MbH9Y3SAhvizHojbs5vS34DTK0vszlyj4hm1D7BhrIiXXNoD47rqFtbnyzNXq
         h813xiQm1B4fKetPwbj/jN/71HBmGm0c0gkkChifdnQjpL2l7u96CkUKN8gdmUpZWljG
         xxVTyF1YIVaufKJ4nTCVpLVk80sSb8f0fthfDrfnASqRSjAzqQU+aLlJSMX+q4tBd4Xm
         MEUq1WF8jiUgnNg1SxVHLLXKYjrp2xjINEhcVJyqH9VIRPY+jK16rYNMyMR5vfzV+dbC
         S3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=98oDa/Uw9z4PZMJfsm+7ai4FPAo11Fc74PaW20mvgsM=;
        b=la2cAx9KjsZWfhh32dGrlWDhm14o+7whCep5eYqqOfNZvkNz7nRbzVoex9sDn7/b8/
         hHKQ6/RgkiAwciaiy3LvuVtR6TVzEz2hno6Yns0RKOGBbEkEbd21aI6wc+vT54O4x6VA
         6JsKJX35a3lfb47rCg+ky49Z7m8cWrocsNJVLAFdV+tv3LnuyN8QYnZt1WyxNj5K3Q95
         avdoTL048jY0KifYCpyTBbpfy/5VGr2/apvP3hUcVqNAU4IXapVw8kU/fAOkbZzc3QZM
         6eGsz/tU7fJjpdF9jVmWwk0eHXXZn9ObbjzANhK0EZZr04KCx6gaSrNhIZKfJ8anjV/b
         ArSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REY5uAR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si14190915ybk.444.2020.09.08.01.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:20:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REY5uAR9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYrU-0000sb-1b
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlF-0005nj-JE
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:53 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlC-0000Rw-S2
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:53 -0400
Received: by mail-pg1-x541.google.com with SMTP id m5so9504368pgj.9
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98oDa/Uw9z4PZMJfsm+7ai4FPAo11Fc74PaW20mvgsM=;
 b=REY5uAR9QcojLRSeaMMTjQAq3wWkP1nzt2xYQ9OoeId8mhgsu9+1uWqC38A1ukXotf
 LPY6pBz8BTALYF6Ne+w2Ul5APsrEgvbJtoAqdsngoUXcJD69AqZAuPh6vUoRbQdA2SZ0
 dmSpnjKr2VUMYnIWuocrnKZ4wTBFcKRmwxUmLUVpWGBmK7viCpy6+8GxzkIiniN55jgX
 3reISj+UIOjZY2a7Sfmqil6VEC4Q0nFuYnT9o6IV4APvCwS1JyoejxavKRpMYpMolJsC
 WAWTr4S6+b2u0lcsGXI+qyPAgQBrdUIVHmevzg+XpmQQbwwkexxpRq4SVvFLk9TbnEZt
 lfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98oDa/Uw9z4PZMJfsm+7ai4FPAo11Fc74PaW20mvgsM=;
 b=KhyykUPThu0z5Su6n+SvwAf4EI1ZpSpHOe2a/YbWr9pi4xjIXxXlATYTDvIXZQ+8nS
 o3BcFoCHAC80bXY3LZSDlRJ+bhYPbStbOiAYcK8CmOa0kq2ZSIcKxImmacYddS6NYHwv
 +Z2svcCVOU7e0uwQkwndt2kZ52aNEH12fepN1XMerEQl+g8oXcKJ4F844XnUiWAQRrX0
 2I+NCuVuQhEWd+jQZu4KFhqAXh0RgnuHWjkxiuVrFC8iDvAoOHAcjEZ8gtN7UcQU7PcP
 m7Wbikm7KVKLDdZ/FydVZm7lTTVxxTRZpLYEIKTB5LEqvtSkZ3NrtamI77HqMmsCOH9s
 qiBg==
X-Gm-Message-State: AOAM533vu3UJSUVq3qHUiaUTusQ7+SYMZ4k5KQW13BvfuS9SIRqQr0EA
 jTUpcUj6b16LzU5NM3KIvv7D
X-Received: by 2002:a62:6dc3:0:b029:13c:1611:658d with SMTP id
 i186-20020a626dc30000b029013c1611658dmr21590723pfc.10.1599552829633; 
 Tue, 08 Sep 2020 01:13:49 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:49 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 06/12] target/arm/kvm: spe: Add device init and set_irq
 operations
Date: Tue,  8 Sep 2020 08:13:24 +0000
Message-Id: <7bc684ec37de06827c68c409d5f02da7381734e5.1599549462.git.haibo.xu@linaro.org>
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
X-TUID: ylG3P++tSD1b

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   | 33 +++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  5 +++++
 2 files changed, 38 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 8ffd31ffdf..5a2032fc9e 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -450,6 +450,39 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
     }
 }
 
+void kvm_arm_spe_init(CPUState *cs)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_SPE_V1_CTRL,
+        .attr = KVM_ARM_VCPU_SPE_V1_INIT,
+    };
+
+    if (!ARM_CPU(cs)->has_spe) {
+        return;
+    }
+    if (!kvm_arm_set_device_attr(cs, &attr, "SPE")) {
+        error_report("failed to init SPE");
+        abort();
+    }
+}
+
+void kvm_arm_spe_set_irq(CPUState *cs, int irq)
+{
+    struct kvm_device_attr attr = {
+        .group = KVM_ARM_VCPU_SPE_V1_CTRL,
+        .addr = (intptr_t)&irq,
+        .attr = KVM_ARM_VCPU_SPE_V1_IRQ,
+    };
+
+    if (!ARM_CPU(cs)->has_spe) {
+        return;
+    }
+    if (!kvm_arm_set_device_attr(cs, &attr, "SPE")) {
+        error_report("failed to set irq for SPE");
+        abort();
+    }
+}
+
 static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
 {
     uint64_t ret;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index f79655674e..bb155322eb 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -348,6 +348,8 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+void kvm_arm_spe_set_irq(CPUState *cs, int irq);
+void kvm_arm_spe_init(CPUState *cs);
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 #else
@@ -397,6 +399,9 @@ static inline int kvm_arm_vgic_probe(void)
 static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
 static inline void kvm_arm_pmu_init(CPUState *cs) {}
 
+static inline void kvm_arm_spe_set_irq(CPUState *cs, int irq) {}
+static inline void kvm_arm_spe_init(CPUState *cs) {}
+
 static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}
 
 static inline void kvm_arm_get_virtual_time(CPUState *cs) {}
-- 
2.17.1

