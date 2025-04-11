Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp354342njc;
        Fri, 11 Apr 2025 03:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:339d:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-20179972f70mr3840779637.32.1744369191501;
        Fri, 11 Apr 2025 03:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744369191; cv=none;
        d=google.com; s=arc-20240605;
        b=PCNcpLlyYrtxzJ93wuLJbWR0cdnyJ7csWa+MvGD8BV0T6XaNK0wbme9x52RsbVAM/5
         q3r+P7UZ7CaEtSCDY9ya0shkpY4wVa4sJWq6Q2TIMaah1jA/y7xn0+Q4swrQj5PVxMo/
         28CWbTiK4wXsw1RK+7DCRBPpmDTM8CXaOuZMKdQEXRMOpaLsqlNNH8NLTFiWkXpvKRAk
         JdbzSk5Fu50pEHASDv4px1hl49SkPHekfWJjWc7RzOLK+wpEkVkzc3hZmKBDQVXJJsc2
         qJHv98QitKVg+bA4ri32rTbQkuhi0PTNNYyaMUYFh6TRZmCxbo6oxcNGryRhp/rJMSvH
         EznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oVuOWbJrwKWkgdC2ARq1ig1b8sNfy4nE1XFpACDLWmE=;
        fh=ZRd4M29UIMbU+YXuPvb28v7lDZ0pVjV/ImfjHD7oZe8=;
        b=HCsNXO5fTAJYoYQfDET0yTUQFjygPEpyq0nO91B4WsvDr5dULrvq9o07ZrsYQYuYti
         Bq0j4UZbrwxH9fkZW8pWumUOEgrueO8xGg1O95ep56OSXPQUzpVicuqnG1VRkOVD0yr4
         /Qo47cjaZGi9MuXm91m310kesA6Sg+fAQfSPvyu0XvtcDyBQmgNV/6UHfZM1dCxqHInN
         9TEA+Vv2vjuzX2/otedAzG6z/B2B7fIIZW/ym2Blwn8qeQ3pLpgjAqzDOm828PXAlwIi
         l5Ok2xNdXnKZoFHkXy5Uz0u6BxTgIdJ3DVTF1NPrCl1dBX4xwBIQrf0C5bDaLt138rYb
         en2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGHgtygC;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b02a2647918sor3383581a12.6.2025.04.11.03.59.51
        (Google Transport Security);
        Fri, 11 Apr 2025 03:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGHgtygC;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744369191; x=1744973991; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oVuOWbJrwKWkgdC2ARq1ig1b8sNfy4nE1XFpACDLWmE=;
        b=nGHgtygCa8PCEW2yJwa9ySqhXSbYf2V8d0XsfMp/3iVjCl4KQVpG1grYBdZKb/o+cy
         bYNSNymptO3je6hEei1YaYVwquypiSw0ztTLRhb7uzwEWbf8RPeUzrVqgg5I5SJBAg/5
         XmQH/xLEwmK/bTDttBxpzi6T1lCRxDOe6Jzkdna39q3irMfAFPJ+wEA0ZOIW6pnDlULb
         fJrTcHmeAXa4+DciK9uJCto9MVMm87+ZTSi+YmbJNyIRjfpzehpHnvAJAgg12uAscrdT
         WEmyFkMCZImAzqhnwrNI2dewmGlKk8b+SbsqkLaVqhTbeDTdyRQ95f9XFHadVouksd5K
         eXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369191; x=1744973991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVuOWbJrwKWkgdC2ARq1ig1b8sNfy4nE1XFpACDLWmE=;
        b=dBOlZPHwi5Or0+pWRlpkrHEmsbnz04bhVdGhVlhsnZpES7gQ1ZQQh9JfXpoUSh8r0H
         BAST93insNFpRqkdguHBqMwmKFwcRJMFfK1ze8z6+sGd+vgZajQapvbM2/i7UAvSNmm0
         jOfucodEpdKZLvHnKXO0fQFiVwt7XQDfRO09R4Gft79etaldJYPUpbhN9QqMvD/ZKra7
         AFu5AP1Wvu9UImrH69NblIaLNotW79OxfXycBG2KNh1TYDqurYXdbO8IyTBNSm2183ui
         SrwdsfWH6n05rQJaz1+eiPRzzY1CMEMcR99TROR1uyWZSZEjT9gplU/U9WgPPPh+lSQC
         kXhA==
X-Forwarded-Encrypted: i=1; AJvYcCU2gwRkNpWzA13NBaV/0VWQk/EJ8fk3d3j4QDcD5M17aaKZAsccUeW+25+LzMwkmxnLOdOtVCso@linaro.org, AJvYcCUUqbnXZ7eEf+nlg0DwPHl4Ndsm0LhhyD6lg5gDNJCm1GOQOOWOAmMC9SMZnISpVkHXnJAkwcdNvt4v0FhucRcQC3w=@linaro.org, AJvYcCXtUN9XLvpASCK27GrZmlibX7mxKN+FQgMumUmhLJql9UDYQV8g5irDgYui73/ELMNWthIGOvD6g7BY5TiX@linaro.org
X-Gm-Message-State: AOJu0Yw/iFJwysT9JIFrIXoNQakKFYhQiKeh/BRQasajtBuRfM9Un4JC
	1DfwV2P579BjGmFKZAWVQIA+IaOaHvI9zdK9RViIdAfGuRSLsbdCqA3uKAkaPDR6tZ3muJwf5GP
	dRX7KR5eK2ko2RKzULlNfDFoQ9Rw=
