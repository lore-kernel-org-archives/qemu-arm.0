Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp349374njc;
        Fri, 11 Apr 2025 03:47:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:2ff:6fc3:79c3 with SMTP id 98e67ed59e1d1-30823639cd1mr3732964a91.9.1744368462078;
        Fri, 11 Apr 2025 03:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744368462; cv=none;
        d=google.com; s=arc-20240605;
        b=hpaLp/pR2m6QI/EAy9rlnhKgBS4EDq3wEePVseMF/5OJJS9vIP+UII01RoeqFj0rhA
         cVprsJZWtMeUKwZfraXQbtrnX8aV++kxxxcygg5YU1HS2/thlXF7+b0kDMmZtmNyeoOU
         pP2W3DOxzlLmyfygZ3q5CjmOaAxEu7ye9ntkodxfWl3Qwqf8SzEunqjWNS3dBDqHc0lR
         tjjSY7TRRmoLUhwvnrFizqDmpjZNdWDhURnMvpZCnoYKZR+ZGmaKorpZWgAaHwMcT3w7
         LunBwqfbWPlkID1IvWuj4gF2EA36KiEHIxNsIZWuZY8dQf9cxJburyIVqbbPDkUxM4V2
         GCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yvw1qpiZvXdgbFk/ijAFR0ZR5uTy5dD1wHsihqsCH4o=;
        fh=00q8HQvmDuctksKK0lZU67+kVSJsawxNwHQDYVoQQCs=;
        b=jM4h+EI0nn6MG+oOg0DoP82UPuZbdUJC40NKU8LssT6OWKIYCZg/1EIlX1DuWe42ps
         tc0oGHPZfzZcmf7h65dqq0IbxfPLbwZ38xXRWaLiZXnm+6mnOmo6yuDYVtvpAp8iI3ou
         wGDVuYBxMbrpycQ0Gp86227rutuIhIbuFjARrchNV17+hE5q9ykX3M/S6F2o61vPZPUY
         XzC+WLwKMUtSTVGmwQsbrcwpdleE0alUHlz8uoO+yFaQyGoB6g1N4l9Qrj6g78oXNRyT
         zXnZ7Nx81Ii5c8CmPFi++TfdswEmPvb5Yhci1kI7k+lZAR69Pmj6pQtfgbOszpFIlZDt
         wrWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhKKv+K4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-308186a4b4asor2897355a91.1.2025.04.11.03.47.41
        (Google Transport Security);
        Fri, 11 Apr 2025 03:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=GhKKv+K4;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744368461; x=1744973261; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yvw1qpiZvXdgbFk/ijAFR0ZR5uTy5dD1wHsihqsCH4o=;
        b=GhKKv+K4De+fFamuoVulI8tBvoXIdYeLwOzudn+3+7jHSEIU74vDeOt+8e2VSmJPlq
         xb2hSC5fUyCfkQ6SeJATZ0hIzXO9HBqSBp0rz45yo2gSqf3sYrk8fRMFH+2hsZXEj/Fp
         Gy7PNsGtBSv1JrwXzgF64OfT8euz57AqIHwdp+aI1J42XYcsGvnVa7VeDWhbUy1fu8Ax
         OntNoW6ZBkyq7GAfe2vCRas6rA6dmGZ96mmp0YeTdUIo9JwVQdwJR3/rfaZ1l0w4rrD/
         +YEO47uZGX03KL28KBT4nOE/KbQqhH4iZN2zlx+dQVvX3IWT7MvbY5q1fG61V9uasdmA
         GdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368461; x=1744973261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvw1qpiZvXdgbFk/ijAFR0ZR5uTy5dD1wHsihqsCH4o=;
        b=Va31S3ts/agwTGkzodhgemQjLgFVSGLWPZp8jahF+ScVKH67RdLjfpdptpzv085xCB
         BEDvQKKehGey2+enYgykDXXNRJYfeEJcuC33qc6V6MuQWeMcAzkpWPt3K79FZNtrO+fM
         BnIIiErnn+kUFAUTLhTaGx/PlavZtabNlr3XYdGvxS3wAh1RpyVSbvZeJnbPXnacyow0
         T/GFWruz3DsIXwGbshQJBCMLzkvRWhOH7ET8niRGCBDjok1vwhzyK8/98mB5a6pgc61Z
         21mSEuRQ/ITwYdrQYt9X2eemRNkRhZa83HSiDZzBibapjUgnIg3WdOUFFGvqBI5wUeLK
         ohVw==
X-Forwarded-Encrypted: i=1; AJvYcCVh2jJhak5bVI+zAXVBT2voXRbasOCXa+0/sBLk66wjoWjDPJAWIYdSGt78P3HrKEFEP+y7SvLzfTSACiA6@linaro.org, AJvYcCWwgiwJE/D/Y8/iEKYGt6xFe2a4UvPjHTLzB/TMOJRs9c2iofe9ZQ2Uup1kGmXUvnrCAKYsAQok@linaro.org, AJvYcCX3GJPHcCQV94FSGmIvcWGW/EwzJDXSrxjs11SmbvosZyRWJbUZkF44hiwvjjWLPB7kljK3VOr/txhlCCPXLbog6Z0=@linaro.org
X-Gm-Message-State: AOJu0Yy/VYTUN4KAB5Q8fiApsxIcJZrYwJk7EBr4Ub3hF6ewFoPTCQMc
	IQ8QvPAry8R3DiX/qscAsPZCbkrLkZX+Cgg9nuyAaQr+SVFqx122fLbXVawrO4Fx6iWGZ4ynkbY
	LwfHIoOV/kifmULpQnJ7cvP7aVqc=
