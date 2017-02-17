Received: by 10.25.77.65 with SMTP id a62csp163686lfb;
        Fri, 17 Feb 2017 05:07:39 -0800 (PST)
X-Received: by 10.28.23.70 with SMTP id 67mr3317225wmx.23.1487336859920;
        Fri, 17 Feb 2017 05:07:39 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id i21si1670304wmc.94.2017.02.17.05.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 05:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x236.google.com with SMTP id r141so9766470wmg.1
        for <alex.bennee@linaro.org>; Fri, 17 Feb 2017 05:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kP4ijPcEAbRjSuYmd3m+scVosTZqJg8ziVpkZqNBnLo=;
        b=AX8OzNjvNR6RobSMaMldrlXoaU0GsBA8ImEyeZdzD6vWqjCxV+JvzcwUiV4+cP/8Lh
         JzW+0nJsQISpkp5osA/deuRKyORD14ipxbfZmFHW+VAuvvIyjyCTOEE2OHW1v2YniTDl
         AvwDZZWvgqkYzvlIG0AOgN7KkkPQlLjWIOgio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kP4ijPcEAbRjSuYmd3m+scVosTZqJg8ziVpkZqNBnLo=;
        b=F3P879/ijLwaOB0vbwAZMGiW+G7u7Q29QCNdmUacZOvnPvccHJJYePJ5RH3zWi1+WQ
         pNsNqPRyQa69aJfguYoyi3CcpS9NvTkeiAZHDtoF7T2Scr/qPnDvlhymoxkRtvnML64x
         RfG4kkofCVau16E+Q5eik/Bs7nPA0NS5AYU45yRzabwXgj6hVTxrTTw2PQgaqyVqmB+o
         k4ysg9Zgly48QTWZnjEvV5QgrzBjYZptnwbf4nxsZVLcNTEKpFPs62qbMzJaIAG2+kHz
         sNc6HsFmmN8b6+ZHdVoh6iAcBSuIilrYQmC9IOOhmjNKn/XMnH4Uu9uD2L940sHscXEU
         efmQ==
X-Gm-Message-State: AMke39nYh05EaaiDdFc1Gxs7DNZM/KEtOTiEi2huycMxD6NGItqswM+l1uRosTgVe4bd2ZR0J1lX5tIFpEcbsD+s4Go=
X-Received: by 10.28.157.70 with SMTP id g67mr3368668wme.111.1487336859575;
 Fri, 17 Feb 2017 05:07:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 05:07:18 -0800 (PST)
In-Reply-To: <20170213121017.12907-21-alex.bennee@linaro.org>
References: <20170213121017.12907-1-alex.bennee@linaro.org> <20170213121017.12907-21-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 13:07:18 +0000
Message-ID: <CAFEAcA835LOh9fFLGJGHNYJJBhbc9r=8ogFQvqzWuUwF7DfgmA@mail.gmail.com>
Subject: Re: [PATCH v12 20/24] target-arm/powerctl: defer cpu reset work to
 CPU context
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: X0QKMKx7s9r0

On 13 February 2017 at 12:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> When switching a new vCPU on we want to complete a bunch of the setup
> work before we start scheduling the vCPU thread. To do this cleanly we
> defer vCPU setup to async work which will run the vCPUs execution
> context as the thread is woken up. The scheduling of the work will kick
> the vCPU awake.
>
> This avoids potential races in MTTCG system emulation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
