Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF36E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:20:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt4su-0003VV-1b; Thu, 19 Feb 2026 09:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt4sq-0003TS-J9
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:20:00 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt4sj-0007NG-AJ
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:19:57 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64a28af2f4cso1357363d50.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:19:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771510791; cv=none;
 d=google.com; s=arc-20240605;
 b=XRwQfLCt/oJjlMnS0GoZWrdroCkl+8J7+agTGgG7q/+ObnrpMkqtVDP+gFmt9qfQet
 ORE2MPaTyFBK9v/dNaD7C9KmpV0Dk93qZbKRed8CzXcyETgpRTVnJ73KyuM9aWou0QNN
 ZPVbKfaN6QSwqrOE+grYyjRMp6iy5HqNdkRKL7yAMFNegqt4OpgohN0gTHrVjkZXSRGY
 C7ZkRXY2pN3vF1UUJb/1Ukm1PJu21LjnY8dR3v/lcXYDoyUZ+nXHz96AHmHqL+ALlMX5
 O48ofwxcSy1VvVNckojiWsgh9UgHNjfQHgm/j2SXuDJptW4tza2B8AJDssmRzUq7481l
 ntUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rgl3ezu6BsmX42S797EKbk/ktlmpTUMITug5ibuCN8g=;
 fh=7dOHFGpdHFvomv8yu4TeH7sASH9USv6EI8x+QERx3zo=;
 b=N8QZITUI1pI4E8LXIaib26IRSuzeQWyaw4zVuIHmnunyr6lxMKQBvMZNOTAv6vj4DM
 3hWAtVFw+WTD5wMKWbFQCD41wOhH1vSTE7wCWH7G7AFoSRYJLBdlFOIYcZNNTGM9nq9X
 6I2UtrEGo6nxXDWO8+QWxfo9msk7gTSahOdd2BNBbF99ZgBbfVVloO/uCFbV43WqTXQf
 kw4ZdwhsGE29luBOsKdy5D6jZst9oM0qhtirnIh0lUYQH/2zciBIGJ2yvPXOIzoWctgZ
 +It4N7QO3OSQyJDvspXTSINqsZ6TJE30VP/1rSBB6/GbjQ8kpaJuYGnRHpClAZi/YZu8
 Wk3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771510791; x=1772115591; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rgl3ezu6BsmX42S797EKbk/ktlmpTUMITug5ibuCN8g=;
 b=R7pjheGBeNGbGZUJksIxnI+cTgo7Dh8b9FvMYe2Kd857Mnus7Y8JklGoi6EFn9TSI5
 nM/Lljxexs/Dag+FiBtmFJzyYOYY/uzbAlbLLhKx82Yl818j8GYTYQ3XSMiAU7kMZGmH
 UbYZlwKc8Bb5qfHlRGBYPBks1Uvco3PWYzrqMOoVODFswDOTYJ58sNYVihecOsyS/LRA
 XIfATuoP6LTTRXDHJBAToIs2+AY0Xe6PhTj8RwcbG32gN5/NGW4oS9gd4X6lUErKravw
 tg4hx6fe0CT0OeM78s2r7ujP+XZBs0+JuFFCLtuzMFHl9C73cYp3ps3SeFYXHk+lDeoK
 QXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771510791; x=1772115591;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgl3ezu6BsmX42S797EKbk/ktlmpTUMITug5ibuCN8g=;
 b=LKUSqkuUBz2GKteZmPbNChkSlMsiYheTk7NrVxya77OVJJvSPAabjmYUyZGWCCN3Bb
 ji9Vo8vHCKtbUBleXsQUBW7O+nbqYqdVIVyD9hneO+DER03H9Y5SlqFr1UqaHrObqM9E
 PWvoMyO6yhitJq3sFnBObmyyICNhHhYPumcehcEIe/u53U0U/ZXVO64SanXyR1wnS9dj
 A3ozdwVb+he13+NFmUcu2v/iWEXVLy9mtqzED5kfoUyiK51NwZ06lpujtWNEzGCUBCrr
 b8kHS4hN5+oJuH66+w89xnfXKfQ8C9G8qkJ3q+N2lnHLMbPyQ5LDnI7NszaLQk+ppM+y
 Swjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+QPIrFQfU7ls6B1mjAsFmalV61zeYvoW+3kfDI8E4AEW36830sEjWBBh9oMGEC0/ncV22xAZXNg==@nongnu.org
X-Gm-Message-State: AOJu0YwH+yONYktwUcRHJiAe7PlQrQBVJjpoB9IPK6bP35jFt8f3JDwJ
 sDeXzpOlibTzAGVV9sV3noL9R+pgBXkcaMPOfcCLXjNPdkrtooHAaM6+oQ7FIudlcVmkMiAz4hn
 DF2kpAVocmFr7SKrYpKa560JBvdefCxCU4r0yYJxnQA==
X-Gm-Gg: AZuq6aKLJg1GFTDxn4I1gzUjj3BHleHPmiGr1Lq0LemA2WXqRdk5Zn6G8iSaTwhF3rG
 iFeQcWXUYGDxMxui73JKiwybmr4WKwVq/FsVn+kbyRDvPStqDeECEO7I4hAn1fPKGtnBOKS9Mxj
 OME+vY/dUgKYt0jdka9uTeuOh51kqNB/rZ1jR2KiSihoPRuhdG2s86EgKloD8IrLCHruQDXhy4D
 n5Gh3lGjaf7UiqUh09WqKhkjfWW6FA2vRpst9i1UO1/55sDPs2cNJ1id+4tsZEZVK6hYVoSuPkR
 hD62bW+wPW9qT+W6uCtvuf+0Wt+lOWcP1ctqhSCxKLInb7wjR6Zq7aCtvot0KEGWOfs=
X-Received: by 2002:a05:690e:d0c:b0:64a:bde9:3423 with SMTP id
 956f58d0204a3-64c64067792mr1251518d50.9.1771510790968; Thu, 19 Feb 2026
 06:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
In-Reply-To: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 14:19:39 +0000
X-Gm-Features: AZwV_QgTQSl-QBuOk4ymXW-n47fmtd4uKOfrRb1raTkjmhEH-iEpjXLQE6d8gdY
Message-ID: <CAFEAcA_Swd-oFXB6K1aDRaZm2XoKf0kXvK3teTyjjp5+fMryfQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm/hvf: Add SME2 support
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 15 Jan 2026 at 11:20, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> M4/M5 Macs support SME2, and HVF exposes this functionality in its
> public API.
>
> Add support for it in QEMU.
>
> This was tested by running an SME2 benchmark from Arm [0]. savevm and
> loadvm during the benchmark's run were used to verify migration works.

Hi -- I've just merged the "avoid gdb falling over on an SME-only CPU"
fixes to head-of-git, so if you could rebase this on current git I
think we should be able to land the next rev of this patchset.

thanks
-- PMM

