Received: by 10.223.172.38 with SMTP id v35csp4800258wrc;
        Wed, 27 Sep 2017 07:59:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC6ZWc3wvc8IsCuNjXXUXPKCSMsZG9+VZ8HXyvKX96QvZOFXyi+5xMIASldlJMCmsEw0Nfo
X-Received: by 10.200.15.132 with SMTP id b4mr2360666qtk.127.1506524351718;
        Wed, 27 Sep 2017 07:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506524351; cv=none;
        d=google.com; s=arc-20160816;
        b=FHX7LUBo1ecaGUEYHU/2y0uCVCSF5NNXQwF1Zm4fYfyh0CjhKHBe3J8ZCDLD2rxLj6
         xRSezthC+tFTAdRHJ2kKOsAHjQcUz3mnTlpg3mGqzCVZzQ0k4yeZHm0RHtWeRx3H5t8x
         4brBNnUSVCQWkarJE0pGgd39XIRwssozvXnbGilmvyIK3nCD/W8znEj59r6ZwlN5loPy
         /zCeRBbkRqoTE45YUUN3gQhkC94lwJvO043Kf4qZQMArOPPDORE5fTVLPLz1KRd6JO7v
         xOy3PkZMhqJY0TA7/GjOqU8vXOnjQXoIYAVNt4tIrvHUfE//FT8pH64z2Lm9pQu+J6+P
         Fszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=991PzGzLGi+qT2eD7oEtd31dDe1RKYtFQmgIvGAlyR8=;
        b=P6YM65nzFSXn6NWOCqBf1S0zU7mAK96KwMgkIWVOU9d/bjo8Irc4BDMbeabZ3gkdaA
         OUg1hluUd+nvDYeACbG1lXCEajFFScqzmiUp1AFQXXlv5EVfn5MHIAlGZj/4yMn07grw
         i5Qq75V1tbACfPhvMVjwLe/yyXrRnc+cUha1IGzg9zF8HEYhD28OJPpHnGlQYL1+NPdd
         wIl/VS8shjlZmKv9MBBxsm2ISUAoUTcSibeYhLa+nQpr+hzR9AuIu4HnlPdaClzR12P+
         3sHL/5wzCiH53HpUMMi4IUPxAZFs1/qATDCO1332BXFCazG6qRKFngB3a96N7HECZRMG
         ZnHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p91si30462qtd.330.2017.09.27.07.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 07:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxDnp-0001dm-DL
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 10:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDmA-0000ho-Cq
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 10:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDm4-0001c4-R8
	for qemu-devel@nongnu.org; Wed, 27 Sep 2017 10:57:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxDm2-0001ag-A2; Wed, 27 Sep 2017 10:57:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F1B27EAA0;
	Wed, 27 Sep 2017 14:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2F1B27EAA0
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFAA395211;
	Wed, 27 Sep 2017 14:57:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Wed, 27 Sep 2017 16:56:44 +0200
Message-Id: <1506524205-20763-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 27 Sep 2017 14:57:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC 2/3] linux-headers: Partial header update for ITS
 reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, dgilbert@redhat.com, wu.wubin@huawei.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h08L+ZGLgOCi

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

