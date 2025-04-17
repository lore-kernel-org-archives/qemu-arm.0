Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp646090njk;
        Thu, 17 Apr 2025 02:44:11 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-22c359a37e1mr91322395ad.46.1744883050834;
        Thu, 17 Apr 2025 02:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744883050; cv=none;
        d=google.com; s=arc-20240605;
        b=A2xjFNMHjJVBvgo+Dc6hPW/NSyChujp+WNwmBUTOpXgA8vgC0gbAyzjqN9k5mJLZC2
         IZ7EfL1NSWsvwEK4pSquN6Us02kc/l4sqgmKZl9GF+iV9me2Vufq7hQbshcF39gYCSkv
         pGKyS8fRQ61RKm6ZGyhfR9OF74XUjflV6OT8bPow3MVqlNfWmqiceVIkZH9JQnnM7jA7
         REWCILwBVpXZ1l+RQmIK9YpAD2ow0rjLKF/ceYYyQo4Ck/Y0mBO8Gwr2UxpTG8YSZypy
         CCdFuD0USu2d+IMbP12z2QYJbnnjL2or1I5RMWWOIrCDGxciocrZ/P5jAcLgjVw8B14k
         N3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PA0EhDX6QJBxQ9JHECAPsX3Ldf9jQbhyeu8Jda0RX8k=;
        fh=1tNGntuikegAzE96zaeG9F3IG3GilOmMrA/StQw+9DQ=;
        b=DpnpKBtIutryPww1RS9nowT7C9OYsjFfnA8vNGyP0FaWNRdlF0ibNZYShrFzr3mL5u
         /2VHqvoIiLvp1IBruqZUJTzs4brdQFONBS/pmg0FywCWvHLlP4WETocojWn4AWysl+xP
         9MUh3Jowyzt3tZoNn+rpwN3I6hLQxif33Xn0LzOFolv7KBE0YEah02AUUAkNJHmMLTqc
         uJEFgHW0EBEWLQlTajVVEpgyIpHcNJX4oJBdSmUZVh5o60cDqFq27J2aVIqBvnBO3aMy
         IpCCqrfFP195bXNf3mgXyDRkeKFXnlv0dV1je+wdNbbKFNts1MKHZE6A8ScpFA0wnS7p
         aS4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0Ius92+;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b02a2b21037sor13518410a12.6.2025.04.17.02.44.10
        (Google Transport Security);
        Thu, 17 Apr 2025 02:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0Ius92+;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744883050; x=1745487850; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PA0EhDX6QJBxQ9JHECAPsX3Ldf9jQbhyeu8Jda0RX8k=;
        b=m0Ius92+v7TL73FS8z4o0Vox9iEMlHd+lRNc71SfXC1pgvqsVOwhYXnkijIHQkbiLZ
         Y9uAq7cq/8WZUunkn/jS0koKh83PNyPP4ecvM3e5il1dzbt/fNq5KxGP09TDkSRNP2uc
         HS9I8IfA0j9BokS8UBtQAASHvIY2L7qwYiMcrdWsBtKLr2pUt+VMCq6u8CY+tA18uWbV
         L27YywOtSKQPD1JBJWdjLgxMWpfYcAwaXVd+/kbxG0ET0ra0w+l2WMon52XHPQz9zhfX
         72SKfth8ujUUgG92ZvyM6u+e5O7zwsSWEvPMKUIYw5nBNDHPmNsXDlan8tJjdgRasRsl
         cLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883050; x=1745487850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PA0EhDX6QJBxQ9JHECAPsX3Ldf9jQbhyeu8Jda0RX8k=;
        b=tzJ7Zno1uCNvnYwss+GN/JUoO9d7XbdjhbzTj0/YcQxdUtmpzgpaRH+VcW54A5HT5i
         LCU9TCdIqIuLFP6oX7aZLzpo2THfBWCMNyYzu3YZ0BYjBDrnwM2/PmImH1p4/GKSJ5yV
         IDMiA318ssUZhBpwRKhXpPyvCPoM/9MqiR9VQTMLJEXjCKuderrZDIg0gYDsNkiGGD8H
         YX1ZsWtrBhVW26f6w+QKfyvxBwgased4hwwHO8P7ikeuw1JTEftkw86UcD/xEOK/aii6
         YX3VVD+611eybkQRzutp8HA0+Z1gFW+VqnSMnWeKEFocPFVH9q/w0Fik3OAbE4OWRO7T
         +t5g==
