Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1833408wrd;
        Thu, 20 Sep 2018 05:14:42 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbgbNvuzX86hBA97WYUFL9/4/BgRK3LPgaoU10r73UtSXJEfQEkG2rbGn/e415LrpvurhXr
X-Received: by 2002:a0c:bc03:: with SMTP id j3-v6mr28150455qvg.242.1537445682553;
        Thu, 20 Sep 2018 05:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537445682; cv=none;
        d=google.com; s=arc-20160816;
        b=EYO0gxs6BwZylJIvpBgx2Znu2Rdw8bybFNWnukm7RoKnfM7X+do0JH7bGcGJOfmJTC
         OgDCQ+fimq9AmTCYmH4SY9fByDLW/nLrgVnpq2WIXr2p+n8LN4xsP/sL+zVeDgIgNcTO
         ObSdMcNsNEVYhk6Dy2qK191IuWMv/KbMx8FlgwnWAMi0DxANgPaPz73uEocuQK+KQHoR
         F17sL8NJY0NV28NnmYbctJ5EzHmHJIWz/FLLmubKZN3rOzsoQqT0LDnIdrQjg7ud8PGE
         Mh46s9U3xxHekmrf21LWt2zaSJ4ejrBuN1mYNlXtXsSKJVT+ZrnMPZ7S4ewA90me0sHn
         Gbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=JBNpg5YKNuwESGww7ke8ISYEvdQ6rDyiXT52HCoBb1g=;
        b=gjlk6ADXvAXEqR4n9DZKxnjytwcM3vqR2k8d7/qFAloEY0XcHXsnN5kYzjajeudmBQ
         4k0ZypI8r00FjCEFnP3FFQ+450gcvXa3k69IiuhoPn8lwQSUzQnTud5MGP5GntRMdZ0K
         2F4bSgcaZG2pWZHV4O6VfHW0OqW9NEQDULxCG77ZJm7N9Hb5FgbGVWdDNbhjqCh3xq7Z
         PvoZbBBTSrAGlUNAzTZD+joMIEy4Dd+Miu0YJHAqwouTPRA4+NG/E/2J4GE+D0prh4l8
         VNxzBx808gPBI7O7INFIjabDaIemZxvvhsTcEC4Zo2QBUgg7R6MMILmiUtsa9ntYf710
         Y/+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6-v6si2948179qkg.379.2018.09.20.05.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Sep 2018 05:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2xr0-0000bw-3C
	for alex.bennee@linaro.org; Thu, 20 Sep 2018 08:14:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2xq2-0000Jl-E7
	for qemu-devel@nongnu.org; Thu, 20 Sep 2018 08:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2xpx-00056v-Gd
	for qemu-devel@nongnu.org; Thu, 20 Sep 2018 08:13:42 -0400
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:59593)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2xpx-00051q-90
	for qemu-devel@nongnu.org; Thu, 20 Sep 2018 08:13:37 -0400
Received: from player687.ha.ovh.net (unknown [10.109.146.53])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 2264DF8219
	for <qemu-devel@nongnu.org>; Thu, 20 Sep 2018 14:13:34 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player687.ha.ovh.net (Postfix) with ESMTPSA id 80C652C009A;
	Thu, 20 Sep 2018 14:13:23 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20170630030058.28943-1-andrew@aj.id.au>
	<cd1aba90-176f-9ec6-3e2b-d1135156a96d@redhat.com>
	<1500013222.7221.1.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78bb2ac4-f315-b0b9-7e99-b87bfed46eaf@kaod.org>
Date: Thu, 20 Sep 2018 14:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1500013222.7221.1.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10298887923738446788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledtgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.60
Subject: Re: [Qemu-devel] [RFC PATCH 1/1] memory: Support unaligned accesses
 on aligned-only models
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
Cc: qemu-arm@nongnu.org, joel@jms.id.au, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PDifgvAYoCef

Andrew,

On 07/14/2017 08:20 AM, Andrew Jeffery wrote:
> Hi Paolo,
>=20
> Thanks for taking a look!
>=20
> On Thu, 2017-07-13 at 14:05 +0200, Paolo Bonzini wrote:
>> On 30/06/2017 05:00, Andrew Jeffery wrote:
>>> This RFC patch stems from a discussion on a patch for an ADC model[1]=
 where it
>>> was pointed out that I should be able to use the .impl member of
>>> MemoryRegionOps to constrain how my read() and write() callbacks wher=
e invoked.
>>>
>>> I tried Phil's suggested approach and found I got reads of size 4, bu=
t with an
>>> address that was not 4-byte aligned.
>>>
>>> Looking at the source for access_with_adjusted_size() lead to the com=
ment
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FIXME: support unaligned access? */
>>>
>>> which at least suggests that the implementation isn't complete.
>>>
>>> So, this patch is a quick and incomplete attempt at resolving the iss=
ue to see
>>> whether I'm on the right track or way off in the weeds.
>>>
>>> I've lightly tested it with the ADC model mentioned above, and it app=
ears to do
>>> the right thing (I changed the values generated by the ADC to disting=
uish
>>> between the lower and upper 16 bits).
>>
>> I think the idea is okay.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[0] =3D align_down(addr, access_s=
ize);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[1] =3D align_up(addr + size, acc=
ess_size);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (cur =3D access_=
addr[0]; cur < access_addr[1]; cur +=3D access_size) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0uint64_t mask_bounds[2];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mask_bounds[0] =3D MAX(addr, cur) - cur;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mask_bounds[1] =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0MIN(addr + size, align_up(cur + 1, access_size=
)) - cur;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0access_mask =3D (-1ULL << mask_bounds[0] * 8) &
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0(-1ULL >> (64 - mask_bounds[1] * 8));
>>
>> Please use MAKE_64BIT_MASK.
>=20
> Okay.
>=20
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0r |=3D access(mr, cur, &access_value, access_size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(MAX(addr, cur) - addr), access_ma=
sk, attrs);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0/* XXX: Can't do this hack for writes */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0access_value >>=3D mask_bounds[0] * 8;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>
>> Can you subtract access_addr[0] from mask_bounds[0] and mask_bounds[1]
>> (instead of cur) to remove the need for this right shift?
>=20
> I haven't looked at the patch since I sent it. Given you think the idea
> of the patch is okay I'll get back to working on it and think about
> this.

We have been using successfully this patch for over a year now and it=20
would be nice to get it merged along with the ADC model. Do you have=20
a new version addressing Paolo's remarks ?

Thanks,

C.
