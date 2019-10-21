Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4855607wrm;
        Mon, 21 Oct 2019 10:19:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzS6+aCiQWPF0u2yU8RW7WnG6PyxZJYZy7+oHOgHhL4ZgNUf1cvF3tPfNOeurvYD+7WOcUJ
X-Received: by 2002:a05:6402:1b91:: with SMTP id cc17mr25897464edb.180.1571678363183;
        Mon, 21 Oct 2019 10:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571678363; cv=none;
        d=google.com; s=arc-20160816;
        b=xrOogOJHD4lyn2g/URX04EAldk1hHFrDoyYa7bPJT5kfpp7U3DtPVlkmwsXQ+gdEOi
         JVq0PQF2qu7vDw8BNucRiDICNXqhXEA6+QomfC+cFLsTkSxn3kwcdv9t4kA4v6SmR2gg
         tOHyAJ/df+T6OOmAd4ZNJGReQfY22w8YsztVa15ybS2L5CiWAomSCv695N0J7wr1ac6K
         zyxo5k5ntClK+5pQI0pL9fclWDoLp+0paKxmKDpzCTQ+q9XF3kGaiBePc+r8T/Ugs0Bq
         9FKGcfHBH3HBym9tDD61BntihoaN76piN8/2Qysn2RDpjhXsjAOZ+M3IESF6r8jfxTR9
         xI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=H22Y49rpyXiV/0s7o5/REI7ZzvJXDELGFM/r4tV3nJ4=;
        b=v1bsKoLDKeoE0Idin4PMe1zSXWTv1q9/ylZpWYi+WpKJfQPlUjUAbM71BjvhsiEDl1
         6QjFYabYubTkbjk7YqZigJD7TKdDitvM4pnJh+Xs7KqfltIs1jl8mJJEhPRsYRVUk62i
         hIOfvPUFrTPVzx0JexmimIFT9JwHPX9AfRhZ/t4VUXxby+XDzNcNJwVOSK/3DX+bIS+d
         zDPyWfmq1aIUVDTdaKPtWOAY7cgRwDlWE8KvnShQqHWsGmz2fI/Nwg+veaYNPgFIlUBy
         vm5xbXi11Wh5qKtJkk1dIwxWtnJaWjcVJOlAv29S5Ei1ZPMROah6M5NSEPEjM0AjrKMa
         6vLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si9516534eja.290.2019.10.21.10.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbKz-0006o9-KT
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMbKf-0006lF-77
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMbKd-0001hh-PS
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:19:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMbKb-0001fb-Nj
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:18:57 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2A47859FF
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 17:18:54 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id f4so7637414wrj.12
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h75/ng50FSR/T8wvfc6IKPX40001NghQ17j+Osu46yc=;
 b=L1A/lQ81zaCCjkuaIZWyr5ANqa3vQH2y/2V+CqGyt/hLbI25pAOmoadJ0hCMZHJq7g
 UNIcuuolpr1an0wcukF4tzGu3y0i7OV0rM/GkiNaMraw0Hf10f0hOyp6XngfHzzAAbve
 5znOG+x6YlxCwWaK+jV109wLsbTrmjjoUCyEjk7hylGR5KSO4gKIh6kzTEnCj+nVtsle
 Bjg3+rd6iJSu121VA4WYAeYdhRVmmeBehXhrx2iFrUsISnBjO00N7vZNA7PwSt0ttR1T
 aN3bvYhmV5sD5brlvd6DR/KXJE2qYqBwrqRnoWtWiQ+XXZ3lR1sBQvZ5EO9MCOTwGDCI
 Qsjw==
X-Gm-Message-State: APjAAAUZe8X7UB9iH32zqdQmomOQLma4aR+d/TSSvpy1hl7oTmX713JA
 6pV6tyziSK35Jtu5vt1sbzUG4K97dVXjJxaWKGecRD1xALYDKRWt4C7Gva7bFyn9HPD2ShpP5Af
 3dGjUuwk5WB9k
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr18920818wmj.160.1571678333740; 
 Mon, 21 Oct 2019 10:18:53 -0700 (PDT)
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr18920788wmj.160.1571678333546; 
 Mon, 21 Oct 2019 10:18:53 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id d202sm9196251wmd.47.2019.10.21.10.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:18:52 -0700 (PDT)
Subject: Re: [PATCH 04/21] hw/arm/omap2: Create the RAM in the board
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-5-philmd@redhat.com>
 <ee89a853-46c7-e306-1e49-cd75136428c8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9a35ec0-e713-54fd-eb5c-64ae0363a2d2@redhat.com>
Date: Mon, 21 Oct 2019 19:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ee89a853-46c7-e306-1e49-cd75136428c8@linaro.org>
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
X-TUID: 42I+ADqapuuN

On 10/21/19 6:59 PM, Richard Henderson wrote:
> On 10/20/19 3:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>   static void n8x0_init(MachineState *machine,
>>                         struct arm_boot_info *binfo, int model)
>>   {
>> -    MemoryRegion *sysmem =3D get_system_memory();
>> +    MemoryRegion *sdram =3D g_new(MemoryRegion, 1);
>>       struct n800_s *s =3D (struct n800_s *) g_malloc0(sizeof(*s));
>> -    int sdram_size =3D binfo->ram_size;
>> +    uint64_t sdram_size =3D binfo->ram_size;
>>  =20
>> -    s->mpu =3D omap2420_mpu_init(sysmem, sdram_size, machine->cpu_typ=
e);
>> +    memory_region_allocate_system_memory(sdram, NULL, "omap2.dram",
>> +                                         sdram_size);
>> +    memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE, s=
dram);
>> +
>> +    s->mpu =3D omap2420_mpu_init(sdram, machine->cpu_type);
>=20
> Any reason not to put the MemoryRegion in to the n800_s structure?

Ah yes, better to keep it in n800_s in case we ever QOM'ify this SoC.
I'll do.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks :)
