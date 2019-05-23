Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1710366wrg;
        Thu, 23 May 2019 06:13:57 -0700 (PDT)
X-Received: by 2002:a9d:6a15:: with SMTP id g21mr25038otn.28.1558617237148;
        Thu, 23 May 2019 06:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617237; cv=none;
        d=google.com; s=arc-20160816;
        b=abEWSoY1OeTP5NU6hk4cFUX8DDE1d5EYV2Lb3i7Q3PHS427ZlEhRVELDizztI0/tLY
         zQmbXjLLOvZr5NuB6ClpafYBdj75sdGBZKY3tdGY+KCjTpWWPiIL8Q8cLVzEvb8RtRQ7
         +iSMttjf+hD3vZ/smQssGgtFHn8M1+nQjdmsRPaK8mPQvGM4khizvA4Lrrh+9RR7qmfs
         U72BXG4aF80ANy1Jr2XgkPhhM5MD5N1pH33CxAf69vGkcLJui7nvcuTonJYvGl1g2NoJ
         PzIbvvnwrkgmwhOFkPlN4np5+APYQ1TpEszVNQ4TQAkDe61OkVrb+K/gcsuodEwJ6PGb
         3IpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2iVYj/7S3oFIUn2xzRgUZmnOUcEYNllGFKpnulnzYQ=;
        b=jmV5cZaVslZTOYpUOnp6XJCV2BgP62Y1olOvlMTj845MmRgdcgh317Howz1RBBkCV1
         r7TvUlkDxa9IGXTQ/LvhfB4pAG5zQcDAaZgYSH23X5J4oZjq2R+of+yNUiRrU4muVh/n
         dc4UGbAmdnKpdgXof/CxX3GMtQmVxDNqfjF6SapHyoCPTFBwL82MeQhAqbcHGcO6DLsg
         /yJ4KqtgU1eIqkUVk7Js3ZYM7SF9eyEPNrLhh2KadmTQBkN89H4Gk89QqTOuaHYU145z
         3ktleb+/Sbc2Pb5I326L5GjdOU1NDPhTodK+bh0IHgY5K4f5LCtyYBfSxJWbVF56RXWK
         tAXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brJEw8og;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 107sor12780747otj.120.2019.05.23.06.13.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 May 2019 06:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brJEw8og;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U2iVYj/7S3oFIUn2xzRgUZmnOUcEYNllGFKpnulnzYQ=;
        b=brJEw8og8gg6wi+hx+2u9R7leL5O3vUYTzHxzilRT5eRGPfAMFRWXi7gToZPfsPHUU
         UtwDQ/rNUX/u7DGD3sd85lB/W0NKBl0rnHd0iWNr0bpGfp/85So/MmzYycjHrG+orvVu
         4VS4h5qx0KPq7AVmeq2HFKaEveV1JU0MX0zw5bDdQL2ed3w82fqyTgZH6JTI8oQZ3+5b
         KqUg/qXih1DLxbDnotkCoFxI0WHt9v1dFga+YZrUABMrOsXBxVRfog5GxupdhyGm0/e5
         ugtLbwCkDQ9dFV3xYIuMALCwxnPGzxtQwItm6Z1DEkvdy3RttOnPr5AdGZwTBKY45Njz
         UuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U2iVYj/7S3oFIUn2xzRgUZmnOUcEYNllGFKpnulnzYQ=;
        b=aQBCTHHVa1zVborBEythU+3QuhMpgBUBvUgL9oqkg9W6RDvIdtwZHyBAAH45J5jxDn
         5BTZjnhXw8pWN8C4lC4XA7SG4cbPoSE961SAqHuaRD2u6DzCDveZOjEwvKoZ6DVFznoQ
         VkJlW1pmNwJtvbm+hrmcsIBddMkqg2xttSyxOJ0ZU2EMnnesfq8WVq3MfBe3MfGSJ1wm
         XXN3hRzlvsZHwTSL2IaEDmlAOdfiCSOu2pynCtFNbeVUjJUSpek+ucmZRc2LfR3iG1qj
         JV8Io/e3fT8i9oiH9nM6zJaNIv65zp08oRvDgjTT/0zsQkzZUgj6uN80koU9HTHVCVOw
         8DAw==
X-Gm-Message-State: APjAAAWuusV9QmPXBSDbtl0hngNGU+5MqG0rPKDm7tUOfik+zuHGfsa8
	KiEzf8kRI1zZh/BkWO6wpZyitInz5PZIrb7Oeq0G/sQOJXlGvQ==
X-Google-Smtp-Source: APXvYqwNWD8vPnIsDJ5z3VpA4DRRTa057rQHjnPem3IoDj3949SQL7PDIJA+KYIk3S2ZxUAgVwJ/EuwGWXn7eB2RvJA=
X-Received: by 2002:a05:6830:149a:: with SMTP id s26mr27782769otq.221.1558617236419;
 Thu, 23 May 2019 06:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190523102532.10486-1-alex.bennee@linaro.org> <20190523102532.10486-4-alex.bennee@linaro.org>
In-Reply-To: <20190523102532.10486-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 14:13:45 +0100
Message-ID: <CAFEAcA_+=7VfvZRc__q9L3vuHO6YgetrjTPAYJx4eo0mAdcPXg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 03/28] semihosting: implement a
 semihosting console
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: k3AI8kuwtK/D

On Thu, 23 May 2019 at 11:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This provides two functions for handling console output that handle
> the common backend behaviour for semihosting.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 08363969c14..b2963547c48 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -44,6 +44,17 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const =
char *fmt, ...);
>   * argument list.
>   */
>  void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_lis=
t va);
> +/**
> + * gdb_do_console_out:
> + * @gs: guest address of string to send
> + * @len: length of string
> + *
> + * Sends a string to gdb console. Unlike the system call interface
> + * there is no callback and we assume the system call always
> + * succeeds.
> + */
> +void gdb_do_console_out(target_ulong s, int len);

I'm not sure about the "no callback" part of this API. The operation
here is genuinely asynchronous and providing no mechanism for the
caller to be able to say "ok, now wait til it completes" doesn't
seem like a good plan.

thanks
-- PMM
