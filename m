Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2411609wrp;
        Mon, 23 Sep 2019 01:49:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxip0SQKW63mLrsgm47MSsjC3/uOMzHKM90F/tseLFMF5Oj4ZJVl5LQMWXZ/MG58JoDNSqS
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr15535704qka.459.1569228586513;
        Mon, 23 Sep 2019 01:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569228586; cv=none;
        d=google.com; s=arc-20160816;
        b=ysJewfdc1/J/K6Uvwy5xsIe4P8nw4a7XW9zAoA12gWGTPXm1gS5YSp9ZNbd2Wjvd6G
         nMSu+r7c9t2laAt2QxEwjA/67N+DbwIA4kX3P9wYxg0kjklNlsC3WjYuC9qULSfZwUQ3
         caSlISjMrN8zSAzKiYQLANqZ8Sdq8xZE2eiOZpZ3zOMQIs80D7ZczdwWNCkp9W8yyeuZ
         5dXFume/no7NR8if0lmtt9cFhr1umzN1g9TJSBDzKaH4R+OnslRvNre5j49FTGSIWhrH
         mYtoBWPNzW23kT088Mdj9DwaQaKXrYEvQ6GEQ03CqZBgYq7GKbQZVrR1Wv5rIqvbTgIi
         FJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=zMw6Muzp11Y+mWJuQZtTrTgLGZUpLd2Ea1IeJWiCR38=;
        b=TC7uA1/nMajE41G3uA+HE3FikWXlDWGPGNBPVpbZIkwYbQa7tNDAkgqaDhaUKFIGzp
         shmNBWX1TS6vGJmSCusRfOj97dbVOZ6gF3m5EvofK4v0LHdeXtTZCpvVkzpo6IUg5C5R
         u+M5i6Goto4ofRzTxdFqPvUUPnDA4jKrL8vcgolvWXpdyzozdOv4CqhJv09k2DIrqowy
         SWOW7/aKJZ87ssg4o2D8EaB++rDgbcrajXJKbqeMl8NAFnz8crAIECzUy/6aPX661ZEG
         d27zn7Mj5W+VbXiJEx6+koZsTOrxTjeB+F67xOkqyBSxbuDTddmKtSHxFKskSuWeueb6
         WJRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si8070593qte.312.2019.09.23.01.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 01:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCK2T-0007rK-Lc
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 04:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1iCJis-00067U-37
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1iCJiq-0007YW-NL
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:29:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60766)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1iCJio-0007XW-Pe
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:29:27 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4D822CD7E5
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:29:23 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id v18so4538360wro.16
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 01:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kikYKHfL3Ck2fN5906iWkH6+cgjWSLcj4UEJt3nusl4=;
 b=YeIkqC3etcgMJti4h2NjHeJ7yXsk7mulJvllxAAUlP+6bs9KQi0RmV3pANnWhCqwU3
 4gQskJoDv7CFnbhWfKp1IIIs5aC5SCD/YKIdUfqg8ayxCDoalcYgU8FGcXYr1DyP/aIb
 nkvFVtgMZhdPZa1d2Vk5NbVju2YEBixJOrpeTSVOzb8X9O7eyNDLCZqc/Dk2pXwt1tUd
 rMZ+7hVrCeu0GdIiTErKgur3KQbZX6w1n87AA5HyW834/QWbiemoVKesc/MmZi/rlf13
 2Bneb7PCkST6SYny8wcYICnqevOrDXEFfgl67PDBmDyunEo5h1szbOVveNkwtE2xEXfX
 uilw==
X-Gm-Message-State: APjAAAVuLHHb2ejzCFfG8X8mJ2bRLDw+X1cyRF02owEHtIvX/OV5DrjD
 Czf+M6qwWFT32nVEzFl20y+Fgeh8kjzlEvsR9hDUNurYIBCp5XUzb5hpcaVgFrP49OBFTzLBGj3
 5QTCYsZvtzZyf
X-Received: by 2002:a1c:7ed7:: with SMTP id
 z206mr13700941wmc.124.1569227362479; 
 Mon, 23 Sep 2019 01:29:22 -0700 (PDT)
X-Received: by 2002:a1c:7ed7:: with SMTP id
 z206mr13700926wmc.124.1569227362235; 
 Mon, 23 Sep 2019 01:29:22 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
 [79.36.61.170])
 by smtp.gmail.com with ESMTPSA id e6sm10312791wrp.91.2019.09.23.01.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 01:29:21 -0700 (PDT)
Date: Mon, 23 Sep 2019 10:29:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
Message-ID: <20190923082919.y2fjn2y6t7lire3z@steredhat>
References: <20190921103405.19623-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5oBxQgNo+Dvl

On Sat, Sep 21, 2019 at 12:34:04PM +0200, Philippe Mathieu-Daud=E9 wrote:
> IEC binary prefixes ease code review: the unit is explicit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index bf97ef3e33..59bb2fa0d3 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c

Very appreciated!

What about fixing also this other line?

@@ -575,7 +575,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
         goto fail;
     }
=20
-    if (scells < 2 && binfo->ram_size >=3D (1ULL << 32)) {
+    if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {
         /* This is user error so deserves a friendlier error message
          * than the failure of setprop_sized_cells would provide


> @@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>       * we might still make a bad choice here.
>       */
>      info->initrd_start =3D info->loader_start +
> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
> +        MIN(info->ram_size / 2, 128 * MiB);
>      if (image_high_addr) {
>          info->initrd_start =3D MAX(info->initrd_start, image_high_addr=
);
>      }
> @@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARMCPU=
 *cpu,
>                   *
>                   * Let's play safe and prealign it to 2MB to give us s=
ome space.
>                   */
> -                align =3D 2 * 1024 * 1024;
> +                align =3D 2 * MiB;
>              } else {
>                  /*
>                   * Some 32bit kernels will trash anything in the 4K pa=
ge the
>                   * initrd ends in, so make sure the DTB isn't caught u=
p in that.
>                   */
> -                align =3D 4096;
> +                align =3D 4 * KiB;
>              }
> =20
>              /* Place the DTB after the initrd in memory with alignment=
. */
> @@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *=
cpu,
>                  info->loader_start + KERNEL_ARGS_ADDR;
>              fixupcontext[FIXUP_ARGPTR_HI] =3D
>                  (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
> -            if (info->ram_size >=3D (1ULL << 32)) {
> +            if (info->ram_size >=3D 4 * GiB) {
>                  error_report("RAM size must be less than 4GB to boot"
>                               " Linux kernel using ATAGS (try passing a=
 device tree"
>                               " using -dtb)");

With or without the new line fix:

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano
