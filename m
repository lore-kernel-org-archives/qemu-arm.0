Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2814056wrt;
        Thu, 18 Oct 2018 13:16:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Gq1azbd78r/fSTncRuVuSQVqe015Y9uPQve1BxNiOD/9HT63MzMC3uCVEpyJ03MaXEtL4
X-Received: by 2002:ad4:518b:: with SMTP id b11mr27822871qvp.20.1539893765239;
        Thu, 18 Oct 2018 13:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893765; cv=none;
        d=google.com; s=arc-20160816;
        b=JgaAAxfJGfgp0iFxJEwPQB+X6A0rHz4PH7CcgWw++5k4VuqQQM0hwtBsrnSSUnemKl
         fFb2tP07eIXnYEr+Aet16QK2/8o/+nk82LEOFnpI6rol4MxHS8QPHtcbAZPlwLY+qYVJ
         XxxlOGqaAASvJRn4DBiKEKHjJLlffKAFm3KnqAROc/q5tvAn2UTHAROT/iT0KfDc/lNK
         +02QafebRK1sLb5Ym5XKkjD90t/M4LzHymr0Pq+lFJxcf3N6iDhX59hY9CyVzNj2QV1K
         e32loFrbUu2EMVStxpUp1EXyAQ/iFc+NbMMP0SBhuhIbtmIwEWMUdoPf7DbstS45rvLA
         hHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UvMCBb65BLJH0CdA5y5urv/3aRCu+beA+gHles/vlhA=;
        b=dkCrpbUrn7M9hLdEmOzDANkFOHlVMCDYTta8H7wP9wOc+YWfDHDKQC/69dD7C2CIi2
         qoCjI46icmqSF0JuwzwhqYbx52yfhDuwvXM2vhWLIkhhs7q61HYCWcxv39nu51hvDSan
         HyNf6OJlchsh5kNODF3ONDfSeDnGIK12Z48bD71xeGwcI3X9ULEjnpow0ktbPK9k6Hip
         MfYMVUh620WJ1GnwoStne3A0IrJUMX3kdXeIqN3Y4GE5PKqv9Zg6fdiovTV9fFKJulHQ
         C+kYWcUqYE1C+rXDarD1hWiOCLuhf3Zn95vbO/86xglj9dr3YGZhZbKOGGXrwH0xKC7/
         qFGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y25-v6si1332367qtn.37.2018.10.18.13.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEiC-00017q-7x
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYT-0008Vc-Bg
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYS-0000jj-7e
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:06:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYS-0000hn-0W; Thu, 18 Oct 2018 16:06:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE6E330F558B;
	Thu, 18 Oct 2018 20:05:58 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09AA860BE7;
	Thu, 18 Oct 2018 20:05:53 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:52 -0300
Message-Id: <20181018200422.4358-16-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Oct 2018 20:05:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 15/45] hw/hppa/dino: Remove unuseful code
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
X-TUID: O56F8dhZjM8S

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

