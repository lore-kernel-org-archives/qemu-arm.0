Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp2729443dll;
        Tue, 21 Feb 2023 08:50:09 -0800 (PST)
X-Received: by 2002:a05:6a00:1ca5:b0:5a8:d38a:c6c4 with SMTP id y37-20020a056a001ca500b005a8d38ac6c4mr3660773pfw.14.1676998208760;
        Tue, 21 Feb 2023 08:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676998208; cv=none;
        d=google.com; s=arc-20160816;
        b=z8HeMp8dKIkcffVKG/+a4EVwqLdv/dB0AJN43pB2WxRAITdbirIuGRnSc5elxGMLXn
         40m0Gk/ETZHlJuQFxw0SGbbF2nOPAU4DxVOGHBuOEg2ymlax9x25Dqo3GUFuSIAXVTfz
         HeU8VodemaSHLzBCoEAc2zI64DPFVVJHvQdLJhIlOHBF9ta/QFmShFZqVtgxwZyfNXR2
         SGY86jdtBjB/68OSQ79M057ID2cv8eq7UektoVBCVGAuLxMu1H+SzY1gJHEGEqIL6emW
         nR/KyG0sX+oPwAQ+tSqXg3nh2RJGs2npDv7Fk+zqns7y960xzbiYjHXhpeL07Dl714UC
         5X2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRJ1SyElx37SyUjbcQrT9HGWKj1vUf9AxqjqCD4h5N0=;
        b=BYL1dCXT7wlTEdddbYcrlOqMR6kuNJo6C/kRFZ1asrSom0WcOgwQAQgsWEFPh+OviE
         IaNMhjT0bUYqDDPGZV3C2+mzg5qB0dLPzR5MAPm0CQGO5U71BpRt/bAYDgBCRgj5/V2w
         ik3YmGwPZIDIrwo9OS0QkhYz5gCAdViv6vq9XDDqPrUEnF4ZdHK9m3fNZHYip21tCcMm
         aFyPw4AItxuEs9mP000qWjKdVBKWrjNLM4Z+yJs22hCkNNz+a7x9Y7SeQiL0UUi3vKw8
         3XVzJDaqZDpcdVT+4usI9RQfBtDkCxGCdBytp82G112eoL9lautar999Z3ZTZJoD1Jxb
         1oiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVD+1ys4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a621815000000b005a8c1797b11sor2094824pfy.91.2023.02.21.08.50.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 08:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVD+1ys4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676998208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRJ1SyElx37SyUjbcQrT9HGWKj1vUf9AxqjqCD4h5N0=;
        b=aVD+1ys4FgmOPukuO/lsq+fCAwGT3munfE3iUmAXGVFBVV6StsFDHl/4cP1VzVHH2M
         9cGu4BIIRkgXVSacyxkPS7b9QNxczMDKNfwj4LwAS2O9ZvioiTJiwKuY+V6+YXa8aYMZ
         manZwqtBUAR/7xaCB5Y1aF/mvlMNu721t43BL9IGivaZKFkm0od/ukXXd3dCAxNY3RJh
         QXqqsesp6kGThgIkOu6fCYirib6KtN82UbkzezbI8BKCFuYO8zSGbvVfIgYS/3qyJlHS
         sLsmQZm6IxTJJrlm8VxdMp9f+k1hZpTTI1Up67D07tQbREPmGew4q0BbBb41Dk1o0XqQ
         GeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676998208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRJ1SyElx37SyUjbcQrT9HGWKj1vUf9AxqjqCD4h5N0=;
        b=0V0I45chgwumUh0EdLjOKbB6syRC0p0wqLVKTKwOx09wWTLJVVfv12Ldh/DO4O1DrA
         y6OxweH9Q8BFZ/SHHrZbfJwBB8ofCndWlMUOCoiqOMRxncUPzFswDIzD9qu3bGqmKTfa
         +9mLhSg6h8go7XRQKQA4JDjzbE30uIkgSjDzRxnOPaXC6nuvBAXKOWeEbDcVSwtjzlZm
         Y7Q+5GTXq+HSuUXzfB0vuk5n3RJBj/hB2/psYDQrsLWhjCeCntOZOh9XG4fw+f14w5kP
         sSsUc2JQZOorhHmq85HB5tpmUAWLXWEWcl+sVoN5KMcb44y+TIzH7lrlew9aMhPIe/CE
         Y+EQ==
X-Gm-Message-State: AO0yUKX9N70pCU7Dd1uBTwbqgCLZr39wp46DVorKmEYFXzxKwmoma36P
	gjnr2PldIWFM9RUne7GLc3tp4nB/Ww+Rfj9bXVf0xn8ow912Hfw8
X-Google-Smtp-Source: AK7set/Lb/6k4DDOCJN9UJeXQPCsGunSsaGskxIF49qz7PfgSQNhxNlJCIX5q28s4i1zMOXNuvUVdMBcUFXq+0l6q/A=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr911153pfw.48.1676998207933; Tue, 21 Feb
 2023 08:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20230220115114.25237-1-philmd@linaro.org> <20230220115114.25237-7-philmd@linaro.org>
 <87cz64s64x.fsf@linaro.org>
In-Reply-To: <87cz64s64x.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:49:56 +0000
Message-ID: <CAFEAcA8nC3R5niQPQ2-AVz94HudMJbt9G+rMQhaynqzmm6cVEQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: G8WDnfixgXMd

On Mon, 20 Feb 2023 at 15:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
> > cmsdk_apb_uart_create() is only used twice in the same
> > file. Open-code it.
>
> Hmm, you could just as easily make cmsdk_apb_uart_create a private
> static function and avoid any copy paste snafus if something needs
> changing.

I think this is fine, the function isn't really gaining
us much.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
