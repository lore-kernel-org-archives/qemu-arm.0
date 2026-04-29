Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D02CCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 17:59:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9C8-0005TD-Lz; Wed, 29 Apr 2026 13:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9C6-0005SQ-1P
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:59:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9C4-0006CO-71
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 13:59:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso324225e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777485567; x=1778090367; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fw+4VP1tFhJEqc3YP+LUHQ2tRwRgORfHZKfCOycODHg=;
 b=mkeghWWlOwp74/xDFlm79yQTVq0Qr5Rsoj1+HjbLJc6da8Rg3ul2QIMCpz9YgTpuVA
 Zrkj6b2zDTxS6OvAZNv9FA5nJH10NSAIvTGC2oCBjjLaWT3FSAesFncRYHgQF00LvPsc
 VU61MGixqrrqzPEUTNnQ3Xyh6jeUnMYyxT5YfDadmMe9Y8haCJIvxtD1e5ARnb7xVVKm
 lVwOT6h5Vj7Xy6rMPee5lc54a5Jz/ghx6sFRMqLTKjzVfjINIADKeHvQgGfTDXSR46dy
 IR5Rk27Xdq720wZIHffhsjycvLWI/Eq2QyZOU2DBcQy9bND6FgV/wJ+21VMn+9MVuVIU
 xGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777485567; x=1778090367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fw+4VP1tFhJEqc3YP+LUHQ2tRwRgORfHZKfCOycODHg=;
 b=AC669e3I3k4ldFFvKKUtvrLk37bo8kgtV2yWvTpO30dsPfOWy4BixVDM/t8HHe8c5r
 BOv+g4ePES5xEUiT3KU7o5YnwhxFY/oNP0+sy7RBlGl3XvVPBuhw170mSCLrW7p2MAkI
 LX0fokmBorPuLAoDfAm/7LvxNkusEDEqrCtQyY+PptXwTL3uUkI8Xq4+qV3CH3Pi4rfO
 rSSl6MWWbCjfUbeHAP90FEwaYELs8eePefcyNaYGv9EJFFfMzRUDEPYjcGkdAwIel9II
 4+HPrZcz2RMwhzhz/VhfoTlGZPrAtXwAf4dPXughuC+fKpmmGOOrDpHc3JcxMfEzmini
 XtWg==
X-Gm-Message-State: AOJu0YyKiZs1vUvxtlMS0ps9yDIJEqInDOfztxu8impRq/cYmSoM8ULP
 vOXue+b189HXJNPRM785w+nQBHGcPocunsTMTvaiUwSBpIw2WSC2FoY84mQxUHhRG2w=
X-Gm-Gg: AeBDiev5Q4p8M4ouEjFsODQDNqQPXh382jlStRPSszTKlrE0C5wtRSGOVXm2txhrI+1
 oB7lsq8ZL3AkWeBfBouWQ7AGESGJy/BjeaE0lNsmkJm1F0WUygZ9V4n6UlF/9xfRkN5ghGLkR2U
 K+r1Qx7+n9VrBjM6AS9ESC2JCkGSj38mbiaR00WZEmkTMHvZTJHIJJCni5Ewlx71WtOHAwBtLbx
 NVOcu41NPKVaWgqHLyDC7oSD2rjXO6+rPj6P2fOWVwC01Mb6CqiHsoR2OpOJt6NEv448Anlnecw
 LqDl89K2xnWViOOinrj2uH/I7m5KkJtQEKkRIQMf+8/rLksIPYL9Q6nBulGkmpEREmAgaAvvr/8
 8R8zncZ661T638KgoTO1kX4oWDocAyFIkG2dMfuWus7g/OugK2nh52Q6tMuKsjFdMny7PXGoK12
 sG9rxES0h5KYua8tWc7VX2pKifnx+jalycA3eNb3r6xkb5ab8BFf+8M+mg3IXx7m0UHSTeUR9SD
 4NF
X-Received: by 2002:a05:600c:3b0f:b0:48a:592c:e655 with SMTP id
 5b1f17b1804b1-48a77b061a5mr138733835e9.17.1777485566599; 
 Wed, 29 Apr 2026 10:59:26 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7ca64ffsm7550980f8f.37.2026.04.29.10.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 10:59:26 -0700 (PDT)
Message-ID: <ad7915e5-5d68-45d2-8cce-dfce3c7292a4@linaro.org>
Date: Wed, 29 Apr 2026 19:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/84] fpu: Return structure from unpack_raw64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

