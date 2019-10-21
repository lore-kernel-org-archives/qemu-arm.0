Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4865554wrm;
        Mon, 21 Oct 2019 10:28:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqwxx0JJ4cLwZslryLO6TWGgU9c8+kATLvHG2Vz2OaCKOQWeFvlTLm8jIhK/om9Cg6idv6
X-Received: by 2002:ac8:5147:: with SMTP id h7mr24840828qtn.119.1571678880305;
        Mon, 21 Oct 2019 10:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571678880; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5ar7XMlvBOfbqObTJFB4f38/5EBpaZD88Q0nK55eQI6ml3S12ScpvUHOA/Z/+8tf0
         MZhRzh51ZXDQVw0iCK9ZlSDrRjXHzAvbAQDUVbO/glGf7JfuR2KO49Uj7g7EFZE3AUqs
         eoCPR8fuvhpxw36ECz85Y+qbe8kbNgysjqo3m1OguPn0R3CAmXkwvRs6qh6pReil9Ham
         ND5YKufzRaMGnErcwu6YtO5O2YadrfBCG/G1sCVlCloflogyp+sRLfHZvuh9zKj4Y6ZC
         uHY6hFHt2JaeCeKRzk8Ep7PO9lwnHTRhigh9i/gx8tNZPUyQZR54/L/dbwVu//mlWeGO
         mjdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=uHOeIskfuKSRRfkvxylgp3thln5uOHC3zxwjYo9bmPI=;
        b=zoYDqDlFV02wcqIFYh3nBH0KU9D5EOFX7ynDxfWunc4XjjqzY6wwfHC/OoIjScdPI3
         IR/v12jLOPqf9nqAkiLPwpav8/9PDNPyaujlBstiVNqlreGwzZ1c8hhwXbVPz/1YgxAf
         aLuoRbV9GRYCEZ16qTTwwl2ZEtUIi7F+0noZ08uvUgA0FQWHw+ASqjeC8Cl4RYQ4p5dT
         rS4QkXDNAgf/v131M9dEdgmq9ytX8m2Dl+27GbTGW2DbfkrArYaZvNzdUDi4PUf1a7Ud
         bl4gwyT5zqyspdEk4E4sscm8nwghJJrEBzWjKnQbkbgT7eOE2wC4wown9BZ85hdRaMVs
         T4BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mHzpFrby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si13836780qtp.225.2019.10.21.10.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mHzpFrby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46073 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbTL-0005EE-7X
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbSx-0005C7-Fz
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:27:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbSw-0004yj-9b
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:27:35 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbSv-0004ww-Mj
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:27:34 -0400
Received: by mail-pf1-x442.google.com with SMTP id y72so8820468pfb.12
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uHOeIskfuKSRRfkvxylgp3thln5uOHC3zxwjYo9bmPI=;
 b=mHzpFrbyhHbJLwsRuaaSJY1pvpzNxeAdqASeE6qHENBxinMyXWk81UMUlLKVzuh8jD
 QmCyXc1uujTPkY58o05NGghyCZSjz+dmZQGB0rN3aN2h2a77dl+600TKlmUtWMXOHfUV
 PnQF4y4Uq8d/0qLAcqavOZgwhdZKnIuk9w/WiADNUGRW/3zZFPX0BeXrl8rwP3IrB7ZO
 kgXvcoV52Y5ybVpMdIU4OfIKX2iBtjgTIiaSgcOsdOXyKyBN7Gl3JmFiRCUH4WGlKJoN
 xMZuJmj3mMGAdMzoo02YqsWLTNYs7kLzAimvWTGsXaEdj5ylR4iH64EXQu2zMHaD59FV
 xXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uHOeIskfuKSRRfkvxylgp3thln5uOHC3zxwjYo9bmPI=;
 b=cKlDmFIP2vXMEw4Y5C8/eLgX8tk0oJIlyf1S7kdfNLi0V5vM8/QK1Ll2XHTi2nj50q
 RTGNjjxWtx/mgJwccGfipljqbptkI/fAXeswicjnGlfO+TvFwhvIQ9ky8yFdvVXMpKvW
 unmYja0g8xI2OpcG9ktc3GUfLs/vNGrTjohnHI21Ra26fGklV0WRpPKRvShBgvDbEyEE
 /SFe5Wle7Zv+y1UaAvJoN9ECFMaKsAffGeFzv1IJAC2JiGUtniGyFyidjPCzuWYDuKW0
 rJ4MCitNc5jkQfzIeq0gDpbiAy3Sb0EMATxx3R1RBCbHIS4KhlPSPDQwLOqJlxr1RMYm
 By1g==
X-Gm-Message-State: APjAAAUwnJEQpvJykuBlhJN9oMapLGwsHQZYYebOOZ9udEFudo2xKdh2
 iXuIrQRS8p9YS7gGvmzJPO8zxQ==
X-Received: by 2002:aa7:9295:: with SMTP id j21mr23892413pfa.87.1571678848073; 
 Mon, 21 Oct 2019 10:27:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v8sm27124002pje.6.2019.10.21.10.27.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:27:27 -0700 (PDT)
Subject: Re: [PATCH 08/21] hw/alpha/dp264: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <708cda0d-4e05-4f15-5131-288567e91a4d@linaro.org>
Date: Mon, 21 Oct 2019 10:27:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oWnZXlJwzYhq

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> @@ -73,8 +74,16 @@ static void clipper_init(MachineState *machine)
>      cpus[0]->env.trap_arg1 = 0;
>      cpus[0]->env.trap_arg2 = smp_cpus;
>  
> +    /*
> +     * Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
> +     * but the address space hole reserved at this point is 8TB.
> +     */
> +    memory_region_allocate_system_memory(&ram_region, NULL, "ram",
> +                                         ram_size);
> +    memory_region_add_subregion(get_system_memory(), 0, &ram_region);

The thing that I don't like about this is that ...

> @@ -849,12 +848,6 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **isa_bus,
>  
>      *p_rtc_irq = qemu_allocate_irq(typhoon_set_timer_irq, s, 0);
>  
> -    /* Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
> -       but the address space hole reserved at this point is 8TB.  */
> -    memory_region_allocate_system_memory(&s->ram_region, NULL, "ram",
> -                                         ram_size);
> -    memory_region_add_subregion(addr_space, 0, &s->ram_region);
> -
>      /* TIGbus, 0x801.0000.0000, 1GB.  */
>      /* ??? The TIGbus is used for delivering interrupts, and access to
>         the flash ROM.  I'm not sure that we need to implement it at all.  */

... previously, it was clear that Typhoon owns the entire address space layout.
 With this moved to dp264.c, the "address space hole" comment is out of context
and makes no sense.

Would it be too weird to pass in a MemoryRegion* to typhoon_init and leave the
memory_region_add_subregion() call where it is?


r~


