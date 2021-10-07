Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1715036lfp;
        Thu, 7 Oct 2021 12:13:58 -0700 (PDT)
X-Received: by 2002:ab0:3447:: with SMTP id a7mr6864532uaq.56.1633634038452;
        Thu, 07 Oct 2021 12:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633634038; cv=none;
        d=google.com; s=arc-20160816;
        b=kG3yESmoQ4dYNUHKakC2SX8DZAcN+uVgSJ3mDDUGp54rWbkRWdQB2nRNmlk28pvgB+
         i1vCdJF0tG7I9zhAM8+Lf5BOcAyRj+OPiLFBtK0mNUlHS+2VyRxcCRH4OWECNwXN0fbN
         pMhP68C0hRSit1pH9chMKw0OvMY/PlvsU4ZoKbErgAtOTOe6OkKXJ2tzWRbyo/ZUuD6P
         cQxHAv0VIdZb+zatIgzwlV0dmoqscJAyWwQ6GaDmRyH+JVjRkDpCqbh0u9xjJsf1Zctx
         YeAG1DCNbjRJTvB/Q2RadJ7noFUIp0FU4m9xGyrSj4/EPqPFsHaxdneswUGb9Wfa1QIJ
         C2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sLO8+pn561TQaEFUhic8fW50Ob4vja96RRtossVKiUk=;
        b=sh9p5PxNKqZAjOX6sWjmwUCjQcPsvP0D9DVDviif7JKi04VGeKFJZLZhusG2rplzOS
         pwk4aamvpbFWK8Fc+zJDXh7Br3I62IXIeVw7ZKNBwqOTPgakfqrrxgv9y3xC7+rdMhcj
         IsmmKvRVgk8y+O8ZV6aOTuWuZif+zQPgTK+dUw8aJIeXrjalCf1WOtm6I8K5UlBcX1T1
         qPfbVHCSVaJIElty4qgbFUtQR2vKxl3YthavvGB7Wk/Ny1MENnThzJh0zjA5rSVRGMsH
         vRteSI++D9UxVV4NUokSmzmEKa1R3tw7eDdQ2rBGsSBp9/a9Vqgk9nhuU8avau893I3Q
         y5Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20210112.gappssmtp.com header.s=20210112 header.b=JdLVYmsl;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x25sor77518vsg.122.2021.10.07.12.13.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Oct 2021 12:13:58 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20210112.gappssmtp.com header.s=20210112 header.b=JdLVYmsl;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLO8+pn561TQaEFUhic8fW50Ob4vja96RRtossVKiUk=;
        b=JdLVYmslqizrUlqvWgCQA375NWi5CyJq2TBDPNdPufwZtLsjK6dlCseDleP7fE3jvE
         aFWXwArZU+jUJ+rX3Y4KO540CcTmevR7mgoNPcqkjyp84L3hQDL6QDrBea20g9KuVJ10
         M8bxlKAj9rX/m0+U/rCj34l48dgyKcCq5LVNcIdJVN8VvOuK+x22rAr4Cqbp2UL2KmSG
         JBCuQPJtWNPE/3ZzRA2cLpQbtLP06EIiJQL7U6haX1CcGGsbtRuqQVf4ScYLwjsPEB/z
         Q6LFLdL3soIXwWNYlaSJjzWkC4fWpehlqraersaId6rVKYp/2mc97WqpZEy9R00iiNRK
         hZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLO8+pn561TQaEFUhic8fW50Ob4vja96RRtossVKiUk=;
        b=LHinEIu7ofH8up4vo65lg9vaw3NNkIaCxmQTcohaOKDcUgDN41X2eNgLqqFBoxlqGp
         DCA3rGuriWe05Ga5XReV+1iatKmzlzTkhbgzLMCc/QwslohsGeta4sXIU+TvYZwdIRtU
         vALDsiEVIe8LZ/BM4f/YzmLa/KepU+fvPNiFQ4fgUXiVPWwHg5TlgACMSOXi/NH450Rd
         QZFGyfwFaW8UrlKHXbVzXkQRFjd2kWqZ7fFtCmf/sCv63PgMfwkPuDQm5im1GTRaR2Nn
         gBuHogmXUkcdyu9gISfBtLjtw7z1JGHujJdjiJZVID4VvDdZ6IicLOvNSwkI01NvIuPw
         HDiw==
