Received: by 10.28.71.27 with SMTP id u27csp2526658wma;
        Thu, 15 Feb 2018 04:49:57 -0800 (PST)
X-Google-Smtp-Source: AH8x225qzNTAzJ2DsENJL2l/Cv9dmgg9u9mD7NHM1MllAgxCb3kYin/ax+OWpFGwKfGNRpkLSgQ0
X-Received: by 10.129.169.70 with SMTP id g67mr1854006ywh.511.1518698997650;
        Thu, 15 Feb 2018 04:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518698997; cv=none;
        d=google.com; s=arc-20160816;
        b=raXyWnqbMdlqCoTSQPVdrplbAu6vi3ku7m3KREKZNhOqNsF/8aTXpek7AamkuuNsjd
         KdfQ3a9SJXfPtTfeWcAcbvxQc93yCAtTQgCA44RxumMKbGvfBN2cAX/MCcpHyUyX35rT
         NFCbORzwo0Va3HqHngO+0+i7yE01VyzAB0+5g+hxvCAfKYu/4TAymO9VoxQ4260xamZw
         sdoL5xBvw00o2GwffciZNbwkrwqeShZB+jRLr6LlphfZ1GibUj/1qolKZigOlXr9DcDb
         MkJ5XwFB66dUzYoFlFuC6LWdnyxhCg0WeXeS+CleXzmx4ehUFTVPV7meSo9EGIX6mUhN
         epwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=XvamBQzOLml1LR37AEwFl4l4heb19kgczZPcEsrdccI=;
        b=EdxHeXTh4OhGnyxtwtf9Jc9e2IC6evoblV7G7oq1IoORQ7riWKLdOUpbhAvzfP94GE
         OUNazvrviCX2Yw6V6h+HrpCaBCHtr5z71vWbCVWUqoJ0WYbavSahoii+sB4o2AZqBIdO
         rWhbX0R290GvDRQuo/fu/Ud6AAPIkN8soULLSMJspNzMIxBMB+Ok9dJ1Rrktf4Ld24J9
         v1KVIJar+d5Im8CVehg3lI5Yna0Rl9lXwXZ8B5VhoSrkZaN0F9X45GLLQpJ2MPWEkwCJ
         lGBwZvTJRrHfLDfyXnkt7JxcK1g/kOdDXjOFXll2JZmodcgIhFDH/IqKExPoqfGpuunl
         XFuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTFYBpUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si2277968ywd.595.2018.02.15.04.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 04:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTFYBpUp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emIz7-0008S3-3r
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 07:49:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emIyw-0008Ox-9F
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 07:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emIyv-0003U4-9K
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 07:49:46 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emIyp-0003Is-NG; Thu, 15 Feb 2018 07:49:39 -0500
Received: by mail-qk0-x243.google.com with SMTP id c4so28425460qkm.2;
	Thu, 15 Feb 2018 04:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XvamBQzOLml1LR37AEwFl4l4heb19kgczZPcEsrdccI=;
	b=RTFYBpUpLBcV3+sZEvSdxsmsGounmqosKGtDAx2SUMM79fIxX7s3GEgXqUJykpjBLJ
	IiHIQfNxJZlR+AjxVB1FZjPqrBhVcfc2+TpSltumRkITsoWAJAoqRVqfYhEtwlur3tFb
	uTmIDB6Ewi1NRbuFo36zr7qkpkiVX6mjn8Y38JdbGeXeCefjNeROvSZzoC8w0Z/3TF8U
	7GxcsXLqi7d0LC+9PD+Vmiq0WCAiIA5qcu1VfgCFWnn5hkBoSUcgWNJDutt3qZiG933b
	P4fkSMmuPa98ddMPxyqiYY58XOktjkaCDycTTte4cm+gjclsYNSm6bHhPKXS3trsXH8h
	ua/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XvamBQzOLml1LR37AEwFl4l4heb19kgczZPcEsrdccI=;
	b=I6NUg+pE9qBqflUkgCnlLR54Nly88iNZKhBDt9j8fiNITjCKz2YQLKudNwGlThbxCR
	cSUP033u/+7WryF0si+Pk+XuB8CB9yQGWiTtVBkUM+y0uM7qdevY6PWSFXKSHoaVL99O
	e4k1ur+U1d5dfw0cijUQ9c1gezZvGlsTiLyTZdHncoppYg8WSNTiaXmlv0pjHjWLzMTF
	3XZGgNJliWuYHN4ReYMmmDCkRCszF4zTl6RPMGy+MWcKBdjdn5lWN4jJOEbw3YU0oe0X
	7cxFURHZm2HLa8x3+3CLqipw/SHVrLgi78d4006a9jAcXUBhDdIHkY9jxXdrZtwYCpSc
	48OA==
X-Gm-Message-State: APf1xPCwQe3DllJ1e4bSXceFwzUBoxCX2z+JevjCa7dK+4ZtOfqqWo1H
	IjxNKs0+mvEe3DxFfDCVIg0/i3jp
X-Received: by 10.55.105.129 with SMTP id e123mr4025741qkc.192.1518698978825; 
	Thu, 15 Feb 2018 04:49:38 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	x2sm10704060qkc.62.2018.02.15.04.49.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 04:49:37 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, Pekka Enberg <penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
	<CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9c52a265-6659-5c9c-27c7-eced8528fb63@amsat.org>
Date: Thu, 15 Feb 2018 09:49:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
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
X-TUID: y4KS0JYFnBJX

On 02/15/2018 09:39 AM, Peter Maydell wrote:
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
>>  hw/arm/raspi.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index 66fe10e376..048ff23a51 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -187,3 +187,24 @@ static void raspi2_machine_init(MachineClass *mc)
>>      mc->ignore_memory_transaction_failures = true;
>>  };
>>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
> 
> thanks
> -- PMM
> 
