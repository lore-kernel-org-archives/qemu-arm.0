Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5091343wrm;
        Mon, 21 Oct 2019 14:02:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYP68sJxqNdvliD1bmFUMuyaztxIDoL010/ySXyg+vBaG4PkRi8xOghDvY9aWg4E4ReKd0
X-Received: by 2002:a37:bf02:: with SMTP id p2mr14331850qkf.42.1571691750464;
        Mon, 21 Oct 2019 14:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691750; cv=none;
        d=google.com; s=arc-20160816;
        b=DnUv4Hbwf3y3zUnkpRDYBta8Mf/5iCrXfTHbiL0KQSzzQEuZMBeD3Sd2XVRpWfEe4J
         qOFjodYPs0Mb4YBFkaICIjeHCkX9UPjxUjwHOF2GxALEiyI32Iznblc7uEheXDC+k4KY
         ET+dZB/okQBsyPeJWeRMFt2ZaiimBOQ0v0sijBGWqLydWokJol2/uc6l5VHp6V0kh13S
         8FHdcgOz9lrs8/iAxx2nN6mHIHF1nbHHfs19hlgg0z5OYVRShBtHJr8lWHE+QkS7CPnB
         ZUtZiWVJzYXbIKa00LsoQJFE/9dbMDo4nqLOaubeW2sxXbAJJadsU3vV1uL9TykLeuo6
         ynxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ooguhNRX2r9YbvJtC1Q7wtQv8RPkIuUAM30NOTdaMDo=;
        b=jsvAd2fBQyXUpKdfCw/tO8EaMT0XTHKFOQUes5RuXU6z9B0XNJhPKGXxHAqnfwjgUh
         NeEPySaVCirSur5/0JUvM61fJHKBuoo+Dy9vh00QbxAF4PNdSCyQiDGFisu5umLaBy/r
         XIFEUykf/ZskpCWCdgMtNbqAKL6FwrMxXWkAij6f55jF6u4kcEcWuQ9ImYwQcpTYEcfR
         4cB0YdLXimYv21AyBfitqmI7cV97ftw8zQBusKhok2E3kx0WEWoIftlz9oH5aPV2UU5h
         a7QBrO4m3B0v3rLOUqL03XPmwgoKtT833RXF1A1uwag9TlzaEdB/Zqh8P9T/VomyBML0
         jDkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SWEvK1J9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si14900124qvf.145.2019.10.21.14.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 14:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SWEvK1J9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMeov-0006gX-KH
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 17:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMeoM-0006cL-DG
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMeoL-00081E-DR
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 17:01:54 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39906)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMeoJ-0007zk-0b; Mon, 21 Oct 2019 17:01:51 -0400
Received: by mail-lf1-x143.google.com with SMTP id 195so11247356lfj.6;
 Mon, 21 Oct 2019 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ooguhNRX2r9YbvJtC1Q7wtQv8RPkIuUAM30NOTdaMDo=;
 b=SWEvK1J930fJUVflAZS8jonqNaGxGogybqkrT0rrxvc3vJAAanCrVsuo7VpSzACpC1
 Iy8rlLmJ87pQtGKZYWzFasPL9HX8A6rvT7+/4FvTqqocUt7YlBfrmo3bS/DLAFacsmxb
 r+NpPoNX/1skQ8KvFxw5hvYReYJpqtUObvhEsah436C/zEacRE/GS+hbVPS3jvmnH44+
 mqfLkwQQHO84bOseu8UqaES0b0XupLHoxIxRY1Ne1fafbOe55iwbF7XUn4p+21MmAGl6
 3Odi9yQV31F4VxQPgPmE2IZ7t3Nh5yQScRqupUk8JKeGxNWrulYiTjPAo8d8toe5CZHf
 CAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ooguhNRX2r9YbvJtC1Q7wtQv8RPkIuUAM30NOTdaMDo=;
 b=TP+Rn3O07Ozj6pN5etoil+h+bcWBFsqQ5NjfyKHzMWKUMfV8JN0IVHtEvjhfNuEXAN
 P5Ep8XaV7HnPJH55PC9PrSL2+tkQN6TIST3NQot91lbzsNhRPWrC9akQFJQPa0wDefhg
 WkoXXTP9dSOQiZBxh5Ce0dW4rGD4uJu8fDkZdwhC92MMOYcBmSjO/wwnJaGuOvVVyquE
 RGluUso6YsCAPzOMVuQCXfNlgpyYLp7D08Xn+uyAq4mPUpS7LTfe3ui39e+9QoPOP314
 6Kg+p7XHsunNGOUSqc8na9Jp2p+pMgLN6e/WdC3eQcjxzCC/Y/IJ4VuN1ifKpXKOmUeP
 bVhg==
X-Gm-Message-State: APjAAAXo5fyL+bn09FDG8k8wxx9IJ2bmTm/dRnmZGeeBVuh/9v7cfXAO
 oNESQJzwsA40yiZDBRKy2Vz5dgHSS4YdiXgMwcQ=
X-Received: by 2002:a19:ac01:: with SMTP id g1mr16437498lfc.141.1571691709644; 
 Mon, 21 Oct 2019 14:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-15-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-15-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:56:34 -0700
Message-ID: <CAKmqyKMZQevuhDrbq72uSA589HMoae_Jm9HeGt-EOY--M6wfFw@mail.gmail.com>
Subject: Re: [PATCH 14/21] hw/hppa: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-TUID: rB7FKzfWIi8B

On Sun, Oct 20, 2019 at 4:17 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/hppa/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index dbe1ff0fe5..6703bfd351 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -96,7 +96,7 @@ static void machine_hppa_init(MachineState *machine)
>
>      /* Main memory region. */
>      ram_region =3D g_new(MemoryRegion, 1);
> -    memory_region_allocate_system_memory(ram_region, NULL,
> +    memory_region_allocate_system_memory(ram_region, machine,
>                                           "ram", ram_size);
>      memory_region_add_subregion(addr_space, 0, ram_region);
>
> --
> 2.21.0
>
>
