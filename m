Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4643894wre;
        Wed, 30 May 2018 04:47:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKWLUOKC9TQkLAaR384kTxbtJZho+EqfepK174QeouDLuG79+MXUU4B9QFATM6EUaZeOt4t
X-Received: by 2002:a0c:b0ec:: with SMTP id p41-v6mr2080466qvc.42.1527680872429;
        Wed, 30 May 2018 04:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680872; cv=none;
        d=google.com; s=arc-20160816;
        b=nyfsGVctzuEAgbfobU0axSJfvq9ZInKYCgbo0jURbtBATPwc+LGz5aCOYBMG+ZLV+L
         AfVleRT+GbThsmcbYzM3fgi0130+7dwBoPS/ycZEGBqz2qDl+fO5sQ6J2HKpscfG9dnc
         II0nhKRbiM+12LwTgvjlNSPY2cCzPmdrNCcRX5mN6EmtXSUpeEmUvBapxqrzLd1B1I1i
         nKe3QZS8hLaFX3V4KTmIgedg+UwLI98A4ZLwAGbgLapl6erz0oZFcklTgQoZF0qYti89
         tua97XgYicBzHu3jPIByerOO+DdAi0sSGBpA//tGUJz7UFese8+Lfwa2r4GLEU8jU6wx
         cQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lbcigD4LW20j9Kvzd+sIWBZixkhTDss5Y4SZKXf3DzE=;
        b=gvPsZbOotwpSIMiqi4JT4Iu/PuVUC8GzFT3Q6G/ss4XWmsauDtVVEZQDqDgDNZwAfw
         3ZqE7SQSllPiS6ZR9kWWtGnXSQJcdS7FCEl0Kv2QBzP4Y7mmFyxqC6hI4L/xn89ScwPu
         Unsp4/pHcK2Z8cS5K+TrzXp/DFwvKVsZXgCu8kqAm4Hd5YRrIg4oowPhCgR0ggY9inMz
         1Tlvjwix4m5vanzD2pPVTMKvdmYjhL5iCWdBiF7FAz/IpR+ubO4xDs4n4MWghUzPH/wv
         Z8qWh6Utk6YjeKvfOoHzzAkt45vgkyX+2eBAHmN9rpmUtIEDhytMl2LLq394U9pxRf9M
         2xqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 73-v6si16528855qks.55.2018.05.30.04.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNza3-00069P-Te
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYF-0004kW-OQ
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYC-00057H-GJ
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:45:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38270 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYC-00056o-BQ; Wed, 30 May 2018 07:45:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FE465BCBE;
	Wed, 30 May 2018 11:45:55 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 993D610EE95B;
	Wed, 30 May 2018 11:45:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:34 +0200
Message-Id: <1527680741-2725-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:45:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:45:55 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 1/8] linux-headers: Partial update for KVM/ARM
 multiple redistributor region registration
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUjjnktW1z6q

This updates KVM/ARM headers against
https://github.com/eauger/linux/tree/v4.17-rc2-rdist-regions-v6

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/asm-arm/kvm.h   | 1 +
 linux-headers/asm-arm64/kvm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 4392955..81ae4e5 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4e80651..d41f39a 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -91,6 +91,7 @@ struct kvm_regs {
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
 #define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
-- 
2.5.5

