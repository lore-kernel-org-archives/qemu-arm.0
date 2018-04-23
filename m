Received: by 10.28.4.212 with SMTP id 203csp3685127wme;
        Mon, 23 Apr 2018 03:01:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp98CF1xIt3QeX6cL+0Xzfi59PZnuyF8dVsYDJQnLab0ItTHevU+funl+ZEho3n8o3Gv2VR
X-Received: by 10.55.146.1 with SMTP id u1mr20574314qkd.327.1524477701184;
        Mon, 23 Apr 2018 03:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524477701; cv=none;
        d=google.com; s=arc-20160816;
        b=Sm3G2NmMisBrCJrqbooZqbUrZfFKKeEVl10jmV2oHLAHuxi0eEVk5tAYVomlZkCUE1
         paKekgPgATTzEghgLumHJMkt3STW1lMc86xqgLWLKDkbwPuyDOiZiPWxPiLQ7moCIfxg
         8nHBkl7xFQfRiKc6uwmZnpoM3TN6Qo4POTtFdtBuJ2sQx9viBxVgY109fbyt0jSTm2UF
         ROBwLew66JLGCDB4FazbZJhFAXbxV/GPGvmjnRs096H1ea4zPgwIsCx+E73paOpMemnz
         KVScL24tq+SwsRdh2gSVMb+OS+V8gaXpUQpll3FDIju70LBTXI8LV/T9RvbJgfnwPgp4
         1eAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=odNlsMvD9kYhLghQXDwYP+pAZOGSJRg25t5FcDQTDdI=;
        b=BchLUeOc8EbLZVv3WyiZxfLDbvIyfgvymGq4KK9Mf2F1lqtz3UoJo2UYgX9GaDjoJA
         kK86dMAO5BHUonX/8hD0+plJ+SA/ZJ4S/T5HMPmvsleBV1tF6cJDb6+xlAt1bYxOuPmp
         fbVeW+KpO60k0nMtTI54bMChi4CNDkTwFpIw4z/Qw9Cge7A8fwoQb7fgYQn6Spm40j3r
         XbuqrR0ZhuRcR9PR6v0omLMmGbuWVLutA6cytzXW137qL6EcI+3vh2l2GfT9t3f0JPfu
         /W+wNiyHNzRCHShF40IW+UtPBSaVGb/eGCq2gPkKHopNdpJrCLlW4YPwbig/LoErwHWG
         BYOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 93si951522qks.350.2018.04.23.03.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 03:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAYI0-0004KK-Nr
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 06:01:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYHb-0004Ek-US
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:01:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYHS-0007LT-KW
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:01:16 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:34738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAYHS-0007JT-E7
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:01:06 -0400
Received: from player737.ha.ovh.net (unknown [10.109.120.53])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id B0D65194EE5
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 12:01:04 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id 11F1CE00B4;
	Mon, 23 Apr 2018 12:00:57 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
	<53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
	<CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a5ca89ac-7c8f-c565-30d0-357bacb1f61e@kaod.org>
Date: Mon, 23 Apr 2018 12:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 12601071761215753010
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.52.148
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6qv3XEVEjyQo

On 04/23/2018 11:34 AM, Peter Maydell wrote:
> On 23 April 2018 at 10:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 04/23/2018 11:12 AM, Peter Maydell wrote:
>>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>>>> index 50acbf530a3a..7df19bd9df91 100644
>>>> --- a/hw/timer/aspeed_timer.c
>>>> +++ b/hw/timer/aspeed_timer.c
>>>> @@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed_t=
imer =3D {
>>>>
>>>>  static const VMStateDescription vmstate_aspeed_timer_state =3D {
>>>>      .name =3D "aspeed.timerctrl",
>>>> -    .version_id =3D 1,
>>>> -    .minimum_version_id =3D 1,
>>>> +    .version_id =3D 2,
>>>> +    .minimum_version_id =3D 2,
>>>>      .fields =3D (VMStateField[]) {
>>>>          VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
>>>>          VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
>>> Wouldn't it be simpler to just fix the incorrect value in
>>> the VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
>>> line ?
>>
>> Yes. Also.
>>
>> Or bring back all the version ids to 1, as we never supported
>> migration before.
>=20
> I think it's nice to at least do the "bump version" thing, so you
> get a (hopefully comprehensible) error rather than just wrong
> data if you do try a cross version migration,=20

On that topic, the error message was :

	Missing section footer for aspeed.timerctrl

which is not very comprehensible for a version mismatch issue.

Thanks,

C.=20

> so I would
> vote for just fixing the one thing that was wrong: the
> number in VMSTATE_STRUCT_ARRAY is the version to be used of
> the substruct, so it didn't need to be bumped in commit
> 1d3e65aa7a; the main version numbers for vmstate_aspeed_timer
> did need to be bumped because part of the main struct changed.
>=20
> thanks
> -- PMM
>=20

