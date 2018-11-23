Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1682912wrt;
        Fri, 23 Nov 2018 00:05:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vp8sGC89l1THMwD7B4ZB6gjVm7KUEOx3mZb3xI0SdSarE94cncauH6N1EDmLiX5vVzT0KN
X-Received: by 2002:a25:2157:: with SMTP id h84-v6mr4765610ybh.198.1542960319037;
        Fri, 23 Nov 2018 00:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542960319; cv=none;
        d=google.com; s=arc-20160816;
        b=Hvgt31HSkhx+pEy0tAi4YBwhyjkX9bzcdlu3FSJH4ZxHp9g7Z2ksjK8OYvTFHaYtdG
         eQr6mJ9t1zTYVMtNumD73Ny8eAx3045hJzpwcvH/dtEqHqjAR9ll6leCLt5IWYS5zMBM
         +nAQf6ij0+o2vosFZ0hVcPm2K08BMHPrLQwp9YP8tGDPWKugoeSJVDfrSnG0IjW6TVf7
         fpr6QoPp9RdoEZ9O8MEGSlWvmixLap3pVSEd4RGvoQOQHzHaUP7qH0s94IiNox0LX/LJ
         afgSY2EQ/c7ZRBPz62auvm+haWq7/cOFlh0AFEHNNslZgscHFvMDgwMrO9cTue8RmgPS
         8M+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=HLm1++KCauANdqPEMNlaVFdoRb5KZA1eACFN8Nk95Ac=;
        b=J9pBaGB+hA431AFIL9dkwhkoOccw5gblExnmCcdfVkhCPYcdxPgvKsgvV2Lx8fY/wc
         i/bSnv801aLH51K6Sw5C2mBsB+I7OM57xSHUn3XoON/VjW+lS+vyn9eQUAu1e3ZtgZ+T
         NFH3XYancwbeM8jifqpDA9rVO9fmzWgEVBWXIP1gmcPPYDCftw9haHPpqrl9RTt3V0Mk
         OOriRr0bdN2lo1IjSv4Kwur7CsDwTD1PvhwdpfESLuRBTEmKZZe+fTJc9RbIpPRsQbPD
         D3iMZxQ7ShayWZL204eolAi2q47YJXpmYX0cnLmlROW9cbu5G4TSGUBVgB4gp0MPoxLC
         BMPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2-v6si32180647ywc.265.2018.11.23.00.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 00:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ6Sj-0005bE-WD
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 03:05:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gQ6SX-0005YW-Q5
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 03:05:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gQ6SU-0007vk-Mx
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 03:05:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47164)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gQ6SP-0007Wc-Ro; Fri, 23 Nov 2018 03:04:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5360885362;
	Fri, 23 Nov 2018 08:04:53 +0000 (UTC)
Received: from [10.36.116.235] (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F34EC194AE;
	Fri, 23 Nov 2018 08:04:48 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, thuth@redhat.com
References: <20181122180143.14237-1-eric.auger@redhat.com>
	<1259e457-6cb8-3b1e-853f-53f1e47cac63@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <43381cce-1af0-8613-edf3-c216afdbe142@redhat.com>
Date: Fri, 23 Nov 2018 09:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1259e457-6cb8-3b1e-853f-53f1e47cac63@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Nov 2018 08:04:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] MAINTAINERS: Add an ARM
 SMMU section
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W+khTep3eLPF

Hi Philippe,

On 11/22/18 11:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric,
>=20
> On 22/11/18 19:01, Eric Auger wrote:
>> Add a new ARM SMMU section and set Eric Auger as the maintainer
>> for ARM SMMU emulation sources.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  MAINTAINERS | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1032406c56..3cac9f0a0c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -151,6 +151,13 @@ F: disas/arm.c
>>  F: disas/arm-a64.cc
>>  F: disas/libvixl/
>> =20
>> +ARM SMMU
>> +M: Eric Auger <eric.auger@redhat.com>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>=20
> Shouldn't you use 'Supported': "Someone is actually paid to look after
> this."?
Not sure this is really important as long as get_maintainer.pl returns
the right contacts. Many ARM sections do not feature the "Supported"
tag. I will follow Peter's guidance though.

Thanks

Eric
>=20
>> +F: hw/arm/smmu*
>> +F: include/hw/arm/smmu*
>> +
>>  CRIS
>>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>>  S: Maintained
>>
