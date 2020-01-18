Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp262592lff;
        Sat, 18 Jan 2020 01:38:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJUhJ1+wLN+72/GGFaQ8CQv+9Tx/1b6YP3/nZsN6EObsDdK7SnqN1xMBi8NzfW6Of7xFdw
X-Received: by 2002:a25:a2c8:: with SMTP id c8mr34014460ybn.190.1579340290459;
        Sat, 18 Jan 2020 01:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579340290; cv=none;
        d=google.com; s=arc-20160816;
        b=GXVqMhrgxjqj0B1sbSyQk0Iw8t1SoxMTvb8REaSz3FcO+t92YCTpmrhQgZVHZAumuJ
         3JgZvJP7biDw7NeruhZVPbwv7zKWwvvgZ0WzMj/BA7XiWuifVT8shDfVI1yVYgifYdpj
         LmYmGX/ermeOAt7m7bvqww1so7LJGzhCgSAIgL1LJCVi1SNJXt9I8INz4GOBKQ0rZ/ws
         HhsQnMsYK9DX2WC9cJiVq07DKxNR8e7I6PkMzz4iA4CqSHSdANVE/XHhxuebFIw8aIyL
         G8YyZnGCLH2zHByJhl/MA2lg/eWP7uQQCyQJSDrmXu2rK6KHY9GSEH7l/VOlxLfjYV4x
         BpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=HWvXN4kWSOrjLhgRD9W8/+NkX8kJRIL4cBmWxunVj40=;
        b=nNlw8yNYNGEouyVvJls1g1E2awVPHL1FxGnfXbtFoF6cbDWn0Dx9P5QXR0SYNARur1
         6okdwOQCtP/QhaTkgvRWeb0wdYRtTmxXKyBE8BBCMvgtSURmQ8o9nSc5fPGb5Y7ABvbX
         yUC9mN37FtqBNZtxau/OiO10CDKhESS4qDqS5kPtgAk2fN96ivnG52I1EqySbWvjLaOG
         qy9NiONd6FcPgcYeQbNdEiIloguoX3bXssdjQA7uVmV+ABaFtPUb4gm6Fn10vJ4d+NGM
         Zc1I9Brc4aMdeXr930lXahxDSo4Eipi9DA35HcN4o6EyM3ySoYQGFTCm9QibSKHvDIjL
         GJWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZLoZq6ps;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id l17si9256834ybq.166.2020.01.18.01.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Jan 2020 01:38:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZLoZq6ps;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579340289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWvXN4kWSOrjLhgRD9W8/+NkX8kJRIL4cBmWxunVj40=;
	b=ZLoZq6psjLaTZjIgmfbDq2hndD6fGXnzhOgeNRUtk8rDRcMgL8XQmcD5B0J0/n+fet/70z
	o9qnSj11lU38VgqnqA0NnKpFglGPjCBzSo8lCgX3FHcjyzsxU63czmY7P5Oem/iwqFfCPC
	LP+c/UiSMoudOyTOzugjtDoa+E8PGPI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-q5BpdrcFOE-IL0xKGGjdmQ-1; Sat, 18 Jan 2020 04:37:55 -0500
Received: by mail-wm1-f69.google.com with SMTP id c4so2840401wmb.8
        for <alex.bennee@linaro.org>; Sat, 18 Jan 2020 01:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HWvXN4kWSOrjLhgRD9W8/+NkX8kJRIL4cBmWxunVj40=;
        b=Q+guRbU2HuC5bstQSK0uaHfejdG1gWEKfSq69zycVCS4KKpeytSMyd1DGfWuzfXCo9
         3y5LvsPOacg9HapIs/4B0eL7ZR2RG6gxudRUC9mIQ5oufLcyMCa3BbuVZddXllJTcra2
         /Gl+TQCqiDeqaEayz1HEMIjVivuVUysj6TQsXGrEP8gyuFAO29Stdr19fyF9uPlZza9E
         97fDST3x8+tGk36sT2Noj3eUX2lN9giZi9l6Wz7wemUS90GRbuakgqxa6TFdjCd9yA1c
         DgEJjmqlVke3Pi+zwEolot2w/869GAvuVu3seVTuAvs7jqgm/l/QPYljArE3gza/De/+
         oy+Q==
X-Gm-Message-State: APjAAAUZqiLpYl9C/ut73XvsiJ6jnjomJ8jq9Ko3oYoSMFRo4r5uFypD
	0FXAHKaRf2663dYaewPn6CV0/guHfbDg7DL9UeGqN/+Uf+9HunTPD6EAXDQ1lZoX38Ds2W8QDNN
	fGmibC3ix5xLnb545
X-Received: by 2002:adf:eb51:: with SMTP id u17mr7975358wrn.29.1579340273884;
        Sat, 18 Jan 2020 01:37:53 -0800 (PST)
