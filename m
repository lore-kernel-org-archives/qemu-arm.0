Received: by 10.25.77.65 with SMTP id a62csp1324236lfb;
        Mon, 30 Jan 2017 00:21:55 -0800 (PST)
X-Received: by 10.237.39.5 with SMTP id n5mr18114665qtd.38.1485764515013;
        Mon, 30 Jan 2017 00:21:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u34si9052069qta.88.2017.01.30.00.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jan 2017 00:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cY7Dk-0002cV-JY
	for alex.bennee@linaro.org; Mon, 30 Jan 2017 03:21:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cY7C2-0001F7-CZ
	for qemu-arm@nongnu.org; Mon, 30 Jan 2017 03:20:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cY7By-00068C-Ag
	for qemu-arm@nongnu.org; Mon, 30 Jan 2017 03:20:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1cY7By-00066f-5B
	for qemu-arm@nongnu.org; Mon, 30 Jan 2017 03:20:02 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42F724FC;
	Mon, 30 Jan 2017 08:20:01 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0U8K08v003748; Mon, 30 Jan 2017 03:20:00 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 8DAFE80F68; Mon, 30 Jan 2017 09:19:58 +0100 (CET)
Message-ID: <1485764398.20455.13.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Date: Mon, 30 Jan 2017 09:19:58 +0100
In-Reply-To: <20170129010013.29637-1-icenowy@aosc.xyz>
References: <20170129010013.29637-1-icenowy@aosc.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 30 Jan 2017 08:20:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] usb/ehci: Add SysBus EHCI device for
 Allwinner SoCs
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ot/1HgLjQop

On So, 2017-01-29 at 09:00 +0800, Icenowy Zheng wrote:
> It uses a register map like the one in Exynos SoCs.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

I guess this goes through the arm queue?

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

