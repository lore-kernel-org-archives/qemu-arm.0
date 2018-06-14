Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1766028wrq;
        Thu, 14 Jun 2018 02:04:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJpivED4vQnKEAYzJaoNm8T6p6Z/2vjJ3tSsPQMwBeb5FIhvISgkWKMJq26FHon5M6uV9tn
X-Received: by 2002:a0c:d1f7:: with SMTP id k52-v6mr1403936qvh.199.1528967086343;
        Thu, 14 Jun 2018 02:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528967086; cv=none;
        d=google.com; s=arc-20160816;
        b=cypyg3V7QGSMKM21N3toT+C+4B+odtGc8iSA+aD0K3TgOyVNOBLtt1WAVbRrtYddI1
         olk7t7VsrNksNWYkdzExfXzxEjBp+3u+SKu356YqTrDoVo46MAZQvsQFjaYRl97jE27B
         w+04whR3jpHRaKJqq7DBB1IgjJ+1xKt1EzNbeyU4OBOjC/sFsmdGWKKFhXnmC4YxKw+p
         Yd5OQiXUGfvvHucpKybSM6VrMl75+HrUY8U3Y4ZPp2fgiS0UYEOqnpuHFejgw+PJ66yZ
         r5Dvf69bp6s17OOJbqx6Loup3zQoERgl7Ajqr6Qa+NTCEgIgPHOsL8hoWQYpeGR+Ad5g
         /i7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=FmQPdWwXEUKwxt8SZiVihD1B2a8enHyw4hxoxbEKSug=;
        b=W0z0sjdRUIQQAG4PhnegltazrpwYRL0PY9nwj5kkyu+RDXxhQGoz0gupg2BHHMm0K7
         0Ma+Vmdh/w0mV3N4rBuze/NWAqy+LuKda5hAy1eppF75i+YA9Zzf56+0kbgH68JpcFLt
         XWkYBU44yS3XBPpQrM9NnHXpxv2g5m81VEqYcsOIrkGJedqXvTtefGPeNdWRssJ+rcxE
         eLXTHvbOpnrijFX8THOJu7cmB9+wCVdP4EMvvcWmOcK0WkzTQXR6wZLsw5Oal6+2R9OK
         IXXBxH8TPKtQ6cTt2U/WsLNCNnqIj+HwfUYSEYr1D6j3wkKrz/i87Nmp9cTCGEq4mjSv
         KqmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6-v6si603182qvn.14.2018.06.14.02.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 02:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTOBR-0003xr-ST
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 05:04:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTOB3-0003py-9o
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTOB1-0002zl-Oo
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 05:04:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59618 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTOB1-0002zS-ED; Thu, 14 Jun 2018 05:04:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8BE28160F82;
	Thu, 14 Jun 2018 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5812026DEF;
	Thu, 14 Jun 2018 09:04:17 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-10-git-send-email-eric.auger@redhat.com>
	<8bf1bccc-b32a-9982-6123-b644c41a96d3@redhat.com>
	<33a3fa10-bf1a-45cd-73bd-403cbd8d4792@redhat.com>
	<fbd7ea65-8f3e-bda3-1bb6-09b3b67d2543@redhat.com>
	<20180614085954.GM6355@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ebf517f0-f31a-aede-2aab-81b82af6e590@redhat.com>
Date: Thu, 14 Jun 2018 11:04:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180614085954.GM6355@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 09:04:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 14 Jun 2018 09:04:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 9/9] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, qemu-devel@nongnu.org,
	christoffer.dall@arm.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yo2iQRZNWUbW

Hi Dan, Laszlo,

On 06/14/2018 10:59 AM, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Jun 14, 2018 at 10:56:20AM +0200, Laszlo Ersek wrote:
>> Hi Eric,
>>
>> On 06/14/18 08:27, Auger Eric wrote:
>>> Hi Laszlo,
>>>
>>> On 06/13/2018 11:05 PM, Laszlo Ersek wrote:
>>>> On 06/13/18 10:48, Eric Auger wrote:
>>>>
>>>>> PATCH: merge of ECAM and VCPU extension
>>>>> - Laszlo reviewed the ECAM changes but I dropped his R-b
>>>>>   due to the squash
>>>>
>>>> Was there any particular reason why the previous patch set (with onl=
y
>>>> the ECAM enlargement) couldn't be merged first? To be honest I'm not
>>>> super happy when my R-b is dropped for non-technical reasons; it see=
ms
>>>> like wasted work for both of us.
>>>>
>>>> Obviously if there's a technical dependency or some other reason why
>>>> committing the ECAM enlargement in separation would be *wrong*, that=
's
>>>> different. Even in that case, wouldn't it be possible to keep the
>>>> initial virt-3.0 machtype addition as I reviewed it, and then add th=
e
>>>> rest in an incremental patch?
>>>
>>> Sorry about that. My fear was about migration. We would have had 2 vi=
rt
>>> 3.0 machine models not supporting the same features. While bisecting
>>> migration we could have had the source using the high mem ECAM and th=
e
>>> destination not supporting it. So I preferred to avoid this trouble b=
y
>>> merging the 2 features in one patch. However I may have kept your R-b
>>> restricting its scope to the ECAM stuff.
>>
>> to my understanding, it is normal to *gradually* add new properties
>> during the development cycle, to the new machine type of the upcoming
>> QEMU release. To my understanding, it's not expected that migration wo=
rk
>> between development snapshots built from git. What matters is that two
>> official releases, specifying the same machine type, enable the user t=
o
>> migrate a guest between them (in forward direction).
>>
>> In every release, so many new features are introduced that it's
>> impossible to introduce the new machine type with all the compat knobs
>> added at once. Instead, the new machine type is introduced when the
>> first feature that requires a compat knob is added to git. All other
>> such features extend the compat knobs gradually, during the developmen=
t
>> cycle. Until the new official release is made (which contains all the
>> compat knobs for all the new features), the new machine type simply
>> doesn't exist, as far as the public is concerned, so it cannot partake
>> in migration either.
>>
>> This is my understanding anyway.
>=20
> That is correct - there is ZERO expectation of migration / ABI stabilit=
y
> between arbitrary GIT snapshots, only official releases.  Prior to the
> first release including it, a versioned machine type can be changed
> arbitrarily.
OK so sufficient consensus on this then.

Thanks

Eric
>=20
> Regards,
> Daniel
>=20
