Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC36FD874E
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 12:07:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2TCY-0002d8-PB; Tue, 17 Mar 2026 08:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w2T9b-0000Pi-Jl
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 08:04:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w2T9Z-0001ZO-AA
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 08:04:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso48790695e9.2
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773749043; x=1774353843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hxek9CocehZdmLp7IhxuYRyRHSF2IBXEaBEP678jAAs=;
 b=cHYfhO8OSWOONiWbuR61OWPm4EJzB1puTvPDns2DpU6bUZeLeHoN1PyqjQ10J54afY
 M5OOMm4Lm8VIClKctCX70IlIwrEjzfObb5b+1jqlzxBlxmrZHraaJ6zR+ctwlCAbwF7m
 a2aPr0z0+8X3cgE7Eqc0LP5o3HnTh1EBDOehQblLBrlkrXQ49OyPUa+ZXQySeTTNeYfw
 3egsuTeREP3E4B/BpPgIwEyZiGg4I6Qy8y4sWwDoQNMDflkQmkLiWMU+3iQjD4XyDVNm
 7GNH3FBmpvCIqz0lYXg/rINwXYVLUMarsrcfgs0TPGkJR1P3fPvF4HVhafPAqj3dVbKL
 I2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773749043; x=1774353843;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hxek9CocehZdmLp7IhxuYRyRHSF2IBXEaBEP678jAAs=;
 b=GszMpKW0vUEu27O7s5cuYD6eq3ex+D+WUP+b2Ufj6AImZpFyoylUZVEEnbUe7mJY8Q
 J2reb7Ghvawuqp1nuj/6YcKNN/9POBvhrmC8v3FLfhv+EBehfOp1iNQBQ7aNJZizQzS0
 jwA8M1A5x9F7FbXj3X3sZBIVKdse3G6Oq5ilgQc3Kn1xFam5PU8/BF46BzKBu66Jm1xg
 cv9QK+DXGefyYnMd6xNwciSZ0MPQhWaY47flNiKIDjXUmHqP8yarc7Pvrl3paUfpdO0V
 eSkuJHGKYSHNM1Nwr9fKmOjjlL1QY/NistU3wV0MAsF1CIiJ3EO2DoSUmppbJ6MtQO7g
 5uRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhA2GeW/tgnh9WXkIVhUT62vneDkmdMtc/b1nnSbd642EXK3f5tpSCPgr7zu39/GDnWXOj+BYYnA==@nongnu.org
X-Gm-Message-State: AOJu0YwerSlh+ylHfDS5f4Ex7gmD8kIxzrxJnr7X+lTylF+lIYlytyRf
 x1zhQgd2soyQLUQPIxd7p+3v1Nl+mbgGAbxu8f8RTk+dq+F4wEID7HAHRDdNbpOEBC9EI5eCsGa
 65d8AU80=
X-Gm-Gg: ATEYQzykW9tZsp6aFKK5SNkJVxAqUmto6tRZ538B/FeyhKA2mNcq1dyOBDHTzPQRsg2
 AB1FiwkzXzkpzB2zz34pn5OmxOHjZnZo54YHOFqQgi6aFi4MJ80QaJtMxDCYjq51klIPgXvnDfZ
 Nlgmz3PNmozQn1moJYHWvTIWhLkXmitiyufb94Chy3Cm8P2/xYSiRBrb2aj/1aTtLVshZ9hmgCb
 1RYy1GNP2apYvnwl4egfjZ6LrGw5jh8Q/mdudxSz3wU9vKFIJV7IEQL98KEMrbcGDI53C+niZQW
 jaKBEtKNgie4hrh8l7/LmwX1yQa8e+X5Iubg2xWynJcWalqFE4QZd5JHK6A25lqbffMelvDIS6o
 0tA8isOKWFYKmrQml0fAmzLfA9W3lv6hpXKtdL83HPDG81vpTxJhGoj3FrvYaiBoksA+8Wfm9VQ
 0hIlrQJBIm5YF920F5ygp4DwCMDwqCuodqs0L2XdvA4s/Yy3Cd7y28c7artv8holnpxA==
X-Received: by 2002:a05:600c:2284:b0:485:3f58:d9f with SMTP id
 5b1f17b1804b1-4855670c0a0mr199811375e9.30.1773749043358; 
 Tue, 17 Mar 2026 05:04:03 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4857f49d327sm15762205e9.11.2026.03.17.05.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 05:04:02 -0700 (PDT)
Message-ID: <a851c223-7273-4627-947e-01846926730e@linaro.org>
Date: Tue, 17 Mar 2026 13:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/arm-cpu-features: Fix thinko in
 g_strdup_printf() call
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20260317111121.2062455-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260317111121.2062455-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 17/3/26 12:11, Peter Maydell wrote:
> In commit 62272f9f8891 we changed some uses of fixed char arrays
> to call g_strdup_printf() instead. In one place I made a silly
> error where in changing
>    sprintf(name, "fmt string", ...)
> to
>    name = g_strdup_printf("fmt string", ...)
> I forgot to delete "name" from the argument list.
> 
> Luckily Coverity spotted this (as CID 1645771) because at this
> point "name" is NULL and passing g_strdup_printf() a NULL first
> argument is not valid.
> 
> We didn't notice the mistake in testing or CI because this bit of
> code is only run if on an AArch64 host with KVM and SVE available.
> 
> Correct the error by removing the stray function argument.
> 
> Fixes: 62272f9f8891 ("tests/qtest/arm-cpu-features: Use g_strdup_printf() instead of char arrays")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

