Received: by 10.182.158.201 with SMTP id ww9csp573233obb;
        Fri, 20 Nov 2015 08:17:39 -0800 (PST)
X-Received: by 10.31.58.74 with SMTP id h71mr156288vka.149.1448036259639;
        Fri, 20 Nov 2015 08:17:39 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id d4si129238vka.175.2015.11.20.08.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2015 08:17:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by vkfr145 with SMTP id r145so612813vkf.0
        for <alex.bennee@linaro.org>; Fri, 20 Nov 2015 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=O20lFu16MKCRo5WYzA61snVs/gz2gUTNROlVOZniebo=;
        b=Jb86F5tXlmsBSfQb74At6wheHTyEUVYs5qtHujnocJYbeUfvTOp+hF943cVujFecTy
         MIDSZkaIOhBLAtfu3jZS2V9R6JDGysuDdr57N+Q3lF5tRmbE8NEbs/v6ae1b0KgtkCpF
         5tZmQaE1XblgrNjvrgpDLHI7EBIzuHdT0s9bZrGfNI4aIrMnp1d+z3xWEjIY5JrMXeVE
         2a/Y1zZ6qTJwfJnZJQlTIBQD/n8sHtCAzcgB/vZwzVl45NJHWJTV/HT7irM7SsgstKJA
         zOYSHPxWCUrk9Gx8dpyrR7TRfsTyfVj1zWb4WW9yyZCU2Fk6gBMd2tvun/rs6UpTtTus
         VCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=O20lFu16MKCRo5WYzA61snVs/gz2gUTNROlVOZniebo=;
        b=SWHk9SwZRbPLd5B/P5H7x6SeRjTyuYJNbSrcTirL9c8Zh/54gn/blpL/Mvb2RyvQ+Z
         k4hF33ZAdmA0LjMkLayi51uHSuqGRKIoxrsJ1BuUdnZK83DkJpLaBdAzs3XOjS7IU8j5
         FCnhQr8RtFa5RgEK9JX3f5UzbL48iSd7RbINza5cGZddcbpQZ7Sq1Dpt5q5qiqa4CQWU
         3Oc13LRxGxc+YwWjIv58cwn+JQGkjRc9dyajQQ50hNILN3Z19Q9Xmt2YZJjLwHuFZBk2
         W0lY+qP2AgSh39bExU9PePJ7QebqwcTHwufznizB+xR+CWjFNS5AilLEvhsErauOGjSd
         5Nmw==
X-Gm-Message-State: ALoCoQmbnJwmjkt4Cn3klYwgbzPQs40J5LTsOT7hs3dzdtp8zYG7onppwnooQM5ws7v/9nixvJix
X-Received: by 10.31.131.201 with SMTP id f192mr152844vkd.90.1448036259272;
 Fri, 20 Nov 2015 08:17:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 08:17:19 -0800 (PST)
In-Reply-To: <1447345251-22625-7-git-send-email-alex.bennee@linaro.org>
References: <1447345251-22625-1-git-send-email-alex.bennee@linaro.org> <1447345251-22625-7-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 16:17:19 +0000
Message-ID: <CAFEAcA9q1MpiM4vM+RH-YQ2RpB=eV-Xgyw1-yw6qHG0hbem6_Q@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] tests/guest-debug: introduce basic gdbstub tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org, 
	Christoffer Dall <christoffer.dall@linaro.org>, Zhichao Huang <zhichao.huang@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex@bennee.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xgFkH5zrr0BC

On 12 November 2015 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> From: Alex Benn=C3=A9e <alex@bennee.com>
>
> The aim of these tests is to combine with an appropriate kernel
> image (with symbol-file vmlinux) and check it behaves as it should.
> Given a kernel it checks:
>
>   - single step
>   - software breakpoint
>   - hardware breakpoint
>   - access, read and write watchpoints
>
> On success it returns 0 to the calling process.
>
> I've not plumbed this into the "make check" logic though as we need a
> solution for providing non-host binaries to the tests. However the test
> is structured to work with pretty much any Linux kernel image as it
> uses the basic kernel_init code which is common across architectures.

Do these tests pass if you run them on the TCG QEMU, just out
of interest?

I'm not a great fan of tests that aren't in 'make check'
because IME they just bitrot, but as you say we have no
sensible approach for handling tests that need to run real
guest code :-(

thanks
-- PMM
