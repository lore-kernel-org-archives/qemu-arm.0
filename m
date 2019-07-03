Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp548432wru;
        Wed, 3 Jul 2019 02:11:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzatZv1efw4TpO2DCRiOJotSTUT+ZduEC/9MScsShKO/NyahZWWWMlRtg2jPdD7ygARgmL7
X-Received: by 2002:aa7:c554:: with SMTP id s20mr40153869edr.209.1562145071839;
        Wed, 03 Jul 2019 02:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562145071; cv=none;
        d=google.com; s=arc-20160816;
        b=Pv7B2wicz2bNh4z4DTog5kQyk19hftNHnzNstbesdQlrxsZFcHzZaBynBu5IEA9ec1
         qmpNKOZNv6Y4dp0K/nRNjaf60SsX9t6LXdFY4h9NTLKS3JBdkZzH+KaDgj3mowbZmm/t
         YR+ucSJe04LIsX3it1yLeHYHznqM/O65xshmvghpU0EnWXGCIoJVVtJCacTccWJ4q8xX
         3eqVqr+zzmi9JkmpVjKMuU8cqkvXvlF+/Zda8EB4Iun4VB73y3OLcq2UXlLs9J9KeaH/
         1gXA4TbtZ4+RwWOJlgLTBbbyQAK67XGRFJUKBqlmbkjjTqQhEcW0dqUqAEX5sJexgD7L
         26tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zIHAo/kQCAHU0a6dtYPVlal8rQrKLH6vXPoa4CvV7lw=;
        b=FjqOUflLU/AFXyjR+Uvgg+XnUdrb4dRLA3jbfTIHfnW6G5nbhag7LYIvjcht/eJDoW
         hPJIG07xtr/XrWC9MLz3JWnka+ETZn3/DgklNddzOE/TX663qs25kb/X6LlolwDPPLXm
         AJHoE+1s0tRGuNYTKYYN1zWpVjBJpFD/n4FnzL4gd1gduv1K0r8ZmHw7gepl2tni3bna
         lYpdJsU3acxnbfsXY+h6k2i8umJ/1qzcKjvPFpUWetF3IHhb/qkb1Luf75r1Xito9GXm
         9obPj9mt7kBBJPI5Q071wezCp+EfPdEZUMO+13asbQsYu73l17G7R7amuybNzz/4eqgz
         A53A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si1582591eds.134.2019.07.03.02.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 02:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hibIE-0001Si-Vy
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 05:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hib2V-0004IF-HX
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hib2U-000441-Cv
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26864)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hib2U-0003Ep-57; Wed, 03 Jul 2019 04:54:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B85F1307D866;
 Wed,  3 Jul 2019 08:54:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7992B7D8AE;
 Wed,  3 Jul 2019 08:54:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89ED917515; Wed,  3 Jul 2019 10:54:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 10:54:16 +0200
Message-Id: <20190703085416.21837-5-kraxel@redhat.com>
In-Reply-To: <20190703085416.21837-1-kraxel@redhat.com>
References: <20190703085416.21837-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 03 Jul 2019 08:54:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 4/4] Add ati vgabios to INSTALL_BLOBS.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1y4YoCwzPrNG

Fixes: 0cca7e7bfd6c81cc3c29ec2b3a0a98954c4ba71a
Reported-by: Bruce Rogers <BROGERS@suse.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20190703045212.31039-1-kraxel@redhat.com
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b1c93ac02721..d657df904166 100644
--- a/Makefile
+++ b/Makefile
@@ -750,7 +750,7 @@ bepo    cz
 ifdef INSTALL_BLOBS
 BLOBS=3Dbios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bi=
n \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin=
 \
-vgabios-ramfb.bin vgabios-bochs-display.bin \
+vgabios-ramfb.bin vgabios-bochs-display.bin vgabios-ati.bin \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin =
QEMU,cgthree.bin \
 pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
 pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
--=20
2.18.1

