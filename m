Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp486917wrp;
        Tue, 3 Sep 2019 06:56:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOqQXlmcNwIKgZUa1a+u9MMMMidQSDZVt9dMZw1tjxcBQKhIiPXWsCEVTh9F1/C5oUqtlT
X-Received: by 2002:a17:906:b6cb:: with SMTP id ec11mr29424123ejb.27.1567519004852;
        Tue, 03 Sep 2019 06:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567519004; cv=none;
        d=google.com; s=arc-20160816;
        b=MvGh5OGacNohkpvMb/kxxrTwHhfrMHTwuqZ+yM2Uo1NZE41HlT8JKoGUVTMlZylSQk
         x+L3zHLrwbaYZ/PaW/BcKtZYBWQ1xHLNSDvnoVJ2k4lI5Puysns9VCLjrvqkz7B6LPSz
         SFxUZ3RUvyW8SpWPvD/ZbX/FHwSsnMq01EBrQ8U1oxYOvwFygfSN6zUlY47QWii9DKhd
         fQNRyThcMWVNlz0dNrrdQKtXvugX0bqAQpAkp4pv4IViweMW5r8awmLXgwbEuDQ7iwf4
         07/S+N+7cQ1BHT0+FuSQqa85rCIs0+/MvqJXa1cyJm9maANbRpkgL9p09sSr5V++Mc3t
         09XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=m7A3D1o43l4wfGLTAv+XlpdSLX42FjXYKMcJkNkEOdc=;
        b=ReD7NzzoluEvNk24/iftMhr/Sn40a8//+TXE2F+tNObr4kbcD8EMnHMiecTF/sbNLN
         J+CQmM2ArG6dA0IdLTPI7RY+AjerSE1nDWYw5IrcllAJGeO0qU9/7kJzXb/9YLtPyElS
         ESte6nX1VZ9CSAxKT/0FTRPK+foyeLHEbrYEH0eOkAS7Z8IN9VXsLWqYqT7/9bKV+uyI
         /KuAx39rng1JY8spVO6MixC8FjRRe+HkQhN+WgkdI5CcTA3AWBl3BTt5DFjXrb5gyv97
         tZHHFa7O6/8FqpEo6yXTTTKBJbBKYt6rd2J5rMVRDaGENsavxJz5vl+gCW5EEeMXXZGI
         /0vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o56si11042534edc.349.2019.09.03.06.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 06:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i59IZ-0002Gj-3T
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 09:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i5906-0003m7-MJ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 09:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i5905-0007MV-EB
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 09:37:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46118)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i5905-0007M8-6s
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 09:37:37 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 485B02A09CE
 for <qemu-arm@nongnu.org>; Tue,  3 Sep 2019 13:37:36 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id m6so3122898wmf.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 06:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfP94qPAkTZ+gSxr/ofdQYrTK1iKl3TWo1iVnl2DcE8=;
 b=oC95h62dq4Ng1u9NvML38RG6jGFMPx5kSwgNa8jer/EsxcqhNZgooScnb9qSAMH6ug
 sz1ImoungU+xSs1IEV8RjPoRMSNAdjjusf2S4dtCrwUhLTwDazNixxSG8deQLLYn6sNJ
 VRuOGP44Bq78Zu/teIM+pRGPxv9i35B+4Xaz3C5iq2o96wC7to2D2pf9koRT5ysefaTt
 33vtYVUvHrVN8SkRwiEHL+iTTgA67NSfFyeLYJshx/7ku2UBcR7vJ9vEoGqMjz+lv8+S
 hdU8RTrCfqW8MP6keo9YQoFzTZe8esCszRn/1chT1IlEkU3MKJQGFPJ0a4TI34dRAvdw
 EPPA==
X-Gm-Message-State: APjAAAVXNTch8BWaGbbUP6P7Bnt1TZjo8osWTMjTHnxJ9JYwCGtX15m6
 ENgCh3j/qhszD5Bh8YsRQ949PIg1P0Wp9aiP0YDse0Odto/aej1UF9Tr/puAGVFMtKwGXnr5+d1
 Q6HTS527SKZzR
X-Received: by 2002:a05:600c:2047:: with SMTP id p7mr58676wmg.13.1567517854726; 
 Tue, 03 Sep 2019 06:37:34 -0700 (PDT)
X-Received: by 2002:a05:600c:2047:: with SMTP id p7mr58653wmg.13.1567517854471; 
 Tue, 03 Sep 2019 06:37:34 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id w13sm40406932wre.44.2019.09.03.06.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2019 06:37:33 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190903114729.3400-1-philmd@redhat.com>
 <20190903114729.3400-3-philmd@redhat.com>
 <a035e876-6f38-b80f-9a8f-1f88472fc7d7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3684dbbe-3aaf-6206-3943-fd883f8f7c2a@redhat.com>
