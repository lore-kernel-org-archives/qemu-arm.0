Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4662811wrm;
        Mon, 21 Oct 2019 07:36:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9abPYUEz5wVhvbH87j8cTQTFPe3+ycEm636+RfFcRpwmojxWy8ENRtGFEfjWgWcMan+5M
X-Received: by 2002:ae9:f108:: with SMTP id k8mr20421266qkg.78.1571668588678;
        Mon, 21 Oct 2019 07:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571668588; cv=none;
        d=google.com; s=arc-20160816;
        b=m4bARVRFSARCYgq7swIHa79TXWcsKXbPe7yc5mSbkhdVQB3B/i4IEIU2YrZOuoX90q
         sKtaWKfu8x+/J77FgrTwi0l9mhtLAbJSdcNonEnPLRjaE0tJpbM3lVdAvtiCqWVHHejj
         7CTqDCY5duuxyDL+DKC2hUuQ3DWZYnGvm0EK6r6InurifcGTQK4XXyU3USZ2UQ3U2sum
         IN133jJkuv77Qw1cBa+Hy97M+WqwR95CFVlzm8zj+GzEhuH7QR/oTu+W8rjAJr2px1M0
         D5AWJoeGL3wLu9B5BygMxF52/mEiNOP/9j0Z5Oe/54IHGeCuo0GSi09PQ6eUgx+0JWL+
         G0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject;
        bh=Ac2PD/vyr+jECzCXrNnsNct5Rs+6nZ+ZnQS+RSkESDE=;
        b=0Qiwe8AA9qbGZ6Fwcy4PbKSlXHc6g0EB4kcGjYzBMOQMJZsovcgKXqRK4GcKJvYAY/
         RGhLRkdr+GLKjUffdFcESKEOoPNeyoLclGiWSzlm1gMnxF/YKUniE+ozMWNQ0m7mfqP/
         bk+Jcvb1r5SAlZpz9q8q+xEo2a5LS2LhDVB0WZJS66o42P0U7TjJLzrURRw6Z8ROb2cw
         MDepH/6RHMYEpQAZhQs2+INP1yGvT9rFqisJFAAAEQxpqIxMrMAhRwY2EREQ/feIx+t7
         m6ND1gwBR8B9Vu6LUrbAuhkEm+/6UagOlump7j2Maa6VjsYmxQ3xJkm6POlexn1e4+uq
         Sdew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si4527736qvg.212.2019.10.21.07.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 07:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMYnL-00060y-IT
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 10:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMYiM-0001ly-TU
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:31:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMYiK-0002aK-Kj
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:31:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMYiK-0002Z3-C7
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:31:16 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0398F2D1CE
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 14:31:15 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id b10so731670wmh.6
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WW+ZO5Bq/diu4cy8HdXGyuu6WJWD0p3+enACBKkcKJE=;
 b=X/1lgrmjDoNqsSwu8Xx+GKVoXMJn1S1pU42I/Uj1B9587mj2nS9WLDTiLA6tGu+ZiL
 0duYBg58cHXVVZyzXsXHg8ZBGLC3lXqoL69gpta3QXbu78bXgVHyziOqloyjIGOgNMx3
 N1vsZ9ovCEUxkLP/9j30mrPTpOUfcBRs0W9ZXwFf/2phGoXJ+SwGms9Lh3HVCWom9mZR
 0XDurP0lF9VqMnvQcNybZ7t37W7fZE0WLk65FHWf9s0LqcFZNfnNSH4FeTVqioil5aM/
 29M3OEdKX8IebW4Uix4fiVWryKNWiBADrnKRZ9jRvioxXusCZxiZAvOgNWMZ+3RNyvDF
 CucA==
X-Gm-Message-State: APjAAAU3/OeAmKd4LPpfGfvZLZTMFIlWA9B0BHnWEjyWZx01bfjUy+D5
 K+dkj0+AiUYNCkAppZRcP4rWKw9lkqfIrQLu4zgLj/rvOIH862fwtb+fbpNGeqQEVFudANKAGY8
 t1kPNOp5t3/Pb
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr5268592wme.100.1571668273655; 
 Mon, 21 Oct 2019 07:31:13 -0700 (PDT)
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr5268531wme.100.1571668273345; 
 Mon, 21 Oct 2019 07:31:13 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id r19sm7926770wrr.47.2019.10.21.07.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 07:31:12 -0700 (PDT)
Subject: Re: [PATCH 00/21] hw: Let the machine be the owner of the system
 memory
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20191020225650.3671-1-philmd@redhat.com>
 <aad956d5-986c-bb9f-7735-cf18796b986e@redhat.com>
