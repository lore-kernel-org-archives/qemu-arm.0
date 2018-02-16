Received: by 10.28.71.27 with SMTP id u27csp330922wma;
        Thu, 15 Feb 2018 23:08:37 -0800 (PST)
X-Google-Smtp-Source: AH8x224XslXRf0+QHYJMyY6CUMAA2dSA6pKqWWggHRJ42OSocl+IMw5RePRKxBfxrLo1szue6t6h
X-Received: by 10.37.113.215 with SMTP id m206mr3924638ybc.307.1518764917234;
        Thu, 15 Feb 2018 23:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518764917; cv=none;
        d=google.com; s=arc-20160816;
        b=nkeuubxpxAY9WZk8NrafRCuhfa6YHBGL7CnCIVDdF0ZvedNBYn/RSTHnqQ4Kerkovk
         dmAHCDkAlh6MFKXFAuxAePAOYr6EykZQ8iyHA/kt6Y7hKnyTg5KiO3TdMpe8XyZGW5pX
         jqBPF14KoTD2aqPBJwUgzohOJnN2/k0o9Quq4JDStgKCuxEZxmk+IFHGRp98sOHP74/9
         qzxyVogtTZqmON5qH6urbObkpWSqbNYU+HokNpM0e8ymHvVC2BQlEYcvYw7UJvkVwJyk
         /XDQPc/Facmm68fMaJnl2xJfqGAJ66NGuxsHNzy0XWUdJmt4AzI4YsVk9doOQtv7LCFm
         0FWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Mzq9wjzFPHHi8esREP6KCWD9hJFrcdOTAUJKwffNor8=;
        b=n+76YfGElFMVlFnAB7ID9HMbKgBYDARbvpHJByGw+N6NfJ3U0+4fh1YzmOwR8r+lnc
         g00ILU2CSWz6GSbqxr4D7CCDH8dumYtOexNjwbdE7DwOF38OAmLhnSgux57uwpKG5TWJ
         GGIPStJeUTO4jaWcfQPe8iWWSq9alF/gXpiBlSrQ6LrojBHxZQgKX7QLA+MJa4kLiGHj
         7yoQgAdwV88NPto9i5HBTtTWBjV9VIRt8/x0GFNvTWpXHMg0DRVWs4dMU0K7f2Iy3q8B
         rsnne0PdA9jal4B3MO9CPJ/0eTOsoawz1+O+6t/GaFr+Ym9TwdJxE2wSUBLFMTxUOSvu
         l6VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OCDJCZw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s15si200032ybi.391.2018.02.15.23.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 23:08:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=OCDJCZw5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ema8K-0007od-O2
	for alex.bennee@linaro.org; Fri, 16 Feb 2018 02:08:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <penberg@iki.fi>) id 1ema8C-0007ne-Fw
	for qemu-arm@nongnu.org; Fri, 16 Feb 2018 02:08:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <penberg@iki.fi>) id 1ema87-0004sM-Fl
	for qemu-arm@nongnu.org; Fri, 16 Feb 2018 02:08:28 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <penberg@iki.fi>)
	id 1ema87-0004sB-Ab; Fri, 16 Feb 2018 02:08:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0085520C8C;
	Fri, 16 Feb 2018 02:08:23 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 16 Feb 2018 02:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Mzq9wj
	zFPHHi8esREP6KCWD9hJFrcdOTAUJKwffNor8=; b=OCDJCZw5gQniBXRAe0L8NS
	b3MlibUkfk6PweR3q63oH1wy/+NJB95fXeOOjHCpcmzmYkczV6Zw5rMR6LoeRjLE
	AhFygTtWj5fLCZtWtFFVD9sUPcPw1vEjDwcjH0uYT6rH52bIBBGK4OyCR+bvrmFn
	5Y3MQtwGg1P9JZrJod+IxEG4qazTPGqOBAgUAZuzUX8+5alfMbdzy8fODpLf0FUZ
	43poGk8TLd8jPF6FHvBuJqgqYQ6ESjvEac8e6AIwJjLCPR80bmtttXBnCwGWD+9q
	dPsesceq8i/GQ8cl9+evL57vhBgYSPacZWU0Z5IBubge7HkkO0ZFLtg9wjA72fEA
	==
