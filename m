Received: by 10.25.77.65 with SMTP id a62csp1772545lfb;
        Mon, 6 Feb 2017 08:44:07 -0800 (PST)
X-Received: by 10.223.135.80 with SMTP id 16mr9611925wrz.182.1486399447035;
        Mon, 06 Feb 2017 08:44:07 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id 30si1554581wrm.255.2017.02.06.08.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Feb 2017 08:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id t18so35669535wmt.0
        for <alex.bennee@linaro.org>; Mon, 06 Feb 2017 08:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VVJQFDH2WjL9indhj/AwCWLezZnPsaU4havwzRF+cJQ=;
        b=T/NxdZLsLdme7eEY04fndGhYrNBlwzQ8NGvFbNgjaMSv0tsZ4lXKIV2YxZPCJfZ91m
         HVOG3T/Iq0LRZGkTAkth2akEplFqWqtRRMf3jLmeE5NLDe2RaOGv5vk2dFCtKZoYpzIH
         AjrvSQu3lUt3MbHiMuh4yKMCz8rKUDn6VuSJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VVJQFDH2WjL9indhj/AwCWLezZnPsaU4havwzRF+cJQ=;
        b=DtSTj14gOBvtzuY2XMniWVMdzzHhKEU3Coh7+QRSCrv6y/gQD0Z5SOHnNH4IOZGrsd
         FmOnRfYhtBcn6gEqF6ltZiHJasFD+JJx5Nlz+cltsPvy1pUuMyHxnFnVOKRfmZBsYjk+
         3/aZXVF+CEbnnTJQ/H6XwqbcThpUUDnRxmxHiwOHyChL+4SooQEzsAXS3mKxdU+3MQZI
         IR9H5lzusoZenCENvfO4C0w9hEeKw3SSBAZxA7l4C4jyWiNfwYRTqrEbd1Yhb9VYOKqz
         9U2fb4+60OpsKtm4tQEEqlzqo2pGfMa6JpkEoYntEGS+FBJnZ3g4n9wAEkF1WV5+5WuA
         uQDg==
X-Gm-Message-State: AMke39mUevP4GWmlH4DR2s3Q+cuLGz38M9qmq+8h+9dJHN6ZICFOFsNRrt+WHh4Fd6dkQM0nXbgD66WLGiUrQq83UT8=
X-Received: by 10.28.4.10 with SMTP id 10mr10338909wme.142.1486399446582; Mon,
 06 Feb 2017 08:44:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 6 Feb 2017 08:43:46 -0800 (PST)
In-Reply-To: <20170206153113.27729-23-alex.bennee@linaro.org>
References: <20170206153113.27729-1-alex.bennee@linaro.org> <20170206153113.27729-23-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2017 16:43:46 +0000
Message-ID: <CAFEAcA87KWmWZa6PHis8MzBWobdGdUiChiNH9856ogHkinN6Zg@mail.gmail.com>
Subject: Re: [PATCH v10 22/23] target-arm: ensure all cross vCPUs TLB flushes complete
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
X-TUID: 3O6iMxtvbpDj

On 6 February 2017 at 15:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Previously flushes on other vCPUs would only get serviced when they
> exited their TranslationBlocks. While this isn't overly problematic it
> violates the semantics of TLB flush from the point of view of source
> vCPU.
>
> To solve this we call the cputlb *_all_cpus_synced() functions to do
> the flushes which ensures all flushes are completed by the time the
> vCPU next schedules its own work. As the TLB instructions are modelled
> as CP writes the TB ends at this point meaning cpu->exit_request will
> be checked before the next instruction is executed.
>
> Deferring the work until the architectural sync point is a possible
> future optimisation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
