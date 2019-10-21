Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5223712wrm;
        Mon, 21 Oct 2019 16:26:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybMri98IK+JemwNXo9wbZQTQbPzqJSL3TZEa3XrJM5AUjFSjrCeGeuUo34KLxTv7Nei564
X-Received: by 2002:aed:3b3b:: with SMTP id p56mr400838qte.200.1571700395494;
        Mon, 21 Oct 2019 16:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571700395; cv=none;
        d=google.com; s=arc-20160816;
        b=JC7OvzkygWoZjWb1GjN5ziJMzl3lx43tgXxdheAxiehCDdHIO2ktuuIJv5lZfpcuzK
         Hp8+NZ8TDiNFFvmnXGE5RUkqEclAuLYrXxWQs2ViJv0AY83jITClMLgTHPFhQvPN6zda
         azhW8Nla8rZr8AISuYlxyq1cN/11Uw5BATk8kMYVStDJdE2qDI3jDAZYfuJur4yHv4ps
         AuVSSnRuioYNqUpdl93rYugjdwCQuHN5dX+rdbabR+ILerZxqDnz34v6f0vPEdDau1by
         zUGadfnwfi7ytHQWLudGZcRIHqrrosAgaho36ZKKf52k09fI3cQuCqZbR7nnhdSrfGpB
         3gCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GaEgKiOTRPFRJ37OiN1hvkJxw/u1/Kb5MqxlT0C/VMI=;
        b=nU97T4OIEic/A1uMnM19nZqHepDUnphSVwqmV5qt8QDwKAjP9MMw4Qwd2ylNuJwK/D
         rND5sIUZFVLctBozjHotyD++WhY83rbmM8UpwH9PgH3iK0XKKFzvX+dMu47Z9BsEDPlZ
         kjeK/H+ljRUxrBhcKj58B0yYpnXLdZRTTXfNzUvSfvQKZJ/YGmYoN3y/X6WzMIV+71xN
         SqrowJbzTy0zQ0ZqOQvEL0TEZN6N9dfJzGlwKaIJHGIQs340b+fuVLamMhSjKU/q3neI
         10a2Fjz9d3oB6m4jJ5UpeW/WZ1EbBiXnlAf9AxoQcPePeAzY84GiU6qeCwqc27HBzkoD
         SZkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSSKKzPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si14094423qkv.110.2019.10.21.16.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 16:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSSKKzPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMh4M-0000Jb-TH
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 19:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMh3b-0007nE-U0
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 19:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMh3a-0001IA-TT
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 19:25:47 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:42536)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMh3Y-0001HM-Ij; Mon, 21 Oct 2019 19:25:44 -0400
Received: by mail-lj1-x242.google.com with SMTP id u4so1003197ljj.9;
 Mon, 21 Oct 2019 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GaEgKiOTRPFRJ37OiN1hvkJxw/u1/Kb5MqxlT0C/VMI=;
 b=ZSSKKzPsxHR5c2WGJH1+TUWql6nPtQkxaideGD7J/Lw5Dl2+Srg+c3xiHuTO70agfY
 rbcP/Faa55qYgs2+uOoPdf5A+SY7JQNOxYfHv87D97ng8PnldR2qUmQ9/oJ6ym4RukYS
 P0csxAmOPMSG2Rv561ymDDuTvW6wdst+Gs1x2pT9Lt1y6UDQUOHEegSjYRT0aQEcpRdo
 isdJcORSw3kg5ms6qCj9A4JCUuFzmE/sqaAi9YH1JCMwWzSUjJrqYc4GpGsUXr5ztHKe
 uBX3wcGj4VlaqWpnH6lj2qfimH5PCoF0w7eiQB/auJPz9YvroNORqcvzDUoc6ViMcbza
 xhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GaEgKiOTRPFRJ37OiN1hvkJxw/u1/Kb5MqxlT0C/VMI=;
 b=PN/FDBD2RKsIwo6UltgtS4uN5/1esj8cgL5f/ueJIcRXpIzBgYmQYCBAMT6QPRBnQN
 50147cTHxlKoStHIumtqp/2c/sdEGEXkwY/BaIAanVIrK5I7QL/1bQW1js3lB1Gth6NY
 QxoNiUJwRk+CmrmjNmTfBUCxf7O26yxsbkrC1jQf+yg9SXph0AScc/pO8rKzMudtN6Tn
 cq/ZzV/WZ7SU61DnxrSPuBu8q8bQSldOSbzHqT1c9D9sjfwla+2JjjtVBx3Jhj1tqk0K
 KVl35wLzL1IC9a2N4JmjsvOt4PtgLe4Y/bBiW4hYZJI9r4DqR1r4woTIi/xrriZA5v2f
 MqHQ==
X-Gm-Message-State: APjAAAW1wZfwFeJK+4qHm1W/wDO1Gd4eEWiPD2q8qQTYdYL+yCNFSEZw
 Eog53mZJ5bllDdAXX3w8WfX77xKrxBr/IkGPbxQ=
X-Received: by 2002:a2e:894b:: with SMTP id b11mr16472078ljk.152.1571700343037; 
 Mon, 21 Oct 2019 16:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-11-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-11-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 16:20:27 -0700
Message-ID: <CAKmqyKNhMo5jBh=y_F+-M+J+AHp+k=AtYsVMCFZbhfrCR0dqCQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] hw/core: Let the machine be the owner of the system
 memory
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
X-TUID: L5/h0+RZUQVB

On Sun, Oct 20, 2019 at 4:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/null-machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index 1aa0a9a01a..16546c8140 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -35,7 +35,7 @@ static void machine_none_init(MachineState *mch)
>      if (mch->ram_size) {
>          MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>
> -        memory_region_allocate_system_memory(ram, NULL, "ram", mch->ram_=
size);
> +        memory_region_allocate_system_memory(ram, mch, "ram", mch->ram_s=
ize);
>          memory_region_add_subregion(get_system_memory(), 0, ram);
>      }
>
> --
> 2.21.0
>
>
