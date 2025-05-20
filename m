Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp604528njc;
        Tue, 20 May 2025 09:01:57 -0700 (PDT)
X-Received: by 2002:a05:6830:6284:b0:72b:8889:8226 with SMTP id 46e09a7af769-734f987ccefmr9577235a34.7.1747756916727;
        Tue, 20 May 2025 09:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747756916; cv=none;
        d=google.com; s=arc-20240605;
        b=g8bdgcgHrD/AhHseXfp7TtUU8YzbGMUU2NK6uzZM4tIQ57bwwlSZiLfzUYbeb1QTn/
         wmkhIQMY+QQDsTQGpDfEnTg4yOvlDkdVZkliRUi/Lg/jFpG8ZeS4BHwCF4gqzDNXMkXM
         841pIepEqQe6TO36trNg3b1MJVw82IFIxVvHe+3+DsIsoNwVwA3iZQ4hTYFfLmOCxZ3X
         1ZTumyweBVxSwUaioed2I5P9ak8HwDIhMA9GwxRpNOzjMDsEIWsZLnWSz2nQId2cWx4C
         eV2iV8xms2kdq7aKsUiCQlcs9kNCJwWT7wySXOap61VWgDiyLVS5MJM6EH+X92f7E00E
         zYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4J/1nmcsTkQZLl4Fse9tCfOco8yvWo1gChIlHoTB7eY=;
        fh=2tEYiz4cS1PjjW12TvtRBqucfEwS/uKiGDDb4knE9YU=;
        b=VqBKExxUl98FyR00A50htH6iniPAyUGZzS5WxWahd8Ho+rTqM8rQKyQyaIL9FgYnQb
         DWQukM16xriHQBEreb1WXOyFmel+dKK7hj1zDN3wgheM8gyZHxtid62Pm4z9iCSv29se
         53QEK+Ey66COaS0uwiiYHpY+0NugYIodV3YTJDqxhTAxd4HMejjBg/uDaKq9xOuwMrvQ
         vOhJCPhMiNLVqdF7L5EMwXSFGetHJhBoDwif8ZlRSu+dkpC3xgkjYE+f3e/iy2XT/TTL
         l+wsB9PaDyuxaPA4yMCtFoyxGgp9nX/ihlP8mYeCKoiMX/b5AShy0Czaz6nrBQ0d3L3P
         5t9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FfI8r/51";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-734f6b28c05sor1349000a34.14.2025.05.20.09.01.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 May 2025 09:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FfI8r/51";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747756916; x=1748361716; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J/1nmcsTkQZLl4Fse9tCfOco8yvWo1gChIlHoTB7eY=;
        b=FfI8r/51vvRz5Oz4nsXCW7dNr/0QTx2rhAbvs91VhfrJpqV8DPEp3mmYYUo7Rj8Z1d
         WW6WvL9Bb926/PM7g4Akx8+WivNi/CNgQPdAY2NzfQFPDMttFPyNHmOCsz1Z5O2juLCx
         rO2NSJtdCbYKzQQPLk1gekqC51lOShv4BpheQdgdnlQb6MiObVC4cA6KgrdXwHEz/RJZ
         BWWIkOvgY5TXZPECNog3M1w4vXgkXf0I2cqM6Ce6Vb0geOjUUBOEvfzicnKNJXfhzy+e
         O60t6aUq5w1MHaTUPgeopHN+M6R+sTsZaWoEq0RukftiQY56qx6geCHPVT71JN1j37ZR
         kEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756916; x=1748361716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J/1nmcsTkQZLl4Fse9tCfOco8yvWo1gChIlHoTB7eY=;
        b=Yc0iqwloa0R5w5rrE/b3Re8+y2/M0NdCdN0AhqOZsx6LzhFPnlsQu/OCg3/2t31BB7
         Kvk3a2wl8kdmggyYwZkpCUQO972ltOXibgzKuoo8gzMIpkTtm+EUa3iX0q+1idC69Sv9
         Y3v+rxXLr/PcsqVLgKLfzj6QBSRqMowwnnN5T5kcFlalmec8tsGQp4DlhvSPn+d2qkoy
         Mv6mI20qlj0h3fXrq+6bXjNUKRTRQpWqQwv61hObfjDT7RLUoZJnMqzTvbWzRtX0I9cB
         +mz9JjhI2tiAqzlyRynxiS2542FJtbHiLXAit0tmHFrkuyVrIKqUwmkBSskObu4Kn573
         lqNA==
