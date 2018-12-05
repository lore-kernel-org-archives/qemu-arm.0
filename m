Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9416471wrt;
        Wed, 5 Dec 2018 06:05:03 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XS2hFubW7U6JljvVqR2MDCV5hC9sIN3XcGisNS55ILL8rUHpexu806f80KBE0jy+PwAMb+
X-Received: by 2002:a0c:b61b:: with SMTP id f27mr23685577qve.174.1544018703842;
        Wed, 05 Dec 2018 06:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544018703; cv=none;
        d=google.com; s=arc-20160816;
        b=a9yVzyQgBqIGy2T9IVb+AI9SzoDXzv63tb6kx/sx5+dSq7SjqdB2k2dB16Gv9XfuX/
         u5mKE0iykGwXfjAgkTZ8huhnf67lIHQPjIVtaL3K4WFgNaQAdyAcREkFoRFkcG4izbYc
         k06Sfa3vrQ1UkmutV4CDo/ZepFKAsiBFFSr0SVlGkX8tsVHNdEITmZGUFVZ3rYkVeboc
         2dPQBaeFYUlh4UeU/Kuq92rbAN1+bpIlV01zcK47oU04Fb19PjP9A4UY3O1pMLoCRs1j
         ciU3JPEhJ6T0w69q3Sk4G9pXQdBX37SghywoLyLFPWRVk236g7ioZ5caXlXl2ksOvuho
         B5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=hfbVZcmZXgIBIGZhl8iYyIrZm4WK3S0TKyLmN74JMds=;
        b=TUzGVmmPoskZWcXbj47ZhIhbAaL5DVdBko5pld5E69zm1cIiiqNjTW9ilWp6Etsz1J
         CwY/ygnYlUTWpwRlACNtrhaMMhjsRCILv+VV2YdxEpGz68CvnvKJY1Cxjbc+ISM+H+Et
         lTzytUnwTzOTRwv0OUVdyRhdu08QDZvdVvESTbx+gKmKqzmjLFFpqO4zeq85LjYJkipz
         7L0jyac7n7S3DkTc16IfIQvketCCjdDL6GcCD7Ea/y3RbQoLAAFe2A+8ypIomsTD1B9p
         kOa/mlnguILKy934eciWsRcxbrmR2OaUjpBcorYOEHUtzhb5b9htuD6VnZjhdh6Vk0d7
         kpLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OxI0gsZ5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Uxca22SF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Uxca22SF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127si8597879qkd.153.2018.12.05.06.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 06:05:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OxI0gsZ5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Uxca22SF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Uxca22SF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXnS-0006QA-TN
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 09:05:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gUXlk-0004Q2-Jh
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 09:03:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gUXlc-0008Dj-7K
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 09:03:14 -0500
Received: from greensocs.com ([193.104.36.180]:42823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gUXlY-00089a-Md; Wed, 05 Dec 2018 09:03:05 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4A64D441999;
	Wed,  5 Dec 2018 15:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544018572;
	bh=eddIB0u/lh9GdBPDkdQd5zrkekNHykexXGrBdW8q+tk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=OxI0gsZ5gpFBYbHSyPRocm1x6eCTf1zCOXr4VE72uhIu8OQSSe8/eZdtrBbPqq/Y9
	7s1xnbZdNkIzlPD0SLIDYjCH2DB7CcTVrIakoY+R8buPWGjljqDJaP+17ru1z3FixU
	OxC187ByzQx5ahhbU4KwCHBn/+PGHHD7Hz4RVbrk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Uxca22SF;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Uxca22SF
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-prJGuvKFWy; Wed,  5 Dec 2018 15:02:46 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id A4FF5556D2; Wed,  5 Dec 2018 15:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544018566;
	bh=eddIB0u/lh9GdBPDkdQd5zrkekNHykexXGrBdW8q+tk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Uxca22SFw5zZ1DIPKIqbY0ZikF4956Ws1OuJclaPsffy6npPANOve7k5t0b9iJcW7
	+Swg3EJC26vrPDJM61QM6oVqpJDapziy360rA4lVC9chRQlSwWdJV2sfp96NyMjLK6
	HbObBa3ZzBYzCbpHZw+EkYSLvBjqT7LS2gVxSpVI=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 2982D441999;
	Wed,  5 Dec 2018 15:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544018566;
	bh=eddIB0u/lh9GdBPDkdQd5zrkekNHykexXGrBdW8q+tk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Uxca22SFw5zZ1DIPKIqbY0ZikF4956Ws1OuJclaPsffy6npPANOve7k5t0b9iJcW7
	+Swg3EJC26vrPDJM61QM6oVqpJDapziy360rA4lVC9chRQlSwWdJV2sfp96NyMjLK6
	HbObBa3ZzBYzCbpHZw+EkYSLvBjqT7LS2gVxSpVI=
To: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
	<20181204190548.GH18284@habkost.net>
	<CAFEAcA9M3akT7sF-kjCg41ucuUhv2PxKaCBmkN3eacvqvf_w9Q@mail.gmail.com>
	<20181204194532.GJ18284@habkost.net>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f0a7fe11-61ff-6a60-f320-438e4e38f2da@greensocs.com>
Date: Wed, 5 Dec 2018 15:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204194532.GJ18284@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Se98Q8M3Jww

On 12/4/18 8:45 PM, Eduardo Habkost wrote:
> On Tue, Dec 04, 2018 at 07:16:39PM +0000, Peter Maydell wrote:
>> On Tue, 4 Dec 2018 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wro=
te:
>>> On Tue, Dec 04, 2018 at 06:24:19PM +0000, Peter Maydell wrote:
>>>> A cluster is a group of CPUs which are all identical and have
>>>> the same view of the rest of the system.
>>
>>> With that definition in mind, why can't QEMU cluster CPUs
>>> automatically by looking at CPU models and address space objects?
>>
>> That sounds like it is in theory feasible and in practice
>> quite tricky. You would have to look not just at the CPU
>> model name but also introspect all its properties for
>> ones which change features of the CPU and are set differently
>> on different CPUs (and I don't think there's any way to
>> automatically tell which properties are ones which make
>> the CPU different for which-cluster purposes and which aren't).
>> And if we automatically checked whether address space objects
>> were the same it would rule out implementing devices with
>> per-cpu banked memory mapped registers by mapping different
>> things into the AS for each CPU (though that's a hypothetical
>> at the moment -- I've thought about implementing stuff that
>> way but we tend to implement that sort of thing by looking
>> at current_cpu->cpu_index at the moment).
>=20
> I see.
>=20
> Can't we at least do something to make sure the cluster objects
> make sense?  e.g. by ensuring at least QOM CPU type is the same,
> and that cpu->address_space somehow points to
> cpu->cluster->address_space?
Where such a check should be placed? Cluster realize function is not
good since children can still be added after device realization. A good
place would be when object_property_add_child() is called, but I'm not
aware of a way of hooking into that with the QOM API...

--=20
Luc

>=20
> CCing Paolo, so he can correct me if this doesn't make sense.
>=20
