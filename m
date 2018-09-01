Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp619365wrd;
        Sat, 1 Sep 2018 07:25:30 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY7AN8kadZ/VaOc+pQnLi2XyjV13ZZk19771YqnuSpZkqbJb+ZMznvPkyxwg4tG4NSRffJD
X-Received: by 2002:ac8:24d0:: with SMTP id t16-v6mr20074833qtt.116.1535811930900;
        Sat, 01 Sep 2018 07:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535811930; cv=none;
        d=google.com; s=arc-20160816;
        b=LM88x5npV3/rcDaxp/4MOH30/fniGgpB0xYlcXKTlpxxbsmC/D6r2PVvHh5KN/2Uv0
         PVkLWf8szyXATk2VlktalQInWSE8BWcDU6VwsvVcKdfNuWxwkrdyVHZyFKO2DUr1xfLi
         aDH+6vU1WflrDobyLnpZgq9XSgiR6DCjVBo+rglQjG/1HJhjKvKohdIOaJUoo6TuJpqm
         kcVgldjqdVXcu93oOgjmrEK92U0jIlOSQY9RtKtEDIR3JSgHLRkcBeSQgBtazp443DkS
         DV2tPVK4CjcOED5IAr9W/Dh/po300ZNwyBxudUG0EEJPZP3/9OZP3YNjbBklNNulRToM
         v0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2hM1mf+5JcIJGDkA5fbp29A8JQ/j7C7dDKWP3JW8cEc=;
        b=Y0n+1mYPGEtIrRQfuCwB1Du6gNa5vY5MmuLLy301N0DI8zEZPr6K4zeOvJtTmy74/2
         HqFcCgJAGgoq89JBBmrcL2ku23CAcVFgEI5ud2+u7O+N4CwIgqDWPSK4Fc0HYdGUupkf
         aXjjPzETZoyRhABtMzXeIdOhtVcDGOCCte0VFWMfbDGYMo+A/IxUUkncEK3OTNMJkwAE
         kfn3hBOz5ldN1f/9VWhgrUwuzuayhwIODyGY7hBW4ibug6w4BWp7JVE5jr9HlWz0q6mO
         aurDS4kVbLO7r8vTSVklPuRfaOfhisSbL7J1bTHRVvvTlp8F9VPw6ZqpMRGJpQUTRhPt
         XJVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si268657qkk.383.2018.09.01.07.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6qA-0005zE-Av
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:25:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6pp-0005sK-3K
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6pK-0006BD-Hq
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:24:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53286 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6pK-0006AR-DH; Sat, 01 Sep 2018 10:24:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C25D3A03E;
	Sat,  1 Sep 2018 14:24:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8A812166B41;
	Sat,  1 Sep 2018 14:24:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:12 +0200
Message-Id: <20180901142312.11662-21-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:24:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:24:37 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 20/20] hw/arm/smmuv3: Remove warning about
 unsupported MAP notifiers
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b5/40OLzHMt+

SMMUv3 now is integrated with VFIO by enable the 2 stages of
the physical SMMUv3. This relies on a MAP notifier for MSI
stage 1 binding notification. So let's remove this warning.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a31df03d47..9f39887602 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1497,14 +1497,6 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     SMMUNotifierNode *node = NULL;
     SMMUNotifierNode *next_node = NULL;
 
-    if (new & IOMMU_NOTIFIER_MAP) {
-        int bus_num = pci_bus_num(sdev->bus);
-        PCIDevice *pcidev = pci_find_device(sdev->bus, bus_num, sdev->devfn);
-
-        warn_report("SMMUv3 does not support notification on MAP: "
-                     "device %s will not function properly", pcidev->name);
-    }
-
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         node = g_malloc0(sizeof(*node));
-- 
2.17.1

