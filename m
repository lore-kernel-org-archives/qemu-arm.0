Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp977225lfk;
        Wed, 9 Feb 2022 09:45:06 -0800 (PST)
X-Received: by 2002:a05:600c:220e:: with SMTP id z14mr3626360wml.52.1644428706552;
        Wed, 09 Feb 2022 09:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644428706; cv=none;
        d=google.com; s=arc-20160816;
        b=KI0nTiWTZ5FdwrO32iAco7go1VSNRpQ9QSiytBiiRFu4AawaSqgZI9Or1dR0K7H8xt
         K9JyjDPjE8oUshGIenuy00lvP5lxygLJMFLMi+B6dcrnI4fhRyXnuTAXYYIfoujv6S5/
         1bimDTEgpa23K5NcNkR2JIZsATl955SLYWPsurcKFSEOK+1d9jxwC5RHrnpCfitKA0YK
         74dxAqBIvG1SngGyNKAAJyZ9WiM3H5WTA5xfwukOvnIjMVYgRQeO3avQM9b0yptXtj71
         U87o4dgiiKb+uJpbpVECCFHsx9+X5ecYT6mBkFFpbr5R5TBTH+4QzwnrfnDdbcsfauqz
         TDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P12BXBx4nH+sUKT0uZDTF2l3OQB++5PWTSl04wBfxpk=;
        b=fM3t7+wWG18q9eLbYy/3LHYkiJmR8BVMVu4bWS+L3nK3tMx/e/6ReHTnCnJfGat8EV
         pMRBupngzIX2YD5FB7crOIREDbmTh9H4GDV/3BzVUE9dzXiIMWoVuGjkXq0FtUghp4rl
         +zwfw/bxYJkcQwPQCZNIwmcwG40hOwmiFu6h5vqsWxZ4kkhXnJ+4jGv9eY/a/MYgUU2N
         u5lktol2oLa12R2FFAGD7XXoKPdZdVxtgOrr5x17SnpPVd1QkGDjOQOy5fEgZBsPU3hU
         9GJHMsec/bdFVAo8xNh3qe31H1KDO4cs6acUegrMO2bTcBBFlV2DkJiNWCTdca0OcTfx
         uDVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XXSiPjVK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k2sor1375940wms.6.2022.02.09.09.45.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 09:45:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XXSiPjVK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P12BXBx4nH+sUKT0uZDTF2l3OQB++5PWTSl04wBfxpk=;
        b=XXSiPjVKlRY0Td/3Zd+sS0m7Gj1SuqGy40StMjMj/1NKe92L5FOShh2y31qeT9kjGJ
         +EwOShnquaxI2xtg8fL2FHRZeIOtb+pa/x6LtNkh1sMvFcRaCjHSaBM3XORFBGJ5ScXC
         nCXmG82QWZ7uP2gpLTkxQdzCrrTYL9uS0xNlZwxXFZi72KOm9NrbS3yqlM6ty+Zt3IkX
         f6YIhIGT0Asyc6RTzDM2Vvk1uy5WndUqrDl5ezlI13me1PcIw79P+DrwoUSc5sZ8n6PZ
         fFjDOguqgzhKfoZlHFoJ/HpRlaNYudXyyXuX0P3LlwpsBczjtGzRutN4gKQZL4km0v3O
         QC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P12BXBx4nH+sUKT0uZDTF2l3OQB++5PWTSl04wBfxpk=;
        b=3O5fV8zWCM5sWX4GYo0wZWI/+5sMRx2YiBN9o2ybDSX8oXLm0YdyKrjXV/yxsjKeIP
         4QveDHHCpRp7lnuBgA+xNVsrBRsJpMV5qKvVhi82ox3e6B/j87l1ZYAQ6APd3kghh8Yc
         f3tKHb5o+yOGiMQGJ4g1iaeo75gmM+jRYxo3XDU/j0rf2kjoZ7IZ4uFax4spKKdrv57I
         lN2FrlrPoCJ6eeu8Ec1DPncHl/UiQqfRgcs+H/+L6NjvVy+6eYNr+U60evhc5sUKqhfz
         aO3YskpN5736BWWbl692rGxlL6IFhiqm7Jo4mFEFsTCEj2awc5kQSxFgBUuB3EedGlkd
         sE3Q==
X-Gm-Message-State: AOAM5307c/Gvza6lOavynsHnnhVGLCTmCyxDftZSiKhOFBbQqFH7duMz
	1otbOkU17Uv4f9PtOnA+G2B+3Vet3E38SooPDGvW/Sk+zhQJUA==
X-Google-Smtp-Source: ABdhPJzqTVs43X+8C4hFtAUrnrHrHXeTQk7a+eUn3JLcGpG6ThCOsnRnoGJZntnQ2l6n9kx2rjNpqBQBKwu7zmC5GCQ=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr3612387wmi.37.1644428706261;
 Wed, 09 Feb 2022 09:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org> <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org>
In-Reply-To: <87o83gdk9d.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 17:44:54 +0000
Message-ID: <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NKY9qqffgI6+

On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> This allows us to check our new SYS_HEAPINFO implementation generates
> >> sane values.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  tests/tcg/aarch64/system/semiheap.c | 74 ++++++++++++++++++++++++++++=
+
> >>  1 file changed, 74 insertions(+)
> >>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
> >> +    /*
> >> +     * We don't check our local variables are inside the reported
> >> +     * stack because the runtime may select a different stack area (a=
s
> >> +     * our boot.S code does). However we can check we don't clash wit=
h
> >> +     * the heap.
> >> +     */
> >> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit=
) {
> >> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n"=
,
> >> +               ptr_to_info, info.heap_base, info.heap_limit);
> >
> > I'm not sure this test is valid -- the 'struct info' is on our stack,
> > so it could be anywhere in RAM, including possibly in the big
> > range we got back from SYS_HEAPINFO.
>
> It should be in this case because boot.S sets stack to be inside out
> data segment.

So what you mean is

 /*
  * boot.S put our stack somewhere inside the text segment of the
  * ELF file, and we know that SYS_HEAPINFO won't pick a range
  * that overlaps with part of a loaded ELF file. So the info
  * struct (on the stack) should not be inside the reported heap.
  */

?

-- PMM
