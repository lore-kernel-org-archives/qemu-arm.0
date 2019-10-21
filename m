Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4198008wrm;
        Mon, 21 Oct 2019 00:30:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxCgxIOo0vfkiO+Uqg17SFglhw5kiNBQHVOgRx1dBW/EsBRYnPmPQ32ywW3KTyveowsRIn
X-Received: by 2002:ac8:67c1:: with SMTP id r1mr21987610qtp.83.1571643034831;
        Mon, 21 Oct 2019 00:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571643034; cv=none;
        d=google.com; s=arc-20160816;
        b=MPKoAQSZso1hwI77ujvsZLbxY1hBBcMtFIibF8fRXu0Fi3e2Bz0LMQoyBy4SZwab4j
         2CRwdQEp0QRefTtiqy8EDDc38wJHLRLsOjPKiubzC7KzWuSU3i2wVUTUvX2wsd9hdfKq
         SWXxlNELCr8YcE1z3STWX6PD9XMbVLVPw3sWyYz86l+jOw0xLmlbqXkjWEGEo99yos7y
         S49PeZZUYG14pNnOQY7CZ7MBvgyP/JqVg2t769lVpCYbKSxQKDzFlQNjgCkjvWucUe/c
         qRbcMnNlklUVvghLKH3zMK5Pfclsa8nI9t7ddcNk05IzrxL2DvqIy5lQ5gNurnKI5MKE
         XTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KT/i9R2El/msp8QtQyLUWiZGBdJmQwK1th7ZZYSf2wQ=;
        b=KPiHm+GTUSpNDqSYJn7yQhijNkVPw5JhkrETQdc0b8DUHaapHeUrNMri+hfEfp4KIJ
         vSZEcIq9ncpT20/t5LCMkYcFu3S3hERI5WOgzPwIa4tdAkCfdllXDGL/alQl6Qq+//nN
         ke+dQmXQXbH3S7bIfn3Faq6rH77NDgig8Nwg3iRRzntAp4Q/jE67Izhod5DBjIKnmCOd
         oQH7t04hDfNRTD3mpfzrSO5r9rrnqS0EGImWBQMSzcRIqRGox5b78FxNGiZypQ655FMa
         n09xVQB5p11afFKXaElTtlqnKJ2an7mv0vaBLPWStjgnZr3dlyz73V6US9b+slcF3AJ6
         Arrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@posteo.de header.s=2017 header.b=Y5L9OMPF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si7617077qkf.21.2019.10.21.00.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 00:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@posteo.de header.s=2017 header.b=Y5L9OMPF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=posteo.de
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMS99-0000db-UU
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 03:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <th.huth@posteo.de>) id 1iMS6u-0007km-Ux
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 03:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@posteo.de>) id 1iMS6t-0000Xx-55
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 03:28:12 -0400
Received: from mout01.posteo.de ([185.67.36.65]:48257)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <th.huth@posteo.de>) id 1iMS6s-0000WG-Nn
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 03:28:11 -0400
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 12FC2160061
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1571642886; bh=sMqAVjhAO5ZJUZASP/ngQiG8dr9TKHjo23TxbW1QQHk=;
 h=Subject:To:Cc:From:Date:From;
 b=Y5L9OMPFO93X5ZTIGh5GzQfu53SToFNuTcf1Mfu9B9WdUKpE4OBJsqsHuZlPanxYu
 sVf5eY3lakVcSBBSnFhWyxHtK1A4ZGLmI1SvXynE9XhLeYgaiWpz45t02Zo7vwvyG/
 MWoroa5Y275K2beF0f78an+IsTxUBQKnAjHozD87jgZjvzlh2EILHp7ert/sGhlnzX
 KRxp4RCALgQ0jFA+MvrnOP2GwhKVwUqJQpFvmvcYR3dlbabG6Yc4YnNNi+KfMk+MJk
 CG/H+RR7Xkw4tke+OgYqzK5HK2AYXNcToC+QvZpnL4YHFBLErOH17KWOZF61Qtwim9
 A9Jfz5XMjJpVg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46xSsS442wz6tm8;
 Mon, 21 Oct 2019 09:27:56 +0200 (CEST)
