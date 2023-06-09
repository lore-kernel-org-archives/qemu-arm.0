Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp608012ejb;
        Fri, 9 Jun 2023 12:49:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51FQ493BuhjVAg8i/dPbaJn8DfVeU0JESLygFxIRickvx/awdIkkLfh0ccgHwlWWOuPs5w
X-Received: by 2002:a05:6808:f06:b0:398:19e6:56a9 with SMTP id m6-20020a0568080f0600b0039819e656a9mr3038983oiw.2.1686340162518;
        Fri, 09 Jun 2023 12:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686340162; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYEoUb1PrNshRHgUCHgkL9wFp8nZ/g4xaM0H1Eps72NaJFOl3ijhjr8LAUSepX1p3p
         S9gpCFFWKZbsHJ0h21maHWCdcAGPtP/uXi8xLiaQDa1yhXEIv1+mydWtzy9IgjBobD+/
         kF9kD14Klu+vWhPQxJNcEDpfx2/l8DYp3SUvDnds1WqHjOR1DpiYJKpCI8ahZjimfHRO
         7CJFUa8bytLZcaNm3fWUCn0qZvYwOJM5wGM1racm+5NeSDt3GuU6WbHR1eWM8gMpqY8J
         2+KqtrgPI6l0UsX/U3q0RnyNe5giYDfrHx3EW0lBv87oO3eVOQoWzKzXXESQZifEbuLG
         6Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1gGVdbMQGaYb5uaHCOOcdB3rUi92fHQh5O9tvdZ01vU=;
        b=ArKRsqxIlOE14Y+GLY9Ur2XinYWsXrTNSuFv+1CpEyDWgI73XMV/N2qgtEKUKGYoar
         6eZa8Il513/Emv2NYnGPzKac21dDueu8o8cBNhe5gCmDNusY436YuCbOmbK6lgwUCZN5
         L6A9GMEJZggRI0d0XIT95D28cB19AwWLYGt8BMyYO1Ectt0djvnCUGTey5aw9O50d1ML
         +qpaCzUu6F6bQucs2mnMWVb0T/SsnGkoNFsX8iM8AVFQzOPsjhsD4JgsaYYBXTJN2+SB
         +s433Yuh86viPJkYyLj0/ftzfSEDt2lNzqpR4zEbqOlefumVW5Leoo6Fk4RWtU56000A
         l6jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNWSmNfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05620a10b100b0075776da0eedsi2679126qkk.388.2023.06.09.12.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 12:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNWSmNfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7i6Z-0004vq-Rs; Fri, 09 Jun 2023 15:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i6X-0004vM-Se
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:49:02 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7i6T-00011Q-4D
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 15:49:01 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b0314f057cso9896835ad.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686340135; x=1688932135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gGVdbMQGaYb5uaHCOOcdB3rUi92fHQh5O9tvdZ01vU=;
 b=QNWSmNfLY06lwCgYj1CTbg3OrmGqXHK0LX8cDNz6O4VXhk71xdEvSoQuJ47vUA0nYD
 rC9fyQUraCGL9J1Ud8X1/+XHRzq6CrHFtjzp12tOTSW7zyCSH/Wn05eDoEBhiYHGnZSl
 zgmwcaKenHlk9npaDXkISBaYXhosd7ZjFxZ/ksaz9p7sUd2tYT92k9ZPNe8rWHBdulqC
 mgQRpvThop//XhxaDeApOBPFuQOYmhrmelNwUSLVBuCNyQTcvDz1PcZuRoynh1z/FZFW
 WZ9+/K9hKfe60mFdXPmhI/xMAAOV0BiHf770NIBY9fN8mB4W1W7fUw74mQCtXlrLPb13
 Hi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686340135; x=1688932135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gGVdbMQGaYb5uaHCOOcdB3rUi92fHQh5O9tvdZ01vU=;
 b=H8L0lLcZ1VM9KZmqwb52YyquNajsCgvdMvEKMx7/DevfVwMdXWcx4eqYDokicJo0iN
 YG/tbFpRMh5itzm+4W95IvCeOED/lA5DR9ZzTDc7XDPZQEaFzUpMgUUNEtRjhfK6ym5v
 4CLgYBhoNCZUCm605z5FoXRmM0tnNyNGGoV4H5QjdGoUCcd636uN4GZRKFCxSEta4PNv
 CSe7DKSdr7HXr1kIF4ONNlR+qNtHXX/aVC5tQx/6t/gODRRnMuRvkE6df4nCEQnNAfeK
 yiJeNCcplNPirUgfqHtrDCgvOopIQeKdlYF6wDzvaB+d4VCyz16uioqCiQGh7hd6UBW3
 r/8g==
X-Gm-Message-State: AC+VfDww0Gcm35qd/hbYPZ8S+eB/J3LrGiOZQUjfmcCiMHmScIg76ZtI
 ffSzU4mGEwZLGh/l2EM72WtYQA==
X-Received: by 2002:a17:903:2344:b0:1b1:93f9:4305 with SMTP id
 c4-20020a170903234400b001b193f94305mr2235478plh.60.1686340135115; 
 Fri, 09 Jun 2023 12:48:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca?
 ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902d2ca00b001b03c225c0asm3624075plc.221.2023.06.09.12.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 12:48:54 -0700 (PDT)
Message-ID: <fc2d01f9-b624-7678-4da1-09dc7cfb1205@linaro.org>
Date: Fri, 9 Jun 2023 12:48:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/22] target/arm/tcg: Extract SVE2 definitions to
 'helper-sve.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230609104717.95555-1-philmd@linaro.org>
 <20230609104717.95555-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609104717.95555-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ecgDArw0Cfb1

On 6/9/23 03:47, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the
> SVE2 definitions. We already have helper-sve.h.inc for
> SVE* definitions, move them there. The next commit will
> remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h             | 46 ---------------------------------
>   target/arm/tcg/helper-sve.h.inc | 46 +++++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
