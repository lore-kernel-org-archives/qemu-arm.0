Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C765C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:06:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbPQ-0006Pe-T7; Thu, 31 Jul 2025 18:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbHA-0000j8-Po
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:57:29 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbH9-0003w4-9e
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:57:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-748e378ba4fso2008167b3a.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753999042; x=1754603842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c8K2ENVkHObB6eaxJt/lxbHu3SyT9KYMZ5ymlsNoBKw=;
 b=hYdMciXR5bobPwTaa939tor9RiJWotsqwsDIebnJ4OTHDV4tFolBFazeVCYtUZi1Uo
 83rmLFKZ9npEbeMN0xoecy+lTm+ehmVngj0sRx0atulaFQQjm0GDnJ8uiYJ2+6X7TDPz
 tOQfU46AUDnOPbNarniG/2TTJ3dQz/LtnnCcGWPT0CpWg7KtMOsKwvvFS0skL70YCmym
 vOy1/A/rV95bz+ivgHAmeVCnvjnT8bMqA+hJU4dcDwrVbM0V6US1FU3KuK7Xr76ui3Lq
 H6+NDQRM5Uv7v96baCetFa6sb4y3ceOVl1Eoni26V01Md3uqg8/myPd7Xw0RKqzGMguC
 GPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999042; x=1754603842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8K2ENVkHObB6eaxJt/lxbHu3SyT9KYMZ5ymlsNoBKw=;
 b=ieezUi302iBtOpBeoNCbCNTtrPT/AMxFc3iZ9KCp32OzkkKwemUniEmXkmciGTFj0m
 /S/mr6YlOB13Jd5zMaaNZSYDIdtsTXyjARXm/pWEecXwuCp2JkFcfwEctEMjCF/xjKDV
 1z2QSSOvXhQ6+k4hm9iYC43BHTNBiWXoyt+ClYq2udtwjglOb3RO66jqTg73I25r+uMN
 XtpBkdbDdgdFSWH9HUw7COnnGp7k3wDLBSTxetkxbXbzbIp6Q8ODxSdTEApDvL7e9MHE
 dKjAO5teH9XKNk32CVSdUkc/0PtGtTA/GMWtDJ9mho60RB9ZtSa7aW7EIHZGTK8Fjf6U
 O7oA==
X-Gm-Message-State: AOJu0YxD0BigZm5M3AMEo8w/i6mwBRn8XtenXAUL8a26OmYxfpLPXn8z
 5xjttJb/pr5eU5+fQputBWksD7MyHlroCZ0yVw07yyiSC++m3ecxo9KHa/JMtitKZNylWDMGuv6
 KjMF0
X-Gm-Gg: ASbGncvCNXVdXl6N0Lax5aZs/rx3i0wWqE2t2lPWszLUpSxaCE/e0Ys+1G2x1S9CV3A
 RWS0G8kLfPRSrEe0+D/v0LgTdx8UB3HAX0mFmqVhhZ5jZHKJ3pmWmYLQWxCki829oEVtUrwcqsY
 w1LcIVu0KLkTsQer4PsBjh92Wlywt32zxdIdLFnGUKDRslVcw5DHjM+OU2CxYlpjfltSs+fmsuq
 il9RY3kz69KcWIUeezzvJuc6s3S9Le/jXIx+IpNowOAObDXEP8LSXek0szgyt7LXd0h1OhuCJ1F
 gTukFC0PuLiBu1Qv/7g0brBvg4uTrpdg2NiF7iOKyn4xjQxu1xAiUWJWT+f0JHbRLtCAn7lCiK1
 5VIBAzYbyHcr360sRbVcwjajIfpmXOWD2VnM=
X-Google-Smtp-Source: AGHT+IGixCdcT/eUzNoL305PtAIKLv3Gl8m5VzGLCVrOyXRHKflufVcwXOmeD6l+JlROSSbPp6CT0g==
X-Received: by 2002:a05:6a00:22d3:b0:76b:c7d3:f54d with SMTP id
 d2e1a72fcca58-76bc7d3f702mr7496369b3a.10.1753999042071; 
 Thu, 31 Jul 2025 14:57:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfdc25dsm2491518b3a.110.2025.07.31.14.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:57:21 -0700 (PDT)
Message-ID: <d229892f-37db-4878-aec6-dbad64619cc6@linaro.org>
Date: Thu, 31 Jul 2025 14:57:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 77/82] linux-user/aarch64: Generate GCS signal records
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-78-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-78-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Here we must push and pop a cap on the GCS stack as
> well as the gcs record on the normal stack.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/signal.c | 129 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 123 insertions(+), 6 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


