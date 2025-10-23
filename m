Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD80ECCF9E0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:20:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwB7-0005QJ-Mh; Thu, 23 Oct 2025 10:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwB1-0005NO-DM
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwAy-0008Mr-9y
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:20:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4711f156326so8581285e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229223; x=1761834023; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f59Gkl10xPhhmoqD9VBzLhUv7saidYUGp/9bbI51EwM=;
 b=gC/Fg8VI0Y9fCyn3mOl+bzFxgjX1JlNzOES6j72I3EoXI0wEDoe0fwWFcl88bpgbz2
 uC6BjQ8eKKO6t0jkPN3NkrXfQtV1zfcCzaHQ8AO4DbeNyotgm7JmVRadIB2vBOlOUCOT
 XHHeK1+8CvuJKUElLDXtVrvakP57wQMOKmJ+WjP4TabVM5oDRzxLwuInSa03D45r24gl
 V6lpcQ8nzCrpQGo7lLfQOgnTqSQJNldKXSYJbss0l7TdlaAiZ+fuLdrP3Jm+vNdi5rKk
 pHNigaFrf8Qu+2wr3alHT8gLdaeRorPwzylnWdo77P/xaQ0QrcRhmtLXZ6A+0vb7RfRo
 kqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229223; x=1761834023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f59Gkl10xPhhmoqD9VBzLhUv7saidYUGp/9bbI51EwM=;
 b=d79BQCQ+TXuqzkHK25ihbqT0geZ7hEW7AtCyF8XoacCKF6I0Dxu2RLK3DGUoBEX2Xo
 EgowPAVe824BlMS5kWlj/ZvOlJizgqS0SdNBixqfoJcQ9fd5/eie6ywE3W8lSRMi0kbU
 u7ROQMVqD2KpY8+z1Jnp1ZzU94nDYL/6Wyztdkd/C0p+QlsolaUtMh5wMdCiLaJNIGTb
 yToMsrTT7U3HZVp6VkL8Ma9aiRiFEujjIdgOroIqCEh4tsiOdvtAjNMoLiHsGp0QUEB+
 pqNyspMc8poFLBcwo8wKzxfdETPbc11Srv7QrbQEtz9kAKxUNL9nRPq7n4LPeO4Vw0d/
 nUXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVswN9wrjwSL2xUt+fWILxwvwyRDCquBBGt5TgD9iHkN5kA+1Su4owi23iQwNGre6H4zwsjP90Cog==@nongnu.org
X-Gm-Message-State: AOJu0YyobMhBgchzL6XivhCBnTDubJ0SLwUbaLJnKEVxINivascwkNcN
 RtLxzrI+1J0lkLLSF4d5vByveSUQOlOuJTsqbPUh3BUbfohGrOBjZab+0D+MKz06sFU=
X-Gm-Gg: ASbGncvoDOj+xKpMIeLhcM5HST4BKNiH4+3IByfM6Vpz9zhp8Q6fWroeKZCnnpc0mpU
 gIapasC2oeySp7Plvm7CHL60pk3wodjzTcn38z9Ko9fXf93+IOaMJSOYoyg9dOHT0N44ur6bqaK
 W4Ws1ilP9UMDNudiiDLA0LpzCGIl7rsrT2iQvKTuJbhBYY4yM0+vao8fjCDCvE3rOgLrtWYp2Lu
 UcQneOr+sIRL2FK2ezV3zzn7R3kq+/2Bd+ih4fCLCdkYXLzaTrhPNINd2fw8c4omHwuCnZh11cu
 xeRuSsl+0/+0oIx+Z5cnIffQKEa+fhSSUnou6XcHq0sl5Dgy7PLWOd/bXbTS2HNMVscDb4+UGDy
 pIk2avSDiBuzBtzV6F+IFME0eLAIp7kvNV8hFNw+4+k1pKZ8y/7L9k4ZRpu69QISACkan1Fh77W
 VEGRL0Mpfl6BBloshWN/7NGP1VNLn0DxuqeahAwYmg4FU=
X-Google-Smtp-Source: AGHT+IGXiX57eLD2+a8tboGzzIlrUXupKWbFAoEUShvqnTtTfLk7JDuTPgh3NPrM/jDT85cb2eIZ5w==
X-Received: by 2002:a05:600c:548a:b0:46e:3f75:da49 with SMTP id
 5b1f17b1804b1-47117925d24mr182215635e9.37.1761229222589; 
 Thu, 23 Oct 2025 07:20:22 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898adf99sm4447414f8f.28.2025.10.23.07.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:20:22 -0700 (PDT)
Message-ID: <559b4d50-43c7-4935-ac4e-2c317af80c94@linaro.org>
Date: Thu, 23 Oct 2025 16:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 41/58] accel/hvf: Remove mac_slots
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-12-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023115311.6944-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 23/10/25 13:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> This data structure is no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/hvf-all.c | 9 ---------
>   1 file changed, 9 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


