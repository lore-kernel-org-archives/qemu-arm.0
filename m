Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6357982lfb;
        Mon, 28 Mar 2022 02:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXge/uAHg1F8xxs85knQox62XsTe6g39ob+SeVL/WiKDAxzivTK7TLEtDWUyQX3yuHcoY9
X-Received: by 2002:a05:622a:4ce:b0:2e1:e18f:5b33 with SMTP id q14-20020a05622a04ce00b002e1e18f5b33mr20324756qtx.565.1648458945747;
        Mon, 28 Mar 2022 02:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648458945; cv=none;
        d=google.com; s=arc-20160816;
        b=rg1JXtNwmyVLvXmLaNk3IafxRNwjwB7J1ac4D8tu86TfGrKJIulK5PFDrc8kR3MgwC
         J+llJJhshpeElcSfcwAaQZfz1PMK4Kbtb6GlR36lg6wcFsuTXgXZlrb5Sn+hMdvglJeD
         +l8gt28hqHGpxsW+48M0j3ppZgCZIs7L6D2WWkKOT0nLroBKKwIObFdKiGIg+O7yuPjY
         N2HjnGKNKWhB+zyjnfzkR6G58j1QlmrzO+xCKDXOaMPcvh6AzQoR+AnLgyab00n7ikt/
         Q/qrabjY8obSx/uYADP9DKv7W4NYEWP8sZm2XbAi2Nctu5eAayMpE0RnXz1y8MyPXbCc
         WMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=koFHKxMx4foaTkt1A8Zr/I20XaHqP1gcSqnurmGbBuM=;
        b=PsXBAAUQQNNKSOcamoaOQJPaJG8pGXzzR3XUuFYPE1gz/B8KM6xNZJZlNjqhWuU0EH
         JXAICihrDKYu8yDzQ4UlLDsJ92X5XFoDgX242Dad0kIXdHxrUqJcV5ex2dCsT1+JVFR0
         kwhA0lb1iu5L6KzREvafbMHDw1kARkip5B44AXWFzsh8ByD+PNkh7Jn6xc1ydCoAk2xQ
         F0f0hS0oxOyhNYO1NtMB3Kzenjb6B6FBYV/Va9FVtZPBtxm8OyPgF3jhevclAqs+U3o2
         YK4TxbH0OiGYOgFeWtsEaaKqb4vFnTX0yRADzJLTIB7apQewVl7fR8t07ly4feSfJ0mv
         DgYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DOcS1e6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a370602000000b00680bff1dc36si3579285qkg.620.2022.03.28.02.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 02:15:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DOcS1e6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYlTV-0004kY-3e
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 05:15:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlRf-0003U4-Rs
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:13:51 -0400
Received: from [2607:f8b0:4864:20::b31] (port=44653
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlRc-00071D-JH
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 05:13:50 -0400
Received: by mail-yb1-xb31.google.com with SMTP id y142so24839208ybe.11
 for <qemu-arm@nongnu.org>; Mon, 28 Mar 2022 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=koFHKxMx4foaTkt1A8Zr/I20XaHqP1gcSqnurmGbBuM=;
 b=DOcS1e6HH4/pCpXvnnetx8cw1ZwqwmUCPjzCFl2Q64vPit4ymMnejdPuF8YS4N8e4c
 LYZ5ggrhQ58LrNGPj/YcVc1vH5o6NpogT+n1tI7FSYRsy0R5sROvIV7T/w4Npcrz0Jp1
 P0wwM72EWo8v/qJ+AOeyBKK/BCOuVeOj9hD+Xt2u1lBvLRVApg1+yaAfRPLJpXBNel0W
 s1gXYTSy4Ccxb7EIvJw8Uj/H/z9KlvqoO7b7G/7yPNjMotmZjMzU2unh0k2Ej9FG/ntt
 nkYsZwvXMR7KEliKLRZTbXY+avp4zZnqWqnCbG+lBUFg/40D/u/aEftOyw5BGOBbveKV
 gNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=koFHKxMx4foaTkt1A8Zr/I20XaHqP1gcSqnurmGbBuM=;
 b=IwPT+6FuRCAsqSOdQc8qypd6US288IoHpt5Bm0H//7Z1l+Zo/jWEZQ5e2t2TBZ2CxC
 YxAyhQNz83tpnSoRPrsoyKtsv8G1KKJEoBimyux2h098Y+xCp7gysMVhsG81oDnMk5yT
 FOfed5m/8J3wPnPqVs7e3JgQjAwrybgkYgGew/2x0swt2pmSSMKpI5K6AUvucrnGfdrV
 Z4HlO3mEgRIvqHp09krfAput2GP+Drp8ms09IW8bD9Pz+xZs3e1b3FGXjyDCD0lk8BUA
 amf9BorkXeiGXZnTa3C3Sc56TDJ9dgc6f+F2Er95KkxE1beB1T2CbfY7kxFwNgTxI4DR
 mqUw==
X-Gm-Message-State: AOAM532AAFxKSvs+IeoJgjyjuC9HUJ+m/eI5C0O7AfY8Sq9N5S3hQhNk
 mnrnSYnXU4/HAE4MhTjW16hELckl6RXraXLf/xjQOQ==
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr21681543ybf.288.1648458826169; Mon, 28
 Mar 2022 02:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-4-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:13:32 +0000
Message-ID: <CAFEAcA8-46DdsxXeWSb_smnGdBvQ0D31B1STC1O5pQNjJcfQqw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm/allwinner-a10: fix format-overflow warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uD3IgVHe8TbI

On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ../hw/arm/allwinner-a10.c: In function =E2=80=98aw_a10_realize=E2=80=99:
> ../hw/arm/allwinner-a10.c:135:35: error: =E2=80=98%d=E2=80=99 directive w=
riting between 1 and 11 bytes into a region of size 8 [-Werror=3Dformat-ove=
rflow=3D]
>   135 |             sprintf(bus, "usb-bus.%d", i);
>       |                                   ^~
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/allwinner-a10.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 05e84728cb34..79082289ea5b 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -130,9 +130,7 @@ static void aw_a10_realize(DeviceState *dev, Error **=
errp)
>          int i;
>
>          for (i =3D 0; i < AW_A10_NUM_USB; i++) {
> -            char bus[16];
> -
> -            sprintf(bus, "usb-bus.%d", i);
> +            g_autofree char *bus =3D g_strdup_printf("usb-bus.%d", i);
>
>              object_property_set_bool(OBJECT(&s->ehci[i]), "companion-ena=
ble",
>                                       true, &error_fatal);

Another false positive. Maybe we should feed this back to the
compiler devs for them to improve their warning generation?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
