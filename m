Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp10512327pjq;
        Thu, 11 Jul 2019 09:17:48 -0700 (PDT)
X-Received: by 2002:aca:5241:: with SMTP id g62mr2843006oib.41.1562861868525;
        Thu, 11 Jul 2019 09:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562861868; cv=none;
        d=google.com; s=arc-20160816;
        b=o6YcuSmJluSr9oQ+1GXHSBvCVLzDIo7j6qxA7ey5PMuLOg2F2PZMLb7QYXGsK2wdVs
         OXZm/PsuEpTaHWd7jF6lejnVed1tG3c0HENfCP9vu4B26nP8fDiaKl8/OwxUT427GSSO
         RcXYhiwFzzHjqHRBNqA4nT0H5vXio7g8ruOMuWqc9C06Tc6HhxUJ6RceSajm1jqgGnhK
         xkUOrJakCRyTL5hbqGU1rNLcXTT9OeomkbmWba32FZbKxh4fEwuJsxxUlZPsRz86rkcy
         vEcBTcHUwM4R4/uVNjNlajh2COZ3yEN58iWbKIGJevZWdPT4z6JSEY2Bsg4MRj8f/rfT
         V7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FCKngx4dtGAfj/9myLFOKe04MLdj3WYgs0CuFoIzuy8=;
        b=vvF9PhT+JkFmKmcy8F4gJQ/WD4mT13Rdk1bX1oT/HEFjM/HA1StRDV3wotyJ6fuN3m
         1axGEYuvEZckbxezn1fkvFJim9Lwr3k+ZsW/vjTJm/h9TUVdOFCgSKWnQCwbLHpseanr
         oHdwR6OBD4trk/PqSePWQbQiCzBnutk3P40bDvCuH6WNbc8Aw/LCuZXENLtAmdLEuFKf
         lkgDFM6DuFhdyzt0nIUYUHbopXNwdcbd67/iqoTOa9oqmzbp5EXtwyvXh1RmOi++LxEY
         8dwZxUOldiakVSxgJG+jXwPqaQ9QyOxsDge4hM/Zik/4W19rlmOUSkoEnbzbMWMSfo1z
         eY+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+R1PzpU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l138sor2957932oib.104.2019.07.11.09.17.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 09:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+R1PzpU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FCKngx4dtGAfj/9myLFOKe04MLdj3WYgs0CuFoIzuy8=;
        b=h+R1PzpUeNTzhFF074BleaGRr55cFYu5nVcAObsIAEuoxxdmKnb6ZK2j9GigJ9oP6L
         6xq58h6+VuN9aeMkHzFVSg1tf+KnyYKHvB8NiD5+UioSikTSdQufclOjOsQCiHQNsf56
         J+WlxF6wZewW7TdjCi/kZLzye11biReZx4EJHO2RRaFHK7RbBjlANBH0YOnoKcgZWNUD
         /hpLHQmHLCV5AqW2T+TCmc82qOmpcKeSJmbgyK7oVpUPxIytOL+rjR/tNp+ny5UFYVvw
         bnmn+lns72Vv68eclP21U2MHyk58N8ERE/fb/RoHW4kfJJ+OPtpf6svc6vu0L3mKwoR4
         pxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FCKngx4dtGAfj/9myLFOKe04MLdj3WYgs0CuFoIzuy8=;
        b=d2m49b2T61q3ptbQIJm6firYEccuoIIfzj6Ne4Ov1adOnx4nq1CSfqF5TZ3QpOdVXs
         L4xMmEJtWlM0h5LqZU5TVisFT6E29KNpy+WpFSGj/GvO/uU2dCXKQNWO9z12nlZVm3Mt
         +2FfuSj0/+qlAUfJYV0lPQZDXgG6iWVUwY6l/ax2iCwB7Ot0M6lcMo45HF2JtJdF4j8/
         r19i945JEyS2722NKYKtNgE/QuMpwur5r7NOHeMLrNaSwrOzOWfn3xfIHmpmbrxTkG3f
         4cBF1FCnMi/a9rD33lQjbOQovFahp3K9i3qJx3PwWnVEdc84YzD7SFJ2MujsLbJab/dK
         saYw==
X-Gm-Message-State: APjAAAVF45B+CBKEhLJNE68HNP2R+c2/yIylNPGRHJvF+8ZqVd0nIMas
	PYjHh6BvuuSxNtnxoDjcJ5Zhl5mrK/9dDUiAglqkRdSe9VgGxg==
X-Google-Smtp-Source: APXvYqzUsW3gJjpqQLGTvAy1Hla2/kheGtIu4zGE7VdqTAozNdrzrD5WC3tBhD1yvEQjNrh1/31bZ/kNFw1y2rH7pHs=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr2859587oij.98.1562861867984;
 Thu, 11 Jul 2019 09:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190711135726.14191-1-alex.bennee@linaro.org>
In-Reply-To: <20190711135726.14191-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 17:17:37 +0100
Message-ID: <CAFEAcA9AVt8D9d0iYeCUbT-5UtSwoMy9bra2w7qRoihhBNUuVg@mail.gmail.com>
Subject: Re: [PATCH for semihosting-tests] semihosting tests: add v7m tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: udRloEi/+i81

On Thu, 11 Jul 2019 at 14:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> M-profile has yet another way of triggering semihosting calls using
> the BKPT instruction. To support this we need to add a M-profile setup
> so we use the nice and simple microbit model which has a Cortex-M0 in
> it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


Applied to the semihosting-tests repo, thanks.

-- PMM
