Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3569300dlj;
        Thu, 16 Jan 2025 00:36:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW618Bpx7eV/MSoCVNtyPsOFg6Vg0BpLvx4XOnQ/zwDjUGt1DE7bqQcRz6dXqYF4RefJvgBJ1cMD3WAxw==@linaro.org
X-Google-Smtp-Source: AGHT+IHGRTmN8rMYd6/imeYgXPR9G/DL3ApRCSacbQqAvusXzxpyarQ0IjADsPnqxTlqUcUEuWRJ
X-Received: by 2002:a05:620a:4115:b0:7b6:d643:599c with SMTP id af79cd13be357-7bcd975a013mr5090949585a.43.1737016579656;
        Thu, 16 Jan 2025 00:36:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737016579; cv=none;
        d=google.com; s=arc-20240605;
        b=ldo9cfsoLvLr3msyBPupzKlL1a7FFPbCJCMlejlUoFjav5lXd3BtkxslGD5sXNGrPb
         bzcssc+i7VNXpFq8TGPGvf8yarVT+5fmYuwA8wNnp5fBcm9J8zKvMKt9RPcAeEMHkRuO
         D8UdKHUsb3U2sV4DesaqKczsShmh9vJSB0O8DDoj2kczAyajm4tRINkVJTQYnRTSzC6T
         sH9x8/aW6vn7JcEcKOdqwBOEx/xuDioVG0hlJzebN6PMk+cdzfgbPQi5grHD0MxvkDce
         BtfSJmzQeKBeu4JZs4sc5x8M2d27OPCAYhIGhWpGGEX3IC2Blo+DAcezx6VT89hQoUZC
         Ns/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0PvPtVvY3c5O67Lq3WJ2VN61KYz0kKAN6ZEncEHPG/o=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=IR7sajtRIiR1hxs2ED5KQ8cCtTAUKcL+vTZr1wT+JTZRS+kHw+9aSz3/65vEuRt844
         do56oYlO/Vc6WBWZwayEu7Tysmt5zTo9vpgD/tB0hczqSdUbqpswBjIoctr6WcaDb261
         wNtIlgtm8eYlY+LNECyXNlpXI72FrCn4L8UsXpePApdLjSxwGFm74KwsEYyYOlVPByuz
         Tqom1cZrFffuEivqaRaR1nx/lvgi/zAIYASwrpW0r2wP58keCa+e1YnOFlP8PsPPJ65E
         IvSpMDEmh0mNvZMxMSrbqNmJXy5iO3LUv+N957wyvOY9af5RPt4CgGMNgxCLm2jPrEb9
         M1iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ToDpdmOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3508eb6si1829032285a.555.2025.01.16.00.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 00:36:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ToDpdmOV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tYLKF-0007RV-Sk; Thu, 16 Jan 2025 03:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKD-0007Qk-WE
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 03:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKC-0005UU-Cz
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 03:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737016439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PvPtVvY3c5O67Lq3WJ2VN61KYz0kKAN6ZEncEHPG/o=;
 b=ToDpdmOV7NmoEa9/h5rxWVcAyiubtTKXUEvGY/TkxZJqiRrbcmbYjGHuJMTOZlTU6pLLoC
 aZ2LuLSCzTpUHFQjgA/iVZYaKTAQdoyszWlAckQxuOShuN4ScGTMzIBWOBNHox9jdw3psl
 J8eFgU1x79qhVRfG/FYU7enAcFJGiCs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-DSUb5U3fP3y1q7PRARosXw-1; Thu,
 16 Jan 2025 03:33:55 -0500
X-MC-Unique: DSUb5U3fP3y1q7PRARosXw-1
X-Mimecast-MFC-AGG-ID: DSUb5U3fP3y1q7PRARosXw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 512F219560BB; Thu, 16 Jan 2025 08:33:54 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.32])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 48C9F30001BE; Thu, 16 Jan 2025 08:33:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v4 1/5] linux-headers: update to nv-next (Jan 9)
Date: Thu, 16 Jan 2025 09:32:14 +0100
Message-ID: <20250116083339.674344-2-eric.auger@redhat.com>
In-Reply-To: <20250116083339.674344-1-eric.auger@redhat.com>
References: <20250116083339.674344-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L7CYS3xTp/Px

This is a temporary linux header update against Marc's nv-next
branch (from Jan 9). As this branch is continuously evolving I made
a snapshot at
https://github.com/eauger/linux/tree/nv_next_jan9_2025

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/asm-arm64/kvm.h | 1 +
 linux-headers/linux/kvm.h     | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index dccd5d965f..b81e7d81a1 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -397,6 +397,7 @@ enum {
 #define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO  7
 #define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
+#define KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ  9
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
 			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 3bcd4eabe3..1c8431ff43 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -178,6 +178,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_NOTIFY           37
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
+#define KVM_EXIT_ARM_LDST64B      40
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -391,7 +392,7 @@ struct kvm_run {
 		} eoi;
 		/* KVM_EXIT_HYPERV */
 		struct kvm_hyperv_exit hyperv;
-		/* KVM_EXIT_ARM_NISV */
+		/* KVM_EXIT_ARM_NISV / KVM_EXIT_ARM_LDST64B */
 		struct {
 			__u64 esr_iss;
 			__u64 fault_ipa;
@@ -925,6 +926,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_ARM_EL2 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.47.1

