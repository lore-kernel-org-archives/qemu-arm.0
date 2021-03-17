Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp226489lfg;
        Wed, 17 Mar 2021 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNBxHNBrRTKJjV/VsOiDjr9BrxygLMNELnDUclO8TDIEfuHy99+rf4PAw+P2b20Q5ChgC+
X-Received: by 2002:a25:8087:: with SMTP id n7mr3240307ybk.367.1615973407776;
        Wed, 17 Mar 2021 02:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615973407; cv=none;
        d=google.com; s=arc-20160816;
        b=HPweC0lFCvCjr3rVwQNQ17zsQO0RgD0t0iD8ymqsBwxJcK9c5eIiq5ptrCK05UW+9V
         yqG+79D5y0d9ctccVFTRcyGpIa5zErQC6RnHWyc/y0gILBR9/BbbcX8/uJJxEvz7Z8uZ
         rvfXrUGrQkup6WyrgE0wH4C0CUlZ/dn/h8kiJonT+OcO7vufpTA1O+aIAXzg8GXUxKMw
         PaMqZh7xIsq7RyjQtTNSS+2RH9Ahf1vPMdl9tUY1pGo8mXyUtls3BlltcjXGfTsArctW
         Bg6Dy/heLR3xTWt3ZVZn4O1uTY7pb+Qv8mqKfiefv3p8lpJNoeEGIgfyHRhl84NulWua
         hPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kaO/3XjDddPfI9XqP7E0JoVJAI1xFWhKSBbTYqDo4uw=;
        b=gnsibdk6F4cnPIPIBFgI1fGhLItJSKYOnFMz70uRe1Vyr0CwpMcJgvBQeOu9yOvkZl
         soX8a2uzU0p+2gbs1XZORxROLmqGgYTQp4uiVk9nRPWgCNjLBlC8qPp36Uk7A34upPYb
         DI6/rSpzlD0Cju67UE+1u5EBz+KTcp0cZL1TfKiMc1XqoYsC1XMcI0HrTasBTZ1NgG9r
         Mrg65CaB4u0hFB1av2CYxcmI9i5uLTyOzD2Ly2bjGzW9p0ox722M/hrcjjy8tAxP2CAH
         Fu/PNlOqlov4lxonujSUTAHd3Wzid9Fcr8GChlw9o9ASzrYgJmCCwOctXn9BGowd1C1B
         k0HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P9kRGEj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r35si21573259ybd.335.2021.03.17.02.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P9kRGEj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSVD-0002ym-2h
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU3-0001uh-2n
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU0-00016B-Vf
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x126so697279pfc.13
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaO/3XjDddPfI9XqP7E0JoVJAI1xFWhKSBbTYqDo4uw=;
 b=P9kRGEj8r95nOVyfGoLgAjvUiNZr1RHZiuytUoHL9d7+8P1Gw/rvOHNNbYsqpIjYI9
 Wz4uoLyZvg+jANcAIvczMMdSj6O3m3dmg/wdcQJg0Nu+tbpUq+IC8HJMXNtQPcUy2IAB
 SK3V1r6tEmf1BB+2lssC6alP6HgvyIe+kfC/XbFDbuAsYksko6sp8PzDJgWFYmnh0BLF
 moJDHvUKDNuDjrocWv+a65itCWQ+CS387/b4LYCDL/H+iPBvzJGlb1yJcwuptTPPmEAP
 RW9a6YT2oj4KgVPwPbnYoInusWDTuzbhoZdzd19Yt/BVwpg1p8FP9RT8XMzn91LRtTKT
 0bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaO/3XjDddPfI9XqP7E0JoVJAI1xFWhKSBbTYqDo4uw=;
 b=SIdMHL0IOBc5P96ZY89xS3XqqURjOfHMXjwbdqtSnBydgB8SxR399265SoDzEYaZUq
 LM1OaR33SJ/GHUEx8acYVZ625d+DF8eXA1/6UTWK4D8cj0jtdc4rPMcn/mQS4EAOVSkB
 c3dYpRMXGC0mGQz2GTyAYhzlCXnRIzNe97ctF1R0oCn//luk1YAvlZeYJt8ma44TZjD9
 ZU638+7O9X79Ex3Y78DcNr4kqXTesMSA5MZdyfFZ+TvAFOSJB+UXmZZUK+Z+glhQ55i9
 rb43bJVcQHitJSCgP/rUtKuw0k3ZXD397fYz4Iwuq+M7EAucjSt+pK27ZXWL+dDWIRyq
 a5nw==
X-Gm-Message-State: AOAM533dq2p5Q/u5RFqdENrHMghHdFJlBqn9cDyYi08l3eGVL8PfYV85
 1CKmAk08GjHCXLDvBJn1X13T
X-Received: by 2002:aa7:9532:0:b029:1f8:838e:7773 with SMTP id
 c18-20020aa795320000b02901f8838e7773mr3426574pfp.15.1615973331737; 
 Wed, 17 Mar 2021 02:28:51 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:47 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
Date: Wed, 17 Mar 2021 09:28:22 +0000
Message-Id: <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: CPNWxTtEviOj

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
index 73a191f8e1..3157025316 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
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
index 34f8daa377..bbb833d6c6 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
 
 /**
  * kvm_arm_pvtime_init:
-- 
2.17.1

