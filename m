Received: by 10.28.71.27 with SMTP id u27csp2514626wma;
        Thu, 15 Feb 2018 04:39:57 -0800 (PST)
X-Google-Smtp-Source: AH8x226+Ksa9TpWskVxcaFGK9vG7F9ABjOTXWYjoslMI6HkwyzmZWLeTuWhirxuner7rOGpvMq8C
X-Received: by 10.129.120.144 with SMTP id t138mr1742314ywc.282.1518698397054;
        Thu, 15 Feb 2018 04:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518698397; cv=none;
        d=google.com; s=arc-20160816;
        b=g1CujyNfWvVMjdFwktyk3C+HaKXo5vwnQFh2oIH42Y3C3QPg2h+mNCsxJYqR1xbwro
         jnWEPiBAPf8rs+g3uUxwO6j5tnEJC0rkzGBqRiPTnP+1R4zsyOipiWeekN6l2y/VMsLe
         U93GZdttJnmu70GR82ihzs9p7ROiWSzRZX300nPbz9hR3Xob3AFEuWq+ZARDV9fxq78o
         hrgImVEBcxyaxok9diM3vupHyYBSTZ8q11azQJ6M+vdmiOD1+HcRAntXfngn8j5EE/yW
         gsbatLKdmuE0BhdH8y3n+RtNMzpeqKgIQMHGtg24+luvF2HgdJ6z9ZFldDdxqHju9Dhi
         xcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x8NIQyFO3aPhvmXgxczi7UalWLLIsnnFsIICvzQh9w0=;
        b=qC1jp3pXWN+0w2IqBhRA54Vacfq8hslf06HnEGOOWNLHeEj9ZUv8Jh2knKNtxy7pkT
         jpLS2x/ZNjdows7o97OoKFodC7UejJoMMvRVtWZWibasYau44DtN4hSScsjJdD5Mv3dU
         ZjdxfCNfEh1q8A16ysMUg9hI49fwh1eOH+c8PUb7OykcXuN3ldbXm+FXFcZ99uXv7rfJ
         E8IlzhfvxME9rR9qK3s12RnH6qMH0lX8L1mhXZ7OTt+hD9FgHiJvYQKrtZOkHVhW0fCr
         V3nn/lO23O6OL73TW3tNrcv4JikrleNG1QPDYLh7wFR8bYzlXDeN8xJj+1S9PM59gCi0
         gqtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoBfKqO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si2683615ybf.472.2018.02.15.04.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 04:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoBfKqO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emIpQ-0002IJ-Ga
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 07:39:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emIpH-0002Ho-2Q
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 07:39:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emIpG-0003Zy-0e
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 07:39:47 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:46555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emIpF-0003ZL-QR
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 07:39:45 -0500
Received: by mail-ot0-x244.google.com with SMTP id w10so9720645ote.13
	for <qemu-arm@nongnu.org>; Thu, 15 Feb 2018 04:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8NIQyFO3aPhvmXgxczi7UalWLLIsnnFsIICvzQh9w0=;
	b=QoBfKqO+KW8NkIoadPMdt/rKiB4qBwEOE4B9399d/b5aSpIlHIlwLa4hYh0024iQXp
	JIfgrlKUbnWngYfs4rSQQHGLUFMT34/foHKKYTYmEoRDhkp8oCvRqpycxez4wBpRtLDi
	AEY9WOZ61chb2pRaHySUg9blqcS9eNX1iCHhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8NIQyFO3aPhvmXgxczi7UalWLLIsnnFsIICvzQh9w0=;
	b=GDROyCGsISJu9AW5IzJFCKWwNb24EL2jVh2yVAZimv5P8215AKV8AqhF9MajZdKpg4
	IBy7JCFZK4XHBt0Js6LzqRVzlaZ/OpEqB534pbFXjCFV16AZdxMvGqjCXDjXg+Rz8Jg2
	RNh8Mjlpr9iqY68PxtPrA+1ycraaifRI45Gpfr2hwD45CRD62SIoGrPQS12T2TFFHXuf
	2PLdoWWnKx4guorZNNX4ZPQEiFIYThKS/U3CsB16kzwdvc32mWBfw/fp2C2CJme2Xnl6
	JTVaWk88g0/LgQgadsvONo0zJSzsgqfDA2L3PLBSXxOOAZSO6cdSPVVMqJXxsLmsTMKW
	RrRw==
X-Gm-Message-State: APf1xPD5E0gkPRqjUBxb/fa+f7iQTZFJs22kIskIfi8Uu8Yc+7WtChvz
	5vrcGWNlYNpcDsc0qrbaTwApOI3tIHxqBeiB80ljFA==
X-Received: by 10.157.68.215 with SMTP id p23mr1601130otg.91.1518698384915;
	Thu, 15 Feb 2018 04:39:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 04:39:24 -0800 (PST)
In-Reply-To: <20180208055039.24666-4-penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
	<20180208055039.24666-4-penberg@iki.fi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 12:39:24 +0000
Message-ID: <CAFEAcA_008TiXr0RYmPuhPcmSY9qx=Ju8CMAu_t-z+DBRruykA@mail.gmail.com>
To: Pekka Enberg <penberg@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
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
X-TUID: OaZHt0GRVXvD

On 8 February 2018 at 05:50, Pekka Enberg <penberg@iki.fi> wrote:
> This patch adds a "raspi3" machine type, which can now be selected as
> the machine to run on by users via the "-M" command line option to QEMU.
>
> The machine type does *not* ignore memory transaction failures so we
> likely need to add some dummy devices later when people run something
> more complicated than what I'm using for testing.
>
> Signed-off-by: Pekka Enberg <penberg@iki.fi>
> ---
>  hw/arm/raspi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66fe10e376..048ff23a51 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -187,3 +187,24 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->ignore_memory_transaction_failures = true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> +
> +static void raspi3_init(MachineState *machine)
> +{
> +    raspi_init(machine, 3);
> +}
> +
> +static void raspi3_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Raspberry Pi 3";
> +    mc->init = raspi3_init;
> +    mc->block_default_type = IF_SD;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
> +    mc->max_cpus = BCM2836_NCPUS;
> +    mc->min_cpus = BCM2836_NCPUS;
> +    mc->default_cpus = BCM2836_NCPUS;
> +    mc->default_ram_size = 1024 * 1024 * 1024;
> +}
> +DEFINE_MACHINE("raspi3", raspi3_machine_init)

Hi. This patch breaks "make check", because it adds the raspi3
to the arm-softmmu (32-bit guest CPUs only) build, where the
cortex-a53 CPU doesn't exist:

e104462:xenial:qemu$ ./build/x86/arm-softmmu/qemu-system-arm -M raspi3
**
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/qom/object.c:372:object_initialize_with_type:
assertion failed: (type != NULL)
Aborted (core dumped)

The usual way we avoid this is that 64-bit only boards are
in their own source file, which is only compiled if the right
CONFIG_FOO is set by default-configs/aarch64-softmmu.mak.
In this case splitting the 64-bit board into its own source
file would be weird and awkward, so the simple thing is to
guard the raspi3 bits with #ifdef TARGET_AARCH64.

(You might think we could define a CONFIG_RASPI3 in
aarch64-softmmu.mak and #ifdef on it, but for some reason
we don't expose those CONFIG_* to C code, possibly just because
we've never needed to in the past...)

Since this was the only code change needed, I'm just going to make
it and apply the patchset to target-arm.next, rather than ask
you to do a respin. (There was also a stray space-at-end-of-line
in patch 2 which checkpatch grumbles about; I'll fix that up too.)

thanks
-- PMM