X-ME-Sender: <xms:ZoOGWkgln3T5v8-G4ARCmuv9WLCL8W9RlQtiir0SgQsiMrtlUM9z9w>
Received: from [192.168.0.40] (81-175-247-183.bb.dnainternet.fi
	[81.175.247.183])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4611424547;
	Fri, 16 Feb 2018 02:08:22 -0500 (EST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
	<CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
From: Pekka Enberg <penberg@iki.fi>
Message-ID: <860616da-8c52-43d6-ccbe-1010f5419a38@iki.fi>
Date: Fri, 16 Feb 2018 09:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v1 3/3] raspi: Add "raspi3" machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oRPVG8sEoX4Y

Hi,

On 02/15/2018 02:39 PM, Peter Maydell wrote:
> On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
>> This patch adds a "raspi3" machine type, which can now be selected as
>> the machine to run on by users via the "-M" command line option to QEMU.
>>
>> The machine type does *not* ignore memory transaction failures so we
>> likely need to add some dummy devices later when people run something
>> more complicated than what I'm using for testing.
>>
>> Signed-off-by: Pekka Enberg <penberg@iki.fi>
>> ---
>>   hw/arm/raspi.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 66fe10e376..048ff23a51 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -187,3 +187,24 @@ static void raspi2_machine_init(MachineClass *mc)
>>       mc->ignore_memory_transaction_failures = true;
>>   };
>>   DEFINE_MACHINE("raspi2", raspi2_machine_init)
>> +
>> +static void raspi3_init(MachineState *machine)
>> +{
>> +    raspi_init(machine, 3);
>> +}
>> +
>> +static void raspi3_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "Raspberry Pi 3";
>> +    mc->init = raspi3_init;
>> +    mc->block_default_type = IF_SD;
>> +    mc->no_parallel = 1;
>> +    mc->no_floppy = 1;
>> +    mc->no_cdrom = 1;
>> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
>> +    mc->max_cpus = BCM2836_NCPUS;
>> +    mc->min_cpus = BCM2836_NCPUS;
>> +    mc->default_cpus = BCM2836_NCPUS;
>> +    mc->default_ram_size = 1024 * 1024 * 1024;
>> +}
>> +DEFINE_MACHINE("raspi3", raspi3_machine_init)
> 
> Hi. This patch breaks "make check", because it adds the raspi3
> to the arm-softmmu (32-bit guest CPUs only) build, where the
> cortex-a53 CPU doesn't exist:
> 
> e104462:xenial:qemu$ ./build/x86/arm-softmmu/qemu-system-arm -M raspi3
> **
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:372:object_initialize_with_type:
> assertion failed: (type != NULL)
> Aborted (core dumped)
> 
> The usual way we avoid this is that 64-bit only boards are
> in their own source file, which is only compiled if the right
> CONFIG_FOO is set by default-configs/aarch64-softmmu.mak.
> In this case splitting the 64-bit board into its own source
> file would be weird and awkward, so the simple thing is to
> guard the raspi3 bits with #ifdef TARGET_AARCH64.
> 
> (You might think we could define a CONFIG_RASPI3 in
> aarch64-softmmu.mak and #ifdef on it, but for some reason
> we don't expose those CONFIG_* to C code, possibly just because
> we've never needed to in the past...)
> 
> Since this was the only code change needed, I'm just going to make
> it and apply the patchset to target-arm.next, rather than ask
> you to do a respin. (There was also a stray space-at-end-of-line
> in patch 2 which checkpatch grumbles about; I'll fix that up too.)

Oh, it would have helped if I had actually read the whole thread before 
sending out v2. If I understood correctly, you only applied the first 
two patches (sorry about that trailing whitespace!). You therefore can 
just pick patch 3 from the v2 as the first two patches are unchanged.

Regards,

- Pekka
