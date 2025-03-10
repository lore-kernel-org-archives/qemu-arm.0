Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1329953njc;
        Mon, 10 Mar 2025 10:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNsyt+Md7sF03vSN5Sa5g74uN4NIq57xOdyBowpVdmodtUdEUjJu9giiN5THW++x8ghclJIjAKRPDvfQ==@linaro.org
X-Received: by 2002:a05:6902:992:b0:e60:9821:32 with SMTP id 3f1490d57ef6-e63b51988bcmr573542276.20.1741627714456;
        Mon, 10 Mar 2025 10:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741627714; cv=none;
        d=google.com; s=arc-20240605;
        b=EfIUSPqWp+Dn6Hp2dMgkOLsk8MA0lwHBiOqVXQ2bQ/+HKu7VTSy+lZQ1sJsueTaTNG
         9Vz3oxIEgl66DXBnKWMhTOi/y2NhCONTRdKZW06sXX2sGrAftUp6FY0U9RSV67fp6B6+
         Mz4PKZgznkEm2fpGfB5k/BtnfDREPJlyq9TeGm9UQ18nVEVfqaCgfUYGIT24DkAfpWx5
         2vAb6Ik+IqOu481Qu2P8dUs/KcszvgEa+2kDIp2gzyDfxeJvnV5iBhluENhTqEiX+2Ll
         6zi845f2JNFuGa6qbFMyrjKtQF8Rd683y+auTajnethEhSgE1Zh260ohfdMHzhIYik4W
         4MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+aQVNKGdvVqgISDOWbZzds/yeU5qoIuTz9LPLRXzFo=;
        fh=ReJdAg0kBWiadf+qNqd5+7PSxRWB2xoasjWbAK38c04=;
        b=guVLH0//9h4D8xfKqTotZCfRubMSqlCQ0zB32S6D6Al2wU03zDBy0FIFPClr1LMVWi
         uTJqGYGgVeJ5TSbKccM+f1Rd0Yywj5A0MbWfgy9uSEKZiGFi1QYbGeJ2wV9PFpx2IJpF
         IAbkYFQ6nB/phTAEimFMh2gLdUJFEEjhGD9nVPz3ljy6TTxpWMhBfQXMCl5mHssXMDqL
         dlvK95mMuRoLIuwVEvpqgj84CO3ASxi8wVz75dZ3RiJx5VYR7p5YvRjH/sUubHgxEUgW
         KIqN3YOrGYly5JFaKp+3SmFeI712G+6LfNUkO3tHXe/beRid7/2GQzHpoQen1Uxm63eM
         OUvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6DDH7Ez;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e634b70c77bsor4859958276.2.2025.03.10.10.28.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Mar 2025 10:28:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6DDH7Ez;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741627714; x=1742232514; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+aQVNKGdvVqgISDOWbZzds/yeU5qoIuTz9LPLRXzFo=;
        b=N6DDH7Ezj+4NOvvDqmZWyTQf3d/V5IgrXDBNDUO3v4EUS11JenUWhD6Sm0pzxSBRVD
         7eH9oI5PCguStDlBdaSv20rPAJkeaO7jrjs9uysCCJwlmr9RLrXVoTgrFZCCud1NoCnz
         9Z/yx6/Ew4IDWHGSr1b+dnxTvKm5/aV0r1U8WkEpNhS+YTfmOPBvJLbEe2hw3onWcJE8
         lKDItn4aLyYaLjRJ4S5mwGPFZd+iPYGXRDdTLA1Qp9tvrVmIyX/g832v4zfHilZr0mNx
         WbGJSm2BDpg33WDQppRt2TpeELNNaCBUXFdtQrB2ZDgA2VawEFkPtj39toc7e/s1VgQJ
         w8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741627714; x=1742232514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+aQVNKGdvVqgISDOWbZzds/yeU5qoIuTz9LPLRXzFo=;
        b=d0PpEUGeosupkhfp2wTLqUCNcOlIgWMahQBlPb4sb0vQcEUCfU4oUKm5i3gyJcC841
         wg0xm0+21n6CctEv19hsdpZpkDdCKzirQteBYkFTGnTcC23VNvD1ewYp1lMowmRHnyLQ
         ZgUa7qvUp7AVYPWTxiOoI9P26fyvo4eAyjIVbK/8CclqPW0UoSdHeOAbVBkvS4xHO/db
         cr0yjGeO5OA03tBrq+jElR3+zZC3veKEwhIF8kUAB7JoH5LE+cHWJ8lqf5x/IoBSvDE1
         qO0/44ukyyqEqdMjO/MFKCbmlyROjWZnVtcoxDCr0U0FZG557+G4CcB/vsmM3M3hI6uH
         9aLA==
X-Forwarded-Encrypted: i=1; AJvYcCUYcRtlTN9dUw7NNzcLbBtdXVfpqkZ/sSGVTq1k7GbRUMYAdW+vmSHoyriVyGDHVCy4Sqx3Csp2JTIFTw==@linaro.org
X-Gm-Message-State: AOJu0YzcAxEFdlcYTN+M0SSwAK8IVR0BTM+9TqKQlkSHXBw141U+weoc
	zxgNWPdwsQNP/F+RwW+864Sb6PKXHRL/ADva1fTUfSmHMPH72zOTBVmnmp+s9JOhMs0QwDEJdw/
	csYOaJ08f5SAuh8NWGiIEt/HNTn0VNYKxNn7fzBqf
