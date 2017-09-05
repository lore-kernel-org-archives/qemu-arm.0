Received: by 10.223.172.38 with SMTP id v35csp1899230wrc;
        Tue, 5 Sep 2017 14:29:12 -0700 (PDT)
X-Received: by 10.237.34.25 with SMTP id n25mr719714qtc.144.1504646952212;
        Tue, 05 Sep 2017 14:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504646952; cv=none;
        d=google.com; s=arc-20160816;
        b=VjCWHB7pEjz4UmJI7fAedz7w9zZMfuX65boQnx29mZZ7rTWOBdpi/pruUGK+VH1BhH
         GBuL4bJAsEHHqFOQI/ZcyG9PPX8GFT/RFliAgtvTnIm1NfF5DJ9gSrm4JVy1owouuHSg
         ynjZTdMoXv6lAb6Tjmbac3iLoax/OIkp/v0Ak/dgMKbuLaD37zVI7DZOmnBLUoxGL0bO
         5+KArSI6icWnlc3giSRpmq7r6dtqSDnhgxyvgjJehprJPqq2zxnEG0pe/84YoCyYPl6O
         zXUP6CzJlB1sQ6D0bWBdUE13M9aUpWTIkDFaKVZHr8x4G0Q5adxmziPapEj1xgpkqUMA
         KW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=gPAuiBQfnfrBBFR+ISiDtdNFvJ8ojpNTkJauglaa7gc=;
        b=nzsX/jeE9YwY13zZBYjWeZ59i7T/0V3KLIB7BOb7KHFTm2HQBrkgXDnhhNPI7LRUDC
         xzjwxMUkIow0iaP76E0tBrKj5U1r3mPjiDRrFFboeS2VgLNEAzRbqUWfaC4Iv+uX1WSm
         y4cWbd1n5ZOBPgcR/Ms5JUhrhaea7Qrwn1J3S+It5o1V+pdiuCfs7tnk8QAkYCGi5oHC
         SpJBasXRJxTLSQ5ydG5sAvNZSzqzJcwc5NBygP7bEz5HFdIIEkENgCDj8m/ZLkNwFNWu
         HwJh9Uv6b3CiVIvsvRilvLv+8QuPZBCKGRKYsSu4QOYrftCd2FAJFuxIrYWgG/SZR4sD
         fwQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsJbfFU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q77si1377560qka.183.2017.09.05.14.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 14:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsJbfFU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpLPB-0002t6-Tv
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 17:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpLP1-0002sj-Ot
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 17:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpLOx-0003dL-1b
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 17:28:59 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:37929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpLOw-0003cl-QN
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 17:28:54 -0400
Received: by mail-wr0-x22c.google.com with SMTP id 108so10858237wra.5
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gPAuiBQfnfrBBFR+ISiDtdNFvJ8ojpNTkJauglaa7gc=;
	b=UsJbfFU2zrEP4L6ITvYr3ir1nEltnxfK2AtI/CZWZAcErsDbL1V/vcj7kjrlVmFnPh
	o4veDTH/PeVOnVhg+PRdDDHYDHUqRQTkdHjQmtx8LOKQzuwCPgxKKaltDyRv6N+zgPAf
	3ZkP7H/paxxpkJvetvCP9FxcWFvVFF585b+p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gPAuiBQfnfrBBFR+ISiDtdNFvJ8ojpNTkJauglaa7gc=;
	b=OoSi3AprH1BqI51XZfYrJZs10ChMySFi31Pg/fZuqtRnEhCcjIpJ06aW3dZGuIWVnr
	mDmSVFSnSEa6QxbUrH5AQraLiWPuo9fhV+DVLVZ4+3/UAbQ0SZ6jIfz7IbJLQJL0TfmI
	7w/oa76Kgix9npUaHZ4HbaS1OfEufA9d8C6i//JH9/WYaxHx5BxA+FKPWVlkvmDDcvGd
	nb/oFBSMV1+fGoe+iJENqesAGqCCorziskmjef3K9/3KezGeYSQgHSBs+UDEYMCzZOl9
	9CRPSvKD2vyiSn7F3c+jop0+gwGqxQz7j+RW6yq5YaHwZBxXjBKsN5H0W3z2uDlR42Qd
	WRXA==