X-Gm-Message-State: AOAM533XymyIeXHAqKsl2a1XwI8MuM5Y7FhEwI+/aupJ21hG/FACn8ux
	grVqw3ZDq3yacFT+p/2LnfNSHUunuO59Y5vo4Q/0ogT5Oqg=
X-Google-Smtp-Source: ABdhPJyCkXVSSAGRs2B3ROhMT7MkS82ZWuvmhC+79vkWPXFdXGeGRzQWbr0d9ssL10g/IJw519UtmC31BXd6bybXf50=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr6447930vsh.30.1633634035004;
 Thu, 07 Oct 2021 12:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <877deoevj8.fsf@linaro.org>
In-Reply-To: <877deoevj8.fsf@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 7 Oct 2021 13:13:44 -0600
Message-ID: <CANCZdfoZ55XfNy9dnhgRrzi=QM5SqLgHrioqTK6J7R=jju-E6g@mail.gmail.com>
Subject: Re: Approaches for same-on-same linux-user execve?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Richard Henderson <richard.henderson@linaro.org>, 
	assad.hashmi@linaro.org, QEMU Developers <qemu-devel@nongnu.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, qemu-arm <qemu-arm@nongnu.org>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005a563305cdc8102a"
X-TUID: vGVh+W0YwB2B

--0000000000005a563305cdc8102a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 8:56 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

> Hi,
>
> I came across a use-case this week for ARM although this may be also
> applicable to architectures where QEMU's emulation is ahead of the
> hardware currently widely available - for example if you want to
> exercise SVE code on AArch64. When the linux-user architecture is not
> the same as the host architecture then binfmt_misc works perfectly fine.
>
> However in the case you are running same-on-same you can't use
> binfmt_misc to redirect execution to using QEMU because any attempt to
> trap native binaries will cause your userspace to hang as binfmt_misc
> will be invoked to run the QEMU binary needed to run your application
> and a deadlock ensues.
>
> There are some hacks you can apply at a local level like tweaking the
> elf header of the binaries you want to run under emulation and adjusting
> the binfmt_mask appropriately. This works but is messy and a faff to
> set-up.
>
> An ideal setup would be would be for the kernel to catch a SIGILL from a
> failing user space program and then to re-launch the process using QEMU
> with the old processes maps and execution state so it could continue.
> However I suspect there are enough moving parts to make this very
> fragile (e.g. what happens to the results of library feature probing
> code). So two approaches I can think of are:
>

32-bit arm had an 'eabi' section in ELF binaries. There it would have been
possible
to look at that and make a decision before the binary starts executing to
see whether
it should just run, or fork the linux-user binary. It would take kernel
changes, though.


> Trap execve in QEMU linux-user
> ------------------------------
>
> We could add a flag to QEMU so at the point of execve it manually
> invokes the new process with QEMU, passing on the flag to persist this
> behaviour.
>

