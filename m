Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2116210ejb;
        Mon, 13 May 2024 04:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+I5p2UhTYF7IZg//J3NnWLW4BIv5yKKzADtUKKjyT2v4N/8XDEbt4QGdCjrpinEVsIa7G2GvxEKPruGL+WxvbczouBP+Y
X-Google-Smtp-Source: AGHT+IEKkQm7mRR5NGfYAK2Vok7T/KAj1UuGdLvAoo9hYOcZHl0MEke9b+Z3zmihpvX19corOY8W
X-Received: by 2002:ac8:5889:0:b0:43d:eeb2:db37 with SMTP id d75a77b69052e-43dfdb81babmr149693651cf.66.1715600125840;
        Mon, 13 May 2024 04:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715600125; cv=none;
        d=google.com; s=arc-20160816;
        b=TewSP7/X+bQHKHh7D6HcBSy+3IF6Rt+B7cHjUS28qYkM2unRo0fShJLdudp4nFwrlz
         Ik1j7af2/M/HLw7rRqxaQKgcQFn+KZtovihvaz6doc5bXDgfw/XXJ/DGKcdC9hOZFgqr
         cFddXZ8bBlrH4j6SHsnb2lJa6XCRtTeC+2Ry+Y7roj3WiNrYg0UUiyUnUfVNXqwJYprX
         AK+mh9J+LZ8Hn5rHYMMxgncD4JA+F/n9q744vJsLa6BfW/VR8VFlIUZ8s5CKa/XJxjK3
         tc+8luTWgnuDI8+zitIElOHV1mhQM1QAak2Oj9s38/1/JiRd9BzndKCXrSZWqqc0soRR
         3Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BOCXMR+sUnm584+BeT6hLb+0XVs7wIrrfxrIxNK5p8E=;
        fh=Bwdpltdx17YEV34nGYDHiRyBzyzeZnrlXcN7ZMCodm8=;
        b=j9N8u2vPxQMMhZSOPdWaky3hnuBNE6UivzPOqqBhouguK0j4+INO80lNrn1GdQlN1Q
         +IlT98tqwOwjSruiUcxCpdn9e+C+15dFwenboBdhNNwHr9hvuQYmXPF1yDtxp+FJOcRm
         9yjk9o2TWC6NW0e4QVJL44v8ptOaKwAl7g5vcffRGGzSAE0VNdJ8dobjPSqswCXt2DXC
         R0u2O/D7ZOtJxo7JtNND24/T4553G5DwDSu3j1/ravB7LfMxMK5Nrd1nebUvMkauExFd
         uN46jczthWeKv6Mqc0PaVAYmxZJS/+E5+RWiXMApHQ78UFD68mEH3Fp5YWy7Hsrvw/B+
         apaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0Rn1iht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df54a1e78si101457931cf.57.2024.05.13.04.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 04:35:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T0Rn1iht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s6TxM-0004xU-3J; Mon, 13 May 2024 07:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6TxL-0004x0-9V
 for qemu-devel@nongnu.org; Mon, 13 May 2024 07:34:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6TxH-0001CP-Kf
 for qemu-devel@nongnu.org; Mon, 13 May 2024 07:34:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4200ee78f34so14723065e9.3
 for <qemu-devel@nongnu.org>; Mon, 13 May 2024 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715600094; x=1716204894; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOCXMR+sUnm584+BeT6hLb+0XVs7wIrrfxrIxNK5p8E=;
 b=T0Rn1ihtZBkru0HnKR2e3S1hMJ7zoVvpH6ItmHTzAf62nCfbWJtHuUOWTUzv6b+lq4
 GG8xZyx9gfItD3bi+bvGib1KZK6BtcfvpMYGnBTpk/5ZhthHjXecgQfgGTULuwQXM6BQ
 lXjH3yrp7Q9Z6BCIw5QbXtqc0XG8Ijc9kNPyuUvANaWWJo8F2eOPZK07RWas0TwXpKat
 55NIva+gkY5axOw4AeUMyageNHmZuPsV4tFMzF7un/bU/NYJGrMmovq7Wh27N4Ty3Ja3
 XOnkTP1vZNbAhqLC3p0miIrhVMdyLVfW1RhJbukj5c5BjR134ucgaV5KZCPlO5N66Nk8
 agGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715600094; x=1716204894;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOCXMR+sUnm584+BeT6hLb+0XVs7wIrrfxrIxNK5p8E=;
 b=TLuitEXOu8G9Xnt07/mN7zHrJmQmWUMBZCfx6lNayr+Z7gj5T3f1cnnQxTTQQsuduG
 fdlYZxNPIfnhQ+dIjoTLXWSXjtk0fIuyvUpZM6JYE7cH5FvhlQMyr0yRVx7UiyDdfnW2
 c4Hwe5jubG+PpF0wgapMv2VZBUv+0retiyHrRba8zO2myxKjHXrmwPdJBH3EfdoI+Nfw
 WwwTyNDaJSrVSIrSHZkZc2P2XamlsfFcaNphUTPN5PbEzM2JeVhIe00joBe3GtT8wMqA
 S7FTR3Oy9aWgpBX0QmB+Ld1DpRg7tpk1JXqYAh/6rq/MLynOtR2uWgyrd54zA+kjyf7s
 kJbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ8v5ZiW2lC8yeAmuXEzdRDxQ6FZ2sfW1JnQ1KXinbSkZ+i+Ve3xX9T/Xe+/k0ii4CjrZr8TSI3S3TllfdQ1kIJywE2PM=
X-Gm-Message-State: AOJu0Yz4i3Sq3XDdHzOXTwYqGRhSwenqPdDPnGJbrgolAqUfantcZX/7
 GcC4TfTDusDLurQD2nzQk0vIl24jqVOGdDGyO5klK+GxOKaK3DKzA7+F64a2iSE=
X-Received: by 2002:a05:600c:1d13:b0:41e:1bc1:36de with SMTP id
 5b1f17b1804b1-41feac59cb4mr72622325e9.26.1715600093896; 
 Mon, 13 May 2024 04:34:53 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbe43sm10856350f8f.99.2024.05.13.04.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 04:34:53 -0700 (PDT)
Message-ID: <55a9cc05-7f64-4ebe-b552-aae3c67e1f5d@linaro.org>
Date: Mon, 13 May 2024 13:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/watchdog/wdt_imx2: Remove redundant assignment
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org
References: <20240513101108.5237-1-shentey@gmail.com>
 <20240513101108.5237-4-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240513101108.5237-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GjHGpeXRWJv/

On 13/5/24 12:11, Bernhard Beschow wrote:
> The same statement is executed unconditionally right before the if statement.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> ---
> 
> The duplicate line may indicate a bug. I'm not familiar with the code, so this
> patch may go into the wrong direction. Please check!

The bug might be in imx2_wdt_write() where the WRSR register is
overwritten, shouldn't we OR the SFTW bit, keeping other (such
TOUT) set?

     if (!(value & IMX2_WDT_WCR_SRS)) {
         s->wrsr = IMX2_WDT_WRSR_SFTW;
     }

> ---
>   hw/watchdog/wdt_imx2.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index 6452fc4721..f9a7ea287f 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -39,7 +39,6 @@ static void imx2_wdt_expired(void *opaque)
>   
>       /* Perform watchdog action if watchdog is enabled */
>       if (s->wcr & IMX2_WDT_WCR_WDE) {
> -        s->wrsr = IMX2_WDT_WRSR_TOUT;
>           watchdog_perform_action();
>       }
>   }

