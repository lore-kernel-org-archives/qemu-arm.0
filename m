Received: by 10.25.0.147 with SMTP id 141csp81332lfa;
        Mon, 20 Feb 2017 08:24:06 -0800 (PST)
X-Received: by 10.237.37.90 with SMTP id w26mr20737386qtc.112.1487607846011;
        Mon, 20 Feb 2017 08:24:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t56si1652446qta.24.2017.02.20.08.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 08:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfqkv-00073E-8L
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 11:24:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqk2-00070Y-TA
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 11:23:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqjy-0002NQ-Uv
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 11:23:10 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqjy-0002NM-QU; Mon, 20 Feb 2017 11:23:06 -0500
Received: by mail-qt0-x243.google.com with SMTP id b16so11121784qte.2;
	Mon, 20 Feb 2017 08:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=93abO/izQXbQI6l0Z+FYd4+uVvns6iEe9fa+2nTUU3Y=;
	b=ZoclxztLolLijPBN8niiYGMtx091DZTjwvYNAS5UBZs2/x3MveqPIJ7ZmrJjbKb4rq
	PKcugyhcaYrJRxHtdw2QG/ubBNTzPp476rF0CaKyQQRg6+EQKoOp9d11KG12WWRd3alV
	mokLqJ48Ozb+Up/zMxF+KwnLX+pMKjAnn4yXr70GFmchhkfN5AlPbKlSJigw30A5dutm
	XTWXBJx6N56sZ1G8f+5sY2IMrosPeaaNmS8ORYmtH4WXJDOGJOR4OnIPGA76drP8dMaU
	fzcB0wFGTCiWcFcOZ/orKUYwRtZXJwq6YsqDWCNJ5v0vxaPrdFtEj6cHeN76NJxxH4Id
	kuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=93abO/izQXbQI6l0Z+FYd4+uVvns6iEe9fa+2nTUU3Y=;
	b=ZDmXibGMImpthu8R/pvcubZTSSgk7uV2r2GQ/DuZW22/Osx+2qPKd4LMo0DmdoKXq4
	jPM2lU3lpg4ojvVhrpGB92ANc9nhZ9TCHw3E+323ke1uwye6ZlDZyghn2lsU8IxKRkjF
	JOel0Y9HB8gv5WVGAyTvTcw50OCHrGY9Tlr9uwl4prp5deUnoRJGiJqz0RxdNYMqXmY6
	dYTgV0gbDxLzTQXowM1axyq64KBVltaH/XyOqWSajqe6Nn9nxhYg1OJwaTEBQdfHNE6j
	lOxS7goaprvPmL3BhZuWLBAR0e7vhYQL00y7YCNmweJVeaiOfNjcwQgKtntBufLzca7M
	U1IQ==
X-Gm-Message-State: AMke39mecXBeuevodBMsTbyd/FYYp2Fn+St0ripbhFY2IHr9GzIh0j7j6LjpzcEORPfs0Q==
X-Received: by 10.200.46.241 with SMTP id i46mr22020909qta.17.1487607786147;
	Mon, 20 Feb 2017 08:23:06 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	n185sm6918261qke.53.2017.02.20.08.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 08:23:05 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e6ebfe0d-c866-e28e-2366-d55ac5d77d47@amsat.org>
Date: Mon, 20 Feb 2017 13:23:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 01/11] armv7m: Abstract out the
 "load kernel" code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f3GzxpbhnRG6

On 02/20/2017 12:35 PM, Peter Maydell wrote:
> Abstract the "load kernel" code out of armv7m_init() into its own
> function.  This includes the registration of the CPU reset function,
> to parallel how we handle this for A profile cores.
>
> We make the function public so that boards which choose to
> directly instantiate an ARMv7M device object can call it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/arm.h | 12 ++++++++++++
>  hw/arm/armv7m.c      | 23 ++++++++++++++++++-----
>  2 files changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index c175c0e..a3f79d3 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -26,6 +26,18 @@ typedef enum {
>  /* armv7m.c */
>  DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>                        const char *kernel_filename, const char *cpu_model);
> +/**
> + * armv7m_load_kernel:
> + * @cpu: CPU
> + * @kernel_filename: file to load
> + * @mem_size: mem_size: maximum image size to load
> + *
> + * Load the guest image for an ARMv7M system. This must be called by
> + * any ARMv7M board, either directly or via armv7m_init(). (This is
> + * necessary to ensure that the CPU resets correctly on system reset,
> + * as well as for kernel loading.)
> + */
> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
>
>  /*
>   * struct used as a parameter of the arm_load_kernel machine init
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 0c9ca7b..b2cc6e9 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -176,10 +176,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>      ARMCPU *cpu;
>      CPUARMState *env;
>      DeviceState *nvic;
> -    int image_size;
> -    uint64_t entry;
> -    uint64_t lowaddr;
> -    int big_endian;
>
>      if (cpu_model == NULL) {
>  	cpu_model = "cortex-m3";
> @@ -199,6 +195,16 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>      qdev_init_nofail(nvic);
>      sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
>                         qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
> +    armv7m_load_kernel(cpu, kernel_filename, mem_size);
> +    return nvic;
> +}
> +
> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
> +{
> +    int image_size;
> +    uint64_t entry;
> +    uint64_t lowaddr;
> +    int big_endian;
>
>  #ifdef TARGET_WORDS_BIGENDIAN
>      big_endian = 1;
> @@ -224,8 +230,15 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>          }
>      }
>
> +    /* CPU objects (unlike devices) are not automatically reset on system
> +     * reset, so we must always register a handler to do so. Unlike
> +     * A-profile CPUs, we don't need to do anything special in the
> +     * handler to arrange that it starts correctly.
> +     * This is arguably the wrong place to do this, but it matches the
> +     * way A-profile does it. Note that this means that every M profile
> +     * board must call this function!
> +     */
>      qemu_register_reset(armv7m_reset, cpu);
> -    return nvic;
>  }
>
>  static Property bitband_properties[] = {
>
