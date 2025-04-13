Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1363620njc;
        Sun, 13 Apr 2025 01:12:23 -0700 (PDT)
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr136482905ad.28.1744531943329;
        Sun, 13 Apr 2025 01:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744531943; cv=none;
        d=google.com; s=arc-20240605;
        b=bLZZj5YjYTJfwRcqtNcYbUQvv9P7kRQnFJbXPtia8k8UL05+0Om9HbpPf3/2ff9HyH
         e4pAqNiOvwq2qsMDNZvZi7W7YHOtHrBqXEKmeQ/b/g2RWNtW03SUkTBdc+cJxTHRUFwa
         jmj5HUngiX1nW+18NLEB4mRiBEtCID/gjrmTMcZem0h3MKi2jQ79Cp9Zj7lIp2a0HtIT
         1gQHF4v1zpGqNs28eOgcaB8EsMjscoEpRJpt6URILThN+8hivp30u7EunKkRrBW6c+ID
         l4I4txzVmiaH3qbu2AniTxoVJ+9l8qvDnKrMc+AY4xsK5+mYZxdFKQhgoSKW5ET3hXun
         sZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hHYxAPG4HscecFbl3SvusMDS+87Gf+gDrve/uesEeXY=;
        fh=97SFk7RtPzx5Tc9U3/LyUXgT8p8xE4tL7mydTuaWbKk=;
        b=g4zwVnybfcMWtVtcNpD7FeHVDlj0Fl6HzGOGW1K8PJ6XMeqxNlWXkCZdaVd4JIMClR
         U3EfC7WJswuuzsYCIpmhmXwvXuhTz6CldQAnHwv9OSGPEFyL3PaU4iAEc3PcD5yEw94+
         cmx3RHCo24OoTZA6aVce3KJ9SAIkzrQQw14e2VxRvq8/ORViIj9J0NFDHLlAVTjkGOud
         jwMTbC+ymcrtIf6Hv31eGgBmrW6EZkucmtpIQNnVlzb2rSyvc2tUJmGDEXRG1Y+K5sYP
         QAowPlWibBcy5vsJJZW6sKMHer4Tdb6hwbHoi+Nn3RNmaogToDnGsQKovlQ2uABEfrpV
         2kog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/6WNoxF";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b3a469sor62145245ad.3.2025.04.13.01.12.23
        (Google Transport Security);
        Sun, 13 Apr 2025 01:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="P/6WNoxF";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744531943; x=1745136743; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hHYxAPG4HscecFbl3SvusMDS+87Gf+gDrve/uesEeXY=;
        b=P/6WNoxFdkAFEZnw2yK5dS5g1oiN0KrU13r+hHZOKiIqM9TgVGPwjILaxjfMf+bX9p
         YVpCM7l9gi4IIplZ+COCkDpzboRYSW6bU5UfRgK3qR2lh0cYfOTUOrT8cHdkhWRVAKdg
         Oko5I3tsb88wFJ7G/x51UkfsdweRB3pt/HlAANFIOPVZLJv5TF6m1nmO4y3w4uIUjfhP
         eVzW9Q8Z2d6y65j/wD5dzFD/Wx4vzoHBVtLkZw0ar/+zNVeubjxZPs8XAEd6ZEUZwilL
         P6BMuoe6c8WG26VU7tYzStbfg4NEEWUJYQtLcqPLxWmcB9lzOTYUwEST/5EDA9O5o8iX
         CYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744531943; x=1745136743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHYxAPG4HscecFbl3SvusMDS+87Gf+gDrve/uesEeXY=;
        b=U8SQT6DGF8PDPsQmPX3CIo0vUgUgLuOAMF+IHKy99aAH89/nyuPpa9nGq9+CHcXXMK
         93ipABf0Uq3rFNHZESobkJuzbzBhCHLTkPYRfOs4DTC16XhGNDRWEaSHuE7+0gvlmtR9
         dMpCijTaJmJVmWtvAusX3xzBNmlePlS0TMJnZwUIGDzboMVkB3XBtMuP0Su3QEOPH34j
         Vn51B8QnZS95hFH6DMLoPl8XQ5Mjb0EuZYDOus8+RYmR/y513wFJtKngdVWsu4vFY2A6
         iBttzg5H/VkPARz2nOFH0HjsAdRFN1lVKpKFTBcmk9Ord+U4qdDRJMVH2U4HvnZ3IO6f
         HLqw==
