Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp109884njk;
        Tue, 16 Jul 2024 04:36:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlotyDIZ/pIlvhLALt3eCh8ewV8iHFGpVk06LwcT2zEENJ1yz5NZGQ1F30oHV3COs3qQZnyfSc4hc2/ITZ40ZwgMLhEnkm
X-Google-Smtp-Source: AGHT+IH4LOo9wGFKG73LCFM3qTo/SHr0G6jC9P3Um+XP2oG+gGxuSkVbU0wHp3YdWggS5JXEPm5R
X-Received: by 2002:a05:620a:2588:b0:79f:e22:9bfb with SMTP id af79cd13be357-7a17b637d29mr271766085a.9.1721129786630;
        Tue, 16 Jul 2024 04:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721129786; cv=none;
        d=google.com; s=arc-20160816;
        b=erGwGud0t9TnJGVuoqarhwg98PsIBDSVMEa0/c7JpGvg6z4A5gDT0QCGz1xP/XR5c0
         CQi8IzOoGXEhGeW6YI8QmjtH5ZMx7QF6yI20RHsaBNO+vk4VUnE+c9rwFoNt8F4JWOwe
         4xjm/vNGOxi0Jk+3pyTlXMSyQxt/MHBtf85efS6oDRZwbROWUKiVAoI1uevZZfcDTcHT
         Yj/xYeh5kOfndDugw44qM2bbhHAIHWPAYou8Z8BCQ6wz55OysIX7qoKTSlZ1Oe7uXB6r
         Yx+gGHcGiVTlVmqQEFop3zmxkpwhXWgl8651+B4DHfh3naYYuaX+gwAYkpRAWX9qR9vv
         RPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b8mtSeHdgs7/KzJ6E6HcTqjOuu9I5+g5tFY5GMOz27Q=;
        fh=2iVrj1rWHYzSz+1qBHp+aXV2aCxwwIGYF0lr8xEv9/c=;
        b=X+p884fzah5Kdygwk9vQh6JPiOlrxoK0vxejoRhOjNnjt1OVQ9mSsIzJpZAK7mHB44
         TCF9eydUF0BsNSuJ/06arogJJJED1SaQ9qmMXZjrIO0IIibK13z5nO4eYT87ES4us/1S
         UrNrsZZ1FR+dXxoz4uAiyuUPuUbCpX0WhaiuvLUfluflnJFyckf/WgMsfOMxwUdh0ANK
         J1Ch1MNjmDKG1PkmA2h3NRSsUd3Y/1OVigz7NfC3vIzyWqNCg+sSzBg2dyP6Q8Aj7uqS
         58lAd4LT0ksyUAJkRtCr68CUB7np4iiOxceLHqkljtiNArsvACv9gPLfu8pm/WWZ5rN4
         khxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2I6Xeja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160bac072si745567485a.222.2024.07.16.04.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 04:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2I6Xeja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTgTI-0003hz-FS; Tue, 16 Jul 2024 07:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTgTH-0003bl-0W
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 07:35:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTgTF-0005M5-Eg
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 07:35:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-595712c49ebso6502143a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721129748; x=1721734548; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b8mtSeHdgs7/KzJ6E6HcTqjOuu9I5+g5tFY5GMOz27Q=;
 b=x2I6XejazEM25OBayzfCZMoiBSGEqVRrt1LNpHuCr/p0dlXBQYp7UeC/tqAmn1Kued
 2lHet/mdQgb48P32G5A961P757lhd8jm7anrq5QMClm8oE0CpppPoaGsknenxkezhTyg
 CGLLHUHCs7kmL9iMSRSKhxOx1PCtHAY7jnmYhpqlZdR6OtejsDkSpELy5RNrwEyVdl/O
 tvkVChOmKqdnFCM+fGYajOmZGdgY1XiyFWnREYMX5Pjdi/64+4yefxWGD6WxzaUej2U9
 wxe6rtpoyO8OL0/YTOzrqYmxaM+bOmz965sypizPitinGL4Vo66G2sxdFBKY9fui42HQ
 awGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721129748; x=1721734548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b8mtSeHdgs7/KzJ6E6HcTqjOuu9I5+g5tFY5GMOz27Q=;
 b=iziUVHoquQnGZa+nQfLj3ArZUTVNrdp3xqpdyUmwsq+8GgmWAqt5j8u9C/qtQjSF4K
 a+wBQ7k3bOMOtn/Z4NqfP8tvxbdwe6Ic6CoLDSiN1E9ntsde4z9uGoX+d7jMuLOx5ktN
 PN8DbYEt0WxH6Ajy6M+MNK1B96+qz8QbcN4lNjS5t8MfxcTvqFO8YzSYpMm2B9q7r3HR
 cDMCM2v1eXo0M5e1OjYq7ScBBD4GvvVahIwvCSZzfNvwzLiLKEgX0SsLH/3r2yhmhCgh
 DcqKQZVEcwEr+qbVBSWU+5L5ddP091f6fmiydPMOY91QTSNqUdCYC7X169jsG899xzfV
 80Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoB6LpPKmeig6Ung4u/aM5BGHdRx0D8Rr42oc5O9huvQ+clKyhYisBAJIQJntwgvYYFvb7k5r/DKqqTjYDJO+zhX5g
X-Gm-Message-State: AOJu0YzlhNiIr5T9wvNkPjzfmhSwQRQ9c19tuRcd3p9wY1IQxee+G8CS
 UVRGpsjWtzR+PeWE/k+hmmfIe/EaGJ61D6QFJi+JbkwipvXXg8eaPdcRt3X2cT5GBDCEH1qVQFF
 WtJwEIMSEm/VXrvx6T0p+aEYO/AT6X+z5eozesg==
X-Received: by 2002:a50:99dd:0:b0:57c:947c:52f6 with SMTP id
 4fb4d7f45d1cf-59ef00b5524mr1215922a12.26.1721129747896; Tue, 16 Jul 2024
 04:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240715055820.319035-1-richard.henderson@linaro.org>
 <20240715055820.319035-4-richard.henderson@linaro.org>
In-Reply-To: <20240715055820.319035-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 12:35:37 +0100
Message-ID: <CAFEAcA9FnBV+9MtvHf1YkaNxjKJjaX8iYV6gAnH+pUYYaGfunA@mail.gmail.com>
Subject: Re: [PATCH 3/3] tests/tcg/aarch64: Add test cases for SME FMOPA
 (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, danikhan632@git.sr.ht, qemu-arm@nongnu.org, 
 Daniyal Khan <danikhan632@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Msl95VOQkv3K

On Mon, 15 Jul 2024 at 06:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Daniyal Khan <danikhan632@gmail.com>
>
> Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
> Message-Id: 172090222034.13953.16888708708822922098-1@git.sr.ht
> [rth: Split test cases to separate patch, tidy assembly.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- /dev/null
> +++ b/tests/tcg/aarch64/sme-fmopa-2.c
> @@ -0,0 +1,51 @@
> +#include <stdint.h>
> +#include <stdio.h>

Can we have copyright-and-license header comments on all
new files, please?

thanks
-- PMM
