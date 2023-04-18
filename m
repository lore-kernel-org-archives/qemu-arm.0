Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2423846ejm;
        Tue, 18 Apr 2023 03:58:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1v9SeaweBcdevnHIWrlH7BrvVH/30ul6fcEB/BVlDYG3raqS5eG/0c7A7aqfIdbYE66AS
X-Received: by 2002:ac8:5a8b:0:b0:3dc:ac3b:ca6c with SMTP id c11-20020ac85a8b000000b003dcac3bca6cmr31753273qtc.6.1681815485157;
        Tue, 18 Apr 2023 03:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681815485; cv=none;
        d=google.com; s=arc-20160816;
        b=pgnBQSqqvEfFX14vT5ni798yvoX5mZDLcXz7GaS483oVsHAIvgj3He56hH8Jiyf7ny
         kB43J63ihLrlvGI0lfcqpLht+Dyy0izV15+/nRgjNuNLC4svYzpvBCwqW8qFc4s67+k9
         BtGhyBswZwtC+GvZuXiLtFIlHWNvSkSfxFOix8H9hjJwFN5A6n4iWDWW0gkSF9R/61Oc
         YISEsS814BL5s16tFsNQytdJHGbri+rbmmg9KGjGlqFMioWyCMoL8nlrFRT4V0zb2xy3
         Pe4bbGGOBHkaOXpZchIG17+mzPx1Pp2cNTGbDMz+50epPwYOr+3KDuif0TT8zhmGadZr
         7JZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7K3VNSdk3z/8ZaLIajeUfu9u36LUEVZPb6wx1oh29EU=;
        b=CmA/RFH6FBs8DE4OzFtKqKHcexK1R2S0hq6wcMRQiT2U+JF6DFiAA5KYhY6HrjyJDy
         4gfU/ZdN/eDTn/VboAV1GdSnalwEjRMIwFv1vB90tbOQUwPORK6/OoZ8O+VCfNDMurTZ
         b6Nlbo9XFe8+Ahg+MNGHCtSXe4u4yTLHgEOZH5gFxN/nR5ueQOUNvpdTzwMTukNZDg9R
         Blc3hRIW+VpxZmk//XgNsIl7HdR4z81mExGf97vwqVnmHz1/kgRLSqQ2B01Q6+p2drIy
         i2LyIB6QM3KjMJdA0UmydNUhcMwAJ6EqO9b2zAAMwryxbeTo0UvCZCsUY6hDz3hZ5eMm
         R52w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ifj+7pal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05620a0f9600b0074df6d9b334si2029575qkn.608.2023.04.18.03.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 03:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ifj+7pal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1poj1m-0005k8-EF; Tue, 18 Apr 2023 06:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj1f-0005if-AP
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 06:57:35 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj1d-0001gJ-P3
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 06:57:31 -0400
Received: by mail-lj1-x229.google.com with SMTP id r9so16049781ljp.9
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681815448; x=1684407448;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7K3VNSdk3z/8ZaLIajeUfu9u36LUEVZPb6wx1oh29EU=;
 b=Ifj+7palNxJqPkPaP8nRgR45GU9wRPYAPRRVj3rDzCyJlQx6+XJQcZ+R9F2drf6O0Q
 8DGIlJecxWwzNaeshPL2ramI2NVnVt+1UUCOo+OzMDPE+M7xsiK0VhHSi8ucMzD8fnA3
 kusg6dSeZhU3ZIZ1rZFYxshohtfK3wuDfuziK23GMk2iZJqdhNrEDxXrv5oUKzquMA+V
 QSmGiP7dMp3qgO+Ffz4l5wnDG8F6B19nxfbrPt85lHniQFOdNLWC5ruJe9rBUE4ZgR+a
 fa/Yr8yUkRQ3ENRkDYXOzuRxeEKQA9oUc14a8qJEF606IWkx9w499JiMvf2t7D9kIpKZ
 FoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815448; x=1684407448;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7K3VNSdk3z/8ZaLIajeUfu9u36LUEVZPb6wx1oh29EU=;
 b=FTPicjBr5Ykni2FTjn/PedErvBHux/mEXWKwphMM2cQYjlT9/QLNvNkQUN++N6pYIs
 yYNCrgfmK5RyHlcrn5O0ylHzCUBGEKLWJ8X8aijgpyVjPzBwLfkhs5xckcTmf/Fm9QRt
 q6mi0MNSzu9KW8M4tTpNWPF/2bTL0BKqAYzAfyvEPZn1SLUUgYptwtnedY1YnLo+jtFN
 1z5V3TxjC29aMCfLUiejaxa1tb6zoES5yeeH8iOV5pA30azccBLy31k7CUHi9jLXTiQK
 OZNRHLy+34o1uYnUSgoclLcjNNGVdjSC3KhOjo/r9QH44jtwSkJTncfkLHm3rL/hymPZ
 Ubxw==
X-Gm-Message-State: AAQBX9e7IdCk6yp6zODomnrYAkbGkC7OOAe2o6HMmSIsFR8uLOmkNYEF
 Q8i9rDJ04MkxN7/9ptZBkgzTNg==
X-Received: by 2002:a2e:9986:0:b0:2a7:a719:5936 with SMTP id
 w6-20020a2e9986000000b002a7a7195936mr632057lji.19.1681815447968; 
 Tue, 18 Apr 2023 03:57:27 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a2e9608000000b002a8a5afb87csm2293163ljh.20.2023.04.18.03.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 03:57:27 -0700 (PDT)
Message-ID: <42916240-ca56-9028-da9b-1fe5c729fc12@linaro.org>
Date: Tue, 18 Apr 2023 12:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230414160413.549801-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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
X-TUID: mn7E/D85fRwH

On 4/14/23 18:04, Peter Maydell wrote:
> Bit 63 in a Table descriptor is only the NSTable bit for stage 1
> translations; in stage 2 it is RES0.  We were incorrectly looking at
> it all the time.
> 
> This causes problems if:
>   * the stage 2 table descriptor was incorrectly setting the RES0 bit
>   * we are doing a stage 2 translation in Secure address space for
>     a NonSecure stage 1 regime -- in this case we would incorrectly
>     do an immediate downgrade to NonSecure
> 
> A bug elsewhere in the code currently prevents us from getting
> to the second situation, but when we fix that it will be possible.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
