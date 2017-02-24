Received: by 10.25.0.147 with SMTP id 141csp707655lfa;
        Fri, 24 Feb 2017 06:16:13 -0800 (PST)
X-Received: by 10.223.129.183 with SMTP id 52mr2921535wra.43.1487945773407;
        Fri, 24 Feb 2017 06:16:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id h1si10319933wrb.231.2017.02.24.06.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 06:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x233.google.com with SMTP id v77so15499505wmv.0
        for <alex.bennee@linaro.org>; Fri, 24 Feb 2017 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k9T+jeLiLrnUMle5gDZD8yl4m1YSHUKVztl6IYVthqU=;
        b=NyBGTwOODP60NT1qOnr7ioWZJYHPq8+3ajewOBDu7QyT7261kYMKrh0nwMtNcUSO7U
         1+pdVJW+rTc90ExTuP6fngmFlBueTm9GpvIQv02HXRZmZnHjc3VbsDt27AXy3RIIRaDx
         9z/irQg1ZUp2LTy0q6Qw+Fy/F/GZwv8uvaMMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k9T+jeLiLrnUMle5gDZD8yl4m1YSHUKVztl6IYVthqU=;
        b=oSQrqjy9D0Q6lEiaTkx9zHCajrrnVz2utLaZ9V3H85F0Izso9+dQvOC6UrjwFVSE3M
         FWjS+vJUPZkbqe+jwOpBwJojfYuq1DLXkPMEhT9uEJr8W1xiZbMIxoQBnngARb8f+GIE
         Aot4fac6xM8+sKL9AQYgQMa40n5ki0/Sq4XXjcIWfrfjGhcTTLS2tal0+KECozFnhTQc
         lZmbh+gC1HXDWYB8g8srS0ygLXUbCldqL4Ll8Ggc84b14jN1GUFJxvzLy0+nuLK/jdAO
         W+E9eEGCjgfVgXmNhEtJs8B2htBxDIgecRTR+QGaAxXL/n/ZuuV71rso+gUbP/GcPgl6
         RY5g==
X-Gm-Message-State: AMke39mZ8RAhyH0YX1kIPBffZAvy///zULkJz9jWT7cdSjUMrIUXXvUVyM9u98z9Cdklv6lW4XkjXZTnawj3bx0Ww+k=
X-Received: by 10.28.16.70 with SMTP id 67mr3113452wmq.142.1487945772908; Fri,
 24 Feb 2017 06:16:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:15:52 -0800 (PST)
In-Reply-To: <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com>
 <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:15:52 +0000
Message-ID: <CAFEAcA-x=qTnFXseYk8GzLQ5r558genM4=kyDxYQ7V40Tfb8Dw@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2+MgyA1KsSV2

On 24 February 2017 at 14:07, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> On 24 February 2017 at 13:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> Even this branch is failing the tests for me:
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test9-kern.bin =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>> not ok 9 - 00000000 =3D=3D 00000800 icsr
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test10-kern.bin =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> not ok 1 - 00000000 =3D=3D 00000800 ICSR
>
>> not ok 9 - 00000000 =3D=3D 00000800 ICSR
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test4-kern.bin =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> not ok 5 - 00000000 =3D=3D 00000800 ICSR
>
>> not ok 9 - 00410000 =3D=3D 00410800 ICSR
>
> Ah, I missed the test failures, but these are all test bugs.

...pushed fixes for the tests to the test suite repo.

thanks
-- PMM
