Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4274663wrm;
        Mon, 21 Oct 2019 01:52:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDxhFz1agjYBFxydoVCC4STYZ2zzahC63h2T6jhMp8qszC2unW0zjm0aoKWJm+Enjqz0mm
X-Received: by 2002:a50:9713:: with SMTP id c19mr10109446edb.206.1571647962081;
        Mon, 21 Oct 2019 01:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571647962; cv=none;
        d=google.com; s=arc-20160816;
        b=XmjVmck4Yu7RCJ38myyGhC+lSYV6m15UEqf6Iv7yF30pDLCNnnkjvvmx5Y13IlEBZZ
         cyfSf5/LvASMd7FLiCLDklwbgX9d8dmBuOpE/9zvNVkuvfg9l92EnKPAiHL2fTmFsDSA
         VLyloL1rfqsRToVBHY1P2bPlKjdaXCWxvTq1Wo1kC1i0WJ87/JsgZWV5BU35oVrQoyZB
         L0O9VZprITwN0+NIDMlj6aE2z+KNH9JZ3vPAID2H8LzOD6D7bESa1z2UGtaOlUNzLBhg
         ZVO3jDTkkg0oYCNqBln2FfO25LbHyG/dpu0bMgRCdDcdbJ/VG9oVO8dm1YIiACQh6ed7
         AfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=gBOZuPvJAc3pBc6uGClNcpZ8r0EOVSeWs78IT0XcVvw=;
        b=gLqHdKWqWVqjbCieTIB69sUhheENELxt2hLcjtvHyhJpgKLuACdZAvi7/j9Vw5E7Nk
         iM5r4RU+iKsHYk6BKI+x8vCyTPB8DXUJh62TZY0i5K+l/lMotzowRG3B2e2gSaK/BaVY
         CzxV7KAWeVhjra63vBCM0nL45gjFbtxgGeJeW/jtdotn+i1LE3uZnS4sVCzPeyqyW7jv
         9cLiRgGwf10K4jxph/D4W3ggr/8QHdWCzI8AdTdp2mKC9Kq3ZlzsFxUD+XRkjgyzBC1/
         KaxekfBf3ue6UvNsu1CyGw7/Iwjh5Qtfd6aWLSxjQaqDhJtfQSQbo8T+0uCiPQNDm4gb
         AjEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si7685646ejd.115.2019.10.21.01.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 01:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMTQe-0003SJ-Pg
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 04:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMTQR-0003PU-IU
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMTQQ-0005ly-5s
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:52:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33098)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMTQP-0005lb-U5
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:52:26 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5399859FE
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 08:52:24 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id k9so5605976wmb.0
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 01:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oV4ge5qxJiVtfmz8+Jt95uPQU/0vGeF4cLF7Tfjen+Q=;
 b=awU3VNmWai7vSSqtaLrrTqpubyyp3qkCWsqHnG3UHeCwQOVunI4pURXyjQVQ+3VMYV
 wzG4uFTbONnThWNNVEO1k3jnpa2NBEvUl0bTR8PowhUv2HEtEGUNUhyikP+wMAt8Zs9c
 vBDiXPOdclYcNnSkGVbBfXdxwJ7ZPKjBJ45DmcIi/hWgnwxeeLXbmZICN1KgZodmWjgP
 naaugMWHLIsfVjabu8bq9Cf5ih5TKuzwQqmEGtfQW3y8JupLze8I8PUJa6jx6mhJI+lk
 pwSWrYMA696/wHBOOXHnvI/p7jXStKE9i8mH+uGo0wPU0pvYgV+uV+bXK8Qm8fGF9x1y
 x92g==
X-Gm-Message-State: APjAAAU39Jx853bxWfRaCOTj8Pe0wgKzid2SGreBJDLo4Kn+lrzoR3OP
 g80vs5x181H92fpfsoaKgbvxMygzXhXjJ4nt16AAaJL/e2/ncO7NRlXP7QSfuKG+NugJODDZaRo
 OaG8yILxnZhO5
