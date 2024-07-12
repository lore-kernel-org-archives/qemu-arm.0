Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp913214nji;
        Fri, 12 Jul 2024 09:40:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8yV8FMvs5/cf0vKmDyUpDAy6DEdTagXHMlxzkhLZbGgMCbTnerzSnDcymiiGnaRxB+csXo2gHXi7WH5MaV5odtlzepa3m
X-Google-Smtp-Source: AGHT+IEt33FDjg65VBMFCwEou6HH6f4RBJkQg+Ru+U4A7zFYF6yaZ56jPkihq1RWpupKhjn6R+Zm
X-Received: by 2002:a05:6214:4011:b0:6b0:8991:a2f7 with SMTP id 6a1803df08f44-6b754bc38a9mr58004626d6.12.1720802430006;
        Fri, 12 Jul 2024 09:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720802429; cv=none;
        d=google.com; s=arc-20160816;
        b=Il7c5MuX0uCwORTTo6IXMq3lFx9na0Cxx+dD1tE4M9zEHZiPGfKw/g3IhgmNjkGyes
         VwTCLZw5IQYui9C0lnk7wXWKJQcWrPOIzPvUHA4Lp5vgCWn9IO60IEMzSFehEsuP0atP
         IXblRuLNMg8HkrrkFqU1gR7TecLkJFA1FXfzSld3E9t8W/FqdC98Le5yTxrRxQFp9KcK
         NSXVt8kcVxqOVll1DuHIqhaAAAju1KK77YTi+ddcBtBtAnwLX5dJ77+mXrgW0JZmIHw8
         d7gz2Cz5Nh2tmBDdPq50to/fAGDKNXrb5hv7y2oyDUj8hUwGaWK6i2vQPUbtinGOEOlD
         Lu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zAmL+2WJFU64d9q5El3dV1ssxDBVGOCQ1wKocizxaPI=;
        fh=8ugU//8/7H+gzZbj3b8EVZ+MsTXHdsGAQ44anncbDWo=;
        b=xOnPqx1tEm2+c+N8LCAZDeXmkh6ndegIk/zjVlSNCGXiH06X5HU/9p5ffS//FGO41Z
         N1LUrgoZkAIc8K+wShnL+vbzl2rOFMR4HD1UgOfpPte+W3uQzOFB6z9n3+GoFJsjSXOl
         fWCwvWqzQzNgocO/PrFOM/izPG5dCb03ckbB4O8NhIvICYF/Mn+EdCC1wBHWXP7ZuC6F
         goxwdRVI7EsKRRO/0HnyoApguhQncqJafgPDthmCT6q+CWWyzNLwLjThN9rdC+tBBbE9
         xTdYgdiDccvZaNtFa8j9J06GuvBw+prTzgGX3QgpPUC2JJ80VVO7zBWL6rEF6Mr6C2tc
         34tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WS17ZJXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bb0aa33si97639896d6.612.2024.07.12.09.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 09:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WS17ZJXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSJJS-0005ac-4W; Fri, 12 Jul 2024 12:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSJJQ-0005Ss-3O
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 12:40:00 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSJJN-0005Sp-DF
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 12:39:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso2979220a12.1
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720802396; x=1721407196; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAmL+2WJFU64d9q5El3dV1ssxDBVGOCQ1wKocizxaPI=;
 b=WS17ZJXQ3BKffkMMeGTL+jvlVJcTCwtHWePXjBpvBjTtmK0z4LUf+bp6fP8M2ERJBy
 3Z1NHJ+sfr3XYGyKKBUMOsd4zrdg6IFSwUiWfchBTSPIgQk/ghg51PaWwTiA0XVR4pBn
 Wfp4qGLzf2SsjI22Las6sMivpK6Tmt4sRctdysJIsZbUs+f1Zxn27OCeUyapsiLbLDrt
 ZB0ySL6j01whDOxyS/frQhlPeIuvQOw6YTBPrtrjRcyIy3aMiSU+et5oCwvFWcTHVBHU
 MmE1zq7GRt7Q00mGSlLiM2Hn/+w+WmdXJGOzgxhQYD/s1P9wuO/ltK0wJ1bmjtR6abfE
 u8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720802396; x=1721407196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAmL+2WJFU64d9q5El3dV1ssxDBVGOCQ1wKocizxaPI=;
 b=JLkqxAZ+FGayp82EatxcP9OAwjzJbMcqEt0LhHPapfdukQjeXHUoUUJTx/72PzRA14
 FvHn7Kdz1C1D04LuImEOj3Q2iAgU4oKhk/qczFlIHU+3tdzf6zSGo2hhZiBRQRhONPjE
 WGslvqb9oAqvIBcrlXj3ZlBfqqd5Sjnytpw/TzAzl7ytKnLvusyg/lpA4QLdzx6AfVEF
 Xl8Dhy4KARLYFFJD1AxN0Y7BwJT7cMlTax0Y0mFAfbPHYsmxDH2v6qFAQe354eL5mgfy
 it1TMxKz/bhj2pOj0gM366bM/EfRQkVt0GFCoYh7bndW1CDh6rTy+ElsKfBZBMVQlAQ/
 OHOg==
X-Gm-Message-State: AOJu0YxujYFFSKpBVzmudYrai5b8pdaefsXwAE+DvoKHPc2/E6sni++T
 II7DWpmqxKmPdi1979CvM1EjcRjZob1SvKCiyL7zmsBuEQX8DByIFmA6ELxm4Sjn5W1tyiqkvuR
 JFkNfTbx40QHrRh3IMlLlXbooT/qUEOfj2QlE6Q==
X-Received: by 2002:a05:6402:33d8:b0:58c:f5bd:eb65 with SMTP id
 4fb4d7f45d1cf-594bb674df7mr7079634a12.22.1720802395551; Fri, 12 Jul 2024
 09:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240712163619.1734214-1-clg@redhat.com>
In-Reply-To: <20240712163619.1734214-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 17:39:44 +0100
Message-ID: <CAFEAcA8_UVRG5ihnSPzzA=hVmkqOO+ifOzrfECm07ebp3gU9Og@mail.gmail.com>
Subject: Re: [PATCH] aspeed/smc: Fix possible integer overflow
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: cWsrNUbY6mRa

On Fri, 12 Jul 2024 at 17:36, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> Coverity reports a possible integer overflow because routine
> aspeeed_smc_hclk_divisor() has a codepath returning 0, which could
> lead to an integer overflow when computing variable 'hclk_shift' in
> the caller aspeed_smc_dma_calibration().
>
> The value passed to aspeed_smc_hclk_divisor() is always between 0 and
> 15 and, in this case, there is always a matching hclk divisor. Remove
> the return 0 and use g_assert_not_reached() instead.
>
> Fixes: Coverity CID 1547822
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  hw/ssi/aspeed_smc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index b79815c2b8aa..7fd63669c10e 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -842,8 +842,7 @@ static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_m=
ask)
>          }
>      }
>
> -    aspeed_smc_error("invalid HCLK mask %x", hclk_mask);
> -    return 0;
> +    g_assert_not_reached();
>  }
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
