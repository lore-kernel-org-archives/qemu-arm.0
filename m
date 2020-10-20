Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5101238lfa;
        Tue, 20 Oct 2020 13:09:42 -0700 (PDT)
X-Received: by 2002:a17:906:1fc7:: with SMTP id e7mr5169312ejt.283.1603224582585;
        Tue, 20 Oct 2020 13:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603224582; cv=none;
        d=google.com; s=arc-20160816;
        b=iQWvFl5AS9uFHDnVYZF8FB4n66sSYPOkGzMmsgTWbJ3YKFTWGwoze9O+TotJ/qxZvc
         JASlBTJ1FxYXdMhkvwgbYRkY28xq3bwfgbJhtNVEQDrmv4A95so0nAbNMOTOjairm9uB
         pnpZsyyHTYYjhZNj2Fh/OQP8AF956NJO2vrB0WVHN7jNUxDFehtnUGIeEECpKP1lKYLJ
         s+FhC/NShF3blXwMzSQNPHxNXEB6yrMtaIV5xnk/xS4lCt3I/4ce09deJ1xql88YS6Gx
         yrb/pSRHrcfRJMTZSiG9WSAFa5QoOugO62pDgWW/9kOzT10N0/coLTRnwiJ/6YxzvfLf
         VlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sp1TpqpKZUEUMinzBTWcok5u1j2qfcRRULl9ZfNE/kw=;
        b=fp6jaGNjAJYRy9bGe80atmtOW8VvnLvp8Tr46HmOeS3y3RlTj0odzCfssW7nyNhX0t
         yW5jQXq5ooFqB/gU18Edmo3gbJpiJf7GOjcr5HceMlGWzw9wnfdJ6hjP6/rGpjeEFX5b
         ie+Zik8lnfUkYCGMWp1icJ1f8XDZ9zIeHEuaZXJnhsJ+EUsFoMEo9M8EewcG+fRZVVHd
         14wU4gOwgHf/ioZGCMbDtT4WvfbSB2ds/rJgJqrZqlZ5T5ZWvKLx/YRHP9Gyaq69kZL/
         u46jkGG6omnNtXTln4jwhkRDIY0zwAw2l7KnH96vA4m0KDzNIZH6Mx2yeruBBEX7Mzgh
         RwRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDmNek6I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p26sor2450422edt.25.2020.10.20.13.09.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Oct 2020 13:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDmNek6I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sp1TpqpKZUEUMinzBTWcok5u1j2qfcRRULl9ZfNE/kw=;
        b=lDmNek6IYfLGpJxVhjVEmmU6fLVmWkhdCF+T2OyGYMN4YBLFTAyv91LkIReshRKfac
         MWIPqAEzytiVMiD8jk4ZYb/dfCwAHhX27JQtH99FQsluFWiN+xesiPi+IRWx9d9KaOrq
         VyiiAniMuMANVad9oufcQqcN021Ajl+JY50mcUfI4kfWU7uaq1zBrd+kgqNgF0zqWbUa
         mlnSPEKszY9RKy1fc/WPY4hsEJK1yaa5QlREWsMf94uPG/TXNtmpetN4V+FB/AEw8uhK
         4xiTnAdhzVAXUO78FY/OmLOlr0qPLJeXtT6+eh0aNbiAmNMyKPBwOluQvl6QjKhM3M23
         zHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sp1TpqpKZUEUMinzBTWcok5u1j2qfcRRULl9ZfNE/kw=;
        b=LHu9RsHtfTcIWzOPOKEw6HZ2SPhzhifZ9DnbNJv/bOFsC6x9jUOhx4v6kTYU8A7cQ5
         PJ/lGssOO9x9xG0I7q3fIDZjB6rwtAtLwJh1xVdDY+b4iToFfPF88rHekGEb4fMH8CvP
         +uJBdkQboDQd+tjJ/ukrSRej/YbLJM/hUYSa69IeEQQRaYTiIMok7tAYCK1erEEqlTq6
         7zJxResKjHCD7KXvuWo61R2fSFQSDn++/ceVUKtxP+j+mynA+9lCq5zBFRU9/4ppxy/S
         Xg48K18jlei3PQEu/c2+F5kfGssWsFOil0Ti9FZ08eR4RCE3I9NYt8KrW4gdj8zShEgN
         9lVg==
X-Gm-Message-State: AOAM532Di1LcnhXnKgFW3LtggMsOkRz1UaIgKmCJb9mDCMLxGafb3GXh
	+imNPmIBvIpyh+d7h1kN9y2qCtXCHfWo/1O232Q97mAVM8Us2SUh
X-Google-Smtp-Source: ABdhPJzXVH4UwDw/CFPjiRlyMeVHwOdmOVc2xI2+0yj2r4gXk2b8Yr3G4lFtLippT4jsaqkb67xuAuBQ9VwXxn39ap0=
X-Received: by 2002:aa7:d79a:: with SMTP id s26mr4487917edq.251.1603224582227;
 Tue, 20 Oct 2020 13:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201016184207.786698-1-richard.henderson@linaro.org>
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 21:09:30 +0100
Message-ID: <CAFEAcA9d7h=LCKP7B3G+Wx5CUr41+bY9ziyycGamL0EsTMgxDQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/12] linux-user: User support for AArch64 BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: r4VFxWf+ZGmv

On Fri, 16 Oct 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The kernel abi for this was merged in v5.8, just as the qemu 5.1
> merge window was closing, so this slipped to the next dev cycle.
>
> Changes from v10:
>   * Include Phil's plug of interp_name memory leak.
>   * Convert error reporting to Error api.
>   * Mirror the kernel's code structure for parsing notes
>     (though Error means that it's not exactly the same).
>   * Split aarch64 stuff from basic note parsing patch.
>
> Changes from v9:
>   * Split what is now patch 7 into 3 more (pmm).
>   * All prerequisites are now upstream.

Unfortunately the bti-2 test dumps core (x86-64 Linux host):

make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
timeout 60  /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-aarch64
-cpu max pauth-5 >  pauth-5.out
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
timeout 60  /home/petmay01/linaro/qemu-for-merges/build/all-linux-static/qemu-aarch64
 bti-2 >  bti-2.out
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
timeout: the monitored command dumped core
Segmentation fault
../Makefile.target:152: recipe for target 'run-bti-2' failed
make[2]: *** [run-bti-2] Error 139
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/aarch64-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:85:
recipe for target 'run-guest-tests' failed
make[1]: *** [run-guest-tests] Error 2
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:61:
recipe for target 'run-tcg-tests-aarch64-linux-user' failed
make: *** [run-tcg-tests-aarch64-linux-user] Error 2

I've dropped the series from the pullreq.

thanks
-- PMM