X-Received: by 2002:adf:eb51:: with SMTP id u17mr7975334wrn.29.1579340273383;
        Sat, 18 Jan 2020 01:37:53 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id d12sm38852120wrp.62.2020.01.18.01.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2020 01:37:52 -0800 (PST)
Subject: Re: [PATCH v3 17/17] docs: add Orange Pi PC document
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-18-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <15d377a2-9d40-6195-5bfb-64e69037cd64@redhat.com>
Date: Sat, 18 Jan 2020 10:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-18-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: q5BpdrcFOE-IL0xKGGjdmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KENj+GEXk177

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> The Xunlong Orange Pi PC machine is a functional ARM machine
> based on the Allwinner H3 System-on-Chip. It supports mainline
> Linux, U-Boot, NetBSD and is covered by acceptance tests.
> 
> This commit adds a documentation text file with a description
> of the machine and instructions for the user.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   docs/orangepi.rst | 200 ++++++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS       |   1 +
>   2 files changed, 201 insertions(+)
>   create mode 100644 docs/orangepi.rst
> 
> diff --git a/docs/orangepi.rst b/docs/orangepi.rst
> new file mode 100644
> index 0000000000..5ac2a7b7cc
> --- /dev/null
> +++ b/docs/orangepi.rst
> @@ -0,0 +1,200 @@
> +=========================
> +Orange Pi PC Machine Type
> +=========================
> +
> +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> +based embedded computer with mainline support in both U-Boot
> +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> +512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> +various other I/O.
> +
> +Supported devices
> +-----------------
> +
> +The Orange Pi PC machine type supports the following devices:

Maybe drop "type"?

> +
> + * SMP (Quad Core Cortex A7)
> + * Generic Interrupt Controller configuration
> + * SRAM mappings
> + * SDRAM controller
> + * Real Time Clock
> + * Timer device (re-used from Allwinner A10)
> + * UART
> + * SD/MMC storage controller
> + * EMAC ethernet connectivity

Drop "connectivity"?

> + * USB 2.0 interfaces
> + * Clock Control Unit
> + * System Control module
> + * Security Identifier device
> +
> +Limitations
> +-----------
> +
> +Currently, Orange Pi PC does *not* support the following features:
> +
> +- Graphical output via HDMI, GPU and/or the Display Engine
> +- Audio output
> +- Hardware Watchdog
> +
> +Also see the 'unimplemented' array in the Allwinner H3 SoC module
> +for a complete list of unimplemented I/O devices:
> +  ./hw/arm/allwinner-h3.c
> +
> +Using the Orange Pi PC machine type
> +-----------------------------------
> +
> +Boot options
> +~~~~~~~~~~~~
> +
> +The Orange Pi PC machine can start using the standard -kernel functionality
> +for loading a Linux kernel or ELF executable. Additionally, the Orange Pi PC
> +machine can also emulate the BootROM which is present on an actual Allwinner H3
> +based SoC, which loads the bootloader from SD card, specified via the -sd argument

"from a SD card"?

> +to qemu-system-arm.
> +
> +Running mainline Linux
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Recently released mainline Linux kernels from 4.19 up to latest master

Drop "Recently released mainline" or only use "Mainline"?

> +are known to work. To build a Linux mainline kernel that can be booted
> +by the Orange Pi PC machine, simply configure the kernel using the
> +sunxi_defconfig configuration:
> +
> +  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make mrproper
> +  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make sunxi_defconfig
> +
> +To be able to use USB storage, you need to manually enable the corresponding
> +configuration item. Start the kconfig configuration tool:
> +
> +  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make menuconfig
> +
> +Navigate to the following item, enable it and save your configuration:
> +
> +  Device Drivers > USB support > USB Mass Storage support

Isn't it simpler to run 'echo CONFIG_USB_STORAGE=y >> .config && make 
oldconfig'?

> +
> +Build the Linux kernel with:
> +
> +  $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j5

I'm not sure about recommending "-j5" in the doc, not all user have >=4 
SMP system. Maybe we don't care.

