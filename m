Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1023376lfk;
        Wed, 9 Feb 2022 11:02:59 -0800 (PST)
X-Received: by 2002:a5d:564a:: with SMTP id j10mr3106982wrw.473.1644433379486;
        Wed, 09 Feb 2022 11:02:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644433379; cv=none;
        d=google.com; s=arc-20160816;
        b=JnOefEFCAdD3aSp+2rYTiQTPYivDuQUZGJM5TzE9dPDAwZPZwsIm6M98+MxNba1N5X
         FyiKTSqPqoTzO4lyI4+4gpRV6ftZC75SW4UsSdfTNilTgIix4p/gY1yb/kiDyCc84QkM
         uwQgt0BQYMfQixqqh73I84efCaG5oGIfgXa0ZRRQ9SQNJQ7FOFEXz2qNLsuioqPLDl80
         pEJyo/g35yp7KAa5VyaLAHryvZBbgGWVbEdsODv5tnepK71kCeLBRroQ+Axn36weMbon
         aXQQqxxI8v/aJFJXnCJvbtq8+7zUpA9pIZbgewx66qU9q99J0aJcsxsql3Tot5S2kjw1
         Rc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ueC1kQfHhKS0AerE+f9Egq41aiqK8o/ee1DDJkhXXSs=;
        b=k70rmyBHzHVD4x0EYFy/x5aydDAfh4lOxLhYO5uSTWQtypHh4xlOMVQM2R9DwzCCV7
         07XLiXkfkxQGhT/JM3P1vwDbbUmjJ1svoq/O5b4Gw7cpo2k2M5WmuMNTyH4zeZFy3Am3
         ghgKhpihxGgjgiPFPesL2XR30G816CcJ3JLMs2tzzbf0seqEoSQ8jLnsQS+QNTUJPvq9
         U/53ag7AjLVjDNYAPr4EDPkaf8NEkAuZwhz5H6YacTh+XEn4sxg4x6cSSucjVzmboH3d
         FiOIt6n7mGktfr/lTj/PmRM1bzrXJm+UI8/lsCfgy+zuwMi0J1Xj1VtUc2vP8tSQgYE/
         qLGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSXERXtJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e7sor5249090wrq.6.2022.02.09.11.02.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 11:02:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mSXERXtJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ueC1kQfHhKS0AerE+f9Egq41aiqK8o/ee1DDJkhXXSs=;
        b=mSXERXtJNSQS8TOaAs7oW0fIGjjvzZmgXj9wnKL1LZLC3jIj/XP0Pgf5F0JkTOMh7y
         u73rwiaSEKfF0a0pgkQQP6q4gaue+1QaRL6zQL2XP+RvceN4/+Y0k+jczE5AEoOU6kjP
         baQXnXX+X+2j+xao+E0Hek2T7efIqMdvSXfQtIerExtxc2MdNa6wmWzsfHwSS8uqGk7/
         HX36Du7Ros9u8rU2cbyTlTWnZO+UPCv3QqDiY8lqezrpkcDyzodVfqFQMk9SdAWOxONn
         OxLByyiKB6uGVb7gJ8oZAvwPMPQGj8bmUGwLh/w3+C8qU677xI//dsWPtVAgkyfgo6JQ
         bwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ueC1kQfHhKS0AerE+f9Egq41aiqK8o/ee1DDJkhXXSs=;
        b=aQIkn9yKH7cg5uG+amOH17BFG1jI082VzTZ/YdgYGdem/mMXfu+0Ls1R0YtAWijjiq
         STaBzkY3LK+MmgsRn6ghsEB/1Eyy/v726EQ1YDHTbWIiC1Wl9EaNoA3suVfLeR+KJhAg
         mcf/AfXHzzXbRYyvHcr8BjdbL/zvL1hqNt5gMBkHRbYNUMrPBwZ78vAGPgi78m1TEwUy
         VTMHV/g5r/GBtWpj60hBCwdT6JBnhYqHIaUPLYwQhsksgOSfJiNAnMXtL/wtQEXOt+LY
         MTilKYVT+20Uxvum7/IDg8/A3TRN3kAbtPwV+x0ZE3QDiSYajMpOPgqExIqQ337bNgEn
         Zyjg==
X-Gm-Message-State: AOAM533sqxoO/StFNVbl/2KOn27BQ8Xja/oQsd5z/Nkb33Q5/2GOaamV
	a14vXhUq7Fw8yji/2G5qk1AJv/MGAjKgOY/Sc7EDiOfWvcuVBA==
X-Google-Smtp-Source: ABdhPJzeJuzbQdkGrgychcDT+PIaUdkQHGQjyD5NQv+NNI6cihfcvsMXRAHNUnm6XQYTdEEP3I9jjQl1gRAUNZ/1fBY=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr3379621wrb.521.1644433379202;
 Wed, 09 Feb 2022 11:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org> <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org> <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
 <87k0e3ewjg.fsf@linaro.org>
In-Reply-To: <87k0e3ewjg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 19:02:48 +0000
Message-ID: <CAFEAcA87H4OibHzuz=EycSEFo=jAzMoCxij8KDdoFHjrp54vjQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Ay26n1CFJbQi

On Wed, 9 Feb 2022 at 18:15, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> It should be in this case because boot.S sets stack to be inside out
> >> data segment.
> >
> > So what you mean is
> >
> >  /*
> >   * boot.S put our stack somewhere inside the text segment of the
> >   * ELF file, and we know that SYS_HEAPINFO won't pick a range
> >   * that overlaps with part of a loaded ELF file. So the info
> >   * struct (on the stack) should not be inside the reported heap.
> >   */
> >
> > ?
>
> Well the data segment (but not the bss).

Ah, yes, I missed the ".data" when I was scanning the file.
(For a system binary it doesn't matter, because our ELF loader
doesn't care whether the segment is marked read-only or
read-write, it just loads it into RAM.)

> So as long as the ELF loader
> includes that in the calculation (which it should I think) then we are
> ok.

Should be OK -- the ELF loader creates a rom blob for every
segment in the file, and then the SYS_HEAPINFO implementation
will avoid them all.

-- PMM
