Received: by 10.28.91.67 with SMTP id p64csp3897673wmb;
        Tue, 6 Mar 2018 08:04:23 -0800 (PST)
X-Google-Smtp-Source: AG47ELuwwFXrj1wnMcNPeKk2pc+gxapHMh3RBzYWH5X9Q9y8t+TnYsmuX8P1b1rfPMQN36o8JgJo
X-Received: by 2002:a25:ef48:: with SMTP id w8-v6mr11634448ybm.323.1520352263140;
        Tue, 06 Mar 2018 08:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520352263; cv=none;
        d=google.com; s=arc-20160816;
        b=QqSU0csriGX4TfmGx7YG0CLbO84fyOInIjxMiHrEAd22ytQSBDGUWMsv+UQ2RRjaJP
         ImS1azpHCCAsW0rHNRIUSVIVVOiy7vPljBC3IRLpG71bPzUxpxNI/6Yo4wj9J7qixAkC
         xH4qeV/3a7eSLm9jjZci8mMoiXPWEzJDi+VHKoYqePpvwtXxj0O3v/qRbsuLH9UcCZ63
         L6bNPB7hCBg7jKazJBFMi9iU2WeHhTicc+S/Q2JvoisCIfRKWRZrvBfIP7HA0NF/CksE
         mehXBx2YJ7hqF+uC2MuXehMoy7iWnJHW7PunlBDWR47ldxbfErenoovUk/MhQwZ0wl66
         OwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pqO/bhBDZ0zgsL80H1hc3H6Id1Q4BYr3sjLX+aZ2Q24=;
        b=GRY4E1EmpizHZ+hRxgl+CDqD3QLxqzsaJcY/fJc//WEeW2kI0SfhCS/U1WD3XA23Lx
         odtVmyCZ5k0iKxwZoiV0TC+r1LFEWvzAQb1TjtOlMWW32EeI5tChU0ZqPj0MWdTYzZ5z
         GNdOeJxXOGU3e95JkvmpotlKlTAoXejmaYPHXOsUTcu6chnrQL7iVXDlzieXsk5IKwdk
         2ckqeibmbvU7J2X+AeeHBiLktubKgdzEK/XvZntEFCwMDSH5b7b297o4BaWzhbvc9VoU
         RlHygMNOwHtNruFjwnk9uKOjOOkGU3w/1fdUUWuYNTqc1GbQnkxEHn8qHwmnHvjAX3/m
         ag5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRdm5fP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v136-v6si2659058ybe.213.2018.03.06.08.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 08:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XRdm5fP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etF4g-0000Io-Iz
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 11:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etF4Q-0000Gf-Gk
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 11:04:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etF4M-0001JA-HD
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 11:04:06 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36553)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etF4M-0001Io-BI
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 11:04:02 -0500
Received: by mail-ot0-x243.google.com with SMTP id 108so18781889otv.3
	for <qemu-arm@nongnu.org>; Tue, 06 Mar 2018 08:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pqO/bhBDZ0zgsL80H1hc3H6Id1Q4BYr3sjLX+aZ2Q24=;
	b=XRdm5fP0dfNaEpP5K7ymLZtCYiu8SuZV7W4JytTKUnunWIClUyj5DLl6v2TpfTwBut
	HpL/hj7QCJu2gCHA08nTNtSnO2PpmC4SUNCotrVC7h+FzjjJSe3RFqd/hBO/ezUVwH6F
	tKhSskTw09uxoJZ0rfSpr0nC4gzupM6xtsmQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pqO/bhBDZ0zgsL80H1hc3H6Id1Q4BYr3sjLX+aZ2Q24=;
	b=VZK+AAv3byaHCLY1MsRDBrYay98uDKtqnqkp0Fd+zWACbT384SN5Z4XSUMvMpZsM23
	sC/NiVyqxx19z+X6Olf0MxTCLMjYXo/9v8HGpZQvyQwHXHJ/Nvvy/vGtlzFTKGMsXmLG
	+ndt5mZdx1XCP5xfEXwnDAeb4n/J2iE++kkcJeDZN9SWcTcZIOItFgYmYEzRcD1n9323
	oIBi4F8z9CIdjsYuDKBqFG10/dn9kB0ehDjLWcqKAjIBustcAThEni7IpjbAlLmO1To8
	MzAWzz+/pMgWqDKXsLAwj+yuQ9bTMX96S7/xyBw3Ro36xtTonrt+GxkpYT2tMX72uR68
	tWag==
X-Gm-Message-State: AElRT7GMAewziqgAseTvPXJw2wgZMyYDHH462Xf+SnKbw2ENyx0yGP9R
	IXuwLe8OVhAIU8bkvvFDzzanFW/MbwqEM3oBofNDLw==
X-Received: by 10.157.46.143 with SMTP id w15mr12745047ota.205.1520352241381; 
	Tue, 06 Mar 2018 08:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 08:03:40 -0800 (PST)
In-Reply-To: <20180306161617.07459ef6@redhat.com>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
	<20180306125526.27838-5-peter.maydell@linaro.org>
	<20180306161617.07459ef6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 16:03:40 +0000
Message-ID: <CAFEAcA8bHYcCkwVLCqp7YTBSF5kH96i343CfY1-wEAB=0Ka4vw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] target/arm: Make 'any'
 CPU just an alias for 'max'
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
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9WY/Whhe195y

On 6 March 2018 at 15:16, Igor Mammedov <imammedo@redhat.com> wrote:
> On Tue,  6 Mar 2018 12:55:24 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
>> Now we have a working '-cpu max', the linux-user-only
>> 'any' CPU is pretty much the same thing, so implement it
>> that way.
>>
>> For the moment we don't add any of the extra feature bits
>> to the system-emulation "max", because we don't set the
>> ID register bits we would need to to advertise those
>> features as present.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/cpu.c   | 50 +++++++++++++++++++++++----------------------
>>  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------------
>>  2 files changed, 54 insertions(+), 55 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index e46ddcc613..c8d3da2140 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -965,9 +965,17 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
>>      ObjectClass *oc;
>>      char *typename;
>>      char **cpuname;
>> +    const char *cpunamestr;
>>
>>      cpuname = g_strsplit(cpu_model, ",", 1);
>> -    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpuname[0]);
>> +    cpunamestr = cpuname[0];
>> +#ifdef CONFIG_USER_ONLY
>> +    /* For backwards compatibility usermode emulation allows "-cpu any",
>> +     * which has the same semantics as "-cpu max".
>> +     */
>> +    cpunamestr = "max";
> shouldn't it be
>  if (!strcmp(cpuname[0], "any")) {
>      cpunamestr = "max";
>  }

Yes. I shuffled the code around a bit and managed to lose the
comparison...


>> @@ -1789,7 +1791,7 @@ static const ARMCPUInfo arm_cpus[] = {
>>      { .name = "max",         .initfn = arm_max_initfn },
>>  #endif
>>  #ifdef CONFIG_USER_ONLY
>> -    { .name = "any",         .initfn = arm_any_initfn },
>> +    { .name = "any",         .initfn = arm_max_initfn },
> Note,
>  'any' will disappear from "-cpu help"
> but that's probably fine, old users would still be able to use alias
> and new ones won't even suspect about its existence and use 'max'.

Yeah, I guess that's OK.

thanks
-- PMM
