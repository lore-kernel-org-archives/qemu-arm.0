Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp804189lfg;
        Sun, 15 Aug 2021 14:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6r1vnG/I1thNQiwMYQ+VINwHJ4bXmBQ3X37OJzbFuejScW2nwLGrX2vhsga6fVEuuDd54
X-Received: by 2002:a5e:c609:: with SMTP id f9mr9873829iok.127.1629062749198;
        Sun, 15 Aug 2021 14:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629062749; cv=none;
        d=google.com; s=arc-20160816;
        b=OPUlVG9LtcqAIiPjKEV0lBefmWmQJo2aHXdRd56204L5PMB7Deh1xLy1uplPoEkQ0h
         oW17RcSKK1LTssBVZfKBjsn5L4KHkWgSAiUkET1rzNstAT9Uzep2Ud+PczeTqtgmD18d
         vRzhBP6P8gi5H/y+x4Gik36TA3erhx6k8WFlcviV5yhvEfbglsWBhYJUBhKd0ufO/Fee
         tHPkiEJ0W/qMxBRwb9pdqjdk9fPcBmft5WbGc+A2d5mxe1cAelztv08mQ6Jf+imcOnfr
         f0r6AjpWW1Z6mTy1e7/3uW6bPDiNQIlxRBbPTS0ge88w9F2EMld0F4Qsg5dZbtOpRr+Q
         xWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ELEgHucCu65ZYA6bTDYvaGOHXp7f0NsEa4uHXPEdCak=;
        b=OHVrkfxEg0GKHjPeTgGvNRquUsLTlaeAQeEl6r2VMuEJD9ixMj4hssL0oX2xWyKdC+
         PWmrCg9r7TFa2QqKbSJyKTjsyg0Rmv5yYC00tjZXg6qDEbCSoQApamcUZa4rEUEmib5P
         eXRvFv6Sn2uAsaTTdOM5bYMeRSOPwYjovqK+c7YreoaRvjT2/mMhohrJFuigkH09l9zb
         IGuc9aotALY640HIl6U0TUkFKoQtIxevtak1D7UK8nTxdIbIvG5twCMKB09KfAAXXZvX
         EIL0EEF/77KRKKXspk1z7FCYWEuv6DUmrx6SBCAsgB75QdPOCPGnioTGwW0eUl3FUyy1
         Q1vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=e8K0sSwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si9534115ilf.100.2021.08.15.14.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 14:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=e8K0sSwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFNdc-0006J7-Hw
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 17:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFNd4-0006IX-NT; Sun, 15 Aug 2021 17:25:14 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:59662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFNd2-00087l-Nq; Sun, 15 Aug 2021 17:25:14 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0C042C6019D;
 Sun, 15 Aug 2021 23:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629062707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELEgHucCu65ZYA6bTDYvaGOHXp7f0NsEa4uHXPEdCak=;
 b=e8K0sSwNqMXH1oWFSnWLahK6fXJgL2gJaTcI3zifWxwrkuiManDViy5a2/GGN5CoFrSrfs
 5rFv6r187Ichus0RRVYxzZIMF/3Nnsowt+hr1YPBntE1Np5KpQr2z/pUg0BGeJdTQEWXAy
 9fbE99VcN6wwB4+ayaV2FzBvnTF/WZlOdEFYNnzRAMz6uwoflB89wTwaUyK5y+IXPFhgMu
 8zTWKMSpm7as+q2Nzt5+rEd198A49xyea2QmrYm1/Lj355FGaX80vwbCWv0zf4Atc9dsFT
 rblrAl9DU5UNE/XXfWxuv0pe9g/cTXWt0QnbDhMaMaM857QgPvhNP7LTHOMWjw==
Date: Sun, 15 Aug 2021 23:27:17 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
Message-ID: <20210815212717.rewmmgfhksrcmaxf@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9iqkRXSDQyg

Hi Peter,

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index fc5a99683f8..c371b9e977a 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c

> @@ -133,10 +143,21 @@ char *clock_display_freq(Clock *clk)
>      return freq_to_str(clock_get_hz(clk));
>  }
>  
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +{
> +    assert(divider != 0);
> +
Maybe add a trace here to ease debugging?

> +    clk->multiplier = multiplier;
> +    clk->divider = divider;
> +}
> +

Otherwise:
Reviewed-by: Luc Michel <luc@lmichel.fr>
