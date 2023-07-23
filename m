Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1219121ejb;
        Sun, 23 Jul 2023 02:55:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHyT94pznIsRC/g209hNZ4e1WRK9tfNb9SCJ/wXNmLjY/rEeai6KnBU6/cMgRzT811f7VzC
X-Received: by 2002:a05:620a:29cf:b0:767:d709:c3f5 with SMTP id s15-20020a05620a29cf00b00767d709c3f5mr6582822qkp.62.1690106112823;
        Sun, 23 Jul 2023 02:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690106112; cv=none;
        d=google.com; s=arc-20160816;
        b=ejziV0MXtS7Ppskvho5VkRQqDCCfLQYhQSjNIHU1VN3J4VIw+syRTwaeBSRgERnnG+
         hvwBVZrbgGcMiIsKTCVOxThmM1Cv9wDPy0Y+YVEzhaR5icl9ZAmJDgP84m1GNbzOS0Fb
         9WCsrNzjYYcAlQtR3JgJuWLshhoKJlNqzBFixgmKFGFQUS5j4Qvxkk1xl54o+4TO0DEj
         cVreM7jPEh1DecD6178Tgv/BH5SGl5SAqoc0V+TEf49CmM/1VKi0ZNcOxGu64N4Exmzl
         IrN3Q7jE1hMzUE0oAw5mWt65h6KPR4Tw/fBpc5u/kFZsi95frTQ30/C3fcqOKKiWBQSb
         ds7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QrErL2obAxAAiPfYIl1mVqoO9WSMqdQobkzypjE66IU=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=A8ffHIWBEbyWM8UG2w7DeUUQAFy/AF4w0R6Qd/zTxYF8dn97RHsdb8/O0WhsRvKrOx
         xSiZIHenenS31xWI/Y8Qm4umRNp9qKoa+SHh2dFi6ixHVpbmMdL1ctkyLAnqXeMl2m4h
         xJXpN3Ic/rEX0FSGC68huPzJbnmLpp9shnWi7yLLroh00FVIqJaPbijOa7BHjfzzj/j/
         bbauCslQs/Surwtsq5jiJ9GQXkTg887BS7y6LuLoTKHCZ9p7/jx95znTIzoUi5bP0myo
         mF93TV9T5ZvDIIXnSvEu9PkTtpt6dIcqER9zxM/8k6wyYE0UT2BJwHht7S4M/JJD1zTT
         +HOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YLwV/hR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc1-20020a05620a520100b00768064b375fsi3579306qkb.752.2023.07.23.02.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 02:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YLwV/hR/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNVng-0002xO-TP; Sun, 23 Jul 2023 05:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVnf-0002wo-RE
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:54:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNVne-0000SG-Bw
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 05:54:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso31140535e9.3
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690106088; x=1690710888;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QrErL2obAxAAiPfYIl1mVqoO9WSMqdQobkzypjE66IU=;
 b=YLwV/hR/oWUmAtU5xLl892iz4Yr6y6pJ5nyvnolJ7WXKlcZfjpoO349gUc41vKeytf
 miPHW5CCJtgfu/dcWU1qC54kdH9HzQTIAESL1GDnonAA4iWsqfBsPC2Db0dbL4w9ay8g
 YQo3jmx86kbp6Di8WgCUXiNLltnjsDSKPn+LwmoG4q9ShTOqtTP7TDpiQ38lhSRgdLsb
 mvC4lbWY/iaQ1jJ70ss33cpEhz+3EgLgO7DJ2N9Jefck6nDD17zAHBvNBgWzxiP2kBh0
 ztoNOlRWRm3UxXg1ZaUAkIsgA4fEuyiy0obLXGnpgl8JncuTT2QUspSIuC61UjUXnxnT
 I0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690106088; x=1690710888;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QrErL2obAxAAiPfYIl1mVqoO9WSMqdQobkzypjE66IU=;
 b=DEjCHjurgVs8FWsusV4MnLDls/g/Kc75s1qRr3nYTLHhcU+bZ8ffnjxFajGho54CdJ
 cH544/k6dEF8Z5aPJ8r/LE52DgqEiGyfiDk5ZI8HmlS4Tvenr4Q4qSChHxjyxKTmpE2n
 L6TvnqoAwSKbg3vKLSVZ71ssSHC5nazUgcl8ScAIfNUlpjnt5URvPkqf8bL2rqrXnsfi
 /7uYQ7wKr1imO6kpElCqQD0oogS92NYYdVbWpHuSscFv6xaBgNxEk3384vCUOpVYodcn
 rxPkNgYVVoZoedNcSOXobJ+IDxcn+hkzjcaXWIyHYn/HUHTSuGJoaMMeGQ352XU4lM5G
 A2jg==
X-Gm-Message-State: ABy/qLYFNdYrRHoLlIYw+X/z8qIIOI5J3uwL9DuzxLPhyUb7X3KpLp3P
 ts0Kwc3taizB8/J0j9z80SOKSQ==
X-Received: by 2002:a7b:ca4d:0:b0:3fc:70:2f76 with SMTP id
 m13-20020a7bca4d000000b003fc00702f76mr5502287wml.20.1690106088267; 
 Sun, 23 Jul 2023 02:54:48 -0700 (PDT)
Received: from [172.20.2.226]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a056000010100b003144bfbd0b3sm9215601wrx.37.2023.07.23.02.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 02:54:47 -0700 (PDT)
Message-ID: <2ffa4ff5-56e8-1f4b-a5e4-df3eed4004d8@linaro.org>
Date: Sun, 23 Jul 2023 10:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/14] target/arm/ptw: Set s1ns bit in fault info more
 consistently
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /t8xNjDnrQBW

On 7/14/23 16:46, Peter Maydell wrote:
> The s1ns bit in ARMMMUFaultInfo is documented as "true if
> we faulted on a non-secure IPA while in secure state". Both the
> places which look at this bit only do so after having confirmed
> that this is a stage 2 fault and we're dealing with Secure EL2,
> which leaves the ptw.c code free to set the bit to any random
> value in the other cases.
> 
> Instead of taking advantage of that freedom, consistently
> make the bit be set to false for the "not a stage 2 fault
> for Secure EL2" cases. This removes some cases where we
> were using an 'is_secure' boolean and leaving the reader
> guessing about whether that was the right thing for Realm
> and Root cases.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