Date: Tue, 3 Sep 2019 15:37:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a035e876-6f38-b80f-9a8f-1f88472fc7d7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/5] target/arm: Restrict pre-ARMv7 cpus
 to TCG
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 532Q75QdZxkB

On 9/3/19 2:10 PM, Thomas Huth wrote:
> On 03/09/2019 13.47, Philippe Mathieu-Daud=C3=A9 wrote:
>> KVM requires a cpu based on (at least) the ARMv7 architecture.
>>
>> The following CPUs are disabled:
>>
>> * ARMv4
>>
>>   - StrongARM (SA1100/1110)
>>   - OMAP1510 (TI925T)
>>
>> * ARMv5
>>
>>   - ARM926
>>   - ARM946
>>   - ARM1026
>>   - XScale (PXA250/255/260/261/262/270)
>>
>> * ARMv6
>>
>>   - ARM1136
>>   - ARM1176
>>   - ARM11MPCore
>>   - Cortex-M0
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> v2: fixed misplaced #endif (rth), list cpus
>> ---
>>  target/arm/cpu.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 2399c14471..f69780147c 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1678,6 +1678,8 @@ static ObjectClass *arm_cpu_class_by_name(const =
char *cpu_model)
>>  /* CPU models. These are not needed for the AArch64 linux-user build.=
 */
>>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>> =20
>> +#ifdef CONFIG_TCG
>> +
>>  static void arm926_initfn(Object *obj)
>>  {
>>      ARMCPU *cpu =3D ARM_CPU(obj);
>> @@ -1900,6 +1902,8 @@ static void cortex_m0_initfn(Object *obj)
>>      cpu->midr =3D 0x410cc200;
>>  }
>> =20
>> +#endif
>> +
>>  static void cortex_m3_initfn(Object *obj)
>>  {
>>      ARMCPU *cpu =3D ARM_CPU(obj);
>> @@ -2283,6 +2287,8 @@ static void cortex_a15_initfn(Object *obj)
>>      define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
>>  }
>> =20
>> +#ifdef CONFIG_TCG
>> +
>>  static void ti925t_initfn(Object *obj)
>>  {
>>      ARMCPU *cpu =3D ARM_CPU(obj);
>> @@ -2451,6 +2457,8 @@ static void pxa270c5_initfn(Object *obj)
>>      cpu->reset_sctlr =3D 0x00000078;
>>  }
>> =20
>> +#endif
>> +
>>  #ifndef TARGET_AARCH64
>>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with th=
is host);
>>   * otherwise, a CPU with as many features enabled as our emulation su=
pports.
>> @@ -2523,6 +2531,7 @@ struct ARMCPUInfo {
>> =20
>>  static const ARMCPUInfo arm_cpus[] =3D {
>>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>> +#ifdef CONFIG_TCG
>>      { .name =3D "arm926",      .initfn =3D arm926_initfn },
>>      { .name =3D "arm946",      .initfn =3D arm946_initfn },
>>      { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
>> @@ -2536,6 +2545,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>>      { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
>>      { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
>>                               .class_init =3D arm_v7m_class_init },
>> +#endif
>>      { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
>>                               .class_init =3D arm_v7m_class_init },
>>      { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
>> @@ -2548,6 +2558,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>>      { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
>>      { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
>>      { .name =3D "cortex-a15",  .initfn =3D cortex_a15_initfn },
>> +#ifdef CONFIG_TCG
>>      { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
>>      { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
>>      { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
>> @@ -2564,6 +2575,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>>      { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
>>      { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
>>      { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
>> +#endif
>>  #ifndef TARGET_AARCH64
>>      { .name =3D "max",         .initfn =3D arm_max_initfn },
>>  #endif
>>
>=20
> All that #ifdeffery is a little bit ugly. I wonder whether we could
> solve this by moving the CPU registrations to separate files which then
> only get compiled if the corresponding CONFIG_ARM_Vx switch is set.

I tried splitting arm_cpus[] and move the ifdef in
arm_cpu_register_types(), but the resulting diff is much bigger and it
only reduces from 4 '#ifdef CONFIG_TCG' to 2...

I'll see what thinks Peter first.

> That reminds me of a patch series of mine where I tried to make the cod=
e
> compilable without CONFIG_ARM_V7M ... unfortunately, I never found
> enough spare time to finish and publish it... I'll have a try to see
> whether I can rebase it and send it as an RFC or so.

Well, this is the same goal of this series... So regarding on Peter's
comments I might wait on your work.

Regards,

Phil.
