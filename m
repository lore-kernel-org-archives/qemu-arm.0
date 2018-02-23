Received: by 10.28.71.27 with SMTP id u27csp895775wma;
        Fri, 23 Feb 2018 10:12:25 -0800 (PST)
X-Received: by 10.99.96.66 with SMTP id u63mr2141247pgb.49.1519409545736;
        Fri, 23 Feb 2018 10:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519409545; cv=none;
        d=google.com; s=arc-20160816;
        b=r/xYEg/DlOF10qu1hP15pd6raXxhpi1Jn57Eou/IuR7GmtVQGLIT/oD3A2CwOJov2V
         FB+eWy5stAwZs7M1hEVX5Kbuw0GH74DNZkVAcwQCUuO13cuc+Zw7H8sXbI61Ji8pm2tH
         /Ktk4bgiOZeGIw1jpI2GInAAe/zeDLvmEOdT0TSBpbykHkhc6YmOLHUCV3tT6fV4o1uF
         0hWvxMVzwUI36XFd4tenmaTAzlKVjtWYMpw10Q+5KehMDkPPgRcEs1u61wWKpfqVzNUA
         QDS2qoI9NP1K1+b1QOOR2ve/qPbwhVOVX/RSmVogKWAtEWi3DhphN0KlCXWlCmyGlHFv
         vlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fCjPnhxM9iQI6hyMUPlc9WLX4NTblQ3k8wexbm9cDnM=;
        b=f3+uNtNT2XEKO6YxpbNgshfuedYMiCoS08TMZx9/cRriNMre9r8Uft8M2GUR750BSP
         46Camd7gzMHhAj4BL5ofXuZTVBuv909ilN2jxmrgoEqhfxYp/zx/jxnvTA61nydl2tDS
         YEeass/gqsucfTqrilRACZjKvUFyzBOI1o1xYqwwECq+tqpkhmF8bdVOaSoMRFk4Rw6o
         dR1IzR65W3sv0AGoJLLtnLOgAyL7AA2NMOCS/Zv0hkAf/emLGkYtTPBZHOCSOoKHdFlA
         h6JKGV6uMZWRoaGeHugD32HruJeB+le27PvV+Ksin0JrUmTRt3f6BvinJG3nOlP2sz5O
         chVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACx/CLD9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u7sor357346pfd.105.2018.02.23.10.12.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 10:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACx/CLD9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fCjPnhxM9iQI6hyMUPlc9WLX4NTblQ3k8wexbm9cDnM=;
        b=ACx/CLD92b6lbqyxc8JwPt/LTwlGd2OAPUI6jU8JZVyn+j1LWygRsh8VfEHhkMreVO
         kP2JFY+yeOumUwZxzd2Vn9ql00CIBkgSiJYSNPKPqyIEuiJkKkBZxxfQq9YzxvIlQ1IV
         WsdPj0G/TheR/N2/aHaDewDYqaQWKbvJY+W/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fCjPnhxM9iQI6hyMUPlc9WLX4NTblQ3k8wexbm9cDnM=;
        b=WHAo0/dHDjGKHeGOYK+2MsobVdZBlRWFDGoG2xbsSNOC99lAdjAO9Hgb21SqGRa4Ar
         hpUHBktvolJnVz9ndd6UQMVSnwFGAYh0dU74kQfcaJYtPPw7F20+4VxxJpit7t60HZYp
         XdJ0xWWgswI+xauW90Dbhid9Zw4tCnY/LfxcR6Ro5/IZvx/5PC4XXY5f6JlTPy6CkrjK
         EPRgeKMiAwuHUZvxVFVNu8b3daBqfUuvJGl8hhY5BeydqxNX9ovOT/AsIP76yGkgzRd0
         b8RDe6VZnr5x/xnj0YDh47d8PCN0qk9mBXa5ZDqJQ5x7LSCgy6lpxik0VE8Om4CFpfsN
         Frsw==
X-Gm-Message-State: APf1xPBgcZlZAqQQx29o1XWPvvddB2jhANvbPYWg6zrxTnnrYT2WRQpq
	Yuzw2kwmYyUM69mJ2zGW2HJh3LU/+hUldykN72wHhYUsRyY=
X-Google-Smtp-Source: AH8x225voVAntHdXgS7J62XcVoYb7TrFWG26KNlsP3zzKYBGBV93UQeZfpsoKy3xF3Rv3mO85eX/qL5BdLjrZQEAR6Q=
X-Received: by 10.98.17.147 with SMTP id 19mr2581386pfr.160.1519409545284;
 Fri, 23 Feb 2018 10:12:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 10:12:04 -0800 (PST)
In-Reply-To: <20180223154613.2096-6-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 18:12:04 +0000
Message-ID: <CAFEAcA-R3CCvm_O=D8AprQc-8mnyjARrtdmH1146cSKCarFyyA@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] contrib/run_risu.sh: allow appending of QEMU_FLAGS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: wgzCTFGrG61Q

On 23 February 2018 at 15:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Useful if you want to disable a feature for your run. For example:
>
>   set -x QEMU_FLAGS "-cpu fp16=3Doff"
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  contrib/run_risu.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/run_risu.sh b/contrib/run_risu.sh
> index 439cd36..63649dd 100755
> --- a/contrib/run_risu.sh
> +++ b/contrib/run_risu.sh
> @@ -13,6 +13,7 @@
>  #
>  # Usage:
>  #   (optional) export QEMU=3D/path/to/qemu
> +#   (optional) export QEMU_FLAGS=3D"-cpu any,fp16=3Doff"
>  #   (optional) export RISU=3D/path/to/risu
>  #   ./run_risu.sh  ./testcases.aarch64/*.bin
>
> @@ -29,9 +30,10 @@ fi
>
>  for f in $@; do
>      t=3D"$f.trace"
> -    echo "Running $f against $t"
> +    CMD=3D"${QEMU} ${QEMU_FLAGS} ${RISU} $f -t $t"
> +    echo "Running: ${CMD}"
>      if [ -e $t ]; then
> -        ${QEMU} ${RISU} $f -t $t
> +        ${CMD}

Well, you used to be able to do this by setting
QEMU=3D"path/to/qemu -cpu whatever", but now you can't :-)

thanks
-- PMM
