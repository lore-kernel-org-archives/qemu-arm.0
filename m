Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD74E9A047
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Feb 2026 18:44:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsmWg-0006rX-71; Wed, 18 Feb 2026 13:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmWS-0006nf-6G
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 13:43:41 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmWP-0004yp-EO
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 13:43:39 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-649d4c77a32so56336d50.2
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 10:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771440212; cv=none;
 d=google.com; s=arc-20240605;
 b=jp4PxVmmfcRcTvEUc2Acy1VJCosnibr2TBp5bYfpsoRqoOIoVSH/oDR4YnCrcvSgf1
 tyCF9vbJ9U4+ZcLfXb5PSRmOprBDuymm6vo3DIBTJ16wb+ncU24n2NpxChVCNhONcUxS
 yXJOsELqkmpVNVcYr0ivFaK9fzO5s6G3X1e6ZNA8vPDSaGk3BSh8KO7UlACQxMI9gawy
 zXMDhs+cBOGIBNKMEU0Ql6wc1WgmyaoFms/co+qN1Fa91NKHvnNdz1gF5Q2FoOeeL0za
 7aDRSdQE8FuIVTylued15V4Amk19bY53QUmzShptsqkH9wV8Q53GGTUPEoPcKFV+NnDM
 KLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=W3XpoEyIYAVmXg1g91m0FvVOGw+6HTiYEYjItlqrdn8=;
 fh=gztpTnqH14UHwOoB1ohVOiAsKGGeM7ED7Uo+MZoUA3E=;
 b=KOdHjjjmPtGwvWKLMFthQ8t8APym5e7X6bfcxTYYVNtOck6UmdygYvMYGADcOvAvhr
 gDRNcy4HzuiqgRObyHbN5CJRIMydQ8uFEdEzUcmaP2TE2swr5eFGYpm/a7xGyhfx1vJW
 QPTxc5CVzbmFHP50Zo0fqMCn6BmITqGSgfHj3gay62d6538+EBl280GnsCZRInXmUp7k
 EPkvs8Knshw+F4WmQjmQO+6vZIidYL1SB78W+eLK5oLFjJRpzmbvt6vKbeVV5t4TgrdR
 HHq59hHuV6hNqVv/DJFHW87s8K83fHgRiD8ZodxGcuwETGUucAAhG+r210Zd/OpY9jWy
 xqCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771440212; x=1772045012; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W3XpoEyIYAVmXg1g91m0FvVOGw+6HTiYEYjItlqrdn8=;
 b=d7lqfUtg/C2YfvLoTUV6xv0cAUkV3UXe1n0iKbmlgJYFOF1lgo4bU/1U5ax8nigElT
 LyHr/ZgTeaMnMIsjg4jjBoqYAtjnLVqgCJEy4sAPlR/0ALfURHxBqt9ugJ62fvcRdH7r
 uD6q474utrBRwi9/JNyAOYrDCOoGB4cJ8WTEhWNp2RXTj17ZVHNRA6zrnd79yaH9eFre
 XO7WyCQjNsWSjN4FLmkhNCI2NtRKPELebZc1DKHLae7+7fp4IHsfC759CGHglZvsbqGH
 ca5s2rEPkfgGkZKVwUMq00ZD1GK470wH/o/vI0TC3dZTgepDb4cGcanZZUa+9Qi9ZLCN
 NtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771440212; x=1772045012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3XpoEyIYAVmXg1g91m0FvVOGw+6HTiYEYjItlqrdn8=;
 b=U57gSzWeiB4AHvr10grpxFr2oDNuF9IR+sLEDQtR5Q3GCxTPeJv5BiVHdPXoB/PjiS
 FmkDAIgrPehLVeALF/kiTGjXryb8j5I/e5/0gGGksW8doTmayZyA6XN6Ci+HlM0rLvIp
 FcR1NNKBjVOkmzVk45effdQDDbCPjvW7fZXpR6jCIBvUIu7xF0cmfz7cpn8zilNNwTcA
 dlLQdxHCx5LSj9qrUBR8v42RwxURzI/wlqMbD1mcVeatT0f+ZxFPcesC5lWS86BxyMrn
 +VnNY7cOSN9uSv4H+yvlPp6RGoqTJt4LqY0iHgnWAhOsM/Cec8ebShLHisF/hNsbjNSS
 1c8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTjmrtBxEjwqhFf4TLYE5vE8hyn2AzuGixLdJGMbY2xf3aKAWkMokYc2r4/OyUpckHsSnYYvlksA==@nongnu.org
X-Gm-Message-State: AOJu0YzlxFQOiYKp2J8rOpFvwN1o37M87KuADYK5twjPONWYYuNVkfLc
 RlS8ZaVI5P/ag7NURAHK9NExGbiOLoBmDc5dw9wgYwMSza9afbg7o8xhrVrzPurt0wA8ILqyF1T
 v5qoSyeov0ngtW9CLRcAQng5nvhEeWU48kHPOARVs4g==
X-Gm-Gg: AZuq6aLMkkvr0SdQlbJS1u11GXohkaTZPkdIaT4p6sBYwa1illyVdH+B4niiAEk39sN
 /jpkb9f5/kJMrCIeZ7siTMBs9EjowQQxHzEwe6aVS7Qd2gwnmR0exHAAqzRkC/MViGgeqXzNhd+
 BuVseJQm0hiXDZQYjHtQEIeJCEWzxQlQwRhY2fLunNG9uFUeFkaCDWIFzu3wzTkt0hjY/QubYrg
 aPGCPyNF7qJ5ejJt71fdQKwjWHUtGn9wVR6lybC++BeGLayINL2saCd4jdFxsPyeQtvV7Ei2mrb
 2BTofe8BGoL0YX9QzNpjjwBzNnDe+h+ddq66cbS/7ZiE57qKkx0K4/2RZXRO47YJhkRWYiezvRf
 tKA==
X-Received: by 2002:a05:690e:134a:b0:649:b4cd:b539 with SMTP id
 956f58d0204a3-64c198c9bc3mr14259303d50.35.1771440212459; Wed, 18 Feb 2026
 10:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20260217210805.104427-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260217210805.104427-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Feb 2026 18:43:20 +0000
X-Gm-Features: AZwV_QgXbqPFPyLhl1MjtUq2jN1K5CsPg2lVxN37Y_TFQoI3NWi3vHVJYNekfw0
Message-ID: <CAFEAcA_YEPGSVAX71MinzZWHQnu-9_epg0AoRjaPfu-Uc83NqQ@mail.gmail.com>
Subject: Re: [PATCH] whpx: fix FP register loop
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Tue, 17 Feb 2026 at 21:08, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> In whpx_get_registers and whpx_set_registers the loops over FP registers
> were using whpx_reg_match[i].reg instead of whpx_fpreg_match[i].reg
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  target/arm/whpx/whpx-all.c | 4 ++--



Applied to target-arm.next, thanks.

-- PMM

