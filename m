Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp621374ejc;
        Thu, 19 Jan 2023 13:06:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvmT2VlLuxQ8xJ1Rhwvn5JRk+s20xl/H7k+KUVAPaGW4K2ofCg9X8jbqkJvxqFNkQJjaFWs
X-Received: by 2002:ac8:7297:0:b0:3b6:2f17:5d3e with SMTP id v23-20020ac87297000000b003b62f175d3emr15934172qto.59.1674162411690;
        Thu, 19 Jan 2023 13:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162411; cv=none;
        d=google.com; s=arc-20160816;
        b=k+N3GMgCazCO9mcIgvAmoZObfpczkQ8cFHsopCB5Y1i27Hgx06I1DbpqJSQF52EuV8
         XVRwkgv3orK5Dk9chlG9nAFHH/8Xrsg3Jacu7Lp3N/yWIn1ToijQUw+leKRmQpYM/+Qm
         uiwq+M9PUoHcWCJXMTig6TW+FJQnLuUTc5cND8WYiFd60y2SvPrr9b8glpikDXj67Q50
         ld26fjWBgRrPWNhJFZlVptjWhi5504vpH6iRbenGnTaikVbWnyuedjXHhAVr6nc+adU+
         uBmEmo7EN27RXCOHglezCN3Q4nQeFrwlfHSg1w8rYs13W0P2CjK24p2b5ZpwFBtBgJn5
         nSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CmRhhIjV/QjVTLP2pRCvDsOoJaBA6etwfA5WJgaYlMk=;
        b=EmZ//LLtIsVTr4Xc8LuNJA1AMuBrqeq4cK4E6lOn97sMivv4RzEW0SFeqFrKPa1MK9
         R+kgJPmYRy90mKoIEWB6e8C84HpCitKRb+KH30j0M7ZWv7Z7AFbrh+PLshPnFxoFxGbi
         bw6An4Sr6RC0yBLAXaplJx6OLdRGS26/gsyJ9JjsaVa2i3nlxG8KEXfNtKdIoyhmTiHM
         pTsIo86EQnh6sdDsY0Rpf0hECRVwFB+IMaqC4100qbrUQhe+JtpKQaDyfL0mTN7SE9g5
         hV76UkpE07Rypz1/e71kivAzIwvflJo9eiikC/vs9ZrG1nhx7fOsEFqIlzrMK3sARmqU
         1yow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CuqpKut8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac84983000000b003b1b92b7c90si13860755qtq.721.2023.01.19.13.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CuqpKut8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIc7G-0002Lx-4D; Thu, 19 Jan 2023 16:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc7E-0002Lo-BI
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:06:32 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc7A-0004iO-Nf
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:06:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso7098144pjg.2
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmRhhIjV/QjVTLP2pRCvDsOoJaBA6etwfA5WJgaYlMk=;
 b=CuqpKut8c91KGU+vtmnovKa6SbwSo1yCAQ7qyC92FFGexoqsoBeToHhu+mNgheuamm
 tfvDUhHRWRv4Sj0hqMMprIO3pZ4owDCnicz1+eDWTjn1k6FUPerUM5XfH6vE+8dYJXr6
 EAMmtzIsyMx8OcUksHa+IU6FejT41r1pYJb1XCbIqZ3wkXtouX0m60WQlLnWacp01hYL
 i6NQaMslLEh1jNuRNfeo7miEN40RtdKhdeyUnzCjYHX/hJVSm92NSG9NmUoF0Igrc3v9
 8wjcNZPwYIuPI5LcnAOjgtrnumKK04hxSC9QaJGMHQIpLrXqJn1DaLRRHCRjcbOMXzCR
 e/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmRhhIjV/QjVTLP2pRCvDsOoJaBA6etwfA5WJgaYlMk=;
 b=JGxmOHZ+Xty0n9+Nq2/Wq7PKpBtnzQSOYHe4jIFPy8UHIMmXKDHiY4UCOD7D4SnOGh
 EsnjSI0Jo6agPMfZDXuu08srVFXD27hRZXBedzTYIotsEuJaqT3AJji/kSQWSXNe5FUf
 7enfWHFHOcuiaqhhzOXkZL9ljZZ0OzjPVHpGJ+7KmlIXE/HGL2C6L//FRjjFag3k9zmC
 Grz/VZL1GBG00F1GJnhv4VrVjRCduYCwF1zuCZLB1zarCzqKKKI+9wTWcmKrAtZC4M16
 LV4ZzK8At4I5a9zpPCcUkt5dFCzDCNukFpWZebRwf4PKo8rQukc+Jr1U9J/BZ9DW5+q4
 Wg0Q==
X-Gm-Message-State: AFqh2kpjokQCgwFIACKQX3aFCs+iREvc5j1yQMRsodYQFMB9AJ2Q2jIF
 D9JrU5jPY1wKNv0DSRSi6+1URA==
X-Received: by 2002:a17:903:2441:b0:194:4483:bff6 with SMTP id
 l1-20020a170903244100b001944483bff6mr18933584pls.68.1674162387029; 
 Thu, 19 Jan 2023 13:06:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170902710400b0018bc4493005sm11099059pll.269.2023.01.19.13.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:06:26 -0800 (PST)
Message-ID: <5212ffdc-ee6f-d0fa-46e5-8815ecc118ef@linaro.org>
Date: Thu, 19 Jan 2023 11:06:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/11] tests/qtest/migration-test: Inverse #ifdef'ry
 ladders
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: WxMDWWu+Bk8s

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> This slighly simplify the logic, and eases the following conversion.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
