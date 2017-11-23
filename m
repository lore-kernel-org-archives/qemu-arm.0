Received: by 10.223.159.82 with SMTP id f18csp837382wrg;
        Thu, 23 Nov 2017 06:57:11 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbRdyCMfgve+ZwOlmJutxjzatNO0ExEeJOEePO5sipskgai7l5ZbqrxtqCs7IiCFsBp8WrG
X-Received: by 10.129.4.148 with SMTP id 142mr15815445ywe.217.1511449030974;
        Thu, 23 Nov 2017 06:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511449030; cv=none;
        d=google.com; s=arc-20160816;
        b=lvnTH/JnERDx0juOkCTCpp7cmaMljOTwDj23Bkf8QcowFA8MYvs7xplA93aZqajsWv
         xmCw7oCNKLgUM9gOPuLPiqkxLj6fCNoTo4+BuvZIidA7uR5/eTRZvfFjd8GoSssuPtxu
         yvDF4bky/JgGLSI6WtClmnfUKC7ATMDz5Ip+X5q9QJafFYXslzxiZXi1Fku69GWZM6yp
         WqvnqFxo+G+4RtaeAbg7pHtkuZRdhvePfq/M9syBjuKWJBJyzd5tL502LbN9m23PwerV
         FJ/WE7Vuld/8Q0vgeSlUfD4pYVXJ1RkKdDoHHIV+9qpBelLGlAXRhXKmHNF1XfeiV2EN
         ihxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1+Uy7Ny6agyOMhbQNxuYLyF1liV/Du1sMD8s31TgavA=;
        b=CCAyD+NLpYu4z1O0UdYZ5xlifzv74KbaDZRHBLFF6yc4v0L6bNyJuAQGT4BQjxcKXZ
         KBrO0cCPDyMVnhDG6wuum20ILSdE33Se5BpyVQc1PH/y4a15BbdyeTqeKAkhwxcDaI5V
         zSuitvKLtfWOvK9op3/mAstchMjGPD1A1iyh4lENZ9TFsLizR0ToUEQH8IGdyLHcBAsS
         xCleBVBypaKo4wNC0fHjcYsGu1tCPupDPeYzEk5dpMPVpWx5jI8QFkPoEPqq2az3KGUI
         ufDCNI6AWXzASrBvJNevcFzpbmgPz1PovXwzm2VCXpvKVF1G1KORPWIA6zH6pcR1rD2+
         4img==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184si4237242ybc.419.2017.11.23.06.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 06:57:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHswA-00029p-Ce
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 09:57:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvu-00027k-Lj
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvr-0007pL-Ba
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHsvr-0007o9-5i; Thu, 23 Nov 2017 09:56:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08B9BA1433;
	Thu, 23 Nov 2017 14:56:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2245D5D6A5;
	Thu, 23 Nov 2017 14:56:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Thu, 23 Nov 2017 15:56:14 +0100
Message-Id: <1511448975-28326-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 Nov 2017 14:56:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 3/4] linux-headers: Partial header update for
 ITS reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v4ctY1t82+lf

This aims at importing the KVM_DEV_ARM_ITS_CTRL_RESET attribute
which allows to trigger a reset of the in-kernel emulated ITS.

This is now upstream but not tagged yet with v4.15-rc0

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/asm-arm/kvm.h   | 1 +
 linux-headers/asm-arm64/kvm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index fa9fae8..8dd0ba7 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -215,6 +215,7 @@ struct kvm_arch_memory_slot {
 #define   KVM_DEV_ARM_ITS_SAVE_TABLES		1
 #define   KVM_DEV_ARM_ITS_RESTORE_TABLES	2
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
+#define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_TYPE_SHIFT		24
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index d254700..2585a50 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -227,6 +227,7 @@ struct kvm_arch_memory_slot {
 #define   KVM_DEV_ARM_ITS_SAVE_TABLES           1
 #define   KVM_DEV_ARM_ITS_RESTORE_TABLES        2
 #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES	3
+#define   KVM_DEV_ARM_ITS_CTRL_RESET		4
 
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
-- 
2.5.5

