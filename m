Received: by 10.25.77.65 with SMTP id a62csp2542175lfb;
        Thu, 16 Feb 2017 08:12:44 -0800 (PST)
X-Received: by 10.28.65.132 with SMTP id o126mr2978523wma.14.1487261564661;
        Thu, 16 Feb 2017 08:12:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id w81si1076344wmg.39.2017.02.16.08.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:12:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x236.google.com with SMTP id c85so70359350wmi.1
        for <alex.bennee@linaro.org>; Thu, 16 Feb 2017 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G4bJub6qRHrNdGEFmqY6XYlyFJhmXwKBpkLjkUhThnA=;
        b=KWaTUlAu3hnTkfaaUpy2DP7fIJkUV8AKFaxwWR+nZxUBQV/k08pFe/jazERqkKWtRQ
         k3ElCJxP+Z0ndp5ClGYI3zEyoLIzP6D5VMf7IhkROpI4UEwhiIMonOvqhDUWuX/wDLib
         edrT3PEh4eZt9eD3jRRfSqTkVLUydbximPsVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G4bJub6qRHrNdGEFmqY6XYlyFJhmXwKBpkLjkUhThnA=;
        b=QrIsk3/qKNi7jHgMb7vT5vXAnpnYxuhPSJR4xaEDhsc3D7DvFL9yvVYD2jj0z1t17d
         4rXN4TKPkRA35i3PGElGyShcQGn7Jh+NaS5DApK1Og/pg3afuzDfbVp3dQyVzplJNhF9
         i2BvnEmJFLOC7gOR77nUvVVhI1G5o8VswvsUSk2ITBGMxlwg5f/CAjJf2ogm4iFTag0z
         5j5l0+7d1vhd60wwTKQNMuD/wMMkU/mtrbyJyWVDLQsyOaxz47um9physN4mEbLdh5HA
         b5jaYHYUGX4q82q+DS9XcabpUqJUleW6GUQq+6QbBca9vZHKSTY1Dg1Uls83kcJ9+QYS
         c7Cw==
X-Gm-Message-State: AMke39k0OvGVW3SaI1xUdzfEVNZfvFwqg+J6y4MOZ4gx6Oya/44BPWsbsK1vufh5+E+mdQgJ1oOKMIyHmstT9KyBM9o=
X-Received: by 10.28.16.70 with SMTP id 67mr3287523wmq.142.1487261564344; Thu,
 16 Feb 2017 08:12:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 08:12:23 -0800 (PST)
In-Reply-To: <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org> <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 16:12:23 +0000
Message-ID: <CAFEAcA9zp3uoDkXFJdHu2rRevWMCMrXX6v7uFhVzTSwkb8P0Cw@mail.gmail.com>
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZygxJHK9Pw1h

On 15 February 2017 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> On 15 February 2017 at 12:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> Can we not calculate a vector index rather than abusing the meaning of
>> offset while switching on it?
>
> Yeah, we could. (This is just a case where I thought "I could
> rewrite the code Michael did initially, but it doesn't quite
> reach my threshold for doing that just because it's not the
> way I'd have written it.".)

FWIW, it took me five attempts at rewriting these loops before
I got a version that actually worked. I think I'm going to
take that as justification for my bias towards not rewriting
code that already works :-)

(The change I ended up with just uses a local 'startvec' instead
of modifying 'offset'.)

thanks
-- PMM
