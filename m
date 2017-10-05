Received: by 10.223.197.9 with SMTP id q9csp517610wrf;
        Thu, 5 Oct 2017 05:45:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAz/fg/HysgjVfUKk0igFSndepg35AZKVXKcfzpj/PDrmsVJ98Wju8Pld2oHuC+D2Qz0OVE
X-Received: by 10.200.54.121 with SMTP id n54mr31125304qtb.19.1507207542889;
        Thu, 05 Oct 2017 05:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507207542; cv=none;
        d=google.com; s=arc-20160816;
        b=s5A6PiLcyF+y8F0JpZR/lZfSs8SaL3DPRcsp53hm6FRiVkb2FUBbyHXx2lYzbc3/EK
         ADI6QbPxwFerc/InDDJTD+32LF05SWrg4+gogCI7MpWR3Nr8Lqvkfq/U2ZQ4BnXQ35JQ
         hK6sksG4PdBFhGGpdq5H4RkPIOyHKz620VGGOxhhmMPmMp1GpslBvXia5VxEF/joE8rH
         RUZemBOXV7W2bKlYtXgf2XV9bL4zvjQ1+rCgfci+5MVEnnBeghZp9BI1G5cmd68bTyHT
         wraYV3tTiA+UNcXbOYhb4ZW5uj9Gpr/I+4DBdFE4qy6pKEulq54JgYJOjUG1ne+blHb6
         la3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:message-id
         :date:to:from:dmarc-filter:arc-authentication-results;
        bh=FIRMGmjlRt+uCdgbeHHag89kwTMwdIC43vvfyxP5cz8=;
        b=mp5n0v0focLm4+VgmUU4k6qfgpFIUllFoJ6yq8E8CchHzh8xmqDET9aO8NaC+bMo1d
         1IVdAtGplx09jMAdaD8Ce29k2omz70rZWIeFiux6fXGUSoe1E3RQZ2xfIFBJLCUiw6So
         3kpEqfO/6CQJmGpyab2DOIAg43PHnmWHpGRjL9evzVdDNT186Jrkavbbx3pb6mV7v+E8
         l5oc8sNfhqp8yNQQogVGGjDUSwRbzCf2X1qvN+mztcazR7LKmeQzCbyKkHdOIgLPf4At
         xaxB3V1AbmxR0pycxJ3+LHuM1nszDC1T7xif/M6QxxW85Z+uZsGrNjAU4qkKpkGXGwqT
         aJtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si1398936qkm.214.2017.10.05.05.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 05:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e05X4-0006fj-EM
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 08:45:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1e05Wu-0006fc-IJ
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 08:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1e05Wp-0001r9-N6
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 08:45:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1e05Wp-0001qX-Gd; Thu, 05 Oct 2017 08:45:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92C8E780C0;
	Thu,  5 Oct 2017 12:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 92C8E780C0
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-25.gru2.redhat.com [10.97.116.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F00863632;
	Thu,  5 Oct 2017 12:45:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 Oct 2017 09:45:07 -0300
Message-Id: <20171005124507.14732-1-ehabkost@redhat.com>
In-Reply-To: <20171004130655.GK4760@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 05 Oct 2017 12:45:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] xen/pt: Mark TYPE_XEN_PT_DEVICE as hybrid
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Gerd Hoffmann <kraxel@redhat.com>, Jan Beulich <JBeulich@suse.com>,
	David Gibson <dgibson@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, xen-devel@lists.xenproject.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+3dGzFvzb01

xen-pt doesn't set the is_express field, but is supposed to be
able to handle PCI Express devices too.  Mark it as hybrid.

Suggested-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/xen/xen_pt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 01df3414d3..9bba717708 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -966,6 +966,7 @@ static const TypeInfo xen_pci_passthrough_info = {
     .class_init = xen_pci_passthrough_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { INTERFACE_PCIE_DEVICE },
         { },
     },
 };
-- 
2.13.6

