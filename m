Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp636623ejb;
        Fri, 9 Jun 2023 13:51:58 -0700 (PDT)
X-Received: by 2002:a17:902:e810:b0:1b2:4042:d227 with SMTP id u16-20020a170902e81000b001b24042d227mr2705604plg.12.1686343917638;
        Fri, 09 Jun 2023 13:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686343917; cv=none;
        d=google.com; s=arc-20160816;
        b=Yu8hgJKz1zj0e7ZAm+7qNc1fZ9DPxURxNnE1SWh8+BFuvCd+TFUEDTQqKSaMXAit8+
         oW6OdWgTHmpkSfJn+6RU9FjU6G2FXoP+yxB0Lipl4EnnG3+eDuyQ21qToCtPDBYt/f/I
         KVncQLto/m3sC1uqlnb2dlD9z6SfJ/hoXBJw4epZy09jVqPfIvYM+BJwHre0RUeNFCDz
         MsgAsmZN5N7mZcdvaSb05w4cuciwD/RAZ+6czPHLBIWa8XVofIZilAKpq1MN4W/frECR
         5Y6h/DggN17FOuF6rrTcQ59F8jBFBc/oEXmhOy/0+DIbYRxt66q4xqvCovIlCFHUoXDT
         f+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5LkCJbpSOakdaFx7ULhYJYv/yhnAQhR93g029V+P75k=;
        b=tL7UjZlrQ4CxmMdbIMlinEpLyaKZDEpwhskbB7bIL66tWV/eQ2i6ZAuPhR9UoHaQIc
         Q+13xon+7/249Ehvhj9v26++vCEFHTplcvj3SnISEaMNoxiQRckBPaCYC8kmwlkPbkG4
         CFDcM/6YDlFxLzZQQdbUDka/jn7L92QyTw1Yx8DfAXFTKAAbKrwH4JX86UA1O5pyBqeV
         8fwcDT+lU7lcbmmHq4i3u+WGWwnRXblO/92WspqRgSmfIJ+dCMfxr6La3l5p0+30oK3l
         V5WrP0+IXH0EkNyIaDrZBYVqWgdKwX6ISGAA/kdJ8bHukFw7F5eb5Tn0QoMvaIXk8Qm6
         pwRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=punUdi3d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l5-20020a170902e2c500b001ae3fe5f1c2sor2076556plc.7.2023.06.09.13.51.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Jun 2023 13:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=punUdi3d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686343917; x=1688935917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5LkCJbpSOakdaFx7ULhYJYv/yhnAQhR93g029V+P75k=;
        b=punUdi3dj7o5AhgM7n7auqIGFqjaQXyQFBFUhij+DeusTdjF8otsEuTuysqa9/FiSp
         UDjcMNCMXSSUwLLD1lSQgLOxDIv4+x/nzDRyanJtqf6MoU1Irhf4EytptxyePOCmQJab
         F/8VPjRrJo/EmORStPWqZmqk00+YGhAgqfwPJxzEx5FjUtTX3OtE3HpyMHdWBN9dA//F
         VcbuA74e18mVjq7TEe/vmmuBqAJhpOCYs1DNaWSgnDXIorhJ0QPOCexXNJOjqLVi0DHg
         KTW2tI4jm9ViYuRh6gykyJVmPpEGicpTYUNzku3KJsPyXxQSHbsoZXFxhOajAvtKjlwW
         +Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343917; x=1688935917;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LkCJbpSOakdaFx7ULhYJYv/yhnAQhR93g029V+P75k=;
        b=LfBD36PtK7Q7A8Vg+/TyOLq6V4whhaUsWO3cIqMARHIc/4hTP+IWTXkvs0nQtHaP2K
         rkWw2V3pq5/u/N/bCjIJq5CHy1mDtWrgpskyOqBgvWz0B02JnwW+0O2pfm8zUKz3WMf1
         YUlr2JhdPRt8S5ciYekazsBOCz3vtysA2QexCOekXZ3JRX/JI8mXTlGJgjlP9lpYmcjQ
         wZxZ04rydRu+4WHCf3l82N4SWhJYU2WskTwMzMW/E8NlDWHy7n6rl6AUQiZWp24rijUk
         lXGkSjE/FXUWmYQA/bncsmrxoDTWSQQkQcdWkzoRbMk1PgAULmEQMoJA95EbOy8vk/JU
         dYfw==
X-Gm-Message-State: AC+VfDy/jLUDrVQi4XM+/aI5yAc96S5a7fY9CDEa6Twumi6QzYy/nctw
	qwIgfWjQ7z/nYwBSUq3EVvo6xKXN
X-Google-Smtp-Source: ACHHUZ4BRdqvJf7t41ocDavO2eyzeYpwvAnQL+apFtxDyHHN8PT4d07iS2FAeRE8Hr5UOf0c9emIvA==
X-Received: by 2002:a17:903:24c:b0:1a6:82ac:f277 with SMTP id j12-20020a170903024c00b001a682acf277mr2672069plh.14.1686343916869;
        Fri, 09 Jun 2023 13:51:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:20be:c4cb:f609:8cca? ([2602:ae:1598:4c01:20be:c4cb:f609:8cca])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027d8b00b001aadd0d7364sm3662918plm.83.2023.06.09.13.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 13:51:56 -0700 (PDT)
Message-ID: <351b3a2a-6676-ea4a-d345-3ff3a5cf0d88@linaro.org>
Date: Fri, 9 Jun 2023 13:51:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/8] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
Content-Language: en-US
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230609172324.982888-1-aaron@os.amperecomputing.com>
 <20230609172324.982888-3-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230609172324.982888-3-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0Mf//nhWkAkb

On 6/9/23 10:23, Aaron Lindsay wrote:
> +static inline int isar_feature_pauth_get_features(const ARMISARegisters *id)
> +{
> +    if (isar_feature_aa64_pauth_arch_qarma5(id)) {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
> +    } else if (isar_feature_aa64_pauth_arch_qarma3(id)) {
> +        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
> +    } else {
> +        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
> +    }
> +}

As I mentioned in previous review, exactly one of these fields will be non-zero, so you 
can just OR them all together without the conditionals.


r~
