Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp396336ejk;
        Mon, 29 Jan 2024 11:46:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDEWW7hhoGBuVo1ehOpQdSPTG8rW84AJrTx0B0G/dv5tvKDZ00HPaCujgkZZBJ2cOKTioQ
X-Received: by 2002:a5d:42c7:0:b0:33a:ec08:d0bd with SMTP id t7-20020a5d42c7000000b0033aec08d0bdmr2973181wrr.40.1706557604412;
        Mon, 29 Jan 2024 11:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706557604; cv=none;
        d=google.com; s=arc-20160816;
        b=HLYowwR+yIBZwmHeDJ36gS6mEje/6WwUkCVOSTtbG0Pg3Ma/csiQSfjcY3XxsNB8+G
         PALO/Dad0Qz7JAZtaRuvkZHBovnZBKHEiXUA8q20lRY4FMA8om86S61wLYIrWp+ylqx1
         wjFNIRTmllRXp+BYyPi6DuQoZ0Vp/y1GJMPDKTRDy6kc25aYGYLTP+nPmCRygAFLDBSs
         xzaro+9ApQ8CJqldCJp2qfAQGivXAmysUGeUU9pFp5E1J6EMAVTdc2TobH/ymBA+ZFy7
         zgE4KOxydFRAZY1PguO4PeQs09NjQ8+6tId5aBHOzpNEMqAcj8W4VjE8LmgjtXRcEmZA
         leHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=InOPVg3Lyl9/5V3I+iNz3rc1gUATTgnt6ErIC6fL7HM=;
        fh=OJX9EFtx1vfTkbCFt/C3ykLPoQ76W00Zo7JLDbiAv0I=;
        b=qs9Pq0g05mSogoA2dQw+rJkaoZjDjrRc4A+s5wYoEQ0uwpDpGOV2JZY1A6ixAIatGe
         8QyBErG6IvWzH0kTX9Q9MVGQvr0rAokz5MetgUk1Ae+5NQICfHQyaoK4sGxRDXRxJYPU
         cQhCbPOgo1t0pssLGRYILCKD8bbkJTEQ5z9NUxnG+Fq4AYX2U0oLJ2SEfO0zCLsoTNiL
         h71V0vo7KRXZ9UboSQlpFxF6fjapcRG62K0n+saIcdAEooFcJR3F86qP6lUcqnrJNQ0a
         Yy39z9ssET+4RR7MmZyJTzwMsmwXAaSE2uqN5eoSuLKvSdcR3wddrrWpkXmsESaRfB8C
         nyLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [2001:738:2001:2001::2001])
        by mx.google.com with ESMTPS id d6-20020adffd86000000b0033af6759252si300293wrr.21.2024.01.29.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 11:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) client-ip=2001:738:2001:2001::2001;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 9FB514E6012;
	Mon, 29 Jan 2024 20:46:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
	by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
	with ESMTP id JX1PHC9kVR1W; Mon, 29 Jan 2024 20:46:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 99D024E6006; Mon, 29 Jan 2024 20:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 966427456B4;
	Mon, 29 Jan 2024 20:46:41 +0100 (CET)
Date: Mon, 29 Jan 2024 20:46:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
    Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
    qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Zhao Liu <zhao1.liu@intel.com>, 
    Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    =?ISO-8859-15?Q?Fr=E9d=E9ric_Barrat?= <fbarrat@linux.ibm.com>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, mzamazal@redhat.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
    Laurent Vivier <laurent@vivier.eu>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/29] bulk: Access existing variables initialized to
 &S->F when available
In-Reply-To: <20240129164514.73104-2-philmd@linaro.org>
Message-ID: <fd790685-a98f-9cd5-c117-dac96564a71b@eik.bme.hu>
References: <20240129164514.73104-1-philmd@linaro.org> <20240129164514.73104-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1985250681-1706557601=:22604"
X-TUID: pEYIcOdfnB4K

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1985250681-1706557601=:22604
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 29 Jan 2024, Philippe Mathieu-Daudé wrote:
> When a variable is initialized to &struct->field, use it
> in place. Rationale: while this makes the code more concise,
> this also helps static analyzers.
>
> Mechanical change using the following Coccinelle spatch script:
>
> @@
> type S, F;
> identifier s, m, v;
> @@
>      S *s;
>      ...
>      F *v = &s->m;
>      <+...
> -    &s->m
> +    v
>      ...+>
>
> Inspired-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/display/ati.c              |  2 +-
> hw/misc/macio/pmu.c           |  2 +-
> hw/misc/pvpanic-pci.c         |  2 +-
> hw/pci-bridge/cxl_root_port.c |  2 +-
> hw/ppc/pnv.c                  | 20 ++++++++++----------
> hw/virtio/vhost-user-gpio.c   |  8 ++++----
> hw/virtio/vhost-user-scmi.c   |  6 +++---
> hw/virtio/virtio-pci.c        |  2 +-
> hw/xen/xen_pt.c               |  6 +++---
> migration/multifd-zlib.c      |  2 +-
> target/arm/cpu.c              |  4 ++--
> target/arm/kvm.c              |  2 +-
> target/arm/machine.c          |  6 +++---
> target/i386/hvf/x86hvf.c      |  2 +-
> target/m68k/helper.c          |  2 +-
> target/ppc/kvm.c              |  8 ++++----
> target/riscv/cpu_helper.c     |  2 +-
> 17 files changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/hw/display/ati.c b/hw/display/ati.c
> index 569b8f6165..8d2501bd82 100644
> --- a/hw/display/ati.c
> +++ b/hw/display/ati.c
> @@ -991,7 +991,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
>     }
>     vga_init(vga, OBJECT(s), pci_address_space(dev),
>              pci_address_space_io(dev), true);
> -    vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, &s->vga);
> +    vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, vga);
>     if (s->cursor_guest_mode) {
>         vga->cursor_invalidate = ati_cursor_invalidate;
>         vga->cursor_draw_line = ati_cursor_draw_line;
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index e9a90da88f..7fe1c4e517 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -737,7 +737,7 @@ static void pmu_realize(DeviceState *dev, Error **errp)
>     timer_mod(s->one_sec_timer, s->one_sec_target);
>
>     if (s->has_adb) {
> -        qbus_init(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
> +        qbus_init(adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,

Probably should change to use sizeof(*adb_bus) too. Although the next line 
is the only place the adb_bus local is used so maybe can drop the local 
and chnage next line to use &s->adb_bus instead.

Regards,
BALATON Zoltan

>                   dev, "adb.0");
>         adb_register_autopoll_callback(adb_bus, pmu_adb_poll, s);
>     }
--3866299591-1985250681-1706557601=:22604--
