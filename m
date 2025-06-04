Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4059013njh;
        Wed, 4 Jun 2025 05:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVv2Ihz2CGJdSj/QdBfVs8BHqSChvReO+2FZGtq58ixKXk4jR0C97GqNKCCBITkBtju0NUbZUvh8xGB5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG+YjFanys8qwmPI2IojIdO4j5gKiVcVzJ4RjSeh1zTMiLUJnvIBSCDfwhxXrSeu1WoidGP
X-Received: by 2002:a05:622a:22a5:b0:477:6c0e:d5b3 with SMTP id d75a77b69052e-4a5a57bcdd9mr35993491cf.6.1749040557016;
        Wed, 04 Jun 2025 05:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749040557; cv=none;
        d=google.com; s=arc-20240605;
        b=RBl0IoOZyH6Us8M3Ukw4kaPWcg8qLeB4brt4K7uHAYfQW4pN7BDk6vhoH2LTpDtjd2
         s/yvPPI/toiui/puYq/nfMaK+Rr3XdqTV9QATX4HZwj9OaTZSSuESE67xSmGBH3lHsIZ
         5rkHf7XvoTBAHM8nl2yNTwDGqgveMxSh6T4XAKH5kw26bSBU3eY38bmajwbhTSufFr78
         vMpFchA+tdGxg4/KY804OnvHvlwz6tXFj5woOWF3PJOyrltYL2dnWEh/lllyZk3dIize
         HhwLYeyAVmkdnVViJlD7udmO8BTfU3VDIsc2OZ8Ct4WcsfIybufJ8HBN7/vfiOsBivEA
         +r5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zVXeZkET302bdJ2mMiYB86Yu/U8ZHwDhxPtTLSFmI38=;
        fh=NEMHOnsA01LrW3SUQ774+skN/vcYqtFM/urxLLjrvtA=;
        b=G+/lT1+jKIaYjzD5AQbKP2PYd7neJLmDIMZLweTbPik10mLB18A4TZnY0VXHrhNVvU
         HXcqR9HexR4aH731N5IYw/rlPF/GQwxIcM8r5th6pFryASMnM5V8jl8Ap8ybiStEAx8L
         z9twwSFNjN+A0hlZPrCTwPBGJ3SL58xCbHvQ3cvBOnhGIAFr8T4s9ymoZZAA0ZHA01K+
         qRdzU34ki749sbg4J8p5AaNsMshmaKlzgKYMD4IFNsK4gacu8J2F4A11oyrbWAZ0BmJw
         jhjccObmtHoGep++R4Xn8jQUx/TlpOzx1wyzqOkEgvDRCDWGpesPiO5LtlFBP3byvTIi
         xKwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gccmJJu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435889cdbsi153184261cf.72.2025.06.04.05.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 05:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gccmJJu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMnL3-0005ym-Eg; Wed, 04 Jun 2025 08:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uMnKz-0005yE-K3
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 08:35:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uMnKu-0006LC-Gh
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 08:35:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so2160905f8f.2
 for <qemu-arm@nongnu.org>; Wed, 04 Jun 2025 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749040514; x=1749645314; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zVXeZkET302bdJ2mMiYB86Yu/U8ZHwDhxPtTLSFmI38=;
 b=gccmJJu5rTIr9jNZ8zFNTez/52ZiPu8qYuaswQ26y7KGYpDdbExKk4oF4i01Qs4T5a
 t1l0+SONFNxbX9oT/Ubs/OMRhzvd51VchpPvEpkFlKHGryRF2C3NokLS+hbx75Bri23O
 hiMIXu/9Qu1ffqa8jrsoJszC7Y7wgCLNcn2OwmRz1PPqaT4XWp7A491G++GTE+wES0FN
 ht/C+3VktpVM0kgyF8Nl2F9pTHCvSMrXK7+wapsNf0b6zyPR6pRsv2wdltWM+/yi0Z8U
 Hunkbg4x+aHAq/Tu86PUE2/40RMUdjNiKt/zXSntq7wuSz9jfEK1TQx1OBDDsNg4YT2S
 D2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749040514; x=1749645314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVXeZkET302bdJ2mMiYB86Yu/U8ZHwDhxPtTLSFmI38=;
 b=cXTQeFHVV4xx8/lwYeCCGGMFOzq/rPKerWoNbrTp60KR0PfjnLifaXJ6lSW8jwVfBm
 AEQMbhDKZdO3jKs9rn4VV4MBjb/qD8kCY1N/RS7sWGkJJNbYnlmx/QExGZTwxKu2h6Gb
 CqVs7Hz3PgmAHoedxo6FMazL6/AAjW74gf7VV17mv0rc8UEUAV2ozI5cpZkrc4+0kPJw
 7+DH49oxx4QDVmg7rdwMpY0L2ZsVYKzqkTbmum5o5P007JAlEvBB++Ry/jabsbzPQn96
 MnlBsyN20QzQWB0BuxGixiVX2l4/PhMoqOGfEtGAJvh4wshVntfj4YDrVFOTPnYKBJCD
 dRmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbac27E4pQZWNKPI9R4rCHauKwVbzgNLGznyAMCmLHbe+797PRtPo47Sc8iK81q8DPW96/mw0bbA==@nongnu.org
X-Gm-Message-State: AOJu0YyRSpQBynuim7L6neCjO8V1CG6MYyn4wyCWoOdSTGyaCOI2qHVl
 m7A2AX3tv7412tDujCHOHTSmX7/v1c1eg/x/fBwbpXqlgJ1e7e69br/zdRaw+1zfdeM=
X-Gm-Gg: ASbGncs4Hd5lsRsiCzOKjZC+UGVXmLcJLWPT0N1vgjbn90AEwMnQH5JCxVLRaQpW/kf
 J/JksaV70FNngKQSe/3XmUjhXLqi9WV3pIMykncDb2q9X7nBZbX5+RzVDfxTlkE1iO+5f1/rdXB
 2QJkKcGrwhcnfbvKxDoebAnZCNGO5ngBDAvNcIRTMxJSxwKS2n4zJrnl7Av/lnEJNzzfhRu6/YJ
 ifC6cJuY4UMfP1xZGTg9P9zrizF9EsSCXmvM68DutGFh+54SeouGD68YkSYC5A9ouivWTSZCTWl
 +6oqGXsQTR3IOIaICrWbjjrbLnTwWK6tYPzUhZXpx1BXvZQUTR9fS+bhHwlq7qAzZ2+/AZ2AbMz
 r9ucliu+lsknms4p/2zk=
X-Received: by 2002:a05:6000:1448:b0:3a4:ffec:ee8e with SMTP id
 ffacd0b85a97d-3a51d968aadmr2051017f8f.36.1749040513490; 
 Wed, 04 Jun 2025 05:35:13 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f92585sm211497715e9.5.2025.06.04.05.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 05:35:13 -0700 (PDT)
Message-ID: <16032058-90c9-4a52-9035-94c8491fd277@linaro.org>
Date: Wed, 4 Jun 2025 14:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] hw/gpio/aspeed: Fix definition of AspeedGPIOClass
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: chao.p.peng@intel.com, david@redhat.com, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
References: <20250604115400.98905-1-zhenzhong.duan@intel.com>
 <20250604115400.98905-4-zhenzhong.duan@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250604115400.98905-4-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eXjuYqyrHki3

On 4/6/25 13:53, Zhenzhong Duan wrote:
> AspeedGPIOClass's parent is SysBusDeviceClass rather than SysBusDevice.
> 
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   include/hw/gpio/aspeed_gpio.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

