Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp713304wro;
        Thu, 25 Oct 2018 06:35:24 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cM3Bqp8mDRwOpXqJSIap4gnY7HYedi0QbMp6d1mfvt0nhv8Hn3FFijFnVVV6WBMghzPFUw
X-Received: by 2002:a37:8c05:: with SMTP id o5-v6mr1395982qkd.154.1540474524606;
        Thu, 25 Oct 2018 06:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474524; cv=none;
        d=google.com; s=arc-20160816;
        b=LHZ51d/Zd5J95zC3PIefpF4b6q6BKKod5vLOhQs29EU16XW88xAO2sL+kgRhyWQY9k
         HOgbzyB8tXJJc02xChlW56rV/cUdilLh7bM/7NZPUZAK6X5PR+BxGtxeSLHcjtux81Kz
         GWv47Fd3mkEzGMuWsrq/ApPjCPzXfifApNCw/c5bI36W1ItO3v+b+yw/f4uycogZwX/z
         CvT2Ztyjjk7AC/X9ZEhZlrU+70Ifkko2aGg63JJhaKTWVGrvPzJZyLYk4AVy8JQrvB3G
         E7q3ta7IPu9iBxy1mRO6l5Y3uGNicXk3mgCZT8gOGy5tG+drj35YznJc2nTZvUhEd/d4
         d8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wb8WZDz8cyKwer91PkOf1tOIj8UNsTUZ2aUJYZcQhrE=;
        b=O9f3ahuJTJu0ExM1Cpk0+rExiQs+oOUKyJ6eGDeEuLr/RjVWFSEVypZemo2kmmH8r7
         c7/mtJWZkYnqNA7pkjezxD22gycrggfZTA7WTYhx6SmG2EghkCzJdN9ICh+ACqJU15fb
         GI+6RHfWRFiuNrHFH77oGZnbFfVa2MhecaTPy9EHkNBZgXm86yxOeQt/pAVWIZ7IBQYV
         QlAEJZ0QPq8Wko448/7kOX+rtalG6GTHKG4YjjQN0taE0tG/fuok6a9jIgAG7HG4Rsc8
         f8Pjv69LhExcj2xD8XDM/7o+NpsZpqVkihKqaOOGpIOc9jeJDPT2pRAF7Y9gFcJXSR75
         8zsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4-v6si2065956qto.180.2018.10.25.06.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:35:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfnI-0002Sk-3j
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:35:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmi-00026L-Qq
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmi-0007nc-4y
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmh-0007fM-Qz; Thu, 25 Oct 2018 09:34:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5ABDA308FBB1;
	Thu, 25 Oct 2018 13:34:28 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C8175D6AA;
	Thu, 25 Oct 2018 13:34:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:29 -0300
Message-Id: <20181025133301.16578-12-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 25 Oct 2018 13:34:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 11/43] hw/mips/gt64xxx_pci: Mark as bridge
 device
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
X-TUID: sfseGT7Jy+At

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The gt64120 is currently listed as uncategorized device.
Mark it as bridge device.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-9-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index dcd1a66329..1cd8aac658 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1232,6 +1232,7 @@ static void gt64120_class_init(ObjectClass *klass, =
void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->reset =3D gt64120_reset;
     dc->vmsd =3D &vmstate_gt64120;
 }
--=20
2.18.0.rc1.1.g3f1ff2140

