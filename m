Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2978965lfi;
        Thu, 5 Mar 2020 06:27:48 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv4KYGrIpND20tkwRtSuaNNI4t3v+ojKeFRXuFZ7ZHNeAwB9Fj7s6ysd4zw8r1OHN3P5ly9
X-Received: by 2002:a05:6214:2a8:: with SMTP id m8mr6762237qvv.87.1583418467936;
        Thu, 05 Mar 2020 06:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418467; cv=none;
        d=google.com; s=arc-20160816;
        b=dxvkqwpZoUby26o6KsYqtj1duhmW+BQdKHB59DMHi3m/t85UM9HFhtBXBK6s2PdgyE
         8mtO3FNDUltuM1myCdv36dqEBss14LBMQB8ACb98g4ofBL+MbZFtW4XRKveEBdK2nhlQ
         8jpx/RRqx7iQ/IYF5JeoUrVCFB3hFTckNvbQl2IdDWsrCOAWSCR49vIdzJtjO7Aoe9MO
         cOSir4y1mk9HDqxtgD79GUWIzdrPlGeegUysOfaXUa6QROHyKrIXK/eXmo6eDqF9nEQR
         FnTrHldpwKguCIK188L+ddosa3N0SwrPjj3gNCya0amC4ZGhMTs9oAfDPEoKaiQyuzCZ
         zVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:message-id:date
         :mime-version:subject:references:in-reply-to:to:from:dkim-signature
         :precedence;
        bh=cD0FUWWM98H8bVTRIrUhuN4E9Vdo5ruJ4BfDaH7+mgc=;
        b=XJ7k6tn8/fcD/b3xKlehcNSoEphFuyCOGxgTqkOpINq1p+H/pdTkNS4bqfqhZGyG+A
         CYNELYnfEl4l8u5aA79BbdrZLxiuNs4PSjOmdH0KS/Q6pQhTygeJYQb9PEBiAnAfP4Le
         sTYw5LxVNrxv+SRmxAh7i+lut/cRcTW843DSKBG0qHDIT1QSFQY71oxKKDsizc4T9Q4G
         5Npw7fz4+bcmnkYFmUA/AMI+79qQvtE9kvrV7fB/kZxXqgXRwFX3ZAxGr6fu8idfsJPl
         ftorIQH2RW7fQWCiKzsKjsx1LGWrbMupI5PVwm0dBbSZYv0O49rFX1jQWp9xlwRSA0ft
         8WlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex-team.ru header.s=default header.b=xfMj54Yt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a187si3117761qkc.76.2020.03.05.06.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex-team.ru header.s=default header.b=xfMj54Yt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from localhost ([::1]:50172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rTX-0002Kx-CI
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9rS3-00089r-8C
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:26:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lekiravi@yandex-team.ru>) id 1j9rS1-0006Uc-Pz
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:26:15 -0500
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:50416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lekiravi@yandex-team.ru>)
 id 1j9rRw-0006Pa-E7; Thu, 05 Mar 2020 09:26:08 -0500
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7F6512E150E;
 Thu,  5 Mar 2020 17:26:04 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lmIY5ZYDjo-Q1JafvBO; Thu, 05 Mar 2020 17:26:04 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1583418364; bh=Srk5hoK6N/ILVxS/BdFaqyldfaW+4xH22sDBZLRIUKo=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=xfMj54YtmzrxGsfNyyBmS+T5yHIheJNguvkvQ+6fVi+x9J5uRgkr8o+MXC/FnKe6/
 y3jm1ZRS9qO7WrzEJD1zj2t0cqyolQYpvpb3/otn2Enfs4T5XR535sC116wgUCoB22
 Sy7l+SaqRqXg7XOzxH43Q6v2df+z92YsAgl2xg8w=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1j.mail.yandex.net (localhost [::1])
 by mxbackcorp1j.mail.yandex.net with LMTP id 2XQNYKuRZl-2ePGDZXI
 for <lekiravi@yandex-team.ru>; Thu, 05 Mar 2020 17:25:51 +0300
Received: by sas2-b8502101ee6d.qloud-c.yandex.net with HTTP;
 Thu, 05 Mar 2020 17:25:50 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <87y2sff1qo.fsf@dusky.pond.sub.org>
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
 <87y2sff1qo.fsf@dusky.pond.sub.org>
