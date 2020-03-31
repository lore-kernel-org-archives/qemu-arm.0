Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4203396lfi;
        Tue, 31 Mar 2020 10:03:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsIaOkvB/KVXs6MjZq3ZieeQnOAfcAWAZYrHntXAqW1ttm6qT6WAx3wHEohfO+wu6VTxP+O
X-Received: by 2002:aed:21c5:: with SMTP id m5mr6043725qtc.42.1585674183200;
        Tue, 31 Mar 2020 10:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585674183; cv=none;
        d=google.com; s=arc-20160816;
        b=NnNwb7lCfNQgz0x89O74b06yR08YX0i/ftOypBMPAp+iNoavj+QftsKfPOpgCCBK7m
         S8KSonpf3jGQmiUGcNaC8DURkycMrRSpHMpIdXpQHC0AJvcAPPDM7IDM0mZkJrk36LQi
         bTZBIXyShXCNsH8paD2JjKXx8l0oiv9SvjvHEUmLCBwG4SVLljt7VybmPNh/tw5D0vfF
         8V2RazI7BpFdWk6H9tokhaz4XqQVsbbsBdwo+af9u8C5yuIEf//mjiejMD0G/Xeh2ocV
         QPSK0JWssVoJy5bEd6MLh561DS8k+KnTugFg5aBA1fPEXFmkl2fKBc7bL/eXgVhbkyS3
         mF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sSTIpBUhuW1l8WUYuT333335bgK+YqNtERpWuDFuBwM=;
        b=bkOA1L2/mEO9t6WN5sBnZTXMHp6ibZAjl6bqdAE4PmdZgYtBldAn0wPYA+2PWjGFab
         Fa/Hd5axMMorm+San9zzBqB46jJZxNf2Tb+oucMQVOC6DZOZaclz0tK7gb+UyNx7Kcqx
         s7DdNhUVaWXz7DhuCdTjU8TBfOT0eOEqAqhMtMNyQOG2q8H1OsngeN6KaOgDzJf6z0O7
         R9i8U8TvmDJ6+zcjb1LYlbfuJrYk5FCbSVHBRrN+3iVL3RQHvQ/xpNVJnizHsUMWDT+p
         PjSAuqA8JifhNiuGuQj6fryY5tCj3fBvFwPzYeCPu4D8x3ncj7XnfRwYBGEV14f+JTT/
         S0fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LfP+cyv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 196si10211516qkl.55.2020.03.31.10.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 10:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LfP+cyv2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJKI2-0001jG-IO
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 13:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jJKHl-0001eT-J3
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jJKHj-00080c-Jo
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:02:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47630
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jJKHj-000802-G6
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 13:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585674162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSTIpBUhuW1l8WUYuT333335bgK+YqNtERpWuDFuBwM=;
 b=LfP+cyv2U8etgFNagBiS52sCW6hWG5S03iuA3e4HjLggZewUk6JeB5WFbhU4WWhiwrfE8p
 A+MwF2uGHq6SSHf4VUBFNukp2pY1omI2fXJq8MC08AbCOl5XW2ai2Rz3c7cDZwEJskOtpK
 uHtAAy6O2DNcpwarJr1JnvxLNHnud+w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Uo7wSZXTMZGHcWEkKtt5xg-1; Tue, 31 Mar 2020 13:02:41 -0400
X-MC-Unique: Uo7wSZXTMZGHcWEkKtt5xg-1
Received: by mail-ed1-f69.google.com with SMTP id k7so19143106edn.0
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 10:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxPUOgxhW5CqurI1DXhkKMNh+pzCFBxZDrmIuW5r3m8=;
 b=WFakDMcNSBc6uL0zQGdS+Lgh2F73FRrcQDKU3HiXt4FlV1K2J4DhMT9B0D0Khtf0uy
 afush1c9RiRVM1urGN+zI6H/j5C6Cssvfir8hpRfnHbAh9k6M+I0weYB5kwU8plPgXN3
 oOKS5cF4kT6NwjfPvfs9peZiTnJrsPJ+gXTixEzdiJpeeDmixL9QR6FgJl1KcfCZBnji
 FNUB8lIg9fKXylbjMsYdpBEB0oXz91KlXRSXsQzjj//z+rnlGGj5QeM2XD9T9/8vgsFH
 9Cbspvud73wCvR9UQW8wfwgOB0/8nq+r+O1xi/vILbux3dXjCXNkIpJ7+yxn45DAnTSJ
 QTTw==
