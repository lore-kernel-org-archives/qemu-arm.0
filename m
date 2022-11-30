Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1093231ejx;
        Wed, 30 Nov 2022 02:32:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dcnahGCGfqvPUjIJY5vnL2G4m9c8oyILOQIQScFUqtWI8gv7VSmxLHJSkpfaSlgdbUKXg
X-Received: by 2002:a37:acd:0:b0:6ee:9097:ccc1 with SMTP id 196-20020a370acd000000b006ee9097ccc1mr54894700qkk.484.1669804356615;
        Wed, 30 Nov 2022 02:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804356; cv=none;
        d=google.com; s=arc-20160816;
        b=vAc30pPuqwPVsdETLBwdws+iANRLzle4jOo+bj1fMKtkiUYpB7/I1vq4NJEI5/BJ7h
         cSTT4yOxmlNa6E/a1dAEcFHmLKHuRuzSPgzorW72hcgvzPne5MozcC1MJKB92PrUvy3J
         TcpSY1xBXTjtcJAJYDr1Nzi3/KftdtyGWUI+DyAkOHeFCSw6caDIgPpek5/g+2F1AU/V
         fq6YGBkZ9AsWM5m38IwuIj661oq1Qu1rnGsrRzeEPifi3Z1cQbPyUaG/8BA5w2rKfFnl
         W4vgVjwaPE71yy7KWkaJzRsZuyidtHaaNSAVwacn3Eu+TC+9nFs6KYOw58YI9F6ncxgg
         rzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jfN+Sxj3gTxP38XwIEpHOXHDt+rxrZq4g2VlxOqtmss=;
        b=TS1vROKYG9qVgX6RtzSbO/K+VP9q1jMzPemA7D8DlMu7rB+kxHtj88JEHJueGzeUb6
         jeeRUTwBRBcDZlDsMTsdOWe2Uddpzv/9PDt1lU+PI3yefcsd+GQAB3MdYukTYtXuQHNg
         avgmEHUJLwtDbhY/Bn9n8H3rEKQr3lCKyxcpiRsERrrIGiutBroDt8Xu9W5ez7ezuBrJ
         GJpnkEjgl+26xM3VdFqn6twUFE7/NMBzcTkeXKc9018JOszV5Uh8RwyzLm7Cb1jn8Fkk
         quONx0F8B85Xr3II23xnpr7Of/jDOmxh78a6yVrqm+qbaBcoMX2KQQau13LEsEfSup3g
         Yv7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7bM7Nya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020ac872d0000000b003a5410cbb6fsi526051qtp.619.2022.11.30.02.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7bM7Nya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0KO9-0002t6-Bn; Wed, 30 Nov 2022 05:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KO6-0002sh-7f
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:32:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KO4-00038D-Q9
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:32:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id w15so13160227wrl.9
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfN+Sxj3gTxP38XwIEpHOXHDt+rxrZq4g2VlxOqtmss=;
 b=e7bM7NyaP7I4se6SH2NIWb30aepza2abHxR9wetKTE3132BG2eKSOdvO7SodiAoMCU
 aZRml6YGStUPA/7VaFBxuiowOfVEJ4Yof8N3Sij+xgC2dny0x6h6IY5QpoHZ1O9rsftx
 dIUg+cWPpPJIZ1gLV8yDEU31rf3BBNwlUxZJ2UU7/nKEEd1cnAkf4xibizEtlmrD6Rn4
 7YPmNQGXlrQmFwuBIfqSCpayfZB9b2HSBTYIAe64+CXgNyEdMKARb21yPqURUjAxxEVt
 BLtOkNoA3jORjkzNVdX3yiXO1iRn5mT69+f3vpuak9S3+pmLCxsOJVBGxs0X+plN2UDu
 X6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfN+Sxj3gTxP38XwIEpHOXHDt+rxrZq4g2VlxOqtmss=;
 b=HlCjGXxRewELIbxGa72kWoQYXY+abg4aQA+E3ivHk0OgnFMcJBb1by2J/fKFjaiFLc
 4j9OKslLXtJxPbShqgy5OTO80TzZm8948Qes1H8vxa2QSr+lhGNuehmBhHgbXMRIuZ1M
 0cAnbadHOhmsBPKLsHsTr6t/3N9hu0g0qrkDcjxubFFg40Km2Piwf+0bl4lGDVFj/2V/
 ni6OBt35RG9ZPY2lPyijs/Kj0pUwPr3GCKS9SkhOjZL4sVikdUV9d4di1l8mLIXmtpum
 86kYxjT2p+wg+tq+Zk+NLy8sVaLGeRTgDUkMaJp6ujpgBlYl9wgHPNpSAreTX6wInO06
 Ytvg==
X-Gm-Message-State: ANoB5plEO5kcxxjxVXKtlO6QTMfL2HVnFGKdsJDnzfCGPUcnOt6kKoE/
 YXXxMyLKMhp9UoXo0bWkjLSctw==
X-Received: by 2002:a5d:5387:0:b0:236:86f2:b444 with SMTP id
 d7-20020a5d5387000000b0023686f2b444mr37578292wrv.58.1669804339411; 
 Wed, 30 Nov 2022 02:32:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c305300b003cf6a55d8e8sm1418778wmh.7.2022.11.30.02.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:32:19 -0800 (PST)
Message-ID: <3ec4dec0-1faf-15fa-27d3-a0e6d8f9305d@linaro.org>
Date: Wed, 30 Nov 2022 11:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
X-TUID: 2pK6VO/G2slb

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

