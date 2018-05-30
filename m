Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4388854wre;
        Tue, 29 May 2018 23:26:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKyWjSLAOhQj/z9wY2VuNOTsfaGfMOtvdgtZf11pxVgYYme39xaSA6+tVFd8Ez5AZ+tkYMh
X-Received: by 2002:a37:d18f:: with SMTP id o15-v6mr1145419qkl.423.1527661580255;
        Tue, 29 May 2018 23:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661580; cv=none;
        d=google.com; s=arc-20160816;
        b=aSq9lLmLmLYpewkdzWwKmQ+GJMmVrbv1nLJw5u1kTu8+BpODNVKPaJKlMnl3hR40zP
         DNFdmpEgm0SERw9IejFvZvhUUxL2fXQniVTxN4vcxAETAHvY+JxWwjMfI4oVSYsGyDCj
         DUo1816kpXepBVXoPtPZAdvqxo6pYaY5Bd/4c7kXjLu4Q+a2XbpApf/J1R8Bvz4JQwyj
         zoPWZjKA+CtM0uWtwiPI8JscZW3IChB++XzTSwKKvTptERup7DijqaMajeeCmzw/A6XF
         +RrziV8g1IDIFogvbkFO/N1R15c/fd8rqe/lnv9xOW2S9cmIbYpPpfhSFpREoUNQlBwF
         P55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=SWhlx3LL3vLBGkwkzNrmjH+h2x5+exUdtOYfuYcetwk=;
        b=DSVNNBoxx/1LhZLqCsTHTTyUSeEDQQCTgjsim5VV+LMdY40hxfwclrtufkDpuKC+5z
         ClmjMN3p7KekBqULEap+b8qfReCSsIJdNX/XwDzG0OxWsRccdiJJiy2OP0HXrMClUnX9
         y/8G4oCvDS1x/NOvDknpJ8vKvjxvzz8IDMNoVDR41mmDo12jFgFuTuwIDCfVvVjDpA8e
         7kMsdrywmjq8SrUEI+YDRYHmJhSlGdox8fUU70PeWOlhh8jitM+D14iMMr+MnA7Tq27x
         C2d9PMH9Cm86J2R5cy/oObDR8SWuw07gpC4W38qAYRryPK6kv4bq35uki4V1bEVRTCrS
         wPfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41-v6si189149qtg.143.2018.05.29.23.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuYt-0006mp-QQ
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:26:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuYl-0006mb-Pp
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuYh-0004QT-AM
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:26:11 -0400
Received: from 9.mo6.mail-out.ovh.net ([87.98.171.146]:44309)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuYh-0004Pp-3k
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:26:07 -0400
Received: from player792.ha.ovh.net (unknown [10.109.108.125])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 629F515C3EA
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:26:05 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player792.ha.ovh.net (Postfix) with ESMTPSA id 025EAA0087;
	Wed, 30 May 2018 08:25:59 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>
References: <20180529062838.20556-1-clg@kaod.org>
	<CACPK8Xe9a5q5tvFJ=Q0ArkDnf1-e=cW+bVY6a-peD7hpyLn_jw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8363faf8-d2a2-d042-e8f3-6d702d848745@kaod.org>
Date: Wed, 30 May 2018 08:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe9a5q5tvFJ=Q0ArkDnf1-e=cW+bVY6a-peD7hpyLn_jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4899071970432748352
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.171.146
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] ftgmac100 and NC-SI
 enhancements for the Aspeed SoC
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWodaQM7p0dl

On 05/30/2018 07:35 AM, Joel Stanley wrote:
> On 29 May 2018 at 15:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> Here is a couple of enhancements and fixes for the ftgmac100 NIC used
>> on the Aspeed SoC. It includes VLAN and multicast support.
>>
>> Following is an assorted set of changes for the NC-SI backend also
>> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
>> few problems found when running OpenBMC on aspeed QEMU machines.
>>
>> Thanks,
>>
>> C=C3=A9dric.
>>
>> C=C3=A9dric Le Goater (6):
>>   ftgmac100: compute maximum frame size depending on the protocol
>>   ftgmac100: add IEEE 802.1Q VLAN support
>>   net/ftgmac100: fix multicast hash routine
>>   slirp/ncsi: fix "Get Version ID" payload length
>>   slirp/ncsi: add a "Get Parameter" response
>>   slirp/ncsi: add checksum support
>=20
> I tested these with -M palmetto-bmc and linux-next as the guest, and
> networking appeared to work fine. For the series:
>=20
> Tested-by: Joel Stanley <joel@jms.id.au>
>=20
> One question I had. I get these messages on boot:
>=20
> [    1.184472] ftgmac100 1e660000.ethernet: Read MAC address
> 52:54:00:12:34:56 from chip
> [    1.184751] ftgmac100 1e660000.ethernet: Using NCSI interface
> [    1.197107] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at b30b=
8905
> [    1.904237] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.905682] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.905943] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.906182] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.906415] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.906643] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.906873] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    1.907103] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [    2.024094] ftgmac100 1e660000.ethernet eth0: NCSI: configuring chan=
nel 0
> [    2.025428] ftgmac100 1e660000.ethernet eth0: NCSI: channel 0 config=
 done
> [    2.025544] ftgmac100 1e660000.ethernet eth0: NCSI: No more
> channels to process
> [    2.025608] ftgmac100 1e660000.ethernet eth0: NCSI interface up
>=20
>=20
> Comparing to hardware, I see:
>=20
> [    4.071159] ftgmac100 1e660000.ethernet: Read MAC address
> 98:be:94:83:00:ad from chip
> [    4.079024] ftgmac100 1e660000.ethernet: Using NCSI interface
> [    4.085976] ftgmac100 1e660000.ethernet eth0: irq 19, mapped at a096=
3000
> [   40.670099] ftgmac100 1e660000.ethernet eth0: NCSI: Handler for
> packet type 0x82 returned -19
> [   43.852036] ftgmac100 1e660000.ethernet eth0: NCSI: configuring chan=
nel 1
> [   43.877060] ftgmac100 1e660000.ethernet eth0: NCSI: channel 1 config=
 done
> [   43.877093] ftgmac100 1e660000.ethernet eth0: NCSI: No more
> channels to process
> [   43.877112] ftgmac100 1e660000.ethernet eth0: NCSI interface up
>=20
> Is it expected that we get multiple ENODEVs for packet type 0x82 in qem=
u?
=20
When the NSCI probing is done in Linux, 8 deselect packages requests
are sent and QEMU answers them all. I wonder what the real HW does.


Something to check.

Cheers,

C.


