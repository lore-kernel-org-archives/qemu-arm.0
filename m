Received: by 10.28.91.67 with SMTP id p64csp817695wmb;
        Fri, 9 Mar 2018 05:56:01 -0800 (PST)
X-Received: by 10.157.19.120 with SMTP id q53mr2130327otq.56.1520603761100;
        Fri, 09 Mar 2018 05:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520603761; cv=none;
        d=google.com; s=arc-20160816;
        b=JQ+0txiU8PU/rkNMUSHu+1Kogyyyjp4S46xq5t+noOSzbDM9s4q/ViGRv8d6hIcTGd
         u9/KZlpRpCjbrw3FVUpz8IaR1aKSVCuJXzIV8GaxLSR8WrmOlwX118+ZSxbWMa9ZBjce
         pKXrPSkx3gUp++3biQ6a2agsy12C6ZzsufyR2ZTsc989yX40uNCnkao+ukYnRLXp3I0o
         bDC30Id2VmDjFIsE7A5PXxVWuZQc+Ajl23Ol0D7QXg6ZrZubWscZ6SAzSi5TIKEAaSNh
         DD1AmzWBKSxLqsRu9wCD2mk1Rz2XS9S07DJhDSrgO/e+t9Ee9RX6s9/IMAi2Jvp6eMeh
         Wugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=c4BqITLbKX8/Z+ble/CNwMibwHMAP9OZ+5+BEQ7gfJw=;
        b=e8Yb6rTk8Nw75Tg8NK25wCjRKQoaaHHlq3OZvhi44RNKSd5GdwNqSyDQBG+6wJKKAe
         DMN29odxqvp3P5aMxxczmZw5LEVSPEFTl3f8hMXu8Ic16QnRBg7EXaObKBJFnS9SB2gv
         zCpTMyc74faVPDm4e1eusI87Cums2lifmwKZBxPvh/XG0wcqB2x2NJ2rs3NdxOc9bLh7
         VLHGpBcd7Pqz7QV1FcrRfQzu+t/FVZUV/hoOOAxqfGNjPKMrSVFJTrsKlltRFLQ66AYC
         K8JQV5BLCUxgDatWWxHR01lpQYXE9nKaKJWAZzFzGeqMbW3bwUNXIJvJjhXW2OKI+OwV
         Ymgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijdItnsl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s133sor459421oib.2.2018.03.09.05.56.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Mar 2018 05:56:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijdItnsl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c4BqITLbKX8/Z+ble/CNwMibwHMAP9OZ+5+BEQ7gfJw=;
        b=ijdItnsltNt6JUe9tHy6NYG/RSOElmRI580iCcPlAfbn5FldphAK36pUBnuyC0mF4i
         +zO4MHvBcC4wMjcC+pa/0m4e6I3MJFnurLV6WABZGEzrtH3NvYFqQePRZfcyOqfx36q+
         C5IWtK3eoLxEPdOG2DqHZfYOXSHKfYfCL+mf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c4BqITLbKX8/Z+ble/CNwMibwHMAP9OZ+5+BEQ7gfJw=;
        b=ZWwodePMCf0slfpxqcJVMevW69nf3+dea/p/RF76dhky77TMRVYfhXS54u1rHbzgJL
         s9U6qtub6l+Kl99SWySb2wKXzhl6H+Cz3uFMlvrunKcsBLh8zwlxfPLE/1pJHT7oLGU5
         oMeLDVvOABtEO30ejYjaCnNIo04xRof8JAe+a5wbwBg25C5gsELyxgkZWrKoJ9vkuVBv
         8+D/5i7vMW8c+vrCgGJUu7a1Dyj8k4UTnf2yUAPccbl0Rg/ytM6X/9X3AI96Vyyb576X
         raOqIebo+yO3T+WG57+Gq2yf9eZO6MIMfuAsX9w/W3feoYHSu3U2HlgjlQwFk11Ky/9c
         Y3PQ==
X-Gm-Message-State: AElRT7H1LsFCSAMBJPSx5zmjjvTYGP/ADXvDwDd2a/3qKdQCrxJC05DQ
	SmYApT/HhplxlPeBI82V6F7AdSprogd8ygOSLERbySOkTdY=
X-Google-Smtp-Source: AG47ELs4ipJrijSHJVGPmz4mj76zB2trKaec7gwj5IGIr1s3sdW16jA6NtcL01uVtsMuhg980XBeMfg7KYQhcbTDJ20=
X-Received: by 10.202.17.13 with SMTP id 13mr18136170oir.164.1520603760655;
 Fri, 09 Mar 2018 05:56:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Fri, 9 Mar 2018 05:55:40 -0800 (PST)
In-Reply-To: <87zi3hjqzw.fsf@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org> <87zi3hjqzw.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Mar 2018 13:55:40 +0000
Message-ID: <CAFEAcA_Px3_dnoE3cgCPwRpv-9JzoHnGceDE66BvreHi1kxbbw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] arm: support -cpu max (and gic-version=max)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZG/I8kPzlzlD

On 9 March 2018 at 13:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> This patchset adds support for '-cpu max' to Arm, along the lines
>> of the existing support we have for x86 targets:
>>
>>  * under KVM, -cpu max is the same as -cpu host
>>  * under TCG, -cpu max means "emulate with as many features as
>>    possible"
> <snip>
>
> It all looks good to me. The only minor problem I ran into was setting
> -M virt,gic-version=3Dmax silently hangs with the stock QEMU_EFI.fd on my
> version of Ubuntu. It would be nice if there was better feedback we
> could give to the user in this case.

Presumably that also fails if you ask for gic-version=3D3 ?

> It works with the latest snapshot from:
>
>   http://snapshots.linaro.org/reference-platform/enterprise/firmware/15/r=
elease/qemu-aarch64/

Sounds like "earlier firmware versions didn't have gicv3 support,
later ones do" ?

thanks
-- PMM