X-Gm-Message-State: ANhLgQ3rGuIP5Sj7U7czAx1HXxLstr0r7mQ1nqZ9Es0Jbul+UPA2y8ex
 B8vk3YTTM0/q/0NkisTtI4FE0zpJGjcMq0ZRNjgIjbi07zUTI6eI84uPWmlM3xrQTKt1l1FX9rM
 ELgrEeRtPpBXX
X-Received: by 2002:a05:6402:206e:: with SMTP id
 bd14mr17555603edb.308.1585674160000; 
 Tue, 31 Mar 2020 10:02:40 -0700 (PDT)
X-Received: by 2002:a05:6402:206e:: with SMTP id
 bd14mr17555541edb.308.1585674159661; 
 Tue, 31 Mar 2020 10:02:39 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id j19sm2247453ejx.75.2020.03.31.10.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 10:02:38 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 12/12] hw/riscv/sifive_u: Add missing
 error-propagation code
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-13-f4bug@amsat.org>
 <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
Date: Tue, 31 Mar 2020 19:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YPkt2Yw+MGyt

On 3/26/20 10:55 PM, Peter Maydell wrote:
> On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> Running the coccinelle script produced:
>>
>>    $ spatch \
>>      --macro-file scripts/cocci-macro-file.h --include-headers \
>>      --sp-file scripts/coccinelle/object_property_missing_error_propagat=
e.cocci \
>>      --keep-comments --smpl-spacing --dir hw
>>
>>    [[manual check required: error_propagate() might be missing in object=
_property_set_bool() hw/riscv/sifive_u.c:558:4]]
>>    [[manual check required: error_propagate() might be missing in object=
_property_set_bool() hw/riscv/sifive_u.c:561:4]]
>>
>> Add the missing error_propagate() after manual review.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   hw/riscv/sifive_u.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 56351c4faa..01e44018cd 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -473,113 +473,121 @@ static void riscv_sifive_u_machine_instance_init=
(Object *obj)
>>   static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>>   {
>>       MachineState *ms =3D MACHINE(qdev_get_machine());
>>       SiFiveUSoCState *s =3D RISCV_U_SOC(dev);
>>       const struct MemmapEntry *memmap =3D sifive_u_memmap;
>>       MemoryRegion *system_memory =3D get_system_memory();
>>       MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>>       MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
>>       qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
>>       char *plic_hart_config;
>>       size_t plic_hart_config_len;
>>       int i;
>>       Error *err =3D NULL;
>>       NICInfo *nd =3D &nd_table[0];
>>
>>       object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
>>                                &error_abort);
>>       object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
>>                                &error_abort);
>>       /*
>>        * The cluster must be realized after the RISC-V hart array contai=
ner,
>>        * as the container's CPU object is only created on realize, and t=
he
>>        * CPU must exist and have been parented into the cluster before t=
he
>>        * cluster is realized.
>>        */
>>       object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
>>                                &error_abort);
>>       object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
>>                                &error_abort);
>=20
> Different bug noticed in passing: these really ought not to be
> using error_abort to realize things, as realize is a fairly
> likely-to-fail operation on most objects (either now or in
> the future if the object implementation changes).

OK.

>=20
>>
>>       /* boot rom */
>>       memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom=
",
>>                              memmap[SIFIVE_U_MROM].size, &error_fatal);

What about this memory_region_init_rom() call (and later=20
memory_region_init_ram) using error_fatal, same reasoning right?

>>       memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].b=
ase,
>>                                   mask_rom);
>=20
>>       object_property_set_bool(OBJECT(&s->prci), true, "realized", &err)=
;
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI]=
.base);
>>
>>       object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>=20
> The changes made in this patch are fine though:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> thanks
> -- PMM
>=20

