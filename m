Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5095148wrm;
        Mon, 21 Oct 2019 14:06:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvAm+OPq5768YJwjW4ku4ImUjbtYf3ZW0aJcRU8GETq6CVfl/Z97pDatb1AMU8LagsHyB5
X-Received: by 2002:ac8:7a97:: with SMTP id x23mr16978251qtr.38.1571691974741;
        Mon, 21 Oct 2019 14:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691974; cv=none;
        d=google.com; s=arc-20160816;
        b=MyGV4Mjn7kbpnWP8kEbyzf7u+eZb3nsjFUvxX8Dtxlid0mPPH5IfkqssrPNvWyD5l0
         7Ofr4u8r/YKTRWz/oFJIu58Hd3mzKCOzTEAeR0Utw/XCnYwkdCxkJmodgJ5E+g5s6Dgc
         JscTw4fXttHV6qJEPsRFHwjT9c4XMc7n2RsJe9q5nhmWXoi50kR6sKL3VVaGIIYrLxN4
         oZ5jwrZhxLhjCNFaweIHLVB6bvBxUn2IGB6gxjtamfHQAIBb50z43FSQeTbWHENZa1xQ
         pPvX6BqQR/gsJiNHY3kH9+7o0X1+gOPKUKgSCT0n2qmC7evvXWPoHUkP3doxZs+7lM0/
         rKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HHLNUJcgizwsCjrccvpMTH9xPKsLvXCG9xhUWPKSHUs=;
        b=ZQ/iAmHTFxQJ2HHsE7UloJHrnbmT/kXUCFLNL3hx99KhMe5bnq81Ij06msyw8ztnm7
         4WA2INZ/eTnvX6ouGelfTfPOmqUrWisbbcCx93t9uVLuE9+2x2jrdqRBUeNwelvLImhQ
         ViKi2vxD/BtnXnFjlP/KTMj9tyRYo4ViabRWUmKXUaH1NYx+cwb86fghY65IIDPfRsKw
         cacFt8gMbEiicfwL8LEtJIaDbfPlNZcrKwWxdRZUsGYjFN9/0FENa1Zj3xPapHTv0KRX
         CWm1/71AZIInJvKleLQbJBfIty6dEORVZCdAdObaxgDr4E2DNpdP3Ek9GQT7hq7hsAH4
         uR0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l4zRQ30o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si5522487qtz.64.2019.10.21.14.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 14:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l4zRQ30o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMesX-0001F7-Ko
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 17:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMes8-0001Bk-7k
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMes7-0001mE-7h
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:05:48 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMes4-0001lE-UN; Mon, 21 Oct 2019 17:05:45 -0400
Received: by mail-lj1-x242.google.com with SMTP id y3so14863035ljj.6;
 Mon, 21 Oct 2019 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HHLNUJcgizwsCjrccvpMTH9xPKsLvXCG9xhUWPKSHUs=;
 b=l4zRQ30oL3sL7kvxOlPXyHeCFa8eLoxVWyxVYm6U7cfax8NI3o0zKyW3IBFu7R7/3T
 Zh9mWjgaCv17NAYoV+IG3C5EGSxqhBMGCUXnnh1fJ/9yjl+ZZiW1GK7rw8NgGwOrawVk
 Fkq2CCGMaIyvfv6b4DKqXBZzQmVaDNwryRwILNphqH6xD9ZoFcdGlBZFjyWK6L1hShfh
 dYZ9TIt+9h8fVhS772Y+f2yY3YvyDT1X21lHkoiEqdYsdd4owo4TisfwAOIHKqK+c9LD
 Iw5AAg1bg5jEQJXzG11/isw17O4iqayJqL76oMtZB3C7hqTFPDaHqeW5BVM2gQh1nWk0
 HXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HHLNUJcgizwsCjrccvpMTH9xPKsLvXCG9xhUWPKSHUs=;
 b=HJmvuSZ93Xg8DgCtQsooaKVM9m3EM+ArXYtq2YynZX8NMWFiItTYIy2HUU2zMyXX5M
 QEkVdQnNeFin5q//9pxqU/5HeSe1lmTW1NySxIBUP1iGU+H2k1G658RgPvj4xrfauTtn
 BYQND3ebX/5gbYnLqpcUQ/zCCtL63wpkIQYsUbT5RU4c2zhgp4pe+FhINpw7N2In1dgQ
 AF8KPzZLWG6BuGNEINs3ttDWHmOkbDs4mPHI36sJ2XcrmYYs8t1SlvmYgEmMLWX3enGy
 nBtqKf7b1pEOdSTDWRJ88MDs3SdbEK6d0Q9lSQ9kdQZgi2CmXVxaSe53qRK+GB7PHQwi
 /lTw==
X-Gm-Message-State: APjAAAXv3JOR4OJznI/KiGguMnzBFSVMu4gwtw+Jjgontl7qiS4sbp5H
 scxzzS8tIh8kADFP2l6fDN13ARvElMNEy2r1Tvg=
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr16138627ljm.7.1571691943442; 
 Mon, 21 Oct 2019 14:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-22-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-22-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 14:00:27 -0700
Message-ID: <CAKmqyKNtTMtjVjJdyCLb_WN5w12ZKV3jMrz1E0rFQ1DBMY1cdw@mail.gmail.com>
Subject: Re: [PATCH 21/21] hw/core: Assert memory_region_allocate_system_memory
 has machine owner
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
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
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Fabien Chouteau <chouteau@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6G/ctn6rT0VH

On Sun, Oct 20, 2019 at 4:22 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> All the memory_region_allocate_system_memory() pass a MachineState
> argument. Add an assertion to ensure the new boards/machines added
> set this argument, so all system memory object have the machine as
> its QOM owner.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/numa.c      | 4 +---
>  include/hw/boards.h | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 2e29e4bfe0..3e07e94d00 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -527,9 +527,7 @@ void memory_region_allocate_system_memory(MemoryRegio=
n *mr, MachineState *ms,
>      uint64_t addr =3D 0;
>      int i;
>
> -    if (!ms) {
> -        ms =3D MACHINE(qdev_get_machine());
> -    }
> +    g_assert(ms);
>
>      if (ms->numa_state =3D=3D NULL ||
>          ms->numa_state->num_nodes =3D=3D 0 || !have_memdevs) {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 3b6cb82b6c..31ab6e7586 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -14,7 +14,7 @@
>  /**
>   * memory_region_allocate_system_memory - Allocate a board's main memory
>   * @mr: the #MemoryRegion to be initialized
> - * @ms: the #MachineState object that own the system memory
> + * @ms: the #MachineState object that own the system memory (must not be=
 NULL)
>   * @name: name of the memory region
>   * @ram_size: size of the region in bytes
>   *
> --
> 2.21.0
>
>
