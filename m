Received: by 10.80.166.35 with SMTP id d32csp403467edc;
        Fri, 14 Oct 2016 10:50:26 -0700 (PDT)
X-Received: by 10.31.198.199 with SMTP id w190mr10044761vkf.42.1476467426347;
        Fri, 14 Oct 2016 10:50:26 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x234.google.com (mail-vk0-x234.google.com. [2607:f8b0:400c:c05::234])
        by mx.google.com with ESMTPS id n193si10083929vkd.125.2016.10.14.10.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Oct 2016 10:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) client-ip=2607:f8b0:400c:c05::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x234.google.com with SMTP id 2so122608714vkb.3
        for <alex.bennee@linaro.org>; Fri, 14 Oct 2016 10:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ssyEhxRylCBZNIMAlocrN8FDE+e1IgtLToxXM5Q5gs=;
        b=WUBH1un+3ZVscBCKFvUJkqyBmWjqIejSmsbeabW949Tt8+6hC0MVqH0qdbr1tVf6tU
         l+UwM3nTEAsMHxpfNNHAAKJTmpk5fI6wPrPPnyH6VZI1vtFa+6EcygB8H5NndcMROcsu
         oOhD3/g4amQVgpXG3BImVbTU2bSrr9k7gt6Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ssyEhxRylCBZNIMAlocrN8FDE+e1IgtLToxXM5Q5gs=;
        b=H+wrQ6QqgNCM43PL5f1wsUfcFAY9+tUsPuuJQi4GBDQTM6n45cEehl5ywhcv1KPLcD
         J81yHW/5miQaDEvo9ZZQyo2z0OCW96jX4FDfXW1CHdehzKOx9c4J/JPbBJUlIPtadCeP
         nhA7fD0NiYjBP5vBXJRPh9oOd8sJTUB3kAaLXNvuZbUoov87Rxu8HuUQTs4V5udCOlgF
         6YYzTfEuOl2yYTJHVCTCIMhTd3BjAA4hxlga4kBYehxYMj1rDO5XdXYsvxKt+e9tRw5D
         +L4rp5n7ZWHsWlVTTHIgkfmViMZPKwyy5BPYjL1xfmWZaVp38HxkgURXYb/w9nR/ZYj0
         eTOg==
X-Gm-Message-State: AA6/9Rm5N6tZV7N8LD8vSO/zJ4chA9wvVQL3OdaO2aM0tIDKj8A4czLAtJ7BF32FeFKrOz+jQ3e9Lj/JcNQ/Q5oqmXQ=
X-Received: by 10.31.64.75 with SMTP id n72mr8216754vka.170.1476467425852;
 Fri, 14 Oct 2016 10:50:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 14 Oct 2016 10:50:05 -0700 (PDT)
In-Reply-To: <20161014151336.31418-1-alex.bennee@linaro.org>
References: <20161014151336.31418-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2016 18:50:05 +0100
Message-ID: <CAFEAcA8EMSAp3k3f+ydWFRDnFyGKMBtODFoRkWc97haAFgce-A@mail.gmail.com>
Subject: Re: [PATCH] target-arm/translate.c: fix movs pc,lr exception return
 on ARMv7
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /a32Sh+jYqtJ

On 14 October 2016 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> I suspect we need to audit all calls to store_reg that might involve the
> PC to ensure "interworking" branches are correctly handled. Also I'm not
> quite sure how the code worked before 9b6a3e as the store_reg path
> wouldn't have triggered the store_cpu_field(var, thumb) to set the
> processor mode back to thumb.

The answer to this question, incidentally, is that
the thumb bit is in the SPSR we're restoring, not in
the low bit of the PC value, and it gets written by
gen_helper_cpsr_write_eret().

thanks
-- PMM
