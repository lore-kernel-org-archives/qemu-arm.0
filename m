Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp714005wro;
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cGV4UIPDH1uJkk2xuN0lbY6eflWlDU0Q3NngNTaCtzmv5pE5av5vZoTYpcPu+nzI3sq/JF
X-Received: by 2002:ac8:23ed:: with SMTP id r42-v6mr1447159qtr.89.1540474565639;
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474565; cv=none;
        d=google.com; s=arc-20160816;
        b=ySg0ms5i4fDA7CS/EZZMNmvA4g0+xxohmLRcq5WfIL5RKltV5LboXL1uXYmLOF5Cju
         fywvN7pDmfYYWNy80XxaZP4DgqusBCE7lx5WCZ+14MvPIyZvv1I+3Q3r/tGgT7cmmxP9
         gwqUwUIEAV/YWT57cJ5b3jCtoZUq+3ttsEWULeLtJVzprDsYF04G3wl8nj0UaS2HzWbk
         R6B3AeFFKBYJTHNclS2wb/im7r1D6BsA5cCoGgSCQ6tklprdjgOC/yyddXSPqs7iROpk
         1ko6JvpN+dqnxcnkvGsAnV0nj1MXJ/y7vUsJg+tdvu9rQOytQyB2FCYr1sQlFSRZYLRS
         ZWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zFW/wzB5KbB9uqGoUZY2mDouyH9lB/LspIwiAY0t+AI=;
        b=sf1PIcWQEiro/OhHnPRxiVSMfHdTTMyFIiZbT7ZUTlbigZk9HOSJN6rJP6cDJjHFgn
         qWe3S4EoM3jus8NU7/4ZF5RElF/mF6B1RW3afDysesLi8YU549zMMp0Gv14pZ7KEF95P
         HGRpUox1CL94JBOhzYwEZCM0PeYM/MKAhUbB6F2HeZFgBtLSwDBDgV9QCZo4GymZB1p5
         kC4qY++OszqeSMHEWXm+8ndwI0u6WHUJkUqVPhJOAxwKfo/7XkClcW7290vx5x62LfGM
         jTJClBTKRRD/n32kqBUdlWWs6YDDMfCUnJQZhECIONR4EWhju3BjMG2yuDjAoYzj5VHb
         caZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e27-v6si389291qte.213.2018.10.25.06.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfnw-00033N-In
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmo-00029S-3S
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmi-0007no-DZ
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmi-0007mf-65; Thu, 25 Oct 2018 09:34:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A548D36A5DC;
	Thu, 25 Oct 2018 13:34:46 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD9F60603;
	Thu, 25 Oct 2018 13:34:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:31 -0300
Message-Id: <20181025133301.16578-14-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 25 Oct 2018 13:34:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 13/43] hw/alpha/typhoon: Remove unuseful code
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WaIftNMFdGjs

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181002212522.23303-11-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/alpha/typhoon.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index d74b5b55e1..8004afe45b 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -932,23 +932,10 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **=
isa_bus,
     return b;
 }
=20
-static int typhoon_pcihost_init(SysBusDevice *dev)
-{
-    return 0;
-}
-
-static void typhoon_pcihost_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
-
-    k->init =3D typhoon_pcihost_init;
-}
-
 static const TypeInfo typhoon_pcihost_info =3D {
     .name          =3D TYPE_TYPHOON_PCI_HOST_BRIDGE,
     .parent        =3D TYPE_PCI_HOST_BRIDGE,
     .instance_size =3D sizeof(TyphoonState),
-    .class_init    =3D typhoon_pcihost_class_init,
 };
=20
 static void typhoon_iommu_memory_region_class_init(ObjectClass *klass,
--=20
2.18.0.rc1.1.g3f1ff2140

