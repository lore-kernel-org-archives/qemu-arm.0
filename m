Received: by 10.223.172.38 with SMTP id v35csp1400151wrc;
        Thu, 14 Sep 2017 15:10:19 -0700 (PDT)
X-Received: by 10.55.160.140 with SMTP id j134mr4723982qke.274.1505427019779;
        Thu, 14 Sep 2017 15:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505427019; cv=none;
        d=google.com; s=arc-20160816;
        b=y6e4l0eS20kqwjPlsPcF5A46ewHN2baOi8JUbL54W0G23thshB+j87O0b+dMdeosFm
         Zv9Wexzo9UMmfJN3SSym5mNbjt+xk7SBnnvmS+tFnmJpzI6fYoY4/mMC5NwWnbsL6lH6
         wvQlUJRIacS0nqIPEPXZXNQfznPSeLemMSx8MvzA03HAueBPe6fPqPfBFe8PM3q1UnT6
         nsPhmWx+i6SYJoVRXGcCAkkXYCigXF5aY5h4jPrR4sVze0g1RTelYWHuhg6JlcsQ2r5B
         jESYRxImVmJmp9vVc2mzh7scVNnaK25/ImpZVZKuKvAEmlyJBZwqyw61cRx+xdsBA2F4
         JMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=I/4hKiIBHvIEdYybD6jEAJYcaX6mhyxBLkLPImoclzA=;
        b=YmRH8t609q6iMV7eau8EUTF4/bpHRJqMKQMml28qFtiNXjVq5y8msaqQmt/c8P6u36
         Den6bVkVQVMYJ6RCXPo+HwYg0j9w3/IrmQ//CY69KwdjZdRrzRdoIWFC4tYA5lQbfIVj
         aOSqBVKO9yqUqLLXltfE7kyK685uhs3kSYmI70gU8AnpYDovdoogtJ6sQEYqJ+IdRFTd
         7pMUVASCR11kpTRKdSKTgv+oXG9W/xLH1Lxt4Vhw5gmtcoN9lxk+x4aYy1VCCEBHUEa5
         eJ6hotDvtS0LCPcrrVGaN0YP6KayOxTnWtyRnokn4DfMeX70S3jBTtO51XLGX+kQGarB
         Dh/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V7gG3rsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si13528731qtj.30.2017.09.14.15.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 15:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V7gG3rsN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dscKv-0003n9-HZ
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 18:10:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dscKo-0003kS-Up
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 18:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dscKn-0003h6-OK
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 18:10:10 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:35706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dscKn-0003fD-E2; Thu, 14 Sep 2017 18:10:09 -0400
Received: by mail-wr0-x241.google.com with SMTP id n64so333204wrb.2;
	Thu, 14 Sep 2017 15:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=I/4hKiIBHvIEdYybD6jEAJYcaX6mhyxBLkLPImoclzA=;
	b=V7gG3rsNSOqIY2xFgGHN5GuL2Hhjwg2Fenvf+IQYKoWQ5sdKFjJgH4t0L2kOfwfDii
	8WoSQZxOQn8rhmn6X5z9+EgyQUE54oM0W0bAfYdaXnuTzL0gUzNFFyuP6Ki5DoZjibQK
	3wIxUlmlQRdXCFvf65C9iZHeHmQaEHZWT2ReMWroHZuz6CD7cAWFm2n434Ecn4eGobIT
	B/5LJTi9aRQ10YSKUQMgR6ijfO0wju9XbTD7XKz4iJRlqCbJU0/ot8g2G399L/2AUoKh
	WM5PTF8wWFcdcEiWYeOD18NOY7P7FUUE44Trl5d5xl+fxUwWzwIIRUCvx0RUiyBgr8UL
	DyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=I/4hKiIBHvIEdYybD6jEAJYcaX6mhyxBLkLPImoclzA=;
	b=VQG6z75xfJNf1S6zhLjcDI/1m4ZV0xCEmS4///Cdm9aK6rfmuiAYpBMk0xgbj5KvWB
	//psqqjfWrKwNltmwcDaws+Vf1NjipFb/T66IoMgRPI8fxrMKjJl6Swe0oCoLqO1H0As
	yJz6ZOSJbxO+K2iuxv6WX28ab7jTj7fQROU7lrpNsKJctrev7RVt57b9+QVNR14E+Xlh
	A/KcBLaKsRCh5UC2GPipydw3Ri2iZ5Wf5IljQTLprRncxToWCGPgahgZx0v+RwMIie0G
	j2/zT2vcPMVwFKmjsiwNZJwTIsJvJt5oHLUY/T4m2lD0zuogY7e++i5g0S56+2faOQNO
	uE5Q==
X-Gm-Message-State: AHPjjUhOXTuzZNGENjtaW4pQ6W4JYAaLxRaZBvf+hqapOIejnEyZ1ZRZ
	O+5FRdgkkUpSypObuHprCRMV+CYimRdUUGnEksU=
X-Google-Smtp-Source: ADKCNb659NuhMQhpJ5fl5jkZmo7REbfrqjEcSnfsJOgyqUZyD5bNj/4amB+eoK3Ot0TvRET5OkoNzcIE14sbfxsIfe0=
X-Received: by 10.223.187.74 with SMTP id x10mr18649074wrg.66.1505427008359;
	Thu, 14 Sep 2017 15:10:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 14 Sep 2017 15:09:37 -0700 (PDT)
