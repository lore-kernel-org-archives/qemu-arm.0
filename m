Received: by 10.28.4.212 with SMTP id 203csp3680774wme;
        Mon, 23 Apr 2018 02:56:28 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpyME/zj6s/fqI71Uda1yI5Tk4Dt43vbBHTTgFiFgAFP8cZ99WhZUTWzIZW5Ip9pKFPzQUn
X-Received: by 2002:ac8:b0e:: with SMTP id e14-v6mr22438823qti.365.1524477388659;
        Mon, 23 Apr 2018 02:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524477388; cv=none;
        d=google.com; s=arc-20160816;
        b=aIFdeHwle9vLWqEwlGtQvGSGBn88FJa1D36L/aLVmq2TyrQyucArWRM4oJHvbnF443
         rtk04BUL48nO4cCWflNhR7KFAgqNWAP+OPEIVMcrbk8IsT4/BdyHrSkIA1dEtKI9vwwH
         w63NeV2MHF7nAK4ERQvDWFBewbt/n9yB/VShA6/1xw28vRlgoRL+y3OQQ2i/QFKXKWjC
         yv8cGoP1UsC/cXOWhWPkvO81wjwivaw90GxibJT5sHQ2zpnlG5NCF57Ih39kPE+hWKXo
         tpdZPvovobbqIYH6WYgQbfy8WVkfHNsmhum5ZsDg/rfa8GohRE4iCtdVTIB0SQn7X4Xl
         Z1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=/g3a9JC7VJX6K4fOQVOLJ9Zmie8OPV30M7ofRhLZsXw=;
        b=XPLvkiTvNxGrPDv9fQtSNmXd58Jf2Nbhr1MefnRHCF9ez/lbvTUcxCgL4InUjMtDsL
         hy3TSdd+vBYbjL7Dkl5wKETPB2IY5+6mRBdiL//Ri16FZbx9DAeRbWxYzBUQGhmLdPnB
         2uzO/fytHmWj83rFP6QfjY836qTDCgTtWvmzHC3HohI1/kmtmiGN4EM7KwX0Rcbyp3NJ
         w62pwv0cik1r2YVD+aBTH7yqr1v21hwzil/UiLf6tkBf6rGjir8jn4gWBZUg26BRZgil
         hThOCEmCH6hbZ/cVYqnh7MArp41A6hUQSUDpqiS93xYdwbxUKsmFGTOKY8f7Dfqwlcg0
         8ZyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3-v6si5308531qtp.263.2018.04.23.02.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 02:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAYCy-0002Mh-8X
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 05:56:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYCH-0001zD-My
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAYCE-0004bh-ME
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:55:45 -0400
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:41377)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAYCE-0004ax-G4
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:55:42 -0400
Received: from player737.ha.ovh.net (unknown [10.109.120.50])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 92BADAEF8A
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 11:55:40 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id D2C7CE0090;
	Mon, 23 Apr 2018 11:55:36 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180423064020.25434-1-clg@kaod.org>
	<CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
	<53691cbf-08bf-e3f7-22d3-601a279aa08a@kaod.org>
	<CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <32db3eed-81cc-64dc-a16f-78860c6d3838@kaod.org>
Date: Mon, 23 Apr 2018 11:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XBHE5YxN27M1ugprmSf=o5iiNakO2omrY+HBgCszV5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 12509873866143992747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.36.172
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXBGT3T+BwSC

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
> data if you do try a cross version migration, so I would
> vote for just fixing the one thing that was wrong: the
> number in VMSTATE_STRUCT_ARRAY is the version to be used of
> the substruct, so it didn't need to be bumped in commit
> 1d3e65aa7a; the main version numbers for vmstate_aspeed_timer
> did need to be bumped because part of the main struct changed.

Yes. This is correct. I will resend with just that change on=20
VMSTATE_STRUCT_ARRAY.

Thanks,

C.
=20

