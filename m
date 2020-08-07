Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2427308lfy;
        Fri, 7 Aug 2020 01:13:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE8YpotxRgenX2rePvPeIW+MgXfPI0LFkyx9gqKGW3QDsgcaCMSaZjGaXZpsPU91Br6Qcd
X-Received: by 2002:a25:7809:: with SMTP id t9mr18633536ybc.359.1596787985128;
        Fri, 07 Aug 2020 01:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596787985; cv=none;
        d=google.com; s=arc-20160816;
        b=vTm7IF5k2F3caFDIcl3gzS2Baf9+Pb6IZnhk8VNOYe/vwLuNqpqs2+vmsyBgiOaE4z
         qof1kfAMPiPP2yMstK9PdLClucHUk8TV65+d0M1SfnNSPbyuk3KyuH7UlG65j3/lsNEc
         gSF/ro0R2GzLeUi72BaGbmBg06hE1B4EJC0oLulZdtZMzsEW1aQl58tJBwLrJcAitCf3
         Up82igjkfI8RxxjHyaJRFWnBXWogUwUZXXWMDW6p0t4hyuYVziKgtXKOLmqY3J2Pj/bd
         qRcPqZ2dhgBqhsTHgz0X+DojSkNyM62mHT+xjYDacKGWCJ9KRITc8kwr0jmYV4NWruoT
         KXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SVvavflqwBHyVfPeo3WkPtz2sD2s7cZLSNZLl+ZfUO0=;
        b=zzRWK5u1VAdBG3DUX/9JAwcnO3rs9B1nw9hwy5h965QGRWwDMI+Qa+nMn8HsV54yzl
         Of1XYbfNq817Q77TfDx3LDbNxc7wGV5Tm0QjOxrmsOU50P9U3Ifhh7JXEm54umgbCs7l
         E7a+4QTiXlaaT2xOMyTFKBpPiyBLJyrgrgH36irlVthH2kLf155yldbL8uq+NYg4D0zE
         eakdHnsSBf6XB926NVrhLQKpd8N/lE+dHFJ/cWQT8ee7yhdzZMeWuwJWKVdbsUPeU14P
         PBdbJ+OnGI0m3LpGca4K34U4WcsRHlIfimOiXBZJvXlPrktAGaSv3IsfcZ0yTpYyCnLi
         +hRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCzc8Gm9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si6819686ybo.449.2020.08.07.01.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCzc8Gm9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xUt-0002DI-Tl
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSf-00070N-QL
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:45 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSc-0001h6-EG
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:45 -0400
Received: by mail-io1-xd33.google.com with SMTP id g19so1057948ioh.8
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SVvavflqwBHyVfPeo3WkPtz2sD2s7cZLSNZLl+ZfUO0=;
 b=hCzc8Gm9b7h0j1Hij+WDaaowmrvNimX4GLIJ5eYjCHwjLaascuNQMt4q+J1JY/4Egr
 uYe8ayQhzwq6LZ0iGU+UFPdVhqcOygM+IVAGdQMAP71UCUtiB6XDeHv0i3ktSYYwr2uP
 eMtQw6Si0k/wMY5beDVkS8SlIpYS/3B+4WGpvmBdKYa1Cu5fJnsnWSKN9D9L/wedDaq4
 QJid3NW4x6U0Cet/0OgnNq78Q0N7ShXFVbK4GKGz+TBuYPbyyTjCFjn+Tse0rA6yDURL
 jxd3Mk9CohNsdBvLw++zalcMUvml5kuc4NDbB1bSTtQc3eo7a2RxvyUf/CU/h/Glh5Zd
 1vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SVvavflqwBHyVfPeo3WkPtz2sD2s7cZLSNZLl+ZfUO0=;
 b=PSgN7oeBkaKY3+BZ5WMjAUTEcldEcXip7Wst4WKHsFV59qFQYLPCKQ9Lm2yZAOXEMN
 BDHiLXRk6E0jjKj/r9RNffGRIARWg2Lf9J6ODEHIt6Ak0fpRFc9v8qoG2ma3WLu1vsYx
 hjYnRLjPs1qh9aPgpdOevAeWHa7msqEUwaW1Fhh2hIudcD9bjesumyyuaJY4pusEBL6u
 su6pr2QaWrbYK/mgOYZdyZWP2JMg6K5GYHvtFynfO+DYp6QzvvwKHLhvy+MYzGU0V3/w
 dckNdxQaFC/NxoXC4CLl8poheFwcShBeIMtPrSV6tpdk8kGxdt0NywXuK98kheHZ5Ajx
 ZiJQ==
X-Gm-Message-State: AOAM53018rkNm5AzX3mSCnOv3iAJq+bzhD9IX03xipNxdD9NGyPlHdnX
 v8g9tz5GcCOAZBWJ09bRbrFN
X-Received: by 2002:a6b:8b10:: with SMTP id n16mr3242360iod.11.1596787841141; 
 Fri, 07 Aug 2020 01:10:41 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:40 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 1/7] update Linux headers with new vSPE macros
Date: Fri,  7 Aug 2020 08:10:31 +0000
Message-Id: <4da5af14d6f0c0adb112d04eafa0a488ab924439.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd33.google.com
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/vs0wgP+PBg

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 4 ++++
 linux-headers/linux/kvm.h     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 9e34f0f875..802319ee02 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_SVE               4 /* enable SVE for this CPU */
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS   5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC   6 /* VCPU uses generic authentication */
+#define KVM_ARM_VCPU_SPE_V1            7 /* Support guest SPEv1 */
 
 struct kvm_vcpu_init {
        __u32 target;
@@ -334,6 +335,9 @@ struct kvm_vcpu_events {
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER                1   
 #define KVM_ARM_VCPU_PVTIME_CTRL       2   
 #define   KVM_ARM_VCPU_PVTIME_IPA      0
+#define KVM_ARM_VCPU_SPE_V1_CTRL       3
+#define   KVM_ARM_VCPU_SPE_V1_IRQ      0
+#define   KVM_ARM_VCPU_SPE_V1_INIT     1

 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_VCPU2_SHIFT                28
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366737..35ef0ae842 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_SPE_V1 184

 #ifdef KVM_CAP_IRQ_ROUTING

@@ -1671,6 +1672,7 @@ struct kvm_assigned_msix_entry {
 #define KVM_ARM_DEV_EL1_VTIMER         (1 << 0)
 #define KVM_ARM_DEV_EL1_PTIMER         (1 << 1)
 #define KVM_ARM_DEV_PMU                        (1 << 2)
+#define KVM_ARM_DEV_SPE                        (1 << 3)

 struct kvm_hyperv_eventfd {
        __u32 conn_id;
-- 
2.17.1

