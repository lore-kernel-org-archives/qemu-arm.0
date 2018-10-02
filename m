Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4855160wrt;
        Tue, 2 Oct 2018 02:59:44 -0700 (PDT)
X-Received: by 2002:a9d:4359:: with SMTP id y25mr769011oti.80.1538474384553;
        Tue, 02 Oct 2018 02:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538474384; cv=none;
        d=google.com; s=arc-20160816;
        b=I/OXmlE9uMFOnW+R4U9NqsfhGyOoRe9Cqda9J4h9mv+RhAYWbmnqz8iCMZyVFW5G8U
         jG5Ts0Q8fiqxrLSGKKznsBXJRN1csrBeFhZ2reKI9oJF31AQdz7US73o2yGR2vmashed
         MHl6nnP6grQ0SrMp6kWwRBZqnWMXHnqRLcbR7LtvGeAJt4ogeZ6UqM/Mxy5kTTMMaBgK
         UQPD6tZUfZ4tR5KTyKAg5q/8sm0k1eLoiEmPkmd1GgnF80sv2p+MiO9mV679vUkvrv6H
         wNN1xbZ4o2b92JKsMXPvdnAzO3b4pljetvH/EMGPmDg2U6IDrTg7b/N53PHFRIoIF12/
         eQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=DIPWO8qMgDmW5/5djK0RAdpE1DtqLjimVlc/GxPxH5Q=;
        b=NIE6NjyOc7EPc7sVtQS3Xqaq3xIjHbNeQ+lOYeSIatTtjHasBnGFQrvkoIMC2rFcpE
         XAmj6NDyc7a4258wELlE0ok63azPrrfSf0dJ1s5+52EmfT5qGC0n4eXJ0po09PzLpI17
         HwL+ogcpfiQWe4kcEvQpC4hzrKgf90wot5bdjO8x59Ds/FNtZznnWCSCy/BSc8X5zlFW
         EoTvpmS6/+A6PvWiv2gq9486ekzubWesoXhSTJjeDlyFuNLK7b12/AADNYu0gFa+XREQ
         LGfLs/GLbd7AYXK1XdEn8wwstEepaFt+0SN+gIPbq5DQ0/l218BmQvsN+SUfBuYBM9Lt
         VyWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IhoKPu4w;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v21-v6sor5891168ote.15.2018.10.02.02.59.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Oct 2018 02:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IhoKPu4w;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DIPWO8qMgDmW5/5djK0RAdpE1DtqLjimVlc/GxPxH5Q=;
        b=IhoKPu4wFP9HzpRWzKYXxzK02OVuSBAjODxuVAnVqvPfEvfa5rsxjUQm6ZuX1aon55
         o0SQgzGPUK8voy5HJOfvM8v6Leb7mjhwbGGekJRcPPy/VzJqF9vacIa0si0yV/WpI4b/
         l1S8yTgnPaBh1J2GvGdylEOlnT6gYev+eJr38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DIPWO8qMgDmW5/5djK0RAdpE1DtqLjimVlc/GxPxH5Q=;
        b=GPUzNHsfi9EJHFW09JVgnkJk8iL8vU/rSvTrxuhnAhuM2drTjynTp7SCMwGkYR5Udw
         nPYxQVZGUGXe+daCJ9pJaU5d3YXOjPL2Lnp9+zy3S5V+7qJHmGbAW+5duCsqwed+2rVj
         v4vaAzWNRFPnkY42VRAnmKb6vRZ4XJl97eVQDd1ldSk5CD0cHSm9KtvQ+3b0PdaeG8dF
         94SAz+iUFEyy3DPS8XmmZ8MGrzB85qlePf08ts6Sb1rmbSOYwksV9dKpvKbcBRx6grmE
         5I6dooV+C55lejiH5yYGvJJ8s5/WzSkYlTNEQov5dkKiRkmJII/UHB7/nYJ5y8Deih0x
         y16Q==
X-Gm-Message-State: ABuFfoijvFmX3cZqRmH/hXXyawwFEI786U4SIr0xAXhFjYwOx7f8CJpR
	NelzwJM9ZYBgV/4ywFo6MIwvZyv5ewz1gHna/fI5106VGg6qSA==
X-Google-Smtp-Source: ACcGV63wiZ7ZgoS3IyHKgZbe0ynMP9NIFcqy0OY+dcdZ8YtwtrAxLrikFIuLFtJxwPQ66crbGTWsnKbHLILZ2JxY8fk=
X-Received: by 2002:a9d:33ac:: with SMTP id u44-v6mr8522884otc.352.1538474384013;
 Tue, 02 Oct 2018 02:59:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 02:59:23 -0700 (PDT)
In-Reply-To: <20180926112048.17778-5-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org> <20180926112048.17778-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 10:59:23 +0100
Message-ID: <CAFEAcA9fMwG+a=XaxsOrMb=t-w4dbQ-0yAPbRhvRZgB60YRbnw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 4/4] tests/guest-debug: fix scoping of failcount
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5s+NS+0UuPKY

On 26 September 2018 at 12:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> You should declare you are using a global version of a variable before
> you attempt to modify it in a function.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/guest-debug/test-gdbstub.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-g=
dbstub.py
> index 474d2c5c65..7bfc95b187 100644
> --- a/tests/guest-debug/test-gdbstub.py
> +++ b/tests/guest-debug/test-gdbstub.py
> @@ -16,6 +16,7 @@ def report(cond, msg):
>          print ("PASS: %s" % (msg))
>      else:
>          print ("FAIL: %s" % (msg))
> +        global failcount
>          failcount +=3D 1


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Incidentally, if we ever get above 127 tests in this file,
the "exit(failcount)" at the bottom of the script will
not DTRT :-)

thanks
-- PMM
