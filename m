Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp319709ejj;
        Thu, 23 Nov 2023 03:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFweYxoZaRWPI8wEgK6NPn5oRu+w59uMLkk3ulFDxu447FdHLV51purUvtuhsVXErX4X2QD
X-Received: by 2002:ac8:5885:0:b0:423:7669:49ca with SMTP id t5-20020ac85885000000b00423766949camr6546724qta.55.1700739348758;
        Thu, 23 Nov 2023 03:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739348; cv=none;
        d=google.com; s=arc-20160816;
        b=sL8+yx3G+y6gotAXYM7bda45EsFKZ/0TiqEmYnqTJo4pV1KcYXfWX+nBkeGKVNhwHV
         w/r1YE+Hic0ZJkLR4j+3+kbbXMDae4rzFa7ST9wVJRcEN30dHuz2GDQI6ui5vAv71ROy
         PqQxpLu1X6ro5/lNXEP6+KRgpBUf4C5uG7NqCHD69ZReywrf2rsTA9OSs/iWQXxNRzME
         j8MueTGTqFheyAjO7QYRwgW3h0InXsv2fx7NfTb1kZzcI8KefHUWT7sin8RSVqsD1XH+
         CQWrPz/VAP4lhrhU9QqW5b1TaEU59eImR5nhJEJeTZ7FY8vBiIVR6VTkbeIFc6DZdwBq
         AiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Gb/9mpTegSgkpfjGfYLr5PJaM1omkYp059XCsfXHIMA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=WeuHn9DRUZTEWuBkj+b911XhRWdFqszdyotJ4ZfwlYO/SRqdRKeI4G62KjaHeXjxTB
         1UpKr41I0ju6+J8+4DTd/iz0fMOmHMujwoYOWph5mlGUxZ38HATECH3CYG/u/RMMldlk
         Vy0xjuo7WuizTmhF0lXOG146JcTyA+Wmaa/1OFKosjz0mVmEA8/PWWTYqW5jJaAAT+S6
         UEWTwVAoS4svmPCnGQVmHyZTqO/kbVdUfBeTYVRGfKwj0QA+8WU2DUBNESSHmzvvEmpA
         U5wFTyZrepH+UD2OUsdmho8SAAo2joxVJixRQDmrpV4OGOHbC42Hw6UgZqIamy9AShvD
         V9wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnVJ0gHm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020a05622a01d000b0042385b49ec1si1008154qtw.269.2023.11.23.03.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnVJ0gHm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r67zZ-0002qU-D4; Thu, 23 Nov 2023 06:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67zS-0002o9-7X
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:35:27 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67zP-0002SQ-6p
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 06:35:25 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3316ad2bee5so427621f8f.1
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 03:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739321; x=1701344121; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gb/9mpTegSgkpfjGfYLr5PJaM1omkYp059XCsfXHIMA=;
 b=MnVJ0gHmoLrIesFiz1aFwi32u/yewX1xckyVbLt22BDh7GAPJUTy7Cydb0MDEywYUX
 3q5RgwBU48UUsSM+KUjI5BPvuwN4kKsXDRBq23OWYnKQs78s1ewR16mo6d15JbVViPqa
 saLc23GvwEMRuUSjHe1hHkJlfZCAZMZrpxJLmMavg3ezLPDGLiOu6MuhYlVxs0SZwv7g
 rO8ulkIhjhsSncGVd3Y63dWsMRgselbP1jkjD+Tp3PPGanBotit0GXjmq6PFa0nv4xxA
 T9ndtOZQlu5lxSH96V7W/fqvJVjvFbXV516RvsRFrgSHv0j9YihEIX6/K6DP0F9amzH2
 xRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739321; x=1701344121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gb/9mpTegSgkpfjGfYLr5PJaM1omkYp059XCsfXHIMA=;
 b=gS0zLl+INgWEa1jh21zi4LlQk3mhUSdghS1ITyUrS21NOno6434ncYxls9dcbgHEQw
 FEoO8bLnBdE3+MFbNfC3cBUaUq2VuqPiX6O2H1cIgxWxiibAsgOsduoeuSNEGpVRGpO1
 +J8YrhzytoxRA12kq4JlR6YYi4xQ3LWl51Sp5+Lc7bd44f1GY+z0hEDk+yl9GsxD3M5T
 j8TjoeGTFYpmTw14AUNVRet+rPrPm7G3LPKGkapZtS4r9aZwFH9hsc6hezI/xoIiz5xm
 bAu3Zs97AVbni+ox76rTRR0qR7asd2eC0RdIbQDPyOMBGlak5l2L25Yiv0Vmb3y5SfSk
 5ncA==
X-Gm-Message-State: AOJu0YxGlHa/I7/mZs3TP8SuvJtXz48DqoVz7qKSDjYW+EmH/ysfjaF5
 mpLHa+N8S6z2be21335xNfD7iA==
X-Received: by 2002:a5d:5749:0:b0:332:e692:a127 with SMTP id
 q9-20020a5d5749000000b00332e692a127mr162094wrw.50.1700739321531; 
 Thu, 23 Nov 2023 03:35:21 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfdd89000000b00332dc82f70esm1408239wrl.102.2023.11.23.03.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:35:21 -0800 (PST)
Message-ID: <201c37c6-bc37-483d-8e84-0f8bfa7f2978@linaro.org>
Date: Thu, 23 Nov 2023 12:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] target/arm/kvm: Move kvm_arm_handle_debug and
 unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ozq4KdAUcWKf

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  9 ------
>   target/arm/kvm.c     | 77 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c   | 70 ----------------------------------------
>   3 files changed, 77 insertions(+), 79 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

