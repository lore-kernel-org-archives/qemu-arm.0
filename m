Received: by 10.25.77.65 with SMTP id a62csp190855lfb;
        Fri, 17 Feb 2017 06:11:33 -0800 (PST)
X-Received: by 10.28.189.135 with SMTP id n129mr2125488wmf.92.1487340693562;
        Fri, 17 Feb 2017 06:11:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id h82si1830491wmh.163.2017.02.17.06.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 06:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x230.google.com with SMTP id v77so11017531wmv.0
        for <alex.bennee@linaro.org>; Fri, 17 Feb 2017 06:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=b9KTD7vDfFb4Z1L2eb1xAml9KICPSbih9Vyn9wR2oGs=;
        b=iXtHbCH1ukFEIle6ipW4vYXcDHXHhfsQ/OYGPn3eeP+hCCc1Wv07Ge6cikh6LIsQcm
         zECjNP/Ph4tM6ja0bPN2EO/IPbtat08LlVu9gF3nCzSU00CuEyT9Qp3cz83arVTq2eD0
         Q2kWLfBh3HKYboS5jiGzhT5kt3XndjDdvslaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=b9KTD7vDfFb4Z1L2eb1xAml9KICPSbih9Vyn9wR2oGs=;
        b=WmoBcP3bGWiVeV2lbkKoWhhAKtnxQTWpAyTw458Cf8na60rHTaeR7zCEKAhKvlRDnc
         +PV68M6vSElUjOTiXpxgXk0ZSD6/3DL4l1Quh+PWQUchNj9TwewQu3Mitfr17pnV+mTA
         3Eh8/ImbXH8TJrDxI8yu4SzPZl9Wm6bCk/doRgRgqxkcZqdrFs9MIe9jquwbiYfbKJgD
         s+ZanjnpsxZ5LaewWboEvu6qgKhgZTb2iot+4WAytqomI5w9d+pI6FsP0gIkRLX/rlbi
         V9Bve0V7UbKjZcfNN5ordFYQoVdEXx4Ndw9Nm6V57ItPvcV/B0bEWvAw7Z1Ew9jOz/D3
         w60g==
X-Gm-Message-State: AMke39nvDwv2rLD8HvKPDOaThXL6rr6pN8wkRjN7BwSgHfJVyZUydo83PHLzv4ulyA0RyVV3W9peBE5WlmARCuDJkDg=
X-Received: by 10.28.189.135 with SMTP id n129mr2125468wmf.92.1487340693227;
 Fri, 17 Feb 2017 06:11:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 06:11:12 -0800 (PST)
In-Reply-To: <20170217140505.GB11399@redhat.com>
References: <1487334159-19664-1-git-send-email-peter.maydell@linaro.org> <20170217140505.GB11399@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 14:11:12 +0000
Message-ID: <CAFEAcA8g6H5rHSc=bLOjx2tn+=WDSvevnPc3LokMUDuarqxZPg@mail.gmail.com>
Subject: Re: [PATCH] bcm2835_rng: Use qcrypto_random_bytes() rather than rand()
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Marcin Chojnacki <marcinch7@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: 62l8z/rPh6S+

On 17 February 2017 at 14:05, Daniel P. Berrange <berrange@redhat.com> wrote:
> On Fri, Feb 17, 2017 at 12:22:39PM +0000, Peter Maydell wrote:
>> We should probably improve crypto/random-platform.c to use
>> getentropy() if available, which would fix the "BSD or OSX
>> host and not using gcrypt or gnutls" case which I think is
>> the most likely cause of qcrypto_random_bytes() failing.
>
> randopm-platform.c currentl uses /dev/urandom or /dev/random,
> so that should work when GNUTLS/gcrypt are both disabled at
> build time.

Ah, and OSX and the BSDs have those devices. (I had
mistakenly assumed they were a linuxism.)

> What would fail, is uses it from a chroot with an empty /dev
> of course.

Yes; replacing the rand() in linux-user/main.c would require
this I think (unless we're willing to fall back to rand ;-))

thanks
-- PMM
