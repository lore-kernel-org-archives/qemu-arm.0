Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1374188ejb;
        Fri, 2 Jun 2023 12:57:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FJqUKXXUMSvAauBNC4mzGfmNSz7r1tz91STYkAX7IRZjoMWDQ8OcZK0ZYnMVoZagCbmm7
X-Received: by 2002:a05:620a:4147:b0:75b:23a1:362a with SMTP id k7-20020a05620a414700b0075b23a1362amr18368969qko.59.1685735875633;
        Fri, 02 Jun 2023 12:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685735875; cv=none;
        d=google.com; s=arc-20160816;
        b=HxABCbSJ7OYD9lS78+u0Q2zQuW/bKt8zBkgQ5sBZBJx58uUiBlSFCBCL/rcEIpDaCG
         7jT7GjHRTQTKQE765Zz7E/SuSEN2Zbz/U2rMjeOTJV6djJ6gHjYCDhJM9AcQmrHGevPg
         83GKdjA61S2U4wuhVuY/EryQGEsmm4a5v6yfoyRy9ld5suIX+k0WFUlMYbCSU0INV7Tc
         wF4F76PTW/+Lb4CvrHxI7wPU+uSR0NNeWq2bXLIIpbjuJ8znDKtaSH9yj2Ee6g3ODQAS
         UMAoVvhRCElUkurrIfl+3ON9xFY9D7spuWD4rhMIR/NdAWqt9PUWgW7WIayX7HuSQZvq
         Q51Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2fzGVoQwkh7n2rngSk+6D3F8Wf7TQnDaQMpjWQRrkLQ=;
        b=L7Hsq3Qmvcml7bsKd3Uv8Uw4XX2SDSR+J8docGNC4/zTCTx7muzcSu4n/5rbhgOR7m
         WmY2XEGOUHzmb4VxrSahpg8HvKz+8D4KxpxzgrjJx9Eem3ud/F8kcvq/NHhCd9HZDxxA
         KQ+OvXdBnJ+YUgkQ68RdzwsjpeZaSHPafaC3sKFSjBdzDVqdM1BHK9joxuJvj8aAYiUk
         JfTqBNlMKV4YtfDQPsHgDdO3HsERv3vrrPlPC3ajvqo3lw9MZAWSVMR+aJK+ZbObWjYm
         vmC34NUkxcWBtBE5TwSRInbKobLAM11bIl2ZLZgqkHREnpSg6qCPedCV5MC+cqW8SWvN
         AGsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuTLX1sW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a13b500b0075cd7286b80si1178428qki.691.2023.06.02.12.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 12:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuTLX1sW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5Aty-0002wB-K7; Fri, 02 Jun 2023 15:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q5Atk-0002tN-4Q
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 15:57:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q5Ati-0000qq-DJ
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 15:57:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6ffc2b314so28277465e9.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685735835; x=1688327835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2fzGVoQwkh7n2rngSk+6D3F8Wf7TQnDaQMpjWQRrkLQ=;
 b=QuTLX1sWEoopaXqSbAJi3ehWxEZa+8oMoG3HwEhtBnauoAhra37ZG9Dp5RqO7nJy2X
 HU1F2lWbaPMyb7AYn4B1eIVcWo+WjedgdZrz7dB4LZdHCyb4YoSUG5/dJNC10O1TrUqh
 NAVidA6n3k09plLiTvYPyXjWMin03d9otNDSUSsWfJKhHbW06jC5+Qaot9NUolYO91a2
 jqopmJWc713c/bqQeNyOBrOcB6E8LUYtF+OSx2zvkffe1JxMguaQxE2JPc8iX7co9jWu
 K7pAl+Jt7TvVBD2NgtUNS1Xoc9n7l0UI1hO1L4e4maq9XcS8b6XdKuK2LW3LtBkX109H
 GJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685735835; x=1688327835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2fzGVoQwkh7n2rngSk+6D3F8Wf7TQnDaQMpjWQRrkLQ=;
 b=KcoXuS6uDB3sACyQWlJ2rxus3CQ1jNVohH8lDhx66k/Ad7fcHxefqpnRF7n5RepV71
 Bg/UYMMFV3RJSyZbQXHIQ7WA8Xyzw8KNj1hXUbuv9hGyOOGztAkCDvBS2hobYKVxQEY6
 vUFL/K39GrPAkufkzGJFsfFePUDIMcwRzCCBL917I4N2I9D9TyJq6abaN05tBTE69Zss
 CPWLlmjdRiNmgaycNYudZnqMX+EpVZwL2oVLXTe0FpnqVhGTyh5NwIb4VCUF63M5llY6
 ytu5HWOeIpGnsZctCejsRGVbgU3YXBFfxHH/VXEdWDGW7yD+gAnPzYyZtbu7/8IIm0OD
 YDOg==
X-Gm-Message-State: AC+VfDy90vjX12jKvLx4ISN8/H1sfuiIiMKWdxVudmB5sC5/eARS6L5H
 xZeD2/uPlEAuzAjnTqPb1QBpVhzYcPVLbFe8Q1U=
X-Received: by 2002:a05:600c:1c9c:b0:3f6:286:95d with SMTP id
 k28-20020a05600c1c9c00b003f60286095dmr2844246wms.18.1685735835294; 
 Fri, 02 Jun 2023 12:57:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.218.254])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bca58000000b003f4dde07956sm6480762wml.42.2023.06.02.12.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 12:57:14 -0700 (PDT)
Message-ID: <3a83c3a9-1fbb-d5e3-471f-0daa02d877eb@linaro.org>
Date: Fri, 2 Jun 2023 21:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Fix return value from LDSMIN/LDSMAX 8/16 bit
 atomics
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
References: <20230602142219.1999756-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230602142219.1999756-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: bM893QVL8dMN

On 2/6/23 16:22, Peter Maydell wrote:
> The atomic memory operations are supposed to return the old memory
> data value in the destination register.  This value is not
> sign-extended, even if the operation is the signed minimum or
> maximum.  (In the pseudocode for the instructions the returned data
> value is passed to ZeroExtend() to create the value in the register.)
> 
> We got this wrong because we were doing a 32-to-64 zero extend on the
> result for 8 and 16 bit data values, rather than the correct amount
> of zero extension.
> 
> Fix the bug by using ext8u and ext16u for the MO_8 and MO_16 data
> sizes rather than ext32u.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

