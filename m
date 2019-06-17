Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2900967wrg;
        Mon, 17 Jun 2019 12:59:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxh7TuMdbJ8ADZI8r8aSvaHT7d1H0Sm8rw7tTlj0+GLIEeuX2A6SwzYbc7WWt/oxlGhk8Y7
X-Received: by 2002:a50:9822:: with SMTP id g31mr91744097edb.175.1560801579105;
        Mon, 17 Jun 2019 12:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560801579; cv=none;
        d=google.com; s=arc-20160816;
        b=iBzNsLSvvzdbgTVrXc1xx7ohqrveBQkaqvk0n7P9rgCS3E9prkqZQMqbNC7+ndyN85
         1lQQyepoCIhlLT6OIgdp3ugMe4FAv5cXHPhgvJEy9m+aS3oiJ2AqeYk5l6nLulMYyP6g
         1dbO+/N0QFZboflpOKmbJyo6hW3aMuCfDYlijMntr4XaBi4iFp0zLFYBa38sasbTsDO9
         vgW3wRr7h9H9k39MLxtC8iUj8uTJmTSeqgJT+yhKJv3AI7L35tKNZXza7oQ42vdrcQFq
         F/oIHm3ftg8xtK9IYgCDDdNh01FDtTyR82YnT/V1SgM6Vz5+kJ2rCRVKWxwSh84d+DdB
         TS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=MzEmANWA/oEzNp9SwidOOKf5gV/VJZKGnTQ+PcDmTl8=;
        b=jNuPXchqHwQ59TNtcwWGV5l9MeDRTicR4t8RGk7PTcnPINZcs6lEr1SfNxTntDVchK
         jQcbzXNi/JnPkR099Y8i5f5NkEG9Zx9ZIfWdgD8LcLCTbz63RrfYImbzPVPKNp/krYca
         aqHACodLLxkh+C0iMNYQY1KuXcdAs8d6xr6RMFY4x9Ahcs3I5LOjStO39/BwT6O34L3C
         i//CJ3S8GHqm48ODKkWpWIcGbXu28b/CdV0WMsiMBr8EDdIFqMJHZssRj6hU5O22qu4S
         1NXXia2ThVRQnbRqzP2i9D3Hukpilw1PNPEZnmYjudX6qu6wa/f960GBIVroXEbPu6Ji
         vTWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LcjTqbjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si5052417edv.154.2019.06.17.12.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 12:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LcjTqbjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcxn0-0002Yn-85
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 15:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57875)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxlw-0002Aa-Fc
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxlt-0006A3-7u
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:58:30 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45734)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxls-00066B-VB
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 15:58:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id s21so6353301pga.12
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MzEmANWA/oEzNp9SwidOOKf5gV/VJZKGnTQ+PcDmTl8=;
 b=LcjTqbjFdRbrE7l58yftYitNdIrCH0WNsDaInEqabKMFElBujoPGKVDI9J+/9gSBSR
 iU8uF/oKmq1BlORfvEmSNlzB29hla0drV/ccElmPotUfLD2W1AcV7LehkN3FxHaTaa+3
 amH83cmJnE56BCnXimI1d6Rbpslclm3AiAJqSI3eH1fS+icMa9pqVLp4uUjH2LzLsTQM
 QSVcGEdG+iJLyuMb6z4ttfOjrvwBVEwcdGcJWh68Ywf8U0GpBj+zlIfhcYQCsDrLYs4r
 TIM8stWd8B1aYsuL81AYpc3nP1XTLRtAWLLaCydD50FgbZvxzi40ynTVlJIY02l27gcv
 xG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MzEmANWA/oEzNp9SwidOOKf5gV/VJZKGnTQ+PcDmTl8=;
 b=cWmdY5lEg7rqafYyqC9WkWyWoUiDX24CQ6LrRXjPCBecbndAOpe5VNLwPcwrWBmP/N
 1VMJOCyOZ0g+dSmgCOqhFPdvuO17zTDcO7d9xbtzMP0BKSRAG2GytZjLNsIzUdumbHjJ
 0GBl3nbWo0J2ENSLJ+ELZ0R6jY4knel76IlotkdrFmEfX/iJsRyaB+g/ocWovz/yskjl
 f+7Zc3TrzUlQfXgQeqbaSP3++bVFYfMlKwg8GLaTUCZIwU0B5KeSMU+23iDB4OLZk508
 rOqY4cZY0yQNOmoKTZ28dEWMva1Z+aE/h4YytpZu12lphkqSM3FktjbKp5KU55zV9xSW
 rDKA==
X-Gm-Message-State: APjAAAUsbFXTl+44DlcFyVtMzz6t3dIoTJkC7/0OKAnJRcN/i4+K6tda
 S+lS7Jmr9GRQkdibJG1JWfz4BQ==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr11592070pfi.31.1560801507621; 
 Mon, 17 Jun 2019 12:58:27 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id e16sm17162923pga.11.2019.06.17.12.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 12:58:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d74796ed-4bbb-da09-c69f-f14ef71b08a8@linaro.org>
Date: Mon, 17 Jun 2019 12:58:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/6] target/arm: v8M: Check
 state of exception being returned from
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ES+m1ZaFlcb

On 6/17/19 10:53 AM, Peter Maydell wrote:
> In v8M, an attempt to return from an exception which is not
> active is an illegal exception return. For this purpose,
> exceptions which can configurably target either Secure or
> NonSecure are not considered to be active if they are
> configured for the opposite security state for the one
> we're trying to return from (eg attempt to return from
> an NS NMI but NMI targets Secure). In the pseudocode this
> is handled by IsActiveForState().
> 
> Detect this case rather than counting an active exception
> possibly of the wrong security state as being sufficient.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
