Received: by 10.25.208.211 with SMTP id h202csp1460946lfg;
        Tue, 16 Feb 2016 10:39:14 -0800 (PST)
X-Received: by 10.31.173.8 with SMTP id w8mr19632241vke.42.1455647954489;
        Tue, 16 Feb 2016 10:39:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22e.google.com (mail-vk0-x22e.google.com. [2607:f8b0:400c:c05::22e])
        by mx.google.com with ESMTPS id d200si33909179vke.110.2016.02.16.10.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 10:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) client-ip=2607:f8b0:400c:c05::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22e.google.com with SMTP id e6so141323996vkh.2
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 10:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=kRaQLBBWNIKuPmVbPaF8A23YuuzjERXXAYsb+KC+4VU=;
        b=EqAQZV2lL2OtQYY4h0ThZ9koOjUYia9vKvTzW29/jjxn9m1PC1p5w+SauJ33ZQLwq+
         q74c8bXiqiyuWZC2eV0zj65uHo70oU2Lclb4pIg8+jTYsKhZ4HtHC/+L0y6HOb/kkqVZ
         gzi6RAH1A8xgD3ZptHBwDKapC+P9ur3yT3VQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=kRaQLBBWNIKuPmVbPaF8A23YuuzjERXXAYsb+KC+4VU=;
        b=arve0FR4DrJ1GrIB48X/VfIOjtG3GI8D55VxDZLEUzFXVPz3jrrBCcX4215ztT7807
         NN8EGfigUpmeCTNI44nVZaE4Yb/ql/HxIN1ZXYvoKrsuiFLWDq2+4Uk5PEGFaZQyIJPR
         8zA5NzHj1qqqKwQCvVa5KoIbOtk1mvt7g94PMGco3F7zN+bGMo0+kdeC0kM3J+e0YkEN
         G7W4XS8zhnq4s9b9u5LhhBk5NeNJGqqR9Zr13I+p4JY5ugl77AkMjJUG7qCFmqkKUkDW
         BOBuQDjM/6Gu/8D6+HPtk7k0awlJD2ub8UXwzSqKTl0zWsOATZD+s4/QBjTF1ZHLz72q
         YcGA==
X-Gm-Message-State: AG10YORDbXyTWK52qcC3rCe2qTihf4EFpwaRlsPHGORtdV6/rFHpZnPdDBsRw86DHuzNued1R4YOmURzCkhKMFADO/4=
X-Received: by 10.31.131.199 with SMTP id f190mr19519098vkd.90.1455647954191;
 Tue, 16 Feb 2016 10:39:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:38:54 -0800 (PST)
In-Reply-To: <1454334712-12360-4-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org> <1454334712-12360-4-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:38:54 +0000
Message-ID: <CAFEAcA8F7ZsWx=dQV8xEB0fOTgSWA5b6sN1vBBSOGQwnnSejKA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] device_tree: introduce qemu_fdt_node_path
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Christoffer Dall <christoffer.dall@linaro.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Baptiste Reynal <b.reynal@virtualopensystems.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: gDLmVZ/KyU7v

On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> This new helper routine returns a NULL terminated array of
> node paths matching a node name and a compat string.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
