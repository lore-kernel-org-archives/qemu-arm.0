Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp981839wrq;
        Fri, 15 Jun 2018 08:27:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ+HZOh8Em+OnQ2Ttf1T8cOiAJEpNdcbEQqDxk3elfr/3bkntRgNfn+YaYUNJ2JuKvHRYU1
X-Received: by 2002:a0c:8831:: with SMTP id 46-v6mr1789003qvl.13.1529076421501;
        Fri, 15 Jun 2018 08:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076421; cv=none;
        d=google.com; s=arc-20160816;
        b=p7ZS9b/zeAMUsU7yZ/TvBq1a++ZsKKJx2vyJFwe0pOjKAp4sZ2BQTfS57901+OJFnt
         M4nsju7lz1nDbWXSyBe2fJUY5aH9lDLpsJEXqZLKtlMsKLLiD1/amCJNDagDtza/4KQN
         YR1GsifPTwH0SoxgWqtfUqZpmGzEpxmpgn883Ci1K0n6EDx7c76HCIGEpJwDtsjCF8yM
         frd1WORSWP4zkhRXFCel7mxbWABfWtJ2PO1efzdoUZzwmCgariQ0RdjGZf56OztF7BE+
         Du49fjR/jXl+HQ6B3/CyOgWmGrlsDaBWIuXy/3NAcVUNbYT+htWcqLFSj4IfRm6vwuZD
         D4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=36Ad5l3w4Rce/1r29TnvdNQY4DCPrvvOL5m0//Zf3t8=;
        b=TIlKJBlVkaaKufmrajkIS6TEJcUUk+As+9qmeRjOXjwniUD1DEBejAQRLFNyMB7fsq
         zCVVev8D42wVLPILyjVQsE2Ao2lp6qhW3fAzyH7szIg7lApWyDmERxGAOUmBHVp0r6Q1
         cl792HXO3gJnM8BCnKrQHpt6an8yjNiIZlOEqftvg5Z4MXhjCYvrayLqf+aHxsfrj2VK
         cp0oep7wWAyTBUULkaLn11HVKLlBmDsPH82hCRWUflFrNFYNQVNdI1GwX7lhgN+gzbSG
         fuaEImrb9YKu/720YttMsAOP5YNTihrP4wKeEtmQ2zaDsqFsysQsx3VNc+OTSOhwkkVS
         4+DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s31-v6si1589399qtk.28.2018.06.15.08.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:27:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqcv-0004jp-1T
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:27:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpio-0004l7-8d
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpin-0001Kf-4B
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:29:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41324 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpin-0001KA-0C; Fri, 15 Jun 2018 10:29:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82CE34067720;
	Fri, 15 Jun 2018 14:29:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC627202660D;
	Fri, 15 Jun 2018 14:28:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:30 +0200
Message-Id: <1529072910-16156-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:29:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:29:00 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 11/11] hw/arm/virt: Increase max_cpus to 512
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1veVoXH/kkJW

virt 3.0 now allows up to 512 vcpus whereas for earlier machine
types, max_cpus was set to 255 and any attempt to start the
machine with vcpus > 255 was rejected at a very early stage,
in vl.c/main level.

512 is the max supported by KVM. Anyway the actual vcpu count
that can be achieved depends on other parameters such as the
acceleration mode, the vgic version, the host kernel version.
Those are discovered later on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5a16e6c..e899475 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1705,11 +1705,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = machvirt_init;
-    /* Start max_cpus at the maximum QEMU supports. We'll further restrict
-     * it later in machvirt_init, where we have more information about the
+    /* Start with max_cpus set to 512, which is the maximum supported by KVM.
+     * The value may be reduced later when we have more information about the
      * configuration of the particular instance.
      */
-    mc->max_cpus = 255;
+    mc->max_cpus = 512;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     mc->block_default_type = IF_VIRTIO;
@@ -1835,6 +1835,7 @@ static void virt_machine_2_12_options(MachineClass *mc)
     virt_machine_3_0_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
     vmc->no_highmem_ecam = true;
+    mc->max_cpus = 255;
 }
 DEFINE_VIRT_MACHINE(2, 12)
 
-- 
2.5.5

