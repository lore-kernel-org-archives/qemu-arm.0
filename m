Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2567331wre;
        Mon, 28 May 2018 08:02:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI8ZQtM0nkf6TdTPg1rJ07tEqpDXthFHEW+t3l78FtgjgyjfKMUn3ljBi65krNvUItt5isA
X-Received: by 2002:aed:3c7a:: with SMTP id u55-v6mr12269327qte.391.1527519740820;
        Mon, 28 May 2018 08:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527519740; cv=none;
        d=google.com; s=arc-20160816;
        b=uTii8uihpEXmu5viq9jVusctm8dpzlDO1/nt36tMJnrutFy7xWsbT3klVHinli0YsV
         JVoTybx0jAyeQILB9iuPqYCoKFIlUuHpYl8EpKJc3ydD1/P4tvFjs1DqafNteYZEAvCb
         E2olJ4FcMSIRcIGk7jAGRwglAaHpKeblobm8vewrD41AQ+Vogd+qbhDMy/bvjiQ47zg9
         vh6YW1l0y7IzHJ1NpZEHqJgcEA2DjRb2h9y+HAK0kJiCy4B+DeGy0FOEKAKf23h9Pa+O
         dhRAr7z+t/gTVO/RBu4PCPz71e5zaM67r9KCeNSOyl9td4hYAP7ZMNKwvdPkrA3SkXMd
         zCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=2lBaO8le3bcdCuXfyr6awUs2rp70K+UNoCZ17rN3wLM=;
        b=FJ/lkVJ1qLR/b6xSKujBR91gsvnBsrRpo5Y6Ls41IxKDwUsSg4LWfxN7u0TdiT8oWv
         9HEkluE4Iu2PE7JNyccoQRKpwJZkn8yc4hvWfzHnldA5Bp5LyVofeToqGo8nxviU6wGQ
         uhApX/boclZ5Bjg3lhhb+/qDKioLAO8VRsjUfKz0Izgxzuk2JKuQEV/+dMGRUpQ4V4Hj
         CvOCwV7zCvMV7p7qWu5Jb+27g/KzlcX62aHAW60eajWAwBgwqjY551nIrMyt1+RdJAoK
         D7L9lFTeRxa80QVftsDqu0EnzVEz9TwmQOOsMpba4QwOmBP9d/GfA3T3jl/LwMha2O75
         NKvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si2685102qku.348.2018.05.28.08.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 08:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJfA-0005WE-AC
	for alex.bennee@linaro.org; Mon, 28 May 2018 11:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNJek-0005Vr-2Y
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNJeg-0007zA-Tc
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:01:54 -0400
Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]:54838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNJeg-0007vn-JN
	for qemu-devel@nongnu.org; Mon, 28 May 2018 11:01:50 -0400
Received: from player796.ha.ovh.net (unknown [10.109.105.25])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id EB4D9174A91
	for <qemu-devel@nongnu.org>; Mon, 28 May 2018 16:57:43 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id AB9B95C00A4;
	Mon, 28 May 2018 16:57:34 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>
References: <20180528124621.22977-1-joel@jms.id.au>
	<9959794d-6d3b-b797-bfc8-b548d54378ad@kaod.org>
	<CACPK8Xe5+-zVfoS-g2Te7YOuT5emT-i=JsNDrF52WLVzLERQcw@mail.gmail.com>
	<CACPK8Xc1xwKBoYYQW0Uzd4keBjspw3uasdTx5OyikaxPmZacgw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d390376b-1c0d-9fa1-d58e-fbecf127c5a7@kaod.org>
Date: Mon, 28 May 2018 16:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc1xwKBoYYQW0Uzd4keBjspw3uasdTx5OyikaxPmZacgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1793840030087023531
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheeigdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.54.143
Subject: Re: [Qemu-devel] [PATCH] aspeed_scu: Implement RNG register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DM8gF0shdF+X

On 05/28/2018 04:29 PM, Joel Stanley wrote:
> On 28 May 2018 at 23:33, Joel Stanley <joel@jms.id.au> wrote:
>> On 28 May 2018 at 23:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> Hello Joel,
>>>
>>> On 05/28/2018 02:46 PM, Joel Stanley wrote:
>>>> The ASPEED SoCs contain a single register that returns random data w=
hen
>>>> read. This models that register so that guests can use it.
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>>  hw/misc/aspeed_scu.c | 19 +++++++++++++++++++
>>>>  1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>>>> index 5e6d5744eeca..8fa0cecf0fa1 100644
>>>> --- a/hw/misc/aspeed_scu.c
>>>> +++ b/hw/misc/aspeed_scu.c
>>>> @@ -16,6 +16,7 @@
>>>>  #include "qapi/visitor.h"
>>>>  #include "qemu/bitops.h"
>>>>  #include "qemu/log.h"
>>>> +#include "crypto/random.h"
>>>>  #include "trace.h"
>>>>
>>>>  #define TO_REG(offset) ((offset) >> 2)
>>>> @@ -154,6 +155,18 @@ static const uint32_t ast2500_a1_resets[ASPEED_=
SCU_NR_REGS] =3D {
>>>>       [BMC_DEV_ID]      =3D 0x00002402U
>>>>  };
>>>>
>>>> +static uint32_t aspeed_scu_get_random(void)
>>>> +{
>>>> +    Error *err =3D NULL;
>>>> +    uint32_t num;
>>>> +
>>>> +    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
>>>> +        error_report_err(err);
>>>> +    }
>>>> +
>>>> +    return num;
>>>> +}
>>>> +
>>>>  static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsign=
ed size)
>>>>  {
>>>>      AspeedSCUState *s =3D ASPEED_SCU(opaque);
>>>> @@ -167,6 +180,9 @@ static uint64_t aspeed_scu_read(void *opaque, hw=
addr offset, unsigned size)
>>>>      }
>>>>
>>>>      switch (reg) {
>>>> +    case RNG_DATA:
>>>> +        return aspeed_scu_get_random();
>>>
>>> may be we could test bit 1 of RNG_CTRL to check if it is enabled or n=
ot.
>>
>> The RNG is enabled by default, and I didn't find any software that
>> disables it, but it can't hurt to have that check.
>=20
> I did some testing on hardware, and the rng still outputs a different
> number each time I ask for one regardless of the state of the enabled
> bit.
>=20
> How should we model that?
>=20

I confirm that the HW doesn't really care about the enabled bit.
Let's ignore it then ?

C.=20
