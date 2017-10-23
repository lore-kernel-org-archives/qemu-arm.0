Received: by 10.223.161.27 with SMTP id o27csp1011wro;
        Mon, 23 Oct 2017 08:38:21 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QPEurTrkLe2RaPa/g/Z0jcWoB1BFn8PgsfbrOEZSVhxAtCqYgA1+D2ISA5yQ9ub/VfYZ15
X-Received: by 10.200.22.234 with SMTP id y39mr19592292qtk.59.1508773101095;
        Mon, 23 Oct 2017 08:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508773101; cv=none;
        d=google.com; s=arc-20160816;
        b=uxASVHXOzhfdkofdO/snv1CJRGKel10wO3d6mdGfMWc+r80WnZ1qzXKcnM3b839Gzu
         q8OK3B/cQ6dBOAbMrMuCrS/Kh5KGrJmB+kCwK058glajoXDc/YUYQGL1nTD6N1D549/z
         C68lHiQcqXIp6OKcQgw8AHhZtpB5q4+9MSQob0zY78Cwzsh06qswxmtI+DP2f5gxEe9R
         FOp1AAKZM5VYG9C8c4/6vb0t9b948AubqmP/6Vy/f2sw4wk6fB7LPYagtZcYL+GRPblP
         KBubziIXEpbSiwgRB8nzkE/z5aOTbh5lZuhogDxfUNBsIcFidoLcmDoSx6zSXCu0L6oM
         iVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=991PzGzLGi+qT2eD7oEtd31dDe1RKYtFQmgIvGAlyR8=;
        b=TaIWaPYl6DXueqoueZaG1y3E0887nVKRxAguHAaWLJZSGvTWtlhIwjh+DhX4LitDe9
         7Ujt/K/OMk0gO0o0GIpGTmuTX83MbpRQXTGD3RFdQaeXjIn/W1f3HLf7ZLyO0e7uUTsS
         sUs0hlCpaYpiZPgDgwBmq2KFlPWc1lxxgwu/8HZ+nCdYH3q+yHAyxvViiBR8jMl5FgEr
         GNaL0HvWDHM8Zy0k7nOnv7HYms2reD3OhWRsoNzA6byHKGh7Iv9amS4a6SVALiCLTO9f
         tU1uSz+C+6TZDZHo/0q/rCFrJ5QbVYefto3qvIQnEUFxnZbmVtq41uYM83Fm5ETbqy+i
         83qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si6387599qtq.459.2017.10.23.08.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6eny-0004FS-So
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:38:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elt-0002iq-VE
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elq-0004kD-Re
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6elq-0004jn-LG; Mon, 23 Oct 2017 11:36:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A6F43E80F;
	Mon, 23 Oct 2017 15:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9A6F43E80F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E6F66031B;
	Mon, 23 Oct 2017 15:36:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Mon, 23 Oct 2017 17:35:36 +0200
Message-Id: <1508772937-21054-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 23 Oct 2017 15:36:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 3/4] linux-headers: Partial header update for
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
X-TUID: HsuBUudfyOQ2

This aims at importing the KVM_DEV_ARM_ITS_CTRL_RESET attribute
which allows to trigger a reset of the in-kernel emulated ITS.

This is not yet upstream but can be found on the
follwing branch:
https://github.com/eauger/linux/tree/v4.14-rc2-its-reset-v2

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

