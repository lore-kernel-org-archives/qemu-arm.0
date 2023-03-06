Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4748078ejc;
        Mon, 6 Mar 2023 07:03:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/fL0XUpIwG0LZUDxTqm2uEYN6PPebq5Ucb+UeEPIjvYcTjNYplNM7EL/pdYTetWIjiQmX4
X-Received: by 2002:a05:6214:762:b0:56e:bdf4:d201 with SMTP id f2-20020a056214076200b0056ebdf4d201mr17446162qvz.13.1678114983768;
        Mon, 06 Mar 2023 07:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678114983; cv=none;
        d=google.com; s=arc-20160816;
        b=KuOXfvUk0wksriPjPDZjwInRbdru1XsqIww/AImD4I+CsHr4xqkt0ksGyzqB6mFkSB
         vMjGDMMWuSn/GwTrYqfSEl/X8NpRnI76BvLJe39PYWnU/WGSifOKUrxIZjLquSEu6ixe
         R6JfbfFE4osp7d7Ap5AGWd/20QZhqH8lRo8f1OWEg+UjFQGWtNI3V3dzmHweuhPd9svo
         lLYbUz+L7eZ4zusxUomy5XFkx1RmsDPTo4g62VV/7o8Da5FiRBVqIiydkzRH2d+hUYiE
         3A0KXC4VjdYvLmMZIRBL4ZN8K9/LDOjm0j+EByCf+gpEaosCTPHtsYi/8BG6+WOjdsrY
         Abtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d9l8Wb9rD04unvlF7l2JU8eMediQ9LSHTCR1K+oiIDI=;
        b=ZW0LxidvjtDt5CII4vlKcc27W9JnVvOz1aS1WM8S33BJ/X5b9HOsfVQ7jNn+hXzfKJ
         HtQErTDkch9HSKsvgLJYzlv8VRnAj6F2xGTvZ43vhgymiWgQyfxwQPWXOssFwLojf1yA
         wNrDr/KGLvVRmlNwO4FVviRF22dREKdkmRuxARJJrCK+O4NkA2D4Vm9W/krQ4324/kDE
         DB8u23UpV4cMuzm16VrfeCZbg9oB87hEcgISEs5Zqw3EXhe8HM8YEEQ3n2ruO29AEUIW
         xNwlZcq4eQd6pO2XPMyRZaKYh01aHWtvFX+elmPjTWgeD6xp9rqbogysErP5FmEXKklT
         83LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7gxM8Tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a0cf54e000000b0057239100ebdsi7220231qvm.369.2023.03.06.07.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7gxM8Tu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCLq-0003yW-OV; Mon, 06 Mar 2023 10:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLc-0003kh-Cg
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:01:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLX-0003ar-W5
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:01:53 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso8406565wmq.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9l8Wb9rD04unvlF7l2JU8eMediQ9LSHTCR1K+oiIDI=;
 b=V7gxM8Tu3KJRKKtl5O11MYxEpon81r/ymQGfbh/VMRQ84o0OK1xKIwJMZAOVxQdFqB
 jBkPTR3Z5vpj2REsJnXAHhVKOE/r/Muv8MfCdT+Mz/6zipigRPwFzZbvZwWRyAIiSRdy
 SzkaOe4W8J1uKph4hl2pLv+VvYy5F1AmR4aLhLfpGgCc2jU6jeRLFqzOJsLjIH4rxs5J
 kwEM2xkPPpD450kFMwKOuy6biHrSRpR1Z4zl2noSLgnxIO7kuyZ9e4fBe4vMEH1pUnlC
 Z5mVqgi/Roy8mQzQ6d6i99wl7eqrIsIDqgqxfcnsfTWBEcjIcWFQyZSf9kdW2irQrdGo
 PHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9l8Wb9rD04unvlF7l2JU8eMediQ9LSHTCR1K+oiIDI=;
 b=TOyRqisPepN3nfbXX5oYmVaq7eq9xSBAUPAZC8HWZyoPeUiBfLAN5NxfrONDImA67n
 s/Va7Bf+/vgPdT/UMh07zMIXw/beT62WN/IF82kworaAEf/LaW87jR7IYaUuKk1ryE/0
 pTRgbwnkGhgFMHalhJFtVfZvzXwwRUOjonDJyTKWBqPTH7zviJF6aFI7jKuFQ4U37QY7
 +81T7HsTkgDrlMiKGDvXsNxTeHSDynwIVHBTH/MoYTGW10o1y/JdcXnz6NyhkAQKLr87
 rFPGxaWqNlHQoIVKlKGje7SwkykFxQEoWF5MzuUqsfS1kVbAw4+GvRjHuPyDByqNF+fO
 mZzw==
X-Gm-Message-State: AO0yUKUDB0AZvyz5O2lw3x/qhI4FjeUYzmlCjPifgBqlaeqWnvTpZ9YF
 aW5GoTzyEb9Vlz4dSHNb5kflbQ==
X-Received: by 2002:a05:600c:4ecc:b0:3e2:1d1e:78d0 with SMTP id
 g12-20020a05600c4ecc00b003e21d1e78d0mr10723030wmq.22.1678114910569; 
 Mon, 06 Mar 2023 07:01:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm10327581wmg.24.2023.03.06.07.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:01:50 -0800 (PST)
Message-ID: <bb13d4bd-7e8d-6238-5a63-1de572a1d58d@linaro.org>
Date: Mon, 6 Mar 2023 16:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 65/70] target/xtensa: Use tcg_gen_subfi_i32 in
 translate_sll
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-66-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-66-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: UQRfHHP9r5/O

On 27/2/23 06:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


