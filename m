Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2055089njc;
        Tue, 11 Mar 2025 11:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCRk5taAKgBwnui0OqHkK/ljSgWz5WN0tcwvLOgOPVkJwGCKEhDGlywobvZjkB4qI+xY1KMlor1/GRBw==@linaro.org
X-Received: by 2002:a05:690c:3201:b0:6fe:d759:b178 with SMTP id 00721157ae682-6fed759b5e0mr127003747b3.6.1741718227604;
        Tue, 11 Mar 2025 11:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741718227; cv=none;
        d=google.com; s=arc-20240605;
        b=eHPsEp1bghbyChW3mKXlIxf0yJYRFU8zcx2SeU8bvZovOg/jh+hiP8TtBTWcuVcb5K
         fz4eliOFt4TcFBsYIYQRIIak9J1w3c+w0Q7XjbILC+MSj0bfb7TLW5hAFWrNLJ7YwPXa
         nO7cjjlLu9DWPrXZHiRvBD9LEZLArEI3eEZ1PGQqPT0qj+40pZjxh1XmjfrwA1AQlEIi
         3arglFMysqg5Z2DY1O/ZtvpVRwO12e3uZiv6IoE9oksTq4TUpCOZETjEjSGwzrwqHudu
         v/fuwNLgJukj4TK09xLmHZw8BajlBwhbSZU//ba+ccZDym8z54CKGhAW0Sj4m17Ubm2k
         aTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wayN4RoaoenIpriSr88NoZR+64V8zFecBLi1Mteb1h4=;
        fh=2l/5I4cU8s1hb7bWvBTK0dbcQhtF5XyNEqCP0k+GLEw=;
        b=JxJ+AJFubZBMzLh39XAyxIRo5ktfQ2TWCIpeajnPHo93/3Va7kiQTxopnYXeQZt5yh
         YbPCnpY3IVSauReJmCsa4GbT4XHdXHBEyjRsxTfRUS1TztFY1lvjh9wJN/2WjJeldn6N
         WkZBNJ08XWIxcIGdWNj+d9yUfYOFSeBD2YkbIUwQ7AnxBYWWNWl7qSeBEkRnKoG+Wb+t
         PGFI1XxU5UE1WQMR/EOp83KXR2wf+gjmy7PL31UVp3LkmMsKHM0vIeIDf70oQxxHzP0L
         uKDYavzelIq202q7Yf5r0Qom4hv+r9Qy5gpxQlZuwhHh35DQTIYMr1lCRjrGNqH+55+D
         WcgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dmwpw2Vt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e634b86599asor7188913276.6.2025.03.11.11.37.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Mar 2025 11:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dmwpw2Vt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741718227; x=1742323027; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wayN4RoaoenIpriSr88NoZR+64V8zFecBLi1Mteb1h4=;
        b=Dmwpw2VtEOjwH+0iYmqony2yj+vP5/RZeHBXHAbYoa4fBupgjf72rSGzrUGwPkZRB2
         s9vdmSxZ7co5BMmF6ajJUkJDBm57OjriB3eeUuKGz7xnVziQ90XJQFvPDWmMRP+oIsw4
         oNbxLWLElpTU/p44jRt/Fhbdm9OcuPEHfYmptfiAymLZ3oLXoLRZKaWjAFqdvMHVgDmx
         w6F12xn4Yq7g2cddsyrTkJUOZgoKUN18ojqkmZt5EgZLYvtdY/kTprS23Nyaoi5sJAdq
         IiIgR0IdEd2U3MpDgQKvHfUMk88Ml2bVaEEqwoQYre5AbLNh7FZn6pD+eKK4dqOKZV3+
         YlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741718227; x=1742323027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wayN4RoaoenIpriSr88NoZR+64V8zFecBLi1Mteb1h4=;
        b=u9XrhEaTb1xW+GBtfMUu2ri9IrbM7nY6A6x/mqdWdEPEg6Xm6tkbDR4sbTgwGw9a7l
         jmOQFXMpVq1xR15Fd1n/oKY7EQGRK3BoDSL0WvN2+mAgKTTgiwGiAL7EKncWG81T3Lfb
         A2BmKuKw9qiTfljW0AlEcLRw9LGjjRYPC8VdQlEgFWB+HbVKEip8J1rum0GBJ4SqADAk
         XVQAbmSxV9PhUgZGGSJ2l7f1tZrJIzKxV7he22toJ9VohEDJGFBiAbv+I+Tm7NWZ2k88
         J7YBISBW84AJeN1ESENvQsUZ4om3KlzlISAnGJ/fI/KKw+1m2rE884OJWkU7IpyKDn8M
         wO+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTmOYmez7T6KFie4xw06BV/LSn6uAO3I6fxQR56S65Z+oOPNZry5hwhf0mhl2yZDFNRAX7l1pGesVR0Q==@linaro.org
