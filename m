Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp177731lfm;
        Mon, 6 Jul 2020 10:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLYuwNbztDJT0YS8JXplcIuA8pU1nRM6OYIbuKfxvh0PTr/mJ9TZyJz3Gj2GR1/niVf8QS
X-Received: by 2002:a25:7450:: with SMTP id p77mr73920715ybc.155.1594056274068;
        Mon, 06 Jul 2020 10:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056274; cv=none;
        d=google.com; s=arc-20160816;
        b=OmYiOLcA+EFGE/5ZU0elo/2hf7MsUoBEmLOq/AB8qu0bq6qGKkcVlsBQEHpvldC9mq
         f+8IZus2YfpVgUbC1xuczWFYthT4mtIJsSjv1dPRI/A91F8A8ET0CCaN5NKzXkCwqNmS
         6MbY3FhID3FTpzx8Nb6sbywD2g2uhep82wPEnOSw1y7bwUPiEVW2jqhsJS2uDbOeA1c+
         KEpPawEWj0dEdzMgm6vfvyyUX2d31xsQLTmj+XD3H/s5P+TVtyvE+QM3l40MzF04RKI8
         zE/ET9b7zSOQsLYBeEMLvR0yjyk/KqLHmIDT3MPc5j0KjDdEyq666YauQXyTkePAs235
         dOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SURriqbHZVXTTwsvXZaGt8gxbHhNclYTbkHoMvIQmpM=;
        b=zbaY5VsPn5UCWeoEH/FSVC7ipe3Tpge6M8ucLS6vtqjvG1ysZbxbXB9gSGA75jQgId
         2Dkv9h7EFtcVq1jK2K7trE6cbJiX5cymNyu5BLLcncaYrBTcrtf6pnGnJuGFhPoGe6ZT
         TV1S9bRbtwI2g6imVs/CeVT7VjbJ5P0IQtNsMT7AkLKGK1GXjnJVbajrsBvPF0OmTtDb
         33lZtcwGW0BfV9CF7vRCstROd6aPIhm3M020y0O+jhnGgPyJDSQu2IeR9Ii2AB2oPXGK
         iiahUWAl8TKObVPnd3eehNAK401N4NnUOKn+GE/srolUJZoBwp/gyFgufKegb36bUnKm
         LC1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MioVaGq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si10224895ybv.470.2020.07.06.10.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MioVaGq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUr3-0006ZB-FR
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUVb-0002EQ-O7; Mon, 06 Jul 2020 13:02:23 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:44779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUVZ-0006a2-UJ; Mon, 06 Jul 2020 13:02:23 -0400
Received: by mail-il1-x141.google.com with SMTP id h16so10189564ilj.11;
 Mon, 06 Jul 2020 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SURriqbHZVXTTwsvXZaGt8gxbHhNclYTbkHoMvIQmpM=;
 b=MioVaGq1jCalxgWYpPdotTkyVsAMeK/bshk85fNYAhYubO4nVFHSOeCUz0kSho8p9p
 6Y83qIJELSpr9VN9VFzq+lTIUscnBNyLwqUC24IyYDjx/4cG7EfaP2YEZc6BAomYyDpg
 4WJqsPVXOVt3XY2x1ZsaQLbg24wvg5Vy/7YqNFE+T3a7KXvhOx34JOs9fSXv1n/wrIC6
 8CzhLDbRxujPAE056QBW2Z/dWImCVitmNebYDtS6btqpo7FzR6vkHFi2ue676ojVEt9W
 vkRi2J6vudadAMoruzF52cpovO1cMqBkDNoVdP47mEGcUSBlNOyPMoeOEOsRimXSU/ZU
 vZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SURriqbHZVXTTwsvXZaGt8gxbHhNclYTbkHoMvIQmpM=;
 b=rU5wTaR/pZA9HUFdWbrwkwEN+hURz1bQPM5qUChxwkMWGvuJyvUNWugiOu1oFWO55Y
 /G5uW1VoRTDpuzdkzcsbzLR4eW1hWHUuhOcxb5Ws1wkwPRGP/tEEqyqrtPthogP9Yd6a
 t95DT8NQFgChR7Ev+/BTcRGqQD3NmzuOH00PH/Dm1sHNyFiG59uEcNW2br5LA1ogUxmv
 gtji8PCpaekWSBsQUTqg8J6rpobs+zGjTyL9gi/KtwP/UCBlVC5aRgqZu7JNJ1jNchrQ
 BRkqy6ktQ1BxJv21myCFWVJU6CzmlwIE00ei/luVq7/dFXFrWJRsqWyt9XrVib/TVej3
 x06g==
X-Gm-Message-State: AOAM533SVmsIgQ4JllIU0rX7ViKHnrgJLj7WToaN6ez7g+oT7pCIbcXi
 HVF8Md/sRNjN/cVLnOKHohlVmw+YTVPsCKSUmRA=
X-Received: by 2002:a92:d186:: with SMTP id z6mr33254547ilz.227.1594054940213; 
 Mon, 06 Jul 2020 10:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-5-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:52:26 -0700
Message-ID: <CAKmqyKMm2xhgxSqX5mHAkELfBnWhzqw-ruf3oATFvB8sohnw2w@mail.gmail.com>
Subject: Re: [PATCH 04/26] hw/usb: Reduce 'exec/memory.h' inclusion
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZpTDhKMFemh5

On Sat, Jul 4, 2020 at 7:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> "exec/memory.h" is only required by "hw/usb/hcd-musb.h".
> Include it there directly.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/usb.h          | 1 -
>  include/hw/usb/hcd-musb.h | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 4f04a1a879..15b2ef300a 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -25,7 +25,6 @@
>   * THE SOFTWARE.
>   */
>
> -#include "exec/memory.h"
>  #include "hw/qdev-core.h"
>  #include "qemu/iov.h"
>  #include "qemu/queue.h"
> diff --git a/include/hw/usb/hcd-musb.h b/include/hw/usb/hcd-musb.h
> index c874b9f292..ec3ee5c4b0 100644
> --- a/include/hw/usb/hcd-musb.h
> +++ b/include/hw/usb/hcd-musb.h
> @@ -13,6 +13,8 @@
>  #ifndef HW_USB_MUSB_H
>  #define HW_USB_MUSB_H
>
> +#include "exec/memory.h"
> +
>  enum musb_irq_source_e {
>      musb_irq_suspend =3D 0,
>      musb_irq_resume,
> --
> 2.21.3
>
>