X-Forwarded-Encrypted: i=1; AJvYcCW4L1g+uC/IBq1ATDviQCWxhgOu4UNmnSBtshMOC7+0CCOw451PYcf+5pVJZQ052PCgn5uDf/+7@linaro.org, AJvYcCXsLSptcATH/aJdhWY49NxLEhZ4uUg6hlkUXIPcV9H4jPcaSUSqc7mDhM5qsCChR923Y0sa4EdyXm4iLaJ3dR5Fjzk=@linaro.org, AJvYcCXzo4mi4MJyVEg7fqWQWvUzjJ+WzmtkJ8Fajpw3U7TeTuu0w0PV2lmKzx2XCCJKdGVi2rmjWd37UqF0Pmav@linaro.org
X-Gm-Message-State: AOJu0YwgKveI0xI1CYCe/UdFs+f/+qQQg0RXoMKhDl92gINJT1wUpZSr
	vKUBg4ItkQ4G/6pqYlf9DpOj4GaoTNMrcwPu+7nZNXLfrPiE+VdjlNOLXBkljrf58/rR/R2OBcr
	ooycPWctC9vlRfR9VXTAnRDAcHtk=
X-Gm-Gg: ASbGncs1baonlmXEfpOh/ZpqTRUeBudJjlwMQOLs7Tm+VvoJ8srSZ9hXhYtUcXYpdsz
	bXHbebcpEBLNfLqYvIfsleW3n/CxW7bvOiT3Rx0GBJj6ejHV/wdpwwVLKhDeXAPAFuVKVfW8yPs
	H40W0adXtAloQii9Wf5xwGTCcYU8lRVc1zrJ9Dk8rKspVQ4+3UETZMftOeZSjCZMg=
X-Google-Smtp-Source: AGHT+IHy0gvR1OFRk8acELSes8+gRhq2dCuronrYZVqAn7WS9DbS+UAmjnsgmS/ItTPvKZeQdoLA36F8fXZ73YBaIew=
X-Received: by 2002:a17:903:904:b0:227:ac2a:1dcf with SMTP id
 d9443c01a7336-22bea4bd870mr117487785ad.23.1744531942469; Sun, 13 Apr 2025
 01:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <2441396.svyq9LpYvz@silver> <1881242.gqbg26PhFk@silver> <2555565.yjhJSkacHZ@silver>
In-Reply-To: <2555565.yjhJSkacHZ@silver>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sun, 13 Apr 2025 17:12:10 +0900
X-Gm-Features: ATxdqUFCEpYT280w1rb2J-M5TCyeizlaYvOi8cl4BFqwoKHudFfCjvr67FXjTsk
Message-ID: <CAEDrbUYKJvXVpaBjyde5=Lp9+rAv1oBJbYf9ZewepQgMhegXZg@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/9pfs: Allow using hw/9pfs with emscripten
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000baf7aa0632a47e35"
X-TUID: JYFaIYqCZvpo

--000000000000baf7aa0632a47e35
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

