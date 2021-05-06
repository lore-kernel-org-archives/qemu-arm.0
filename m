Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1316150lfg;
        Thu, 6 May 2021 07:23:01 -0700 (PDT)
X-Received: by 2002:ac8:7ee8:: with SMTP id r8mr4484732qtc.56.1620310981210;
        Thu, 06 May 2021 07:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620310981; cv=none;
        d=google.com; s=arc-20160816;
        b=FSdmgm9OA6X+wfjjmJ7dRJRlpHLbp4KM/9LwKDJjEzmYJ1rWRPL2Ze4zgaGMNoM9LK
         M7tQVLRKTaNixA0m1j9r3N4ADQ2RgPRwfQxfoJUFhMFNiWWVlt8SyBIPWK0ZX4qr8lTQ
         MtZzH+YRc6owh7a5NMppZ9kBpY7JrVxWKVkkhwXIGdEryq37Sorfe0NQfNS0y+W+tsYV
         0kA0WaJsZV+L0EAZ511FZnFrvEnb16FvfFdB8G2Oig278zJFslPq1r7IOcUCYGN7a6a+
         PWl8QUigVKD6ycokcTHxtKdVU7M/im2OXcV7+Un19qJpYtecfAxgVWH+gBkVo8Maq+ic
         3sFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dQGJ6Q0wZKhpJ3PZdrsCXdr7zqNBB4FZ2lq1ceu6GQM=;
        b=evXBNqVxeXtr403jdyD5RHjQZcYSygz+rMjwfcOIxGuSbyNNxehP/bE/rITTbVMEt2
         VlgGaUEcsOX2WlK0XELBdrJnMSKe/PMD0Lvw8R16MZwIjQwLXixRSauikoFiNPAz0dzN
         xyEpSKxGTD7o5HUJWUggf7qafeTU3V+6FyLznQLaDIWY2KowVEp2z9p8ymvTWhqDSoJj
         MrGsVlbEmq5Rraj/m8z7T5S8CPEIpq7/SlFdL7n8KG1cxcnc/gi28q6mOuV9FoZVEMoJ
         pKfIgdLqWP7J69ta0IOoF9LC2yecEmofqvoxtrtc/Ybndsh5p8gpG57JcnNnt+AOHk3q
         bJmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=ZL4nPapk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 99sor2934130qta.16.2021.05.06.07.23.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 May 2021 07:23:01 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20150623.gappssmtp.com header.s=20150623 header.b=ZL4nPapk;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dQGJ6Q0wZKhpJ3PZdrsCXdr7zqNBB4FZ2lq1ceu6GQM=;
        b=ZL4nPapkQnQzI5hNrqRk4EOdF5UHQXoCYwA+zf3I+5p/OUid0bx8xQwiCfkDY+jFGY
         aDfo8z/n+Uvb38a499UO1wHo9wIQcmVf/wrEkrAK5OdlG3a+GSssxqtBphd1teZcAlm3
         hG4GNdvi3lkLzC/eSM78wvOAJLXNsXVo9TY5xUz2LYxZfQEj1wv5+2BXP3agjyOrsGcU
         h5Q9s6oh62tiJHArrV06sD+1nxZRUV1nrLszulTjOBjMLQ9xhMbH/0Vf2aaDhIlD4vFZ
         YugV+oq2xItinGwYVBwj7/Q53HOc5UuxgX2DyBpys2whXSIisA+hkqzZNg0T+cx8Kn66
         R8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dQGJ6Q0wZKhpJ3PZdrsCXdr7zqNBB4FZ2lq1ceu6GQM=;
        b=Im8I0186fBr2BqIynP+lw8gxPdfrwuO3QaSUj3fEjwj9KnA5qnzYLJsigWuHW2bY2a
         /Jf2uXQfHlt4hWPV9OHYAY1HsWqyJ5fIQq9KTDy84Phc9xq/887RjDzFuryB5vyxV6EU
         Yxd9x+PGUmpcZe00QeHLlLoYAnmevhxck7drTqjmfdfUr4bXKEXdHOHOjR2v6+NqY0PJ
         qmr2JqabYTWMUtZsSgHIdD9U0ExA2XiEAlUgUmI1MczukCxobY3PNtalIxB2IfQxFO6Q
         JIp9KwwEIg2DVfWuvIKxTzheP5xmbyzngETWkndAk4vvXyg63Ce7ldkQgUDHK6w6NVJ+
         h10Q==
X-Gm-Message-State: AOAM5327aEc3qGSKO78ogtWAwEdnbzKKGgPh/IftZp+ngfPgZYIxo5RO
	LO33bHpSTE/AkuGv1bo5w/p0coVQEK3gYYLk5B5ydA==
