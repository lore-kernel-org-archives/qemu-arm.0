Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp164343njc;
        Fri, 21 Jun 2024 06:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA/XTO24+yMT+qxDCuyQIO/4pV3w3j47Z6JoNqC0Lrj2aR47kbnp+ZTQgvEgP2DVYV9aaMMYZpVrzCiu3LPuBEz46NcxkR
X-Google-Smtp-Source: AGHT+IE+c2HXVtmpOVRSWApUnvrV2OXoNR5WOTcGoDvrq+RNPisHrGdNhA5eY+IKWJDIG4lyXN+i
X-Received: by 2002:a05:600c:1990:b0:421:7997:bf79 with SMTP id 5b1f17b1804b1-4247529b19bmr68033405e9.36.1718974846590;
        Fri, 21 Jun 2024 06:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718974846; cv=none;
        d=google.com; s=arc-20160816;
        b=1KiOfaI9HqADUkmEzmmwIJUQi77ulv1WMlkhOYOrqAj1j9c7dAVxvr2Vt2kdWSt9MC
         yuTdEtXo/2NuiKiWqZgyAa6q7xXEhUM5kYJPaGQLV9cz55AwrJdPAx9eXsmLOs+j9/Sr
         68stv8ed+yM5zSbydlpPXctt7ypFUpEO97v2ASCk1q50IXqKietSDMZe1x0d+di3ZDX/
         1sA7yVeR8zSMektczoz+au6MvNt1af1Y8+EAiB1yt/wc6p6vl/kRfbRoYxnIqfERluyN
         /nqjiYnDSGjD6cuf7fmkIyX78E33Tbb3vx7mM0aMYkLQI4SByY7ExllHVsUFD9VQAhZ9
         wFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+drZjJzYbee3AGMGFwQ0cOXoH69Amp2mQAD/LCIzUzk=;
        fh=l5fGeQ3gv008E5d+cecWXwhc8M3A9C4omlBvqsO+6r8=;
        b=f2NR6fmEemMi5GlpT4v3DBTVxEC2X5ZfNO6r9v6WExdEBmwXDi02J5yh/TZoXD0s70
         l5VituArB5bsFYf8GN890BV1/q765vQJsruAziCF24M1x9dSqqpfBsR1MzHKlS+L9n4K
         XgcqidthFa/03jDLl9gfsdBxxgfUyMMXnOAWbRLElHh8R24co1cpdsdR0QPCSdG/VaqM
         5MPjei5vUiom+Ysm2bWjLw8bnUoXABFHSmL+LSNb1N+Bt21cinLPfauhUEqlQUrIaRJ/
         jtKbV/fP8L3aR85SmEi06fHAJaIYHAG9YRzj41pdfJge5JtKNfOocuh+MgwgovLC4RK5
         qhoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsVDVack;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-366388c4026si793934f8f.234.2024.06.21.06.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 06:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QsVDVack;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKdrp-0001oJ-H9; Fri, 21 Jun 2024 08:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKdrn-0001bt-U8
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:59:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKdrl-00019g-R8
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:59:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d07464aa9so1871201a12.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718974784; x=1719579584; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+drZjJzYbee3AGMGFwQ0cOXoH69Amp2mQAD/LCIzUzk=;
 b=QsVDVackZANKU+LXoQG+OsXIiFAKB8qh2RcD+Uco5XSGHBl5wBBxsXdB4JUzz8664R
 NZVU02VZdbcTvJF2YrAo0HeIXiTUhWVumIeS/IuIWvNlJ5rci8oIjZplefXw6HOXDR35
 df+t8J6893LzUVmpP+uD4wbU1neYILowHbpaKXtm0BTy8h4bVVG/GCQFkGDH5d0D/swJ
 yD4VREqGQGHoTfXFQKBlNU47jgVUkVtBEPk/5uPcJ71NEmurD9jPqA8N6j1dqdWhy1DG
 cSxqkPaYswTLxqg3c6ewGSnGYXg/eiTohLvpKMWEJIAYiX9Ec1jnBI/aFfmMINrqjsjW
 +ZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718974784; x=1719579584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+drZjJzYbee3AGMGFwQ0cOXoH69Amp2mQAD/LCIzUzk=;
 b=LTOY7P9VMRe3u5tfgytLxwrEmT8/ZZKhVz7W4v2IrrP3tGNDZWL4Rx5A/KpV+F5MqJ
 IUvB9lzn9gTBjfwxXfV2D8l4p5Auav+CvSsMRo8o0d2WHOSRT5dwtx7cIa3wTU0E5nAL
 afraOffT5PBJnrH8Gqx+ok2bZ853zBX5G5BN760CfoJucYNFBc6GUSUp79G4mQvDdzHt
 2hJ02XPz+dp7NySp9tvZ8dN3EIjUz/1RUreNfAhRivFmERrwGO5Do20yaVY51FKf24qJ
 HYutPijrTz/8N7DgGT9coOh6NJ1gjaamkZO7aafS2nTw+uklYkVNlUnmObk0GwS2iTxY
 cN7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4M8jpKwpK4YdmSR7fuDvyES3HCYoYppeJYfbAy5VKyu0un/A+2DjOUiDBEHkoXCaX7bzd1BffJMezEhl7s4ND68xr
X-Gm-Message-State: AOJu0Yzmjdyl6cUWzhXbKTS6PaTZMAXz21n48uanQM3VnnWcX5KOLkYq
 eEyIxzfNBOdjUAakSyAEuvDXjyU4VDWRs1RJSjp65a8PPBRhCbMfRN07sp6uYSf3p3wyI6qOnSV
 p3b9+0iQgeLuEyLO19WSBwKJ8iKPnkSmMoXusqw==
X-Received: by 2002:a50:8711:0:b0:57c:da58:51e7 with SMTP id
 4fb4d7f45d1cf-57d07e18fa9mr5445522a12.1.1718974783830; Fri, 21 Jun 2024
 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240618135550.3108739-1-zheyuma97@gmail.com>
In-Reply-To: <20240618135550.3108739-1-zheyuma97@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2024 13:59:32 +0100
Message-ID: <CAFEAcA8uf-hSP7=w3om6XX7u+v_bQs_qvR1k=XhBp2bzF40Z3g@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/stm32l4x5_rcc: Add validation for MCOPRE and
 MCOSEL values
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
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
X-TUID: CVJ5PhAFcAVE

On Tue, 18 Jun 2024 at 14:56, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> This commit adds validation checks for the MCOPRE and MCOSEL values in
> the rcc_update_cfgr_register function. If the MCOPRE value exceeds
> 0b100 or the MCOSEL value exceeds 0b111, an error is logged and the
> corresponding clock mux is disabled. This helps in identifying and
> handling invalid configurations in the RCC registers.
>
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine b-l475e-iot01a -qtest \
> stdio
> writeq 0x40021008 0xffffffff
> EOF
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  hw/misc/stm32l4x5_rcc.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)


Applied to target-arm.next, thanks. (I added a line
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2356
to the commit message.)

-- PMM
