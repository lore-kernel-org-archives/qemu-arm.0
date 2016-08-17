Received: by 10.25.21.156 with SMTP id 28csp2479698lfv;
        Wed, 17 Aug 2016 05:08:28 -0700 (PDT)
X-Received: by 10.200.38.201 with SMTP id 9mr44665265qtp.135.1471435697354;
        Wed, 17 Aug 2016 05:08:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si20827822qty.156.2016.08.17.05.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 05:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZzdo-000594-PG
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 08:08:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bZzdm-00058w-3i
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 08:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bZzdk-0003bf-Sl
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 08:08:13 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:35164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bZzdk-0003bY-Lx
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 08:08:12 -0400
Received: by mail-ua0-x231.google.com with SMTP id n59so168197311uan.2
	for <qemu-arm@nongnu.org>; Wed, 17 Aug 2016 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=EOC2bm8rTvTwv8YlOPFmaQEpCN5DF673LiohhxpEsfo=;
	b=ScsirWDC26FjT29pinXwiu9jXAGBfrdLBjXH7zs8axREZXTqPHVqbB0xA5G6bi5XE9
	VZF1RNa+Jdga8GLb6UUblUgEk5b6WtG9Toz6Mc2ewUKnKAJoXUZTOweO2oxgWHIcwbA2
	7jKftaUfu7MaY2yFSBPM7/DYZWIIFFuinhYtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=EOC2bm8rTvTwv8YlOPFmaQEpCN5DF673LiohhxpEsfo=;
	b=EpdnC/yRwjFZoWjWNuO7bqEICrDRhIksBkI961RWN/N5Z8ox8KEl1DCENGHDSizTW3
	qRGHKwf2Hfe13oqPN13eBycPG9fS9bJgiJDiLkckxlEIR4xxsF7dyrnJ4l+t0Y3A2JhS
	6ifOqKNSNnTJiKnp5aU+oCIcJVK5vON9gDibWDHgUC8lRPpx6jtyTkzsm48qxIKUiWAG
	Yp1LUsv0RhvTSo1NLrI2BiNDTkEbsstqI3j6shvWvOhdYjDPzp184+UfRFInx/1tzNwP
	mfm3HtKP5Wn/xSHTK8scyKrDwFRz8kfzKZcel14qa1aznPHjZNe29xgr3IfN9IJQM0+k
	a4ZQ==
X-Gm-Message-State: AEkooutE8T19olwDJH5IeLnRQ7WUiIBmYFqYsCe9wGRIX94TUh1SLyixdfOkA4hI0JbRfQy2+TQlb6boGQAX6iIK
X-Received: by 10.176.0.234 with SMTP id 97mr20085372uaj.64.1471435691955;
	Wed, 17 Aug 2016 05:08:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.4.195 with HTTP; Wed, 17 Aug 2016 05:08:11 -0700 (PDT)
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 17 Aug 2016 20:08:11 +0800
Message-ID: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary=001a113cfc3abab917053a4351d7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: [Qemu-arm] Help: Does Qemu support virtio-pci for net-device and
 disk device?
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
Cc: Thomas Hanson <thomas.hanson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PT1oJNCidOFx

--001a113cfc3abab917053a4351d7
Content-Type: text/plain; charset=UTF-8

Hi all,
     Now I'm investigating net device hot plug and disk hotplug for
AArch64. For virtio , the default address is virtio-mmio. After Libvirt
1.3.5, user can explicitly specify the address-type to pci and so libvirt
will pass the virtio-pci parameters to the Qemu.
     Both my host and guest OS is Debian8, and Qemu version is 2.6.0.
Libvirt version is 1.3.5.
     For net-device, I change the address-type to pci, and libvirt pass the
command below:
     -device
virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:25:25,bus=pci.2,addr=0x1

     After booting, the eth0 device disappear(eth0 occur when the address
is virtio-mmio),
but I can find another net-device enp2s1, also it can't work for dhcp:
Running lspci: 02:01.0 Ethernet controller: Red Hat, Inc Virtio network
device
I'm not sure whether it worked.

     For disk device,* when I change the address-type to pci, the whole
qemu command is :*
https://paste.fedoraproject.org/409553/,  but the VM can not boot
successfully. Does Qemu not support device disk of virtio-pci in AArch64
just as it in X86_64?
     Thanks~Since I am not very familiar with Qemu, really looking forward
to your response.

Best Regards,
Kevin Zhao

--001a113cfc3abab917053a4351d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div>=C2=A0 =C2=A0 =C2=A0Now I&#39;m investigating =
net device hot plug and disk hotplug for AArch64. For virtio , the default =
address is virtio-mmio. After Libvirt 1.3.5, user can explicitly specify th=
e address-type to pci and so libvirt will pass the virtio-pci parameters to=
 the Qemu.</div><div>=C2=A0 =C2=A0 =C2=A0Both my host and guest OS is Debia=
n8, and Qemu version is 2.6.0. Libvirt version is 1.3.5.=C2=A0</div><div>=
=C2=A0 =C2=A0 =C2=A0For net-device, I change the address-type to pci, and l=
ibvirt pass the command below:=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0-device =
virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:0d:25:25,bus=3Dpc=
i.2,addr=3D0x1</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0<span style=3D"=
font-size:12.8px">After booting, the eth0 device disappear(eth0 occur when =
the address is virtio-mmio),</span></div><div style=3D"font-size:12.8px">bu=
t I can find another net-device=C2=A0<span style=3D"font-size:12.8px">enp2s=
1</span><span style=3D"font-size:12.8px">, also it can&#39;t work for dhcp:=
=C2=A0</span></div><div style=3D"font-size:12.8px">Running lspci:=C2=A0<spa=
n style=3D"font-size:12.8px">02:01.0 Ethernet controller: Red Hat, Inc Virt=
io network device</span></div><div style=3D"font-size:12.8px">I&#39;m not s=
ure whether it worked.</div><div style=3D"font-size:12.8px"><br></div><div =
style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0For disk device,<b> when I c=
hange the address-type to pci, the whole qemu command is :</b>=C2=A0</div><=
div style=3D""><span style=3D"font-size:12.8px"><a href=3D"https://paste.fe=
doraproject.org/409553/">https://paste.fedoraproject.org/409553/</a>, =C2=
=A0but the VM can not boot successfully. Does Qemu not support device disk =
of virtio-pci in AArch64 just as it in X86_64?</span></div><div style=3D"">=
<span style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0Thanks~Since I am not =
very familiar with Qemu, really looking forward to your response.</span><br=
></div><div style=3D""><span style=3D"font-size:12.8px"><br></span></div><d=
iv style=3D""><span style=3D"font-size:12.8px">Best Regards,</span></div><d=
iv style=3D""><span style=3D"font-size:12.8px">Kevin Zhao</span></div></div=
>

--001a113cfc3abab917053a4351d7--
