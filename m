Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5718731lfa;
        Wed, 9 Jun 2021 13:25:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdX0KxGGAVjtBM2EoPx52uZ61vvxphgg7HLQdEtGA4D0yrjVK0EbGbLjliXvQgPBR8FSTg
X-Received: by 2002:a9d:624a:: with SMTP id i10mr969882otk.57.1623270317239;
        Wed, 09 Jun 2021 13:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623270317; cv=none;
        d=google.com; s=arc-20160816;
        b=niZcIGXUD6EHREqpzwTugtsBSvgapqhNo57kXw01bGbuYM4q2hsDISHKbA6jQ0p4cz
         OT4z9mAAJfSD9iXo2vYBtUhIKIiEijtxjl0uhKsXTtPbyrDvDGgmVpweBFLx6wiUx/R5
         6kpn9UfwwsS01g7atEdtSuMbXohtsSb9wSwdcs4vwWQSUU5xan/F0mvFQ8j+e0M3w1b2
         qrZiYQYUBuC36Qp+xZwRn89ebu6dlQit2GbPL5A83qyRRY+jvX68ZLekq2Et9Uj8qzqO
         LRr3zFPZdYyPpaJ9fiz8tU4bl0UYnXwGsTFcSPN07Ijq9iT66ntaKs5maLE6jdLVDEG3
         NJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lvDJJdAhGiWcxyEpCa3rUVynuY3VH5QLUcH3SmNbRsQ=;
        b=Y+Wl0gk8kWztAKZxtYNsm1AO9RQrF4lm0lfynFKlJ3xT4wPh7Q++20ZVeEgRCFWTp5
         P4fOownYEXvpexe4X+DO0nd2fId1PTWwkwYqGDmEMAYQcIYANJUIlrCrp650kGxho/vc
         zprsxww3AJHZn/Iv36jfYE7D07TrOSOUCsuHH+Re2gBnkQbHwmJbQPuTZSYeaatfSUtp
         t0s4hMk1izZd3R6SOhgHZKSxZ1MJcpVy/FmfomMyZGIEjxcu68o9bY+MpKeOA86jHtyE
         ZeGwDXRrtgkJRnJs+6+hSMbxM64ML6ih1RalbR5CgADv2EKzi0zNbbGl3a/9fqMXhUBu
         n7KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=deAwi04o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i83si1063202oih.177.2021.06.09.13.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 13:25:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=deAwi04o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr4lI-0002mK-IE
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 16:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4l3-0002ka-Nc
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:25:01 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4ky-0006oI-UH
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:25:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so2315390pjb.1
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lvDJJdAhGiWcxyEpCa3rUVynuY3VH5QLUcH3SmNbRsQ=;
 b=deAwi04oF8SZJVkq1v/PeKl6Q+0CZBmrsLOrCXTGQFCt+1JygrWbAEUbjTdAxPHcWv
 8i65P/9AhYXUzpIkR6Lfr+OOuhAciO6h0dVNZt+pC1hK/fZ+B3W4y8V9+8J/hnN+/lAC
 Sf8ksDW504AW+6bzoNR/9TaFw8Y7JD62ac9k4JLLIlmO8/iBdSa99i3xftfIIg6wNzxw
 BIXOXX3ygpH55Yqq0/U2WOmLe7KdHroQYE778fdV0bTnI/UEFeO+4NEg7kIVYHpo71Rd
 5cj3YdmpKPQLrv1DA9oD96zgDI/af46eMuemHAKA18yWNbI4ZvUZQ52LPfnmo/ADiJK1
 lVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lvDJJdAhGiWcxyEpCa3rUVynuY3VH5QLUcH3SmNbRsQ=;
 b=gAIfWI9hU7n5+gm35Pa8tYvrkGTBn5k7dagvEgT8R1rEwf4wJwi6VNR+jVs/uBeKvF
 y+/bmVV+zBbv2V66CBy+FvmEWSXZMgQG/e/7DSa3IYmWKW4WNuxSHwcZ9+TAEcdiqglt
 076rZJsXuSjMfRAW0/QHcoy7Bsy4RiM8ituzPkqr9kJ9fnzLoDIOkFJMTGGNoBBTG506
 UvgosGIGdCN7vHu7OUIlZZIu17RuNsCoXyDFe1+Ts7/jUIiKV4j630IiWpIzVLvgEtPE
 Y/+P4DTlcaMMHpYQoqv2j/vsBow+TgDHoiNqRQP00C6ZR9uLdmvgpTpmakW0/F4EPpUD
 PRBw==
X-Gm-Message-State: AOAM533SsNrYv9OW/o5v9ou9Fdt79I7I55uw6guo5l0eh0PJqzo0yROS
 pMKJKirHMC05FakzQDSlv5u9Cw==
X-Received: by 2002:a17:90a:1441:: with SMTP id
 j59mr12184479pja.152.1623270295401; 
 Wed, 09 Jun 2021 13:24:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w2sm365446pfc.126.2021.06.09.13.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:24:55 -0700 (PDT)
Subject: Re: [PATCH 50/55] target/arm: Implement MVE VRHADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-51-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0a3d6a9-590d-a687-1e4a-c760d8e7060b@linaro.org>
Date: Wed, 9 Jun 2021 13:24:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-51-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: df+goUC8xCUy

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VRHADD insn, which performs a rounded halving
> addition.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 6 ++++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
