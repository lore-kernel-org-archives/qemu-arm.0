Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4410137wrm;
        Mon, 21 Oct 2019 04:03:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyv/F0/a/3HJu7rnJ1RL4gskEPQs2lQgHQ183c2lvPzMAAFhSc7XW5rwWgwUyOurZyAP19F
X-Received: by 2002:a50:b2c4:: with SMTP id p62mr23770035edd.128.1571655796259;
        Mon, 21 Oct 2019 04:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571655796; cv=none;
        d=google.com; s=arc-20160816;
        b=GHWvA75A2MhgtTmoGe47da8s7R3KtLiDy5RZqVcVXBd20n5ffnAkI+zi/L6uR1Rc02
         OkjLvVkzIzQyC8bZeVuE35Rl/YrRP1J31flJYhW7pm5BsvHPw++quimxhnorXjq4HBNb
         AMeXucOISWiEwmj2Y1HjcxZimlvBt39maU1piB/Rc47k6FczhYZosRIiWiEWWsN3y4Y/
         +bUw9JKqgCH7avgk1VQmPTS3qKnS3QdwLVZBIeNTpGVCJK7Z0pOrWytVKzN++FbK+gWT
         j7w1YkovQR94f8YPqqQ7xRuM722pJlS++Fkb2PBA6C9CVFV9J5dK/yrOhKJY7SgrkVYW
         UXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=8cU9YpjqfjKJljNOjUTYsuZb+8CzeCdO/XDvHbV0w3I=;
        b=GBK+4TdUOJArzVBVFw4GljhwwDM1TgjMY07jLBRX+q+ZAos3Ka1YcBo0mZ5I0E5m3K
         2RUzP6aukwFxMlsIMpK6JZJ1fQg4zrKUsY3xArbxEY1MDqAkyCBchRUv0TBbKAc5oL4o
         KMx36DcVmt8WKht38nUH9gBpk3NoPBhCEXOulBAD/pVXUMzxeLyvkB60lD6KE+TvE2MQ
         qJ4n1fHHJvjEIkcncyudY99C7bfyEjAVv6AqaZk4XfEA0fKQqUIwg0G+yyenywNOcVX5
         Fa8Sq4h8EQlVg3WKDEz3iPg+pY0vgIrHg71SWPozzEtnQ5SPhryyRy3r+LnJVMODt69o
         B3gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HuSF0plP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si6741307eda.192.2019.10.21.04.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 04:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HuSF0plP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMVT0-0004ZK-SR
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 07:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iMVMT-0007Wt-9f
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:56:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iMVMR-0002u2-H3
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:56:29 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34485)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iMVMR-0002tm-BM; Mon, 21 Oct 2019 06:56:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id m19so10615714otp.1;
 Mon, 21 Oct 2019 03:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=8cU9YpjqfjKJljNOjUTYsuZb+8CzeCdO/XDvHbV0w3I=;
 b=HuSF0plPP7zfJ9Gmt/Eqnd7zSY4ec+1/axKNeO53EgIoV6xziFwx9RXvYGgnVU2Z18
 a1WUU4C+ejeqYVlJ1qLX+b6KPBYW4AGG4Jx1b0+cW3SYRYFna/WBtfrze1V+aOOQa3Ll
 SEehHaNEqVSEnMP4CQF7Y8PWh5xNVNT/s+/eU4FAdFEHO9NYWZSG46MdowphGkT6/J/p
 4m5z59RgN0v4lm/iW61Z6PKYdyBTHf1BJ36qKAmhfHGMKAVkdsjtzknbtFWmvuE6VwyN
 Tn40orTA5Cl7qBt5rYWqZ+bZk4MGO6tqgxvkEAkHfSg4/yhL3ZYNu1R0UKjk++E1qrua
 crDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=8cU9YpjqfjKJljNOjUTYsuZb+8CzeCdO/XDvHbV0w3I=;
 b=A3+5PPX2vIOQfdEIuWZRGwoWdBJQNrv1mwteoTbx56PQ4LekAaPR2HE2KmkES8z3Ck
 iqlOeA8Q0HYocIRKU6X3wqHkXdLZEcYsh7nkQYndQ4RJkFVNVmXLeeeMcCDdcWRDvb6U
 wCshKoPOVv+wm2+i9JuuhSlF4hC6En71T6cow+yr53uaLB/hTxyQgSk/DtXR4d4M2DBy
 u+H03nt3b7VvFxdD0TqjDKPpjsvGQMkm7nQ2lgBNSMf0jaQEZPqHklZn8hRfT6dmharg
 Ac7P5S0PRrWlplKxf/EKiAEdGEOT7VUqatInLQoveWcMQii49K94eJ7G1b6HmWrzUmx2
 TiVQ==
