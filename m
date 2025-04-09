Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7725279njd;
        Wed, 9 Apr 2025 06:43:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f8b:b0:1f5:889c:3ccc with SMTP id adf61e73a8af0-2015aec7382mr4136904637.14.1744206239445;
        Wed, 09 Apr 2025 06:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744206239; cv=none;
        d=google.com; s=arc-20240605;
        b=JiDqRbh3xf6Gd6a/lZ0XMLluY/1PYfwbsqd9BrUCSciVYnKHw/6kYgeijEEaYksJDN
         obN+OjSfF7F39lyn/K/2eqRCO2qQxhCNktjWsq79UpdsfbepK48txPZiw2xX7aLHgsMP
         DMrIRuYRKGNDSTVspEhb8+3RyW3Z1JPCLh2o84afE01dsxFLVfx2bnyULy3C82mP3Dfo
         5HpED1jcmRoSCxrf62OTivALDB8osv0R4zJe7pXeAwWD4NhGcKeBv57gSG+TLWD/ZTpa
         5zQWs/Qstr1F85p0JfA4FBzgkXu/r0CUT51L4DSKS4PuluzjzwURZ2N4whdaeYn+toh7
         R/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7WRCxQ0fv6SIwvkMjGKsLDz17EPd/4X8bE5zQtlb7Dc=;
        fh=Fu5EfD2SM3xcPU+q+8oCnORyy+x+H1Fh51G2vYs956k=;
        b=JR8KoC5M6VGKgxhYtXrSIrZMs4euquFcvapDIK/JN2b0ix/B1yVcmh8vztB9PXyQE2
         7nNMmK2lCf+KTGMuDLbQfTKvuuuocshRVG8LtJ2EMK9BnKzRqcny/ctsOP2inVEjguDH
         sjBABSR/8eZXuRjKIIL0HAweoJVA/1myGXideIQmkmA9H0sOdWuQA40bj2K7OYHLJnov
         OQSWiaVt1WInWm3H2tVv2Tj6gD0TjGNQ7RUla0hV7eWY8OU8zFYRKmYEd/MxUw3n6C/j
         21jA8b9mpSZV3/4Ba7V+FMhKNb7I047lI1mFynipRymO/zdtyWw2EhLNLtLbRZ/SXw2r
         F0MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="H4O/JkH6";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b029dff2727sor766411a12.0.2025.04.09.06.43.59
        (Google Transport Security);
        Wed, 09 Apr 2025 06:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="H4O/JkH6";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744206239; x=1744811039; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7WRCxQ0fv6SIwvkMjGKsLDz17EPd/4X8bE5zQtlb7Dc=;
        b=H4O/JkH6DEms/g1HKXcBOf0JWTcV7xi1o9LrQRIZbXUVoSCEO7tAWXoOdV7Z9vwRtk
         6DT77i76r3Y+KG3fDx7FqhBmq6wgdTTtdFCqTk/BkP/TCOYVS+C/TBdGDijawWcYWiQZ
         61IJ0See/+/Vx3mDOZH00AiNmuUnQ84kuYSDcTy/7TkTkBePYNh64OvXmhgswnLvQTtO
         ZxkF5jQjTkWd1+HwOObqVGz8/TUZmnzafbRZNWgzFoKaWkvtz/y1oAhiMshlvoQ6QX1b
         1QGJ4n1zRGa9zCin5LEYVTfnPMYRSOeZzupf4EgH7N0T4xcTaapSKsSl9WqzjLr1hIK4
         ucrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206239; x=1744811039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WRCxQ0fv6SIwvkMjGKsLDz17EPd/4X8bE5zQtlb7Dc=;
        b=DTursw8S3Bmxo+HyojePacsegoJTUjQIAalsWKm8ESiyITqj21f6ukqb4wwQ3p8iZG
         rGIZZI+pIm5HlUbIOADXLnB+k80PSW0JR8PZJj8zH6Zu5gEXKU8H5U8ZtReXkZKsVzN8
         fAVB7ZsiZnRtZCuFzZFf2cKP6XkL0vU1wVICsKdM2Hy6KI+rEWqww5IP+pvsTOKoHaiS
         0LnVrFVllxJkYuJ+hz5JeqZ350rr+MzYxrgu/g7xhbHMZrNEult2XyrGV3T6dH4V1swu
         CmZexjrqG0vb51r240p1HUHql4/rd1CzEaAAa6FQ6rKhaRoKDzmpCMNUVMm87T8fSBiy
         r1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU1tu0dwgD+lpJRCzNMZgeo+ynIs5ib/5NVahOXN/E1OTAQemNy0xhfIy9sl6QBmjYcNvYpUBZWhipD351chyCMbAw=@linaro.org, AJvYcCX/vQD+nXQuhS+HXLuIwhzfwSiya12mKeLCt1T/LRfQbCSCkN2PeRgDnpFE+ALGwJU7ymFeHjhDa2AilBXR@linaro.org
