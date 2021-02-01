Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3706530lfo;
        Mon, 1 Feb 2021 11:58:55 -0800 (PST)
X-Received: by 2002:a6b:5110:: with SMTP id f16mr3143856iob.89.1612209535276;
        Mon, 01 Feb 2021 11:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612209535; cv=none;
        d=google.com; s=arc-20160816;
        b=HWtsyuGr6xd/bHYb7F7Yxsd7L6qGS4CPBhgttR3t8lPvi0jK+RVNiwVdZeQXVYgLI3
         nXpVFLMtFQm+1C7CwAISvvsY0CT7nKfIqFuSQop48NIOYig/IE/x6hl/F/5STud3MvZQ
         /Jmz7DLlbqpoJj9wpxSfsoLmKX6NEN+462yZycL3UMZL9790rldimsxyyg1EbncySPRi
         cHiRGPt9flFxGAUhlctL00NncTKJB9yqPGu78k5dsG5sPA/IlKHITCP8g0pcql8bOQu6
         sWn6ZnwK/3kWjl1xuc5m2BrsDVY/SfYPqi9bKfOgYMVozuaQ7mPzznybK3j3F35upCdm
         1cIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKyyWMxTpIpg6K+Vsby9Djb/AwohucHSDi/F4Vwzhw4=;
        b=mpHaarjgYLLnpe5tUZQrlA5XIRQWzG27pb1JP8B2ZAkKsNvJsKP9CZYym9i57vvlF6
         SEcYFIYGbs2y6HA5CMw6Yh9sMWZoZsTduMEccatxyUmgkYgpe/WS09o9a0W03ar6ACIy
         UK0YX1A5KvkS/NLk1uCqK0g2zYofJv42Pix0/ZvZFK4UtPD23ltLWcv35hZo7YEk+Mgo
         k0nsz2X24LGHn6BxMcuHDzU9ebz078myAxsjDywj7DyH83h6wjiN3FtLZMsy+ShegWe+
         vHpsPtIr34H3tVYDXp+Y0sgATUS54WzJ4ZCsrJFvuiM5GGFUog9Kh1AViMaoXkRa6DwI
         oHmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tzTFUWGI;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d4sor2613032ilr.45.2021.02.01.11.58.55
        (Google Transport Security);
        Mon, 01 Feb 2021 11:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tzTFUWGI;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKyyWMxTpIpg6K+Vsby9Djb/AwohucHSDi/F4Vwzhw4=;
        b=tzTFUWGIt/jbJtBuJEOSSbOZaKaI/R57rNrNjA8YZkHq4YFzseAlCTndZHILaE0jjV
         XcN+fRSEEU92OM/RtuReIeds9T4kTj6oMvCIeoFuqeugMhE8uPUxkDim8oGn5265kVhA
         c/Mxax7i/l0tfw3u4UvkQPpCQGcEfcuhYCBs++N8aX6/TbdPfAHfBrtbHy3dwW5zU5r3
         BIDo6KA5T/F4plzh1syDUlxXYmhjWkCT32nGWL2Qsg8t9wPW/bE4Y+Am7ejYW0ZieG3G
         ncYPSJN9tTZ+uqV1pzdlxnqjDJTPP4reCJ32WdQeXHLsfdGd8ua5dpq6kASDikckmGi+
         X2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKyyWMxTpIpg6K+Vsby9Djb/AwohucHSDi/F4Vwzhw4=;
        b=rgGH+0JxH72inZuA39gE3BUCdUBd9wb+CV4MJJHnO5ON5Y6pUysJOfxtOtCe0q+Neh
         mraPBIWOf64aFcjl/usDCbt5BhEw4xUFmt7gUeier7QRVvt3qTJ4FO3mA1GJQF9htA30
         WbveQpEtJ2Qa7NVjvtf7rpGHBWoQ/UdpMWloscGoTlCfS/RuR/8G3XMzUuetYCGnH9gR
         aVRCNGvxKlRlKNPYQD5e45/SW24W/mGLY4U8H4UqrhdSFxMecJEZJ96f9COsAFVmbXRE
         KgjLw12SXnKfFTELJlYo4pdDmaocKeJPCRzkrq1MS1xG4ZS151jh+OCa/B9zgV239XCn
         MOgg==
X-Gm-Message-State: AOAM530Y0dNCVRRU6iWl5fQYT5P4eOKfW2Z//zytc2P/evsfal+481eG
	cNnmHHfOqlpQNiQsiCXCb5RYUM6+8OLqTQ60+8E=
X-Google-Smtp-Source: ABdhPJySdadrxzzwNF2ryS4eN2JSOOO0w7oSrLlIH48L7SH5Oad7lB269hmQan6Yq4xbgfKqAhNAqAnZAYBRgk3WZjk=
X-Received: by 2002:a05:6e02:963:: with SMTP id q3mr14399945ilt.227.1612209534947;
 Mon, 01 Feb 2021 11:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131111316.232778-1-f4bug@amsat.org> <20210131111316.232778-9-f4bug@amsat.org>
In-Reply-To: <20210131111316.232778-9-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:58:27 -0800
Message-ID: <CAKmqyKNLM9TRr9PhAOk+fqcW9d7T8P5BRE0YJrkGfE52t1Pg3A@mail.gmail.com>
Subject: Re: [PATCH 08/10] default-configs: Remove unnecessary SEMIHOSTING selection
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>, 
	Cornelia Huck <cohuck@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Thomas Huth <thuth@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Marek Vasut <marex@denx.de>, Qemu-block <qemu-block@nongnu.org>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Greg Kurz <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Chris Wulff <crwulff@gmail.com>, 
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Be/lRjj6eybZ

On Sun, Jan 31, 2021 at 3:24 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Commit 56b5170c87e ("semihosting: Move ARM semihosting code to
> shared directories") selected ARM_COMPATIBLE_SEMIHOSTING which
> already selects SEMIHOSTING. No need to select it again.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 0500156a0c7..341d439de6f 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -41,6 +41,5 @@ CONFIG_MICROBIT=3Dy
>  CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index d847bd5692e..5c9ad2590ef 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index d5eec75f05e..d5b2e25b6df 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
> --
> 2.26.2
>
>