> +
> +To boot the newly build linux kernel in QEMU with the Orange Pi PC machine, use:
> +
> +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> +      -kernel /path/to/linux/arch/arm/boot/zImage \
> +      -append 'console=ttyS0,115200' \
> +      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb
> +
> +Orange Pi PC images
> +~~~~~~~~~~~~~~~~~~~
> +
> +Note that the mainline kernel does not have a root filesystem. You may provide it
> +with an official Orange Pi PC image from the official website:
> +
> +  http://www.orangepi.org/downloadresources/
> +
> +Another possibility is to run an Armbian image for Orange Pi PC which
> +can be downloaded from:
> +
> +   https://www.armbian.com/orange-pi-pc/
> +
> +Alternatively, you can also choose to build you own image with buildroot
> +using the orangepi_pc_defconfig. Also see https://buildroot.org for more information.
> +
> +You can choose to attach the selected image either as an SD card or as USB mass storage.
> +For example, to boot using the Orange Pi PC Debian image on SD card, simply add the -sd
> +argument and provide the proper root= kernel parameter:
> +
> +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> +      -kernel /path/to/linux/arch/arm/boot/zImage \
> +      -append 'console=ttyS0,115200 root=/dev/mmcblk0p2' \
> +      -dtb /path/to/linux/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dtb \
> +      -sd OrangePi_pc_debian_stretch_server_linux5.3.5_v1.0.img
> +
> +To attach the image as an USB mass storage device to the machine,
> +simply append to the command:
> +
> +  -drive if=none,id=stick,file=myimage.img \
> +  -device usb-storage,bus=usb-bus.0,drive=stick
> +
> +Instead of providing a custom Linux kernel via the -kernel command you may also
> +choose to let the Orange Pi PC machine load the bootloader from SD card, just like
> +a real board would do using the BootROM. Simply pass the selected image via the -sd
> +argument and remove the -kernel, -append, -dbt and -initrd arguments:
> +
> +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> +       -sd Armbian_19.11.3_Orangepipc_buster_current_5.3.9.img
> +
> +Note that both the official Orange Pi PC images and Armbian images start
> +a lot of userland programs via systemd. Depending on the host hardware and OS,
> +they may be slow to emulate, especially due to emulating the 4 cores.
> +To help reduce the performance slow down due to emulating the 4 cores, you can
> +give the following kernel parameters (or via -append):
> +
> +  => setenv extraargs 'systemd.default_timeout_start_sec=9000 loglevel=7 nosmp console=ttyS0,115200'
> +
> +Running U-Boot
> +~~~~~~~~~~~~~~
> +
> +U-Boot mainline can be build and configured using the orangepi_pc_defconfig
> +using similar commands as describe above for Linux. Note that it is recommended
> +for development/testing to select the following configuration setting in U-Boot:
> +
> +  Device Tree Control > Provider for DTB for DT Control > Embedded DTB
> +
> +To start U-Boot using the Orange Pi PC machine, provide the
> +u-boot binary to the -kernel argument:
> +
> +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> +      -kernel /path/to/uboot/u-boot -sd disk.img
> +
> +Use the following U-boot commands to load and boot a Linux kernel from SD card:
> +
> +  -> setenv bootargs console=ttyS0,115200
> +  -> ext2load mmc 0 0x42000000 zImage
> +  -> ext2load mmc 0 0x43000000 sun8i-h3-orangepi-pc.dtb
> +  -> bootz 0x42000000 - 0x43000000
> +
> +Running NetBSD
> +~~~~~~~~~~~~~~
> +
> +The NetBSD operating system also includes support for Allwinner H3 based boards,
> +including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi PC
> +board and provides a fully working system with serial console, networking and storage.
> +
> +Currently NetBSD 9.0 is in testing, but release candidate 1 can be started
> +successfully on the Orange Pi PC machine. Get the 'evbarm-earmv7hf' based image from:
> +
> +  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
> +
> +The image requires manually installing U-Boot in the image. Build U-Boot with
> +the orangepi_pc_defconfig configuration as described in the previous section.
> +Next, unzip the NetBSD image and write the U-Boot binary including SPL using:
> +
> +  $ gunzip armv7.img.gz
> +  $ dd if=/path/to/u-boot-sunxi-with-spl.bin of=armv7.img bs=1024 seek=8 conv=notrunc
> +
> +Start the machine using the following command:
> +
> +  $ qemu-system-arm -M orangepi-pc -nic user -nographic \
> +        -sd armv7.img
> +
> +At the U-Boot stage, interrupt the automatic boot process by pressing a key
> +and set the following environment variables before booting:
> +
> +  => setenv bootargs root=ld0a
> +  => setenv kernel netbsd-GENERIC.ub
> +  => setenv fdtfile dtb/sun8i-h3-orangepi-pc.dtb
> +  => setenv bootcmd 'fatload mmc 0:1 ${kernel_addr_r} ${kernel}; fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}; fdt addr ${fdt_addr_r}; bootm ${kernel_addr_r} - ${fdt_addr_r}'
> +
> +Optionally you may save the environment variables to SD card with 'saveenv'.
> +To continue booting simply give the 'boot' command and NetBSD boots.
> +
> +Orange Pi PC acceptance tests
> +-----------------------------
> +
> +The Orange Pi PC machine has several acceptance tests included.
> +To run the whole set of tests, build QEMU from source and simply
> +provide the following command:
> +
> +  $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
> +     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e1b92b5fa..b52ac2fb9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -488,6 +488,7 @@ S: Maintained
>   F: hw/*/allwinner-h3*
>   F: include/hw/*/allwinner-h3*
>   F: hw/arm/orangepi.c
> +F: docs/orangepi.rst
>   
>   ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
> 
