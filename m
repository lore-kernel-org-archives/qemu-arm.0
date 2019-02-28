Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1152260wrx;
        Thu, 28 Feb 2019 15:29:13 -0800 (PST)
X-Received: by 2002:a25:2a4f:: with SMTP id q76mr1885877ybq.126.1551396553770;
        Thu, 28 Feb 2019 15:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551396553; cv=none;
        d=google.com; s=arc-20160816;
        b=PDehkWozAOXBe3M9ueFPsaYqF9zms8lW3kPZG8max0fGk8FAidj5ennrNP9EtFzI4x
         S+t5pwLtt+Hj6P4Df33ZV+5rKlqduZ236jPY89AE2/7+79IGfUEvH8uXUK1d30siRjbM
         Dw6vX+aLYkuo2u2Oyx+cN/OQ61FefGjWuLqOKPzgxGAXVN6c0dfIic//Y7WwfYLuAnjq
         V3a/zH1pkysE939D+scI2uWE+Ji80XcABuZRlUwPV6c+vGdgpKIZdTGflAx3U/YIaPWb
         r74mKOmtzUOeioHR39wmZAa4UmZf3dzVYuWDn4lleUqRC3CnWmR9HKB75L2WG9f7ukz3
         y/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gR0UPCyljKKkBPMA9B9uYfNW+FxUIXGUC5FtbllUgmU=;
        b=g1E9rSIyonh/MUenBZi2DZuJ7HVGtG7/VLUxHPgQM4HbxaQxe8kTvuobE9Z9EcECJO
         /10FWS20T/wGMsf1S6DXsYRqvj6WFCu+HotF5+JNeThljhfiGNP9tJQHo8LXgy8XWeS6
         VfwqLkGNo14s0OzfN66451nsv99vVqMMhTR1Dj61xjPz7mRXbeDZuGOIX0M4bubnv7ty
         uB5lJNlOKaxcXPGc+fRvLB4P+aX1582gc5jyAwyUfmpHK//ZEcERSkrfwYGOnoXo3lW5
         43Bvx6y4CYKbKo3rhhWiJZtsIWpQdPXRUQ2uGefQvlrVNoiQKzbmhGjSRLuZIQ4mI828
         04CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=siTcQqbG;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c126sor9048704ybb.140.2019.02.28.15.29.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 15:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=siTcQqbG;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gR0UPCyljKKkBPMA9B9uYfNW+FxUIXGUC5FtbllUgmU=;
        b=siTcQqbGLC0PyZueAnDOMhQaadW1d6vTlwGBGDSZJ7hJ+Hpzcg0fQOun6soSR9ZEJK
         RcP8KssjHNp9En3o7ywBWhN3lb9VhlSwUWnJZlA9wIWEO7GKTDWpKhhBibCUd2TQVPn9
         wZdm5yk8/6YAux9OUmZZUR142WRIYiWlwcQ/mlb8uFd7evsIQAdTZ4jc/Lr+OYKXr07N
         WTj/UczQUNOWAwsqB+aq0ZlkHVPpKQFtg+9kAlP2ck0DCp/QT5qXQ0CjSZkJMh8qV2rk
         OmN10ambWXXoYyP4y7mbpohR9i09M7myZDS0si/7rpErp7IXN2mfdnOLXoLPvoV/LeIB
         iTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gR0UPCyljKKkBPMA9B9uYfNW+FxUIXGUC5FtbllUgmU=;
        b=Um3gDOsCxYX93oV0ZG5Gv8svBqXDBPT6oz5gKV/ARFG4Tt6DFlXnLz87feV7F6iD+r
         5thINfQtpM8XggBWj8gfIThbJzxrgMpegJ6Y0XwiSEPF9yO5rXocuUOa3E34Uq/zAMfW
         5pNeyQM/zkiOPUEaLCouZLOObmzXhdZ+ITyzgkh7ii7BKgjIRigIM5CGAvdptB2f6vY2
         QnXyKm8JOrnwwejw8jJRI4IaBvZKglHQzK67aUlp5Dpbt8ihpb6+wZyZ9O43DaOmB2Db
         +jH65Kf5meqC8C9Ux0/soHDtNyk8InVTeCm3j4yShKScIvBIyVN7+ahHu35DwoihHYW5
         fUdQ==
X-Gm-Message-State: APjAAAW0FkdDMVP1hKdfKx9vCWrKdw+LHA8TwnVt2AEgkkEVpvKKQqfw
	0jzgCplHFVMnSiC33srbcmBdAe32V0KiG/vxZSNK1JZbWQQ=
X-Google-Smtp-Source: APXvYqyQD4Dr9XJCw36NWw3pppWtxD35imw4L6DpPS/fJa71+4RaaR9uZPaSYYnJg982++wkbZn4QICvSdpJE+4pHlo=
X-Received: by 2002:a5b:887:: with SMTP id e7mr1778898ybq.452.1551396553256;
 Thu, 28 Feb 2019 15:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20190228202537.4638-1-alex.bennee@linaro.org> <20190228202537.4638-8-alex.bennee@linaro.org>
In-Reply-To: <20190228202537.4638-8-alex.bennee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 28 Feb 2019 15:29:01 -0800
Message-ID: <CAMo8BfKw-ewHXQPfz6XDFBqoxPk1vTGaEhjVEdKLm3-diuTUmg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] tests/tcg/xtensa: enable system tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NmQWvo8FimBm

Hi Alex,

On Thu, Feb 28, 2019 at 12:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

[...]

> diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/=
Makefile.softmmu-target
> new file mode 100644
> index 0000000000..1a4014506f
> --- /dev/null
> +++ b/tests/tcg/xtensa/Makefile.softmmu-target
> @@ -0,0 +1,40 @@
> +#
> +# Xtensa softmmu tests
> +#
> +
> +ifneq ($(TARGET_WORDS_BIGENDIAN),y)

I've recently posted a series that makes it possible to run
TCG tests on wider variety of xtensa cores, including
big-endian cores:
http://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg04843.html

--=20
Thanks.
-- Max
