Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1914989ejh;
        Tue, 9 Apr 2024 06:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3euLMus4WbiZGQ/2ZtkIl0ElgO74sbjePs6fnW7tK/OF+gT/8gr9TL19mWZgFqg1Sqh+PI9iVYLAZGsPge2m7CJAlaCnG
X-Google-Smtp-Source: AGHT+IFYRsBo7YpeDy0B38mHkDMvvzdD0gSswjSvRlTGer6Sfakk9UBI/sWqMj4ILvGqHEoh9voD
X-Received: by 2002:ad4:59d2:0:b0:699:4a50:c5c1 with SMTP id el18-20020ad459d2000000b006994a50c5c1mr8490188qvb.38.1712670308007;
        Tue, 09 Apr 2024 06:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712670307; cv=none;
        d=google.com; s=arc-20160816;
        b=k9zwBrD9auMUag5N5DX0jynxX2+P5h852gKB4FbEFiXAPbWw+Bafl7jCB/atdwCt21
         WjYuA1vnq2gzjNfSawGX3Tb6KaV5gab8diP58/zvVjDsI7TosuNbnx9tfEDrBjGvzuCA
         b3H9wRpVbpLqiwzVjzAJjPHcVxR2q4jKsXgeHJ3x+kfHlYog3vAExoOBSiAG/j/P6BMe
         N8ZlvoUDovHlzced49kIibO4Dh/huTNYOm9555KyCxx1E4foyH7xOp8vfi1EvPQJUHYx
         riEc9XGkCzCpwyy40LLQG8YEOH8i1o0GEVEO5Wru5szarkSDMubsShuNV01ddDFiYYD6
         kzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XHJAKofpde+C9H1PFyYx60KQ7swMbrzOdT/Elo3VqPk=;
        fh=lMr66YWO2NNsKPKpMDQNKa75STa8w1P0wpumtLrUy6U=;
        b=s0yRkh90DDq3tHY7CqypCU+BT5bPDkOwrcb2IouU0Ep6vwzEzHmBjTN9gaP2aRYoWz
         WEfrRBhHavKmPD450ri9nE200ISa+Qjz6u8UcG+GyfL+A4CmWyzFgyngzEtKAVJi8Jf6
         c4zqBK49EESHAK2upmMUjx8dRzWAa24UUULpieR6KQhYNfQP+8ZiWZVJ7fKy7vw0JfQh
         TJ+D94lco/PpJNUZiQwTRxUSCNJQPZRXX2nBRsuzLci3wfRXgDs8UzOZK/KZerqkUmk/
         DO5/+Njse3Ugl8RK/cACd0inKbPDSEnTRZvnI+KKl/VsLJsmW6CpRX1yOJYsg75BW7wa
         +Ujw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xp4E873d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf1-20020a056214250100b0069b1e707276si4166158qvb.202.2024.04.09.06.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xp4E873d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruBmR-00089M-TU; Tue, 09 Apr 2024 09:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBmQ-000895-P6
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:44:54 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruBmO-0001ZL-0Q
 for qemu-devel@nongnu.org; Tue, 09 Apr 2024 09:44:54 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so7144737e87.1
 for <qemu-devel@nongnu.org>; Tue, 09 Apr 2024 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712670289; x=1713275089; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHJAKofpde+C9H1PFyYx60KQ7swMbrzOdT/Elo3VqPk=;
 b=xp4E873dI8RrDnDiVJODrJjSfdV5c6fqzcE42FA+lb+mh/cgB/TJGi/IRYBH0YPlwH
 74IEPMK5h5adDs3Z+T4d0fxCf51ymE2bWqmdPnXhh5OgyaO2npwpkpQyUzczvoFpdYcR
 3RZBH0FJulphC1Mf0IQCwyvUWMUVjGqaxBc+7T96mtNBPPSpvXE9+4cXdBwsd4UP14cl
 hweX5801p5HMGBQeIq98w63OzEoHevPPNOXkoQWlxt9WGgyEIINpQFoKxAdeVExIQmgR
 vitDAYqCtjRXcv04XJ/uq5L7758z4GlPAY0kHC9e1rdo3ExDirsqWK6gCsn4/+lRc6tV
 MDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712670289; x=1713275089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHJAKofpde+C9H1PFyYx60KQ7swMbrzOdT/Elo3VqPk=;
 b=rXfjUGPdwDlULwceHFHgAYIxN5j6NQQR5GwoFwp7KTLIQNqbg+58qkKOynGhor3+It
 skv9D+DUY8OCGr5AMpEvE3jrHZ3wTn2+7MkIA7iK8MvspFhrLIvi7s0gEZJ7bemeiXLT
 Hz6BCjptzULqRGRloexvL6XyueQpoG2VgPDvMe2ra17UBNic8MWCuBUw1Y7f6TfOocUP
 uJaClexh0eOw4Wq6+YJbt9um2NccobX0qb9IQ3lAHaxm2DBMUyERPWiYwpH8PdrUoxA7
 uCLCgXSopyH1iKF2vCCkuLwOGtVB4Vo659183cVliUFuvBlK3HT3wAm2D74urLrPaQ4D
 jIBw==
X-Gm-Message-State: AOJu0YwNhmlWWDOuw/GP1k7fZ1J7L6V52pLCFRbjuekSK/dBs8EaouZG
 LxbEz6dI7NT7Nr1KtW4tsETHAVDEcs7iN8xLaTCuYLA3QR3SHXA/LXtAAkoIkyEpshZ7j2xuBD7
 xfWYaYMOBCKmaOb8EF3Z5M6kwW+55ir9tUAjtnA==
X-Received: by 2002:a19:750b:0:b0:516:d471:18a0 with SMTP id
 y11-20020a19750b000000b00516d47118a0mr7052254lfe.67.1712670288840; Tue, 09
 Apr 2024 06:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240409133801.23503-1-philmd@linaro.org>
 <20240409133801.23503-4-philmd@linaro.org>
In-Reply-To: <20240409133801.23503-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 14:44:38 +0100
Message-ID: <CAFEAcA9NrzZyXrpfcs0RdvfGgYFjNkapY+V-5Y0HLNgDHyFfeQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.1 v2 03/11] hw/net/lan9118: Remove duplicated
 assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Chuhong Yuan <hslester96@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1ouUbbiKvKTe

On Tue, 9 Apr 2024 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> s->txp->fifo_used is zeroed in the next 3 lines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/lan9118.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index 91d81b410b..d6f0e37eb1 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -438,7 +438,6 @@ static void lan9118_reset(DeviceState *d)
>      s->hw_cfg =3D s->mode_16bit ? 0x00050000 : 0x00050004;
>      s->pmt_ctrl &=3D 0x45;
>      s->gpio_cfg =3D 0;
> -    s->txp->fifo_used =3D 0;
>      s->txp->state =3D TX_IDLE;
>      s->txp->cmd_a =3D 0xffffffffu;
>      s->txp->cmd_b =3D 0xffffffffu;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
