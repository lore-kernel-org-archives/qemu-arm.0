Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp949008ejc;
        Fri, 3 Mar 2023 03:24:58 -0800 (PST)
X-Received: by 2002:aa7:9735:0:b0:5e5:6eea:5956 with SMTP id k21-20020aa79735000000b005e56eea5956mr1810785pfg.3.1677842698569;
        Fri, 03 Mar 2023 03:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677842698; cv=none;
        d=google.com; s=arc-20160816;
        b=wYffrrONdGN7hxoaLWSl8kEsRSJLlT14rmCvVJoL7fhoVB/rlzQlY1aFVg5NXSG+gt
         SNVN2PaVWArDwh0vax1yh2juzkC9TGHjboWJCsrfRY+bSaBtOi02qhQ7gKMpZce2CH5n
         AN1KXAU9n2iabsuww7oSj51wVQ4c/eLBhlUPYTbqh0TIw/VSOdi56wXFZRiJQLZmML6/
         yM/s0fICCBwJdFioMoQR5/xDwH2YImV641xZLOwNoC7wU/u7qbxDcmLwGxbHIsITbLQn
         ++Q8u+NqYa5o4dXSU+xe66zN4/pkaSJLB1N3ogJUjMcf1uANGQ3Osv/r/UBsxILAs5Lp
         CH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
        b=WpUTzjCvtNv6Jdo3NSRzwX7ZTU89iCixyoBhNaDtGSDyyxcwD4VM7ndFkKve+hi7AO
         1PYc4Y0iFlA3NhLBVx6zWkL0buGxv3BfVLPEMg+7+2fZSNpf/k+klNZHS9b8ei9ROL1D
         ac/A/OLSku7ebYkEBKZLVqW/UzDzmlZkwPneJ0Yi0KqlrJrS2DYMtHKn4K+YRoA/+TS1
         OMlgUUqzX2Q5lykQa+4engqyNGIKKTmc1XfE0ysYsQ+cmPivxNuhXkQf0BvFULcn+o85
         bJcInjVVWuBS3dj66uL4hI9NgYGA90ZHgImjIGads8rUg2y75BuEoahvkcwi1Ix4cI0t
         TFMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdlLeBN9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i126-20020a628784000000b005943c2743c1sor959142pfe.33.2023.03.03.03.24.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 03:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JdlLeBN9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677842698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
        b=JdlLeBN9mZJKEzV2VH1S1A56dOCzQMFoF3EFCCzNeJhuZ0/DcQj0FSt6e+TAwbQ8a/
         9sFQyrtfC3y9X0+7Ge7TFkFeBBu/HfLMyCr0TD5vmRswBGNsMR0KuPPcC/t+0Nxkyg94
         akiDWvTZlsZ6o+AnhgnxbxN5VJXTOyAXd8wiBQ9bH4agHMMI1JenET0Q5kr13rdOXADZ
         G0bd5vBN/KVFmaFe7hiFRlnnaJ3W1II1jZJrGujsdTk4ORgorIXvETWuDQmhj5fNAi6M
         LPDGI+bWQc7wCa2g+Sz+/eaGH3DArOygO9P4pmwO7LKLsiOARMLG0eSFMnIF41229i2A
         HYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677842698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
        b=jIsQiB+TV+pao8MgR2YhdDwspOvFZydKAW282RnLLdaRU0U4pICySVYC/1yG2togOP
         KK9SJL6SeyybFMpgMArrqgydb79LZm+eFAXeJPPR1LBmNR+jnOJ9bAcehprtu7Hh8UHS
         kVS7JwZYLA8tcrKrfTAA2hTW9ADmT3bWVuZZZOBdQgtBny1HdcUQvWDs/QY7iI44ZWGC
         kY7fl+wogvadgKGOE4LSUr1IHJ1oNafk6p+4jsmgHmXPy83zcYdxAz1wBjux0q4oCcaD
         +hyyqKdJ0JTV6f8N5T81XLipsV0jKH8AszT/DEtWwvBGfN9w7ZnEPLv8gKBbK/f/Jib4
         TMJA==
X-Gm-Message-State: AO0yUKUnv8TC135fQXatzZcfuQyiYEEt2KYN3+wzScU8/5yafzUJDRL1
	K/2YPw/FItVkVYTv8yTcjxEh1ybjvh7V2JpD5Fwgh8I4
X-Google-Smtp-Source: AK7set9TFhgmzEYff5a5Y/FhcSMZ3q7NzK7FxjJZYmiBpcpZypyz3OwZzAn3/jSFaGTGPE0QrSfYtgRzKg7q/DB7Eps=
X-Received: by 2002:a62:ce4e:0:b0:606:6380:98da with SMTP id
 y75-20020a62ce4e000000b00606638098damr729699pfg.5.1677842698016; Fri, 03 Mar
 2023 03:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com> <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com> <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:24:46 +0000
Message-ID: <CAFEAcA9cE087cowTodqAb2mkzGxxnAcBGZsMNu6uj_Nsa2v-dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, 
	Reinoud Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-TUID: u21kK5ulDtdA

On Fri, 3 Mar 2023 at 11:09, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hello!
>
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
> > x86 ==> deprecate both, user and system emulation support on
> >          32-bit hosts
> > arm ==> deprecate only system emulation on 32-bit hosts.
>
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
>
> Adrian
>
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

I failed entirely to get any traction with persuading the
kernel folks to provide an API to let QEMU work in that
"32-bit guest wants a 32-bit dirent but the kernel is
providing a 64-bit hash value as a dirent" case. Somebody kindly
wrote some kernel patches but they went absolutely nowhere.

It seems to only happen for certain kinds of 32-bit guest, where
the guest libc is not also using 64-bit dirents. So at least as
far as Arm guests are concerned the effective result was "the
older arm binaries that were built to need a 32-bit dirent are
just not around any more, so very few people run into the problem".
You can also work around it by using a different host filesystem
type, I think.

thanks
-- PMM