X-Google-Smtp-Source: ABdhPJyBS//SKMm9JQFUL3tfxRak1+TRpBPcKJh3kB36Zt2GrPL58gzj7r9qDcK1DCjsG8+S0Gfw9DFeN5JYYE60FBI=
X-Received: by 2002:ac8:675a:: with SMTP id n26mr4557315qtp.101.1620310980656;
 Thu, 06 May 2021 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 08:22:49 -0600
Message-ID: <CANCZdfqiHxQoG+g3bq_KL01yWCHUbF5qxJWN=sD37h7UJFMZ7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, kvm@vger.kernel.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006d95be05c1aa0c4a"
X-TUID: Nlj0Qto2jJUj

--0000000000006d95be05c1aa0c4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
> Replace few calls by equivalent GLib malloc().
>

Except g_alloc and g_malloc are not at all the same, and you can't drop in
replace one with the other.

g_alloc allocates stack space on the calling frame that's automatically
freed when the function returns.
g_malloc allocates space from the heap, and calls to it must be matched
with calls to g_free().

These patches don't do the latter, as far as I can tell, and so introduce
memory leaks unless there's something I've missed.

Warner



> Last call site is linux-user/.
>
> Since v1:
> - Converted more uses (alsaaudio, tpm, pca9552)
> - Reworked gdbstub (Alex)
> - Simplified PPC/KVM (Greg)
>
> Philippe Mathieu-Daud=C3=A9 (9):
>   audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent
>   backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD
>   backends/tpm: Replace g_alloca() by g_malloc()
>   bsd-user/syscall: Replace alloca() by g_new()
>   gdbstub: Constify GdbCmdParseEntry
>   gdbstub: Only call cmd_parse_params() with non-NULL command schema
>   gdbstub: Replace alloca() + memset(0) by g_new0()
>   hw/misc/pca9552: Replace g_newa() by g_new()
>   target/ppc/kvm: Replace alloca() by g_malloc()
>
>  audio/alsaaudio.c           | 11 +++++++----
>  backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------
>  bsd-user/syscall.c          |  3 +--
>  gdbstub.c                   | 34 +++++++++++++++-------------------
>  hw/misc/pca9552.c           |  2 +-
>  target/ppc/kvm.c            |  3 +--
>  6 files changed, 40 insertions(+), 48 deletions(-)
>
> --
> 2.26.3
>
>
>
>

--0000000000006d95be05c1aa0c4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 7:39 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;.<br=
>
Replace few calls by equivalent GLib malloc().<br></blockquote><div><br></d=
iv><div>Except g_alloc and g_malloc are not at all the same, and you can&#3=
9;t drop in replace one with the other.</div><div><br></div><div>g_alloc al=
locates stack space on the calling frame that&#39;s automatically freed whe=
n the function returns.</div><div>g_malloc allocates space from the heap, a=
nd calls to it must be matched with calls to g_free().</div><div><br></div>=
<div>These patches don&#39;t do the latter, as far as I can tell, and so in=
troduce memory leaks unless there&#39;s something I&#39;ve missed.</div><di=
v><br></div><div>Warner</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Last call site is linux-user/.<br>
<br>
Since v1:<br>
- Converted more uses (alsaaudio, tpm, pca9552)<br>
- Reworked gdbstub (Alex)<br>
- Simplified PPC/KVM (Greg)<br>
<br>
Philippe Mathieu-Daud=C3=A9 (9):<br>
=C2=A0 audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent<br>
=C2=A0 backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD<br>
=C2=A0 backends/tpm: Replace g_alloca() by g_malloc()<br>
=C2=A0 bsd-user/syscall: Replace alloca() by g_new()<br>
=C2=A0 gdbstub: Constify GdbCmdParseEntry<br>
=C2=A0 gdbstub: Only call cmd_parse_params() with non-NULL command schema<b=
r>
=C2=A0 gdbstub: Replace alloca() + memset(0) by g_new0()<br>
=C2=A0 hw/misc/pca9552: Replace g_newa() by g_new()<br>
=C2=A0 target/ppc/kvm: Replace alloca() by g_malloc()<br>
<br>
=C2=A0audio/alsaaudio.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++=
+----<br>
=C2=A0backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------<=
br>
=C2=A0bsd-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br=
>
=C2=A0gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 34 +++++++++++++++-------------------<br>
=C2=A0hw/misc/pca9552.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0target/ppc/kvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +=
--<br>
=C2=A06 files changed, 40 insertions(+), 48 deletions(-)<br>
<br>
-- <br>
2.26.3<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000006d95be05c1aa0c4a--