X-Gm-Message-State: AOJu0Yw6Lw+VeidlAW06OzxUXhupQ9QC0kWdTEuZw38zQjekhELL3G1C
	ozixB1a9+S97r+7BKPpZUql2617fO5bjSuvfzADQd913D9fTgJ8Qi/l5tz3oMMbj8E8iCQkAzwy
	ouQutQHcpG7Rk9oLZvdv89xDH0WL+K2haNNA4OTXhDB43QlQXdOzzDAs=
X-Gm-Gg: ASbGncv5pL1fJa35gM8gqJ8uq833p8r0ugw0kzJY7BROfzwdFYdmw5kFrSl9E5Z7SqW
	heJ1MnFM2ED3Xt7tCIEUlWfhxiQkMOr9SIxruXoue2Dd96vbnNS6VKDKSr84WMmhj+u1zHgbsSM
	sVtnndlZBCkxXhgT465OuZ4pfkSG7/SeSkIA==
X-Google-Smtp-Source: AGHT+IH76L/wU5IO2UxG4J8Z3ZMqfugLgiQ1+xjfbJJbUuI0+zEdylTKVCWnQbCGhpAcPcbn3yHUr601FI1j6mpquxw=
X-Received: by 2002:a05:6830:6118:b0:72b:9d5e:941c with SMTP id
 46e09a7af769-734f98a0a92mr11157637a34.13.1747756915995; Tue, 20 May 2025
 09:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org> <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <87cyc39t52.fsf@draig.linaro.org>
In-Reply-To: <87cyc39t52.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 May 2025 17:01:44 +0100
X-Gm-Features: AX0GCFsmq3DmpXmc5WxARfUl5H4vQhLAms1sFBx5gScfP9uplVGUjODW33FUfik
Message-ID: <CAFEAcA-FgXuwesHjWWvvSofCaFTK9yOHHuRBF+15f2NhpXjqYQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before binding
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org, 
	Nicholas Piggin <npiggin@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Bin Meng <bmeng.cn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Kyle Evans <kevans@freebsd.org>, Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
	Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, qemu-riscv@nongnu.org, 
	Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Apfddu+fNMY1

On Tue, 20 May 2025 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Michael Tokarev <mjt@tls.msk.ru> writes:
>
> > 07.02.2025 18:31, Alex Benn=C3=A9e wrote:
> >> From: Ilya Leoshkevich <iii@linux.ibm.com>
> >> In case an emulated process execve()s another emulated process,
> >> bind()
> >> will fail, because the socket already exists. So try deleting it. Use
> >> the existing unix_listen() function which does this. Link qemu-user
> >> with qemu-sockets.c and add the monitor_get_fd() stub.
> >> Note that it is not possible to handle this in do_execv(): deleting
> >> gdbserver_user_state.socket_path before safe_execve() is not correct,
> >> because the latter may fail, and afterwards we may lose control.
> >
> > Please note: this is linux-user stuff, which is usually linked statical=
ly.
> > By linking it with qemu-sockets, we basically broke static linking, bec=
ause
> > qemu-sockets uses getaddrinfo() &Co.  The previous code, I think, was t=
here
> > for a reason, - to avoid this linkage.
>
> Oops, how come we didn't notice? We do have a bunch of --static targets
> in the CI.

We ignore these warnings because upstream glib means we
always have a bunch of false positives when we link a static
qemu-user executable. So this one (which is in our own code,
not in glib) slipped through.

I think it's in the same "annoying noise" category as the
glib ones, because the unix_listen() function won't actually
end up in a call to getaddrinfo(). But since this one's in our
own code we ought to fix it, either by splitting the source
file or by reverting the commit.

thanks
-- PMM
