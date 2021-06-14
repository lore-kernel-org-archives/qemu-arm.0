Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2275510lff;
        Mon, 14 Jun 2021 13:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZg4/igqYwOCd8RZXn5PBhK0YP42DDqL8B/R6+xdlUGSdVgBg9wMn6qvf7TltobwC99lyn
X-Received: by 2002:adf:f382:: with SMTP id m2mr20768014wro.394.1623700846224;
        Mon, 14 Jun 2021 13:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623700846; cv=none;
        d=google.com; s=arc-20160816;
        b=qoLprTDXPywRJlesmYBDQtTTOgCIFVYmzcP24V5wcidH0wpFn8Ot78gfeUNx+lp3zO
         9TxseoCSHcHmC6j652uL6kUIUOVPUr0g7r8lG7yBXdyFBzoyjn/4N7XIHSj1sHdZNLsJ
         cBIXfasFQ6XdhQYw0R9CjhRfg9wpiegKiFyQTbYES+blzMr1KZukpPcYPf1kG/eV1Yp+
         sVVXKoG43l0zPyb1KTLD7PniR1WAz/fw3w46ED9J1OhjmFgr6L0/WXwiyq/xc9QtyNSc
         3bcyKnatq58cUNmOgK8XiVzZrXV1cDM4D8P6bcjLkblVuBqDpDNDvJR1EM8BXGij2NP2
         WOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=91gmc55nyUh241BOE+IqKVqKo7V1obEe0tdTmtw7HAQ=;
        b=GM10lvopz14Yx4gEoQbQrd+8GQrKas3BH5YC8Uu4QGw95dbvwpxvF/LTJQ7y9EzsTY
         vNZ1AKWD4gWQOdpFgbtelVlD/AqNBrjA7MUcK2445EttBkJNru1f4Ql1kpddNCdcj0uW
         G6zbdnf1coRh7PRZ8cxGAowtqyNOnPT+llXNk1LHuCE/RH+FdBInpijrWgLIvZ2JKNp0
         emm8+djB5TrzmM0BCKZdcCKQ6Z+a4VvqsfH2Dwh5g/YinP4FvSPGzLs2yQuw5ISrKauS
         d5V6G/XziWAX5lpR8fwjNYlUw6b+droAzFgi9LeZduzDN4h68ui1bElgUI3VNqaiytgh
         Jwbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kM31f1jB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si16244871wrp.492.2021.06.14.13.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:00:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kM31f1jB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsslJ-0002M9-9u
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssl7-0002Lv-GR
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:00:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssl3-0005tn-JQ
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:00:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so733527pjq.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=91gmc55nyUh241BOE+IqKVqKo7V1obEe0tdTmtw7HAQ=;
 b=kM31f1jBazg95oaVtqi2NcfYDfeMeLJJzSig/tzrMwlfb8fAygC/mTSZzrkPHFXJaA
 SMVo4BbOc2jzqROBlyi/9w1shs/jGjghvvaXXdAUh+L3R7TQH2Y5UzPdVd7ZzrhLkON2
 NIsPR+Od10uqqPoERQALqtVyZsNJLdJ9NOjuWBLzyejqy6LX0sAB3wbQSYVCjBgAqy9Z
 ARfptxOlOfTzN4leBExPKRR0E8YCRjuFnLT0vsiPVyDltTyZNwKW43mo50TjQmKZkZIt
 Z2okzrwcdWiTy/17Xjj/bmcRrLzKfJoRaH98MiHeUTlGC3+FDydO29GDl7rrovoCzcEM
 wj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=91gmc55nyUh241BOE+IqKVqKo7V1obEe0tdTmtw7HAQ=;
 b=LzJZIJHYG8k0NlunvQC69XRsRdKam1BoamYLQ69xgy/PjA4mAQWHGd65icABRKmOZz
 j6Udk96Lg1tF/Egb9qTDVyVC47vqxHuS5pOMsnK6DpbnpT1lkmWb1u2HA+5XV94T8FEc
 j2LCFHY+nxjKtlfUSQ6Tzwv6oBxO97QoyMMdNblnIL1aaX/hbVD6K1Pt9X0j4Cbwnm2e
 W+7W6OLgB64DziKIRfh4BdNcz1a9KRc/PCc5ler8QZQ/mZrF0eZtrpHtAnbzA6wzQ/0e
 jQnvL/rMprqCyxxcSuE3p1lMVXKX9zdFsdvTGjqNMIZcibjGJw47+ydpkBCarSvHcLcG
 uSDg==
X-Gm-Message-State: AOAM533cDg6tvo5VvlBfN+d0jd92AligvPRarasMDMpHzSsztMydPFQ0
 6nllVD/ApPSL1LIRgbdoNYEYxw==
X-Received: by 2002:a17:90a:398f:: with SMTP id
 z15mr20846769pjb.183.1623700827609; 
 Mon, 14 Jun 2021 13:00:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g16sm14137468pgl.22.2021.06.14.13.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:00:27 -0700 (PDT)
Subject: Re: [PATCH v2 14/57] target/arm: Implement MVE VCLZ
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91fbf139-d4d1-c985-6d78-891f82b3da6c@linaro.org>
Date: Mon, 14 Jun 2021 13:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fAQFuyYtkLaY

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
> 
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++
>   target/arm/mve.decode      |  8 ++++
>   target/arm/mve_helper.c    | 97 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 38 +++++++++++++++
>   4 files changed, 147 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
