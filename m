Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2525075wrw;
        Wed, 7 Nov 2018 11:40:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5cOt6bfvDziD9jYyPPcemz4wEGBUe/nZ63t9K3kY0G4LfJZJ1hg5C6k6xdhwJN2R5IzEgPh
X-Received: by 2002:ac8:73c2:: with SMTP id v2mr1510467qtp.377.1541619652175;
        Wed, 07 Nov 2018 11:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541619652; cv=none;
        d=google.com; s=arc-20160816;
        b=trUnRL3TVhsaX4lNlCPYxvOs0M1AnRc0G0SFYyrsemM1jwTmYJjHNnm4Rbicro7xQD
         atHHKDidR3soXJjjAJsqLL454/OedJiNkGGxqC4feS8zINDCqY8Lin2ybYy1lnmMo2D6
         qcLakzKIFMj5bs/jVWkhCPFEwyhuIC3sNXUjE/N226bVd6gLiwRiQvcOgVz41bQm+sSE
         4sIm4HnmkokRF8j2oxLiEPEL9Vnz91Jl6YFM4wrJVwdwSdMSr1oAgJ1Rvr3Dig+Q4w6Y
         rTB0qz64j5kRD0Cz0AG34aV2Ujkl1o79IaYHbrxk/F8Q8nrS3kFBbouR4M0SJiztYIJG
         dtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=4xhTZElqqprE8uGfg1gguGAEfQXWqbB6Hpt5WtAIeJ4=;
        b=ZjQKm2GTBvwAr39WlpQMGKkhIVGC5o0saVIMQBmcR8RwF7vSXPQrAiWrv7TJCUggpF
         wHOBtgKGvoxcSi3PSDWifbeL+gGFjZrFsSrkqLeCSP2WI7tPgKAxBEHEeYuqCso0CYqP
         zCF2Up8ErXPGc9JSp1hct/MW928BnBWzgp3np1cpSSAzlCBUqHGQWqrMc/xEjCUgWZdf
         RO0FZenPouN9s/F5UTvKyKxZ0fEBZACG8G0LYZ8rD3xNqmtT+u8qBtkEaXT3dLZIcG1L
         dbxLFfIk2Cu3jevW0qig38OS+jUHpOAa+Ku+lc16I7tKEvGJlV1SUlU9LK7BSbVrYTD9
         eA0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y127-v6si1070001qkd.135.2018.11.07.11.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 11:40:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKTh5-0007su-MI
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 14:40:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gKTgL-0007Dn-SE
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 14:40:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gKTgK-0008RA-71
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 14:40:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gKTg8-0007LS-BI; Wed, 07 Nov 2018 14:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A80731524C9;
	Wed,  7 Nov 2018 19:39:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-119.ams2.redhat.com [10.36.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63CED1057047;
	Wed,  7 Nov 2018 19:39:17 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1541528230-31817-1-git-send-email-thuth@redhat.com>
	<c0febf9a-f098-112d-9c8d-c320cc66b04a@redhat.com>
	<12974ebb-09de-c6e9-1dd7-5199a8ae6b05@redhat.com>
	<CAFEAcA-B74FQgj3COyGZ_SAAvSUA6=OaLdy5--NoAgHgEGZkpg@mail.gmail.com>
	<87k1louaze.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
	yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
	4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
	tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
	0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
	O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
	0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
	gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
	3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
	zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzRxUaG9tYXMgSHV0
	aCA8dGguaHV0aEBnbXguZGU+wsF7BBMBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
	gAUCUfuWKwIZAQAKCRAu2dd0/nAttbe/EACb9hafyOb2FmhUqeAiBORSsUifFacQ7laVjcgR
	I4um8CSHvxijYftpkM2EdAtmXIKgbNDpQoXcWLXB9lu9mLgTO4DVT00TRR65ikn3FCWcyT74
	ENTOzRKyKLsDCjhXKPblTPIQbYAUCOWElcyAPm0ERd62fA/rKNxgIiNo/l4UODOMoOJm2/Ox
	ZoTckW68Eqv7k9L7m7j+Hn3hoDTjAmcCBJt+j7pOhzWvCbqoNOIH8C8qvPaNlrba+R/K6jkO
	6jZkTbYQpGIofEQJ/TNn38IsNGpI1ALTHWFtoMxp3j2Imz0REO6dRE2fHRN8sVlHgkoeGhmY
	NbDsDE1jFQOEObFnu0euk//7BXU7tGOHckVAZ8T1smiRPHfQU7UEH2a/grndxJ+PNeM5w7n2
	l+FN3cf2KgPotCK2s9MjSdZA7C5e3rFYO8lqiqTJKvc62vqp3e7B0Kjyy5/QtzSOejBij2QL
	xkKSFNtxIz4MtuxN8e3IDQNxsKry3nF7R4MDvouXlMo6wP9KuyNWb+vFJt9GtbgfDMIFVamp
	ZfhEWzWRJH4VgksENA4K/BzjEHCcbTUb1TFsiB1VRnBPJ0SqlvifnfKk6HcpkDk6Pg8Q5FOJ
	gbNHrdgXsm+m/9GF2zUUr+rOlhVbK23TUqKqPfwnD7uxjpakVcJnsVCFqJpZi1F/ga9IN87B
	TQRR+3lMARAAtp831HniPHb9AuKq3wj83ujZK8lH5RLrfVsB4X1wi47bwo56BqhXpR/zxPTR
	eOFT0gnbw9UkphVc7uk/alnXMDEmgvnuxv89PwIQX6k3qLABeV7ykJQG/WT5HQ6+2DdGtVw3
	2vjYAPiWQeETsgWRRQMDR0/hwp8s8tL/UodwYCScH6Vxx9pdy353L1fK4Bb9G73a+9FPjp9l
	x+WwKTsltVqSBuSjyZQ3c3EE8qbTidXZxB38JwARH8yN3TX+t65cbBqLl/zRUUUTapHQpUEd
	yoAsHIml32e4q+3xdLtTdlLi7FgPBItSazcqZPjEcYW73UAuLcmQmfJlQ5PkDiuqcitn+KzH
	/1pqsTU7QFZjbmSMJyXY0TDErOFuMOjf20b6arcpEqse1V3IKrb+nqqA2azboRm3pEANLAJw
	iVTwK3qwGRgK5ut6N/Znv20VEHkFUsRAZoOusrIRfR5HFDxlXguAdEz8M/hxXFYYXqOoaCYy
	6pJxTjy0Y/tIfmS/g9Bnp8qg9wsrsnk0+XRnDVPak++G3Uq9tJPwpJbyO0vcqEI3vAXkAB7X
	VXLzvFwi66RrsPUoDkuzj+aCNumtOePDOCpXQGPpKl+l1aYRMN/+lNSk3+1sVuc2C07WnYyE
	gV/cbEVklPmKrNwu6DeUyD0qI/bVzKMWZAiB1r56hsGeyYcAEQEAAcLBXwQYAQIACQUCUft5
	TAIbDAAKCRAu2dd0/nAttYTwEACLAS/THRqXRKb17PQmKwZHerUvZm2klo+lwQ3wNQBHUJAT
	p2R9ULexyXrJPqjUpy7+voz+FcKiuQBTKyieiIxO46oMxsbXGZ70o3gxjxdYdgimUD6U8PPd
	JH8tfAL4BR5FZNjspcnscN2jgbF4OrpDeOLyBaj6HPmElNPtECHWCaf1xbIFsZxSDGMA6cUh
	0uX3Q8VI7JN1AR2cfiIRY7NrIlWYucJxyKjO3ivWm69nCtsHiJ0wcF8KlVo7F2eLaufo0K8A
	ynL8SHMF3VEyxsXOP2f1UR9T2Ur30MXcTBpjUxml1TX3RWY5uH89Js/jlIugBwuAmacJ7JYh
	lTg6sF/GNc4nPb4kk2yktNWTade+TzsllYlJPaorD2Qe8qX0iFUhFC6y9+O6mP4ZvWoYapp9
	ezYNuebMgEr93ob1+4sFg3812wNP01WqsGtWCJHnPv/JoonFdMzD/bIkXGEJMk6ks2kxQQZq
	g6Ik/s/vxOfao/xCn8nHt7GwvVy41795hzK6tbSl+BuyCRp0vfPRP34OnK7+jR2nvQpJu/pU
	rCELuGwT9hsYkUPjVd4lfylN3mzEc6iAv/wwjsc0DRTSQCpXT3v2ymTAsRKrVaEZLibTXaf+
	WslxWek3xNYRiqwwWAJuL652eAlxUgQ5ZS+fXBRTiQpJ+F26I/2lccScRd9G5w==
Organization: Red Hat
Message-ID: <4b0e9b3f-5d88-9ef2-d0c5-f241067001d0@redhat.com>
Date: Wed, 7 Nov 2018 20:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87k1louaze.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 07 Nov 2018 19:39:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add an entry for the 'collie'
 machine
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
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8fNr7O41A5rr

On 2018-11-07 17:08, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
>> On 6 November 2018 at 18:52, Thomas Huth <thuth@redhat.com> wrote:
>>> On 2018-11-06 19:49, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 6/11/18 19:17, Thomas Huth wrote:
>>>>> There is no active maintainer, but since Peter is picking up
>>>>> patches via qemu-arm@nongnu.org, I think we could at least use
>>>>> "Odd Fixes" as status here.
>>>>
>>>> This looks more as "Orphan" to me...
>>>
>>> I'll leave it up to Peter for the final decision...
>>
>> I think we're not very consistent[*] in our usage of the various
>> statuses in the MAINTAINERS file. I guess "Odd Fixes" makes
>> sense in that, well, if you send a patch to this
>> code and cc me I'll review it and put it in the tree. (This
>> is true of any of the arm boards we have.)
>>
>> [*] We have one thing tagged Orphan, which is bsd-user/,
>> and some things tagged Odd Fixes with no listed maintainer,
>> and some things tagged Odd Fixes which are in practice more
>> like Orphan (for instance sh4), and we list "fpu/" as
>> Odd Fixes despite having given it a pretty thorough
>> overhaul very recently, and so on...
>>
>> If you wanted a mechanizable rule, you could try something
>> like "every file which is in status Odd Fixes or better
>> must list with M: at least one named individual who has
>> submitted a pull request in the last nine months" :-)
>=20
> Sounds like an excellent idea to me!

Well, for me "odd fixes" means that there is someone around who might
pick up the patch and throw it into a PULL request. "Orphan" means it's
mostly in vain to send patches for this subsystem, since there is nobody
going to pick up your patch. So for the ARM boards, I'd say that "odd
fixes" is a better choice, since Peter still picks up most of the
patches via the "L: qemu-arm@nongnu.org" (big thanks for this, by the way=
!).

 Thomas