X-Gm-Gg: ASbGncvFkjVbWsU4MMAavMqBJiM3CORnpA6XMIKiRRwNJDLuEZhUmNOHpC1Mh/063lF
	CrmOo4OSxVJ6/RJrfw2G8OIpJNbXGTZXfMnN19y/Q6+O36NsQ4qWqsm5LgMRPIF8K4DIlUR7F+S
	W2gBdNrqT+dG5AL7vpaXubLLkWCSc=
X-Google-Smtp-Source: AGHT+IFn9LN/8rYO1/l1ZXVt6zj4pVzPF4tgz8dn2zdoK5tPlvHcJR/eOQdNN7xQ6P2i28Gk0du0ofxKrksAUXHTAPY=
X-Received: by 2002:a05:6902:4707:b0:e60:b153:1c95 with SMTP id
 3f1490d57ef6-e63b51583f3mr473254276.6.1741627714022; Mon, 10 Mar 2025
 10:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250310012825.79614-1-philmd@linaro.org> <CAFEAcA_fRWgntwbiFiDJqAkthR8vBzrkLOLkp5GeHD9O8xTMCA@mail.gmail.com>
In-Reply-To: <CAFEAcA_fRWgntwbiFiDJqAkthR8vBzrkLOLkp5GeHD9O8xTMCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 17:28:22 +0000
X-Gm-Features: AQ5f1JqfUSaaRXhVD-DJtdZRzExhnA4EBN730uEgwxRQrU-7pc1cZ9YbEkGKLHk
Message-ID: <CAFEAcA_kEndvNtw4EHySXWwQPoGs029yAzZGGBcV=zGHaj7KUQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OOWLB1GxB1ri

On Mon, 10 Mar 2025 at 14:42, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 10 Mar 2025 at 01:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > Hi,
> >
> > This series add support for (async) FIFO on the transmit path
> > of the PL011 UART.
>
> This hasn't made the last pre-softfreeze arm pullreq, but
> I think we can reasonably call "don't do blocking I/O"
> enough of a bugfix for it to be ok to go in early in the
> freeze cycle for rc0.
>
> I've applied it to target-arm.next.

...but it still fails 'make check-functional', though in a
less easy-to-reproduce way than it did. The problem turns out
to be that when the guest kernel is doing its earlycon
output (which is by polling, not interrupt driven) the output
can be corrupted, which makes the aarch64/test_arm_virt test
fail to find the "Kernel command line:" output it is looking for.

This seems to be because the pl011 code and the chardev
code disagree about how "couldn't write anything" is
reported. pl011 here is looking for "0 means wrote nothing",
but the chardev code reports it as "-1 and errno is EAGAIN".

I think the chardev code is actually what we need to fix here,
because it makes basically no effort to guarantee that the
errno from the underlying write is still in 'errno' by the
time qemu_chr_fe_write() returns. In particular it may
call qemu_chr_write_log() or replay_char_write_event_save(),
both of which will happily trash errno if something fails
during their execution.

So my long-term preference for fixing this is:
 * fix up any callsites that can't handle a 0 return for
   "wrote no bytes"
 * make (and document) qemu_chr_fe_write()'s return value be
    - 0 =3D=3D wrote no bytes
    - >0 =3D=3D wrote some bytes
    - <0 =3D=3D a negative-errno indicating a definite error


I had planned in the meantime that we could deal with
this by squashing in this change to the last patch in
this series:

--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -275,6 +275,9 @@ static gboolean pl011_xmit_cb(void *do_not_use,
GIOCondition cond, void *opaque)
     /* Transmit as much data as we can. */
     bytes_consumed =3D qemu_chr_fe_write(&s->chr, buf, count);
     trace_pl011_fifo_tx_xmit_consumed(bytes_consumed);
+    if (bytes_consumed < 0 && errno =3D=3D EAGAIN) {
+        bytes_consumed =3D 0;
+    }
     if (bytes_consumed < 0) {
         /* Error in back-end: drain the fifo. */
         printf("oops, bytes_consumed =3D %d errno =3D %d\n",
bytes_consumed, errno);


which makes the code handle both "returns 0" and "returns -1
with errno=3DEAGAIN" as "try again later".

But even with that I still see the check-functional
test failing on a clang sanitizer build, though without
any clear reason why. It's intermittent; running the
test like this:

(cd build/arm-clang/ ; PYTHONPATH=3D../../python:../../tests/functional
QEMU_TEST_QEMU_BINARY=3D./qemu-system-aarch64 ./pyvenv/bin/python3
../../tests/functional/test_arm_virt.py)

I got one pass once but mostly it hangs after printing
some of the early console output. A debug build seems
more reliable, oddly.

I'll try to continue investigating this this week, but
in the meantime I'm going to have to drop this series
from target-arm.next again, I'm afraid :-(

thanks
-- PMM
