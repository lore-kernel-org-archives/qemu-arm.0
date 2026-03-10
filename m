Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1F5EB1070
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 15:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzz30-0001Zb-9F; Tue, 10 Mar 2026 11:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzz2u-0001UD-2f
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:30:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzz2r-0005Am-Ao
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:30:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso12927695e9.2
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773156649; x=1773761449; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wOUbUvKw9rUBdkf5MYN70J4wl1FNzo77ifUxMf+0les=;
 b=hmULES99nt6/kmwh75Q4huxOk2bNQfsZ+VSFw3u5CToyYY1dWhukbeyg3NrfDWDSkC
 vDR7I35rb9RfffuZ+39e5ncaACGyvZyNBOu7icvVd1zi64QLz9Gd5UHa2lNJarZS2F//
 3ESHvZ+97rOblnrG/W0FQ7dn/nVvpob0XEBIeM1Hs0Ys9mAqdYBsDOBC1x0X021Sl8sE
 +8nHTg0AThJc1pM7GJMn/MFogyzrlM2dgbzhWXnzAyTwKaN5wDkJO++E9UQ6REBo7niM
 8uprlplM8SsFwErbZS09kwG4bVRI+3rFCAdeO/FrMMmMmabar5zl6pS5famRypUjgji0
 uSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773156649; x=1773761449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOUbUvKw9rUBdkf5MYN70J4wl1FNzo77ifUxMf+0les=;
 b=u94Ck2aKNqlg77EW2vTA0hg6FD3cXj35ytRFHHnXg/dze6WqCSHQnlmI6kMAFzHJl3
 b6U/Lg2iLanMifN5unELW7o18hVW4VxRRfWKg955Zltcoo48IBLe7TPwxWrLt1SF6qys
 sRukPLkEYLY3X0nelW23F15mYKtJ8qhApSa32U6/WKejVfxeJihfYYHroNLguIvGbrcZ
 0qOwV3ikt0T7es/FSJ/EekwC1aLNiCZcKVai7CBwDEZsDtZVVIt0azm0RE7Rq1YH2XBK
 AnoagOGRBtJ8V/6e83XUdq1CG5bojVplgZQtZYBbRAUiYzeoRl/XkFTxX/hk61Sbwmvc
 gnPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgSoZgCOJMzn3wzQT3aRglPyu7zZLQKdKieCNvtUyYG2tGvWSznFwicBcx8ruZxCycAMVTjmnvsw==@nongnu.org
X-Gm-Message-State: AOJu0Yzw9VZ7JjycEXKFc4uKJOOgKBxUiTedpYbL11oVFDBYsm40unWB
 6+w3YecwpreI1ng4+vzBIMfX+JbhlFHPaR5pOKZ9E5f6vLEnGzKckkMIbP/nNAyW6vs=
X-Gm-Gg: ATEYQzzV9U9M18vI4CHxRlsGPhCCyq8mLExyi3wpDBJrF+kLqA4K9UvlUDKup7Q6p+U
 5jyMOpRDAy7NMB91TNIZS9bhF0BCF3XNxynYrngOr+8Yygnn4coGLIOnpz9FC2N/PCdn3wdIJP3
 utRwLtyJAi69Rec2r4B+tvOZosSpEIEgpZ0+3l8N9fzKArsfFXw43LLWTG0KgaAS7WS6tFYlw1U
 F1+Cxng1JiiiiwobGFN4LKDpgiFmOLnmjY+nQtPXWUmFbJhqDAuet4myKJlVBYFsNaTCoEIzbPk
 Yz191fZLpFn3vHfLt1+2onjn3Ek44ouMm+++XvE3TN3vvz14tj1q+WX5O1yPlGXmSiCYoYMegSZ
 lodORG3OsvNb6y3gx6mpik9CtBBEOEygFnSLanAn09W7+p7t4xwBFljeuamqyqmZxITTIXToX8G
 Gdd9EgX0iF+pfOd211hUO48ZpckfjG7rmE+nmMdEPTFYZigvV96wOJ6GFhhE8H26lSIw==
X-Received: by 2002:a05:600c:a12:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-485269648fcmr238705985e9.23.1773156648803; 
 Tue, 10 Mar 2026 08:30:48 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm196592165e9.2.2026.03.10.08.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 08:30:48 -0700 (PDT)
Message-ID: <26eb1310-4a84-4987-8a0e-1d798827e512@linaro.org>
Date: Tue, 10 Mar 2026 16:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/qtest/arm-cpu-features: Use g_strdup_printf()
 instead of char arrays
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260310151507.2973843-1-peter.maydell@linaro.org>
 <20260310151507.2973843-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260310151507.2973843-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 10/3/26 16:15, Peter Maydell wrote:
> Older versions of gcc with -Wformat-overflow=2 don't like the usage of
> fixed size char arrays in this test; gcc 7.5.0 (SUSE Linux) says:
> 
> ../tests/qtest/arm-cpu-features.c: In function ‘test_query_cpu_model_expansion_kvm’:
> ../tests/qtest/arm-cpu-features.c:578:35: error: ‘%u’ directive writing
> between 1 and 10 bytes into a region of size 5
> [-Werror=format-overflow=]
> 
> These can't actually happen because of the limited size of the values
> being substituted in.  However rather than require readers to check
> whether the arrays really have been declared large enough, we prefer
> to use g_strdup_printf() for this kind of string work.
> 
> Reported-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

