Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp722367wro;
        Thu, 25 Oct 2018 06:43:35 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dMQwaVtgA0qP+p4uEzJkT3owl0tbag+NOBaSQJHs61MlzASWMH4IrjVbSiBoPpf4ZDFOAv
X-Received: by 2002:a37:2491:: with SMTP id k17-v6mr1416916qkk.201.1540475015197;
        Thu, 25 Oct 2018 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475015; cv=none;
        d=google.com; s=arc-20160816;
        b=fOH4JcR+9rpgp/mIEUOoe9zQY5aQ59XlJSChamyZZkzX/UGK3NJ8UDBjPwJVIMNFuv
         uJadnteTqPPl2mIhfCaLlQxnXhbNJHnKIdSK/YnEb3LI7WObJ6tPfhNS06ltJhU42dRh
         6b54rvO+2DDtNWtb71DxOHf5T/OMB97xod2Ggl0ys0qDbgrIpgPwHmWT7vUe3IrTuPC2
         g5GUrPFrV0amHrGbmjEJIXaExtuVOqirZOhaix4t3QeGaI8XsFMSUYMESQeFAhF8KY0T
         K0YsJOcYobgfOtQmRaBO9AjTdWFfS+sHGhJjnqKEzBlGgOLExbYekpDJTFKja2Aruy7y
         oVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UvMCBb65BLJH0CdA5y5urv/3aRCu+beA+gHles/vlhA=;
        b=tsdQx23cV507buWys3y7hgyyIkI0+IcXequkYzKLq8ykMgU7ghfAfyuWCwCHiYvByT
         02lVwhG+l2Bexl6NjG1FwGJbYGrEEnJLu1e10esSI2dIjD6wnsGkeWGSRaPmAq/VcKRQ
         gN+ngWnjMBtPhOtnOT7BCz8H0H8uY5sJ+GelRT4XDkZ6hk1OpI/hL7+UH5HE4e5Jxvqy
         ql5qltx0UmI6/1YKArWEe4qDu5Cyfa/KzxrELYj1gvnxrtgDqDrvYAjfKA2aOIx4gy4N
         sttjnnRlQWb0iTQv6a6pz3m570EuAHlm+xlPnK+C4EqmSYOwVdxT6A4R278cbY3kOi2g
         mWnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si2773627qvd.7.2018.10.25.06.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfvC-0001de-HY
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:43:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfml-00028V-LZ
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmk-0007pU-W9
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62487)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmk-0007oz-Nx; Thu, 25 Oct 2018 09:34:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC5B585A07;
	Thu, 25 Oct 2018 13:34:49 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DDA560921;
	Thu, 25 Oct 2018 13:34:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:32 -0300
Message-Id: <20181025133301.16578-15-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 25 Oct 2018 13:34:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 14/43] hw/hppa/dino: Remove unuseful code
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
X-TUID: QYGCOjTltpJS

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181002212522.23303-12-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/hppa/dino.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 564b938e3a..31e09942b5 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -488,17 +488,10 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     return b;
 }
=20
-static int dino_pcihost_init(SysBusDevice *dev)
-{
-    return 0;
-}
-
 static void dino_pcihost_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    k->init =3D dino_pcihost_init;
     dc->vmsd =3D &vmstate_dino;
 }
=20
--=20
2.18.0.rc1.1.g3f1ff2140

