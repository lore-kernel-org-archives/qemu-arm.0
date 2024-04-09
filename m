Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1923691ejh;
        Tue, 9 Apr 2024 07:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNDaPp24oaGegsNrwvs7haqbrteq4O21ZhTFLUyqKQB4EKB3ctacbmrM+MeSdSXh9Y81AJTSpuGcZ/z+2QRxLIzx5iv1/6
X-Google-Smtp-Source: AGHT+IG0HGxiv5cc2OgEjMDOtos2/5EkYtUHOjS+7usNZ64nXn4APC/tgbt4RyrCuthmITxh/Q1I
X-Received: by 2002:a05:6122:3c49:b0:4da:c699:de98 with SMTP id fv9-20020a0561223c4900b004dac699de98mr6621775vkb.16.1712671258705;
        Tue, 09 Apr 2024 07:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712671258; cv=none;
        d=google.com; s=arc-20160816;
        b=ExERx7/8njfSPkIhdPeZmb3ifoK/E8Xxvh6+thqCWQgyzsEqTXjr34bz7Sn7dEwxRs
         hzACfJ+zuZBA7bCY3MMke5gbmDX4G8nKaaI77aIvvVuRHo5IUNb2KDlQy/kaOLSULlJj
         JvpwG2LtYWD9LAsgu686HXc/CLk0ujJcfOpCvdoX2v0fYgyMr6SsXBvaCeNUNoq4otav
         hPPTsuIpsssw+c1v9kjgRexEeau+JRokVgPDQNCYYqBZ4ug8UWFmI97DBTGYsMUlCLxO
         9oen1cqyA5JiqcALo0y8Acd/XcovW4JN10ECBV0XP4VVzJr4rRuD14c2oseu+jPSPYGc
         4tKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+lCs/PCN91N9C3zJ0fBleuXeCV1UwcWxGT+Kv0IgR+k=;
        fh=REsVbE92apN4yjObgpT1bQLRuKOwFUQI6veR2+wFcJc=;
        b=FuXnO49RXaR4MT9iOIQOxarNg3aLQRPu5gjX8BghO/z7kCJHWuX3k+xxTeeUwPLUoL
         Azr1OfUcEznaaCMi3Sl1hPwZEQzWF+3MFO/j9SgVWCvl3kiM5vOsy89v8uv72RExZYY8
         pfMY7h8gnqlrJcjKcyXOZBz7UwJo/yQW/TReX2NeNfT59DT/diI7JqwsvJv6JebfgMvg
         FwEsDSi3mgGzrmZhrNVRsny08/Lou1h9I3k4Mx7gCMQlETJST98fgJRDix0y85Ns5Lx0
         6PitrekOOx9qnFavtIq0w1PYir+Re0XEar/7bfR7+dTD75vbIkpcnni3BHu0AwfTuCJ8
         /N1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPu6byVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i185-20020a1f6dc2000000b004d8795e1e2esi1204261vkc.68.2024.04.09.07.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 07:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPu6byVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruC1V-0006xf-Kt; Tue, 09 Apr 2024 10:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC1G-0006t2-O0
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 10:00:16 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruC1C-0004OH-Op
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 10:00:13 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d4886a1cb4so68267191fa.0
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712671206; x=1713276006; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lCs/PCN91N9C3zJ0fBleuXeCV1UwcWxGT+Kv0IgR+k=;
 b=XPu6byVeoO1sTMcRUArUpgp3tc+GVLi+M+D92//NVoWRuuE2N/IiIQpweghI+pYcet
 s8kG38qcjzuXxkGyyYbVyFmuHgsfxRDeYpVUhU6xQ49lVi2Gq/fvc6acd9fLI+lcPSnZ
 e6A+FnbqAN53XsnDHuJDAw3HoSNbBMrhi/tiAXHUnmzDwOUdxoWRyZ+YrikDA8Lfllf2
 uL+vc4W8kCEvKM/pH34VMPO5rmWAfJzEQwEHc/ehX0Wx4BR/EOLAFsMczOz3Mv6uXUFp
 PS8JXQQ0yhzGAjSHeUuAhlHEseriwTfcHhgibYwCPnKYULlnZqmJeAzL5PZ2Y3t/ZHoN
 NuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712671206; x=1713276006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lCs/PCN91N9C3zJ0fBleuXeCV1UwcWxGT+Kv0IgR+k=;
 b=Ff6IHlgjpQbwz6B9Pc7CI5Cy3E+4etBmK012V/27tJPWTjqQMZyQUerQNmMJo3zBRY
 /u/CVZIKpL16Gm9pGzm4xrUWLW4C444GfHC0D48XIAsKhsNQNVjeUBKT5nAbhhS4GmzO
 OedSKpJmch19JIzWAxGBl2yUhR1wzVnYWG3So1dwP1hyi5ezIxKOizk0dcGEM0f/OQcS
 fDvpCUjK2R8h+jH9TeajJgGla5e6wdTg4s1yqN1Un87qumGpm8FBZR5zpJVVLi0VB8MI
 xi7RkE8AMKgFSpQn3r6mlAKV+WoeuJ68LpMHAqYC0856jK8CQldGBxiIJfthkyIAgTjX
 2nPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUse7FPeDkJq4ad4OBn7FLnx49NJuaPWNy069aXXPMqfQEpLjZZml2YYMrZtTAO9fVjjk8qqtOdBGgPqeaZ0zTAo38g