Subject: Re: [PATCH 09/21] hw: Let memory_region_allocate_system_memory take
 MachineState argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-10-philmd@redhat.com>
From: Thomas Huth <th.huth@posteo.de>
Message-ID: <bccd05a8-43e1-e094-3e6c-e7df24cc843f@posteo.de>
Date: Mon, 21 Oct 2019 09:27:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.67.36.65
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJ0NCZA9U7os

On 21/10/2019 00.56, Philippe Mathieu-Daud=C3=A9 wrote:
> All the codebase calls memory_region_allocate_system_memory() with
> a NULL 'owner' from the board_init() function.

It's a little bit weird that you first changed the owner to NULL in
patch 7, just to change the type of the parameter here and then change
the parameter back to the machine afterwards. I think I'd rather squash
pash 7 (and the follow-up patches like 14) into this one here - it's
just four files that need to be adapted, so I think that's still fine,
and finally that's less churn to be reviewed.

> Let pass a MachineState argument, and enforce the QOM ownership of
> the system memory.

BTW, good idea!

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/core/numa.c      | 11 +++++++----
>  include/hw/boards.h |  6 ++++--
>  2 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 038c96d4ab..2e29e4bfe0 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -520,21 +520,24 @@ static void allocate_system_memory_nonnuma(Memory=
Region *mr, Object *owner,
>      vmstate_register_ram_global(mr);
>  }
> =20
> -void memory_region_allocate_system_memory(MemoryRegion *mr, Object *ow=
ner,
> +void memory_region_allocate_system_memory(MemoryRegion *mr, MachineSta=
te *ms,
>                                            const char *name,
>                                            uint64_t ram_size)
>  {
>      uint64_t addr =3D 0;
>      int i;
> -    MachineState *ms =3D MACHINE(qdev_get_machine());
> +
> +    if (!ms) {
> +        ms =3D MACHINE(qdev_get_machine());
> +    }
> =20
>      if (ms->numa_state =3D=3D NULL ||
>          ms->numa_state->num_nodes =3D=3D 0 || !have_memdevs) {
> -        allocate_system_memory_nonnuma(mr, owner, name, ram_size);
> +        allocate_system_memory_nonnuma(mr, OBJECT(ms), name, ram_size)=
;
>          return;
>      }
> =20
> -    memory_region_init(mr, owner, name, ram_size);
> +    memory_region_init(mr, OBJECT(ms), name, ram_size);
>      for (i =3D 0; i < ms->numa_state->num_nodes; i++) {
>          uint64_t size =3D ms->numa_state->nodes[i].node_mem;
>          HostMemoryBackend *backend =3D ms->numa_state->nodes[i].node_m=
emdev;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index de45087f34..3b6cb82b6c 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -14,7 +14,7 @@
>  /**
>   * memory_region_allocate_system_memory - Allocate a board's main memo=
ry
>   * @mr: the #MemoryRegion to be initialized
> - * @owner: the object that tracks the region's reference count
> + * @ms: the #MachineState object that own the system memory

s/own/owns/

>   * @name: name of the memory region
>   * @ram_size: size of the region in bytes
>   *
> @@ -38,8 +38,10 @@
>   * Smaller pieces of memory (display RAM, static RAMs, etc) don't need
>   * to be backed via the -mem-path memory backend and can simply
>   * be created via memory_region_init_ram().
> + *
> + * The #MachineState object will track the region's reference count.
>   */
> -void memory_region_allocate_system_memory(MemoryRegion *mr, Object *ow=
ner,
> +void memory_region_allocate_system_memory(MemoryRegion *mr, MachineSta=
te *ms,
>                                            const char *name,
>                                            uint64_t ram_size);
> =20
>=20

 Thomas