X-Gm-Message-State: AHPjjUhIoJrOCDbfpTexHmJLhQqSg6rVJRxNsMEdT7FffyestIAOpHPw
	4IaebvvDVym7clV9EOgoW1lOh7rXxTT8
X-Google-Smtp-Source: ADKCNb6UmmGW6B3Q+9AXs5bnkQCM6OQs90i00RbKbpMknUZwV6qmIGkqJiT4d6hEd7Wsk/h8RAFTZXsH35WWZ2wg4IE=
X-Received: by 10.223.130.21 with SMTP id 21mr221107wrb.196.1504646933544;
	Tue, 05 Sep 2017 14:28:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 14:28:32 -0700 (PDT)
In-Reply-To: <cfc75c71-1558-3405-8e5c-188cdb329bfe@amsat.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-2-git-send-email-peter.maydell@linaro.org>
	<cfc75c71-1558-3405-8e5c-188cdb329bfe@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 22:28:32 +0100
Message-ID: <CAFEAcA_OcZ6SzGioQcscv2YQZ1t_xGB3fg7iJrJKui3gwwoKQA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH 01/20] target/arm: Implement ARMv8M's PMSAv8
 registers
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9m65gyLqAVGd

On 5 September 2017 at 20:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Hi Peter,
>
>
> On 08/22/2017 12:08 PM, Peter Maydell wrote:
>>   diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 3193b00..05e2909 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -159,7 +159,8 @@ static bool pmsav7_needed(void *opaque)
>>       CPUARMState *env =3D &cpu->env;
>>         return arm_feature(env, ARM_FEATURE_PMSA) &&
>> -           arm_feature(env, ARM_FEATURE_V7);
>> +           arm_feature(env, ARM_FEATURE_V7) &&
>> +           !arm_feature(env, ARM_FEATURE_V8);
>>   }
>>     static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_i=
d)
>> @@ -209,6 +210,31 @@ static const VMStateDescription vmstate_pmsav7_rnr =
=3D
>> {
>>       }
>>   };
>>   +static bool pmsav8_needed(void *opaque)
>> +{
>> +    ARMCPU *cpu =3D opaque;
>> +    CPUARMState *env =3D &cpu->env;
>> +
>> +    return arm_feature(env, ARM_FEATURE_PMSA) &&
>> +        arm_feature(env, ARM_FEATURE_V8);
>> +}
>> +
>> +static const VMStateDescription vmstate_pmsav8 =3D {
>> +    .name =3D "cpu/pmsav8",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .needed =3D pmsav8_needed,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar, ARMCPU, pmsav7_dregion, =
0,
>> +                              vmstate_info_uint32, uint32_t),
>> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, =
0,
>> +                              vmstate_info_uint32, uint32_t),
>> +        VMSTATE_UINT32(env.pmsav8.mair0, ARMCPU),
>> +        VMSTATE_UINT32(env.pmsav8.mair1, ARMCPU),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
>>                       VMStateField *field)
>>   {
>>
>
> maybe you plan to add migration between version 22 and 23 in a later patc=
h,
> else
>
> ...
> const VMStateDescription vmstate_arm_cpu =3D {
>     ...
>     .subsections =3D (const VMStateDescription*[]) {
>         ...
>         &vmstate_pmsav8,
>
> do not forget this ^

Whoops, yes, I forgot that bit. I'm surprised the compiler
didn't complain about the unused variables...

There's no need to worry about migration compat in any
of these v8M-specific vmstate structs, because right now
there are no QEMU CPUs with v8M enabled and so the
vmstate struct can't be used. That means we can freely
add fields to them in later patches without having to
bump version numbers or otherwise keep compatibility.
Once the patch which adds a cortex-m33 CPU lands in
master the rules will change and we'll need to be more
careful.


thanks
-- PMM
