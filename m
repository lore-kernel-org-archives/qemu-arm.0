Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1402509ejx;
        Mon, 11 Sep 2023 07:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHY7Z0WFt/IE15XjdzBFG7cx7+dXn7G2kbNv9CWRd9qbjbxR1KUBe4KwbXrKrsQ3UiHMF6
X-Received: by 2002:ac8:4a08:0:b0:415:1752:1be5 with SMTP id x8-20020ac84a08000000b0041517521be5mr5682580qtq.31.1694444360350;
        Mon, 11 Sep 2023 07:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694444360; cv=none;
        d=google.com; s=arc-20160816;
        b=UbbVpOK+GIj+CKjK/tIoJUbJuOKFRsdrEMAA/IoEFbhyjfHJJmq+/doYoZeb5ZUqLz
         hqgXJr0FfUeYtBzZrqwiis7qx/ISRcNHVtsiqnpScWjV8BbBCE1ex+9hLrrkG6Y8mzd8
         ahY9yNCM545qbdFNgEuWdXKgKAhx49TzGASM7+M/161bh/fG7ttI5NjLLWOTjI8RI/r2
         fBXHp80ul1vBc7sf+ElL6B0oQL9Ng4ApHUXWwnNysCaW7wit0+p3ZeDelEMxziNTar1M
         7Us3HinFUUAUf81O61WTQEaVcQTh+7uGRrEH5TZC9808c8ez6uIZ2kd0U4tJdadi6mXN
         Ls/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dWtOIp2Om7WB8s48REgkt4ZY4KKN4V8auhbWjN+3ZmA=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=JBXNO6LTtQeO9InFre9pNWPn+hjtHFNuWOutgnZC8d2xCRCTSfYRztYvpqfNDhTk63
         3qU6NDRv6NAarAfk5DYw5AhKsScd2noIMhYLxG3FyMz/8iyoIHU0QKFyV2lIUcg0gx3T
         vMIt9odejpha3zf9gDtr1Ucxxhm2FUrtAO3uXrNaGwLWHjcsQxxkRCMpspZCudQGderw
         CaRZa5EgKtYKjEFlJxW9xk1UxSGAhn+uX3ZLisNH4qde7vQQw1kFsI4qIP3BfED4hfXm
         k+ZWIS2a/AldqcRGTSDknHUgw49SeIOSUjAPUp2Fisr/ifWVqzxPHOV1lonPkBsbkrmB
         uEPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b55Ws8o0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t39-20020a05622a182700b00411fab9aa02si5031692qtc.7.2023.09.11.07.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 07:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b55Ws8o0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfiNa-0005EP-2h; Mon, 11 Sep 2023 10:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiNX-0005DH-W7
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:59:09 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiNT-0002DU-TC
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:59:07 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so6031535a12.3
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694444342; x=1695049142; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dWtOIp2Om7WB8s48REgkt4ZY4KKN4V8auhbWjN+3ZmA=;
 b=b55Ws8o01WEGQDi5QYEyg/82LSL6136h+7qIPH1NBPKNlexEf/xLQhferZHPZt+R+f
 GSFEdpiBcfjsAmgxU6y1aGlKkk6N2PKx3/c95DIG1i3JCUbXvUcM5wRNS8kRKswjnavG
 PR6kbFpp31tOvMuWki+QD3A2xJEuOKd+Jt4IIet1QmADQeLgZaAPPs9gA9WuqD5Y4GsH
 2BhJ78Ri7iGO64+YsZVzEGk3OwfLZnkozMFcRVE02kZLeSwsmvBRZ6qmqjTOE2uUVA1W
 p9fCEytbxX2I+Q7ZOzqXfiSM3wKNNgK+KfxxC6WtLGAgYo/IyyZ/Wubp+xtIUA9WCrmw
 yXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694444342; x=1695049142;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWtOIp2Om7WB8s48REgkt4ZY4KKN4V8auhbWjN+3ZmA=;
 b=aoaw0yyaQTQ9LJoFLnaWTbh5X+nGVKAO375b/4vaEw5Hp6ImbKuHrh3ZADgBIGhgnj
 1mOPkuaipMPRzbsSMOwbjOTPxYq7ch/Lb9MrMV7UpXEkQXZ+eFN3/5WryEFS+/yY6Di0
 jIlXvUqEVSuOCmxFMA9IxDl8y1qpBMcFfDyBwAYk86aswY+GG1RTJDJ5tJsx8sqsjjvc
 3eanfhCEwSOF/Ld+IFRmeWHjHfWObHJHGltA8B0v0KABHlBL1gnO6j3fxB9mNlk83fcv
 qcouNC1letxOo0O5W1hKwW12ypfJRrj5X7lWp+GGJ6qhwJOgOsZdifsgpV57/thA439g
 K9Gg==
X-Gm-Message-State: AOJu0YyWmfvBkDGfk2+UiZ/t//sOnrKo08IZJgfRRslZyaxa6EL3qrP1
 zNLtcICq4zWEq9CoHUT5cFu8pGeSVjg/BwS9yS8=
X-Received: by 2002:a17:906:292a:b0:99d:f6e9:1cf8 with SMTP id
 v10-20020a170906292a00b0099df6e91cf8mr8718028ejd.20.1694444342111; 
 Mon, 11 Sep 2023 07:59:02 -0700 (PDT)
Received: from [192.168.69.115] (tfy62-h01-176-171-221-76.dsl.sta.abo.bbox.fr.
 [176.171.221.76]) by smtp.gmail.com with ESMTPSA id
 ke25-20020a17090798f900b0098e422d6758sm5427991ejc.219.2023.09.11.07.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 07:59:01 -0700 (PDT)
Message-ID: <5d042c96-c5f0-bad6-f0b5-90b9e50e59b9@linaro.org>
Date: Mon, 11 Sep 2023 16:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 3/7] linux-user/elfload.c: Add missing arm and arm64 hwcap
 values
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
 <20230911135340.1139553-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230911135340.1139553-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: diR7ATchC0jX

On 11/9/23 15:53, Peter Maydell wrote:
> Our lists of Arm 32 and 64 bit hwcap values have lagged behind
> the Linux kernel. Update them to include all the bits defined
> as of upstream Linux git commit a48fa7efaf1161c1 (in the middle
> of the kernel 6.6 dev cycle).
> 
> For 64-bit, we don't yet implement any of the features reported via
> these hwcap bits.  For 32-bit we do in fact already implement them
> all; we'll add the code to set them in a subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/elfload.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Why can't we import asm/hwcap.h with update-linux-headers.sh?
