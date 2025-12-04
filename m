Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B7D29FAB
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 18:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRDvd-00047G-SL; Thu, 04 Dec 2025 13:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRDvb-00046d-UW
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 13:19:43 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vRDva-00016P-A5
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 13:19:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-34381ec9197so1090361a91.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 10:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764872379; x=1765477179; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CYsc787tQo5xf4+vPWXZrVzbUjRunC0ksdnBvtGJAgI=;
 b=qUxvGR/mQe12wsFaA4RXjuYRyIUndiWNkpc3Rnq1VMAhYqUAB8ga2KgT9fHNUo1qcp
 XaSkuYl1SWLUGoEdXb2mNm81dVDs61GcD1qKpCZ2ZeY3Lf5CTiO7xKz7MsyGsbeyl7lq
 RA6QSSw5+FSCak0uuSbQxWndYPzFJ64Smthxp8ADOAxqZY5idiNY2eLhoFiYAxpyS3P4
 v9e8znYdOL9HlmsUFdsVXXWHTZ35vA8deVlRcYjcpDqJlmkbiE7L0k7QCLIDKdzk2MHp
 uPPuZZyAQ0sAB/4jt6+Dfh8IVuo+MO1CKYKQ4zPbUqauGAZQXbCkOQ+hzRor+X2ap5FV
 /i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764872379; x=1765477179;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CYsc787tQo5xf4+vPWXZrVzbUjRunC0ksdnBvtGJAgI=;
 b=oyBHS4r0QvRRJ3CH6QmuTthkI/Q7fDGiWoZ7/ZRy1HgY4DftWZ9veRsniF6QQ2CQum
 AcZsmK6xGH/MFBoaEEIbpP9Vo5Z9W9Nxb8gwFmhXhZJqBMvM5vyN6QR/0KMrFiJETZQJ
 28xAY2wbtpRxD5b13aHfl4K5L+0XGBvxe8/OKMyCLII5vIhqWWgPxyv4yhGkQtH5o12Q
 ZpewWHXkfJxROoZMesxi+Bd6rny7hA+gxOCTwN+ANsFrwqqD0z4Xmat2dbNwbDHxdWa9
 +eF3tZA2PbUc4qXhMHBWnVUvb1RN3dSQSjgFd9WrhOTsCUg0UST8m6PwnGZD6fD+5L7m
 JULg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3hyOVFoKvVXA5xiSGFXITyZh94j7s7piJAM6NDMkbvWLXK8A0WmQQmh2XznRg9JW2JRlIK9rzXg==@nongnu.org
X-Gm-Message-State: AOJu0YwpTAmdAi1YTTdg1la4Ci6AR9rU3ni1b0672wlaTwoT8E0Xr9qD
 eIuJikE/9x2L++ddWA8J2nhYp+Zv8kQAdXdq/7VZBwKZjQaPZsgQpNyFoISK4b7hKao=
X-Gm-Gg: ASbGnctY5fUNfA2aT7t2LzJEWjyWuVvGAHKTPBntqAe4TedGjEUt3FGqB4eElzSW9st
 hANAmKjXY7t50IY+ktrGPlOt5ppbnK1xPrOeYyxz+WiMxpNqiGgjCoEc+c68Bb378JOJxDWzbkG
 ajtX1cWxZ7C8sYCGZ2G/psvqLm1/5umx3Qs5tj3hif4t2WZezqtFmOxm23rLdZXV2cxK/l47eF+
 SDsvH/Cy0LiAHHQDSHyLr/mspr6T4in9A5Up6S6Hop5RTpPnJgNMbPa1YelO9Yse+V6tWWUk9PF
 ADsz3Iz7Pm5QwlB7HNmFXA1sAeJ3V1VBUmIvbLELM2aibR9UMKI4RqeQgYnEq6WE8A/pIGbiHw8
 J12voy0yVkyLWdY0Sw4es4oHLxhS2YFy9ZMe3ao92JpVOhD/pWZl3p98/ocez2m6/sOHfIfxu4Z
 GBwqLBIT0kqFRNzy5mI25Hm2VJvMxzNGayWEu7NkyetI0eqPGVgIk0fyA=
X-Google-Smtp-Source: AGHT+IFnuzRenuZm745XhXwUqt7evMiM98nS8pYBlCqSfXT5jtvQbyR8QTYxw2y9zeZE5nC3Rpe9qQ==
X-Received: by 2002:a17:90b:548f:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-349125d346amr8970428a91.12.1764872378769; 
 Thu, 04 Dec 2025 10:19:38 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34912a07626sm2484926a91.4.2025.12.04.10.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 10:19:38 -0800 (PST)
Message-ID: <59eb723b-e34f-4a5e-a2c5-2e3242cba8df@linaro.org>
Date: Thu, 4 Dec 2025 10:19:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v5 1/4] hw/arm/smmuv3: Extract common definitions to
 smmuv3-common.h
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251126154547.1300748-1-tangtao1634@phytium.com.cn>
 <20251126154547.1300748-2-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251126154547.1300748-2-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1034.google.com
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

On 11/26/25 7:45 AM, Tao Tang wrote:
> Move register definitions, command enums, and Stream Table Entry (STE) /
> Context Descriptor (CD) structure definitions from the internal header
> hw/arm/smmuv3-internal.h to a new common header
> include/hw/arm/smmuv3-common.h.
> 
> This allows other components, such as generic SMMUv3 tests or test devices,
> to utilize these definitions without including the specific SMMUv3 device
> internal state.
> 
> In addition, refactor the STE and CD field definitions to consistently use
> the 'hw/registerfields.h' API and introduce corresponding setter macros to
> facilitate structure manipulation.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3-internal.h       | 255 +-----------------
>   include/hw/arm/smmuv3-common.h | 461 +++++++++++++++++++++++++++++++++
>   2 files changed, 462 insertions(+), 254 deletions(-)
>   create mode 100644 include/hw/arm/smmuv3-common.h
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


