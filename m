Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp265144ocb;
        Tue, 4 Oct 2022 08:35:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM721P0rnS1/uqUHtL/xxcT/KbYA3F2Rjy9RX7UpTxThmWnEd7EnLWPHpGQYsYim/2ritpZ+
X-Received: by 2002:a05:622a:34e:b0:35d:4d33:80c1 with SMTP id r14-20020a05622a034e00b0035d4d3380c1mr19804488qtw.428.1664897721921;
        Tue, 04 Oct 2022 08:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664897721; cv=none;
        d=google.com; s=arc-20160816;
        b=zRFJYWxvGdG63OvDnDy/Y4Tz4zOFC8U8vmCe9ioBwxuJev8HUNvelxvwrBKeOJU3eC
         8ZSlGIi3QnlT86KPTB0lM/NVIKV0jIhIS0xs73wUnntRHOkVeijrXZ7oj4hhDg/5Dj0K
         MmyOcX5cALzSiO+ZNokpSCVrkNBxE1nKW8WKI1EYnza3AwuRlxYOSg19czaztJz5n8nR
         SCCNYIFTwGBKUbS7Uf2CELIF04bhWRmh5MvaoLnqT0H5cLsR95DYtQDBzXDlu7qj3kUF
         hoVXUWdomQZA9kp91QNgvItrzdaMEIfpGArntZxL+KHHxCx3MBZcu1VbtwlFMAkjwxiO
         8wkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iZ0cofXLxuRRDTPqpx4FQqq4MZ/4+VlnHfKHprwzS7M=;
        b=IwpENFRfwiM/MG0aekbjPNxDDxl/E89RgQvx/92dU43Me0vcjMQg8DNTd7NFBBU9eM
         ms+pD6l8XJN34pMpWf7fqlpNuATieyoFZkgr6F/cOLs/wSkjlp+kBpTKLDUxGMuvtsWA
         xp21UxGCR6f13Hx49MJpUYYNPrea92Ji+BBoRmaKnd3qoG6oaEQotZmNs9HYvQcMNY5A
         X+YoXsP5teW8oC+8foc9Ijb0Uh6Y5+ZjY/H6PMpVIiVH0p9//AUy6o0kFhqm2VofYd+x
         /NSRaLZiRa57xaS6w9Q1xVdVCK1pxxfJr/L3izCo9tH5K160SrR0Iy5Qrp1su1/Qcp0A
         zi7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DaKH/KfU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ad45ba8000000b004afa14ace56si1138992qvq.57.2022.10.04.08.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 08:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DaKH/KfU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofjx3-0002dO-EW
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 11:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjLR-000692-Rd
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 10:56:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjLK-0004r1-FV
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 10:56:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id l1so59414pld.13
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iZ0cofXLxuRRDTPqpx4FQqq4MZ/4+VlnHfKHprwzS7M=;
 b=DaKH/KfUUsHrVTZzzM9nhE77yW0VSSF9MqsYw65lv8sypnVcfTG4zmbCtI5FVIRxxG
 qOJHeez8ajOx2kGApo/hHbZGGFzE9GxOXgQFo9R6lJp0TQS+Vu7lyVsjoAXYRJ2UdN2V
 VBZ9+fJyC/lrstIBPYlZPSKh0YjZZJ86UELqMIO/wjjxPvsfpH0p4/Fypm8GscylhwWy
 QS3Qf3tkEdA7SmHnq30nF91gM9eGh+YVon7x2Eu8X3oWXsuzPOJxG/kATjaCPPDMeaVr
 tnkvVasdgfINlyLzmdWVxseJ9DyPtpthOgompozxvrP/C1BUbvLWs3CFSidQreYaiUJW
 qrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iZ0cofXLxuRRDTPqpx4FQqq4MZ/4+VlnHfKHprwzS7M=;
 b=6CTxoRx3T8vDUIOEAi4WDpQkZG4J6O5MrLFu9WJmxF5Zb++cZGFZ+Cn/4JSB5QZUfe
 7gD7j+5vHuyaJpBg/2oY11SULTZ5KoQTBJS1QjkdRZOte2NKc9HzEVILM3iaisJlES9n
 ZOkt2y0L09T74MtJ9e3Gq9uh1leCsJAHkU+iAFCO+1z7Xe8umvGI8aZtfSgWBtwu0ARm
 n12CzcOT/P2y+9QtZ+sdNRCV45ddd/EEsTHlYenagiFk5lKhCdPQIYzLZgRJPcsQn/xP
 Cs6Tp8BqI3DhPnQBhlmzWG3HtgZT4DjDASqGca4C+t+IGNmRCY2FszHE6+jah2LDQWkL
 krXw==
X-Gm-Message-State: ACrzQf1YfoioAiX68tPnP67OL+8IbmREMb+W5jTw7aA/hOWONR3R5+1a
 QD1wkFxTJCB6BlBa69lsH1YfsQ==
X-Received: by 2002:a17:90a:1a49:b0:205:df65:e802 with SMTP id
 9-20020a17090a1a4900b00205df65e802mr135161pjl.59.1664895380831; 
 Tue, 04 Oct 2022 07:56:20 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b00174c0dd29f0sm9063632plh.144.2022.10.04.07.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:56:20 -0700 (PDT)
Message-ID: <ed34b9a4-5470-786d-9958-dfd1df398ef0@linaro.org>
Date: Tue, 4 Oct 2022 07:56:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is
 implemented
Content-Language: en-US
To: Jerome Forissier <jerome.forissier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20221004072354.27037-1-jerome.forissier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221004072354.27037-1-jerome.forissier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EnGsPh0qrj1W

On 10/4/22 00:23, Jerome Forissier wrote:
> Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
> implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
> to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
> to 64-bit so that masking and bitwise not (~) behave as expected.
> 
> This enables booting Linux with Trusted Firmware-A at EL3 with
> "-M virt,secure=on -cpu max".
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Signed-off-by: Jerome Forissier<jerome.forissier@linaro.org>
> ---
>   target/arm/cpu.h    | 54 ++++++++++++++++++++++-----------------------
>   target/arm/helper.c |  5 ++++-
>   2 files changed, 31 insertions(+), 28 deletions(-)

Whoops, sorry about that.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
