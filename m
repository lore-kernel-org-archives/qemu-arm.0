Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3477030wrh;
        Mon, 29 Apr 2019 05:58:57 -0700 (PDT)
X-Received: by 2002:aca:b60a:: with SMTP id g10mr15425052oif.35.1556542737491;
        Mon, 29 Apr 2019 05:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556542737; cv=none;
        d=google.com; s=arc-20160816;
        b=YHWCH910lsuFs0cdwhtLhLJ0fsEgGM47nUJ0xE/tPc/ANMLPqpUQn36Qsyh5aiRzt0
         UOqCznNe0C+8xRNmk23rwZediYcDPV8vgquHeaY5blBcbLjLUo9hJid6lv2GOBv3HUBx
         lOJJh02cKb5ChY2cJaJMbKT9bERylukc//ieFkHkpZm88Bu8crytID/RbwdEsh67DMFW
         TnvW6hOCp9erqhUtb0wLa0FfG5f0uq/CFuSprQe/VTuYgIPioGN0IAPpc0sPtHr617mW
         24dGZavcOrBeoBpgVnTTUU/C1s0v6QbN456/2s7M8ssIUC9T7hGmyDMznAGti41MjZjd
         zbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2NwYw4b+IY8M1YCsdRxbhgNk1mMcb2Nc3jtJjBgki9I=;
        b=r3fCJPfqG/Yt7c8DrKJ0Sa34zPT94nlljqbo4ahpeIQead3eh/3rpbphFF+UHApAkL
         CfxldvOe/kDwjXF/a7Ml/k27wAVl6e5zTH+9qTh47qE95+kKkHq1ENJ1CEWv0n4PgzFp
         oSuM9Pwu2UNWSo5zRha3QuIk/9cczwJITJKmtTd7hCUJPWhITCtyZ/OLwTc3wXL0f7dX
         VczF0QrNXDyd58wIIjs8aYKzmbQf6J0WOl7TQANUa5cAL2k3lXQksmpvlEVSlt7T96PQ
         xLJoxn1U0orf7A/jH25JP0pGIQgDrb/FIi0E7fvBEqVtVf/iDX3ATOeQnfWjqhryFwke
         1smg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+rxR76b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y13sor3665194oix.170.2019.04.29.05.58.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Apr 2019 05:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+rxR76b;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NwYw4b+IY8M1YCsdRxbhgNk1mMcb2Nc3jtJjBgki9I=;
        b=C+rxR76b1anyoTzvOnkmMgBE6S3nboec/wWOsEDgwS2KK6lMB1r17oQCcg4/kAKF0z
         PN7mhxELRBIgyAdl0Foku62EBIdeYxfeYkjlii/1EBi/vJ6cmaA8nmac5Ho8RJjz82IA
         /6W6a2uI0vMjUaRoQkeUPJQKeLpbvmGWpFtUTsPqWFfTBWctnhfrTKaYB4en0/pFfwTk
         dGcYumXDV0oXa4NPUBHs3sCIs1DonDHteX5aJl/XGHSz+bPjRx4aEtX/goc5b/GyHd9a
         r9mUNexvpx7GMqa/ijjFu2cT575BG0TPAy4HQiRpvZQKlWC+gZJkgY7ccdFhCMEj0I3Q
         Sgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NwYw4b+IY8M1YCsdRxbhgNk1mMcb2Nc3jtJjBgki9I=;
        b=ByIpXTILc58MXJFwMcbwbueGOY44JVWQ9Neq/x/TmBlm6A+uNO4O7FSeqJG7qJXlI8
         7zP7qhlw0fYpTD3GczVC3rL6DWygCA6B5+hUyA6+gupnTFYDY/TFyIUc/G+AlKKwBgmW
         3U+g+TlEjyfapymjyXVvrVfJTi4WGLcz2+/lKUhp27P+hWhCiF8QSkmyi7yr6zSckuwo
         bTooBL71PDJ3BNtDrBJtoO7jVkRDze02Ddf3dTApJ82NiVR+u2+pH3zJJ4uGRULfyLdI
         hEJgY1gEHSCoH75LfvjgPz1Q7MXgkZHLcKL+HNvW5oV3Y2pHKaNiRMSppCbgVp1Ld1nW
         GoxQ==
X-Gm-Message-State: APjAAAUpNTPTJzN6GaFYMUuS4CQE7mzZpROHnS3NaYtbjDZ+uefGBpDo
	l6WExGMF/Nr2FfseWaw0y4E51BdET6dSlG/RiYkvMsGw
X-Google-Smtp-Source: APXvYqxBHccMqWKsqWDz1ZSQ7vm/0xhup6iPl8eHXjgDoAbUA05cg0QjiwXIheACiSowdp38vOY7XN49BsabzVgqvAg=
X-Received: by 2002:a05:6808:301:: with SMTP id i1mr12823600oie.163.1556542737181;
 Mon, 29 Apr 2019 05:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190103144124.18917-1-stefanha@redhat.com> <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com> <20190426091702.GA2071@stefanha-x1.localdomain>
 <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com> <20190429122819.GB7587@stefanha-x1.localdomain>
In-Reply-To: <20190429122819.GB7587@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 13:58:46 +0100
Message-ID: <CAFEAcA9_=a72BAmyb0eJhLF_nYLhRb_O7e=__MPazQ0nLC9Tmw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel argument"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Jim Mussared <jim@groklearning.com>, Julia Suvorova <jusual@mail.ru>, 
	QEMU Developers <qemu-devel@nongnu.org>, Steffen Gortz <qemu.ml@steffen-goertz.de>, 
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: f2epV3I7Z+J0

On Mon, 29 Apr 2019 at 13:28, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Fri, Apr 26, 2019 at 12:45:37PM +0100, Peter Maydell wrote:
> I was going to add a function to check kernel_filename and the presence
> of -device loader.  Then each machine type init function would call the
> function with flags indicating which modes are allowed:
>
>   /* Allow both -kernel and -device loader */
>   check_kernel_loaded(KERNEL_CMDLINE | KERNEL_LOADER);
>
>   /* Allow only -kernel */
>   check_kernel_loaded(KERNEL_CMDLINE);
>
>   /* Allow only -device loader */
>   check_kernel_loaded(KERNEL_LOADER);

Every machine should permit -device loader: the point
of it is that it is entirely generic and works the same
way on every machine.

thanks
-- PMM
