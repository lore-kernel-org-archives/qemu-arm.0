Received: by 10.25.77.65 with SMTP id a62csp164263lfb;
        Fri, 17 Feb 2017 05:08:46 -0800 (PST)
X-Received: by 10.223.139.68 with SMTP id v4mr2547332wra.70.1487336926097;
        Fri, 17 Feb 2017 05:08:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id 74si1686638wme.29.2017.02.17.05.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 05:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id v77so9784797wmv.0
        for <alex.bennee@linaro.org>; Fri, 17 Feb 2017 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ne2f8QQs9oym5j17EaPDfhw1x32R7SLqaUlvMacg5zQ=;
        b=DjJcE7zjg1z1+2/7+e7JbZfrMyedla/No+FHz4ozqw8hQElymLOtpibHUpFmjnyh/z
         XxljVnXLYy/ueyGqwL+QKDrCNlEsyiPA47EHdSgx0Qb9LG3PX77KHupgZWQT3JH4ebV8
         mOE765l1YDDknacdYGvDGpvP6TM6WqvDD7XTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ne2f8QQs9oym5j17EaPDfhw1x32R7SLqaUlvMacg5zQ=;
        b=dJKVOP/Nm5wO6HL4fNIw52vB8De1Tg8/bIjZGUiG8kAZ0wJIuuT3pSHhojS+eYcKht
         DWdVHbbwPz/nInN2shnSi9zaomBpxneT+l10s4ZIXL+FMHN7E0Oyz8aLSYdqkTaZrYvf
         X0wNyeJBX7u8fVPQDa0z6YCFqCK7RiKtImBP1Q4O7fgRNVjJhb/vqtDOdVSRLzWFgUB7
         I0MHAMzHjVG7X9smDGIhlTWasZK0nGVczLUBGjcf0EPrZ5qRZarmHWisSy9nQ5w+44JQ
         2vvyAeAShubVnpyko2lzyHXGKinRKffe6hqfKre0wUDHRzLCIkw6TryTfkcyIb8BG00L
         EhdQ==
X-Gm-Message-State: AMke39mRqBv6dWnYQqeqF9Jf14ExMd5kTqJsQBaGXFvzje9JLx+sFm4UHpydVMioa7A1HQDDCFlcq4GS3L/Dw1U+WZE=
X-Received: by 10.28.55.199 with SMTP id e190mr3294333wma.92.1487336925802;
 Fri, 17 Feb 2017 05:08:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:08:25 -0800 (PST)
In-Reply-To: <20170213121017.12907-24-alex.bennee@linaro.org>
References: <20170213121017.12907-1-alex.bennee@linaro.org> <20170213121017.12907-24-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:08:25 +0000
Message-ID: <CAFEAcA_mGkf9Z=E-pYPKucgsZ7EA=MPkWG9Dt-Xs0rrqRNDp6w@mail.gmail.com>
Subject: Re: [PATCH v12 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR
 reset bits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
	"open list:i.MX31" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yubdeG0BbPyb

On 13 February 2017 at 12:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The arm_reset_cpu/set_cpu_on/set_cpu_off() functions do their work
> asynchronously in the target vCPUs context. As a result we need to
> ensure the SRC_SCR reset bits correctly report the reset status at the
> right time. To do this we defer the clearing of the bit with an async
> job which will run after the work queued by ARM powerctl functions.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