X-Gm-Message-State: AOJu0Ywr+BKiPxcUoRKcLA2GMu+3qJKaznx9eKaK9PTRcuFuk0s1+diN
	285HQMt5kvTNwLI0fDbooTPGdLIUXWuZCJ2nx+jSzYMN0+VtlQGyZyTyL8rWPhNObbswrsuhB8d
	ls8zE/p4GbgIDpDtqg25yXVN1wPtvIxsgvKAZ4On0
X-Gm-Gg: ASbGncsO+i7N5SUoo3u695ZuK4N6VMZJ5+sEwZ/eMeK1Dcy9IxJqtaYrzlCDeAJ69qq
	JYm+qPD53NdnT9gtFMHXH2C/GQ491q7Ht9CTWIRBEwsSBKSoJLj63EZXD8ZBIagw7LmnyTR/xrL
	sM963rlsd/vG/dLPUYbL3kQT1RZ7E=
X-Google-Smtp-Source: AGHT+IF/5Z50eBBrV2TrE7YsRKS/qUtD0B5qOOn/yDurn2aOxkMF1P3zHWfzVvFPoJcJx0TcR68GTaEtqI8G9XKn8s8=
X-Received: by 2002:a05:6902:2086:b0:e60:a068:a14b with SMTP id
 3f1490d57ef6-e635c0f9b05mr22983993276.4.1741718227112; Tue, 11 Mar 2025
 11:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250310012825.79614-1-philmd@linaro.org> <CAFEAcA_fRWgntwbiFiDJqAkthR8vBzrkLOLkp5GeHD9O8xTMCA@mail.gmail.com>
 <CAFEAcA_kEndvNtw4EHySXWwQPoGs029yAzZGGBcV=zGHaj7KUQ@mail.gmail.com> <6f4a3582-f3e2-4f0c-8ab6-eeddd1064793@linaro.org>
In-Reply-To: <6f4a3582-f3e2-4f0c-8ab6-eeddd1064793@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Mar 2025 18:36:55 +0000
X-Gm-Features: AQ5f1JqytoFakCllyYae0_YaX-PbqFdorB8TUeotHeg0V71ppFWFo44bbBjv82U
Message-ID: <CAFEAcA8j-JAVC=VK0YHoyB9dBH6Rj7aGpmZtCGPbc5Usdy6yhA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oEtDOAuC/0ys

On Tue, 11 Mar 2025 at 10:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> On 10/3/25 18:28, Peter Maydell wrote:
> > This seems to be because the pl011 code and the chardev
> > code disagree about how "couldn't write anything" is
> > reported. pl011 here is looking for "0 means wrote nothing",
> > but the chardev code reports it as "-1 and errno is EAGAIN".
> >
> > I think the chardev code is actually what we need to fix here,
> > because it makes basically no effort to guarantee that the
> > errno from the underlying write is still in 'errno' by the
> > time qemu_chr_fe_write() returns. In particular it may
> > call qemu_chr_write_log() or replay_char_write_event_save(),
> > both of which will happily trash errno if something fails
> > during their execution.
>
> IIUC when retrying qemu_chr_write_buffer(s, buf, len, ofs) could
> write less than @len (but still writing few bytes, that information
> is stored in @offset) and return -errno, discarding @offset partial
> write len.

I thought that too when I first read the code, because it's
been written in a way that didn't match what I was expecting
for a "write until you would block, then stop" loop, but on
second reading I decided it could not, at least in the case
where write_all is false. If we write any data at all on the
first cc->chr_write call, we will then break out of the loop
without trying to send any more, so there's no code path
that will then set res to a negative number. (If write_all
is true, then yeah I think we can return an errno rather
than a partial-write count if chr_write fails on the second
time through the loop, but all the callers of that version
of the function ignore errors of any kind anyway, and
certainly don't have any means to handle "only wrote half
the data", otherwise they'd be using the non-blocking
version.)

-- PMM
