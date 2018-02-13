Received: by 10.28.71.27 with SMTP id u27csp1351239wma;
        Tue, 13 Feb 2018 06:28:05 -0800 (PST)
X-Received: by 10.202.9.23 with SMTP id 23mr837224oij.243.1518532085663;
        Tue, 13 Feb 2018 06:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518532085; cv=none;
        d=google.com; s=arc-20160816;
        b=1GohKfxvLT/JtfgblUR/+lfjyHMy3bfhIHTh+j/sNMNsz2FC3OmSuH8Q+xWKSl1gKE
         x23C2ri+hUP+z+OTKzJC6B8ohPBC3kOkbDUCtIMye9xrcJM1UyZMI8KXHX9HJIbCKALq
         Cul/QUUiB/reB5GtGSS42N5xb44FIluJWT2XKsk/HanTWYrN7D+fSVq0gglBT8HmlADD
         6w9qVGynoH6CLPiR2a2OiUMouV/1zVzMq2Gi6yhiWVhNqVUg9cBBcku6emTJszIXksns
         NSzQFMc4uPidGqK8J3ZnBEo00i+PJdSk316qHv1S4LHUGyJUUaMVBQjjfZ1FxjhhzqNo
         ZLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6sPFnvkEtES6Vy5jlWt361Gt8ljXxOKZr4tlDOybstM=;
        b=IDkVA99nQ5ODj6/2Px73Seuj6xRwJfZbiWW4tTAl54WIx/b1AIBpIHIv0FvU38Fehd
         AGUapQSZySqfHq72o38Sl1ADqbn618s6Fln8CvHbkxVLaH7lAASgxVS5/fnwuXFO+IK1
         3RkDSLQKCQNAdtAw7qaNnJ5tUha7DGSbR0jUsTxZ34ZlBcNnkyLER5ct8MPffTJ9uZmH
         /96cc13FAnhzpWhc3ES//2yY4Xpr3zRLQA+y+1EX8HB6tjI6/ndU34APp6Yru3Q35R4K
         YL18q6woCVlW2OamUeby4VghETlzShb2pYUNcHUrF1Mb6g702svjSnh4aYrNKAJfYn/0
         n5zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjrYYm2C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r16sor623987oie.39.2018.02.13.06.28.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Feb 2018 06:28:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjrYYm2C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6sPFnvkEtES6Vy5jlWt361Gt8ljXxOKZr4tlDOybstM=;
        b=VjrYYm2CDt9IZ3Jn72SOhAmkhasptnklNvC5yo/9oeBUKo+VsTYbXEpV2i4lWTClPL
         4wJ10iRfUqo5zz0dF0QJ75bdbCLLEnw5M4FI2jHb1HdwaVCG30uIDpZDhh1CGcjOzRUX
         Zv5X3rp3/rzleEb+QsDhrzhRsXdS7zYLZ/ub8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6sPFnvkEtES6Vy5jlWt361Gt8ljXxOKZr4tlDOybstM=;
        b=oa8dn4qzO79McS0ek849qdVDYCakcpxs2R4Q3Mbvs7c8G1EEpgljkefQq8kNkkaljL
         vVKYWtt3tm1SH1FVsxsKIfZQixmcNnzUiqDjJuLYjKK4U0bxtY1sjN43Uy5VAwcR/Dqv
         nnAvBhYuAsaw0WfiOKMtLP/8rGlE4PO9rqvKxRtwIdDg7IS+NKZaiCZseD0Ecv1LbQ5I
         B6l2mM9VNXlQGzS1rVK8IP8q4sWYV9extWQKTlNMp0SSFHHgtS3AlveCjBQJEeC8oIYp
         ZaKX1GqwvHNAQZn8x4rqoPf8WGefR0rgNxbED5wdz65rncE5S4wIFeUh148iPenhT0Jo
         2acg==
X-Gm-Message-State: APf1xPBFqrBKfi13rjvXksvVmgiWPeRoGyIbLJXZfJ7HCRQzqwrzYQ7e
	G+paPHT7xRQ5Lwa7xAFs3uPlXVb4WNEN0JQ2fLvYYMQzaUE=
X-Google-Smtp-Source: AH8x227E0wy+//gp/WbQp6jTtGn38xJ1naeo+o3m+rys71nZfJ7khAaW+OeLkPeEIdoFrZ3sIchmrpV2cmkBqq89x64=
X-Received: by 10.202.173.11 with SMTP id w11mr924097oie.299.1518532085194;
 Tue, 13 Feb 2018 06:28:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Tue, 13 Feb 2018 06:27:44 -0800 (PST)
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 14:27:44 +0000
Message-ID: <CAFEAcA_vCRm++BENWKPVVfwd25cc7AU8-g=7oe-HoPfMhNHGLg@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/32] Add ARMv8.2 half-precision functions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: j75uF+3YA5B8

On 8 February 2018 at 17:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Hi,
>
> Some of this was posted before as part of the various partial patch
> series when we first started messing around with FP16 in softfloat.
> This series is now just the ARM bits and expects to have the V4
> softfloat patches as a prerequisite:
>
>   https://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg01330.html
>
> Alternatively you can grab the full tree from:
>
>   https://github.com/stsquad/qemu/tree/arm-fp16-v2
>
> I've tested with the following RISU test binaries:
>
>   http://people.linaro.org/~alex.bennee/testcases/arm64.risu/testcases.ar=
mv8.2_hp.tar.xz
>
> And of course I ran the original RISU tests with:
>
>   -cpu any,fp16=3Doff
>
> But I guess we really just need to carefully regenerate the testcases
> to not include UNDEF's which get added with future revisions of the
> specification.
>
> Anyway please review.

I see Richard's reviewed this one, so I just had the one comment
about feature flag naming. Could you also fix the checkpatch long-lines
warnings and look at whatever the problem that caused patchew build
failures is, please?

thanks
-- PMM