Subject: Re: [PATCH v2 1/4] qapi: net: Add query-netdevs command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Mar 2020 17:26:00 +0300
Message-Id: <1041781583412683@myt4-457577cc370d.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1619::183
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <huth@tuxfamily.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jiUo94E3H32/



05.03.2020, 15:03, "Markus Armbruster" <armbru@redhat.com>:
> Alexey Kirillov <lekiravi@yandex-team.ru> writes:
>
>> =C2=A0Add a qmp command that provides information about currently atta=
ched
>> =C2=A0network devices and their configuration.
>
> Closes a gap in QMP; appreciated!
>
>> =C2=A0Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
>
> [...]
>> =C2=A0diff --git a/qapi/net.json b/qapi/net.json
>> =C2=A0index 1cb9a7d782..4f329a1de0 100644
>> =C2=A0--- a/qapi/net.json
>> =C2=A0+++ b/qapi/net.json
>> =C2=A0@@ -750,3 +750,92 @@
>> =C2=A0=C2=A0##
>> =C2=A0=C2=A0{ 'event': 'FAILOVER_NEGOTIATED',
>> =C2=A0=C2=A0=C2=A0=C2=A0'data': {'device-id': 'str'} }
>> =C2=A0+
>> =C2=A0+##
>> =C2=A0+# @NetdevInfo:
>> =C2=A0+#
>> =C2=A0+# Configuration of a network device.
>> =C2=A0+#
>> =C2=A0+# @id: Device identifier.
>> =C2=A0+#
>> =C2=A0+# @type: Specify the driver used for interpreting remaining arg=
uments.
>> =C2=A0+#
>> =C2=A0+# @peer: Connected network device.
>
> @peer is optional. I assume its present when the device is connected
> (frontend to backend or vice versa). Correct?
>

Yes, this field stores connected frontend/backend device @id.

>> =C2=A0+#
>> =C2=A0+# @queues-count: Number of queues.
>
> We use plain @queues elsewhere in the schema.
>

It can conflict with fields inside Netdev*Options, isn't it?

>> =C2=A0+#
>> =C2=A0+# @hub: hubid of hub, if connected to.
>
> How @hub is related to @peer is not quite obvious to me. Can you give
> an example where @hub is present?
>

NetdevHubPortOptions has an option @hubid. @hub gives that id, if
netdev is connected to the hub via hubport. As example:

HMP:

hub 0
 \ hub0port1: socket.0: index=3D0,type=3Dsocket,
 \ hub0port0: virtio-net-pci.0: index=3D0,type=3Dnic,model=3Dvirtio-net-p=
ci,macaddr=3D52:54:00:12:34:56

QMP:

[
  {
    "peer": "hub0port0",
    "netdev": "hub0port0",
    "hub": 0,
    "model": "virtio-net-pci",
    "macaddr": "52:54:00:12:34:56",
    "type": "nic",
    "queues-count": 1,
    "id": "virtio-net-pci.0"
  },
  {
    "peer": "hub0port1",
    "listen": "127.0.0.1:90",
    "hub": 0,
    "type": "socket",
    "queues-count": 1,
    "id": "socket.0"
  },
  {
    "peer": "socket.0",
    "netdev": "socket.0",
    "hub": 0,
    "hubid": 0,
    "type": "hubport",
    "queues-count": 1,
    "id": "hub0port1"
  },
  {
    "peer": "virtio-net-pci.0",
    "netdev": "virtio-net-pci.0",
    "hub": 0,
    "hubid": 0,
    "type": "hubport",
    "queues-count": 1,
    "id": "hub0port0"
  }
]

>> =C2=A0+#
>> =C2=A0+# @perm-mac: Original MAC address.
>
> What does "perm-" mean?
>
> It's optional. When exactly is it present?
>

@perm-mac is the permanent (original) MAC address. It only used
for nic, because most of nic realizations can change MAC at
runtime and/or reset it to default (permanent) value.

