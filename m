Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1370020ejb;
        Sun, 23 Jul 2023 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFjAMvqbh9JClEBrZ61TygxEkHEwqevwAWwCvgnnlPOL8fSfGh177tfienLCtgOpxb3XsRS
X-Received: by 2002:a05:622a:19a4:b0:403:9b79:70ae with SMTP id u36-20020a05622a19a400b004039b7970aemr6950208qtc.33.1690128196107;
        Sun, 23 Jul 2023 09:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690128196; cv=none;
        d=google.com; s=arc-20160816;
        b=was067ogLOT5TO1YEwC3cF7hBTEA+Ux750IRfyDq4Hs/rRFB2tqwG1YXQKb0k5Zf8i
         WpEmsWCutkAnfFNjSosWWHWvkpeSuQI2FYkq5HCRv48RPahQ9hHJgJA8j16OgvpNle/6
         bLb9h4Jmnlya+jqgQAPHxDHPC+ShmVLZmZN39mQh8SSSfkbzCJODux0bEan05bt79Cmr
         QTL+YiRDP1dFWTm6HwYqdAzjBO+nmNFjweX21xjhI65boUYHSE/H125zS3IbOCbjDRV0
         62h/iJ8OGDc8TRasZSGzUEH7JMhOb5XSKH2Y+9eE48x+RqikP9bD5g0xvs6MXkcb6U2Q
         84nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZG8BxAO0km71JWV73YFgYqA4CjRty+ixfX+DcmIOtJQ=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=d/y9NGXjchZ/65NNDJ0DcuR1MtYIkxhQYM8Glco2XJEZma1CdsAM1hii5xkZse7pED
         LPCrE75z8V1PBds1DuCp0Gr/BECEt7MujIAgvu5ijTbq8+rx36++72QX5Tv6zl5FUQL4
         tPCHhSKrk058gOIhDoH6sA0+4uX+caFbBcAqsescFPPq5vrUpuq1cENRXqqXSvLDjbBs
         eb7wqxeFTcyG9lirxrMv40clgdQ+0PsvAZYBVSTlJ81bmJENnJ+Xsk6gF1urTwi4FC15
         u52WRUMb8KPBCPKkouwcTc16nB7xgVt0dYppRuJhYlcSSii/oAniO74XM/HkJl4IshtF
         J1Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNuRKVB1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85c0e000000b004055a9783c2si1584249qti.495.2023.07.23.09.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 09:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNuRKVB1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qNbXy-0006il-Rb; Sun, 23 Jul 2023 12:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbXv-0006f9-Jr
 for qemu-devel@nongnu.org; Sun, 23 Jul 2023 12:02:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNbXt-0003AV-LN
 for qemu-devel@nongnu.org; Sun, 23 Jul 2023 12:02:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so33213105e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Jul 2023 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690128175; x=1690732975;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZG8BxAO0km71JWV73YFgYqA4CjRty+ixfX+DcmIOtJQ=;
 b=cNuRKVB1ljNq7wq93KhtxQDe9wA1Vqf2tYvdzxN7vGAvYwLCTFHFi5PTF64LCBTkA/
 myfVa3Eqsx6VPYaSw/taGEcsQiEni347dgvNDKfQkm2mpx18GKtUqy0LxFqFf8ybQhJk
 0KrKhClMnPwfhwEkkUJ218D1xln9G8CSKOrchG5327PmtaE3EJgKKcdnK8A1emBcWOjp
 gCRkDkUD8MdTLPqcBX4QPc6720jJQbuCFH6D7T34LqNqXYYvUHOEEvJUt3npyMd4n3it
 nnmeXl1qT0fz/ewR1oEf54m5zGOCpols5REFit96e1vmPa0191xSjDMjJospfXx/0EMd
 tQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690128175; x=1690732975;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZG8BxAO0km71JWV73YFgYqA4CjRty+ixfX+DcmIOtJQ=;
 b=L2ELCHY/mPg94wDBzRez5inoHtP1VZ64ckfFTERdIFaiFl/iQXKYghbZdzUGJTDpsX
 8eO9PAtjBjjfdD5M5oJLp9UAtIXFuMbFPWVU4vqqG5gJJpHCD9GfS5zse93iZpoWRuV1
 ADuLAVyOW3f9U5ezgjqihkL4VQ8eOvgdciYmGJdfE7N8BIjZB4Neu8t/05+A6wjBMXTc
 HSI3EOZQfOxjHr49/Pu6UjE+brCE7k4xlHD1QNviMQfS7utaoBWfum1D/JuJgWwRdrfX
 rbSVGddCaqUfQNSlexPk5UnPeFOFEhBg1UN32PCSIly7orQxGGu7q71hh3bfYVtOOgWz
 nRIg==
X-Gm-Message-State: ABy/qLbanAAmhhArb8Nept3V2fQPmx6+ZU0jQPWa/jNe0TvGQMgT3hy4
 WF350rWzy1wtxwjEYbOoZVTzVQ==
X-Received: by 2002:adf:f04c:0:b0:314:12c:4322 with SMTP id
 t12-20020adff04c000000b00314012c4322mr6563417wro.4.1690128175642; 
 Sun, 23 Jul 2023 09:02:55 -0700 (PDT)
Received: from [172.20.2.224]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a1cf70b000000b003fbacc853ccsm8021929wmh.18.2023.07.23.09.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 09:02:55 -0700 (PDT)
Message-ID: <2ba5d630-9aa8-daa6-46f3-367b7fa9439d@linaro.org>
Date: Sun, 23 Jul 2023 17:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 14/14] target/arm: Adjust PAR_EL1.SH for Device and
 Normal-NC memory types
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VTZWHX2h6tcl

On 7/14/23 16:46, Peter Maydell wrote:
> The PAR_EL1.SH field documents that for the cases of:
>   * Device memory
>   * Normal memory with both Inner and Outer Non-Cacheable
> the field should be 0b10 rather than whatever was in the
> translation table descriptor field. (In the pseudocode this
> is handled by PAREncodeShareability().) Perform this
> adjustment when assembling a PAR value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
