Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp562917wme;
        Thu, 17 May 2018 00:07:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpPGXtUsrjD+nfY+b/OvhrR47Ay977sTRS8GUq+JiKPrq1ogI8gKjuEyBFNoruPBDO+ET9v
X-Received: by 2002:ac8:7259:: with SMTP id l25-v6mr4060608qtp.325.1526540868348;
        Thu, 17 May 2018 00:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526540868; cv=none;
        d=google.com; s=arc-20160816;
        b=rt7u0lYoOOsNPMOT63wADcZsqu/B1Oj2r+75cx8ILC8ONQe191PZk4u+TmOBitVtOS
         bL7dHHdpw/NOO2u6VTeu6LAycfhLjbdCYBd3mVFdKpuuVhbHjCAZW0MvP1fdgQIh2SQb
         ulUhcB5VRP5rPjEm29ry99hJfZrlFb7VsLMzHAz37pijNkbNKShKutTaqo/27FiX7NPj
         ueXdQ/5n6JjsX+EcXPp1InUsvuRIy9vh99kulOdaYG01Smfm3WtH9JmCbz9WoJBi6eco
         3Z5V8lkn+ZxyHi6g5xOyje9IHxKWfaL9NUe07l6fVYv/KTluIQt9AWdu7nnwaby+5roS
         tu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Zu/kL/z9iU6Pu+kv0J12bIF4M/lJ7ajDfHK8X+Hu7Tw=;
        b=fnvIuWgXxMQr8ZvltavNNKRCJesSSVxP2iiXXDkrYgeoXjJM+tTfv7B2NKKTFPTUSw
         Y1X8/v6QB6fDcNPJ9uc4ZiCQmJaHeq60Bdfv9FShML+ynpr2qK7YEOpkfHVvi1poqqH+
         kHo91TjuJMRo9ybQnI4h4+2lHyNDldJNMCB8HEuGeGMUU6vINUtCJYWPYMAneumGAzUX
         Crl+ui18Xpcl/AMPWreg8NHpM2G4OOZGAsBPHVVrrmMQeIqwH0LeevA8Jms9Ayu0dd5C
         uBj6FiA0hL1MoiR9Hpl47GKUh63YL3xa6F39JZvbPcDQQB3rCyHpNGsim8zpbBhOL+0L
         3gcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si4153377qvn.267.2018.05.17.00.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 00:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJD0t-0001z0-RD
	for alex.bennee@linaro.org; Thu, 17 May 2018 03:07:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fJD0i-0001yB-Vq
	for qemu-arm@nongnu.org; Thu, 17 May 2018 03:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fJD0e-0007df-JC
	for qemu-arm@nongnu.org; Thu, 17 May 2018 03:07:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52726 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fJD0e-0007dM-F5; Thu, 17 May 2018 03:07:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDD7481FE147;
	Thu, 17 May 2018 07:07:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-111.ams2.redhat.com
	[10.36.117.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 997662166BAD;
	Thu, 17 May 2018 07:07:30 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
	<1526493784-25328-3-git-send-email-eric.auger@redhat.com>
	<2c55370d-fa43-12a1-5baf-ec7cf824c0dc@amsat.org>
	<CAFEAcA-GxScM9StKESYAqJ2sbiSH+hWjJXvF7COjJPojs5J5QQ@mail.gmail.com>
	<8324a612-8785-9db9-b0d4-ab943645a16d@amsat.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f7bd0127-a430-3672-17a4-04fd33b41f51@redhat.com>
Date: Thu, 17 May 2018 09:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8324a612-8785-9db9-b0d4-ab943645a16d@amsat.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 17 May 2018 07:07:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 17 May 2018 07:07:31 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/smmu-common: Fix
 coverity issue in get_block_pte_address
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HaoHuA8GwcFN

Hi Philippe,
On 05/16/2018 10:01 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 05/16/2018 01:23 PM, Peter Maydell wrote:
>> On 16 May 2018 at 16:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>>> Hi Eric,
>>>
>>> On 05/16/2018 03:03 PM, Eric Auger wrote:
>>>> Coverity points out that this can overflow if n > 31,
>>>> because it's only doing 32-bit arithmetic. Let's use 1ULL instead
>>>> of 1. Also the formulae used to compute n can be replaced by
>>>> the level_shift() macro.
>>>
>>> This level_shift() replacement doesn't seems that obvious to me, can =
you
>>> split it in another patch?
>>>
>>>>
>>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  hw/arm/smmu-common.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>>> index 01c7be8..3c5f724 100644
>>>> --- a/hw/arm/smmu-common.c
>>>> +++ b/hw/arm/smmu-common.c
>>>> @@ -83,9 +83,9 @@ static inline hwaddr get_table_pte_address(uint64_=
t pte, int granule_sz)
>>>>  static inline hwaddr get_block_pte_address(uint64_t pte, int level,
>>>>                                             int granule_sz, uint64_t=
 *bsz)
>>>>  {
>>>> -    int n =3D (granule_sz - 3) * (4 - level) + 3;
>>>> +    int n =3D level_shift(level, granule_sz);
>>>
>>> Shouldn't this be level_shift(level + 1, granule_sz)?
>>
>> No. The two expressions are equivalent, they're
>> just arranged differently:
>>
>>    level_shift(lvl, gsz)
>>       =3D=3D gsz + (3 - lvl) * (gsz - 3)
>>       =3D=3D gsz + (4 - lvl) * (gsz - 3) - (gsz - 3)
>>       =3D=3D gsz - gsz + (4 - lvl) * (gsz - 3) + 3
>>       =3D=3D (gsz - 3) * (4 - lvl) + 3
>=20
> Argh I failed this middle school demonstrations...
>=20
> Thanks Peter :)
>=20
> So for the much cleaner level_shift() use:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thank you for the review!

Eric
>=20