X-Gm-Message-State: AOJu0YyB09DWgQCAGKdKMUBGvzbT5wahQN+bff5TKun3uTr0CfmQY5sE
	Gb/Gov1Yadrf4rDxkYi7SXLnbiQGlezGclJemmCKCGnyH8T0ZjWklzgHp09BVm3GJKnvOXBkY12
	WBPVyVBEP+5HtymEj98EvuGEVQoGlF+IUJrE=
X-Gm-Gg: ASbGncuCDfnmrb//qhU71EsC6D3EzMNLo9dRt3A3czpi9CzZdCoyrqqL+EItYFQmkib
	491SAj2zPMmKYjvoGfcyoJPSEZq7Tam3bRCg9H9ozW6mlA8ase5c2ZDF15iqswxdSvrTtQjyHP8
	+iAN5vZgAbfXVj/3TKcplSrV/YlJKeY5cWvYwV4VWuu4OKccoGvFqt
X-Google-Smtp-Source: AGHT+IFXWzfqLakx9M6dZ4ALZPiTfKwNqyqk2jNeFcKr4bAQKWLoP0KEuP5C/HqKpuL+JFdqJZAecFQa35Kb/Axltl0=
X-Received: by 2002:a17:90b:524c:b0:2ff:7031:e380 with SMTP id
 98e67ed59e1d1-306dd51c1fbmr3380071a91.10.1744206238901; Wed, 09 Apr 2025
 06:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <2be81d2f86704662c9fa33ceb46077804e34ac77.1744032780.git.ktokunaga.mail@gmail.com>
 <e6cbd3ae-356d-4805-bca1-90b0e98c4d0d@linaro.org>
In-Reply-To: <e6cbd3ae-356d-4805-bca1-90b0e98c4d0d@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Wed, 9 Apr 2025 22:43:47 +0900
X-Gm-Features: ATxdqUGJYbgVid8JPlWlvpIaqs2sT8XB3K0JkCxK41xJBRJFA261zBnrmDF4fJM
Message-ID: <CAEDrbUZwvhV_kiAZEdnk4AwPfpspEOLfhMsOuf_A+u2C4JK8fQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] various: Fix type conflict of GLib function pointers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000048f169063258a961"
X-TUID: W4b2P5uaUIOs

--00000000000048f169063258a961
Content-Type: text/plain; charset="UTF-8"

Hi Philippe, thank you for the comments.

> > +static gpointer g_qtest_set_command_cb(
> > +    bool (*pc_cb)(CharBackend *chr, gchar **words))
> > +{
>
> Why not use a GThreadFunc prototype, casting the argument?

Sure, I'll fix this.

> OK for the rest, but it might help to merge by corresponding maintainers
> if split in 3 distinct patches.

Thank you for the suggestion. I'll split it to distinct patches in the next
version of the series.

--00000000000048f169063258a961
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe, thank you for the comments. =
<br><br>&gt; &gt; +static gpointer g_qtest_set_command_cb(<br>&gt; &gt; + =
=C2=A0 =C2=A0bool (*pc_cb)(CharBackend *chr, gchar **words))<br>&gt; &gt; +=
{<br>&gt;<br>&gt; Why not use a GThreadFunc prototype, casting the argument=
?<br><br>Sure, I&#39;ll fix this.<br><br>&gt; OK for the rest, but it might=
 help to merge by corresponding maintainers<br>&gt; if split in 3 distinct =
patches.<br><br>Thank you for the suggestion. I&#39;ll split it to distinct=
 patches in the next<br>version of the series.</div>
</div>

--00000000000048f169063258a961--
