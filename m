Received: by 10.25.159.19 with SMTP id i19csp1228830lfe;
        Mon, 25 Jan 2016 04:56:17 -0800 (PST)
X-Received: by 10.31.148.144 with SMTP id w138mr9450194vkd.44.1453726577431;
        Mon, 25 Jan 2016 04:56:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com. [2607:f8b0:400c:c05::230])
        by mx.google.com with ESMTPS id g207si18000899vkg.12.2016.01.25.04.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 04:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) client-ip=2607:f8b0:400c:c05::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x230.google.com with SMTP id n1so72965670vkb.3
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=YTSB7ltOUDrHobxVr5kdW3rnsNPKkFzEhZE7ffN44ro=;
        b=LoUXi+74VRUrXYuHKWKLyG3L18EGOHs1WJd7m8CRPxEQtBIJBjwtPOn1jEUlnHFFjv
         hfuhR1++B0jGIrPdzPUyVOeuhr6WKyckAV2MuOf3BcouijHVLPdjdKKBx8aRJuWzZ8yf
         ITObIB1WY9en86AF/B3ZPfsx/TnRBEO8mzFts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=YTSB7ltOUDrHobxVr5kdW3rnsNPKkFzEhZE7ffN44ro=;
        b=W712gtEQEfnxE/Fyw7MxRn+WuybOj/1s3HeBvlHCLUjCY9s1X0w837LSr5oUAbeS9v
         AFrOLuiF5iEVKQYQrwF/Cskuq4eJT/T7iUITvFtvmA/H8eEsluZXhsIJn6cTZLHV3dfV
         A/dgNHMtXJHY/CqoO6hF11hLLbIlMHVpooMwmzxmZQm0RdSYAEkFquVp3Na/ARzWshSX
         gKtKGTiytd75ISaTD2NmrCd2HIte7Qu1Si8WA4T29Zm60pK14IDlGLl+DFk1WHT60cnW
         KFDYxA0fcRxGQBLYnRz5S5j8g/AgEijOom3xndDEeoVobosFhsfRW462IyZPhLJm7gdq
         h4jg==
X-Gm-Message-State: AG10YOTuIjrKS78cYlVN84xy2rfR5KNrK4y18+YPv4j6lStwjVr15cngecrlO9niWeuYT/qmcfXH7E6eCxQvAHEs01I=
X-Received: by 10.31.52.147 with SMTP id b141mr10517116vka.82.1453726577099;
 Mon, 25 Jan 2016 04:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 04:55:57 -0800 (PST)
In-Reply-To: <1453456243-19879-2-git-send-email-edgar.iglesias@gmail.com>
References: <1453456243-19879-1-git-send-email-edgar.iglesias@gmail.com> <1453456243-19879-2-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 12:55:57 +0000
Message-ID: <CAFEAcA9xnmt9O3iZrEjOtmta608JMcC0Tz6vq=NJx5qXRe-RYA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] target-arm: Apply S2 MMU startlevel table size
 check to AArch64
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t7R2aSXkl+Qi

On 22 January 2016 at 09:50, Edgar E. Iglesias <edgar.iglesias@gmail.com> w=
rote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The S2 starting level table size check applies to both AArch32
> and AArch64. Move it to common code.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
