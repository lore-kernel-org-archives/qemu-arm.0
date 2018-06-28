Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7536724wrq;
        Thu, 28 Jun 2018 08:07:12 -0700 (PDT)
X-Received: by 2002:a54:4398:: with SMTP id u24-v6mr6284951oiv.250.1530198432372;
        Thu, 28 Jun 2018 08:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530198432; cv=none;
        d=google.com; s=arc-20160816;
        b=Gp+NFXKMLjkkU0s8FCfsOHPWzitDtVQ1erY9d7XsorKv6kMpRrURWVWLKf6Xde0CnB
         MkCjOAQ6g9u/7/QsXAXTHARvAWWWxxg657YyeU8cfj5oA5MQWp3CXJ1kqnkT5O1OdA7X
         o3Djkz0VRRcualP5q5P6cccAwv8wb/w7XYvutwH7mJAJTilcs5Imr3Lcu9T0++Vb+7IZ
         HHAbl4BS4CrhhAkw02K6QAYqQ9S3yUFFxvwIc3q6ZAvZ/LIlenrH3aCo7CQmC31LqFhK
         rNjUZcF9qMlA/SqEbZR33ps9lr40ChChEUaCX5oFK24e4Vz3w5tO/9eBA2XSziPka5Wj
         aK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=5Q3/LqjzCuXt+38oTNuhBvSS29bt3/Urw5Rn3AXZRZA=;
        b=DrvtJSy1Badr+9TnYqmQTqOcJkIdtLJiEdJAITB7v1NZ6jw/krtcvYuFjRZMFtUzb+
         IwHvRjLWsmf+Y+oowouOJ91ZioXDa3ZLUDMclFNVf+4LoLSwL0+qRcWZQWad/RXMyAJi
         n1ltXhRdVJV1sNoZQicFUSdJxbf5aB9A/ajLqYm1ssOxEAGBix3EuwCJXSOU9OsVj+0P
         PNqVvkgNN6XdRoCWM6ejP8ZpIG0Z/tQ6tCaO26Fp5Mwf3CWMZF3draey33iZr8MOS+lw
         U7JE5srL4UVmYTED7zyQyTx2A+Cb3EGxkWeUDSFg+2+rPkvJaGHYWzOJWZ9uJY8Y/bfu
         kIkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmAGs8WV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o186-v6sor2869938oig.0.2018.06.28.08.07.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Jun 2018 08:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmAGs8WV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5Q3/LqjzCuXt+38oTNuhBvSS29bt3/Urw5Rn3AXZRZA=;
        b=DmAGs8WVDlVMvixkCRyBAwgd+F8GW/ycsEE6zSqOmrWdZKj7OcvIURbSuShtYE6DYl
         wV2INvTa29I1yiEwSDKV6Ss7ZLoD/u9odQhgSEQI3sYkpuvHYlWvapZqPeXJHK3FX+US
         5jbqzZ1XfP7L9VIktWp9Qex4vb+mF+dqV2+QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5Q3/LqjzCuXt+38oTNuhBvSS29bt3/Urw5Rn3AXZRZA=;
        b=ENIqx+e3nWT34fW2+zv8/zmN0u39Qnm3bEzzLzN2jhdhWrQfihnVsvgSx28IxX3vPo
         KrMgd3hxUNhN3KdOEjWmWNmqBFkikaCXFNRjUG5pNYNodGADBtyXIq/NA2DggE1qYkcw
         4mb3OLSqmcmjTckJyiPJyAsD8fF1B5MY4df7gzUMscfKtjKAarFN6sOF/8pDi0YeMJgx
         vB4bwgxpGvs0Dkse0dJQgpX6HjmxH0lS07/HtXrryTBQzxk7Io1Y0AtRtM8UlwtY7MAL
         b/QnMeJVTUviBBWjWdfWZPp4FQOj+OjoLTHeTfJSqF/k9khv24xPXAgloIqwiA/yHmIB
         hAOg==
X-Gm-Message-State: APt69E32eWOgI62W3tHc6dvRo5tAU1WqmlZm2Jjg4lTXIdZwEfQLYunM
	2zprpDjGBf4T/3JSuGsd4GFU1Uqp2NXY6nyyAibZ2mIGRiY=
X-Google-Smtp-Source: AAOMgpe/SiHD9me+SRvX8zBwFbg0deZIFAVct98ZDI+AHY1YoxygjG5fBbjJs0eHj9+n0od+A/EhFbfKBQ+kF0JPzso=
X-Received: by 2002:aca:f10b:: with SMTP id p11-v6mr6255065oih.80.1530198431847;
 Thu, 28 Jun 2018 08:07:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 08:06:51 -0700 (PDT)
In-Reply-To: <20180625160009.17437-1-alex.bennee@linaro.org>
References: <20180625160009.17437-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 16:06:51 +0100
Message-ID: <CAFEAcA-GYuOGX11t7DwEkgFuOd86Mc_rF3EZV4CX==s_xD1_AQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] support reading some CPUID/CNT registers from user-space
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CEKFDya0IaAm

On 25 June 2018 at 17:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Hi,
>
> This expands on the previous version by adding the additional CPUID
> registers as exposed by the HWCAP_CPUID kernel feature. Most of the
> work involves judicious use of macros. There is a easily extensible
> test case that uses the shiny new check-tcg infrastructure ;-)
>
> Alex Benn=C3=A9e (5):
>   target/arm: support reading of CNT[VCT|FRQ]_EL0 from user-space
>   target/arm: relax permission checks for HWCAP_CPUID registers
>   target/arm: expose CPUID registers to userspace
>   linux-user/elfload: enable HWCAP_CPUID for AArch64
>   tests/tcg/aarch64: userspace system register test

Patch 1 is a bugfix not very related to the rest, so I've applied
it to target-arm.next, and left review comments on 2/3.

thanks
-- PMM