X-Gm-Message-State: APjAAAVhEF2VEOemcELLUkco1AuAkmiIj+YWT9qKcDSCe1nxh/hyt6+k
 nNsiViCguk4YHsXYJNy1D2fZ2+zX7bdjbp26znA=
X-Received: by 2002:a9d:4f0f:: with SMTP id d15mr17344164otl.64.1571655386293; 
 Mon, 21 Oct 2019 03:56:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Mon, 21 Oct 2019 03:56:25
 -0700 (PDT)
In-Reply-To: <698bde03-02a9-be5e-2aff-4e8d50508222@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-19-philmd@redhat.com>
 <CAL1e-=ivk8phw5SOd=a6SO8RJ4E=9kN8hN0tocQYcb7AEKeyEA@mail.gmail.com>
 <698bde03-02a9-be5e-2aff-4e8d50508222@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 21 Oct 2019 12:56:25 +0200
Message-ID: <CAL1e-=jtavWvWaajrdTmapFgLfXXhfH8nuWCxY-z8+oMGsOAGA@mail.gmail.com>
Subject: Re: [PATCH 18/21] hw/mips: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000026c35059569896e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b9iEDTuLwvNx

--000000000000026c35059569896e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Monday, October 21, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> Hi Aleksandar,
>
> On 10/21/19 8:25 AM, Aleksandar Markovic wrote:
>
>>
>>
>> On Monday, October 21, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com
>> <mailto:philmd@redhat.com>> wrote:
>>
>>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>>     <mailto:philmd@redhat.com>>
>>     ---
>>       hw/mips/boston.c        | 2 +-
>>       hw/mips/mips_fulong2e.c | 3 ++-
>>       hw/mips/mips_jazz.c     | 2 +-
>>       hw/mips/mips_malta.c    | 2 +-
>>       hw/mips/mips_mipssim.c  | 2 +-
>>       hw/mips/mips_r4k.c      | 3 ++-
>>       6 files changed, 8 insertions(+), 6 deletions(-)
>>
>>
>> Philippe, can this patch be applied independently (on other patches of
>> this series)?
>>
>
> Unfortunately not because patch #9 changed the prototype of
> memory_region_allocate_system_memory() so this patch alone
> won't build.
>
> I rather expect this series goes as a whole via the machine-next
> tree.
>
> Do you mind giving your Acked-by tag to this patch?
>
>
I can't, sorry, for MIPS target, we don't accept patches with empty commit
messages.

A.




