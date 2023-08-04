Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1707196ejb;
        Fri, 4 Aug 2023 05:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsfq2Q0qwFHJhqKlZcZtlgN8TwAxdRn3cu9Q/ralBFkglbHaIh0na1vrtXUBBKbQw1RHpQ
X-Received: by 2002:a05:620a:3913:b0:76c:e764:5071 with SMTP id qr19-20020a05620a391300b0076ce7645071mr2246146qkn.55.1691151698075;
        Fri, 04 Aug 2023 05:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691151698; cv=none;
        d=google.com; s=arc-20160816;
        b=UOE/Z/4TCSjEev1kWFVoEW8RBDOJztK7qAs1uDxSHtvCyd1orWM4c98pW2nstuaOMU
         ShUoegm41pO+oJDTWZRUqw6UEZV2jU8YPGdi+AK3wDRoTyz1KP20oBZJpAdarCJ+vyr9
         F1pLHz6wo36As0q5MHHxqS3BQMAFLz7vm+1LRZteqkk9iY6c4Jjr/vFq2riLsFDJf5eV
         xewFSqnD+5TDbsMGko2LMd3zLPbgHxKRCAi359oGCncNmAkJaW/2FVLuJFeZ7Y7Bxn2j
         ibHmSDrdSMoVql0/EI6OA4MxVSAuflt39JbHlGra4WGxJz4pFXhMhywd5VHE9/gooS01
         UFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b+2RejFsW7GG6XTrNt7Ulg3EG3QtR6PZwEeBRFn3KA8=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=P17sOiu6ubueMkDD3nCcu+HagzjqKiUdc7VDagSN8EFsr8hitsTzsE3Dwy9GhA9s7Y
         8I4WN/K4gjJ7tZfFJHW8yvRLAAgvbgLd6pC9/UeMfRU3He+XZ36wgpd4IHfrBT+NLR91
         igupNbiAA7Bj5+PSb0xq4Kq0ttcSaCDa7AuIWS/MTmYt9G3ZLZpNfufktNMdiZvFdLe7
         dgEhsmtIUxvuPlq1ZM3/ptBbU7/1outZSQ/gQktTgGhfFPE3zl3+0tgCqu+cU2IFYiVg
         18LAkYgNWAGlnS0b8ERV+Q3+twTU1oeTvFsLC6IwXy4xEuB7nxy3tWUr6v5KnWD+Qwrf
         2S5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoAq+dWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd16-20020a05620a659000b0076cab653f6asi1095042qkn.153.2023.08.04.05.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 05:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoAq+dWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRto9-00029C-PO; Fri, 04 Aug 2023 08:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRto6-00028n-3I
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:21:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRto3-0007EQ-MH
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:21:25 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-522ab301692so2661146a12.2
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691151681; x=1691756481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b+2RejFsW7GG6XTrNt7Ulg3EG3QtR6PZwEeBRFn3KA8=;
 b=SoAq+dWT8Grsg/BbNxWbIKubtxsPzJJpINbrHCWDD3HM9IQsoM0HoD/t5DE+MTiFXF
 OxqlKwbpVKnMTCxU6lJQF1lDM6GG2ScQwaSTTRrRHirmTHaVEQx8OhPyI5U1uba76jg6
 DOtqnw5qR4Vdk5ezxZaiP5wJB1rePy8yCx9g3ruXYPgowNaN3Ep0Lihn6KPeeG8+88gz
 qpjKxEvUiUYZgQE9vknJ8eZpFeXx6bnCKzMF97BzJ04MeUfNqKVcgs+fN1frayn3SXIk
 7yYit2HALwFRSar/m2CQn+JtZ7nDvsOH8TnaaSEUKS1pYZBo4EB1YeWZLZpAAlkVcbY0
 sIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691151681; x=1691756481;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b+2RejFsW7GG6XTrNt7Ulg3EG3QtR6PZwEeBRFn3KA8=;
 b=Gra93qrneI3Bq64LSrQU+h9W2FXsnHzeSPyeX8Pr4GQBOlHAUVXKKT2CMApBY6X5mY
 pbjD5OvfxTTP+SLgX1XRIAcu1tXGD8tF0HcjM6sOO/hjFXpkj9zLzFAn3vGBKeDJYgBJ
 b7xnTFXWpEAxiZoTENy9bDAgNpc5CoCAxLxstANf0nAGwehD0oQxA0SWtoaVl7pSYB7n
 MVDcLCYNrh1t1jjwk20IPiQUZZT52w0pZwoZQzyJ70o3NzCIrGQ6p43zA6Ml7v1un9c5
 m/f3K4JPY4TgOVF3S/G4HbMapSxp7Z1xCbNje3BEccNG+zpdTcka7GArNN0idV4ezbZM
 50Kw==
X-Gm-Message-State: AOJu0YxFzkb37x1EUF7/3opnVsplhBohIrJWTIyjsCNxBuGugrYfDvJv
 lgqSDD6iHIIcUQjMBS6bfPRjqUtFqXYQ2xdXA/TnLg==
X-Received: by 2002:a05:6402:282:b0:51e:1af0:3a90 with SMTP id
 l2-20020a056402028200b0051e1af03a90mr1367114edv.37.1691151681471; Fri, 04 Aug
 2023 05:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-8-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-8-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 13:21:10 +0100
Message-ID: <CAFEAcA9bj7U2LQFCPGDMB9p66ODhUH2SSnDKmSJ+y_i--7zgHw@mail.gmail.com>
Subject: Re: [PATCH 07/44] Implement BCM2838 GPIO functionality
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8IsY+D8QYfVG

On Wed, 26 Jul 2023 at 14:51, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/gpio/bcm2838_gpio.c | 197 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 193 insertions(+), 4 deletions(-)


>  static void bcm2838_gpio_reset(DeviceState *dev)
>  {
>      BCM2838GpioState *s = BCM2838_GPIO(dev);
>
> +    int i;
> +    for (i = 0; i < 6; i++) {
> +        gpfsel_set(s, i, 0);
> +    }

This is a rather inefficient way to do
   memset(s->fsel, 0, sizeof(s->fsel));


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
