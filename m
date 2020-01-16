Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7643673lff;
        Wed, 15 Jan 2020 16:21:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxA67OBMbo+sjZMTtpqJXgla1AxGS/iaGLXsNqPRmIsGvC23Zps7OBk6pYTf9ZJBi6xhgcT
X-Received: by 2002:a17:906:4089:: with SMTP id u9mr70079ejj.205.1579134064109;
        Wed, 15 Jan 2020 16:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579134064; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8dZR3c4HnxrXVxiZoK839eKLsso9LieKfjdOpDmN/zBAShEYre0sIcBBta0niYlrR
         tg8j9A4eKLtjMIn0vkZOqMq35Tho2k3eDuDnbYDO+myPs9eOatSXo+FCWw3UxPzKqO1F
         OHN5XrX/5LisMYegDhpV4K0+C2L721F+AtAIeyE9FIRYILZXQZiKpf6eCR0CE98jSQnX
         YwNOdCGkGpod0jGROQ6GLdbubX0oneCjve2M9imbp5PsIUm5Xw6eRArkzQ+Dp9WSTCQ8
         cM3NZibDw/uZauWMN6JMf35QDCZ2xUGy3OObpVczzH76/JMd1q2jJfY1o3Y1UQUwoJfg
         f2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6priJw6+QrEtabMGVbDfowA8nF2er6fYbgYQFpCTGs=;
        b=rGPIeQDIH8bvONCuuBR/Ov9q+gVjtCZK0Ge6wh58xBuAcC9esUuiEgtqdeRVzSSilJ
         tXTgtDwnh/+y2cFE1sjJwGeu00M/7FqO1YPma3TpptSjkJ3kORUnnG0J7KXaN5xhQcLE
         BJwkRGmWkRB5owUGppCT+yOxpkl9KRcxNHHoHR6RAwEANLz8PWcCuMO3Tuu/lYpL6sgX
         BlJz36cs7Rl+puVvDDubfz2a9tFNNaqlYFtbe2Dljchv6o7C+yccmJ+1aouWjbQ3qsCb
         8881EmJjTSDqgh8M60Z34RnFfeDH9pqOwNKCLFd+Ftf6/ohRc0GXg+KLjEX0MoRbPwe1
         KE+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nq1Ll5Qo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si13358000edo.268.2020.01.15.16.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 16:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nq1Ll5Qo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irsuF-0003Jn-2j
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 19:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1irsu4-0003Fz-IS
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 19:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1irsu3-0005fB-Hw
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 19:20:52 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37637)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1irsu1-0005cn-7b; Wed, 15 Jan 2020 19:20:49 -0500
Received: by mail-lj1-x242.google.com with SMTP id o13so20582671ljg.4;
 Wed, 15 Jan 2020 16:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6priJw6+QrEtabMGVbDfowA8nF2er6fYbgYQFpCTGs=;
 b=nq1Ll5QofaeXwzrT+Cg4HWWsTpP3TR5yiU2nnYzmffpQQFNx5hhpUcExnrC9hq0n6i
 Et61UHK+6b4TJuuq5821W/QjfLrV6kEzgeJgeNh/SlQLGhkDlh3/YzAg7HhxtZioQ4h5
 wzN/OCrSy57jIpTbvNqF4QtR47Qr0WTRlxEhr3M5Yj7YA9BcCZHb30OKcmWOlr4IBVg+
 BH6xVwxCMNrSz1LP6xF8kmuYdNPuTqGJAcH9j1/edM6LU8cWia+2m91RIqfKgbCF5sAa
 DwZ14VUBapeSfYeYXWnnLzY77Y0l18B5+Ts4ki/qf4s3A+WO/dWNMvOcxB/Hg2brV+7F
 jhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6priJw6+QrEtabMGVbDfowA8nF2er6fYbgYQFpCTGs=;
 b=cFsjaUFeWbZ1VejPDSnsnN5EGVX/wJslevej/PiLGg4QSa5LSXQP/OhG1DhLBDewok
 eqPVgEkpctLR2QHlDvYh7QUHv6Ji3B+vT8eQ/JsBu0r31OzPs/rzaJbfVVYdZw7rn16h
 nTt6OJuffgrFYz6mBm45NjpClWtyslPmmh2BlVti7ZDrDhRIqco+ARDU1FdMSJFjHLJ2
 uG99npDd555dX/w28sPITMO1YpDQkKn0Fifp2vqgj+illBuWXIc52Dy92QZhXX0N1tfg
 cxihi1FNWFdcvQ5kJ2lq2CiA9Ptpe3J2PQ7/j6TfyORGrsKxy8puz/HSFgj3rFru7Vjl
 JFbw==
X-Gm-Message-State: APjAAAUZhjdG4hn1I7GQwuJ5wjc5tdl/zxq8c2WVAvZa7MYqYJth/YzO
 L6Lv2uk0yv6VC+4PSL/XY1Tusyxs4/99elZTIuM=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr572786lja.204.1579134047672; 
 Wed, 15 Jan 2020 16:20:47 -0800 (PST)
MIME-Version: 1.0
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-36-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-36-git-send-email-imammedo@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jan 2020 10:20:20 +1000
Message-ID: <CAKmqyKPS0i5P1Tgsu6bVidsAD-JjHMxE-10Pa72Z+dbXJWowdg@mail.gmail.com>
Subject: Re: [PATCH v2 35/86] arm:xilinx_zynq: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jY4WnqBXZTRO

On Thu, Jan 16, 2020 at 1:29 AM Igor Mammedov <imammedo@redhat.com> wrote:
>
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> CC: edgar.iglesias@gmail.com
> CC: alistair@alistair23.me
> ---
>  hw/arm/xilinx_zynq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index df950fc..0ef9688 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -160,7 +160,6 @@ static void zynq_init(MachineState *machine)
>  {
>      ARMCPU *cpu;
>      MemoryRegion *address_space_mem = get_system_memory();
> -    MemoryRegion *ext_ram = g_new(MemoryRegion, 1);
>      MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
>      DeviceState *dev;
>      SysBusDevice *busdev;
> @@ -190,9 +189,7 @@ static void zynq_init(MachineState *machine)
>      object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal);
>
>      /* DDR remapped to address zero.  */
> -    memory_region_allocate_system_memory(ext_ram, NULL, "zynq.ext_ram",
> -                                         machine->ram_size);
> -    memory_region_add_subregion(address_space_mem, 0, ext_ram);
> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>
>      /* 256K of on-chip memory */
>      memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
> @@ -318,6 +315,7 @@ static void zynq_machine_init(MachineClass *mc)
>      mc->no_sdcard = 1;
>      mc->ignore_memory_transaction_failures = true;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
> +    mc->default_ram_id = "zynq.ext_ram";
>  }
>
>  DEFINE_MACHINE("xilinx-zynq-a9", zynq_machine_init)
> --
> 2.7.4
>
>