X-Forwarded-Encrypted: i=1; AJvYcCVkyHsl7YlQCgm7e7B4bFAH9B758f3s6BwGDl0n3gvApiqrPSc3wkgefZp2HabHPFB+xR7Z9D6N1IYS6SCnPr03bxo=@linaro.org, AJvYcCWTDrA9uZus6lfwOmdNJSVrvc5OyptPdpH/Eg8IMDggnzy344M2acMCBSpBtBYnoM0Rgnud2tWutyC7V/ZO@linaro.org, AJvYcCX2Z+yIBkgn9+dMqx7sZgz3m7w7PGY2KcDp/kNPaIHzzEj4FXtaeDAHRgmt1KqLRwhhR41JW0UiVck9Cm/M1SbGnw==@linaro.org
X-Gm-Message-State: AOJu0YwqtBsMB2RXxL34mPuP9LjGovq6imC3FqPkjxEbHqtFF59TJRva
	reg4rsCnWmpd93IrvzGOF5QwDQGL26Pxe53k3qVOEAlkSDilcD8mpIq6r0/JdW30SfXTVDOawNP
	NU80qzDk7cXrDf5fJhyHOvaQ3lfvN8RIufHQ=
X-Gm-Gg: ASbGncsFqvOXM3NJrFyxhkmc5F8sDTp9Wj219usjsfOarOJqv1dKgS9/4KdUQipB3Zg
	3dkB7l+HKFAVtyBlDuyYt6E60KJm9wXN2XFz+hyfPEEvHQAABVH8nDeA/ahmOD2SC9eYs8UfWb4
	HlYiWsMPAvq+maiZ/TnwiL/TNRqzDOclXAMNu8S1hKk4/D/yU7Ia4xwMWXA+CbMX0=
X-Google-Smtp-Source: AGHT+IHP+JdDahQbg6xYUOyNaJJYXnktpp96kZVSTGHw6qU/aRtTi9EOIC5ZHd/OTbOGXwEL72s43vG5bJrGFksqvzE=
X-Received: by 2002:a17:90b:2751:b0:2ee:db1a:2e3c with SMTP id
 98e67ed59e1d1-30863d1de40mr7383316a91.1.1744883050265; Thu, 17 Apr 2025
 02:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
 <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
In-Reply-To: <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:43:58 +0900
X-Gm-Features: ATxdqUH24IWgEAi8slkXOhtMExdzhUW_bsxEeDlGrnxlTkQ4nrqfQ0a-aKKUpPM
Message-ID: <CAEDrbUZwqRnxhxAfSJXPHqpAiYWwxo0+QNP311H2H6rX8Tyjpw@mail.gmail.com>
Subject: Re: [PATCH 12/19] block: Update block to compile with Emscripten
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000062c6830632f63e52"
X-TUID: VrUWJCsgv2b/

--00000000000062c6830632f63e52
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> I'd include in this patch this hunk from patch 17:
>
> -- >8 --
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 63392f5e78..4fd4d362f9 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -89,3 +89,7 @@ if have_system or have_user
>     stub_ss.add(files('hotplug-stubs.c'))
>     stub_ss.add(files('sysbus.c'))
>   endif
> +
> +if host_os == 'emscripten'
> +  stub_ss.add(files('emscripten.c'))
> +endif
> ---

Sure, I'll move that hunk into this patch.

--00000000000062c6830632f63e52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,</div><br>&gt; I&#39;d includ=
e in this patch this hunk from patch 17:<br>&gt; <br>&gt; -- &gt;8 --<br>&g=
t; diff --git a/stubs/meson.build b/stubs/meson.build<br>&gt; index 63392f5=
e78..4fd4d362f9 100644<br>&gt; --- a/stubs/meson.build<br>&gt; +++ b/stubs/=
meson.build<br>&gt; @@ -89,3 +89,7 @@ if have_system or have_user<br>&gt; =
=C2=A0 =C2=A0 stub_ss.add(files(&#39;hotplug-stubs.c&#39;))<br>&gt; =C2=A0 =
=C2=A0 stub_ss.add(files(&#39;sysbus.c&#39;))<br>&gt; =C2=A0 endif<br>&gt; =
+<br>&gt; +if host_os =3D=3D &#39;emscripten&#39;<br>&gt; + =C2=A0stub_ss.a=
dd(files(&#39;emscripten.c&#39;))<br>&gt; +endif<br>&gt; ---<br><br>Sure, I=
&#39;ll move that hunk into this patch.<br><br></div>

--00000000000062c6830632f63e52--