> > > > Emscripten's fiber does not support submitting coroutines to other
> > > > threads. So this commit modifies hw/9pfs/coth.h to disable this
behavior
> > > > when compiled with Emscripten.
> > >
> > > The lack of being able to dispatch a coroutine to a worker thread is
one
> > > thing, however it would probably still make sense to use fibers in
9pfs as
> > > replacement of its coroutines mechanism.
> > >
> > > In 9pfs coroutines are used to dispatch blocking fs I/O syscalls from
main
> > > thread to worker thread(s):
> > >
> > > https://wiki.qemu.org/Documentation/9p#Control_Flow
> > >
> > > If you just remove the coroutine code entirely, 9p server might hang
for
> > good,
> > > and with it QEMU's main thread.
> > >
> > > By using fibers instead, it would not hang, as it seems as if I/O
> > syscalls are
> > > emulated in Emscripten, right?
> >
> > Thank you for the feedback. Yes, it would be great if Emscripten's fiber
> > could be used to address this limitation. Since Emscripten's fiber is
> > cooperative, I believe a blocking code_block can still block the 9pfs
server
> > unless an explicit yield occurs within it. I'll continue exploring
better
> > solutions for this. Please let me know if I'm missing anything.
>
> As far as I understand it, the I/O syscalls are emulated, and when being
> called by fibers, blocking syscalls would imply to yield under the hood,
> without explicit yield by application that is.
>
> If that's true, it would only require little code changes for this to
work.

Thank you for the information. Yes, I/O syscalls are emulated by
Emscripten. While I haven't found documentation or implementation details on
whether Fibers implicitly yield on blocking syscalls, I'll continue to
explore this approach.

> > Let my answer my own question: I just checked the wasi sources. The
errno
> > values are hard coded by the wasi API, consistent over systems. So the
current
> > mapping of this patch is wrong. macOS uses a different mapping than the
wasi
> > API.
> >
> >
https://github.com/WebAssembly/wasi-libc/blob/main/libc-bottom-half/headers/public/__errno_values.h
> >
> >
https://github.com/emscripten-core/emscripten/blob/4af36cf80647f9a82be617a0ff32f3e56f220e41/system/include/wasi/api.h#L116
> >
> > So please use a correct mapping as defined in that header file.
> >
> > /Christian
> >
> > > Alternatively 9p2000.u protocol variant could be used for Emscripten.
Not
> > > ideal, as this 9p protocol version is somewhat a legacy protocol from
QEMU
> > > perspective, reduced performance, less reliable, but it transmits
error
> > > strings to client which it can map to correct errno values by itself.
Linux 9p
> > > client uses a hash map for this errno translation of 9p2000.u error
strings.
>
> Stupid me. That's host errno -> Linux errno translation. So your values
are
> obviously correct, sorry!
>
> However still worth comparing the Linux vs. wasi header files on this.
>
> And I would avoid duplicating the macOS translation code. Instead I would
just
> do a one-line change:
>
> #elif defined(CONFIG_DARWIN) || defined(EMSCRIPTEN)
> ...
>
> And probably leave a comment with a link to the wasi API header file
there, so
> in case new errno translations are added for macOS, that people also check
> whether those macros exist in the wasi header file as well.

Thanks again for the suggestion. I'll apply this change in the next version
of the series.

--000000000000baf7aa0632a47e35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Christian,</div><br>&gt; &gt; &gt; &gt=
; Emscripten&#39;s fiber does not support submitting coroutines to other<br=
>&gt; &gt; &gt; &gt; threads. So this commit modifies hw/9pfs/coth.h to dis=
able this behavior<br>&gt; &gt; &gt; &gt; when compiled with Emscripten.<br=
>&gt; &gt; &gt;<br>&gt; &gt; &gt; The lack of being able to dispatch a coro=
utine to a worker thread is one<br>&gt; &gt; &gt; thing, however it would p=
robably still make sense to use fibers in 9pfs as<br>&gt; &gt; &gt; replace=
ment of its coroutines mechanism.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; In 9p=
fs coroutines are used to dispatch blocking fs I/O syscalls from main<br>&g=
t; &gt; &gt; thread to worker thread(s):<br>&gt; &gt; &gt;<br>&gt; &gt; &gt=
; <a href=3D"https://wiki.qemu.org/Documentation/9p#Control_Flow">https://w=
iki.qemu.org/Documentation/9p#Control_Flow</a><br>&gt; &gt; &gt;<br>&gt; &g=
t; &gt; If you just remove the coroutine code entirely, 9p server might han=
g for<br>&gt; &gt; good,<br>&gt; &gt; &gt; and with it QEMU&#39;s main thre=
ad.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; By using fibers instead, it would n=
ot hang, as it seems as if I/O<br>&gt; &gt; syscalls are<br>&gt; &gt; &gt; =
emulated in Emscripten, right?<br>&gt; &gt;<br>&gt; &gt; Thank you for the =
feedback. Yes, it would be great if Emscripten&#39;s fiber<br>&gt; &gt; cou=
ld be used to address this limitation. Since Emscripten&#39;s fiber is<br>&=
gt; &gt; cooperative, I believe a blocking code_block can still block the 9=
pfs server<br>&gt; &gt; unless an explicit yield occurs within it. I&#39;ll=
 continue exploring better<br>&gt; &gt; solutions for this. Please let me k=