Message-ID: <eca291f8-67ce-14eb-bcb6-e743a44327f4@redhat.com>
Date: Mon, 21 Oct 2019 16:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <aad956d5-986c-bb9f-7735-cf18796b986e@redhat.com>
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
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
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wrMHfLHN1Q9Y

Hi Peter,

On 10/21/19 10:52 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/21/19 12:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi,
>>
>> This series is based on Igor's "eliminate remaining places that
>> abuse memory_region_allocate_system_memory()":
>> https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01601.html
>>
>> It is quite simple, we enforce all machines to be the QOM owner
>> of the system memory.
>>
>> This changes the memory tree from:
>>
>> =C2=A0=C2=A0 (qemu) info mtree -o
>> =C2=A0=C2=A0 memory-region: pc.ram
>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000007ffffff (prio 0, ra=
m): pc.ram=20
>> parent:{obj path=3D/machine/unattached}
>>
>> to:
>>
>> =C2=A0=C2=A0 (qemu) info mtree -o
>> =C2=A0=C2=A0 memory-region: pc.ram
>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000007ffffff (prio 0, ra=
m): pc.ram=20
>> owner:{obj path=3D/machine}
>>
>> Few patches are required to clean the codebase first, to unify the
>> creation of the system memory in the board/machine code. Mostly some
>> old ARM machines (pre-QOM) were affected.
>>
>> Please review (as a generic codebase cleanup).
>>
>> Regards,
>>
>> Phil.
>>
>> Based-on: <20191008113318.7012-1-imammedo@redhat.com>
>>
>> Philippe Mathieu-Daud=C3=A9 (21):
>> =C2=A0=C2=A0 hw/arm/xilinx_zynq: Use the IEC binary prefix definitions
>> =C2=A0=C2=A0 hw/arm/mps2: Use the IEC binary prefix definitions
>> =C2=A0=C2=A0 hw/arm/collie: Create the RAM in the board
>> =C2=A0=C2=A0 hw/arm/omap2: Create the RAM in the board
>> =C2=A0=C2=A0 hw/arm/omap1: Create the RAM in the board
>> =C2=A0=C2=A0 hw/arm/digic4: Inline digic4_board_setup_ram() function
>> =C2=A0=C2=A0 hw: Drop QOM ownership on memory_region_allocate_system_m=
emory() calls
>> =C2=A0=C2=A0 hw/alpha/dp264: Create the RAM in the board
>> =C2=A0=C2=A0 hw: Let memory_region_allocate_system_memory take Machine=
State
>> =C2=A0=C2=A0=C2=A0=C2=A0 argument
>> =C2=A0=C2=A0 hw/core: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/alpha: Let the machine be the owner of the system memo=
ry
>> =C2=A0=C2=A0 hw/arm: Let the machine be the owner of the system memory
>> =C2=A0=C2=A0 hw/cris: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/hppa: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/i386: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/lm32: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/m68k: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/mips: Let the machine be the owner of the system memor=
y
>> =C2=A0=C2=A0 hw/ppc: Let the machine be the owner of the system memory
>> =C2=A0=C2=A0 hw/sparc: Let the machine be the owner of the system memo=
ry
>> =C2=A0=C2=A0 hw/core: Assert memory_region_allocate_system_memory has =
machine owner
>=20
> I forgot 4 other calls:
>=20
> hw/ppc/ppc4xx_devs.c:708:=C2=A0=C2=A0=C2=A0 memory_region_allocate_syst=
em_memory(ram,=20
> NULL, "ppc4xx.sdram", ram_size);
> hw/s390x/s390-virtio-ccw.c:164:=20
> memory_region_allocate_system_memory(ram, NULL, "s390.ram", mem_size);
> hw/sparc/sun4m.c:791:=C2=A0=C2=A0=C2=A0 memory_region_allocate_system_m=
emory(&d->ram,=20
> NULL, "sun4m.ram",
> hw/sparc64/niagara.c:114:=20
> memory_region_allocate_system_memory(&s->partition_ram, NULL,

I'll need to respin this series because of this omission, but
- hw/ppc requires more cleanup patches as ARM has,
- hw/sparc is blocked until Igor sent his "convert
   memory_region_allocate_system_memory() to memdev" series.

I don't plan to rework on the ARM cleanups patches (1-6):

   hw/arm/xilinx_zynq: Use the IEC binary prefix definitions
   hw/arm/mps2: Use the IEC binary prefix definitions
   hw/arm/collie: Create the RAM in the board
   hw/arm/omap2: Create the RAM in the board
   hw/arm/omap1: Create the RAM in the board
   hw/arm/digic4: Inline digic4_board_setup_ram() function

Maybe you can take them directly in arm-next once they are reviewed,
then the rest can go via machine-next.

Thanks,

Phil.
