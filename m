Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1428428wrt;
        Wed, 28 Nov 2018 11:10:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XuM38yKiIx+hnb0mzdYK2w0EW09KFrGotD0Bd/7wPnNN0jmDW6f1NQACzmfcURWBe6RfeZ
X-Received: by 2002:a81:b189:: with SMTP id p131mr9476221ywh.84.1543432215299;
        Wed, 28 Nov 2018 11:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543432215; cv=none;
        d=google.com; s=arc-20160816;
        b=XRuESKpAl0KHX5wE5mcxzqWAM4dtEwv0M6gdCmf3KXTCnVqSRV7TT/XkqP3OuW4hYd
         mTZCi5Qzmdle4WNosQIP8gLEzze1AwwfSoTw7haNAIK3WJyhROEhiI6dmOyF+0vIM7c2
         169ETLONk/HSDqn3NWokvdSbYyLL6d3W1GbuaAsEN9giM4mIIsLMR8Am39wKzQ9nC+jd
         pyb+dspUgQRhO+bsonnQHca2fJC1A2OSVmTF7TXwfWe89HvPHzxz8EqGjZp21ZK4glaX
         gT7qznfqrl1pmoVfhyuVnxjBfjUt7kDqpuHnMWeN6t+MFVg2lkkD5lKEUgbyiETlCzdB
         izCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=iMaORMxchOw4ZU6nzAItqjopPCOvwqQa/kTYnodplH0=;
        b=xkXla6kRtAHi6SeoUcGL/88HcWNNkIIEJ/xKp65IQh64vWNYFxENHskymeQB/aplvX
         MEyJqpjwelN6yzUrbP/RTdbrhW/+DksziNyzms6ISDgDHRJSGzfBRgd5dulNRQz9YHgh
         qc3VSno0lWGoxeGGTvZh3MPjdHQwxbFQZMmP+UJkxiWC2i/myUSYZRaKYzT9UgWozLlU
         JlhjC8100/zAJ3Mr/MJIpiwkrsD1VhKKijrZRnRJj7j2k7qA/GYfPMp+srCJ2WZefVOB
         XMFfIZtpLnqqA04wXXQ6nmlPoqpvRN/6tShSBTa/HLovOP0DOHrekxGl8uYqqb+4FhGw
         D12w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w199si5524126ywd.45.2018.11.28.11.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 11:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS5Dy-0005r0-Np
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 14:10:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gS5DA-0005Rm-Ut
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 14:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gS5D7-0001Lw-RP
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 14:09:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gS5D7-0000uZ-JP; Wed, 28 Nov 2018 14:09:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7534C057E28;
	Wed, 28 Nov 2018 19:09:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-118.ams2.redhat.com [10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A56526109E;
	Wed, 28 Nov 2018 19:09:04 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
	<20181128160525.GP24355@redhat.com>
	<3d95da16-5f2a-2ec8-a674-189b44eab222@redhat.com>
	<20181128165803.GT24355@redhat.com>
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
Message-ID: <7b33a961-b37b-f8ce-a77f-5c1bbd19ac42@redhat.com>
Date: Wed, 28 Nov 2018 20:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181128165803.GT24355@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 28 Nov 2018 19:09:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper:
 Fix compilation with clang 3.4
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U7Lc2kJNqdKg

On 2018-11-28 17:58, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Nov 28, 2018 at 05:50:38PM +0100, Thomas Huth wrote:
>> On 2018-11-28 17:05, Daniel P. Berrang=C3=A9 wrote:
>>> On Wed, Nov 28, 2018 at 10:58:14AM +0100, Thomas Huth wrote:
>>>> Clang 3.4 does not know the "flatten" attribute yet. We've already
>>>> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2=
,
>>>> so use this macro now here, too, to fix this issue.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> Although we currently only aim to support CLang and GCC, we don't hav=
e
>>> any checks for a minimum version of these two tools in configure.
>>>
>>> So I was wondering if we actually still need to support CLang 3.4 at =
all
>>> in QEMU, given our targetted build platforms.
>>>
>>> Unfortunately repology.org is failing me in reporting clang versions
>>> for most distros, so I don't have an answer yet. I do see that Debian
>>> Jessie however ships clang =3D=3D 3.5 and that's usually the oldest d=
istro
>>> if RHEL hasn't got something older.
>>
>> I'm using RHEL7 and the clang that I get "for free" is 3.4.2 via EPEL.
>=20
> Hmm, raises interesting question of whether we should consider 3rd
> party repos for purposes of determining our min versions.
>=20
> I'd pretty much intended to only care about vendor provided repos,
> in which case RHEL7 would be considered to lack clang, for purposes
> of deciding min versions.
>=20
> EPEL is a bit murky because while it is a 3rd party repo, many users
> of RHEL consider to be a defacto standard repo.

Looks like there's also the possibility to get newer versions of Clang
on top of RHEL7:

https://developers.redhat.com/blog/2018/07/07/yum-install-gcc7-clang/

... so fine for me if we use another version as the minimum. But if we
decide to use 3.4 as minimum version, I'll keep my current compiler to
be able to report problems...

 Thomas
