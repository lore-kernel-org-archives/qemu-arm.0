Received: by 10.28.71.155 with SMTP id m27csp730792wmi;
        Tue, 27 Mar 2018 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt3U5Eh2KD4fia28lV6wy9YYSm7A0JCrWFEAwoA7tGYFW8JpIZBgN4850K44AyHbMLEbEBa
X-Received: by 2002:a25:4743:: with SMTP id u64-v6mr15544182yba.347.1522160328472;
        Tue, 27 Mar 2018 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160328; cv=none;
        d=google.com; s=arc-20160816;
        b=zgU5jPqtuVW/UlnfHDy4jkGoCjOZpvZRN0XUIUwZyvN/4rBfFwm6Jt/kL+kyoFEPfG
         i2HSZCz30J1SsLBdsykEZE3KcK/SQT9R3jZh1im0TXu+b7QqlBmUOfoj+anHMw4s26u6
         5qjolHaWpk7pqUD64ZhpEUljwCB0r5xG/MGE3kIq4XAs6kvZq5Qg/f1YAJ0BeqJBXoL1
         gwd5az/rvaPwW9SpBubTcgzu8MNqAnZMAP+yn3CAM6boGeW/wwi2Fp0/gRjLlP+aF5DI
         9j1Iwl/wZhB+6gz42QRbBOF3N7JXi/NGt6TSWZOtLDKDvNflFYEW76gyXGgZ6j9IuLoN
         NIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=itQGIDt7kXb0toYHM0LxAGqwAQ4IJ1GHS/1mpcqMrFw=;
        b=XeKy10Mv3E9uwIubYOdi/v8q8ZiOd1KJBt3MP6ds5RrRqyXFatDd9zzdjQNsf6oE6n
         LG8Bjbz9XbnMwNpBnnhp3zDD7ZATX9koCDTNb0rtfwdrjNbZPkQHF1LK0FNpQAILVf5w
         S6a0bj4FogtJ260E0CuVsMLfsilKC84Y+xFcXTVD8U4Hv/L+Nc7jf6dHDGnn+HKI63/q
         DlqILTwNe5BjIx2siz2RkO6O/Ni7VXUOqU8cA89cjpgw4i3Y4cyuiI1W2scNmZr8nSdA
         llmN7AMdg7TsSfZwgpdjHAa5ErhLJeURxKSzFYcLfbMG8API99JhJPFHhKa2a7Y1n23c
         61Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17si1396149qkk.482.2018.03.27.07.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pR1-0007WB-W6
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:18:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO4-000314-LN
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO1-0006P1-CR
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59992 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pO1-0006O0-7a; Tue, 27 Mar 2018 10:15:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D4B3401DEBF;
	Tue, 27 Mar 2018 14:15:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2196F9E7;
	Tue, 27 Mar 2018 14:15:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:15 +0200
Message-Id: <1522160122-10744-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 14:15:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 14:15:38 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 1/8] linux-headers: Partial update for KVM/ARM
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kO76/BY9FM/+

This updates KVM/ARM headers against
https://github.com/eauger/linux/tree/4.16-rc7-rdist-regions-rfc-v2

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 linux-headers/asm-arm/kvm.h   | 7 ++++---
 linux-headers/asm-arm64/kvm.h | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index 4392955..7ef378b 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -88,9 +88,10 @@ struct kvm_regs {
 #define KVM_VGIC_V2_CPU_SIZE		0x2000
 
 /* Supported VGICv3 address types  */
-#define KVM_VGIC_V3_ADDR_TYPE_DIST	2
-#define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
-#define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_DIST		2
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST		3
+#define KVM_VGIC_ITS_ADDR_TYPE			4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4e80651..25c520a 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -88,9 +88,10 @@ struct kvm_regs {
 #define KVM_VGIC_V2_CPU_SIZE		0x2000
 
 /* Supported VGICv3 address types  */
-#define KVM_VGIC_V3_ADDR_TYPE_DIST	2
-#define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
-#define KVM_VGIC_ITS_ADDR_TYPE		4
+#define KVM_VGIC_V3_ADDR_TYPE_DIST		2
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST		3
+#define KVM_VGIC_ITS_ADDR_TYPE			4
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION	5
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
-- 
2.5.5

