Received: by 10.25.0.144 with SMTP id 138csp1116160lfa;
        Sun, 16 Apr 2017 20:23:53 -0700 (PDT)
X-Received: by 10.55.131.7 with SMTP id f7mr6684741qkd.0.1492399433244;
        Sun, 16 Apr 2017 20:23:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p65si9619329qkb.89.2017.04.16.20.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxGa-00033j-MY
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:23:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxGU-00032C-3f
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxGT-0005FW-5n
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:23:46 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxGN-00058v-2s; Sun, 16 Apr 2017 23:23:39 -0400
Received: by mail-qt0-x244.google.com with SMTP id t52so5739648qtb.3;
	Sun, 16 Apr 2017 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=SP7ekfDEwGfsOHrSTwk5j3qAaJv8PhKk6PJVuQ8jNLA=;
	b=VlijZJP4xPBpFNRpd6cUpx9wHdIaYQ03COiYe4r5CjbhgAj1umhSqHIO2+PKfjQp6N
	A5DLn3vs1mk57Pfq3A5as71ugLxsjly3NvqBqiAJQetX6viq+cJrBMQHFF32+MiJ7QJu
	nv2Opo4XnxQ18xo8RkM1j2w4kjcVuPMUMG+IeG/DUvAUGX0e/pIuFCs5lBkXZFnn97UD
	UBd2ZGE67ldCxb9MrEp1kIdQWjueaC3f0iiLKWp23UPp8UQCWXlB10teeMeg8/vwJtB3
	xOMLyiIF6qa8OKT4rHMk5qjXF4k0Ce/4MDpAOnSEMvwurmsOUfnnCph7BktKm0hUkv3l
	m22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SP7ekfDEwGfsOHrSTwk5j3qAaJv8PhKk6PJVuQ8jNLA=;
	b=rWVxUGfMFSIv1oZCLjht8xYUNDe9+Qlun4tkZ0ouPjHRedfI8aT30IPxObace/ZNt4
	CYwCgC9kM+zx3bsYWcM3dVN2ozuY21H47Omh4Znr++wyj6rpPCWZFhZr1qUVKXjuCR98
	m4LJXXoH9poAr2KRnQm2d7racWqh5wg23MSP0CPIcky0i3Z39y04g6kc0xgTpg6XiDSm
	/OnQ4D7MRa8rknkpeonywVpMI074daAime53Bq5YVlzRO+Ypd/HKzTo1OvwiaV+hUQQy
	25+PDO7cM/ZswqDkNJlM/Rmu5+2rLLanuHp1HtVNCBUPILY1VQ2hUpKw9Xa3IPWGqv5I
	tLhQ==
X-Gm-Message-State: AN3rC/7BKqM2M2ZJSndSMJrSUchp1BAH/oIFa4dKHryYCzegp5QHS7uk
	ewWKmudcII5FMw==
X-Received: by 10.200.57.226 with SMTP id v89mr7953467qte.255.1492399418465;
	Sun, 16 Apr 2017 20:23:38 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v11sm6340644qtg.33.2017.04.16.20.23.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 20:23:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4261d33b-a3d8-06fd-7b06-0cd0a30bc987@amsat.org>
Date: Mon, 17 Apr 2017 00:23:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 04/11] armv7m: Use QOMified armv7m object in
 armv7m_init()
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sYUU//Ws5UPV

On 02/20/2017 12:35 PM, Peter Maydell wrote:
> Make the legacy armv7m_init() function use the newly QOMified
> armv7m object rather than doing everything by hand.
>
> We can return the armv7m object rather than the NVIC from
> armv7m_init() because its interface to the rest of the
> board (GPIOs, etc) is identical.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/armv7m.c | 49 ++++++++++++-------------------------------------
>  1 file changed, 12 insertions(+), 37 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 56d02d4..36f213c 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -131,21 +131,6 @@ static void bitband_init(Object *obj)
>      sysbus_init_mmio(dev, &s->iomem);
>  }
>
> -static void armv7m_bitband_init(void)
> -{
> -    DeviceState *dev;
> -
> -    dev = qdev_create(NULL, TYPE_BITBAND);
> -    qdev_prop_set_uint32(dev, "base", 0x20000000);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x22000000);
> -
> -    dev = qdev_create(NULL, TYPE_BITBAND);
> -    qdev_prop_set_uint32(dev, "base", 0x40000000);
> -    qdev_init_nofail(dev);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x42000000);
> -}
> -
>  /* Board init.  */
>
>  static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> @@ -283,35 +268,25 @@ static void armv7m_reset(void *opaque)
>
>  /* Init CPU and memory for a v7-M based board.
>     mem_size is in bytes.
> -   Returns the NVIC array.  */
> +   Returns the ARMv7M device.  */
>
>  DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>                        const char *kernel_filename, const char *cpu_model)
>  {
> -    ARMCPU *cpu;
> -    CPUARMState *env;
> -    DeviceState *nvic;
> +    DeviceState *armv7m;
>
>      if (cpu_model == NULL) {
> -	cpu_model = "cortex-m3";
> +        cpu_model = "cortex-m3";
>      }
> -    cpu = cpu_arm_init(cpu_model);
> -    if (cpu == NULL) {
> -        fprintf(stderr, "Unable to find CPU definition\n");
> -        exit(1);
> -    }
> -    env = &cpu->env;
> -
> -    armv7m_bitband_init();
> -
> -    nvic = qdev_create(NULL, "armv7m_nvic");
> -    qdev_prop_set_uint32(nvic, "num-irq", num_irq);
> -    env->nvic = nvic;
> -    qdev_init_nofail(nvic);
> -    sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
> -                       qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
> -    armv7m_load_kernel(cpu, kernel_filename, mem_size);
> -    return nvic;
> +
> +    armv7m = qdev_create(NULL, "armv7m");
> +    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
> +    qdev_prop_set_string(armv7m, "cpu-model", cpu_model);
> +    /* This will exit with an error if the user passed us a bad cpu_model */
> +    qdev_init_nofail(armv7m);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu), kernel_filename, mem_size);
> +    return armv7m;
>  }
>
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>
