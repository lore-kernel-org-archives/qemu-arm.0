Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2241176ejx;
        Tue, 12 Sep 2023 11:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdHIzWdpvP+/hVm5Nnl6bypkLxaJLh3AFHkxLSazEJPehdMFNT/MZGtLZP1zdG9qqicxAe
X-Received: by 2002:ac8:4e44:0:b0:403:8de7:4503 with SMTP id e4-20020ac84e44000000b004038de74503mr134232qtw.52.1694543633561;
        Tue, 12 Sep 2023 11:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694543633; cv=none;
        d=google.com; s=arc-20160816;
        b=dTxvSTtrJz3qKpvbGWWBKO/fP2u+o0QYrLuKdQrNyeNQ5NriTRHJWxO1ehschaQ9vj
         2/AO+SjIc6xkj3gxBIUlvLS7Rbrd93lAwrEuZ/dDJ2+OoYR/MVtZyddRVMnNZLsuFBBs
         YETXtbfLotfOI3PatlAaQ/YmL/FG1L2/uyyFyi4eoq1+EdhRW6SvrQBUjuon6fmW4oHe
         7BgGWW6JLuQy1CbKeWLm4i9p/naf1EHJpSjMA3CpLiVDJWsSLTi4SIs3K0ojQ56H3PG7
         GkzMUSrBH/I5mFD37moH8arZtSUwt60Q9Sjblr03brPzGzIvZodrXHWocALLFwvpI9ih
         grvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1Ky2GKD8spux3wrUapJ+SwfSjyjIBW4Rih0AMgz/QI8=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=0Cc0hFLcRBoVR/7VOHUJzaN4YldT32PxSItU/ZKpMuLGHf4d0NY6ffy5Zk0mcrXeUB
         kNEBufyy25SzlTq+Fp4S0fkgVV+b9U5U5tCnP1QMq3Q/TpsnyuVTZe4hx1gK1Lbyp4+v
         slIfnVLncGvPCd8RUdMWzEPjXq/XdiQ3uU0AQiLvcqzRAj94NCyoJ9KyzfUAhqUgYkLd
         EsqDWQBNIAsRRl5flg8HTeI8KWD84M03DNSUGtHJpwV+gY+JHQ2HLRUfQ451oiE8anq7
         LzZewSix2ffubl2xHFdmz0lPDWO1wJ/ONR5+Gcf/gJ0Con78Ymn8OkJ2XHwHYvnscXTP
         L19Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7wFNjwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s32-20020a05622a1aa000b00410ab79d56esi6845053qtc.444.2023.09.12.11.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 11:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7wFNjwI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg8CT-00079P-LU; Tue, 12 Sep 2023 14:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qg8CR-00077O-0T
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 14:33:23 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qg8CO-000079-Tr
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 14:33:22 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5779055a474so1440864a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694543599; x=1695148399; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Ky2GKD8spux3wrUapJ+SwfSjyjIBW4Rih0AMgz/QI8=;
 b=x7wFNjwIAOgT1RURa8LRjlI422ejrPjBxhzLdSML9zFGzRS9bzU4FCZZPlykGmQRj2
 gouLJmaRKjXbvkOnu/tP/U5RI3wxZREZp0aWuobm/sW9dKTWZxi03uPy6J1SCe7UBTsy
 lthnnzlnWeDfmNiCQ+wtzeK4VriNd8zEcDs1qDOon4f4vsFJqGQFVy0UbIKuYCTAp3Qr
 SXRZDyw6O/BBXmUTkBfRn+KAIq1v1kNybMm+tadgXrk74D2vuolMTFV0S97R7gYF1OcL
 L0ETq4iZ/q/tEG5I1J2AJI86149MjjdrlPZ1RI3afSmGhiuymm+YEGdB+HLA4pOpwy8k
 RTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694543599; x=1695148399;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ky2GKD8spux3wrUapJ+SwfSjyjIBW4Rih0AMgz/QI8=;
 b=NGbUOQxEZkcJumMvhWN03oO/EcNnrnggEdJEhB1gLbRSnSK1fFdTfgfk7bQwdWMSFo
 21XLMWXEqRF2Bpmwmlv8ns0hQrtLoEFENu43iM38IIQeMl9sr+Rr7px8rzWje24szZne
 Y/yUijmwKdYQ1kvxh+L7A+B1ttswKayDFC8FmuD320pyEFLgzO9Eqp34kcaemF+kNFon
 m1Cp5lnd8GFZH0K27nq8wTU7OUNIPySlNIHbbWDmmuc7J9rCN59xSJP1jt0daRcffKJl
 C7pW6qzJPz54UdiP3LutLYI28wVC4FmijcorZc5tFCWzY3ZXLm0HRVPl3phN8vEsGSwl
 JM6g==
X-Gm-Message-State: AOJu0YyDhvkW9Lcs3uBmHp0Bt8jDt8baMhG8xNZV2RXp+sDqC7mNIWU1
 LqDgzcsJ8UldoZEJtKTfWpVeuA==
X-Received: by 2002:a05:6a20:1388:b0:147:fd40:2485 with SMTP id
 hn8-20020a056a20138800b00147fd402485mr188222pzc.35.1694543599119; 
 Tue, 12 Sep 2023 11:33:19 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a637219000000b005703a63836esm7472869pgc.57.2023.09.12.11.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 11:33:18 -0700 (PDT)
Message-ID: <717bd871-51d3-e6ea-1b88-ac5e4066c139@linaro.org>
Date: Tue, 12 Sep 2023 11:33:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 12/12] target/arm: Enable FEAT_MOPS for CPU 'max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
 <20230912140434.1333369-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230912140434.1333369-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pzE9uNOvKPFz

On 9/12/23 07:04, Peter Maydell wrote:
> Enable FEAT_MOPS on the AArch64 'max' CPU, and add it to
> the list of features we implement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v2: Now sets the hwcap bit
> ---
>   docs/system/arm/emulation.rst | 1 +
>   linux-user/elfload.c          | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