now if I&#39;m missing anything.<br>&gt;<br>&gt; As far as I understand it,=
 the I/O syscalls are emulated, and when being<br>&gt; called by fibers, bl=
ocking syscalls would imply to yield under the hood,<br>&gt; without explic=
it yield by application that is.<br>&gt;<br>&gt; If that&#39;s true, it wou=
ld only require little code changes for this to work.<br><br>Thank you for =
the information. Yes, I/O syscalls are emulated by<br>Emscripten. While I h=
aven&#39;t found documentation or implementation details on<br>whether Fibe=
rs implicitly yield on blocking syscalls, I&#39;ll continue to<br>explore t=
his approach.<br><br>&gt; &gt; Let my answer my own question: I just checke=
d the wasi sources. The errno<br>&gt; &gt; values are hard coded by the was=
i API, consistent over systems. So the current<br>&gt; &gt; mapping of this=
 patch is wrong. macOS uses a different mapping than the wasi<br>&gt; &gt; =
API.<br>&gt; &gt; <br>&gt; &gt; <a href=3D"https://github.com/WebAssembly/w=
asi-libc/blob/main/libc-bottom-half/headers/public/__errno_values.h">https:=
//github.com/WebAssembly/wasi-libc/blob/main/libc-bottom-half/headers/publi=
c/__errno_values.h</a><br>&gt; &gt; <br>&gt; &gt; <a href=3D"https://github=
.com/emscripten-core/emscripten/blob/4af36cf80647f9a82be617a0ff32f3e56f220e=
41/system/include/wasi/api.h#L116">https://github.com/emscripten-core/emscr=
ipten/blob/4af36cf80647f9a82be617a0ff32f3e56f220e41/system/include/wasi/api=
.h#L116</a><br>&gt; &gt; <br>&gt; &gt; So please use a correct mapping as d=
efined in that header file.<br>&gt; &gt; <br>&gt; &gt; /Christian<br>&gt; &=
gt; <br>&gt; &gt; &gt; Alternatively 9p2000.u protocol variant could be use=
d for Emscripten. Not<br>&gt; &gt; &gt; ideal, as this 9p protocol version =
is somewhat a legacy protocol from QEMU<br>&gt; &gt; &gt; perspective, redu=
ced performance, less reliable, but it transmits error<br>&gt; &gt; &gt; st=
rings to client which it can map to correct errno values by itself. Linux 9=
p<br>&gt; &gt; &gt; client uses a hash map for this errno translation of 9p=
2000.u error strings.<br>&gt; <br>&gt; Stupid me. That&#39;s host errno -&g=
t; Linux errno translation. So your values are<br>&gt; obviously correct, s=
orry!<br>&gt; <br>&gt; However still worth comparing the Linux vs. wasi hea=
der files on this.<br>&gt; <br>&gt; And I would avoid duplicating the macOS=
 translation code. Instead I would just<br>&gt; do a one-line change:<br>&g=
t; <br>&gt; #elif defined(CONFIG_DARWIN) || defined(EMSCRIPTEN)<br>&gt; ...=
<br>&gt; <br>&gt; And probably leave a comment with a link to the wasi API =
header file there, so<br>&gt; in case new errno translations are added for =
macOS, that people also check<br>&gt; whether those macros exist in the was=
i header file as well.<br><br>Thanks again for the suggestion. I&#39;ll app=
ly this change in the next version<br>of the series.<br><br></div>

--000000000000baf7aa0632a47e35--
