Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1148957wrx;
        Thu, 28 Feb 2019 15:24:19 -0800 (PST)
X-Received: by 2002:a81:7a04:: with SMTP id v4mr1364882ywc.410.1551396259040;
        Thu, 28 Feb 2019 15:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551396259; cv=none;
        d=google.com; s=arc-20160816;
        b=VCAmw8tvQGo8JlMwwhwdaaY1nRUCDf7XZcq4UdUrrFZ0TDxyVUYEn78iWAQj+hC7d4
         rswa4l7epNWwZ0rKUWQ/Sywk6J4EKeitwZaRVSWkYfPVKmaOnruJQPQQj9YSyermlIua
         FL892fRTEWs+OML8Ro/5HGZVJRYA5SEgg72V5kaGF0TgCS5/Q2OsfAWUxXtygBxc2lVQ
         GCZHpqQdHrWRdjpnfM3YppgoK5zA98DPYiuB5b1R8nr6JL4RPSDZZYahXBMwuo/M1/AD
         AujGDI5EdJDSlzidrLovfk9VPFrYPC3Hg1GDY7z+GcIKbr6sTtSsSjIGIqyYrbE6IAzF
         MJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecqNqYuel6F+52FGkYyr+31FyYAt9r0IgpPKpAwPZ1Q=;
        b=vxBV1cTsVz5Z4YdKbGyydXhKnVOCZOofIlIwqEWZCQrV+vi4tW1MRue5XzMZKadn/I
         5raL0xiqjN4eX1D21rtqXL+HTRPZSrvIg+gMFWR0olbF2ypNIjykNhlnpBmv+2/PnWZC
         wVz8V8Wm3plKMFMYVqJUK/WkIwxJQQwPhNZzUlZHb9S0QH2hHXTAaG7bro5E+yNWNt/w
         K/LtZdCYcmb2U/wcXEHJLPjgH/MI2INDDoPGPEK2ehjQtcEhFLi27NmKJHFMO+l8PB+F
         bDLvCrfB/d/mP+kZVI0XnCW/wrUQMQWp77gdREbjXxItRFt0lzRqeE/kmLe/aQzuUDeR
         72UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rELL14x7;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o137sor10714225ybc.23.2019.02.28.15.24.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 15:24:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rELL14x7;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ecqNqYuel6F+52FGkYyr+31FyYAt9r0IgpPKpAwPZ1Q=;
        b=rELL14x7bnI3HNEVINlB7AJeVKSpNnmQH3Q/uzomVzRuiGhpF/pBgCJPgknvLAH9ao
         IDskPzmI0IFcPD1yYtfcZZDQ2v8tQBZVv1YO8ulDy/UE0ZEL8VV1hn+abi2czDWQcDXK
         4DWPvYskB+frA+88/7nPKqjVS2u9RPaJbou/fiyowh8i2FHSBSUcfPD+6llD1Ck3aaQw
         chYtsYX7sU6h5ymDNLwk9fuiiPfOohUxYbU2B3oT2UgEab1BHIlsNoNjkJ8pCD5CxxoN
         WA9lDCdCfcqBxu6TEN2uR/Z6PhCHevxMvJ8lAeVZdYSgud85F1QdARjpQmeWAibtX54s
         QRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ecqNqYuel6F+52FGkYyr+31FyYAt9r0IgpPKpAwPZ1Q=;
        b=rHvbz3mIy950IcFouqVRgvjt5p3RXLGDSWZITOSdolUlHzNFyDTPDP2IDo/cp60/Qd
         0CuqN/Bt5wjQbRMeYUlaNtZuDItMQ3gPM11w8ryhQ1sIvpST+sa1Y11mPtAKmptdxed7
         aJfGjetu9v1CjokhQz/51azBCCiN7XwzGIr5BRtNVXS5caorrk3di+ymBHQzpzdtQSuC
         tt91/r1AQnR3+rym1QWG1CvvmAzSlhnkTQwiyBjE847niH99PaFgiD76ziztXhAyLm79
         jTi1k+znt79v+cmUovqUlk1fG7boO1zsL2w1Iq+Gf5KLDaxP9KpO+7dYKyevg3gPYYg/
         YeEg==
X-Gm-Message-State: APjAAAULYWwd/MFS7G2csmjBC9MAoK/5HNA7Kwetu3tNAasK6dn1HEpc
	iveo9SYkPpHcNSQ6AFxU8cLL/ZXuFVGa+UO6G80=
X-Google-Smtp-Source: APXvYqwzHHQWpI6bpbYZqx/+D0k2RyICFlStjf9YKUgGhIdhRN2GZWYsk2JCgr7SDV4MI9MqOBAGgD6E4dRvH6/bO8c=
X-Received: by 2002:a25:e64d:: with SMTP id d74mr1856170ybh.399.1551396258736;
 Thu, 28 Feb 2019 15:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20190228202537.4638-1-alex.bennee@linaro.org> <20190228202537.4638-8-alex.bennee@linaro.org>
 <71a55c0c-3c09-edea-82a5-63fb0cfb4f12@redhat.com>
In-Reply-To: <71a55c0c-3c09-edea-82a5-63fb0cfb4f12@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 28 Feb 2019 15:24:06 -0800
Message-ID: <CAMo8BfKvQZyp3ri356LoqCDhsFszU5proLGH2MBbBi2pgRZ4rw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 07/16] tests/tcg/xtensa: enable system tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WP4aqYEU9eZH

On Thu, Feb 28, 2019 at 2:54 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> Max: I think it should be quite easy to port your simulator to Alex's
> new Makefile.

I agree.

> BTW is this simulator downloadable? I see the Zephyr project also uses
> it, and I looked for it on https://ip.cadence.com/swdev but couldnt find
> a (public) link.

There's a site https://www.tensilicatools.com/
with tools for various end-user-programmable xtensa cores,
but I'm pretty sure that neither dc232b nor dc233c are available
there.

--=20
Thanks.
-- Max
