Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4347344wre;
        Tue, 29 May 2018 22:26:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuATWo28bqgHvMzADIojAugbdKrrZRAEoXP2OajjnCr4gFyH9b7uJmcvca11XxSzI3uLED
X-Received: by 2002:a37:10a4:: with SMTP id 36-v6mr1090497qkq.349.1527658008554;
        Tue, 29 May 2018 22:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527658008; cv=none;
        d=google.com; s=arc-20160816;
        b=Iufc21DPbB00d4oIWTeCfZxCH26volP0CSQKzwXEAzu1khgFU70K0lC4buGeq5VEaZ
         Q2hy/V6/DLE2dp8BYNuyIhVUABBeSbcxZeFylQ5RWUFr+UuFb6U/1OERwAbrOZMoYEB5
         HghjJyCu+1ity8t5If0Y97ibdxVyXWjSVntIKDi2eTYwdQgdlWnxj+rFKkR8QD8+MygL
         6NnffOIVCHEKnuMcK+W3HYoUQ8ZIcrxfiYeOKRzfxbTUNhBM0hYKfabsMBP/9WDbYxT/
         AoktuoF38wiPgx8+xgfWhqgACfHz3IjoM7OvL+AmrXicQmsBJh4nQrszsnb9QMEmpTnE
         HRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=I5sxmFVm6AWKpW1oZDgETosEztE9DcpMxpa2tkxal2E=;
        b=O0Eet1jGNxmQ+UL1Sh/hF9ZcFhxSInS60nntZYMrvOBHGmCqEZjSdbFUmgrTvtBl5z
         VdJpu1bw3Ohm4s1FAk3szbdD2Xx+KIRIqbxbF+XnYJpZPWlZvWI2MdAKLANwo92gDNqG
         FYc3x0t7ZtzeabJmF756yj+AhR0HwnupA+3G+G+8LlzLCnwZh5jcpTIcxRs2nV2LAHiY
         yc7pmLKNdP+efY92GAx0D+BpVih4toUY2Dtuz8fndmM6ZHN6K81cgZldR5hUJypYhPN5
         pcIUtGvItWIfFsWoS8GJAAz/iqsNb2Q+hd71J868gRKLFSQEv/s308RYrLAek4MM0iHT
         uUdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66-v6si4700861qte.7.2018.05.29.22.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 22:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNtdI-00006f-2K
	for alex.bennee@linaro.org; Wed, 30 May 2018 01:26:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNtd8-00006A-Oj
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNtd5-0006ek-LB
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:26:38 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:55823)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNtd5-0006dt-FJ
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:26:35 -0400
Received: from player786.ha.ovh.net (unknown [10.109.122.10])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 7058618B09
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 07:26:33 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id B294C380083;
	Wed, 30 May 2018 07:26:27 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<fac124fe-d816-1bb2-c8b3-d1a0213f968b@amsat.org>
	<15666557-66b1-78e0-1062-b3a28ecaf580@kaod.org>
	<b83a5cd3-5918-e063-86ef-c65f1d44641e@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9c347664-ef30-b407-f3f8-14390121a9a5@kaod.org>
Date: Wed, 30 May 2018 07:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <b83a5cd3-5918-e063-86ef-c65f1d44641e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3893643356087159616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.197
Subject: Re: [Qemu-arm] [PATCH 0/6] ftgmac100 and NC-SI enhancements for the
 Aspeed SoC
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
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0LBhSQfzw6Ze

On 05/30/2018 05:04 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 05/29/2018 01:57 PM, C=C3=A9dric Le Goater wrote:
>> On 05/29/2018 02:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi C=C3=A9dric,
>>>
>>> On 05/29/2018 03:28 AM, C=C3=A9dric Le Goater wrote:
>>>> Hello,
>>>>
>>>> Here is a couple of enhancements and fixes for the ftgmac100 NIC use=
d
>>>> on the Aspeed SoC. It includes VLAN and multicast support.
>>>>
>>>> Following is an assorted set of changes for the NC-SI backend also
>>>> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix =
a
>>>> few problems found when running OpenBMC on aspeed QEMU machines.
>>>>
>>>> Thanks,
>>>>
>>>> C=C3=A9dric.
>>>>
>>>> C=C3=A9dric Le Goater (6):
>>>>   ftgmac100: compute maximum frame size depending on the protocol
>>>>   ftgmac100: add IEEE 802.1Q VLAN support
>>>>   net/ftgmac100: fix multicast hash routine
>>>>   slirp/ncsi: fix "Get Version ID" payload length
>>>>   slirp/ncsi: add a "Get Parameter" response
>>>>   slirp/ncsi: add checksum support
>>>
>>> Doesn't it make more sens to have slirp patches applied previous to t=
he
>>> ftgmac100 model?
>>
>> why ? They are not necessarily dependent.=20
>=20
> OK, no worries.
>=20

bah, I will just resend two distinct series one for 'slirp'=20
and one for 'net'.

C. =20