> Thanks,
>
> Phil.
>
>
>>
>>     diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>>     index ca7d813a52..8445fee0f1 100644
>>     --- a/hw/mips/boston.c
>>     +++ b/hw/mips/boston.c
>>     @@ -474,7 +474,7 @@ static void boston_mach_init(MachineState
>> *machine)
>>           memory_region_add_subregion_overlap(sys_mem, 0x18000000,
>>     flash, 0);
>>
>>           ddr =3D g_new(MemoryRegion, 1);
>>     -    memory_region_allocate_system_memory(ddr, NULL, "boston.ddr",
>>     +    memory_region_allocate_system_memory(ddr, machine, "boston.ddr"=
,
>>                                                machine->ram_size);
>>           memory_region_add_subregion_overlap(sys_mem, 0x80000000, ddr,
>> 0);
>>
>>     diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
>>     index cf537dd7e6..d5a5cef619 100644
>>     --- a/hw/mips/mips_fulong2e.c
>>     +++ b/hw/mips/mips_fulong2e.c
>>     @@ -318,7 +318,8 @@ static void mips_fulong2e_init(MachineState
>>     *machine)
>>           ram_size =3D 256 * MiB;
>>
>>           /* allocate RAM */
>>     -    memory_region_allocate_system_memory(ram, NULL, "fulong2e.ram",
>>     ram_size);
>>     +    memory_region_allocate_system_memory(ram, machine,
>>     +                                         "fulong2e.ram", ram_size);
>>           memory_region_init_ram(bios, NULL, "fulong2e.bios", BIOS_SIZE,
>>                                  &error_fatal);
>>           memory_region_set_readonly(bios, true);
>>     diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
>>     index 8d010a0b6e..88b125855f 100644
>>     --- a/hw/mips/mips_jazz.c
>>     +++ b/hw/mips/mips_jazz.c
>>     @@ -188,7 +188,7 @@ static void mips_jazz_init(MachineState *machine=
,
>>           cc->do_transaction_failed =3D mips_jazz_do_transaction_failed;
>>
>>           /* allocate RAM */
>>     -    memory_region_allocate_system_memory(ram, NULL, "mips_jazz.ram"=
,
>>     +    memory_region_allocate_system_memory(ram, machine,
>> "mips_jazz.ram",
>>                                                machine->ram_size);
>>           memory_region_add_subregion(address_space, 0, ram);
>>
>>     diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
>>     index 4d9c64b36a..af56a29ccb 100644
>>     --- a/hw/mips/mips_malta.c
>>     +++ b/hw/mips/mips_malta.c
>>     @@ -1267,7 +1267,7 @@ void mips_malta_init(MachineState *machine)
>>           }
>>
>>           /* register RAM at high address where it is undisturbed by IO =
*/
>>     -    memory_region_allocate_system_memory(ram_high, NULL,
>>     "mips_malta.ram",
>>     +    memory_region_allocate_system_memory(ram_high, machine,
>>     "mips_malta.ram",
>>                                                ram_size);
>>           memory_region_add_subregion(system_memory, 0x80000000,
>> ram_high);
>>
>>     diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
>>     index 282bbecb24..c1933231e2 100644
>>     --- a/hw/mips/mips_mipssim.c
>>     +++ b/hw/mips/mips_mipssim.c
>>     @@ -166,7 +166,7 @@ mips_mipssim_init(MachineState *machine)
>>           qemu_register_reset(main_cpu_reset, reset_info);
>>
>>           /* Allocate RAM. */
>>     -    memory_region_allocate_system_memory(ram, NULL,
>> "mips_mipssim.ram",
>>     +    memory_region_allocate_system_memory(ram, machine,
>>     "mips_mipssim.ram",
>>                                                ram_size);
>>           memory_region_init_ram(bios, NULL, "mips_mipssim.bios",
>> BIOS_SIZE,
>>                                  &error_fatal);
>>     diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
>>     index bc0be26544..59f8cacfb6 100644
>>     --- a/hw/mips/mips_r4k.c
>>     +++ b/hw/mips/mips_r4k.c
>>     @@ -203,7 +203,8 @@ void mips_r4k_init(MachineState *machine)
>>                            " maximum 256MB", ram_size / MiB);
>>               exit(1);
>>           }
>>     -    memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram",
>>     ram_size);
>>     +    memory_region_allocate_system_memory(ram, machine,
>> "mips_r4k.ram",
>>     +                                         ram_size);
>>
>>           memory_region_add_subregion(address_space_mem, 0, ram);
>>
>>     --     2.21.0
>>
>>
>>

--000000000000026c35059569896e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, October 21, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hi Aleksandar,<br>
<br>
On 10/21/19 8:25 AM, Aleksandar Markovic wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
On Monday, October 21, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a> &lt;mailto:<=
a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>=
&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_bl=
ank">philmd@redhat.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/boston.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +=
-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_fulong2e.c | 3 ++-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_jazz.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_malta.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_mipssim.c=C2=A0 | 2 +-<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0hw/mips/mips_r4k.c=C2=A0 =C2=A0 =C2=A0 | 3 ++-<br=
>
=C2=A0 =C2=A0 =C2=A0=C2=A06 files changed, 8 insertions(+), 6 deletions(-)<=
br>
<br>
<br>
Philippe, can this patch be applied independently (on other patches of this=
 series)?<br>
</blockquote>
<br>
Unfortunately not because patch #9 changed the prototype of<br>
memory_region_allocate_system_<wbr>memory() so this patch alone<br>
won&#39;t build.<br>
<br>
I rather expect this series goes as a whole via the machine-next<br>
tree.<br>
<br>
Do you mind giving your Acked-by tag to this patch?<br>
<br></blockquote><div><br></div><div>I can&#39;t, sorry, for MIPS target, w=
e don&#39;t accept patches with empty commit messages.</div><div><br></div>=
<div>A.</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
Thanks,<br>
<br>
Phil.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/boston.c b/hw/mips/boston.c<br>
=C2=A0 =C2=A0 index ca7d813a52..8445fee0f1 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/boston.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/boston.c<br>
=C2=A0 =C2=A0 @@ -474,7 +474,7 @@ static void boston_mach_init(MachineState=
 *machine)<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_o<wbr>v=
erlap(sys_mem, 0x18000000,<br>
=C2=A0 =C2=A0 flash, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0ddr =3D g_new(MemoryRegion, 1);<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ddr,=
 NULL, &quot;boston.ddr&quot;,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ddr,=
 machine, &quot;boston.ddr&quot;,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 machine-&gt;ram_size);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion_o<wbr>v=
erlap(sys_mem, 0x80000000, ddr, 0);<br>
<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.=
c<br>
=C2=A0 =C2=A0 index cf537dd7e6..d5a5cef619 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/mips_fulong2e.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/mips_fulong2e.c<br>
=C2=A0 =C2=A0 @@ -318,7 +318,8 @@ static void mips_fulong2e_init(MachineSta=
t<wbr>e<br>
=C2=A0 =C2=A0 *machine)<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0ram_size =3D 256 * MiB;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* allocate RAM */<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 NULL, &quot;fulong2e.ram&quot;,<br>
=C2=A0 =C2=A0 ram_size);<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 machine,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;fulong2e.ram&quot;, ram_size);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_init_ram(bios, NULL, =
&quot;fulong2e.bios&quot;, BIOS_SIZE,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_set_readonly(bi<wbr>o=
s, true);<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c<br>
=C2=A0 =C2=A0 index 8d010a0b6e..88b125855f 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/mips_jazz.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/mips_jazz.c<br>
=C2=A0 =C2=A0 @@ -188,7 +188,7 @@ static void mips_jazz_init(MachineState *=
machine,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0cc-&gt;do_transaction_failed =3D mi=
ps_jazz_do_transaction_faile<wbr>d;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* allocate RAM */<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 NULL, &quot;mips_jazz.ram&quot;,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 machine, &quot;mips_jazz.ram&quot;,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 machine-&gt;ram_size);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(a<wbr>d=
dress_space, 0, ram);<br>
<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
=C2=A0 =C2=A0 index 4d9c64b36a..af56a29ccb 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/mips_malta.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/mips_malta.c<br>
=C2=A0 =C2=A0 @@ -1267,7 +1267,7 @@ void mips_malta_init(MachineState *mach=
ine)<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* register RAM at high address whe=
re it is undisturbed by IO */<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram_=
high, NULL,<br>
=C2=A0 =C2=A0 &quot;mips_malta.ram&quot;,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram_=
high, machine,<br>
=C2=A0 =C2=A0 &quot;mips_malta.ram&quot;,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ram_size);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(s<wbr>y=
stem_memory, 0x80000000, ram_high);<br>
<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c<=
br>
=C2=A0 =C2=A0 index 282bbecb24..c1933231e2 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/mips_mipssim.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/mips_mipssim.c<br>
=C2=A0 =C2=A0 @@ -166,7 +166,7 @@ mips_mipssim_init(MachineState *machine)<=
br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0qemu_register_reset(main_cpu_<wbr>r=
eset, reset_info);<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0/* Allocate RAM. */<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 NULL, &quot;mips_mipssim.ram&quot;,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 machine,<br>
=C2=A0 =C2=A0 &quot;mips_mipssim.ram&quot;,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ram_size);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_init_ram(bios, NULL, =
&quot;mips_mipssim.bios&quot;, BIOS_SIZE,<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
=C2=A0 =C2=A0 diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c<br>
=C2=A0 =C2=A0 index bc0be26544..59f8cacfb6 100644<br>
=C2=A0 =C2=A0 --- a/hw/mips/mips_r4k.c<br>
=C2=A0 =C2=A0 +++ b/hw/mips/mips_r4k.c<br>
=C2=A0 =C2=A0 @@ -203,7 +203,8 @@ void mips_r4k_init(MachineState *machine)=
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot; maximum 256MB&quot;, ram_size / MiB);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 NULL, &quot;mips_r4k.ram&quot;,<br>
=C2=A0 =C2=A0 ram_size);<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 memory_region_allocate_system_<wbr>memory(ram,=
 machine, &quot;mips_r4k.ram&quot;,<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ram_size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(a<wbr>d=
dress_space_mem, 0, ram);<br>
<br>
=C2=A0 =C2=A0 --=C2=A0 =C2=A0 =C2=A02.21.0<br>
<br>
<br>
</blockquote>
</blockquote>

--000000000000026c35059569896e--