In-Reply-To: <20170914095011.2fba8aab@nial.brq.redhat.com>
References: <1505318697-77161-1-git-send-email-imammedo@redhat.com>
	<1505318697-77161-6-git-send-email-imammedo@redhat.com>
	<af093dab-efb0-7fb7-b373-e9a547ca6da7@amsat.org>
	<20170914095011.2fba8aab@nial.brq.redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 14 Sep 2017 15:09:37 -0700
Message-ID: <CAKmqyKNENp+E+VFS8-GHL=WdgSwKQHh1xVDYDJ-D+_2mUi-cFw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/5] arm: drop intermediate
 cpu_model -> cpu type parsing and use cpu type directly
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2+8bqilTVNFE

On Thu, Sep 14, 2017 at 12:50 AM, Igor Mammedov <imammedo@redhat.com> wrote=
:
> On Thu, 14 Sep 2017 00:47:20 -0300
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>
>> Hi Igor,
>>
>> awesome clean refactor!
> Thanks,
>
> there is more patches on this topic for other targets to post
> but it's waiting on 1-3/5 to land in master so it would be
> easier for maintainers to verify/test them without fishing out
> dependencies from mail list.
>
> hopefully everything will land in 2.11 so we won't have to deal
> with cpu_model anywhere except of one place vl.c.
>
>> just 1 comment inlined.
>>
>> On 09/13/2017 01:04 PM, Igor Mammedov wrote:
>> > there are 2 use cases to deal with:
>> >    1: fixed CPU models per board/soc
>> >    2: boards with user configurable cpu_model and fallback to
>> >       default cpu_model if user hasn't specified one explicitly
>> >
>> > For the 1st
>> >    drop intermediate cpu_model parsing and use const cpu type
>> >    directly, which replaces:
>> >       typename =3D object_class_get_name(
>> >             cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
>> >       object_new(typename)
>> >    with
>> >       object_new(FOO_CPU_TYPE_NAME)
>> >    or
>> >       cpu_generic_init(BASE_CPU_TYPE, "my cpu model")
>> >    with
>> >       cpu_create(FOO_CPU_TYPE_NAME)
>> >
>> > as result 1st use case doesn't have to invoke not necessary
>> > translation and not needed code is removed.
>> >
>> > For the 2nd
>> >   1: set default cpu type with MachineClass::default_cpu_type and
>> >   2: use generic cpu_model parsing that done before machine_init()
>> >      is run and:
>> >      2.1: drop custom cpu_model parsing where pattern is:
>> >         typename =3D object_class_get_name(
>> >             cpu_class_by_name(TYPE_ARM_CPU, cpu_model))
>> >         [parse_features(typename, cpu_model, &err) ]
>> >
>> >      2.2: or replace cpu_generic_init() which does what
>> >           2.1 does + create_cpu(typename) with just
>> >           create_cpu(machine->cpu_type)
>> > as result cpu_name -> cpu_type translation is done using
>> > generic machine code one including parsing optional features
>> > if supported/present (removes a bunch of duplicated cpu_model
>> > parsing code) and default cpu type is defined in an uniform way
>> > within machine_class_init callbacks instead of adhoc places
>> > in boadr's machine_init code.
>> >
>> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> > ---
>> > v2:
>> >   - fix merge conflicts with ignore_memory_transaction_failures
>> >   - fix couple merge conflicts where SoC type string where replaced by=
 type macro
>> >   - keep plain prefix string in: strncmp(cpu_type, "pxa27", 5)
>> >   - s/"%s" ARM_CPU_TYPE_SUFFIX/ARM_CPU_TYPE_NAME("%s")/
>> > ---
> [...]
>
>> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> > index fe96557..fe26e99 100644
>> > --- a/hw/arm/virt.c
>> > +++ b/hw/arm/virt.c
>> > @@ -163,13 +163,13 @@ static const int a15irqmap[] =3D {
>> >   };
>> >
>> >   static const char *valid_cpus[] =3D {
>> > -    "cortex-a15",
>> > -    "cortex-a53",
>> > -    "cortex-a57",
>> > -    "host",
>> > +    ARM_CPU_TYPE_NAME("cortex-a15"),
>> > +    ARM_CPU_TYPE_NAME("cortex-a53"),
>> > +    ARM_CPU_TYPE_NAME("cortex-a57"),
>> > +    ARM_CPU_TYPE_NAME("host"),
>> >   };
>> >
>> > -static bool cpuname_valid(const char *cpu)
>> > +static bool cpu_type_valid(const char *cpu)
>> >   {
>> >       int i;
>>
>> I'd just change this by:
>>
>> static bool cpuname_valid(const char *cpu)
>> {
>>      static const char *valid_cpus[] =3D {
>>          ARM_CPU_TYPE_NAME("cortex-a15"),
>>          ARM_CPU_TYPE_NAME("cortex-a53"),
>>          ARM_CPU_TYPE_NAME("cortex-a57"),
>>      };
>>      int i;
>>
>>      for (i =3D 0; i < ARRAY_SIZE(valid_cpus); i++) {
>>          if (strcmp(cpu, valid_cpus[i]) =3D=3D 0) {
>>              return true;
>>          }
>>      }
>
>>      return kvm_enabled() && !strcmp(cpu, ARM_CPU_TYPE_NAME("host");
> here is one more case to consider for valid_cpus refactoring,
> CCing Alistair.

Thanks, I have a few comments I need to look at for this. I'm going to
hold off until this series lands though.

Thanks,
Alistair

>
>> }
>>
>> Anyway this can be a later patch.
> this check might be removed or superseded by generic valid_cpus work
> that Alistair is working on, anyways it should be part of that work
> as change is not directly related to this series.
>
>
> [...]