>> =C2=A0+#
>> =C2=A0+# Since: 5.0
>> =C2=A0+##
>> =C2=A0+{ 'union': 'NetdevInfo',
>> =C2=A0+ 'base': { 'id': 'str',
>> =C2=A0+ 'type': 'NetClientDriver',
>> =C2=A0+ '*peer': 'str',
>> =C2=A0+ 'queues-count': 'int',
>> =C2=A0+ '*hub': 'int',
>> =C2=A0+ '*perm-mac': 'str' },
>> =C2=A0+ 'discriminator': 'type',
>> =C2=A0+ 'data': {
>> =C2=A0+ 'nic': 'NetLegacyNicOptions',
>> =C2=A0+ 'user': 'NetdevUserOptions',
>> =C2=A0+ 'tap': 'NetdevTapOptions',
>> =C2=A0+ 'l2tpv3': 'NetdevL2TPv3Options',
>> =C2=A0+ 'socket': 'NetdevSocketOptions',
>> =C2=A0+ 'vde': 'NetdevVdeOptions',
>> =C2=A0+ 'bridge': 'NetdevBridgeOptions',
>> =C2=A0+ 'hubport': 'NetdevHubPortOptions',
>> =C2=A0+ 'netmap': 'NetdevNetmapOptions',
>> =C2=A0+ 'vhost-user': 'NetdevVhostUserOptions' } }
>
> This is a copy of union 'Netdev' with a few additional common members
> (@peer, @queues-count, @hub, @perm-mac). I can't see how to avoid the
> duplication without adding nesting on the wire.
>
>> =C2=A0+
>> =C2=A0+##
>> =C2=A0+# @query-netdevs:
>> =C2=A0+#
>> =C2=A0+# Get a list of @NetdevInfo for all virtual network devices.
>> =C2=A0+#
>> =C2=A0+# Returns: a list of @NetdevInfo describing each virtual networ=
k device.
>> =C2=A0+#
>> =C2=A0+# Since: 5.0
>> =C2=A0+#
>> =C2=A0+# Example:
>> =C2=A0+#
>> =C2=A0+# -> { "execute": "query-netdevs" }
>> =C2=A0+# <- { "return": [
>> =C2=A0+# {
>> =C2=A0+# "peer": "netdev0",
>> =C2=A0+# "netdev": "netdev0",
>> =C2=A0+# "perm-mac": "52:54:00:12:34:56"
>> =C2=A0+# "model": "virtio-net-pci",
>> =C2=A0+# "macaddr": "52:54:00:12:34:56",
>> =C2=A0+# "queues-count": 1,
>> =C2=A0+# "type": "nic",
>> =C2=A0+# "id": "net0"
>> =C2=A0+# },
>> =C2=A0+# {
>> =C2=A0+# "peer": "net0",
>> =C2=A0+# "ipv6": true,
>> =C2=A0+# "ipv4": true,
>> =C2=A0+# "host": "10.0.2.2",
>> =C2=A0+# "queues-count": 1,
>> =C2=A0+# "ipv6-dns": "fec0::3",
>> =C2=A0+# "ipv6-prefix": "fec0::",
>> =C2=A0+# "net": "10.0.2.0/255.255.255.0",
>> =C2=A0+# "ipv6-host": "fec0::2",
>> =C2=A0+# "type": "user",
>> =C2=A0+# "dns": "10.0.2.3",
>> =C2=A0+# "hostfwd": [
>> =C2=A0+# {
>> =C2=A0+# "str": "tcp::20004-:22"
>> =C2=A0+# }
>> =C2=A0+# ],
>> =C2=A0+# "ipv6-prefixlen": 64,
>> =C2=A0+# "id": "netdev0",
>> =C2=A0+# "restrict": false
>> =C2=A0+# }
>> =C2=A0+# ]
>> =C2=A0+# }
>> =C2=A0+#
>> =C2=A0+##
>> =C2=A0+{ 'command': 'query-netdevs', 'returns': ['NetdevInfo'] }
>
> Like HMP "info network" and -net, this mixes frontends ("type": "nic")
> and backends. Unlike query-chardev and query-block. Hmm.
>
> A long time ago, all we had was -net: "-net nic" for configuring
> frontends, "-net none" for suppressing a default frontend + backend, an=
d
> "-net anything-else" for configuring backends. "info network" showed
> the stuff set up with -net.
>
> In v0.12, we got -device for configuring frontends, and -netdev for
> backends. -netdev is like -net less "none", "nic", and the hub
> weirdness. "info network" was extended to also show all this.
>
> In v2.12, we got -nic, replacing -net nic.
>
> Unless I'm missing something, -net is just for backward compatibility
> now.
>
> What's the use case for query-networks reporting frontends?

In my vision, new QMP command is the replacement for old
HMP command. It must provide information about all
network devices, mainly for recreate similar net topology.
Currently, there are no differrence between fronted and
backend devices in context of my command, because
all of them use the same interface in NetClientState.

>

--=C2=A0
Alexey Kirillov
Yandex.Cloud

