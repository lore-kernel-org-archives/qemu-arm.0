Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5276246ejq;
        Sat, 13 May 2023 00:19:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pUehqHnNUt6vIVtSoV/picuX9qcETrAM4YjeTuu/9nrS3TjjNOih4np0OdEQQLER2HD08
X-Received: by 2002:a05:622a:198a:b0:3f3:86c5:21e9 with SMTP id u10-20020a05622a198a00b003f386c521e9mr36442234qtc.14.1683962383295;
        Sat, 13 May 2023 00:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683962383; cv=none;
        d=google.com; s=arc-20160816;
        b=sR07rB1WUGskZyjGVpWdLC5BumAPtSZ66MxzvyLe/r7iNzs1i2giXSJ0f3YXOHvbeH
         OOtk3V6min4i7Zbrhf2Zwc9pv30/3zw356Oadv+5LQH7Vy+YqKPjFfbxRHrT1b0+FSk5
         itGOp1UR9wtY4ywlgbgcTj/5grxI98hDTIbUV+bsXGLSvrkSn6tSib0Q3mqthirH/k1m
         PUYeT+dSPnQMv0TbLFkzxCgfBeLmONY/YYFGkdrpKionxuTdoprwBXT0uRKnlvGns7NP
         4Lh5FmOASmi8AL3OjyXvnM9hxuOhRj1Yx0ZQDOw6mGCZIs6WFM7fCiobFWOOnS0w2vRs
         TAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=45aae8tnLMksqtPNbsyOpxbPox1Tvje60TD0OVw8ET0=;
        b=LqGe7oC294Ia43qnv3zA5svv69+GhQ5NTRJmS2CWu8i5m6YbMJz4XPotpzlynFXEB6
         GtgvX8EdsZssuXYhqYcCPc7lOry6Q2FkQngw7QIuyrKAyWPDVqEvDoVAMQvV5kTrPp3v
         A/GvMezineoj6GmARd1BO24yJFx5XmNUxMOwITVJS308VZQmgAwSlsPlKEQj9JT+erDF
         6Pv2UQm+Gb2AHDTHqXGuVNig9kZDIID6sS/wrSeCf2wFB0glVfu9IwibEtor9YpCTCO0
         88D9FDPYsi33Z0cPiequjq2f1XAh6+BRjGicE1mbKhUjrwhKmKixpfP3zy/gUsqNRgnS
         uHqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgyT+zaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05622a138d00b003ef5824c53dsi6531386qtk.441.2023.05.13.00.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgyT+zaP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxjXN-0006Xn-0R; Sat, 13 May 2023 03:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjXK-0006Wp-Vc
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:19:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjXJ-00044w-K3
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:19:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315735514so342262125e9.1
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962364; x=1686554364;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=45aae8tnLMksqtPNbsyOpxbPox1Tvje60TD0OVw8ET0=;
 b=JgyT+zaPJmlwMaIhKA9YJCvahsFQc1A34sc5xz9QzY3zdpyNWHJeRjk1Lx3CwmCfPz
 BNlLu+a/c/yhRDGYTWSbfHJY7MJi5ayypqjUT3TPosjLxn/IgnZt5LR2fHDt9w62tW3L
 UL9yKnc8xQpFsNAuoWlEYWPC1Y1LHSBWi6eF3wmPRVjOHHuq50WGvE7IRuVKIBSWu64E
 TACGPz0Qgh4xeMh6Ur9NPs6r6XRUVN56p1BwEC1NUrQ+ey3X+iAp4rpZ3UX2bHQpUK2T
 R+5shQnDW0r1VIdiRV8nVJhuyI8XGQcj0PHe3kEz/VpUATD7f+rxz3Kjh91WyZNbQc0L
 W3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962364; x=1686554364;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=45aae8tnLMksqtPNbsyOpxbPox1Tvje60TD0OVw8ET0=;
 b=gw7gBncyzaogrx3ivfGhS1bGbwPmodkqhK6In/OePjTc0aq6wNyXHAAqLhK2u1H/E1
 1bTZelKL2hHCGJoORblE9GxhDmkq4ajESakSmVQ78esRj6Og8o2HEg14AxmMIzh3ybq3
 tt1VvShnP4mlZlzyNmifl9P2iMLc1ZYyrnUCbj4QbBaaLNmLOY/I8VMd2pjmKUc9jGAW
 1maoZDxD5KvABasWplmVEWVEcOXjH6YIS0kgdGiTYyJO7zIV9g6LC0t97ShRbxn41Eru
 P7WizDKofvhyw8Hj7U473n+3PKD8dAUrLdlxnqIwJNBj+N11lru9PAFgCBHzdCaYn9Vu
 /ZFA==
X-Gm-Message-State: AC+VfDxfvpMpXWc2DN+NiXU/4fCyCsBUEW6OddnMpaNTkLc3Flj3GeFg
 voo42N3Jc1G0JwhN8wMHNFqZoQ==
X-Received: by 2002:a05:600c:2294:b0:3f4:2a69:409 with SMTP id
 20-20020a05600c229400b003f42a690409mr10353983wmf.11.1683962364121; 
 Sat, 13 May 2023 00:19:24 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm30760109wmk.35.2023.05.13.00.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:19:23 -0700 (PDT)
Message-ID: <39f6fa21-59d2-5b80-b235-2d5116759b7a@linaro.org>
Date: Sat, 13 May 2023 08:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/20] target/arm: Convert unconditional branch immediate
 to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
X-TUID: HgspzMRdEGbO

On 5/12/23 15:40, Peter Maydell wrote:
> Convert the unconditional branch immediate insns B and BL to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  9 +++++++++
>   target/arm/tcg/translate-a64.c | 31 +++++++++++--------------------
>   2 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
