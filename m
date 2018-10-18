Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2811074wrt;
        Thu, 18 Oct 2018 13:13:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60h+WKUurJu7naYJVmJtwFvAfM9lmO6JdLxc4sjiVBEwcCY6FXZTRps0NDFgn7oCy8Bfrad
X-Received: by 2002:ac8:39a1:: with SMTP id v30-v6mr29660191qte.58.1539893609425;
        Thu, 18 Oct 2018 13:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893609; cv=none;
        d=google.com; s=arc-20160816;
        b=g/B/87mQWBl+4AC/73no6e8cxvLNCF7UMCtuNANaNIAB6p6hHuItHV1rvR/IOQnN8i
         5RJZKOojRJJ27dx2x04DXnBcUqFmL1DPUQiFsUs0S8Jxg/0fnQbjhqGJ6m62gfAX+mPx
         w4mz/c6o63lu43NnwEJqFSkGdkKWHMD9cH1kWFqevrRZ6W7cUW2HRrd+6ueHcIDUbfVI
         RbG94muj2a2igZKXZailAp3+JgnSvUE1yvEg4olFY7fFyulBERMYKU4JgLhtTrJvfVxJ
         sF1/Yem6tlawRROKg6FYYBNuOA9ObP7IVpWY4PXsHb0oZb4KiUx2GJR24tFusDL243Q2
         66RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wb8WZDz8cyKwer91PkOf1tOIj8UNsTUZ2aUJYZcQhrE=;
        b=NgiavSaMRuHaGFTnN7TPxq+j/IhSLaRwBgCCu37lP4erJALHILrnL6RqnzSNNej3vj
         Ch5G64fgl8gB3fDrmqgbLf8TydXMIFrqoutnhK5XqKC0EUj7B81w6HIT/hIhkStAJnCU
         7Uv0RqRyeHdD3jEt3R2sBlAHJWEiLpQjvvv5iQ4RFwFXM8kzbyo1VRvaXpCiex2IDKgq
         +icDSm46FQxLLiPO9uWzP9L1wG5le80VpOWOKaxI9yTsTLaHrzamEBcXxpYM1pcK2KiC
         t/mfNoAvBoNSjuJT/eSpbi0iYIYa5Iez0H7Un6GwOODwX4pXymYAH0RFWKL3GmXfpLxi
         aGig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r48-v6si14551713qtb.257.2018.10.18.13.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEfg-0006E5-RV
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYM-0008Oi-76
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYL-0000Ia-Dx
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYG-0008N3-V1; Thu, 18 Oct 2018 16:05:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C010B3002F8C;
	Thu, 18 Oct 2018 20:05:47 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 903491974F;
	Thu, 18 Oct 2018 20:05:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:49 -0300
Message-Id: <20181018200422.4358-13-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Oct 2018 20:05:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/45] hw/mips/gt64xxx_pci: Mark as bridge device
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FYkKdYFZ5WWO

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

