Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5347531wrp;
        Tue, 17 Sep 2019 07:56:04 -0700 (PDT)
X-Received: by 2002:a05:6830:457:: with SMTP id d23mr1895109otc.315.1568732164028;
        Tue, 17 Sep 2019 07:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568732164; cv=none;
        d=google.com; s=arc-20160816;
        b=rgmDyihv+b6uqqceUYUHaXrgl5YhpKIi1Pa9Wi8HFXsL2F4fzSFkg1ix1B3Nu2/gxQ
         ciRDfeXCxdbL+GY3c3ve+TamKTX5eiNy8jCocXJrfKlkbW4QUbBqrwvYz51LMsW0Csfk
         3hjFUELynhJoK6BAnC7ZuBgmhZlbQ+xXMRXAXBdTlyZKDp1imRVR2uB5e23jUhwVk4Yi
         wr2QbPVP7+zxGGWIiNWUn6MUImBmvZle+/a5qt+gOq8wdFr40SxQSJ+TssVThbKXWdgG
         rIsRO/WRbkKT+6vKEZv7sRhkYyKpWBR2mKug1yO0HSTe+52pPsj3AWNJPg4koLx1BAGL
         9M+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eLm2QeF1/m+eqwXbDIM7DWhUgryCHkwjXx1QVGlNf+w=;
        b=ViOkyjjN+mHifMz1yeMpOfVHs++tMbivRB3HxMLXDKfu6Hvmvp0HqVzp1jsSc04mTo
         egN7pgLc1chjksh5mDeyi0u4a1vrOz0GXoX/j+t8GyNtjLN2VloNoF2a2i1WpLvwACp0
         IRFG6m3pXbsLcHt6rRG/OuwXtqcbdLjgzvMbbdz/ccLHowJ9hcHXAfF08+Ck5NmzGxYi
         av5povTOjEEuon0cg223w96AXKEnl4kh7O5hZxvXn86SedoD6RGpy90OVSiiEG4eWba5
         d+hpl1Tk/xPEJdP9o+0q+0vj6NRQn+VxC5zsQYYJxgNiqDRDAgKa3W21NU6T8mf4aFo6
         cbGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t9bAAp1/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p130sor1257767oig.91.2019.09.17.07.56.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Sep 2019 07:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t9bAAp1/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eLm2QeF1/m+eqwXbDIM7DWhUgryCHkwjXx1QVGlNf+w=;
        b=t9bAAp1/JUoymdaiQIsYMizHEZQQo0c+ADmtbBVRI7MzR/kxyP+PTa7Tx5PgSqqUyx
         ym5q5MrmntVW7APL5eQYHRa5ZtB9xfSNXaduAm+Ou/jVqp9KZink+SXQBfcQcQIUH0tn
         q30oni7h0PjWirZ7Gi69gMqkCROkQQHy9PIM2/0aDfVi8Cl+KA5eW9iY+X8tvgrazh/0
         WVEH5zWDvXUOzRMho66XfgeUr4/Hg3EscfSg7MNHurTsc+KgScao8RyX3YzLnJZBDZPT
         /Rl6Hhaom+T261dS4Axrw9cwHjGAQnlpTiWvM8mEbMQwV38AtjKe1h5PssJjEKK87rvd
         0gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eLm2QeF1/m+eqwXbDIM7DWhUgryCHkwjXx1QVGlNf+w=;
        b=fsM6oTcY9QeHN4NOLiKc+iDDAn15U2p4DPnb1rgw/PMfVpUual+O6BnffmQawoSsIO
         8cLHAW30K3j+SgosMCvNIC/KZs6oLEU29QQEwslDTbH0XRJh9hebHInwtLpdQ4jFcWm5
         QkOCM9tO5RtEb7WeQtG8d3t9bIVN/HrDL5OSASB1cDRUjwoBoIoiIlQ2GFZu+Yv7iZKv
         lXx08DMbH6LzAiXHOtysWLU28LSsVt66jM5TcsUSv59HhT4GeWIYK1s1eJYxDw5EFaxM
         VSXqxIZYzx96zXFje2RzWTBnrM8Lyz36pvYQOfv5D33clJuMezyse5T1lE+VovPfqYq4
         HSKA==
X-Gm-Message-State: APjAAAVLJwTcMRB7/t/nzVfkMi2x2dHS2ut7h9UjGbZVPekw3+OwTQKm
	cXqbUoSBSUcpzJaSvPRBDYQnzq9+sjWu4bWm2RHrmq9lEIdwtw==
X-Google-Smtp-Source: APXvYqycYtym/y/O1Wair0bt+m1kCWcIkgxq+A+RjUXWhMdQyTWnsYZgUCtivZx3hw/g+OkzxcZCUAq+zwlaz040x0c=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr3800256oib.48.1568732163090;
 Tue, 17 Sep 2019 07:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190913151845.12582-1-alex.bennee@linaro.org>
In-Reply-To: <20190913151845.12582-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 15:55:52 +0100
Message-ID: <CAFEAcA-bTRJQDRFandUpU4jA8Yw0+SQc35uYPbDHZTn4srczBA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] semihosting cleanups (plus minor tests/tcg tweak)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5BzKEqva2jzn

On Fri, 13 Sep 2019 at 16:18, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi Peter,
>
> I've restored the #ifndef CONFIG_USER_ONLY check to M-profile as well
> and split the linux-user semihosting smoke check into a new commit.
>
> Alex Benn=C3=A9e (6):
>   tests/tcg: clean-up some comments after the de-tangling
>   target/arm: handle M-profile semihosting at translate time
>   target/arm: handle A-profile semihosting at translate time
>   target/arm: remove run time semihosting checks
>   target/arm: remove run-time semihosting checks for linux-user
>   tests/tcg: add linux-user semihosting smoke test for ARM
>


Applied to target-arm.next, thanks.

-- PMM
