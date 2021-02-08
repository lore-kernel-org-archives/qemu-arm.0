Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp837681lfc;
        Sun, 7 Feb 2021 19:49:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJym6F/HbV7ItzzbIrWfCP02UavPgI8LbbCyjA6WZjQ+c6LtDMjAYo6lZ9sh0OU7XL2l6w9n
X-Received: by 2002:a25:3d81:: with SMTP id k123mr21371005yba.430.1612756176718;
        Sun, 07 Feb 2021 19:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612756176; cv=none;
        d=google.com; s=arc-20160816;
        b=DJXNn9DAF+We7qeipFc75iKXEeE04u6p7rr8DY44qfy/3S5jDWuDxhKNo7fNuHZRuk
         uvM/PKDnf1mD/1/gUknngmpObaybNCW13Re7WlIGh0nXowJdbP5mSve35XbVZEBjPw8H
         ytNHd5dJWZbIja4lM2tvHpUocpJnQ0V0mMCrH1m66a/7wgxcJgz2HnvgkDMcQlpbaXYG
         PT3S/yZjLPQwEHxPejWswoU/Rp0AXy/vUGHi2SW83avGcztPpurb+7zOB7O3O3Wjd9yj
         oaoOLhZTAJLSF+IEroUntPb2koxDf7kdUpm0R/dQTOZQIuqXCLrEGvxRU6VXAxx4SutU
         u6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MGfxbUHNHVC0PoO0wrBnW/QIqjiqRvvXdfo0luDm70M=;
        b=oPezIWJhe9AzYkcZ+aQzeh9pPCWHg/D3tFjeK5ghwpk/cwXmPC7PVumSsoeXkQsjFa
         uPWvHvtlI3sGQbOd5OWllESb9G/aHww0LP0DP8HO0EpQU9Jf8P7Obg9rk07ysKd32OBP
         Z0wMYmul4uFFZ1Z6k1TydPEaoKsunLv7HneF1OQCj+ggiIz07SNucGK9dw3lB1UqFLAu
         50go7Z7gA+is16Y79MqKsDcYDqFEnO8fzERVl54S3g4NKTVHeE691UOeCaOVxFO7osn6
         oIE9K1Qlql7A054+xv+cnMPk6DrACoWZ8PdHmZw/AAO/d4XKRQtlPSrs9Y0oBQ4sKWNG
         IXpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlsvuiBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g205si15032056ybg.317.2021.02.07.19.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 19:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlsvuiBD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8xYO-0004H2-2E
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 22:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6G-0007f9-Gs
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:32 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001iX-Gq
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:32 -0500
Received: by mail-il1-x129.google.com with SMTP id m20so11450464ilj.13
 for <qemu-arm@nongnu.org>; Sun, 07 Feb 2021 19:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGfxbUHNHVC0PoO0wrBnW/QIqjiqRvvXdfo0luDm70M=;
 b=WlsvuiBDhRnYgnyXvcFFkNMd3K6x3ERkoNTdMoy6ODU8KnCwknS4rSCthu+gyXUs06
 vlKraVxJMEGyLt01ipgwpt8aj1oPd63SY4SN8zg6/AhWpMFpFxzGjZ3T4c1NlLA6xlC9
 gjrKlTizOG3jZ/n/SVvreJexpsgCXG/aRZayVVzfZGqiIUzch1hWyrHknfxPImeNkKFQ
 oasK2dkhgj8rfCJt2LOc0+1NIhLLjPK/lQt8exHEAcHI+pXr/hIMOnZDQ0QgtHY+Khu6
 1u28TbbDeM63iGjxPCUyjc4/RJxARQwuLCzDihTbE1KpOGMNl2H6P2m9lHNwiTMSnzqF
 Jg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGfxbUHNHVC0PoO0wrBnW/QIqjiqRvvXdfo0luDm70M=;
 b=afoR4nTMg52kn/+z4fwnSUk+Dnnjqc40j+KMOBesfguRx0RZ7iKEFIihv72efF2GJi
 W2eR9Q6VTY39wQKFevAQQhijP40T1i/Z8Hr1mvXeGbdv5foTLncVx+lSXYqbtfPj43Mq
 UE/zyjAdyvNikoUoiSL3X/Y4M8bHl91KMl5uikDDF6XziYk9X8d1lMJ2mA2mv+NU86Id
 cvkpmE4L0WGG7dnI9KxzHfEZmzaTax65no7izHWjAXzrlqpaemun1sJ3XN+e3fXxs1rF
 uSpelorjq5qAlWjtabsUAMbLx7F39dd/Sz17wvDzRhimxdB9vIJxq2Bd08XmUAqdVkfA
 VNsw==
X-Gm-Message-State: AOAM5324DVtpCeFN2tSmPf5TUMW4021Fq+69CPSvnEzf5hejKZqlEAOS
 NnESKUtLriSBe9lcmJOiatkZ
X-Received: by 2002:a92:c56b:: with SMTP id b11mr14584456ilj.167.1612754426953; 
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 1/5] Update Linux headers with new MTE support
Date: Mon,  8 Feb 2021 03:20:02 +0000
Message-Id: <432d5c0c6fb79e29f2e7aa4730cf4339d3d858f0.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x129.google.com
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
X-TUID: 8DYW9am4X8+E

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/linux/kvm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..6a291a9a35 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_ARM_MTE 193
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1241,6 +1242,19 @@ struct kvm_arm_device_addr {
 	__u64 addr;
 };
 
+#define KVM_ARM_TAGS_TO_GUEST           0
+#define KVM_ARM_TAGS_FROM_GUEST         1
+
+struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	union {
+		void *addr;
+		__u64 padding;
+	};
+	__u64 flags;
+};
+
 /*
  * Device control API, available with KVM_CAP_DEVICE_CTRL
  */
@@ -1396,6 +1410,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
+#define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.17.1