X-Gm-Gg: ASbGncs8509Ib/inDwfKMVMIMngYuLzfnOGxQec8j2yFp2Gk/WQT/iq3yTNsGpKE6KW
	LH6kQRiS3Ap6GofTl0bKb29G1fObhkF7gbVtjrK4yvnRvwZJJMBtxHExALRpoRQ5lUT98yCSkE2
	ZvGVJmW7XaIi+kPM3/F61lMxIHDcvjXwLD5GufjFgHUcySynXQzlg=
X-Google-Smtp-Source: AGHT+IHjbs9m+z+e94TJb3e7CG9XODeW5lUdjRpjtd5HNDd9iKKtsBGZ1SDt1OELhDLcyYh94lcP2B/5W2qgdUMSRpI=
X-Received: by 2002:a17:90b:5445:b0:2ff:5cb7:5e73 with SMTP id
 98e67ed59e1d1-3082367ee62mr3174944a91.23.1744368461443; Fri, 11 Apr 2025
 03:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <16376e4b63fad6f847ceadb39b8f9780fc288198.1744032780.git.ktokunaga.mail@gmail.com>
 <2533109.DitPQcejgS@silver>
In-Reply-To: <2533109.DitPQcejgS@silver>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 19:47:29 +0900
X-Gm-Features: ATxdqUEAuriu9KMt6MEeuc8iKnkGaLyjjVKXC_7kL7uGQCcBfZujtuc6BXyjNkE
Message-ID: <CAEDrbUakVwwn228nSb0rD1C9qiZ-tpcHBzLRDVyGRNsim97=JQ@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="00000000000080787106327e6e7b"
X-TUID: YumMNrjH0I74

--00000000000080787106327e6e7b
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

> > Emscripten's fiber does not support submitting coroutines to other
> > threads. So this commit modifies hw/9pfs/coth.h to disable this behavior
> > when compiled with Emscripten.
>
> The lack of being able to dispatch a coroutine to a worker thread is one
> thing, however it would probably still make sense to use fibers in 9pfs as
> replacement of its coroutines mechanism.
>
> In 9pfs coroutines are used to dispatch blocking fs I/O syscalls from main
> thread to worker thread(s):
>
> https://wiki.qemu.org/Documentation/9p#Control_Flow
>
> If you just remove the coroutine code entirely, 9p server might hang for
good,
> and with it QEMU's main thread.
>
> By using fibers instead, it would not hang, as it seems as if I/O
syscalls are
> emulated in Emscripten, right?

Thank you for the feedback. Yes, it would be great if Emscripten's fiber
could be used to address this limitation. Since Emscripten's fiber is
cooperative, I believe a blocking code_block can still block the 9pfs server
unless an explicit yield occurs within it. I'll continue exploring better
solutions for this. Please let me know if I'm missing anything.

> Missing
>
>     errno = ENOTSUP;

Sure, I'll fix this in the next version of the series.

> Looks like you just copied the macOS errno translation code. That probably
> doesn't make sense.

Errno values differ between Emscripten and Linux, so conversion is required
here. I've used the same mappings as macOS for now, but I'm happy to add
more conversions if needed.

--00000000000080787106327e6e7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Christian,<br><br>&gt; &gt; =
Emscripten&#39;s fiber does not support submitting coroutines to other<br>&=
gt; &gt; threads. So this commit modifies hw/9pfs/coth.h to disable this be=
havior<br>&gt; &gt; when compiled with Emscripten.<br>&gt; <br>&gt; The lac=
k of being able to dispatch a coroutine to a worker thread is one<br>&gt; t=
hing, however it would probably still make sense to use fibers in 9pfs as<b=
r>&gt; replacement of its coroutines mechanism.<br>&gt; <br>&gt; In 9pfs co=
routines are used to dispatch blocking fs I/O syscalls from main<br>&gt; th=
read to worker thread(s):<br>&gt; <br>&gt; <a href=3D"https://wiki.qemu.org=
/Documentation/9p#Control_Flow">https://wiki.qemu.org/Documentation/9p#Cont=
rol_Flow</a><br>&gt; <br>&gt; If you just remove the coroutine code entirel=
y, 9p server might hang for good,<br>&gt; and with it QEMU&#39;s main threa=
d.<br>&gt; <br>&gt; By using fibers instead, it would not hang, as it seems=
 as if I/O syscalls are<br>&gt; emulated in Emscripten, right?<br><div><br>=
</div><div>Thank you for the feedback. Yes, it would be great if Emscripten=
&#39;s fiber</div>could be used to address this limitation. Since Emscripte=
n&#39;s fiber is<br>cooperative, I believe a blocking code_block can still =
block the 9pfs server<br>unless an explicit yield occurs within it. I&#39;l=
l continue exploring better<br>solutions for this. Please let me know if I&=
#39;m missing anything.<br><br>&gt; Missing<br>&gt; <br>&gt; =C2=A0 =C2=A0 =
errno =3D ENOTSUP;<br><br>Sure, I&#39;ll fix this in the next version of th=
e series.<br><br>&gt; Looks like you just copied the macOS errno translatio=
n code. That probably<br>&gt; doesn&#39;t make sense.<br><br>Errno values d=
iffer between Emscripten and Linux, so conversion is required<br>here. I&#3=
9;ve used the same mappings as macOS for now, but I&#39;m happy to add<br>m=
ore conversions if needed.<br><br><br></div>

--00000000000080787106327e6e7b--
