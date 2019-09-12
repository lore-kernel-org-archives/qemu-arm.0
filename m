Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1856580wrp;
        Thu, 12 Sep 2019 01:35:47 -0700 (PDT)
X-Received: by 2002:a05:6830:4c5:: with SMTP id s5mr33241749otd.121.1568277347235;
        Thu, 12 Sep 2019 01:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568277347; cv=none;
        d=google.com; s=arc-20160816;
        b=GR/2HCeclDU9qv/v/4+mewxj/BmZ4lfEEmduJ8YH9E1g6YPZMprx7SueociwhRosvH
         3h7OKXagD+yOfLsXkR040BKO+Kvs/AuvY7N6grFINM09z4YvzJk0icpl6FwXwViu5bTg
         gd9W4rT0sc4UjqppgYqng6nCgh7HPUSqhof0pyvU2869D1q9MdyPgDRlxXfHegalMibd
         7YS4seU08bRoaxjCPYO0b3+madzR7b37NtYnLQJfn8awG9JKiWd+PwMXsFghoBygmaKU
         I6u6C4/HDeMGxWzH8yR+YLJ7AAP02GxpW90u66l3Ct5OSh64mzSiQ4Kg0rmhId5Fv9OI
         pCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pwvb8EPjgAvwsW8+aMq+UytCTWuKggVwjEAniB64G3U=;
        b=0CBgElgRUTbsCIhGcJl8S3ARZPEwX62JcQGYIU3mMAodbBPXfZaknAfRSIyMyvj+eu
         qRWhGrivKyxcXLCisSCqC/iu2cWErglnBmIEg05SuWyjn7y3rswVoYwoO70OO92HOe2r
         dEYkoni3Kh5V8ThCLe4VPZ+mhOzJkdWsJqntBLu3/94ZIlOMQpv7wBDpPBGBNRNmW5wR
         os95ImJng5bRXJQHK0MPsCNwEXina8rKHHzLZhDMe7KMfDSE3QLXeeiqYRtA2JIbMakr
         FJxKqMggJRqWLuX2p+OdXicHtPXJGpY5o7GIecv3/3JCm7IvTN2fU+zC0AGmQuMcccFg
         Tyvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKuprXUg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z15sor7170034oto.29.2019.09.12.01.35.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2019 01:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKuprXUg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pwvb8EPjgAvwsW8+aMq+UytCTWuKggVwjEAniB64G3U=;
        b=mKuprXUgg4MNFXBWt5N8LOLmyafRo2zrcliKqKHen+dgRnXiClmfQhMCrd4tpZoUQt
         lWi/34/q+CeNShZxnM1T66FC+yWHhXUgIxN5RY80NZi60qhCKUuymv5uJV4FpSGLPBRS
         gIvLIIADIDC+jaf7KPOnX4KuIRlfy8H70kek+iO1CbgKSnS4e+RW9moCnVYhsFkx7eDd
         acz5piKW14dEDCSWRlQ67OG6HloBr4Im/U4O7GpMQFBhfevw5OokeOoVzHvCcT5VXZaC
         XJNcPkqB18+YYTtl2w8gVcXMYeY/6YFQuhc59yiSi5AG9HtyO5DDa05vp9en0pDnrr4V
         ngHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pwvb8EPjgAvwsW8+aMq+UytCTWuKggVwjEAniB64G3U=;
        b=QZBXC4DLzD4ouS4FDRhrEytWMo6vciIvKbe+/VnGDgUuGxPK8w3JdFQzG8G1pLedFI
         DQ0iiJODcf2Wtjd4MdAM1zQJu7VBURC4MFPKghZMkDwFPjDolRw7j+XNYR/uikYGuyIF
         Fw7oWjTDN9OwVzYql1ady2qNPHItrOXsL5EGm88YnoT0EEON/gd6zjGeMNwk/v7U9+8l
         +is53jajYFDqZEG1z/r6Dnooz6URjEMqv+pdbRmqfKLOeez8L8szs9500lvIYUZQmXIc
         bEQaD+ZRUbXbUxIGFcP8ASUAO6O04k4HjnEzL/vQwFVRWvLrdtli/hvVpJJ1+62oQH7a
         Ubsw==
X-Gm-Message-State: APjAAAVlsxstpYf+cGHr1dNI+ci6zVVQene3mdSc2ENRtWQnjymu1bHn
	KaeSWiE24cjiEnMwQfSOzdGblQ0Ro3iARXs3YznAlmijVrgS7g==
X-Google-Smtp-Source: APXvYqzVdrE11tLGLe3zvwcx4a1MbBW9OJ4MT1xNME/OGl1Kux2jaIG6mMwJkWvLhhlegQKFyxLWoFOio4eNFGP9p+s=
X-Received: by 2002:a9d:538a:: with SMTP id w10mr362835otg.91.1568277346575;
 Thu, 12 Sep 2019 01:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906202636.28642-1-alex.bennee@linaro.org>
 <CAFEAcA-DQ0Zq40Xnw5wkA6ojOUCf67xfX83nMEoKW_UrysJhjQ@mail.gmail.com> <871rwn0yb3.fsf@linaro.org>
In-Reply-To: <871rwn0yb3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 09:35:35 +0100
Message-ID: <CAFEAcA982nm0yFdwy8-jUDRq6Q6d0wT4y+jfFeQ_a3RiYn+bPA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] semihosting at translate time fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CQgCxjsJzICw

On Wed, 11 Sep 2019 at 14:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> It does seem a bit weird that userspace linux-user does do semihosting
> whereas EL0 in softmmu doesn't. Is that because we are effectively
> short-circuiting what a real ARM kernel would be doing for EL0?

It's because the "not for EL0" is a rather bogus attempt
at 'security' by not allowing userspace in a system emulator
to access the semihosting API, reserving it instead for
the guest OS (its EL1). This concept doesn't apply for
linux-user mode, where there is no guest EL1, and where in any
case the semihosting API doesn't allow the guest code to do
anything it couldn't do by directly making host OS syscalls.

I suspect this "not for EL0" thing is not something anybody
else's semihosting implementation does (though I haven't checked).

One idea I've vaguely thought about is an idea of a more
'safe' semihosting mode, where we only provide the calls
which we think are reasonable for a not-really-trusted
guest: so you could write to stdout but not read/write
arbitrary files on the filesystem, for instance.

thanks
-- PMM
