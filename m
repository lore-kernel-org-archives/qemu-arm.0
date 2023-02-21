Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3006385ejb;
        Mon, 20 Feb 2023 23:18:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/LOJYehC5Qy6RNFVpirON++5M/UNxdlAkhEkibdQe5fzfFaZNkhBL8Fs8fw9gcZ2pTw/L9
X-Received: by 2002:a05:622a:19a9:b0:3b8:6ca4:bb23 with SMTP id u41-20020a05622a19a900b003b86ca4bb23mr7176324qtc.15.1676963927770;
        Mon, 20 Feb 2023 23:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676963927; cv=none;
        d=google.com; s=arc-20160816;
        b=S+glMDfj4prI0kcl5UjiUzg3J6ocE8RfzcuSXU5GuHas6MR0ui/+gm1R7eZFdvGs9g
         3T2L3X+xSABDFBT7XFodfgFTM1F8mWWpLAz6rq8r+fWmyxvO4w7iGYmBnoLrfPzbVBdu
         UXt45YtDsda9c69X/DbPvxUhXICA2pb+me24v0Ug6b33kVzSPPq/E3ISpSqvyyv9WJmJ
         a8AAXQOmlbno3S7OCUNS6f/XOJZ+BWfJA3Xe4Y2WEIyf6vTDBxAN2RiEYW0JbtA1Urbt
         7Y92xopZl8uccS6SwfRMlurcgehCiYlfykTYQErYhh5GN/0fXYeL2zSLt9fKeXLnoPrR
         TiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J7ocSpCCYYr+2cmtPW/fgYY1RBOpAEKsM9LZutLRzEM=;
        b=uhWhFd4Bq+VFtWBq9blZnNCTKwM96KpWfQRB60HgmpBbN6OMddHvOTr7qhPAa8DscB
         LvpNnMzueZeycWeGbHDAarbrtAotnwe+r2d/OeDEisEXhqBZ7ly6oNrElUVfHTl29tJm
         9YHU66E1kRtJEWWf85M9lGaKumUya4BJJHpbbmQDa+52GFeNGXzWa7o1ueHoTwBixUjN
         u39bXELwTWM//kGikbz1AxeCc/nrIVsejMjmoY3QUblWWDal0hs9FBwLpEe4bu5Vpeg6
         dZFpc9ky66KeVM3PtnqlTjtEt2LgtPepiV2CTWgBwak38noUB9SX9q8CEmgCvAt8iXso
         /TdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWNBQYLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r27-20020ae9d61b000000b0071f6c1228ddsi8421185qkk.562.2023.02.20.23.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZWNBQYLW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUMus-0008Ih-6V; Tue, 21 Feb 2023 02:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMun-0008Fz-UI
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:18:17 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMuk-0003eM-P8
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:18:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id l1so3028417wry.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7ocSpCCYYr+2cmtPW/fgYY1RBOpAEKsM9LZutLRzEM=;
 b=ZWNBQYLWawYBR8TgAGhFZZ+vR3mp9JfP2QsQP5P/ZvpIurAPZ00WhkSHic/nqV1EPa
 IbLxfpbk/ilWDP68URkBuDqYCYsg7GcRHbz/XT7DIAgH+6kb8M77sZ6IoVDNCXNykNuS
 +wTNynM0c51lXXb44CR+RJdx5lgQyuMXv1dhAK8VqwKU7c6Ml7rUxyij1wJmdbxGfSrV
 d2Twg1C/CK3FedGMQ6ImA7myDmqg7pGBd9wQZN9KgggC7+9BOLHgYzyMB3+IXQO7C49y
 gaV8QVb+XEAWIc7wcd5jty2rF1/MKsxLtDgncJfPTQkENWtgf7PkSAcl3/++v9Qo+uQo
 A3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7ocSpCCYYr+2cmtPW/fgYY1RBOpAEKsM9LZutLRzEM=;
 b=rRlVEg7YAZyjV2l0Cu9zvMFcELUupC8TUjEj32mkJhqrxQUH1M3u0SUiWtE/EClon1
 QvkDq5kCNM0THe9WYKfLMQARuM4yniOHZr0bsyPhdvQJFlvA6eJmnd3JEY3nJ/OOv3RZ
 0wo/7tlmlXwhV5qk316gcPPA0xCyS3olPpkIY11RcphqHIrgLEIHD0u5cD+neJzmbdYj
 6cvWjUBGxjfFD0wuJklsM6zj89xNAwy9l8cFcllaLKnqPi49cOaBC04fgrtP6p2d8Vvb
 0/zr6ZqIj1A1I0n4no+Qjj3aXHrXE65E25SFXUlmaTTkNH9xUETVtGZgQm8XfxRLe966
 H6ZA==
X-Gm-Message-State: AO0yUKWms988Lk8sERjgUIHt3yj3BGDHC0bknuL6xP3N1h3RljPaMNA2
 TGNRm7vQBF48YyKLUoNmMnfA334uAXALxdwn
X-Received: by 2002:a5d:6992:0:b0:2c5:5878:e5a6 with SMTP id
 g18-20020a5d6992000000b002c55878e5a6mr4148981wru.61.1676963888880; 
 Mon, 20 Feb 2023 23:18:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm7745611wrs.49.2023.02.20.23.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:18:08 -0800 (PST)
Message-ID: <28e8ccd7-c104-5491-aaf4-a104f0aa31a3@linaro.org>
Date: Tue, 21 Feb 2023 08:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 08/14] target/arm: Add name argument to
 output_vector_union_type
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: FVS+aTi1luUt

On 21/2/23 03:19, Richard Henderson wrote:
> This will make the function usable between SVE and SME.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/gdbstub64.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

