Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAC2CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:44:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jSM-000727-8O; Thu, 25 Sep 2025 06:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jSK-00071Y-DS
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:44:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jSD-0006ls-5f
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:44:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46c889b310dso5961965e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758797037; x=1759401837; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3oKgxz8PZ25GaoWLLeZC/ctFTDaqSXtgVX6PlaWFhDc=;
 b=Uv7oQcEmxkghugMfYhihXVxQ2KLOAJnb6HNfeTwqj2Uj4+6Rdl2ms2ryH06IeKHfin
 a/EH+gRGEMo7fLi/Chk+XQCSqqGDhd9fF/H0skrWFOKhrhJW6PDdmCbnF0qziyhoO0Lb
 6JQaKURFowi7ty4BhpW75d8DHhIpwsVdAxZE7U2QiSLTIZ1yKTvDPZGE2G7MBWLoDB/M
 HzFy2bm+dXqZvOfHVf9s36uH1SZFVldz64erLY6eX0oSBAM3Diw8RrMPXUSk7fNmWUfm
 rqHCH0EF961G60kjv9kYW5BTIMTtteGZCyJPxGnG3A5L0N1Qjb9WCPhCfyq4mIDcNaKg
 J83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758797037; x=1759401837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3oKgxz8PZ25GaoWLLeZC/ctFTDaqSXtgVX6PlaWFhDc=;
 b=CmaUaX7ndvACzwcL4nrpbTzIAGVTRauwpSkl52/quPtjlX8W0s9MC1qAVP9tajP6/n
 u4J8jMphxFyyyVAYyB8+uLXrp/fxYj2DTGb9jIVC2UOsU5j6coQBDIh1U81TMoKqEg+4
 Svaw0MG6hrNNNzTviJk+x86hbvr1+AeYVda5j15OSgLXC8qkvF1lhtyrp1Yt+3DzIW6z
 sA7AdNrohqAHtJC2NDbcOx7vOhOVgyAcOWD38sxVoU/QJgRZMr6qs5wlxbHLWutbaryo
 Kh7DUJAaeqZEzGlM1PjwVR5O+TgiAn2DIMr04FZ7uz3RU50mvrU8wUt7q5dRgCiWD2zS
 JnUw==
X-Gm-Message-State: AOJu0Yxud9pXBDZiLsk+jQglCTsd8l9mRb0evZlbnpTd8Xmk0qqt6+fe
 tjuBPY8VDRK8gGW9EisAmhXqKkXzduSQspT2MmF6vF1hVNQl7WZNXhKwqyy9CF2VFCSAzkm13PD
 qzx9wVAEf8g==
X-Gm-Gg: ASbGnctycwejhf/S5KZcJq1icZPXRVXXa2Q6AJKzqBAYCFYo0yFq+lxBPThkS4fwOgo
 1D2RLl3TRcqnyTGci+a8MBGfxbWwRSGNPgY/Qr+KHX3yFI4dvhzElQB96cOtPsh/Al4+Duof3p1
 NkAogxJAnrp8xmeabSX7wd4wOH6g0kmWduborzTFwFMwwAiGoMi98JBHIzPAR1JFnBNfu/9U4sH
 YE9Z19BHP4Dd48a7q+P37T9TSJD/XNCnGgNgO4jAPGl0OpkbcP+NeBaQZaFYDsbG1P/jJK2Bu7a
 Xh0prq1x3sDFXkQ1FSbTprCskv518Q2X7UQLnHX1OYRwOveWhEXHluqhoRLXA7t0n4bKIgfGy8+
 i3zyUz0jYJcfFu36EdKPG2KfwJP34enMrGWVe6BxunqLUpe0cakK3288irIVZ5zsWNg==
X-Google-Smtp-Source: AGHT+IHVW83WmJ4PInP/DKJBE5dzQ4mKOEpu4PboJiyS0fApdaBqUXR9ttiUjuzMesPaSiZ3sET0iw==
X-Received: by 2002:a05:600c:3044:b0:46e:25f2:705c with SMTP id
 5b1f17b1804b1-46e38a52eccmr3395695e9.13.1758797037496; 
 Thu, 25 Sep 2025 03:43:57 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33be3268sm29014145e9.11.2025.09.25.03.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:43:57 -0700 (PDT)
Message-ID: <512bed7d-b332-4f8d-889c-7b03aa7556cc@linaro.org>
Date: Thu, 25 Sep 2025 12:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/36] target/arm: Convert init_cpreg_list to
 g_hash_table_foreach
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Adjust count_cpreg and add_cpreg_to_list to be used with
> g_hash_table_foreach instead of g_list_foreach.  In this way we have
> the ARMCPRegInfo pointer directly rather than having to look it up
> from the key.
> 
> Delay the sorting of the cpreg_indexes until after add_cpreg_to_list.
> This allows us to sort the data that we actually care about,
> the kvm id, as computed within add_cpreg_to_list, instead of
> having to repeatedly compute the kvm id within cpreg_key_compare.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c | 54 ++++++++++++++++++---------------------------
>   1 file changed, 21 insertions(+), 33 deletions(-)

Is this the why for "target/arm/hvf: Sort the cpreg_indexes array"?
If so, maybe move the other patch previous this one?

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


