Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4257849wrm;
        Mon, 21 Oct 2019 01:32:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzo94UvCwLITM0XS5N9Ug8TX55SBNJDHy8MDaHwEwKESJIFBkgU/ajfit/nev48FF882DD1
X-Received: by 2002:ad4:4583:: with SMTP id x3mr23080961qvu.162.1571646753692;
        Mon, 21 Oct 2019 01:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571646753; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEMvTcKJu3+NHoePV8hS14OE8CjyyC93y07ZxbLKdtM0GFbuZ7HmhZ9PdFezYQ1Wwy
         v+8qZBmpfVGuq7ypMVNOkeg2lwM0oaBq3oz15VA6srD3ZxIN01h4pbt2/CiGN9W+oJ/5
         QZffn6gl3pEMcKvswnpZc+rXiTJzE91gCjbYVLkIpOPSM/PClamf1mkNjASTln15Oj51
         nih1GZeOUUnfVUqCO9keGMMnxyTq/70o3GiFTjjmK2WEL2yFnOXuuGsuh+w12O+4ZDYC
         4ZA5slxGIgecfVl9tR5+Gtwa267gjwyenA59hxf0gYnxOAC3KxXO+uy9ylCy895GVpMI
         spcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=P/22KlgCqf3JBNOHybe+oFIYhERC2Zxe6SN3ERBlQ0M=;
        b=CEFcV/o9S7CMx968JcoIwJFgzrFAC+E+wIqTBJR3r9Tv/YxAYQdWuSm7k3FOAgKawf
         +FIM8m2FWsnKwbkiTpkg14juyNEd6PcxSUip/ApVoSTkJd3iHYdvcCzjwHxuTixgejyW
         7gLYait5oHRUUdVzHWk76xOq8iFVxZQIgDVLCswp/2083NDXag+8QfaXspAVXVzCHoL3
         jZsgPYZjefhs29ON4fdCm3wJ1/yCA7FxuR4KwyH108xt6IZlidhBquHcBwPjv/NVr0yH
         y6umCHIEEit1ZJ1OJUZLib22iokovk0tvnm9fLBPx8v8+x88mUnghik7bJJLhJXstLA5
         8ZNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si13100515qvj.73.2019.10.21.01.32.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 01:32:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMT7A-0004EB-NO
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 04:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54309)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMT6y-0004Dh-EX
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:32:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMT6x-0006bd-59
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:32:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMT6w-0006bM-Tn
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 04:32:19 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5467286668
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 08:32:17 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id s9so6807284wrw.23
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 01:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22+CB66Y9RaGS1ZyijtNkan4x13wL2aw4SDXEvK9Bb8=;
 b=MF2KTo2rrzW4KXh4hfnkxuFwC0dc2lBkIQfpo/NhrhIw9+Tp/leV1D/Tv7OM6LmaCT
 D24XcpSqTfmc8CzgKuKlCfJzUrf/rzp9nSZ/0Bfzn2IL/IGwiuy2jpk5kNe1oxUh6akc
 kupsKWogBEnbuWsELpZJ4KofwNAkQkJ0InjuXGb8Ub9oSMmKivn0hn3nu1o8IiMvHRue
 aWL17S/+I08jjWdzKIPG7D0XTSBVfuaNUpelnYfegFuHwGiC2yc596obVy1YIRDocCsb
 /AysDXQTYBy9HnJwsXtOqZhAhnD4ytNXV97cPsk2F4S/3sFDrnlYQWa+LwDNV4VvFdHK
 tNPg==
X-Gm-Message-State: APjAAAWoKvajBlafLF32Tc6WCpNNwTACAgQXg/2lkzgyQrgpuLROiwrT
 Ve5jNHxrXTfTVVw8vrHs4QOqlucLLEddHF58jaeBh/Y6rFOQi7YeuLR3KLbGagqQbe/H9q8smb9
 fr3IqlSL7oDFC
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr17766618wme.45.1571646735910; 
 Mon, 21 Oct 2019 01:32:15 -0700 (PDT)
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr17766581wme.45.1571646735627; 
 Mon, 21 Oct 2019 01:32:15 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id u68sm17803100wmu.12.2019.10.21.01.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 01:32:15 -0700 (PDT)
