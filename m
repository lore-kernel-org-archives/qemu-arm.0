Received: by 10.25.208.211 with SMTP id h202csp1475284lfg;
        Tue, 16 Feb 2016 11:11:49 -0800 (PST)
X-Received: by 10.31.50.202 with SMTP id y193mr18746129vky.48.1455649909627;
        Tue, 16 Feb 2016 11:11:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id v72si33942663vke.62.2016.02.16.11.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 11:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x232.google.com with SMTP id c3so142259875vkb.3
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=qyV457oeVaesgIWr4B6JFwGnLIWRkm8CZCY5KAje8Hc=;
        b=kMIu7kfauT2PtsyQxTrO/dqHRLLhnkDv5ap+9+XCN1OWrneGHVyjZCp+iGUELOKUey
         ZoRbV6YJuutDThkQnAg6/PN7z4+2MNZ7CrB62qRSkzr+bG/n2R9hqHM/BXDXgqTcVZ8/
         cvTVmFDVgO81LoAsbAoXHQFxTdi2+HTVprffM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=qyV457oeVaesgIWr4B6JFwGnLIWRkm8CZCY5KAje8Hc=;
        b=NYmRyBmi9UMpF+r/9XIsIhpegbFEasQ2eANqRpTBoN8SxeAOXMNm37gV0JsNjokzQm
         UfGNWFjFboxjxAYPn5UQbtmEJyQxV8q/ECF3IU/trtO9RjdYllI21VM9Ea2UydMNjLTv
         e3ksbnBs0uHMQv8Kuzz6oFjVwJxnj6l5zXay+KVHPzJr/ZuitgRXNHW38cn0jkz2KYVd
         m/AE12DirYk7EJ9bRTzkcwFAgK/5a78g8Hc8KRvMaZXTR01ZtPZX8XvRwQFvfxfOGKJE
         KTr8Y6aeoRFVH6x39EcJ0XfPqr1Zlyq2nmJG8B6emc4NqsLP64Bwf4MI/FhNeYJ90zpY
         YPMw==
X-Gm-Message-State: AG10YOSj/ZYtTLhypMeNQANc1/TdWthvdd2Q6lYp49hGcDXKaLMJOk3N3yOS8Crai/LLqRApUohMQfn/x0PRLUiS2G4=
X-Received: by 10.31.47.207 with SMTP id v198mr19036982vkv.6.1455649909132;
 Tue, 16 Feb 2016 11:11:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 11:11:29 -0800 (PST)
In-Reply-To: <1455287642-28166-8-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com> <1455287642-28166-8-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 19:11:29 +0000
Message-ID: <CAFEAcA-NtkXTrvXS6ZYs3MSajzBHocifxWdoHYi_g5bFHcU=SA@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] target-arm: Add the ARMInsnSyndrome type
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: ub2hdcn8hD4F

On 12 February 2016 at 14:34, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the ARMInsnSyndrome type including helper functions to
> encode and decode it into an u32. This is in preparation for
> Instruction Syndrome generation for Data Aborts.
>
> No functional change.

I find this patch confusing -- syndromes are already 32 bits,
so why is the encoding of the syndrome information into 32 bits
not just the syndrome register format ?

thanks
-- PMM
