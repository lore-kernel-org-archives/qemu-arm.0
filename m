Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152368wrq;
        Tue, 12 Jun 2018 03:44:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJCHqa35dZMh5HLy2gzBGUUNf8AkSARlK5j2dhSunkEgHBuCS1HcJQTIWbCq5mMwMPx8iM7
X-Received: by 2002:a0c:ab42:: with SMTP id i2-v6mr2709371qvb.225.1528800299571;
        Tue, 12 Jun 2018 03:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800299; cv=none;
        d=google.com; s=arc-20160816;
        b=TS+mZFpkn4C4jIZtSPd5r9COIJ+W1FPanmLKl2wR8nMWbwst3+FKe0ExlGtNwo97KQ
         kwfb3eky2QBJj6M6yY9/8EnQu8ixp8zEYYXl/QUMbNW70C+Ipnn1ClX+7kAvMDAzQFiO
         o5RQw0te0gJPrj6EFo3awRGpXpuFHVnXqtaRRpuma723fycl3S2ndVeYBuw6E+zfVWcY
         0XzYWmzkfHUHBi1+LsDMIu00X2QjujLU/dwDZW77kC0xo56V4L6rMh3YQRiYWRCaY+YG
         LQQydh7/XwnmObmalmtmDNbyYBlCPESjjXa9BYGGnJxt1H16KbXasKax7tPdPha4QSOc
         XiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6PJvSH90968EBQqoPLyLj8D2K6UMdd24REb9JqSM7jc=;
        b=A1i/LbNwvkGbyy8XvJEGB/ePNTMBDAF0bGDgNBtzHatapBJ3t0T9JXO9yNemwjrSQH
         Z1indya4ZX58Q/B3mo0LbYyavT4CU/nRSX8wqX3fSUQCmaJwP5XjvvOOUrxE4TLzhSDn
         7fNqesh3LF2tPEUuouHm/NJD2OR4yOdCjN1MK5/oJrrRx3sRw4z0Q0U+ufyN4BchXso+
         pP7s3bL92qUlI7/2SAaTtZ0TBfj0rED2aMzA6dKSo5WpRKJbeZjdZoK572e/n7AhRMoI
         i/tZXukvbdrIXEH87Z5TGgvc/iLnWGWTigRskti+yDpryq3g21L3NliN0wSxY9hDeh7o
         erxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h17-v6si590844qvk.152.2018.06.12.03.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnL-0002po-1n
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgn0-0002nh-Js
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmz-0007vV-6J
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37708 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmz-0007vD-0S; Tue, 12 Jun 2018 06:44:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6501A818BAF4;
	Tue, 12 Jun 2018 10:44:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AC6210193;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8065724EF0D; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:24 +0200
Message-Id: <20180612104430.25745-3-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 12 Jun 2018 10:44:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 12 Jun 2018 10:44:36 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 2/8] usb: correctly handle Zero Length Packets
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dgAYJkKfv/wv

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

USB Specification Revision 2.0, =C2=A75.5.3:
  The Data stage of a control transfer from an endpoint to the host is co=
mplete when the endpoint does one of the following:
  =E2=80=A2 Has transferred exactly the amount of data specified during t=
he Setup stage
  =E2=80=A2 Transfers a packet with a payload size less than wMaxPacketSi=
ze or transfers a zero-length packet"

hw/usb/redirect.c:802:9: warning: Declared variable-length array (VLA) ha=
s zero size
        uint8_t buf[size];
        ^~~~~~~~~~~ ~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20180604151421.23385-2-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 65a9196c1a..58e8f7f5bd 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -795,7 +795,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice =
*dev, USBPacket *p,
            usbredirparser_peer_has_cap(dev->parser,
                                        usb_redir_cap_32bits_bulk_length)=
);
=20
-    if (ep & USB_DIR_IN) {
+    if (ep & USB_DIR_IN || size =3D=3D 0) {
         usbredirparser_send_bulk_packet(dev->parser, p->id,
                                         &bulk_packet, NULL, 0);
     } else {
--=20
2.9.3

