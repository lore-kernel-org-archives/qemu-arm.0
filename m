Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5086248wrm;
        Mon, 21 Oct 2019 13:56:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzairf4HxLFr6ZYXDm+ddmowGAY9oTCsui+BSCcVeSTDk9NF9rURjnF76PHRpbBGtP9gAJj
X-Received: by 2002:a0c:ee8f:: with SMTP id u15mr26046063qvr.0.1571691419737;
        Mon, 21 Oct 2019 13:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571691419; cv=none;
        d=google.com; s=arc-20160816;
        b=Tqcnk7C7/H79DJJVnvEfHGkqS/f/4SJx6kPXxwxtggDqFVfGz+l5JeKgE4z/56kPC8
         FH8fufq1z1SWYtTvZHrP6fL2LkJ0S+VpKi8eZJqAVK4wUEh2FhvrB905BhsQwOI0zuC6
         a8xeT+avbfU1ulWBaKRvwL9J5rAypF63Xkk6SyVdBR0g7cXl7QXWxBsoHXwgZpM4n2/5
         0s4hPoQkuSqVpxveMTppVl5SN4oEkp6s0EPYxABiSnaBl7C1dt4kQQ42UUePVvtBqq0d
         h4NAZ8d0CjDK1RoQ9Fdy9OCn7RtDHprxl+/9ULL49vaSs9hOMKT7SyjlUQmhhuSUhzWy
         ACww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3Tk342f2DcStfjZLw2ZHCFQBn5YgGbRBBcgwXLtH6i8=;
        b=f222qF3oMwQq5uPSDP06aY8JwaJJjfg+9iU6isOtZ8W6x+kifcmkIN5AZipXABn1dn
         HkR/cjlD/M1XIqEh4uaZTHK9f7TD8eSV1I3I3RDn9k4d/3gN7bezFs+JqRcJr9Yw7Ki1
         YuviyV8q6YBkcTfNaczl7E8vYzU4AypSWRk/NVaMmlWmC5XuF1yyJ2Azl+vMqZcauOxL
         8ABscT7VQRRvzMYOX+B0Sltq2ywaZsSYfxyj/RjUzb6w9LmElD2MPuEJLP4oZ1xYKnKl
         KuyplbzFVDonoFn4zh5zLOX/4mjSIXBsqg4A1uQ5Jt41atqf+D2On69ycznXuQ8JQAsp
         29pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DGHXapOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j68si13672940qkc.379.2019.10.21.13.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 13:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DGHXapOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMejb-0002TQ-4U
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 16:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMejS-0002QM-JX
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMejR-0004xF-Ie
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 16:56:50 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42782)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMejP-0004sZ-D0; Mon, 21 Oct 2019 16:56:47 -0400
Received: by mail-lf1-x144.google.com with SMTP id z12so11234738lfj.9;
 Mon, 21 Oct 2019 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Tk342f2DcStfjZLw2ZHCFQBn5YgGbRBBcgwXLtH6i8=;
 b=DGHXapOfedWnXux0qmsHTjTBFeaHjRaU3O3dHuhcArSbFG9/UMoPbtV8fJIZ4vXduw
 Dyx8ecx36HMCkZSDYVxCpS8Y2T54fxRa+B968h1DiWd8ZNdieuq+lTioc8GBBshadQ1I
 y5brwFbqXwh7ZaXYTwBWX6W2mhlCiW22HHBcCQhkXzOPQAhw4LKKi1ASQ86bN6LxRaFd
 5QP4r1ps0rbaY0FF/QMQV2nDDCRIjLUAZyMML7KyQGprSNWmEisYHxuCO5wW/vDQKY57
 x4tWgvoSmz1T6JZP+mTnGpo18xE4/ISxRwtwyw4TMyrRbih97+PX+6DMbSbPHFWDrCgu
 vjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Tk342f2DcStfjZLw2ZHCFQBn5YgGbRBBcgwXLtH6i8=;
 b=haCsEmzYGEHEQyXzAugkFd7IpwyOlNFFTMlOk1Bh8UvyKeeCcKNlTxT/0miXBtSYQU
 1mmWooHEQLPCtCXTKlfn8jIsJ46H4XF1mvHS1/dbK5OsY0V4TpO8+pbFvB46XtzIg14u
 UIzVI7fVBX/4U27MvMNKZhO7lTAwvFPnu6HTp7fcnlkIqXB0y5qpenFYIM8EpWyuYqVo
 mM/W7w/r6E5HE2IYZ0fDd9rbwitcFDV6v14Ks8W5y81+BBpbAWdWqFDNpo2/QOGA4WW5
 rjSJwXrj0JxDZMgmcqBG0uX3pTJnV3RCVZajPIE0ngmdSIxWjpmx8bhCEXC2se3qvxr3
 qvGQ==
X-Gm-Message-State: APjAAAUxjvRz1kI1z7AnZgsRJzKvhQ8aC85GW6krDWpUzNC0nXzX0dnK
 n0i+rnaBoVnaz3Uos/Z0Xh39HE4mjmA0QfB7ge4=
X-Received: by 2002:a19:f018:: with SMTP id p24mr5613247lfc.93.1571691406146; 
 Mon, 21 Oct 2019 13:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-7-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:51:27 -0700
Message-ID: <CAKmqyKN=RpR=8JB7E7sEUwr=_sJwfhJuimvR9dv9ZqxLCrSLqg@mail.gmail.com>
Subject: Re: [PATCH 06/21] hw/arm/digic4: Inline digic4_board_setup_ram()
 function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-TUID: 8VVNdD4DJ3fy

On Sun, Oct 20, 2019 at 4:07 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Having the RAM creation code in a separate function is not
> very helpful. Move this code directly inside the board_init()
> function, this will later allow the board to have the QOM
> ownership of the RAM.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/digic_boards.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 304e4d1a29..ef3fc2b6a5 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -53,12 +53,6 @@ typedef struct DigicBoard {
>      const char *rom1_def_filename;
>  } DigicBoard;
>
> -static void digic4_board_setup_ram(DigicBoardState *s, hwaddr ram_size)
> -{
> -    memory_region_allocate_system_memory(&s->ram, NULL, "ram", ram_size)=
;
> -    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
> -}
> -
>  static void digic4_board_init(DigicBoard *board)
>  {
>      Error *err =3D NULL;
> @@ -72,7 +66,8 @@ static void digic4_board_init(DigicBoard *board)
>          exit(1);
>      }
>
> -    digic4_board_setup_ram(s, board->ram_size);
> +    memory_region_allocate_system_memory(&s->ram, NULL, "ram", board->ra=
m_size);
> +    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
>
>      if (board->add_rom0) {
>          board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
> --
> 2.21.0
>
>