X-Gm-Gg: ASbGncsUsZoVBlb15avkxMKl8Eh/GMXFz8ourJv9tkoCOJUuxec0JIopMndnhikZDKV
	8JLoEESOYbit3GScY919Vw3FKGEQdX/nBP27Q4tcBP9KwTXfEMuixe2HSC+WmJ2EzS4jG5ch6Sk
	AIZWNikxnOj97Z6PcVdfpEXrodsYdIL6Ynq6ZR9GeBgc12erxNILfzNQNwWicRNA==
X-Google-Smtp-Source: AGHT+IE2GpFosUiKjNelR08dxR71Fb2diAnjKjNXQdm1S7hWRCm4/ZwKDdKMgR+roDIOCCKXjYPq4t10aHUklRgW8P0=
X-Received: by 2002:a17:90b:5823:b0:301:1d03:93cf with SMTP id
 98e67ed59e1d1-308237c0c88mr3646020a91.30.1744369191004; Fri, 11 Apr 2025
 03:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <5f2a8fa2d7116b1d65b79fbb3a95244096fb7308.1744032780.git.ktokunaga.mail@gmail.com>
 <5cc73887-1073-49d3-8267-0e84483bfc2b@redhat.com>
In-Reply-To: <5cc73887-1073-49d3-8267-0e84483bfc2b@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 19:59:38 +0900
X-Gm-Features: ATxdqUHdCpCrgjtKUrRDwrJofLyKqzJ4ydVniPukslLn_-oH_eDcjqHmdFXJByw
Message-ID: <CAEDrbUaMN3OM0_vyRZwfdu9eTQ=H0Ruc-=ZbEWB3VoNgKqE+6g@mail.gmail.com>
Subject: Re: [PATCH 02/10] various: Define macros for dependencies on emscripten
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fcb38806327e99a7"
X-TUID: Bdc8FTZpJkLf

--000000000000fcb38806327e99a7
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

> > +#ifdef EMSCRIPTEN
> > +/*
> > + * emscripten exposes copy_file_range declaration but doesn't provide
the
> > + * implementation in the final link. Define the stub here but avoid
type
> > + * conflict with the emscripten's header.
> > + */
> > +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> > +                             off_t *out_off, size_t len, unsigned int
flags)
> > +{
> > +    errno = ENOSYS;
> > +    return -1;
> > +}
>
> Please add a file stubs/emscripten.c with this function, and add it to
> the build in stubs/meson.build.
>
> > +#ifdef EMSCRIPTEN
> > +            error_report("initgroups unsupported");
> > +            exit(1);
>
> I think it's best to add a new function os-wasm.c in addition to
> os-posix.c and os-win32.c, and disable all the functionality of
> -run-with and -daemonize in vl.c via
>
> -#if defined(CONFIG_POSIX)
> +#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
>
> (there are a couple occurrences).

Sure, I'll apply these reorganization in the next version of the series.

--000000000000fcb38806327e99a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo,</div><br>&gt; &gt; +#ifdef EMSC=
RIPTEN<br>&gt; &gt; +/*<br>&gt; &gt; + * emscripten exposes copy_file_range=
 declaration but doesn&#39;t provide the<br>&gt; &gt; + * implementation in=
 the final link. Define the stub here but avoid type<br>&gt; &gt; + * confl=
ict with the emscripten&#39;s header.<br>&gt; &gt; + */<br>&gt; &gt; +ssize=
_t copy_file_range(int in_fd, off_t *in_off, int out_fd,<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 off_t *out_off, size_t len, unsigned int flags)<br>&gt=
; &gt; +{<br>&gt; &gt; + =C2=A0 =C2=A0errno =3D ENOSYS;<br>&gt; &gt; + =C2=
=A0 =C2=A0return -1;<br>&gt; &gt; +}<br>&gt; <br>&gt; Please add a file stu=
bs/emscripten.c with this function, and add it to<br>&gt; the build in stub=
s/meson.build.<br>&gt; <br>&gt; &gt; +#ifdef EMSCRIPTEN<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;initgroups unsuppo=
rted&quot;);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1=
);<br>&gt; <br>&gt; I think it&#39;s best to add a new function os-wasm.c i=
n addition to<br>&gt; os-posix.c and os-win32.c, and disable all the functi=
onality of<br>&gt; -run-with and -daemonize in vl.c via<br>&gt; <br>&gt; -#=
if defined(CONFIG_POSIX)<br>&gt; +#if defined(CONFIG_POSIX) &amp;&amp; !def=
ined(EMSCRIPTEN)<br>&gt; <br>&gt; (there are a couple occurrences).<br><br>=
Sure, I&#39;ll apply these reorganization in the next version of the series=
.<br><br></div>

--000000000000fcb38806327e99a7--