X-Gm-Message-State: AOJu0YzVri60tgmJQt+2s/jkSlT1taiaZsWW8zPYi6qi6wTb1IPTUras
 GrT1qnuofhbj42SYDQkKaY5iAL/Fd2HZ7/PCxgHROLCrdPlVwTPOI3fLbg8QGxAWXXxKOCZWkbo
 ljY6jMM40mqCyUm2S5qDisN9tj0AzW9crqmK4yg==
X-Received: by 2002:a2e:909a:0:b0:2d8:57da:c2c8 with SMTP id
 l26-20020a2e909a000000b002d857dac2c8mr8244757ljg.25.1712671206275; Tue, 09
 Apr 2024 07:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-9-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 14:59:55 +0100
Message-ID: <CAFEAcA8eOnja8CYv2wD0VOqrZXMZmNRTyMbDOP_xOwHN=H=nsw@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 08/11] hw/net/lan9118: Use RX_STATUS_FIFO_BYTES
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 25lGSTvIFGSc

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> rx_status_fifo[] is an array of words,
> rx_status_fifo_size is a word count.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/lan9118.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index a983ce193b..cace22381d 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -262,7 +262,7 @@ struct lan9118_state {
>      int32_t rx_status_fifo_size;
>      int32_t rx_status_fifo_used;
>      int32_t rx_status_fifo_head;
> -    uint32_t rx_status_fifo[896];
> +    uint32_t rx_status_fifo[RX_STATUS_FIFO_BYTES / 4];
>      int32_t rx_fifo_size;
>      int32_t rx_fifo_used;
>      int32_t rx_fifo_head;
> @@ -332,7 +332,9 @@ static const VMStateDescription vmstate_lan9118 =3D {
>          VMSTATE_INT32(rx_status_fifo_size, lan9118_state),
>          VMSTATE_INT32(rx_status_fifo_used, lan9118_state),
>          VMSTATE_INT32(rx_status_fifo_head, lan9118_state),
> -        VMSTATE_UINT32_ARRAY(rx_status_fifo, lan9118_state, 896),
> +        VMSTATE_UINT32_ARRAY(rx_status_fifo, lan9118_state,
> +                             RX_STATUS_FIFO_BYTES / 4),
> +        VMSTATE_UNUSED(896 * 4 - RX_STATUS_FIFO_BYTES),
>          VMSTATE_INT32(rx_fifo_size, lan9118_state),
>          VMSTATE_INT32(rx_fifo_used, lan9118_state),
>          VMSTATE_INT32(rx_fifo_head, lan9118_state),


Ideally in the state struct we should have the arrays be the
size of the largest possible FIFO, not the size of the
default-out-of-reset FIFO, to leave the way open for making the FIFO
size be runtime configurable in future if we want that.

thanks
-- PMM
