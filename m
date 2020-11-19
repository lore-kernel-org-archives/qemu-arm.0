Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp279078lfb;
        Thu, 19 Nov 2020 03:31:00 -0800 (PST)
X-Received: by 2002:a17:906:4c41:: with SMTP id d1mr29240597ejw.485.1605785459969;
        Thu, 19 Nov 2020 03:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605785459; cv=none;
        d=google.com; s=arc-20160816;
        b=c2w3dsKNnDgPp7gKpifqaqGELZfxVgspp+doQklIn+pATNTjkT5hy4na21WDfbfYCs
         mIakONFOBN0no8iYDS8pNprhcFVgoAusZtxLuo2dKdR0cdZd+jOtmcRFnWAoi3dnoJnM
         WZTQlWKKe3zdgr0kaHyWYonXdjcTTFA6Zjty0YHrmj0NFjXn9y8Bm0TVLix+1O3oJxwq
         wW/dg4TP/NunYnb7iYdRQ02UtUqRMIa4QxXTVik+uqoVFtdU6Bn7iAhjE/Ws0/b6IsZ5
         ASD0SiZjDRgrulGNzIGIOXCz8usMTWFMoiR8SUhx3NCOTuA7qKEfsTOc0qfFQ7tul3cp
         FOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7HGC4DUpvTfkOOBmLvB80Rvp82QobPgkqhW3vgKExlo=;
        b=Mr708Nkdjv3md7X5yPF7xWFZuoik2a/8Y/VILqdZuU0niYaXL2UVH1ET+H/tBp1Bc0
         7nzhDcEYyB560JJrv/SfzuWEg6AUuyWyPLEHEFbketNUQ7hCrHRn9OJPViuMrBD8WypV
         lg/n/FBco0kwmO1/NG5LvMRh58w2yER5ibMqVnWd7WmCSaAg4i1aqP4SYo3p2g3zyIX6
         5Bh2MY5GwarrX8xqaYAHOm5JijMiZYyVPCUUG1o2KAv83IVaMWn4BgcnSGl7biYtujvP
         rrQcFQX7mKgYxVRphlKzObByWb5xDDKCwjIFfeZCcra7RdYI1uTYy8UFqqftQmp9BkDF
         Ls7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpjmkKaQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l12sor15670191ejr.26.2020.11.19.03.30.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Nov 2020 03:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpjmkKaQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7HGC4DUpvTfkOOBmLvB80Rvp82QobPgkqhW3vgKExlo=;
        b=JpjmkKaQkAgVim3PkfeDClB68LqjUGUqq247rtpEKYBuu9sXxTEvwQVr+MGI9NM1Vl
         sSzKZVyvrTaB5+wh5fZ43jUGrlDocvWNSRwclt6zbADfWGhbmprDL6bR6DbTafX89imO
         PUAgRUa1xNBAp/JjzZuveaz6yCjm9XPm9DGnYndtr5TS4Y+UcOHTiJ0ovxBs76zehfAf
         /yTvVjtllTWEiUuXK2aWZDWxQqYZV5SvKaP0jdZ9H2AD4M6dDpT6AAX9Hi9+VtpUbBXI
         turvjFu90n4NS6R6V4ajllL7stdmYBHqwn+yYYT5Nw/Q1dBXidczbWsd5cyfaIrVHrSR
         euXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7HGC4DUpvTfkOOBmLvB80Rvp82QobPgkqhW3vgKExlo=;
        b=VOENTIXuxRZ0VQ9EVZgrUIhhdPfmQyChxpiyQ2ohjl2RNEs86lA5GMXnY5ZRrUw6It
         9ZDZCyAVIK9jgmqwUOfWEzhN22h9ZBpH7DNzejieZhtrxXST+SaWV5GbgB6LWRtgyDQb
         bHJx3Xxtpkga7L037QBDI3k/mhZb9ep3OTSPOQq266YBqksIku+HifgtfBclgYvsGtvl
         13HhwQRB3vftr9LLSbrWZLGvhlbgWEYMg84fC9IxeAEsmX9Ao0CYGP2O7Qg1UIAWLlcT
         Sgle+ACPyxFhGnQL5ZpuzGboSvwzds0U7nEOEq2r7IN7fH9tLEsEsRLdqGoxQ1VH5HAD
         YJwQ==
X-Gm-Message-State: AOAM533AlfMS34i8mAx/ltlteO9hIhlFfC0Ew3GDMmkA3foyFpW67k7S
	fyvOPrPWG9Odl15HuHR917YSEZjLIcqu3h3JsGxOEYazFsGooE9J
X-Google-Smtp-Source: ABdhPJyHVHNagYUasOvuL46YF6KTgXLnpIptCloydon3gkvRCbCi2AaTE8JEZKWBsEzrJumgsj3Szo2V9QRe75Sx7jo=
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr17673526ejd.382.1605785459382;
 Thu, 19 Nov 2020 03:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20201119092346.32356-1-peter.maydell@linaro.org> <87lfexvb8e.fsf@linaro.org>
In-Reply-To: <87lfexvb8e.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 11:30:48 +0000
Message-ID: <CAFEAcA_1y4iUgBYkW=4i3AXEKowh44-pRqFZ2AimbsS+BPR8Lg@mail.gmail.com>
Subject: Re: [PATCH for-5.2] target/arm: Make SYS_HEAPINFO work with RAM that
 doesn't start at 0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iIWkv2wYnnZO

On Thu, 19 Nov 2020 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > QEMU's implementation when in system emulation mode is very
> > simplistic: we say that the heap starts halfway into RAM and
> > continues to the end of RAM, and the stack starts at the top of RAM
> > and works down to the bottom.
>
> So there is nothing to stop this value being in the middle of say a
> loaded kernel or something that happens to overrun into the second half
> of memory? AFAICT if an initrd is ever used it will likely smash that.

Correct, but the only code that uses SYS_HEAPINFO will be
the libc runtime startup code in simple 'bare metal' test
applications, which are likely to be pretty small.

> > Unfortunately the code assumes that
> > the base address of RAM is at address 0, so on boards like 'virt'
> > where this is not true the addresses returned will all be wrong and
> > the guest application will usually crash.
> >
> > Conveniently since all Arm boards call arm_load_kernel() we have the
> > base address of the main RAM block in the arm_boot_info struct which
> > is accessible via the CPU object.  Use this to return sensible values
> > from SYS_HEAPINFO.
>
> It's certainly an improvement but it feels like it could be a bit
> smarter. Maybe it's not an issue for sort of things that use
> semihosting?

This is what the comment about "TODO: Make this use the limit
of the loaded application" is about -- in theory if we know
what the ELF file we've just loaded is we could put the
heap start there rather than just assuming "the loaded
application is probably not using half of RAM for its image".
But the benefit in trying to do that is not great and the
complexity is quite large, given how many ways we have of
loading guest code. (I guess the theoretical ideal would
involve asking the rom-blob code for the largest available
empty space?)

thanks
-- PMM
