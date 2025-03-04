Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp132821njm;
        Tue, 4 Mar 2025 05:53:41 -0800 (PST)
X-Received: by 2002:a05:690c:4441:b0:6f6:d405:7010 with SMTP id 00721157ae682-6fd4a12e035mr218799717b3.29.1741096421157;
        Tue, 04 Mar 2025 05:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741096421; cv=none;
        d=google.com; s=arc-20240605;
        b=jUxmWCujJLc9vvsBVHDxHXr5Yk9XyJcgaXdDG2ToxFywxqRmL2u3ik8PueDisK4Ku3
         Xvd0WZZqEgQSxS7JtKZju7djnDMX28D9CLG6n8bGBHoOa2nnYeNVNYHtf2BPntt9EYpu
         4gRBmyFNHKoeGgRzcsFDVIeV9wcrgwIyx/bMCYbKpK+fnP9YshJEATmA9k3y9W7I2StK
         4mSHfPcNc5xBmYSpUSW3DZ6g8k1OxsVqMmioTIn5gJUVnbdrATjyccwZQbZFrrQ7pzaC
         kofhM2r2Ks3F6MKOSPI9f7YFqy2pNRspwTPuJb8XSJY5hoDJyzWiuS8aPKZa78TOTga5
         /iiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B5Bua8Sv8DmaOHigQ+O29Nri5KVliZGRJklBQwiDsTI=;
        fh=qVWCfp5cAbBY0ANV+bV9qYxhaQkocC3pw4wxQ8eVl4A=;
        b=CWYNr1EEqECZSlgkHjzOxzuDFKPLARKHbE1pybxOk/978NXGd9ajaBi8jj3EeIa9v3
         AaBeW5PidJ6zNJ7gkd8gwhf9hexK0wVJT8KsJ/JEfHfMJ+S96SUzbWXxvajMeSuSe3NB
         +7thlPX56TWhrZbUlNTiYI92ENLg4OhHlmCBoZxXgkd8Swf7kKZ8xTy2cEUwrORRd6FI
         QjhlN7TOwGeUQmZwZKJh9P56GkwdQZdCXD7+b3tTcGRwtu6/wbeAhSep8nSTp++uxSOr
         PpDPmuGJw1/SuZKwZHcrpnQcEfIxaRSA3m6gbdDCLfEQFVBMiGO02KMQ6lXh47ovAbwy
         C4yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r28wWXnX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fd3cb9a754sor72602067b3.15.2025.03.04.05.53.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Mar 2025 05:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r28wWXnX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741096421; x=1741701221; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5Bua8Sv8DmaOHigQ+O29Nri5KVliZGRJklBQwiDsTI=;
        b=r28wWXnXt9xngSc7vooX3TLo/fJbDx8drc49w6Vz8G7Exitu+YPW3r/U8sl5YlGEZj
         Yha8BIXsSz7fQGUotV3JI+RMgiMsnM828EOnxsYaKAWiFhpzstJ+rqzxrw5/WzpFUPNN
         hlVvBlytDtbegBx7uwbE+As2bX9KUQsyxOSoUTtOFGa+Ul1HCEpeegT9d5PEMYT/6PEL
         Q54z0Vvnyd60CwqNrFH8U+YP5YCzQDXiXCeZmC6ZfRQsKN3KrNzrlROEzGmSZPnbU/LF
         Nn3YF1fXppueLi+bs8S1p7dQ5pUDBgUVYRyKnlh1Gi+KxbmuhviB0+eE92z1vfLLp00k
         YHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096421; x=1741701221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5Bua8Sv8DmaOHigQ+O29Nri5KVliZGRJklBQwiDsTI=;
        b=PPMxiPJOYsmvHvo1aAx2MN7kYammEKp9/Ve218/a/Q/Ym7oVWauwjIBQMQbDlfYTQU
         z8c1hSzOUVynH27PZmCzAsZEgEv46RJst5JpyOGIksB+orhoYEGezb/UZ7hvMxxMm4Yg
         icuzVM90C652Fyf3VOmws1u1i7Hi1vWZdmYMa9kMMkSULrzbGuRTPbZZHLF3wYYXsqAG
         KdAFbKHp7zK2AZ4bYHJCvVkD/pfRj7cSmKZG1IqIR76EL7y7YWYwoh3uZdTrYAahZOLB
         GCD3jglcBb4Y5bdVCyHHYoD2XJyzKIbmMjw6Gae+rO+8V/0Qy/zwwirZ72UPpPLNMkhY
         krQw==
X-Gm-Message-State: AOJu0Yx9BBICwnPsg8Ow0hpfnRRB533IOF132GR6xZW3Kgb2s2HaKC9H
	7kNdSJdY/n8u3u5APv+5usNjTxsAeKUfjt2yKotXjA1PPngbh7KQa7itTZ0IipJQAjkCnG9U2th
	Lj3uUuzBTuKog5xTuwNojsEE+ZNRw9nzfDtDOea2IBFFEuKPhFE0=
X-Gm-Gg: ASbGncuy1CxoUBbXkdqAg72xWEGkuhrEfhu8rAOkUXeg6/noHn4fNoeo5d4fqFXVdFt
	bNd5PeZu/OsjkT42d4cDgFs7duulpLnOSlfq+v6nH6kiNP5NsLf6bFC+Z59xHRCMpXhvFUgWUwv
	GPVz1oMlrVeBRTxqwZA1EdmlOQfnw=
X-Google-Smtp-Source: AGHT+IFPt4oMxoGtAFg2NbT2/mX+2dkabA5s11S/572DjqtK/l5qXv12HppkAOhlmBs/T2rLOjIywFBAftADXutUp1M=
X-Received: by 2002:a05:690c:4801:b0:6fb:9b8c:4b4f with SMTP id
 00721157ae682-6fd4a1516aemr235229897b3.31.1741096420787; Tue, 04 Mar 2025
 05:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
 <87o6yh57r2.fsf@draig.linaro.org> <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
 <87ikoo6hbm.fsf@draig.linaro.org>
In-Reply-To: <87ikoo6hbm.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Mar 2025 13:53:28 +0000
X-Gm-Features: AQ5f1Joo0UoM_orNX6t55Axb3MpVw2jcjqvIZ3Ahf6Lifwi1gUS_Cg3vh7193OE
Message-ID: <CAFEAcA9mFHo=U=F+7on-9m+VWh_b2rQXtEJovU3fuj3MZxHTyw@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on sha1.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /njgeuU8LEx2

On Tue, 4 Mar 2025 at 13:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I think it's new-ish (gcc 11?). On the other hand
> > -Wno-unknown-warning-option is quite old, and would suppress
> > this error. If we do
> >  CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread
> >
> > does that work?
>
> Yes, I did:
>
> modified   tests/tcg/hexagon/Makefile.target
> @@ -18,7 +18,7 @@
>  # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
>  EXTRA_RUNS =3D
>
> -CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal
> +CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal -Wno=
-unknown-warning-option
>  CFLAGS +=3D -fno-unroll-loops -fno-stack-protector

I think we should do this where we add -Wno-stringop-overread,
not just for the hexagon tests -- or are the tcg tests
guaranteed to be run with a fixed compiler from a container
regardless of the local dev environment?

-- PMm
