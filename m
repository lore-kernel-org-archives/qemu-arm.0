Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0D0E87823
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 12:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnG0T-0001Ym-Ae; Tue, 03 Feb 2026 07:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnG0R-0001U2-K8
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:59:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vnG0P-0004hw-LS
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:59:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so43087155e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770123584; x=1770728384; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0j8wt38Ng0mA0/ffT11m5Vo+vcWEAOmRl14Oskcq6Rs=;
 b=pT+n3Xdou7M8put2hIqrgcOC36zhSGp61A4spPexXdZbyAfLlPaYflwCa6Z6gInfIo
 +pcN7772L+4bGEfYGp4O3ycnzCXQFgOqulQslJvGLZmru6mhH+/+pE9Pyxx3A6NNq4Bn
 sYWxd6e7Mvs3hwhKXlfpvHjOpPvF34Raq6imOh4xeT7V+c1kmIRSjeQ7BGUaHLq2mwO3
 f8Lba34fbjxlfkHvnRSBm1s8qKZHWp+i0KzLF6obGZIFeIXNBB4iR+ocAc1tjaoU2Ef8
 sSCyzQ8tXahg2pOqNI/TJKXZVhfXZam5My8Vh827gEoK+6EJd2NeQwCRUWxFYz2ikHGN
 BqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770123584; x=1770728384;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0j8wt38Ng0mA0/ffT11m5Vo+vcWEAOmRl14Oskcq6Rs=;
 b=CvIW/jY9eUXpvJHeAa1AY5MVxQFsppaXl3dRPNb65tjcn98Ds6ppT7dJI8hpC3KrDj
 zadIBL80R/4iKkRQbmWpd4ibw2B99wyzdFjCjqRJxIZ8PxGB23WPomDXzFO6Cvi9kP0s
 BRs1vjj/inlpIDVYrzgkvz7P05Wh1YadQv5lqmZxpAQc0VqWoVoynHyy7mEEf9Po5Asj
 NSqpkAQzNWiRaxQl8nyH+jCcV41e6ROMG8uMCft6oCs/XMnvwmYoLxm6jJOcZ/ZQa3oV
 JYhGCfEG69iOsk2KLbSYzzTBT/66cBPrivDZNAf/z4A9EdR8LOuyg3pD+2k9cOq/x+vc
 gnVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+GzQ/7SpNm0ikAxntmdKzVcxduyjhwXo33IGWgZ45EguhPaS7raOf1lirtHqjkR1syhxN+KfBVQ==@nongnu.org
X-Gm-Message-State: AOJu0YwnFV1d9/JVoDeoNJ/iya/IobP6IVi1aa1Dr9g2qZ2zpIOSzVBE
 X3rebvvTJ3hrbaEpaJMryIPVhn6qftGy9pkyZo6OZuZfjX73TVx2hltjpxk+pI50mHA=
X-Gm-Gg: AZuq6aKJh+1XLz21bzCyDUb/Qg6xLPl+b1qMAjYS7qnCvCnhgWaE2CfRp0/tlKcAopL
 TRoelQuC3EsPf5VhP/ZsbsP7UUnE84cbWn6PAozeGBmHVHkqiHFPKLxe55wYCcmoDWmTNC3XMJQ
 0pC+nbNLXhsQTjz8NfBLGfrCFmmyXFu6zekqC33UTdKZPfWBoC712fMvtCLla0UoZUJ29Y0kuLk
 sqf+5K4SPOOgPexIifuOHMGh3TnFhDLukNrr+J3TKZoqRflcT0gOWW5o0skHNt+ywzxVJ0ABhw4
 YWJ3eOQT3F1ftp5GFSCdwJZZV6kAcgLDte/cltWOFTodvtwBmWyhr7wWjVqiHwD/FhJbM5ffGwn
 k/WfrXNxG9dfHs7rHU9dURgIDxIsKfEEGWsvBtVzAVUR5eCO4YTbodS+tFdGfEw+e16CC32cH0c
 MYUbecB4re0nzXnxS/ifeeBWx8fWjwIFb10oOJN4+BGRAX+hFaLluIKw==
X-Received: by 2002:a05:600c:628c:b0:47e:e8de:7420 with SMTP id
 5b1f17b1804b1-482db47ce23mr193941905e9.22.1770123583815; 
 Tue, 03 Feb 2026 04:59:43 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd4a5b8sm145006085e9.5.2026.02.03.04.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 04:59:43 -0800 (PST)
Message-ID: <736bd681-3080-4549-95c4-06853af17302@linaro.org>
Date: Tue, 3 Feb 2026 13:59:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] target/arm: Add aa64_sme_or_sve,
 aa64_sme_or_sve2 features
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260202133353.2231685-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 2/2/26 14:33, Peter Maydell wrote:
> With FEAT_SME, even a CPU which does not implement FEAT_SVE is
> allowed to execute the subset of SVE instructions which are permitted
> in streaming SVE mode.  We correctly handle this when the emulated
> CPU has both FEAT_SVE and FEAT_SME, because sve_access_check()
> includes the logic for this, matching the pseudocode
> CheckSVEEnabled().  However if the emulated CPU only implement
> FEAT_SME, it will fail the initial dc_isar_feature(aa64_sve, s)
> feature check, because this doesn't match the check in the
> per-instruction decode pseudocode, which is typically:
> 
>   !IsFeatureImplemented(FEAT_SVE) && !IsFeatureImplemented(FEAT_SME)
> 
> Add a new aa64_sme_or_sve feature function that we can use
> to update the relevant uses of aa64_sve, and similarly
> aa64_sme_or_sve2 for where we need to check FEAT_SVE2 || FEAT_SME.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