X-Received: by 2002:adf:e512:: with SMTP id j18mr8443531wrm.291.1571647943622; 
 Mon, 21 Oct 2019 01:52:23 -0700 (PDT)
X-Received: by 2002:adf:e512:: with SMTP id j18mr8443496wrm.291.1571647943407; 
 Mon, 21 Oct 2019 01:52:23 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id z125sm20278358wme.37.2019.10.21.01.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:52:22 -0700 (PDT)
Subject: Re: [PATCH 00/21] hw: Let the machine be the owner of the system
 memory
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aad956d5-986c-bb9f-7735-cf18796b986e@redhat.com>
Date: Mon, 21 Oct 2019 10:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTkApgMAMbz7

On 10/21/19 12:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series is based on Igor's "eliminate remaining places that
> abuse memory_region_allocate_system_memory()":
> https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01601.html
>=20
> It is quite simple, we enforce all machines to be the QOM owner
> of the system memory.
>=20
> This changes the memory tree from:
>=20
>    (qemu) info mtree -o
>    memory-region: pc.ram
>      0000000000000000-0000000007ffffff (prio 0, ram): pc.ram parent:{ob=
j path=3D/machine/unattached}
>=20
> to:
>=20
>    (qemu) info mtree -o
>    memory-region: pc.ram
>      0000000000000000-0000000007ffffff (prio 0, ram): pc.ram owner:{obj=
 path=3D/machine}
>=20
> Few patches are required to clean the codebase first, to unify the
> creation of the system memory in the board/machine code. Mostly some
> old ARM machines (pre-QOM) were affected.
>=20
> Please review (as a generic codebase cleanup).
>=20
> Regards,
>=20
> Phil.
>=20
> Based-on: <20191008113318.7012-1-imammedo@redhat.com>
>=20
> Philippe Mathieu-Daud=C3=A9 (21):
>    hw/arm/xilinx_zynq: Use the IEC binary prefix definitions
>    hw/arm/mps2: Use the IEC binary prefix definitions
>    hw/arm/collie: Create the RAM in the board
>    hw/arm/omap2: Create the RAM in the board
>    hw/arm/omap1: Create the RAM in the board
>    hw/arm/digic4: Inline digic4_board_setup_ram() function
>    hw: Drop QOM ownership on memory_region_allocate_system_memory() cal=
ls
>    hw/alpha/dp264: Create the RAM in the board
>    hw: Let memory_region_allocate_system_memory take MachineState
>      argument
>    hw/core: Let the machine be the owner of the system memory
>    hw/alpha: Let the machine be the owner of the system memory
>    hw/arm: Let the machine be the owner of the system memory
>    hw/cris: Let the machine be the owner of the system memory
>    hw/hppa: Let the machine be the owner of the system memory
>    hw/i386: Let the machine be the owner of the system memory
>    hw/lm32: Let the machine be the owner of the system memory
>    hw/m68k: Let the machine be the owner of the system memory
>    hw/mips: Let the machine be the owner of the system memory
>    hw/ppc: Let the machine be the owner of the system memory
>    hw/sparc: Let the machine be the owner of the system memory
>    hw/core: Assert memory_region_allocate_system_memory has machine own=
er

I forgot 4 other calls:

hw/ppc/ppc4xx_devs.c:708:    memory_region_allocate_system_memory(ram,=20
NULL, "ppc4xx.sdram", ram_size);
hw/s390x/s390-virtio-ccw.c:164:=20
memory_region_allocate_system_memory(ram, NULL, "s390.ram", mem_size);
hw/sparc/sun4m.c:791:    memory_region_allocate_system_memory(&d->ram,=20
NULL, "sun4m.ram",
hw/sparc64/niagara.c:114:=20
memory_region_allocate_system_memory(&s->partition_ram, NULL,
