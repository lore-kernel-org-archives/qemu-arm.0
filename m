Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp838215lfc;
        Sun, 7 Feb 2021 19:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjR7LvLrJysYH7n09Kk0yx6NGcLs22Hvc64TiUAWa1IM8CfQyrGMNiRYk+CXo8dbQWccQY
X-Received: by 2002:a25:7145:: with SMTP id m66mr10869003ybc.283.1612756254664;
        Sun, 07 Feb 2021 19:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612756254; cv=none;
        d=google.com; s=arc-20160816;
        b=YMomTImfE3EC2QVyx0/PrOfgFK4nGF1YWWaPEX72db0nHVxpkTCeVLaBTImBg9LTlu
         S0tHwIam6N3/oO/T8wl+vnniAxWHnKCBZowxJxMKgXNbXSQ15YO4N5z7PH/ixHU/AtTK
         piZbkCZFzPm0F8BYwR7hNJ5mt8FqcrVXU47yA7gSSwFVCF6z1utqPzlgwYhog+ptM5b5
         Axw4eZyoHWbrpXLcgCUfcsXpvd51ZqdypclQTvu0liFswMzMCb6R30Fo6QtXIB4YK7Ax
         xhAt+9OasJ0Bc6LbJAeLt6dQtKb1RcT76L66xoSYLmnJRKlKx3Kx40tk1YsemsykheQw
         ZBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o0Vd6bwYd4gneYtpxWheq/+EF/MLp77aqunUp/r0WeM=;
        b=jTvlHadyq1680K4qxOeuk9x+KcTdZ5iJ2p7sX8fvCUIZdJdZwGxBpCTR8GIbxvFfak
         WsjRZiArdmssYeiLs8ZGXNKz60n6Qb8iOIS9ah5hJtlcghbnlbxCh8NyRZJqgEB9ei0l
         3s+kfBSK3tjKwzr30SfOB6FfZbuphzV103+mg3AjNwcO21f8WHcCG+MHu2v4py+V/l5d
         qae4sw5V8hMyCygroCke5QHNdAG/GlXevIHeuq0EpIVsPJNYp3wOW7ciAX7Y37P+zW0G
         gtM/7pPs0VndTKk3mrH82Z+VOlTeeZBPk00mwO0ancDNo2hr2VvVYqdKjSkAtm0HXQji
         sp0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJPJFFmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si16969569ybt.235.2021.02.07.19.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 19:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJPJFFmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8xZd-0005CL-Th
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 22:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6I-0007iz-AB
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:46559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6D-0001it-EY
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: by mail-il1-x12d.google.com with SMTP id m20so11450528ilj.13
 for <qemu-arm@nongnu.org>; Sun, 07 Feb 2021 19:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0Vd6bwYd4gneYtpxWheq/+EF/MLp77aqunUp/r0WeM=;
 b=WJPJFFmCjI7Cy+8Li3azAORG2h7v0NTSoYCGKPU0wxeofQMYxpx+oM+NkkFfA6t9H1
 sTcxABNPNNcNgOqIUIRIO4yH3MsbYh42UCft2AG13RQAC3n3MlvLGbqYAJzDEJWQFfGp
 6eppHMUpKu9KkA9ywJw+WltsQd1qLNRrpTchv1U3NkhIDJWJEPUyM+WzI0Fv4UwffVMt
 +0hyZCn6iJtzxaR/R1EAwFBA+UJWfyeSW+H0b+i7ZUYxG8wSdbbs/Pag0kRIR23wOHbK
 b+OU8mEl2PoV2nQE0l4v1GR88mqAUFBjVAyqbPyjszq8dlpGCYwt1uKTGQPaI9gKgxh2
 5zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0Vd6bwYd4gneYtpxWheq/+EF/MLp77aqunUp/r0WeM=;
 b=oXffbI0CS5Bmo96kpyh60VRx2HoeYUD22mvkA2fUV5O6AnMcAN7ZkolEYwkm2eD1Fx
 06/X6xPmPrfJbLboPlwCv1J8QH5OeBrnBGJIdTE0vYjxUVgzujUz40OpiYH4KT7pNp3Q
 KbvnL7NmWnDYuC6/mCtB9ZLZKCy8aGB2v8yvJ7f+HWP3T+9LYZDPQMrkvhTUK19npH7D
 6OSkQCWlogDFF3B5+ZVJUUt6aSS8piClk4gq99yBXj7DhalhPLaPRkFs0+VBc9Mqovb1
 y3EE8wWX6T+HR/Rs5QioRkz6RyqUZhfhre4GLsy/T03YZoyxphz/l69ndO/kGQAw5fjF
 V7Yg==
X-Gm-Message-State: AOAM530QXDxtryQLPBHuLXo6NZcYpvTMFckjAL+xg1W4D/jqCXgbpeqU
 FJuCuANs3NIN/YqF6a4iUo8S
X-Received: by 2002:a92:d485:: with SMTP id p5mr12873827ilg.114.1612754428532; 
 Sun, 07 Feb 2021 19:20:28 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:28 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 3/5] Add APIs to get/set MTE tags
Date: Mon,  8 Feb 2021 03:20:04 +0000
Message-Id: <ae69254130370fff4c9a38673deb1e3a27609e9c.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ubVhe4NXjXBj

MTE spec provide instructions to retrieve the memory tags:
(1) LDG, at 16 bytes granularity, and available in both user
    and kernel space;
(2) LDGM, at 256 bytes granularity in maximum, and only
    available in kernel space

To improve the performance, KVM has exposed the LDGM capability
to user space by providing a new APIs. This patch is just a
wrapper for the KVM APIs.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
 target/arm/kvm_arm.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 23f34034db..4a6790d53b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1608,3 +1608,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
     }
     return false;
 }
+
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_FROM_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
+
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_TO_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059e..1b94dbe7c8 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -358,6 +358,8 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
 
 /**
  * kvm_arm_pvtime_init:
-- 
2.17.1

