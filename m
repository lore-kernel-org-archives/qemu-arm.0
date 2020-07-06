Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp177395lfm;
        Mon, 6 Jul 2020 10:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyciF0OFuOmKgZok3tADxhXqTUiOwzY8gpX8uZtglEv4BaPwFu3PnRRu0Xt/qxiIgPUKbUM
X-Received: by 2002:a25:908d:: with SMTP id t13mr77475045ybl.450.1594056244730;
        Mon, 06 Jul 2020 10:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056244; cv=none;
        d=google.com; s=arc-20160816;
        b=tGJAQj91WnsuE9ze0YG7TiYP/VNzNqAoCUQN/ZSJ3AQKrZb8A1LGQAPMl9CYquzd6n
         xxGhc4wePjKG0KdQAvoIkwZsXpHilnIikpkC4+S5afQMJ2+MYVlaTbFH+VmpB+qCwgc4
         4Y30XGPxbpCKML0Ld77qIbph8EZSVO9GR8tZ1dRreiDJzZSt0mdidmd7vu5mQmfhBXvO
         SbqxDNYpYLAyYSbjxpTxk3SvaPpIYrtH50NOLQuizWQngStDikwin+xNPGnaUUauth8r
         51cF6AQuRHD/adi1K4x5aQmEDtwV3nAqXhfSfFiRTGpn46/d0CKQ8cacx1b4oBLyEOqR
         KPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FXnnv73L5WipvrjnAQ/ZRDtg+5iLp60OiInY9J0Zsfs=;
        b=SCsJ7tH+7H3PyKG6If6eFD5l2l7P+QuxXRZ+uFcFzLpFHQkkbJCkdYexIl5IcoZwcz
         n9k3pOrfNP9QrHYW/pmIKaMkAYZpjUG/wT8uFtquXqyHXedTVp+54dBDe1CD/X6+i+Wp
         ThIdw1fUwjWvRqSmRCtMyLRErr1Efq4Fi6xuiWomXS3ml+NhL1XeKKRkwvmGyEc/ZqhU
         ARIxHJn7M6e/FVb0Afvo6NwV6jfIRuZV+TD8dce4W2oOxxGVCPWk6WBXETjbOtmpFbpz
         i+kWxgjjP8YBzyXdezRWQaTF3gG2KY+pM0y6BmmnjC9jDiW0sa8vR5V28omE4LLQpQIP
         WK+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fK2rUb2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si18935811yba.275.2020.07.06.10.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fK2rUb2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUqa-0005DL-2R
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUSR-0005r4-M2; Mon, 06 Jul 2020 12:59:07 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:43288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUSM-0005oU-8T; Mon, 06 Jul 2020 12:59:07 -0400
Received: by mail-io1-xd41.google.com with SMTP id k23so40040661iom.10;
 Mon, 06 Jul 2020 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FXnnv73L5WipvrjnAQ/ZRDtg+5iLp60OiInY9J0Zsfs=;
 b=fK2rUb2MdciYU4Z+vy8DaVGveUMlo9HFcBrc2ZvwhMG/OTSUYi16woJ2geJIOeCHf+
 s/tu4UZiATsSlkJBZD2mo3pornyf9G2RKM8kkgfjb7neQY+BTo9GGZ9L3v3UwKSUzApe
 89qSSXu30fk4x/9gPjbYtny2dhJQctl8b9Lrmn4gsXAE9hmlLHVRcYlZiDw+zMWXKhiT
 WJsFHIKj5Bhm1NoNyZFlGdsqEUXmX9z2x7FAgTnWrhAmBppFMg16jLsf48EcsdQ3N9Ln
 BfooAlKZ7UjPxtmAAZt8fESX0cQByDrugScyx/bxh9+zbshTBMAtPKfqON37hfLVY3Rb
 eq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FXnnv73L5WipvrjnAQ/ZRDtg+5iLp60OiInY9J0Zsfs=;
 b=Ac9ShVJVVUD8rxlndKw6nz9LNuM1pkLp2aHpLlNBTPKbOgIvyPMiV3zGaw8QV7/OLS
 lfWeEAAXtxppY46AgAPYDTvyoF76XQliPmrQWdV3AqqtmpvNLP4tYTSTj9wzm/mIizoX
 wDZvcV3dNZ00OQbDlVxPqJdEwlzUq1ZrmHMLsBzDfdwfHtgyJIFd2KFCMJ3tiNhD+vm3
 6aR37ziv6qnitVTEgb/NvXGgQAMc8oREo4LNCbtFWGNMsLvtOdhpkrTpapsWgDDh46lT
 EjZKHpj0H2/bT1/SKOk0vLMwfZqFKJM+ahrSMxUS1EM+vzVzFxPr47jpPG626xuwLXYK
 8TXw==
X-Gm-Message-State: AOAM5334vMkdoSjBaPMqvnn/m2P8OaKj5hULhhqG85+vU4A3N6rLHaFJ
 MzQD0PgdEkCtdjKs+K1HidlHuH99mRhqHSGFiEU=
X-Received: by 2002:a02:10c1:: with SMTP id 184mr52996773jay.135.1594054740444; 
 Mon, 06 Jul 2020 09:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-2-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:49:12 -0700
Message-ID: <CAKmqyKNd3qyB33TCamM_zXPFahfvdpmCirouODOy_QFotz55EQ@mail.gmail.com>
Subject: Re: [PATCH 01/26] hw/arm/sbsa-ref: Remove unused 'hw/usb.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ESl4h+nXTkg

On Sat, Jul 4, 2020 at 7:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file doesn't access anything from "hw/usb.h", remove its
> inclusion.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e40c868a82..021e7c1b8b 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -38,7 +38,6 @@
>  #include "hw/loader.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/usb.h"
>  #include "hw/char/pl011.h"
>  #include "net/net.h"
>
> --
> 2.21.3
>
>
