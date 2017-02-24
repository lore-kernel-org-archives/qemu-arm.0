Received: by 10.25.0.147 with SMTP id 141csp703783lfa;
        Fri, 24 Feb 2017 06:07:47 -0800 (PST)
X-Received: by 10.28.209.202 with SMTP id i193mr3182351wmg.20.1487945267633;
        Fri, 24 Feb 2017 06:07:47 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com. [2a00:1450:400c:c0c::22b])
        by mx.google.com with ESMTPS id g4si2600691wmf.46.2017.02.24.06.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 06:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) client-ip=2a00:1450:400c:c0c::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22b.google.com with SMTP id u47so13807048wrb.0
        for <alex.bennee@linaro.org>; Fri, 24 Feb 2017 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wvId37ax9VWi9XDIZWnbJXPMekTPSztKKOA7I67RF7Y=;
        b=S5ZYHCo6GgftLdP7EAlYh7iE5cYCi1batPJhuAz0fxakn+yPj3CUN7vFJnkKVIApU5
         tqSvczqfaTYcUIvlLy+MHsUfoq97AgcFG4roLBwVL9LXF5WXk/RBrZ+glGs50LoGrv1C
         YQWpTAcwDpk8NbE4tmY9raCr97YfmVekWQYi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wvId37ax9VWi9XDIZWnbJXPMekTPSztKKOA7I67RF7Y=;
        b=qWLjEwOfVE50iPgZeLL426q2WpUxObXwJvRwVYsd/W/xO2Ks4qXAt+MGI6wyuC36FM
         zAjBF2hX4X1s/os7aBdjs1VcLdgfd8T/mep3KQ/7882IHL4SfoM/f139Sqf4ROuV8pMw
         L1Z9WGT+SAXK1j4iZbpzFVEcZNKKOHCOCSEYc6U3qlKdpi9RvUXahiDAEM6JprHITQ/r
         croMiy61sP66tcSEDAd7zqk9FWeOOQ+/inCeUH/aJxEwRAN9XT/W/LokAO2EhLV9c56T
         ciaL0wTjD2kwSz7c3uqeY6IgnGQpWzrcaxchPsYENXNqL3VPwQalMim8FGtJBqW9FbBG
         0yVw==
X-Gm-Message-State: AMke39kB6oL1EW8oUqMFMu5B2+iuSd3XrcfoEr250Dh4ey7FIl5yawOsOEBQ1CymjrWzmLqUh2wPyUPhvLjPksJ22Ts=
X-Received: by 10.223.169.76 with SMTP id u70mr2659874wrc.187.1487945267146;
 Fri, 24 Feb 2017 06:07:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:07:26 -0800 (PST)
In-Reply-To: <87wpcflmmb.fsf@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com> <87wpcflmmb.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:07:26 +0000
Message-ID: <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eAQtWs8u6J63

On 24 February 2017 at 13:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Even this branch is failing the tests for me:

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test9-kern.bin =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> not ok 9 - 00000000 =3D=3D 00000800 icsr

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test10-kern.bin =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> not ok 1 - 00000000 =3D=3D 00000800 ICSR

> not ok 9 - 00000000 =3D=3D 00000800 ICSR

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Testing test4-kern.bin =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> not ok 5 - 00000000 =3D=3D 00000800 ICSR

> not ok 9 - 00410000 =3D=3D 00410800 ICSR

Ah, I missed the test failures, but these are all test bugs.
All of these failures are for reads of ICSR when we're not
in an exception handler and the mismatch is because the
expected value of RETTOBASE differs. The bit is architecturally
UNKNOWN, and we did a late swap from making it be clear to
making it be set, because that seemed to be more in line
with the Cortex-M3 documented behaviour.

I didn't notice that the tests needed to be updated to
mask out the UNKNOWN bit before comparison.

thanks
-- PMM
