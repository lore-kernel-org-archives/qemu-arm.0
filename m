Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3793403lfi;
        Mon, 6 Apr 2020 03:24:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypIKtkCgIBkJZHpya9CT9n1oePVXEVcqEuRjQ3iwPzjx0h2AfVuiQPRuROony6YDDqNzNlEP
X-Received: by 2002:ac8:3f78:: with SMTP id w53mr20169707qtk.26.1586168687716;
        Mon, 06 Apr 2020 03:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586168687; cv=none;
        d=google.com; s=arc-20160816;
        b=m10xVXxY90lYuf3qeltNsa4XW3Cx53iwKrIlcVxHJRVE1Silp6d2vbdFmsk1pFXLnq
         0hA9AqJrQXy214QfByIFj29sY2baip7iXrcQAaWpeI7tICcaezWdhGmc+rQAg5rzs8nX
         PAR4PsIz45dcbvZ8e8Y9E0uwt8KOSuDRQZLnpuZkpkB8dM1ozXbQlXMB1jppS/AJqkG+
         dFjHNCfuk4yCxnjL58vySKYq/D4TNNBI32zjHB1DQyVq0JuMxYcD3ajPAgoiqlv1nvBF
         bxwBHSFBMNfxzVqatgmxiHpoD032gfe9p0F156AKvuYVmSvmnDvrODFeCs65QIwa4Y2J
         805Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FjiifhrLC2UJGaxj4SGQ4znuCgY+VR/nsmZmZTzV1a4=;
        b=US8HZT8WkjGVThvTwn2BT/JaGTkv4FCGL1lXEjR/cUHvnpH00uykB5fOf7tv8aNoBF
         WRwlEqWGeV58n2ZAzcmizCBvXbybfEFEI4FS0qjuuZrRI5CJznuz7e+kxZ0U2qS6NUCt
         rMLRd+Kd+72dr3RO5DSgd47JaUql0U+O5n8t1SO6UNBD8htauBVfz7e/sW9UNiPJLiBd
         CSkdSvlEvBW+IuBkAcIwlrLEsZwpRKfzcsthz65vQM3T8+T/xgrxktaU6zNRuj4M/Fpz
         buGNR5m+yjewbFV2W7Ulx0NWoX6PDQoA2kB0aygv4UYDpaCnp/kGDePeo2PTU7+QcsUy
         W+mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bh9wpnt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s37si10366107qth.84.2020.04.06.03.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 03:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bh9wpnt/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLOvv-0001Rz-4R
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 06:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLOvc-0001Or-8V
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 06:24:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLOva-0001cm-LF
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 06:24:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60302
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLOva-0001ce-H3
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 06:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586168666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjiifhrLC2UJGaxj4SGQ4znuCgY+VR/nsmZmZTzV1a4=;
 b=Bh9wpnt/CHmHfNJ1XAexR43jbYr6tt0J5/oWJ+NpEoqCrNlFxVQSZRJaIo01gyeCheZCsu
 fxWDE4q83AeT+hzdiuhJxYT5EQPdV1SAlQoK3IQq56I4Uxp1GVvOmbwd/UUXGCq0TI/ZTS
 GeyiwLOKy29Cs/ks7Rxh55A6S2RfLNk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Myc_iQkENJmTT40AK0jQjA-1; Mon, 06 Apr 2020 06:24:17 -0400
X-MC-Unique: Myc_iQkENJmTT40AK0jQjA-1
Received: by mail-ed1-f72.google.com with SMTP id f19so11414945edt.5
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2020 03:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FjiifhrLC2UJGaxj4SGQ4znuCgY+VR/nsmZmZTzV1a4=;
 b=YjKQhO6hriPH3QBFYC/NeSEZ4gg9i64EKzLT1ewrRZDymvpAZEeTJGmWQm6Pnue/WK
 IzXseucKnbCy8X6rgtgdmolEHQni8CFcoTZomKfpRRPG8atnLyBXPd5rcncxLSj5DLj3
 7pjJdzEyB6vsLhjf92/vABsEy1/OeUugwq90UW9s1DSDVUhsvyn5QndwKZBezwOnceGq
 uDmEn8NPkqurpqOw7d4pGYjxiHKzF4yd15saK5lxHUANlbWAEDarc800o9EF06jSzLIK
 t4PHD/2EhHFOdCBItBCzpj+k1S2217R3SEPVdfsVnY/JiOkeH1g25u5Kk4AvsykU+Coa
 PZHQ==
