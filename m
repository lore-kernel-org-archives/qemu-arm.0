Received: by 10.25.208.211 with SMTP id h202csp2958192lfg;
        Thu, 25 Feb 2016 10:29:14 -0800 (PST)
X-Received: by 10.31.194.10 with SMTP id s10mr38669066vkf.72.1456424954176;
        Thu, 25 Feb 2016 10:29:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com. [2607:f8b0:400c:c05::235])
        by mx.google.com with ESMTPS id f22si6117330vki.23.2016.02.25.10.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Feb 2016 10:29:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) client-ip=2607:f8b0:400c:c05::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x235.google.com with SMTP id c3so55722642vkb.3
        for <alex.bennee@linaro.org>; Thu, 25 Feb 2016 10:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=7VochCUmCw/W4lmhDTJEUXRYn5RolJudhANU4diCAYQ=;
        b=gkUaBy37NIx7/iFvB+RcwTxE0a6RiBQIag4FRHh2n98oJT2kiueekhK+ZLkGVgqN+t
         BVJe9oVvN/ir7k6+xX5JTcMhb/RJUmSND3DQQ+8a02VsyF+0XFxeVnJIia/e9WG/nsfZ
         NeuLejzzdoVz2FOhb/ocY2RRFJmDK9DmXG9zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=7VochCUmCw/W4lmhDTJEUXRYn5RolJudhANU4diCAYQ=;
        b=UmdbGmFf5R8jR+nJ6+vboecjuuczWcC/u5dVNnblhjGmYYZjnKEX8ipivEjHBWdpLr
         byvIBk84hvEteUqtLHPG71JUw6Ij0yZQwrs9Ntbj6fGH9IoW7NhejZJhSgQuXmuScbnf
         WYGinYyPkiIRNxGj/jcKtgIdn+2wN/U9ERtK+bn7W5IbXI0efFbwkn2dRuX6Hwz+kfnl
         9ONQZSSy2uvNNm/JOtOnEYrHx3b3mg21IcvOHem2FZAa1iSqyIObUMasolD30j03EhcG
         +EsDCfKxPXwojMAEKWS5QphVyV7j/OSIyqrtiIY2s/q7D5q1zx69Tu/N3cIm5xnNAh4e
         iMew==
X-Gm-Message-State: AG10YOQP0D6bAf6xOUIsoJpzn2QYOSaV5sRQv/+3a9SAZYB5XefqVfQw/4Dh111tpM0LCyx+ObX9Pgn9D9SXTxA+xOs=
X-Received: by 10.31.1.6 with SMTP id 6mr33338514vkb.139.1456424953862; Thu,
 25 Feb 2016 10:29:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 10:28:54 -0800 (PST)
In-Reply-To: <1455912292-23807-9-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com> <1455912292-23807-9-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 18:28:54 +0000
Message-ID: <CAFEAcA94S0eWzdUHBQ69PbRXgEJcvkSczU6qBE5FMboSfmxWZg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] target-arm: Use isyn.swstep.ex to hold the is_ldex state
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: 9wqX1jhpIwDn

On 19 February 2016 at 20:04, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Switch to using isyn.swstep.ex to hold the is_ldex state for
> SWStep syndrome generation.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

What's the rationale for renaming the field? If this is groundwork
for something else it might make more sense in a patchset with
whatever is going to use this. Or is it just trying to make the
swstep handling parallel the dabt syndrome info approach a bit more?

thanks
-- PMM
