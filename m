Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3233834lft;
        Mon, 4 Jul 2022 06:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sljuGoMs2bBw6meOIvUW1W37yozdljd07dbjFC1bOEpT9yJtbZ3N9hUcj/gJl59nzDsKWW
X-Received: by 2002:a5b:c44:0:b0:66e:524a:5c75 with SMTP id d4-20020a5b0c44000000b0066e524a5c75mr3263251ybr.221.1656941749148;
        Mon, 04 Jul 2022 06:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941749; cv=none;
        d=google.com; s=arc-20160816;
        b=qHsfhLvN/Blx/2o+L1pthaTSmlGtqRCEH1SRWobgzJ5Zbp3cHO/HlmccJxkQWEwHCF
         KIiX68JJ9cIKBVunL63ZCPyX3wmjSiG/lay2mkZeZ+4toiE/XCgvzvbn5n30OGlwl/88
         06dT0Gsq8+KDBq2b9Gd/Vdqy3IIwn05Pp7EuQAwFde5Pml8wazkCcrwMsgaivZfyIbt9
         4k3dx5Dfa+Xb7y7PN7MDHeEwxxRAJ4Wrqskmg8PPKBN7CPgNlKNGzzkW9YsgCADUD6n2
         2NCFeVAtMWR/FLmKh3/eUN0i4jN97j+Y6sgfxbCIOEQaUQNsFW7qqnZ1dCUE0wc5JSCY
         /Onw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=x8l7CpSDvTNLg1xYA72wI592g9/7VsLjTL8FFY8OsZ4=;
        b=ePH4bSb1ksHzhl6Vd3u6f+8Zte9vDMKldr/glvY4a4JzJu2idGKE19ClA9q/6D0asg
         sVdmT/gwZAnx+t/ZVB5TpPIvZlCLhC1dLADiA5KfJs2LOnTRVkvaFPCqotsOD/2FC3mc
         BbwynfpLM1DuUkdgRIZxqgKofVV6VlxutZXVOorHJRR8gw9q3+hTAqv27A78N2JnrmCw
         Vm6ykJssCI9s23c11O37J2ZM2JOttXuW7VY5qgnK22DAVwSItKQWZSpCNiym+U12YssR
         h10TRY51GMfAL1HZnPOMhI279ZPqhHB+FFmwgbpjrFpHMA1KiYjffa18Aq/qj0/xDw7a
         wPzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q3UsC/4J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f127-20020a256a85000000b0066e3d7fbff9si4633954ybc.339.2022.07.04.06.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q3UsC/4J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MEt-0001v8-OY
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LvP-0000ae-4z
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:15:39 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LvF-00021O-W4
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:15:38 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c89111f23so31575847b3.0
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8l7CpSDvTNLg1xYA72wI592g9/7VsLjTL8FFY8OsZ4=;
 b=Q3UsC/4JLlhLcXolYjrkAXbdQz5ATdy8eIGEmusaxaSSBT6sqCWkRW7/VEU415guRG
 RMeetJf7175SYP/gdgldY5JU9xNGw8X5qc3gEETUJXBStUxms635PZXOVC4+solhIdcG
 z4GU6g+KT8ePywDumXvQYGzFFb4qvfuZjRmakzQaCVfZTKoqXUfp6EEs1Qo+6U6Se0p5
 lyoV9c40Ao7DAMDf/2hnF7VXQceMRyLwWf3A70eWkQZ6zUF8nYLJYyVLbXutp0OhLM33
 3S0itqOq9ZhsJ2mVBC3Pit2UA/4fgi3lKA5XKdfBtNiembAkKm3sP0ie62Oc/tRnbs8o
 Jm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8l7CpSDvTNLg1xYA72wI592g9/7VsLjTL8FFY8OsZ4=;
 b=Gq9I+VT/+2/w+rpXwxxqgsWHAsLSc4MaX0aawa9gKt7PSoLUIZNrcWe6fs3XiQQYdD
 lOdnD/AuGeJxs1QX+0+3CdgA/zmN+QnIBYZWt2JU+0mlm9b+CzGmUYW/F598IyoCzlec
 dV+SlJIda/Ss6tzVkerxgNkKzQxrxQ4Kttji3WbY4F42+dfnlT9VJOdMAiwSooz9VozZ
 vu951pS8dcfhILgmj+xq8aeY0G3ChZImWXaFhN9smzOBF+iZikEkyP50bVnsgZnPt4lr
 TlHSJSkIkrI1AVZh9IYApTXYjERB3i6QnHlAj7FsIihFnTu6n1YYSbYtv8pLdeEK0JSI
 jkUg==
X-Gm-Message-State: AJIora/Ba3qvL8/JqijWA5WImRrpvWYLaeEdRWSBn2wVHjoOXxs/zyRD
 NgDFJqynT7nj8B0stf2i9rpC6hTf8Qfn9ALBCaKnMQ==
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11252237ywc.64.1656940528466; Mon, 04
 Jul 2022 06:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:15:17 +0100
Message-ID: <CAFEAcA_yTVPzWmN1kvDay0+6A4ds+2_rWRdcSZchX_Du7v6Yqw@mail.gmail.com>
Subject: Re: [PATCH 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQJzCoXDRW47

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will be soon be used to hold the underlying PS2_KBD_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c         | 3 ++-
>  include/hw/input/pl050.h | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index 0d91b0eaea..7f4ac99081 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -182,9 +182,10 @@ static void pl050_mouse_init(Object *obj)
>  }
>
>  static const TypeInfo pl050_kbd_info = {
> -    .name          = "pl050_keyboard",
> +    .name          = TYPE_PL050_KBD_DEVICE,
>      .parent        = TYPE_PL050,
>      .instance_init = pl050_kbd_init,
> +    .instance_size = sizeof(PL050KbdState),
>  };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