Subject: Re: [PATCH 09/21] hw: Let memory_region_allocate_system_memory take
 MachineState argument
To: Thomas Huth <th.huth@posteo.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-10-philmd@redhat.com>
 <bccd05a8-43e1-e094-3e6c-e7df24cc843f@posteo.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d089a702-a458-eb46-1e66-4eb6abfb2ced@redhat.com>
Date: Mon, 21 Oct 2019 10:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <bccd05a8-43e1-e094-3e6c-e7df24cc843f@posteo.de>
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
X-TUID: qMc4YW2SwjZN

On 10/21/19 9:27 AM, Thomas Huth wrote:
> On 21/10/2019 00.56, Philippe Mathieu-Daud=C3=A9 wrote:
>> All the codebase calls memory_region_allocate_system_memory() with
>> a NULL 'owner' from the board_init() function.
>=20
> It's a little bit weird that you first changed the owner to NULL in
> patch 7, just to change the type of the parameter here and then change
> the parameter back to the machine afterwards. I think I'd rather squash
> pash 7 (and the follow-up patches like 14) into this one here - it's
> just four files that need to be adapted, so I think that's still fine,
> and finally that's less churn to be reviewed.

I haven't thought of it and like your suggestion :)

>> Let pass a MachineState argument, and enforce the QOM ownership of
>> the system memory.
>=20
> BTW, good idea!

Thanks :)

>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   hw/core/numa.c      | 11 +++++++----
>>   include/hw/boards.h |  6 ++++--
>>   2 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 038c96d4ab..2e29e4bfe0 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -520,21 +520,24 @@ static void allocate_system_memory_nonnuma(Memor=
yRegion *mr, Object *owner,
>>       vmstate_register_ram_global(mr);
>>   }
>>  =20
>> -void memory_region_allocate_system_memory(MemoryRegion *mr, Object *o=
wner,
>> +void memory_region_allocate_system_memory(MemoryRegion *mr, MachineSt=
ate *ms,
>>                                             const char *name,
>>                                             uint64_t ram_size)
>>   {
>>       uint64_t addr =3D 0;
>>       int i;
>> -    MachineState *ms =3D MACHINE(qdev_get_machine());
>> +
>> +    if (!ms) {
>> +        ms =3D MACHINE(qdev_get_machine());
>> +    }
>>  =20
>>       if (ms->numa_state =3D=3D NULL ||
>>           ms->numa_state->num_nodes =3D=3D 0 || !have_memdevs) {
>> -        allocate_system_memory_nonnuma(mr, owner, name, ram_size);
>> +        allocate_system_memory_nonnuma(mr, OBJECT(ms), name, ram_size=
);
>>           return;
>>       }
>>  =20
>> -    memory_region_init(mr, owner, name, ram_size);
>> +    memory_region_init(mr, OBJECT(ms), name, ram_size);
>>       for (i =3D 0; i < ms->numa_state->num_nodes; i++) {
>>           uint64_t size =3D ms->numa_state->nodes[i].node_mem;
>>           HostMemoryBackend *backend =3D ms->numa_state->nodes[i].node=
_memdev;
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index de45087f34..3b6cb82b6c 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -14,7 +14,7 @@
>>   /**
>>    * memory_region_allocate_system_memory - Allocate a board's main me=
mory
>>    * @mr: the #MemoryRegion to be initialized
>> - * @owner: the object that tracks the region's reference count
>> + * @ms: the #MachineState object that own the system memory
>=20
> s/own/owns/
>=20
>>    * @name: name of the memory region
>>    * @ram_size: size of the region in bytes
>>    *
>> @@ -38,8 +38,10 @@
>>    * Smaller pieces of memory (display RAM, static RAMs, etc) don't ne=
ed
>>    * to be backed via the -mem-path memory backend and can simply
>>    * be created via memory_region_init_ram().
>> + *
>> + * The #MachineState object will track the region's reference count.
>>    */
>> -void memory_region_allocate_system_memory(MemoryRegion *mr, Object *o=
wner,
>> +void memory_region_allocate_system_memory(MemoryRegion *mr, MachineSt=
ate *ms,
>>                                             const char *name,
>>                                             uint64_t ram_size);
>>  =20
>>
>=20
>   Thomas
>=20
