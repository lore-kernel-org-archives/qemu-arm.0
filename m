Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4259914wrm;
        Mon, 21 Oct 2019 01:34:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVUN31J0sBvE/QVVvL1Ynrly/Ln03L+U8KMxDT1Eu/eoD9Zu+vzv4zNr1YW0ddbbbzMgvX
X-Received: by 2002:a17:906:6847:: with SMTP id a7mr21042869ejs.261.1571646899760;
        Mon, 21 Oct 2019 01:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571646899; cv=none;
        d=google.com; s=arc-20160816;
        b=xbVjZfQ/JiKPvtQeZ5uhXCr1F7L9LooracjPov1r39B1HbL+F3SUCnBRZwvS75F0wB
         z2PCATbPqfRWlWlgMzKQ19P0X5913Khax2+iPB6NE8t4QMsrbdxpz8EtlbEcGFPZz3gN
         FgkFV8l+R+Yn88w9ojPcz1DIL32Xlkqa5TkQtWXd/+lEIq4i1/c5Hqb9uH+8InmeMUjQ
         HW+khTYFBtZ0Kn5pUpTbcysq2QsBEdsp+CWWXdb9mhtC+kZ5RzCUfcEv9WW0UadBwrGN
         LNVMDuZb7I0M8RdnqxXBOxOXtXo+L63Zlp7pSRoHgI14IcGKntSi/JQGDXg1AVlS9DQn
         QTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=LCZYjB/QDxE9l9A/yD7calvl3kSoiKra73jk2Wc7Eqs=;
        b=bKWN4wT838O8L+TpTKMnkyL7ISOTD61AXKYejAGLsLoS2wcmKH4gz9qNZx4/ufqlnC
         RuxFt78iylHRuF7WW+hrB2l4yqewxJ0/WcX/FX7z75PBY0OdVcDaVu3T0HyBR0s8VTc8
         kcTqSV5sXbx/fJfrPDYhEtrFBeG58w6Hy8Jj2PUIqyeSiBS9wJ0Nq2kv6NlZjauZzTPo
         AoY48+MvJTpO7T06DeTVNEAOXSgSsloEFhJcVHl3ISPSZFGjLzj3PK8o/YRpWE9ZioYM
         x8qdAf9eXEI7n3m29e8pf9HrW0BlvYPeC5xHt+EvNswPDKZuoBkyTr+y93pAEWJBEVZC
         fkog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18si4439837ede.144.2019.10.21.01.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 01:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMT9W-0005XP-JG
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 04:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMT9N-0005Wh-Ce
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMT9L-0007XN-Rs
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:34:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMT9L-0007Wq-JS
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:34:47 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 806EA2A09C5
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 08:34:46 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a15so6891652wrr.0
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 01:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TCn+Qdz00SV7XMFoUhfjz0N726xchFWUp1tXh0p0n0Q=;
 b=Crl3zYBkP+rw2519bSFn4dpLmlBDo44jzm8NUjyz9Jq27rR7hxc3eqDuPJBxNcTnKW
 rkvNcCKktKS//fuLkJAKlpq0HCrU33+oAKp8csT1coGKjBjrVWuqynxtD0s3rG+sEi6W
 MDmZb/Ps1Xlx/hnP/EKuB8ehHEVMJfgs4R8e0w9QLLZ6O9I+s2zSmu+lVO631m6WAv16
 lzo3qwSk8ct1ln7nsUfUUq1MqcmP8SCy+WA5+WUK+OtIbajPXOUbvA4L7as03pOQd33Y
 jEUiRc266S68ted1/NuIlZaZHm5LidUUJTwDu7KytmLTJXjtn3qZe2MDQnqyaEmnxSll
 T2yw==
X-Gm-Message-State: APjAAAVrFhI3Fni1KIpmoPgI1A4lUR9U0var6knb4/NNZ6loN70zyYWr
 YsNv/jYilF+SMFq2MidLaqlqgfbarm+DfI4DehV18bupG0jsMvbUnvUh2mfGmTxSstDDMuJv6v+
 Jg/z14VzM3vjp
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr16839654wmj.123.1571646885086; 
 Mon, 21 Oct 2019 01:34:45 -0700 (PDT)
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr16839621wmj.123.1571646884843; 
 Mon, 21 Oct 2019 01:34:44 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id y3sm24539770wro.36.2019.10.21.01.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:34:44 -0700 (PDT)
Subject: Re: [PATCH 18/21] hw/mips: Let the machine be the owner of the system
 memory
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-19-philmd@redhat.com>
 <CAL1e-=ivk8phw5SOd=a6SO8RJ4E=9kN8hN0tocQYcb7AEKeyEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <698bde03-02a9-be5e-2aff-4e8d50508222@redhat.com>
Date: Mon, 21 Oct 2019 10:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=ivk8phw5SOd=a6SO8RJ4E=9kN8hN0tocQYcb7AEKeyEA@mail.gmail.com>
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
Cc: Paul Burton <pburton@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Fabien Chouteau <chouteau@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: syVOE+ancf0k

Hi Aleksandar,

