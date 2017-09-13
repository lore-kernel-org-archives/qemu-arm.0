Received: by 10.223.172.38 with SMTP id v35csp834229wrc;
        Wed, 13 Sep 2017 02:47:31 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBSFjY/Su/rhqX9wGXHIphwHdDaBNHDtV+3JXLkx1W3RmCrL6pX2cMB9kmU7yWngl/esafP
X-Received: by 10.237.53.86 with SMTP id b22mr26218859qte.33.1505296051755;
        Wed, 13 Sep 2017 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505296051; cv=none;
        d=google.com; s=arc-20160816;
        b=CmwjGwvaGS2XmPGmdZcpeMW3V0NPphbMkrI3K03f9spp1x1JAr0+RVK4mq/GW8sLWz
         FqvHi+qBGVkVYmCJwh+laMAI3d4zG7cIHARhsxY3DKqXTHW5lxCSG21BZG98N20wGSEs
         WGIqv5zNWmN3zftMdr1XPmeChe+udbgG24r88Gr1yhKQvHiBo+KW05ddXDAfMtAabbCB
         GLiYygKkdcXMN7KD0G2Pn8U+aMoJb6PZvUoJg3ka5sCeUO3vBspKESOmpQftkGfZ2BwC
         2ESLKOydpVxS3O1CjmGemBHPT7+4kazCyBliK+5pbgq2YCiD51Crk0Jlg17ybca3dvBA
         hfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=q39QnIoywtawbcTnlJIPRNPm6dM5AFNtP0K5J3+pCM0=;
        b=POdrMPxSB2br7PlD753BX8HpNTYdFXzJpq5LOeA7qlkAbEh55sY0GKoBcbE5URQN0O
         lMh30UAtFNMNOHJ6aWQ51CqUY34pcyAL4oxB+K3ox5rKIefWNLgGOsuBhzfaRIpUrRXl
         tRdKVkWfT5Vj+/kJr5T2gnU90gotZMFgmfngPq54VkjWZpcoXqu5ZbCYHRxWx9errSs6
         WdA80wtvAlYW0fMGrmUQgdi8sgaXAk32eQRawm3djVkOgc068RcY8VuZwGq+cVxwYHMY
         746t50zePvR0+Vcxo1JAMIWbPFkGls3IcGRtr1YhtBcVwVlOtWaA4OOqLXNKkLCjkD3l
         056g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g64si11230658qkb.485.2017.09.13.02.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 02:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds4GX-00005F-Dc
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 05:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4GE-0008Qc-5A
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4GA-0006Qg-8z
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ds4GA-0006P1-3S; Wed, 13 Sep 2017 05:47:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B70781DFB;
	Wed, 13 Sep 2017 09:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1B70781DFB
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3073360841;
	Wed, 13 Sep 2017 09:46:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 11:46:43 +0200
Message-Id: <1505296004-6798-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
References: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Sep 2017 09:47:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 2/3] hw/arm/virt: Set INTx/gsi mapping
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHTGTYuTQWrY

From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>

Let's provide the GPEX host bridge with the INTx/gsi mapping. This is
needed for INTx/gsi routing.

Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Feng Kan <fkan@apm.com>

---

v3 -> v4:
- don't use GPEXHost *s anymore
- added Drew's R-b
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fe96557..cfd834d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1057,6 +1057,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
     }
 
     pci = PCI_HOST_BRIDGE(dev);
-- 
2.5.5

