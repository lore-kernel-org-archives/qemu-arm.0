Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp108600lfm;
        Mon, 6 Jul 2020 08:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9+lKz0W460P/8zEJm/WBwQXC+CCyMU2e6Ma6dLDQwhPDp2TiY736qdOqyfanIO8Zq8+PN
X-Received: by 2002:a25:aa69:: with SMTP id s96mr32992427ybi.59.1594051014859;
        Mon, 06 Jul 2020 08:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594051014; cv=none;
        d=google.com; s=arc-20160816;
        b=AihtbLYFI7eQdThkUjzw+4VwU/c5GKX9k7VU3YbXPewJII3g2l32eXvfSUm3XtllUE
         PEx/MRdntz/XLW4MUn/SEzs7tFiQzbQ0Dz9YlXrDMI/dPXZ7EoVBtgx/GBNPPko8d5v1
         mIcam7SyZznY0x8qy7N+873cFsG7YYzsxlPxxzqtIUo1vs3DDjajqU4XWREb1POL8THA
         wXloWVsePRbF2l5JvZtLri4sPPwhGBfwDWCQ9AK0i6zHr659TUbTtLLubs3AOhVCP1zJ
         I74WotF/tURbAogZ1zOi6/fg0l+5+WyhTWCLBKPfRFgB0ShYry84jsHXLpFFibiWHxzc
         FU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+amaCydGXFD7tOxIoaW5Ws/ffZUNsk3k3gWx+ubwDDo=;
        b=ADyy1SGDmdQ8elW/D6H9uK6IC7XjHHwbcWAgDDGBK2gnmdMkN41eCoZONyyLCtn0Eg
         zqGxfsucKHsfeFjn5wQM6TAJ8aUKsGDVQK6ypQ1fHslcS+0tXLWjGn42e2HgomTrA9nS
         VDsdhRPJDwxG3Akm4E/RknTmBZGu9YWOIMjVhv4rsuJUWo/Mu1M//MEqjlcYBbfHN1CL
         sxMJLpsbwAt2CDEVPy6fkKVol52NBK8XX4i9e/OjNBZ3EPrNkXNzxhu8KG1QZX9tFzCz
         D7kIGGiNoINUM6WnbWrLTjHYz5M2vcHylBpPOgifCfvz5ik5TZodszNE40czYBNLRPl5
         pzYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlYMmh+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201si21104876ybg.223.2020.07.06.08.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 08:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlYMmh+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsTUE-0005Kb-8p
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 11:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTU7-0005K3-11; Mon, 06 Jul 2020 11:56:47 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTU5-0001LV-Ha; Mon, 06 Jul 2020 11:56:46 -0400
Received: by mail-il1-x144.google.com with SMTP id t18so13402418ilh.2;
 Mon, 06 Jul 2020 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+amaCydGXFD7tOxIoaW5Ws/ffZUNsk3k3gWx+ubwDDo=;
 b=VlYMmh+kk6mVwx2SUxdCskvaFIue5WpAq4U45IzeMfwD4LK/Fim3v/pM553Z5TYeV6
 CBQBpFRhSsEAlXIVXNfwdm4ep4RZ1T1Q+H8og5vinWtpHmpFT96fp2BNqESpXTI/1tAi
 2PK3L1FbKX/RV5YCezx66fLbdqwnaw2ZZB0JAE7UQlF1n7bPNtClHzommue4G4GCXMC9
 REZc6TmnNDsCQbA11QkSioinNjiel8zGLHQ3MrjnlS2PURrH+stAbwidgrmVpV8hbM9u
 mKGUUx0F4ltG14jFTxJURGndiue07iIM+kkmuY5YdD7mI1Iojqz+BTA618q1jjNLU4dA
 mM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+amaCydGXFD7tOxIoaW5Ws/ffZUNsk3k3gWx+ubwDDo=;
 b=s8eCXR2SdBd3fRAh0JHubMjTsDMoznvXRHTRjLxM/MyhThYBAio/wu25/t9/DTyVuj
 wT9N2UQA7Ui537UzAFaaJSuYK0NscfDS2HpCTPUcYm5a0ik7svQ/tNlwbPu4lqV2WVRt
 dmilSeKZw8QhFnDq4R9KBkqa3wWhA6nh1dOtNXK+a/lJrQuxk0G9+h66634HGszteOSy
 VeEcXJDZL6u9Ub1Pfczotu4P0jnn7/IONoq/4AZEQnyU3huZYgOkn3gNhDjoPKVh+WeV
 YuZvRAYcg4fCdSFvv55meyD7zYz+i0MsWdbkH+zx6BG7Rru2iGt5aS/RFaJ0G4FDEpSu
 94Tg==
X-Gm-Message-State: AOAM533Yd7P9H24cGVo19rS70rZP5ryYUyvv/vm0DFykPaK8+he33/qS
 OT5yeDDdwSPj6VuzN0uEp1Prn9LP5jvk9oAc0t8=
X-Received: by 2002:a92:d186:: with SMTP id z6mr32968267ilz.227.1594051003999; 
 Mon, 06 Jul 2020 08:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200705204630.4133-1-f4bug@amsat.org>
 <20200705204630.4133-3-f4bug@amsat.org>
In-Reply-To: <20200705204630.4133-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 08:46:57 -0700
Message-ID: <CAKmqyKMQ9-JqZmNnVm9ibw-doiSd=vUhO3_bGCq2U7=rK1KO1A@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] hw/sd/pl181: Rename pl181_send_command() as
 pl181_do_command()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QiS7O0v+xTqz

On Sun, Jul 5, 2020 at 1:46 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> pl181_send_command() do a bus transaction (send or receive),
> rename it as pl181_do_command().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/sd/pl181.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 649386ec3d..3fc2cdd71a 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -173,7 +173,7 @@ static uint32_t pl181_fifo_pop(PL181State *s)
>      return value;
>  }
>
> -static void pl181_send_command(PL181State *s)
> +static void pl181_do_command(PL181State *s)
>  {
>      SDRequest request;
>      uint8_t response[16];
> @@ -402,7 +402,7 @@ static void pl181_write(void *opaque, hwaddr offset,
>                  qemu_log_mask(LOG_UNIMP,
>                                "pl181: Pending commands not implemented\n=
");
>              } else {
> -                pl181_send_command(s);
> +                pl181_do_command(s);
>                  pl181_fifo_run(s);
>              }
>              /* The command has completed one way or the other.  */
> --
> 2.21.3
>
>
