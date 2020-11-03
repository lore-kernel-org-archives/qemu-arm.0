Received: by 2002:a0c:eda5:0:0:0:0:0 with SMTP id h5csp5090102qvr;
        Tue, 3 Nov 2020 04:00:22 -0800 (PST)
X-Received: by 2002:a17:906:5bda:: with SMTP id w26mr13292956ejs.233.1604404822016;
        Tue, 03 Nov 2020 04:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604404822; cv=none;
        d=google.com; s=arc-20160816;
        b=NAxozc9dghVD6/yrd8jCBbAiTMdynjD+kgOc67tkLipINDndGFolFEvqWH7/LBSqLL
         G9L6lZOwT3xLPpKZB1HP9uc4eN9df99XSQihbKEr22GN167jRxUkCDFJoXyTaOrhfy8W
         I9ZXdXGW9kWi7LKY0SZGsBEvC63eECzMsd+41HtsEC32O8XZ3l0O9fHr+AUpTEbkKntb
         CYWZnmyY9XSboYO+iDnD6PlpBderwQX0w4DuNqV/aYpa/RaL5GvLjSxP5kjcmjM0GXAq
         X3ybPCHcMSldM+oNk8G6YySo19q3X2MwSGNFrVW3jgRBvVqmIKxowySvGyZjtVGsm+hI
         q/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wc/j5SHyW9NWmwkprdgV8UdSO/qQi/VqUxuMbcZe3Q4=;
        b=O/L8DVJEuUJhuV1OvRWageLXbYxVuQBOWMpH3PHEw8u64DpptedqoTexyLbmkCvH3p
         1waplB2QdTO1Gb68P4DFTfHrwzRomZE6qQ1RAeg1sWH3M7lhM+6zyob1kALT5mj3yaTb
         BYu7K/PQCzwbcqZG8qSudw0B1Irtq3I7BCZgxzx/Am6eVsyl09v/2MkNL8eje09fMb7k
         sCBzR0lRKuxr5IkTqPuV8vGRmIf85et5M9IVHKbn9MYAAXYLc50mRTCvZj+WCl4V9wcS
         sbTTkJL793Q8oqJ092aY9GDxis59D2wlAX9U+Uz8YIz6uexwuMVqW07T8y0R7rHMSyyT
         60VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HW2ew+XF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x27sor2634349eje.16.2020.11.03.04.00.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Nov 2020 04:00:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HW2ew+XF;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wc/j5SHyW9NWmwkprdgV8UdSO/qQi/VqUxuMbcZe3Q4=;
        b=HW2ew+XFFITRvKhmPqVCvJnFlmcnIpNKLI5ug//Ud4wcX8gxfKp7AwoQ3QEKk+rSu/
         ItWU5bX9soq5gU/4KDncFFCCw9W1UVMjNe6mC39Me4BrZeuwQb+Znpi3wkmbQ8m8gafQ
         lP7ytP3n6ZdgLvQDkhu7jgDrtRq3l/XhTMGDEnnvfJTvB+lZyh9g3eBkrJ6GjGxbSI3I
         s5SFktQ6P71dRkHBX06oxmt0zes1p8L/QR0O2L1NSA33UWeBRnG/PVcrPHUQbs0eYLJT
         Dg02GtGUWZT76TubNMHzJSNNOYLcMlwEEiOLm7QNPlCOBRrqIExkJpPf7iLNgRf8zSnI
         JTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wc/j5SHyW9NWmwkprdgV8UdSO/qQi/VqUxuMbcZe3Q4=;
        b=IIuR0t7wtJEAddnGSbVtQMtY1Ft5KKEWDa10WAT45RpM6h/W7YkpM+1hG1hQPZSKpE
         QSJzlDaEKGW7SxWvIrdYYJxi38jpFzRBG+7f+HoFoLKvQV5ON++powJp3reH9WLJjVbm
         vHaQSPFynWB7eimzDBIFe8Hq4l63xbH1srx4JtAW45M/2OppOtxcmYHAcOZ1JUYRyXXE
         UxaIrLcnpfRJgAqCc9GwVPYj1YLEjWYksE1MhbQOgPqWlDRfBcBzVr+u5bCucQrkxz8t
         Pz/o1wGgfhFKF+dpo19N1pJ4+/jHpjyeSaIJbAxSNI38D+BVMjtWFYad1B2az7PEm/q1
         HkFg==
X-Gm-Message-State: AOAM532b/cUsRjvMt+dRfedH/4HQhMIyvUSZETS0p0E99oYqxHUzcIcw
	04IWePGP0eME2EEwkpiwVHBxVykB8jOVAaHcYEeZbB0vuYClKCyP
X-Google-Smtp-Source: ABdhPJwVYyh5Y18A/EGT68etj1ZlSCzYvaIQfjbVhlK9d4+EikTazDvlqnaTcoKDr6whdCDrVx+xnzbQ7X3ZYPuHrNk=
X-Received: by 2002:a17:906:1f42:: with SMTP id d2mr19335227ejk.407.1604404821025;
 Tue, 03 Nov 2020 04:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20201103104710.27150-1-alex.bennee@linaro.org>
In-Reply-To: <20201103104710.27150-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 12:00:09 +0000
Message-ID: <CAFEAcA9+wCmp5Kek4UCZnqTnnA3xN6LiV_F4P5G8Z1-xQm=i2g@mail.gmail.com>
Subject: Re: [RFC PATCH] docs: add some notes on the sbsa-ref machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Graeme Gregory <graeme@nuviainc.com>, 
	Leif Lindholm <leif@nuviainc.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Shashi Mallela <shashi.mallela@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Jn0lI1G6DxE2

On Tue, 3 Nov 2020 at 10:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We should at least document what this machine is about.

typo and grammar nits only:

> +Supported devices
> +"""""""""""""""""
> +
> +The sbsa-ref board supports:
> +
> +  - A configurable number of Cortex-A57 cpus

"CPUs"

(Also if you take Leif's suggestion, "AArch64" not "aarch64".)

> +  - GIC version 3
> +  - System bus AHCI controller.
> +  - System bus EHCI controller.

Can we be consistent about either ending with a full stop or not
in this list? I think the usual style is not to.

> +  - CDROM and hard disc on AHCI bus.
> +  - E1000E ethernet card on PCIE bus.
> +  - VGA display adaptor on PCIE bus.

"PCIe"

> +  - A generic SBSA watchdog device

thanks
-- PMM
