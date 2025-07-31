Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D747DC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:48:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhb86-0007J0-U7; Thu, 31 Jul 2025 17:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaoZ-0007pn-R8
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:27:56 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhaoX-0007nl-Mw
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:27:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76b77a97a04so221065b3a.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997268; x=1754602068; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCyROFDtAnSwYWUlhHSj0509pgu87OOt5KfPZt9VUJY=;
 b=yEYdOB9BVNsUdNtr3jzQ+OnptxZJQZ0H64qyoAGO3zWeUIGqBZ5T11pGnqevzEM6Qo
 nh5wfEyFh/NAoERno0yrmJ+Of7Fyjt2glGO037CxSscAs0r8s5bQR3lrX8/22OboTCQ6
 V34f0aYJKpwm+kyuMGxhS0C7wOrxSNNqF/q+DzDeBt2jRmpUfz3EB7OAASIgwOwu0c31
 7zg90kGqfb6oNjlTqll01wpuwSVJ0xCz5XT8PAuwy59ctpPXXEVtokSEsbCuYM21CPQh
 /UzZV//GmFx1MCfork7daW1I/DOYpJuWEMKYetdZjSo6S0EwiuSJsvC89tKgWtxF1c9u
 4LVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997268; x=1754602068;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCyROFDtAnSwYWUlhHSj0509pgu87OOt5KfPZt9VUJY=;
 b=Oo9e2Tzx5vsVHi+ZRcDCsQSCqVV/PA5WAfjyIjqCwr3cQaGxCgV75O84KDJGVJWPSu
 sRJpps3XU2aKRv4V7tttOO79FAds56Ydk09RcRb6OidVkV7wkSW208PLDjN5VMzKmKk5
 I2eImcc2zs9ClWxa92aDUVgTt9vASvWaCzlyCZTjd7zau44tn9QJ02F0KqNRYAihfPDl
 4OxvnLFm4paz0B18hj4zIeaKWUPFxQJ2KJZQw1WojDj32gDklRp3W3NGCmtw9yZcop7X
 xMIbLgmuubDj5vhtczpNERNdkAV941j06Vys6HJ8DF3R6T6nFA9rByw5KCJpp8g8n0ka
 w6mQ==
X-Gm-Message-State: AOJu0YxT72pf885+Ler1ONdHMlUPFRBnUpllGbr3c8p4YF/qfG6+U9u7
 dJy1HL66Q/N3EZZ7tEmZQt1qrrAXFvZd0p/MaR+e5yHck9netRJtMvgd9bOfmnew9HY=
X-Gm-Gg: ASbGncvlNrkE0ofRELH9MhIpVq6WGjRyVBDGyiyIE2pCqWcB3C+h6m99hRHFWWmqBaH
 mwtAJCjD2baat+nCd74ZwAg76ekD62I5n/ha4bq9bCwLWeK+WzoZt6A0dWuKYoKcPHfKXZLotcD
 9q3DSipDpeCC9+fFKjtZXd5X31x9bfGtKy5tG5ZSIaynw1db2/Fakoeuy7gc06igWHjQM04qVLn
 MlK4dEpn9Y1wvR/pAV/Atd3kcc2JoTjRVvH55elAvgMxe5MK2vdnjdXkvyg1W8TtfLnxCYRlCsO
 JuoDR4wkviKWucZpkENnprr0CzC7FaATIUGmjF6KtBNStH6oSa45Ru2KkQfqZu0NRa0sM2ze5EJ
 CrGv9as4geUpI76KMI7sHZtuW4X4rFrUCF6M=
X-Google-Smtp-Source: AGHT+IHsXG067uA95rUUthiwRgmKHcirISt17rwQ/T7NJXuLotoma9V8gNIWxVdSKGjDDaH8SdyI+g==
X-Received: by 2002:a05:6a00:854:b0:76b:a439:be4a with SMTP id
 d2e1a72fcca58-76ba439c1dbmr8076576b3a.12.1753997267957; 
 Thu, 31 Jul 2025 14:27:47 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd05dsm2383940b3a.81.2025.07.31.14.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:27:47 -0700 (PDT)
Message-ID: <d2992753-eb8f-438e-bf14-df5e9f3b10fb@linaro.org>
Date: Thu, 31 Jul 2025 14:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 55/82] target/arm: Implement GCSB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-56-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-56-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 8 ++++++++
>   target/arm/tcg/a64.decode      | 1 +
>   2 files changed, 9 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


