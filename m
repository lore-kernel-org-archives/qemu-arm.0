Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp183445eje;
        Sat, 8 Jul 2023 10:19:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+p1e8mv3hTI0KDsRUvgWrq0gFSuf9EqtHgWVmufVZNyYYSoJ/RV9DinJhSFmnG+3eZL63
X-Received: by 2002:a0c:8b8a:0:b0:635:de52:8383 with SMTP id r10-20020a0c8b8a000000b00635de528383mr5967998qva.59.1688836790934;
        Sat, 08 Jul 2023 10:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688836790; cv=none;
        d=google.com; s=arc-20160816;
        b=RvgJhAZU6IowPXtqZXHVwfuwmNTdQvTT3wXTWZ5/whmzWzGmQRmsY0nwdS/MeUY3ay
         BvYKywkzGpPeEttmK7bHmGbQEa74+uUQZwuxhAiFGo/JwH9cJnQLRqC6DvLBuuMLbMw2
         Vyqc/3nqrVTukcpY+X6A/4CTFOERUDeBMOHp5wXyptnfE0LzWKxhTHUvQtIDVXnc0a8U
         HSpm6sV+VZXeugcqyKFEmfSrsf31b/wIq1wMA134QHwAmvDX0Vffn637DChA1he3H2Jf
         Ns3zy5VxM6EVt0oxomq9kctd+iRkWXlWKvGtCfavmaVX8dxpeLDT3Sq7mRl2mTU+Pj2u
         Yjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uBq6xE0H67dxAxxLrM+uItKGrmh4nAnJSVcXuurF28Y=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=fTOCFrXOXVoaWhK5dNCRm1yq9nObi8wUIMddiM9F6tgfMlusBBzJgVfJEPo6nrfwH/
         HTkQRLaLYjcvb85wg+cXACZmn3lBFSTh4gUhcBbEMDWZopDpdTTqJIA2ugEptekroBFD
         fWwFUG8tmXfIip1lpZiG/0nAskn70A6Pc2zwfMxSS9B1eE9tHV4+WThbJh9tuS6Jlqh8
         qMQCbelpO5wu/XG3H70wG+KkHa4L2XpthoFWqusSZCTueyzh0+lcPruSCQpw691XhvSv
         KgJ/s2LWMfG4HxCVaIUtbMmXx48fzUc6hb7lWBwHteo0baWhK4j5ecmtzk9Mty8MYcFO
         k4tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHgNXnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05620a454600b00767bad28805si1654547qkp.667.2023.07.08.10.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHgNXnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBaz-0000Ig-8u; Sat, 08 Jul 2023 13:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBay-0000Hy-9j
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:19:44 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBaw-0003q4-PR
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:19:44 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb9fd28025so4507592e87.2
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688836781; x=1691428781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uBq6xE0H67dxAxxLrM+uItKGrmh4nAnJSVcXuurF28Y=;
 b=sHgNXnHRDhWSK8PPLDS/A81M4E2QhZ4MbpfotK8OE6kbNEsKNCKWgEuisq0ykp6h5V
 I9bB0LPjy++zY153jpjY1FKukyFMDubsqtD3cVKFtq5/+LQhlxvcV3bcQa2gHBHof/zv
 xSSOGhmTE1xv1UqyxDrfQgU54qOToK+K6epZxPygFJXtddjRTlOWxrdIlD7nmfwJahBP
 kHInyOGPaDCad0zs+xuOZwnrgph7RUwpfmwmmphwxXxATtPWjUBcOy5TwslBUi+b+Amc
 w99C1aUus1k8GljAP71qJf/7UTEZYxPUD8d5HLEet+erJZ/Vsg9VSQSlanxzEl4/ji54
 rp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688836781; x=1691428781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uBq6xE0H67dxAxxLrM+uItKGrmh4nAnJSVcXuurF28Y=;
 b=ibWm6X9Yw1HkMSGIC80HtELbTJsOi5W4XZ9AavuoTalafIeqJabZqnMZDlNbQcUq9n
 MTVV+2O4elmMMVx/zh1qsu4bTnGyveJEhaXAPJbROFVbzjgzM3TWrTl1U0BqrGZXabv7
 Waals4OjVq0n8gsbV5niGWmaq8liWtuecYgGTVHrju2LQtZmpOj0PyrHirdr1nb62oxC
 GMFErbE6CcipM+iVFjvsd96kmnJTnqDAYCLeWnlQkAab1e5Yu305F9vdLpCZk5ib+Dg3
 NcZKK3UVKg8s7XsYhEEqiHhSMu975vbr2VYidLRxL4F4tXpdHQJcuYAdBGHkz8+QKtt6
 1jgA==
X-Gm-Message-State: ABy/qLa9mAr0q++j4FOFn3iGrkYDzeOh4jQhj95Dh7PjCVbLl912EIMC
 l0cihp4AVDAMyrpwPu2EITMIHQ==
X-Received: by 2002:a05:6512:3253:b0:4fa:5e76:7ad4 with SMTP id
 c19-20020a056512325300b004fa5e767ad4mr5483697lfr.10.1688836780953; 
 Sat, 08 Jul 2023 10:19:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a056402071900b0051a5cf5fcaasm3504349edx.23.2023.07.08.10.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:19:40 -0700 (PDT)
Message-ID: <54371e18-33aa-5871-3eaa-7931f22339b5@linaro.org>
Date: Sat, 8 Jul 2023 19:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 26/37] target/arm: Use aesdec_ISB_ISR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: b+GPuVkgRdrY

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESD instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 37 +++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