X-Gm-Message-State: AGi0PuYkOU5qi68l+sbk7PT/b5vFWAWatOv7vPvES0xXmOY3PLe5jy0Z
 Or0Y24nyzvEGD5gyhh+TJG83yNh0KuqPp/ioHgEdlXOiJKWxECx2KPjcLbYn39cBzWltuMUhx+5
 6r/bMerfw1/WN
X-Received: by 2002:a17:906:1e42:: with SMTP id
 i2mr19766373ejj.317.1586168655868; 
 Mon, 06 Apr 2020 03:24:15 -0700 (PDT)
X-Received: by 2002:a17:906:1e42:: with SMTP id
 i2mr19766343ejj.317.1586168655437; 
 Mon, 06 Apr 2020 03:24:15 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id v30sm2419759eda.68.2020.04.06.03.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 03:24:14 -0700 (PDT)
Subject: Re: [Qemu-devel PATCH v2 0/2] Add SmartFusion2 EMAC block
To: sundeep.lkml@gmail.com, jasowang@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8783e9e6-e013-955b-c953-d203f59225d1@redhat.com>
Date: Mon, 6 Apr 2020 12:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VX3kEupUJGGo

Hi Sundeep,

On 4/5/20 7:13 AM, sundeep.lkml@gmail.com wrote:
> From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> 
> This patch set emulates Ethernet MAC block
> present in Microsemi SmartFusion2 SoC.
> 
> v2:
>    No changes. Fixed Signed-off mail id in patch 2/2
> 
> 
> Testing:
> 
> 1. Download u-boot.bin, uImage and msf2-devkit.dtb from
>     https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
> 2. Copy uImage and msf2-devkit.dtb to suitable Qemu tftp directory
> 3. Launch Qemu by
>     ./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel \
>     u-boot.bin -display none -nic user,tftp=<qemu tftp directory>
> 
> Example:
> ./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio -kernel u-boot -display none -nic user,tftp=/home/hyd1358/qemu_tftp
> 
> U-Boot 2010.03-00000-ga7695d6 (Apr 04 2020 - 15:07:27)
> 
> CPU  : SmartFusion2 SoC (Cortex-M3 Hard IP)
> Freqs: CORTEX-M3=142MHz,PCLK0=71MHz,PCLK1=71MHz
> Board: M2S-FG484-SOM Rev 1A, www.emcraft.com
> DRAM:  64 MB
> *** Warning - bad CRC, using default environment
> 
> In:    serial
> Out:   serial
> Err:   serial
> Net:   M2S_MAC
> 
> Hit any key to stop autoboot:  3  0
> 
> M2S-FG484-SOM> run netboot
> Using M2S_MAC device
> TFTP from server 10.0.2.2; our IP address is 10.0.2.15
> Filename 'uImage'.
> Load address: 0xa0007fc0
> Loading: *#################################################################
>   #################################################################
>   #################################################################
>   ###############################################################
> done
> Bytes transferred = 3681568 (382d20 hex)
> Using M2S_MAC device
> TFTP from server 10.0.2.2; our IP address is 10.0.2.15
> Filename 'msf2-devkit.dtb'.
> Load address: 0xa0000200
> Loading: *#
> done
> Bytes transferred = 1712 (6b0 hex)
> ## Booting kernel from Legacy Image at a0007fc0 ...
>     Image Name:
>     Image Type:   ARM Linux Kernel Image (uncompressed)
>     Data Size:    3681504 Bytes =  3.5 MB
>     Load Address: a0008000
>     Entry Point:  a0008001
>     Verifying Checksum ... OK
>     Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 4.5.0-gb0e5502-dirty (hyd1358@hyd1358) (gcc version 4.4.1 (Sourcery G++ Lite 2010q1-189) ) #85 PREEMPT Sat Apr 4 23:26:40 IST 2020
> [    0.000000] CPU: ARMv7-M [410fc231] revision 1 (ARMv7M), cr=00000000
> [    0.000000] CPU: unknown data cache, unknown instruction cache
> [    0.000000] Machine model: Microsemi SmartFusion 2 development board
> [    0.000000] bootconsole [earlycon0] enabled
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
> [    0.000000] Kernel command line: console=ttyS0,115200n8 panic=10 mem=64M@0xa0000000 earlyprintk
> [    0.000000] PID hash table entries: 256 (order: -2, 1024 bytes)
> [    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> [    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Memory: 61212K/65536K available (1612K kernel code, 75K rwdata, 680K rodata, 1224K init, 120K bss, 4324K reserved, 0K cma-reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0x00000000 - 0x00001000   (   4 kB)
> [    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
> [    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MB)
> [    0.000000]     lowmem  : 0xa0000000 - 0xa4000000   (  64 MB)
> [    0.000000]     modules : 0xa0000000 - 0xa0800000   (   8 MB)
> [    0.000000]       .text : 0xa0008000 - 0xa02453e8   (2293 kB)
> [    0.000000]       .init : 0xa0246000 - 0xa0378000   (1224 kB)
> [    0.000000]       .data : 0xa0378000 - 0xa038ace0   (  76 kB)
> [    0.000000]        .bss : 0xa038ace0 - 0xa03a8ea0   ( 121 kB)
> [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] Preemptible hierarchical RCU implementation.
> .
> .
> .
> [    0.445184] Found M2S MAC at 0x40041000, irq 18
> [    0.448810] libphy: msf2 MII bus: probed
> [    0.527047] ipip: IPv4 over IPv4 tunneling driver
> [    0.532367] NET: Registered protocol family 10
> [    0.542307] sit: IPv6 over IPv4 tunneling driver
> [    0.544655] NET: Registered protocol family 17
> [    0.565395] Freeing unused kernel memory: 1224K (a0246000 - a0378000)
> init started: BusyBox v1.31.1 (2020-01-25 20:01:06 IST)
> starting pid 26, tty '': '/etc/rc'
> starting pid 31, tty '/dev/ttyS0': '/bin/hush -i'
> 
> 
> BusyBox v1.31.1 (2020-01-25 20:01:06 IST) hush - the humble shell
> Enter 'help' for a list of built-in commands.
> 
> / # ifconfig eth0 10.0.2.15
> [   11.116091] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> / # [   11.653634] eth0: link up (100/full)
> [   11.655246] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
> 
> / # ls
> dev   proc  sys   etc   usr   bin   tmp   sbin  mnt   init
> / # tftp -gr uImage 10.0.2.2
> [   40.780983] random: nonblocking pool is initialized
> / # ls
> dev     sys     usr     tmp     mnt     uImage
> proc    etc     bin     sbin    init
> / #

Thanks for the use case example!

Do you mind adding it to our test suite? There are various examples in 
tests/acceptance/boot_linux_console.py.

Thanks!

Phil.
> 
> Subbaraya Sundeep (2):
>    hw/net: Add Smartfusion2 emac block
>    msf2: Add EMAC block to SmartFusion2 SoC
> 
>   MAINTAINERS                |   2 +
>   hw/arm/msf2-soc.c          |  21 +-
>   hw/net/Makefile.objs       |   1 +
>   hw/net/msf2-emac.c         | 556 +++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/msf2-soc.h  |   3 +
>   include/hw/net/msf2-emac.h |  50 ++++
>   6 files changed, 632 insertions(+), 1 deletion(-)
>   create mode 100644 hw/net/msf2-emac.c
>   create mode 100644 include/hw/net/msf2-emac.h
> 

