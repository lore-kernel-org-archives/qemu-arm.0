Received: by 10.25.77.65 with SMTP id a62csp2604435lfb;
        Thu, 16 Feb 2017 10:27:36 -0800 (PST)
X-Received: by 10.223.162.133 with SMTP id s5mr3761732wra.157.1487269655989;
        Thu, 16 Feb 2017 10:27:35 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x230.google.com (mail-wr0-x230.google.com. [2a00:1450:400c:c0c::230])
        by mx.google.com with ESMTPS id c17si1471164wme.128.2017.02.16.10.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 10:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) client-ip=2a00:1450:400c:c0c::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x230.google.com with SMTP id c4so17571731wrd.2
        for <alex.bennee@linaro.org>; Thu, 16 Feb 2017 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=QoWDEDJisq1ncACiFVv9cNHXXI4LzSNy4F1ydFSAwpU=;
        b=bw/vN6FVRTpWWIllNKSgbz2Fbrc1FhmMgzW+KoCrN501ajT9jMmKIEa6UjVs35YNCV
         O76E5a2lxVczwMoSFeZBY16PVnrSCAI/rPARoJhQW/uGwpyMflw4SxoVFUaLYKdUsu33
         mSmYxhANbbFyzIfcLnOnHW0MftY6+hQFoGfw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=QoWDEDJisq1ncACiFVv9cNHXXI4LzSNy4F1ydFSAwpU=;
        b=svAwP7xgejo4aQpAMz2u61xce6M2PN4zOgaNWLNP9Apg0IRKhsnDAH+0BqFKUARFfu
         y7+0Eai8H+NbSB0FqkKC+637AHJngz7hcvJEJC4/uPB8YKsf63iJ/my5EcfkQH1qAxGk
         TJOhCMauRZS8fYsPZ2BAF1Rg9kPD5xWsvZteS2sen3KNV5BtnooqxQ0irYjpKtP1c5ol
         wxqXWj7Idl+na9trguZJr9ETdgxYRQ7+owa4eRKinp23omaCmKThf6kvoZ00b1SivEDu
         PSPrmLLhzDN60b65vAVHw8bzmi4H8Gg4f7oI3XMlnlwggwzQxrvNA6SvOWVvjgzk9MpH
         tAXw==
X-Gm-Message-State: AMke39njELXhUjPihxz3E/IbbmzsveJeiZD5yMLxFa+t3wHbR1kjr9Fmn+zJRli6qkSpqpGpJJwpGp1/bM5lqLdVlF4=
X-Received: by 10.223.136.152 with SMTP id f24mr3392968wrf.187.1487269655690;
 Thu, 16 Feb 2017 10:27:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 10:27:15 -0800 (PST)
In-Reply-To: <1487262963-11519-4-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <1487262963-11519-4-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 18:27:15 +0000
Message-ID: <CAFEAcA-JoKKkKtL=W0ecVQ=+wHbxe-gxKGho8GDm95YuyD7rWw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 03/13] armv7m: Rewrite NVIC to not use any
 GIC code
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: Sn6fGx/5Te2X

On 16 February 2017 at 16:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Despite some superficial similarities of register layout, the
> M-profile NVIC is really very different from the A-profile GIC.
> Our current attempt to reuse the GIC code means that we have
> significant bugs in our NVIC.
>
> Implement the NVIC as an entirely separate device, to give
> us somewhere we can get the behaviour correct.
>
> This initial commit does not attempt to implement exception
> priority escalation, since the GIC-based code didn't either.
> It does fix a few bugs in passing:
>  * ICSR.RETTOBASE polarity was wrong and didn't account for
>    internal exceptions
>  * ICSR.VECTPENDING was 16 too high if the pending exception
>    was for an external interrupt
>  * UsageFault, BusFault and MemFault were not disabled on reset
>    as they are supposed to be
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: reworked, various bugs and stylistic cleanups]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +    case 0x400 ... 0x5ef: /* NVIC Priority */
> +        startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
> +
> +        for (i = 0; i < size; i++) {

Just noticed this line should be
+        for (i = 0; i < size && startvec + i < s->num_irq; i++) {

which brings it into line with the nvic_sysreg_read() code
and prevents an assert() in set_prio() if the guest writes to
registers beyond the end of the implemented IRQ range.

> +            set_prio(s, startvec + i, (value >> (i * 8)) & 0xff);
> +        }
> +        nvic_irq_update(s);
> +        return;

Unless there's some other problem that means I need
to respin anyway I propose to just squash in that fix.

thanks
-- PMM