The bsd-user code differs a little from linux-user in that it looks at the
binary being exec'd to determine what to do. It works OK, but isn't really
for this situation (we use it to optimize our package builds with additiona=
l
path processing for our mixed binary situation where we have native binarie=
s
execing emulated binaries that then exec native binaries again. It is a bit
of a hack, though, and I'm not completely happy with it.

Add path mask to binfmt_misc
> ----------------------------
>
> The other option would be to extend binfmt_misc to have a path mask so
> it only applies it's alternative execution scheme to binaries in a
> particular section of the file-system (or maybe some sort of pattern?).
>
> Are there any other approaches you could take? Which do you think has
> the most merit?
>

In by-gone times, brandelf has bene used for situations where you wanted
to run an ELF binary with one emulation that looks like another. But that's
also
kernel hacks and also touching the local binary.

There's also the option of doing a VM86-like thing that allowed people to
run 16-bit x86 binaries on 32-bit processors. There the system calls would
SEGV
and you'd decode them inline, execute the emulation and move the IP to
execute
the next instruction after the INT XX system call. You could create a
loader that
knows how to load load the binaries and catch SIGILL and then emulate the
new
instructions on the old processor, but that's somewhat different than how
qemu
user-mode works today. But knowing you'd need to do this is hard,
potentially.
But one could expand the kernel to load in SIGILL handlers on-demand for
programs that do this, but that wouldn't work with old kernels and just
feels
weird...

Warner

--0000000000005a563305cdc8102a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 8:56 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">=
alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi,<br>
<br>
I came across a use-case this week for ARM although this may be also<br>
applicable to architectures where QEMU&#39;s emulation is ahead of the<br>
hardware currently widely available - for example if you want to<br>
exercise SVE code on AArch64. When the linux-user architecture is not<br>
the same as the host architecture then binfmt_misc works perfectly fine.<br=
>
<br>
However in the case you are running same-on-same you can&#39;t use<br>
binfmt_misc to redirect execution to using QEMU because any attempt to<br>
trap native binaries will cause your userspace to hang as binfmt_misc<br>
will be invoked to run the QEMU binary needed to run your application<br>
and a deadlock ensues.<br>
<br>
There are some hacks you can apply at a local level like tweaking the<br>
elf header of the binaries you want to run under emulation and adjusting<br=
>
the binfmt_mask appropriately. This works but is messy and a faff to<br>
set-up.<br>
<br>
An ideal setup would be would be for the kernel to catch a SIGILL from a<br=
>
failing user space program and then to re-launch the process using QEMU<br>
with the old processes maps and execution state so it could continue.<br>
However I suspect there are enough moving parts to make this very<br>
fragile (e.g. what happens to the results of library feature probing<br>
code). So two approaches I can think of are:<br></blockquote><div><br></div=
><div>32-bit arm had an &#39;eabi&#39; section in ELF binaries. There it wo=
uld have been possible</div><div>to look at that and make a decision before=
 the binary starts executing to see whether</div><div>it should just run, o=
r fork the linux-user binary. It would take kernel changes, though.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Trap execve in QEMU linux-user<br>
------------------------------<br>
<br>
We could add a flag to QEMU so at the point of execve it manually<br>
invokes the new process with QEMU, passing on the flag to persist this<br>
behaviour.<br></blockquote><div><br></div><div>The bsd-user code differs a =
little from linux-user in that it looks at the</div><div>binary being exec&=
#39;d to determine what to do. It works OK, but isn&#39;t really</div><div>=
for this situation (we use it to optimize our package builds with additiona=
l</div><div>path processing for our mixed binary situation where we have na=
tive binaries</div><div>execing emulated binaries that then exec native bin=
aries again. It is a bit</div><div>of a hack, though, and I&#39;m not compl=
etely happy with it.</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Add path mask to binfmt_misc<br>
----------------------------<br>
<br>
The other option would be to extend binfmt_misc to have a path mask so<br>
it only applies it&#39;s alternative execution scheme to binaries in a<br>
particular section of the file-system (or maybe some sort of pattern?).<br>
<br>
Are there any other approaches you could take? Which do you think has<br>
the most merit?<br></blockquote><div><br></div><div>In by-gone times, brand=
elf has bene used for situations where you wanted</div><div>to run an ELF b=
inary with one emulation that looks like another. But that&#39;s also</div>=
<div>kernel hacks and also touching the local binary.</div><div><br></div><=
div>There&#39;s also the option of doing a VM86-like thing that allowed peo=
ple to</div><div>run 16-bit x86 binaries on 32-bit processors. There the sy=
stem calls would SEGV</div><div>and you&#39;d decode them inline, execute t=
he=C2=A0emulation and move the=C2=A0IP to execute</div><div>the next instru=
ction after the INT XX system call. You could create a loader that</div><di=
v>knows how to load load the binaries and catch SIGILL and then emulate the=
 new</div><div>instructions on the old processor, but that&#39;s somewhat d=
ifferent than how qemu</div><div>user-mode works today. But knowing you&#39=
;d need to do this is hard, potentially.</div><div>But one could expand the=
 kernel to load in SIGILL handlers on-demand for</div><div>programs that do=
 this, but that wouldn&#39;t work with old kernels and just feels</div><div=
>weird...</div><div><br></div><div>Warner</div></div></div>

--0000000000005a563305cdc8102a--
