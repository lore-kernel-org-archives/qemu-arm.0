Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp303966lfa;
        Thu, 10 Jun 2021 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:6402:655:: with SMTP id u21mr3645891edx.211.1623315705199;
        Thu, 10 Jun 2021 02:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623315705; cv=none;
        d=google.com; s=arc-20160816;
        b=VzeGHDYqDocm6+Fr8CHVavnad3dFqoV5fL2cNUbgH+0HbIdj8b0Ke6NO/WessxQXOH
         slZ40aGYAsDPTxuBXsw1b2stYGC+sYNfoRArRgaXkPS2SCpnD4jBwBfRNDCFGEAPtY+n
         IaIWkXSRFBz1N5GotdRgZBIYTiADkrqDZUJLRoy0ShyG4NRfmlnjnf5FvEo3kFfMUHe0
         jdHN6jPdDLTOBroBqoXGjAxAsTFykd/ic3ZTj6aGURRSbwXrgvu++7V5Zv0VJGLGHmVJ
         IL0odqyUfdBU6eBmUJq3SFqnEuJbq4xNA8sxd303kDrb2vQIzyMy0Ek3dbGqpKCZK3h8
         eA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ONbdJzvvZTBySQzNOZWRio+1fvyMZzE0WrW3laRqjgA=;
        b=VtlT3Bct6WHvkUBOBhoypPVTjwqMfsdd9WJRX884q7KK8btuV28/tHa3nEnGD+G3jh
         K6sCx9bDFJ3i+QKoXZuEFor54dJ4DMqAjqFMn2cZBOjUwYiFjhFI92dzHq1fKngHW2oY
         qbwkypCoRj5supDEYfkOsOLS3nxH3/n6KIhSnsY77V2B7qRhNIPixCGKk4Skdc9zPuQ9
         CaC/parLLncTmrBh//TM6M6dxmbkJmSBQ9uBgDEASDykPEk1AyA/J+bkoMdgo6fMZxrw
         bMNhLfZRGUt07CrK2ytvqKU20sGkGQWJR/RLHupDSpniQDLmBsPHwKAEzlstOBLLoGMX
         4ykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9M+V8d3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dr14sor1338432ejc.18.2021.06.10.02.01.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Jun 2021 02:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9M+V8d3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONbdJzvvZTBySQzNOZWRio+1fvyMZzE0WrW3laRqjgA=;
        b=M9M+V8d37z1vKiB+2zTuqQaNcLWhnQgPNmLFljTD/U4IOl1RiTBnEOzIlhbre438ka
         /dokP3HtuYEVNkdmv/B30EM7Z/NBwfpA0jRrrLJj1Z3WZ0JKTNSscWTdI3oWwkQNWMxd
         NPiQHhpyJCpeGxtucySWsEF2AhOCZh2YzUKeJ4STXVdkW3ZeWVtpqOeLdTxFSaJwtFkB
         M/RwEFYkhCW8ortecbHiv2HPO05H2pROTARRjftg022DFFNuSBhTlSH6LcPkNhlLqHko
         VSdrVfB/m+UCG/dBY2GIufL9KB+SHq5Z6zlRqNlDqDauM9cYBY67rVZXdFtGPjCZMvxG
         wrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONbdJzvvZTBySQzNOZWRio+1fvyMZzE0WrW3laRqjgA=;
        b=Tc5WxaHq8qcT6gpQDEOZ3LQgv1/SwLA3uWWUhSAkrWyf8Q8BGpm8ffXvHSBEae8sGt
         iBmBiHuDrAK18fhXuQYWH2KquVSIbG9oy67Mn3uh1+fK4i5SOz2MenHVPiENzJ0itN79
         u8BaoO5iqCz7oe3+8lCZwLsJVy1dJQd8Vtmkz3VccDjCG8tjA66LcgtD5p0VMZ/4A7rN
         wzMmPFH13VajRFEhgQsakXnLTgwRtFuZPROVwZgRLuFHvZRQB9FXveYHjYB4em6KYVqs
         cWENXnIFRD9mhfQ+BzLxbxiivxJo+16e2aPCJgl5+paokqePkcQLOeXxKXH/NpMS8Kv/
         2mTg==
X-Gm-Message-State: AOAM532xgkHkj/qbRbSnLDFWNeVfLLcU8ohtCxYJdnckz5s56CENRyN8
	HCEXiQz+migdHhrOEOnlTFd2UJxROopnVH3C/VfHtkhF
X-Google-Smtp-Source: ABdhPJw9ZgCAffV5u46HuLtPIy0WDEZWuxAYgqJkG/AgrZV0jfuu2wSSw4RLl1EoTP55sQ3pQU2TACk0stjK2QVeZIY=
X-Received: by 2002:a17:906:a108:: with SMTP id t8mr3487731ejy.407.1623315704932;
 Thu, 10 Jun 2021 02:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org> <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
 <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
In-Reply-To: <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 10:01:10 +0100
Message-ID: <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions, cpu-exceptions-aa64:
 new modules
To: Claudio Fontana <cfontana@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bn7ZPqcM0FTn

On Thu, 10 Jun 2021 at 09:45, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 6/5/21 10:50 PM, Richard Henderson wrote:
> > I don't see the point in the excessive replication of header files, for exactly
> > one declaration.  This is not the first example.
> >
> > What's wrong with internal.h?
>
> Doesn't mean anything and leads to a mess of unrelated code.

It is all related: it is "things that the target/arm code needs,
which are not needed by anything outside target/arm".

> I think we should be better at creating meaningful modules

target/arm is a meaningful grouping of code :-)

thanks
-- PMM