On 10/21/19 8:25 AM, Aleksandar Markovic wrote:
>=20
>=20
> On Monday, October 21, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com=20
> <mailto:philmd@redhat.com>> wrote:
>=20
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     ---
>      =C2=A0hw/mips/boston.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-
>      =C2=A0hw/mips/mips_fulong2e.c | 3 ++-
>      =C2=A0hw/mips/mips_jazz.c=C2=A0 =C2=A0 =C2=A0| 2 +-
>      =C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 | 2 +-
>      =C2=A0hw/mips/mips_mipssim.c=C2=A0 | 2 +-
>      =C2=A0hw/mips/mips_r4k.c=C2=A0 =C2=A0 =C2=A0 | 3 ++-
>      =C2=A06 files changed, 8 insertions(+), 6 deletions(-)
>=20
>=20
> Philippe, can this patch be applied independently (on other patches of=20
> this series)?

Unfortunately not because patch #9 changed the prototype of
memory_region_allocate_system_memory() so this patch alone
won't build.

I rather expect this series goes as a whole via the machine-next
tree.

Do you mind giving your Acked-by tag to this patch?

Thanks,

Phil.

>=20
>=20
>     diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>     index ca7d813a52..8445fee0f1 100644
>     --- a/hw/mips/boston.c
>     +++ b/hw/mips/boston.c
>     @@ -474,7 +474,7 @@ static void boston_mach_init(MachineState *mach=
ine)
>      =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_overlap(sys_mem, 0=
x18000000,
>     flash, 0);
>=20
>      =C2=A0 =C2=A0 =C2=A0ddr =3D g_new(MemoryRegion, 1);
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ddr, NULL, "bos=
ton.ddr",
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ddr, machine, "=
boston.ddr",
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 machine->ram_size);
>      =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_overlap(sys_mem, 0=
x80000000, ddr, 0);
>=20
>     diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
>     index cf537dd7e6..d5a5cef619 100644
>     --- a/hw/mips/mips_fulong2e.c
>     +++ b/hw/mips/mips_fulong2e.c
>     @@ -318,7 +318,8 @@ static void mips_fulong2e_init(MachineState
>     *machine)
>      =C2=A0 =C2=A0 =C2=A0ram_size =3D 256 * MiB;
>=20
>      =C2=A0 =C2=A0 =C2=A0/* allocate RAM */
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, NULL, "ful=
ong2e.ram",
>     ram_size);
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, machine,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0"fulong2e.ram", ram_size);
>      =C2=A0 =C2=A0 =C2=A0memory_region_init_ram(bios, NULL, "fulong2e.b=
ios", BIOS_SIZE,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &error_fatal);
>      =C2=A0 =C2=A0 =C2=A0memory_region_set_readonly(bios, true);
>     diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
>     index 8d010a0b6e..88b125855f 100644
>     --- a/hw/mips/mips_jazz.c
>     +++ b/hw/mips/mips_jazz.c
>     @@ -188,7 +188,7 @@ static void mips_jazz_init(MachineState *machin=
e,
>      =C2=A0 =C2=A0 =C2=A0cc->do_transaction_failed =3D mips_jazz_do_tra=
nsaction_failed;
>=20
>      =C2=A0 =C2=A0 =C2=A0/* allocate RAM */
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, NULL, "mip=
s_jazz.ram",
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, machine, "=
mips_jazz.ram",
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 machine->ram_size);
>      =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(address_space, 0, =
ram);
>=20
>     diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
>     index 4d9c64b36a..af56a29ccb 100644
>     --- a/hw/mips/mips_malta.c
>     +++ b/hw/mips/mips_malta.c
>     @@ -1267,7 +1267,7 @@ void mips_malta_init(MachineState *machine)
>      =C2=A0 =C2=A0 =C2=A0}
>=20
>      =C2=A0 =C2=A0 =C2=A0/* register RAM at high address where it is un=
disturbed by IO */
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram_high, NULL,
>     "mips_malta.ram",
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram_high, machi=
ne,
>     "mips_malta.ram",
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ram_size);
>      =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(system_memory, 0x8=
0000000, ram_high);
>=20
>     diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
>     index 282bbecb24..c1933231e2 100644
>     --- a/hw/mips/mips_mipssim.c
>     +++ b/hw/mips/mips_mipssim.c
>     @@ -166,7 +166,7 @@ mips_mipssim_init(MachineState *machine)
>      =C2=A0 =C2=A0 =C2=A0qemu_register_reset(main_cpu_reset, reset_info=
);
>=20
>      =C2=A0 =C2=A0 =C2=A0/* Allocate RAM. */
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, NULL, "mip=
s_mipssim.ram",
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, machine,
>     "mips_mipssim.ram",
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ram_size);
>      =C2=A0 =C2=A0 =C2=A0memory_region_init_ram(bios, NULL, "mips_mipss=
im.bios", BIOS_SIZE,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &error_fatal);
>     diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
>     index bc0be26544..59f8cacfb6 100644
>     --- a/hw/mips/mips_r4k.c
>     +++ b/hw/mips/mips_r4k.c
>     @@ -203,7 +203,8 @@ void mips_r4k_init(MachineState *machine)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 " maximum 256MB", ram_size / MiB);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);
>      =C2=A0 =C2=A0 =C2=A0}
>     -=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, NULL, "mip=
s_r4k.ram",
>     ram_size);
>     +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram, machine, "=
mips_r4k.ram",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ram_size);
>=20
>      =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(address_space_mem,=
 0, ram);
>=20
>     --=20
>     2.21.0
>=20
>=20
