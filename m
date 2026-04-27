Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9C5FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIMW-00055G-0b; Mon, 27 Apr 2026 05:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHIMQ-0004zX-EK
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:34:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHIMN-0000ia-Ut
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:34:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso72866065e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282473; x=1777887273; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=67RPAAFOZ8aAkIAOwFm8Oqfz/EewRl4PmSMMzn4N/zI=;
 b=xvNRb8Sn8cP5aqUp4bOSv5TTB0NWkH9wtTHAH75q+e2JDLSik9RK8/HAcrfB0BVtd5
 OUkgH0DBztGx5d7j2/YdwFfm1rJ7U7D17BZaCvehouTjhP/vKzm27ST1RDInRi7+QsF8
 aEjWPLzwELR6ztjXlP7HtRMxRIVkTE+KTOwShfBXaKkyxr9c9dleUCZaOHzyneRiLCLB
 mEBwpPxZFsSFOrBTYRyOumFm/guSLH2fN0qwLrLS5juDUucy18Z4V3UtBVu4SzUCEi3l
 gB9IqrUjr4OnydzgCh1eVmyqE80tUBCd2ld4lLCfUySL/zsxB49jKixUo9M48jss4R5I
 lgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282473; x=1777887273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=67RPAAFOZ8aAkIAOwFm8Oqfz/EewRl4PmSMMzn4N/zI=;
 b=a+xORqzBoZcA++imvZtM8RD36OV7KaOfUBh0+wnRmEgo6FMyzJcCSi008GVn2G+1hv
 ND8xh/Yfesdxz0Kpq22uS8nl4CF7fRFsWObsACsTVott+mXVeLXLuTWiJtEeWIP1YEVh
 dP82x5FW1W3hHNycznfk8d7oGjP/zzKLjmqW1l20G6/mag2LFDh6Q5Rub7kFiVKrpJdx
 pYkjggRhbjqQ7p9HLrRmWxuRQsl85wxqB1q8x0+Vr6BS1u5Cj31mChlLIMbi2kBftF8n
 RmRcDpUSv96Ua0Eo9wIobz53A36tb+o8xqILOnFGZtBXvBG4/MywyY/oBdc4uwi/e5ny
 eISQ==
X-Gm-Message-State: AOJu0YxoGanyvrhb+wzIICcH/kx88de8u0wZZhkjDPXNRZi4vzf5y3ay
 qv/pru8Q6K+eXpkVSkkVdUAaXlhk+2jMbJ5BdHcZ62DEkn0BgtXC3CtcnYl7EhTDp40=
X-Gm-Gg: AeBDietK6ziboYd2I8pQYrv7mINbVxka3WHPrmEuQK3MIWzTSNyqlP6irnUl8U/Exxp
 I4lkDX7E77awSr8RGgVLiuIxCme+R1Pi453MlOianll3y5V+ezpSr+dkjaHJ7Q8H0diLeY73cFl
 INQfmH6TDAH2ETwmbe+9QHUXkWP8bstdDXXr5e5Hw2tNlwK0gbCmj2fFGnv8OjdfUDVugzMGNpL
 J6HSUKVs0TPyy4T7+dCVXpYoAKdLopvNlfvvSX2QzG1cjucgxGkPBy19+8u1hfxEmyqwXZjesXG
 jyy6MrFXMwJeTIfOdMFzzYK61jc8gFUsvI+7lNUn73stHZviZMLR+KtCD5Gvee/LhkYt+IeXmtA
 jzz3U3AsydAIWLQWKEFGpaS7IqV4UQrhBsnc+qMxVsIMb/l8Gskrv1RgyFbOAeRy+sNcwu9lGuM
 vReghQx7MsCqGxoNE1Z9jwvfDmIwy7ROuER2/0M3FvivjXIspdPRD4f5b0RG/qEHVBKnDcalKd/
 FWr
X-Received: by 2002:a05:600c:8586:b0:489:e49:f766 with SMTP id
 5b1f17b1804b1-4890e49f7d8mr335684405e9.17.1777282473505; 
 Mon, 27 Apr 2026 02:34:33 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5334cc2bsm157170125e9.19.2026.04.27.02.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:34:32 -0700 (PDT)
Message-ID: <3281139b-9cfe-471d-a32c-ce6be86a0c7b@linaro.org>
Date: Mon, 27 Apr 2026 11:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/84] fpu: Drop parts_canonicalize
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use the specific parts{64,12}_canonicalize at each site.
> Drop the forward declarations.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 28 ++++++++++------------------
>   1 file changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

