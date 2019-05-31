Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp910285pjq;
        Fri, 31 May 2019 10:06:52 -0700 (PDT)
X-Received: by 2002:aca:4457:: with SMTP id r84mr1033778oia.42.1559322412640;
        Fri, 31 May 2019 10:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559322412; cv=none;
        d=google.com; s=arc-20160816;
        b=TxolGbY6qyXiaJ9EsMji8sV6FMBUviKh0bQTGBqELMI5aEIBFqjogXQM7CGSSuV9KA
         JNeAUbVXzjJEA+WaWqJAau68ZhaLU3Vas0oBLBM7gYfmtWl5khwYnpmhBjEGS4k/UUo+
         njXE3iEY7qaq1/d3AKYtPq4866N1d5fV9wht6u34xlmSCy1zfl8PN9ZtpyX+fAQEn/p8
         DK+Caiwq4+lomZL4H6UP7YUFDq9HpEq6YsbD1Ycgu35Fz0njzL+803oXigzRfQjZsT5D
         co0JCJsgcW5o/vhKCyyTgymLhJ9DY0hRAtjZPrFgcjZDVLrSjR5ty51E5zzwydmS0JI3
         x9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bGEgwcdg7BQDVwN5gbQCpbUXmzK9K+tKsUN6ULwLP6o=;
        b=KmqENu4sTNaCz3UahIAmUv81Ns04lsAP76M4yDnvMhnV/jRbHodrBKoekn9z4AMdZu
         1kPP8IRcigY6Z8K9gr71Z3/oEqayy/Hc2IfunUwui7Hvn9j/PdyK6wLHk6TFeHuCkXQX
         oR2ibLUJ268nIkv3DMTamDymuhFV3EtIY75vrdOquRQYoqf/IETwc5dDS8FjVZv0/AAO
         qwUEen42W9Nh9BkA2LbzRaTAi/i74c8aYMqvJl5Onj/rGnjWgUv0Fb2MB7fE4YuTMeHh
         MMakB+avwEWmMKvMUb5Db/tcLwKzCuu/bhUoS4T7DaKoBk5ALW0gKbgHpAXB2mynNQwl
         v4sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+Oq20K+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d7sor1189836oib.132.2019.05.31.10.06.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 10:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B+Oq20K+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bGEgwcdg7BQDVwN5gbQCpbUXmzK9K+tKsUN6ULwLP6o=;
        b=B+Oq20K+qDarF0B/R080DljMCKoTpHjwGkkIGgNtEwo56QV9dFqJrlwSOSWdS7ZSfj
         r5NgIu/zy2qbJL5rTllite+Ns/f47+0XUxJ2i/EEhXSiTgorVeC7f9lpiXZMSClxtnUd
         adi8Ejl0ZrRDml7XaqzuqNFYLSDvKwBi0ny51QTi/PiD7ZDA3uQzL3hHsCUN3Kxrweed
         mF2v2ML3qfhGOD1kcmVBkkVh+LY8wMTVU4FgtcsqlGLzlFggGcYTmyFXe5qH0Nx4NF5y
         32MXCNiNfVWkUVRiUjF6Y6FiERrqAZtP8oIVIMqPnWsVHClGlIru/gZdTSsUUI1DYXLt
         Hn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bGEgwcdg7BQDVwN5gbQCpbUXmzK9K+tKsUN6ULwLP6o=;
        b=nmLdGm20HbvmM6QoV8Dk4nqrw1HaCybggEa2W5Zd7uM21MQa3T3sG2huToCcnVRwgZ
         Wx6zQGkE42h/RW4IwKK/jUbjqnmmInMj7GPjj/ZhuKpRi4eHJV9fZ2Mx5yVq4v/EvRH6
         ZcMm5/Qbv68CQ26lfA0Ma8h1VnNYvBU/6ng+5NNlp/Xq1RaMe09sHGY1iVK96FDzBiFl
         IYHwaac7OdTqjX9RXnGuBZPoTC80YAGwyc1yK+QCfvY1ysU1YqdPtx58HdgBa1nMWitu
         vJo9M3ypRpoKMdiF53DcjCMjJDSC8DjIip0qTVMHteBqsl8Oxtm5ToYtpPn/UnRJm4nk
         NJPw==
X-Gm-Message-State: APjAAAW+SxD99e+61Sq/fPc21T0PRa9akR1tcJIw3o8zJdxy9GTAep5r
	fGuekHCNCH4S5GaF9UxYvdknPlmMfduondiz5lfur7RM
X-Google-Smtp-Source: APXvYqy53KqPb3kHCJ8QIsSrO4QxITByDLUC+dJI1UCDwhRh0iGKs8RpEhibZG893xpMS2wEZLijU37i+k4yYu+vkek=
X-Received: by 2002:aca:6cc1:: with SMTP id h184mr2037150oic.170.1559322412328;
 Fri, 31 May 2019 10:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190531154735.20809-1-philmd@redhat.com> <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
In-Reply-To: <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2019 18:06:41 +0100
Message-ID: <CAFEAcA9m842==pUU2ux9PQzetJ2kDFp4LS+VT9TyTUqPEH-+Xg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Miroslav Rezanina <mrezanin@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xXZh2tETfhEU

On Fri, 31 May 2019 at 17:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> I'll see what happened to Samuel series "Support disabling TCG on ARM"
> and see if it can be salvaged:
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

That would certainly be useful.

> I suppose in this thread:
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05641.html
> you refer to this series (not yet merged):
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03137.html
>
> I'll try to figure what "KVM injection of interrupts" is.

This is about some (rare) cases where userspace QEMU in a KVM
setup determines that it needs to deliver an exception to the
guest, and does that by adjusting the CPU state appropriately
(changing PC, PSTATE, ESR_EL1, etc etc) before telling KVM
to KVM_RUN again. Currently we only need that for some places
where we're doing debugging of the guest, but there is that
pending patchset that would also like to do it in case of
a detected hardware memory error. (Most of the time when the
guest takes an exception it's because the host kernel/KVM
have determined that it's necessary and done the relevant
messing with the guest CPU state.)

thanks
-- PMM
