Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp181681ejt;
        Tue, 20 Jun 2023 03:26:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7DJG/uuuICkzmRY05EI3P5d11fGC4iZ7ViM/16zCHHjev/KzTzFIXdVeUutxbn7Y9wR3cQ
X-Received: by 2002:ac8:5e4e:0:b0:3fd:e97f:862b with SMTP id i14-20020ac85e4e000000b003fde97f862bmr9565190qtx.28.1687256794287;
        Tue, 20 Jun 2023 03:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687256794; cv=none;
        d=google.com; s=arc-20160816;
        b=vTcIkrLvX3Gsi6LQxRnLmkciGv3Bk0nNPTIquyfU5gENpE5vFwA73tC6L7ByQvHNIg
         kfyTF7yv/tGwYhmBlNNKSiw0EeG264RpYxMZBwkn1ohRb2V6HMvkxmhKfu9M0DB4C7wr
         ysvLnZmv4MFKKacGThsMfbQ5oGuLQlYHeMNXtFh2lAEtu+TEy1F6+5Sh7VqxNGRiA1F6
         EJo4Hix9D/yE1+1phESk5ePiGbNcV6N2mRJPiLO7C1a8tU0jcngLkqqn/09p8d/cVj/l
         zQMgb3UqmZwSa+CH2YuvVRsgiCB1YwGpQJ//lif2UjK92qG4Tal6lGFaxIVK4nuuiEZi
         X20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nwdDszDlzLCLFatPsRx58PbO78B5B1qE3QUyEDNKFD0=;
        b=1IPx4u9+YmTAuyUSQ3LO3PT8PFudGr0HFeB1gHkeOxtvZ8Y0+uwuVBIcIkMgjs92ga
         Xj7boKl878jEQHlkKasM9hghruvGFdBJFesgDFy995bW7hKU//bEdCS9ezWEkEYOYBA/
         Ab+4XEMXhtznhakJJG+kS+p3FsBn0KqLbg47Z7aJlPDieGzKIJdFggJ0egI6f8N6SELf
         ZAXn2TZM52InlaF/HQoD2Jgmpg7IeOPxPuv/+Xozrd2Nswkmy8AwMPTYjLJuJkbdhJh4
         BSp0eYvj12YM0F5Pm03kAe1dA3GaTlwBXWK7XE0PQj8gCxqxVIWDksz3z7QVeQfe37hp
         4O9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZQ8I/5+k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a05622a118400b003fde99bacadsi632098qtk.479.2023.06.20.03.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZQ8I/5+k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYZ3-0002To-8q; Tue, 20 Jun 2023 06:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYZ2-0002TY-GI
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:26:20 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYZ0-0001IQ-Rr
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:26:20 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98862e7e3e6so369469566b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256777; x=1689848777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nwdDszDlzLCLFatPsRx58PbO78B5B1qE3QUyEDNKFD0=;
 b=ZQ8I/5+k7IfdAmu3rdQv6yqqufznqgtKOHmjiPi5SoV/n/bE5oCTxvwmo3y7IClZga
 DrF7456xqoh2LhERZbaUC270Mn0PedMOZ/RJBA0xdtDWr2Z8Tdk+tazr0/NDMp1ntvlK
 Ij3reOkfbYp5hvXgshe6pU2xXTM/t0Zwfhz9iLiOg+89PZjCFZ7w1796tlULYTqTmrua
 eo0gXaQoKtzdN91DN3KEauvhi0IMxp8IcEFnYSkZ3M06LvDpAmRQa32BcRdtukOG9rg0
 MekrSn2iS9k5aOjm+s6G9DxFytOJNz9x2HHLYyqQ8wknsD4gSnh0ldKH+Kc26Cm2Dqg5
 HzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256777; x=1689848777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwdDszDlzLCLFatPsRx58PbO78B5B1qE3QUyEDNKFD0=;
 b=RGqTzMUpxWWiZjAEOvjfym8zBvsdVlbUCU0trjXd0h+5F3TE0Ksd2VsL8k5h7rus9Z
 yRRhQL/6WLRcNOBPy4+U6VR9J6FGkMQ4eSn13Zywk8f7ZlxddTX24otLy9v7/sKRKS3B
 D2t57vSQSBGM1gPgMLth8tBCdaDLFujrhc0WCfcAecTkoFNiEtFBme9jmnZFGmibSxcn
 oBjFPhjFtP4+uRZUK1/kKrFBiUSctEr5skp3vECVqErs9Jvpmbixzq+3AnOnnX48cSt3
 z7z7RuEPCUVDL2ktb6aaaqXLbrF6UV6pzkCOxUuwDNI0IvbNxzZcu7Xo+PQZFZfOh51u
 vkEw==
X-Gm-Message-State: AC+VfDyUISVDB2yfC08zNc6Vtkyt/fXQp1I/lemcgQ/0fgk/sMRgAaH8
 FL9cjDZQEwsa2AptksTBVYCMA+414cA5sE0+5OXTxm7C
X-Received: by 2002:a17:907:9306:b0:97f:3d6f:93b8 with SMTP id
 bu6-20020a170907930600b0097f3d6f93b8mr11107399ejc.43.1687256777231; 
 Tue, 20 Jun 2023 03:26:17 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a170906b31600b00982c0ac984asm1123276ejz.176.2023.06.20.03.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:26:16 -0700 (PDT)
Message-ID: <aae59859-81a3-c719-b111-d8588e90f723@linaro.org>
Date: Tue, 20 Jun 2023 12:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 16/34] target/arm/tcg: Extract generic vector helpers
 to translate-gvec.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: YZNpubgTrc5z

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> Extract 1600 lines from the big enough translate.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/tcg/translate-gvec.c | 1644 +++++++++++++++++++++++++++++++
>   target/arm/tcg/translate.c      | 1630 ------------------------------
>   target/arm/tcg/meson.build      |    1 +
>   3 files changed, 1645 insertions(+), 1630 deletions(-)
>   create mode 100644 target/arm/tcg/translate-gvec.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
