Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2866417wrd;
        Fri, 21 Sep 2018 01:35:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYY5nr7T49TpltyE81uMREOF3JU/PttRXSd9UwcOybbbz1fLAcp7f/DkhyyiyL3uJTJJVe5
X-Received: by 2002:a37:b506:: with SMTP id e6-v6mr28744281qkf.255.1537518958992;
        Fri, 21 Sep 2018 01:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518958; cv=none;
        d=google.com; s=arc-20160816;
        b=nXHwbnSpkmgFniv4G0EMSqp4/HgCcc9lYHoKjxlXnV9NF15CO6SkfZgrKKMrLzmrby
         XCadVV3k1MUhCnj7+/m9XaVRzzyMn2AJgsL1SH93awRlTsuMlRfrryPPp6C9diRhy5Qy
         dKaBtL/5jXJtCn9diAoJTFaBTCPnmXU4RRfyYoA2AxJdiPyVPwI8pja8w8PZ3saGahoe
         K7Qi/VyLYxxSquzidLDgHWWy5Riyl/taLwZEv9yKYeVRI2medoET+Nu7aUJoToQZl44u
         WktrRWbbEc242ufw2X4C69MgzTVaDqRTL9UMkIqhovJSP36LUNgbYx4s9uDT6EuJ0mQO
         3RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Dp0GsPvW+lUup+QKXSmghuHpAr+bouxyWqGk88VG5Gk=;
        b=LPvkMAcKFZ+9AluzPeoKxI4fgqXft1pqA5qR4n57nAEf13az5CzDDPLTG4+3uN6eWu
         HCMKbs1UtLgfD6vPVEmOIi7sUzSiNosPBn/onvEBQ/8MAZOhY5AXJ9VrhnFpCyyP6fwt
         aelZnoQZ4C5sd/TNyzDMEMH4pp+cXptJbOO+Qa4/b5AZIFNYdx+EPuNieLxIqYxXmySe
         s5SaD4cMe2f2bnvMz24SdOhBw0vJva3vl8WdRpAJsyefHN8aADEZfH4KIZq2Rqf4HRk1
         EXs2oZd/24jD0XaNHeIFd7PrdoOtwHBCqAL5k6mH2xJKE8g3tLK2j6qbkA3Yk7axZ3rw
         bZXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9-v6si4401969qvn.224.2018.09.21.01.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gus-0002yD-GN
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggk-0005cL-FD
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggj-00073D-5J
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Ggi-0006vF-Tg; Fri, 21 Sep 2018 04:21:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27CDD3084049;
	Fri, 21 Sep 2018 08:21:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF69B7D665;
	Fri, 21 Sep 2018 08:21:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:13 +0200
Message-Id: <20180921081819.9203-23-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 21 Sep 2018 08:21:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 22/28] vfio/pci: Always set up MSI route before
 enabling vectors
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
X-TUID: uYrsPJuPtDfY

As we enable the vectors, we shall have an MSI route setup.
The notification of the stage 1 binding is done on MSI
route setup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 866f0deeb7..842b0921d4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -522,6 +522,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     if (vdev->nr_vectors < nr + 1) {
         vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
         vdev->nr_vectors = nr + 1;
+        vfio_add_kvm_msi_virq(vdev, vector, nr, true);
         ret = vfio_enable_vectors(vdev, true);
         if (ret) {
             error_report("vfio: failed to enable vectors, %d", ret);
-- 
2.17.1

