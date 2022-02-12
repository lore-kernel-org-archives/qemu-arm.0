Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp3020106lfk;
        Sat, 12 Feb 2022 07:57:13 -0800 (PST)
X-Received: by 2002:a05:600c:1d06:: with SMTP id l6mr4534620wms.80.1644681433872;
        Sat, 12 Feb 2022 07:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644681433; cv=none;
        d=google.com; s=arc-20160816;
        b=GiHjdzt9tdK2seWBNNpkl2IP7nzEToJMs3GFPIt1A3ktkKja1HJK4YbHfN9dHxYxCw
         JF+5J3Z1oi2n5T/JvJmKhwh3m/5GyE50l5VOlkx+XVfP1r8AUT69fYVCC76hPnr9XNdT
         SCrXOvIkNComv3nDeRklZYtEkSMMw4t96zDvY4wu8Td+ez7kVv2sBGsYx/lc5jt+bJr6
         oolS6dOZjSSmC80UN1OudgMPa1Y8PYjOueMmJ+ImUGo9D1FmHvE6crDgo7kcycynLEP6
         pri01iNOG3DogkyY6mSi5A8Alpm5k8R4agACYFZtjDLsRnVxCfDakQnOE0gbvAyeisIT
         sadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1LWITgrvs85fgPYirZp9xebI6hwkvRq7J6ySJXpOig=;
        b=qc5LvM23WGMjgnQtImBn4M1gPxsRS88at//qflk94OOzJuHMTfwgnTYIF+y5ebOZ33
         44OHC8wNdKNTJxer9my6RA19kUioOLL/DwIW1u01t5sP9AVXf3QcJDJKPr+CpnWGumlJ
         WRoyJw1R/jodHi2uyBz8RBauPh3RyU1v2jw5A81jGG++GgmRJ5WFuSJqjMM/R3FPGIeA
         XHhEt4tLYVqrgT4ZWHZTCQooivjmVxws+Y3nSrVOa+fCsWfcQB8R80f4Sw1Af6thNV0D
         jQ2AvZByYD3YnUDrDgrXWcgac2cofNFvt9SIM0eNXV8wH48L1wQe3oIvBEta9naJgzXW
         5mcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g302h8Pr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l2sor3494621wmq.22.2022.02.12.07.57.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 12 Feb 2022 07:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g302h8Pr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t1LWITgrvs85fgPYirZp9xebI6hwkvRq7J6ySJXpOig=;
        b=g302h8PrW4Wcq6pvg54iZqLBmDdi4YxJVRVIxkmuqZ8gCmQZSdYDtrpzRzMC8UvWsJ
         vgL7SF2z4q5t0pngsGQq87cppWy1qRkQgqDA4Cupp8c0CMOoExNnoRkKtJ+WbtAk4Gog
         LE0sMgKIEOIC8FVDnxVqLmEHu49Xuj+JQRFM762FxlyWpJ7AdQwv+c8Ue1R7XLiVtnrt
         e95FY4FtEJNNLKPCyEmD2y/oQA6Jg18ScBwAhJ8aD1SrCxv9i8bOcvZokAS1ARVgoEPS
         IZp5XMYoJRLZrzeGr0aFdKQB62HBgqYy1WNj+cJx3jshqL8Qitsl4TTUM5PvH5dmJDgC
         8FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t1LWITgrvs85fgPYirZp9xebI6hwkvRq7J6ySJXpOig=;
        b=ASmykm7YGZ+QXk+4mwoEPdfS2lmIFHGfT49g69Lylcdmx1jG62SmKOFoL4k4vBF5NM
         2qUFs4n04sm+SiUNf1XtolRAdGf1YBhFSGt3wQLBwPXWULvF5TB+MJ/u9/53UUOGXilV
         W5BDjmH36Yl5eEW6b6XxXxrYfnePBL6boIsFlHiCt9qHCWAgl04Pfeo96AQwTSrytQxz
         0KVgKA6jZLCeRjqOe9JHnaz/KPD2STdNtKtvjiQwJRpTOkA80VfM8nY6MJPIq60PrDJ8
         F6eT/0tNy/9R/hkcRAlGERUubLZVBDsufk2f5F7DQ32MLaLQvYepGDsyl7dwhamWa2Ed
         Ks+Q==
X-Gm-Message-State: AOAM531GOZYTc0f0EwQreqe5V5gd/tzqNqU1OaYrXYuHaEB38R7n4o9o
	x58gvste40kSs797ikM0FG92j5h5WPnN5w4MppAMWoj6
X-Google-Smtp-Source: ABdhPJxxWwW7APq7RdMr+AtBeZLjSok6T/9iIhZrNlRrVEt6NEG/BoPKCC8XrzP+79RrcC2JfP3MbjvJZTMbB6w5TfU=
X-Received: by 2002:a05:600c:354c:: with SMTP id i12mr4625001wmq.21.1644681433573;
 Sat, 12 Feb 2022 07:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org> <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
 <878ruhedv0.fsf@linaro.org> <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
In-Reply-To: <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Feb 2022 15:57:02 +0000
Message-ID: <CAFEAcA_y1RLqzip15b1tFzYsSJ_2AvZjwxavJC=LAqn+vM+7dA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Andrew Strauss <astrauss11@gmail.com>, 
	Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: N6ObSub39XYH

On Fri, 11 Feb 2022 at 16:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> For user-mode, this patch makes sense. For system-mode it is
> not obvious to make sense of SYS_HEAPINFO (except focusing in
> cores targeting embedded systems eventually).

The main user of semihosting in system mode is standalone
binaries compiled with the gnu toolchain using a newlib
that targets semihosting. These generally use SYS_HEAPINFO
on startup to find out where to put the stack etc, rather
than hardwiring it in the linker map. This applies to both
M-profile and A-profile.

-- PMM
