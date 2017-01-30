Received: by 10.25.77.65 with SMTP id a62csp1873246lfb;
        Mon, 6 Feb 2017 13:08:40 -0800 (PST)
X-Received: by 10.237.60.49 with SMTP id t46mr12540945qte.140.1486415320015;
        Mon, 06 Feb 2017 13:08:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a25si1387911qte.122.2017.02.06.13.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Feb 2017 13:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aosc.xyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1caqWb-0003U0-Ff
	for alex.bennee@linaro.org; Mon, 06 Feb 2017 16:08:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1caqWY-0003Ts-7x
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 16:08:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1caqWV-0001Im-3E
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 16:08:34 -0500
Received: from forward2h.cmail.yandex.net ([87.250.230.17]:40838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <icenowy@aosc.xyz>) id 1caqWU-0001EZ-IV
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 16:08:31 -0500
Received: from smtp1m.mail.yandex.net (smtp1m.mail.yandex.net [77.88.61.132])
	by forward2h.cmail.yandex.net (Yandex) with ESMTP id B26E820740;
	Tue,  7 Feb 2017 00:08:26 +0300 (MSK)
Received: from smtp1m.mail.yandex.net (localhost.localdomain [127.0.0.1])
	by smtp1m.mail.yandex.net (Yandex) with ESMTP id 6BF8263C0CB9;
	Tue,  7 Feb 2017 00:08:24 +0300 (MSK)
Received: by smtp1m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	jKcYxi5E9Y-8L0ShHJx; Tue, 07 Feb 2017 00:08:23 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client certificate not present)
Message-Id: <20170207000824.8L0ShHJx@smtp1m.mail.yandex.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.xyz; s=mail;
	t=1486415304; bh=IjZQHEah9ofApTQCQiyD0P/cQLUc9aC85H0hCNiI0NE=;
	h=Date:Subject:From:To:Cc;
	b=SA8x8bbyfzfg+xudwLUWk1a6rNCU8o0oNO3OUvv4PyHqNLBQZVUvHRjidbhTaFRze
	CghGhl4PoSiAGLiaT6mZv1DRoQLY+C1P1ySJrzzqCV8/pLGLloYHJ5HNyzC8Qrhnq0
	YaibFv7VQZlVID+qQyBzAhpTUXOEesCLmdWuCn6I=
Authentication-Results: smtp1m.mail.yandex.net; dkim=pass header.i=@aosc.xyz
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 0
Date: Mon, 30 Jan 2017 21:59:54 +0800
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.17
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
X-TUID: 7ZW1OoctaXDX

CjIwMTflubQx5pyIMzDml6UgMTY6MTnkuo4gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+5YaZ6YGT77yaCj4KPiBPbiBTbywgMjAxNy0wMS0yOSBhdCAwOTowMCArMDgwMCwgSWNlbm93
eSBaaGVuZyB3cm90ZTogCj4gPiBJdCB1c2VzIGEgcmVnaXN0ZXIgbWFwIGxpa2UgdGhlIG9uZSBp
biBFeHlub3MgU29Dcy4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGlj
ZW5vd3lAYW9zYy54eXo+IAo+Cj4gSSBndWVzcyB0aGlzIGdvZXMgdGhyb3VnaCB0aGUgYXJtIHF1
ZXVlPyAKCkkgZG9uJ3Qga25vdyBhYm91dCB0aGUgUUVNVSBkZXZlbG9wbWVudCBwcm9jZXNzLCBz
b3JyeS4KCj4KPiBSZXZpZXdlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+
IAo+Cj4gY2hlZXJzLCAKPiDCoCBHZXJkIAo+Cg==

