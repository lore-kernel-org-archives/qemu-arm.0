Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp642158njk;
        Thu, 17 Apr 2025 02:33:24 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-3086416de67mr5870056a91.32.1744882404261;
        Thu, 17 Apr 2025 02:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882404; cv=none;
        d=google.com; s=arc-20240605;
        b=PYpEqV+/qD5TNA2akZrFYFYzW05Hv2aFT3AWTLvoB27N2I/hFBvqieqHLuoqqhJXqD
         gaz0/zp95ckF8HmCCKztcJOZ/O1M2dXHFBeym4fqh2PtXeEItgdSyb3Y0DYIqUVc4GqG
         UnZG47PkBsC+wooiChIgKExg8p3cKZ8jtRiNR2sAFsfKHeQWmfyKjHKpUBUj7khkWtoG
         96AEy0LTAylLI/O/XcQmyBJ3lBnrYeP+PXSSqRhYA2fnFFtfuqhuudmwzR9E8/E3YTm0
         lHcIKjOF5nlsb5URZ1lPuDJ0jBGxjyUK+A4LeCusjFaSJo+IczdiMuRqTPCvbzzPQizR
         Z3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+WYqzNVMLotLX9cRFxRZE2qJnsZT4jC37pquHkVtjqA=;
        fh=TRLtcl4GhoJ+h5zffbtU5ls+fgStsJlrP1SEUhhb2CI=;
        b=Fyb8n21RQO1tcpEdgLT3+axXi38QgIjl3SHPLlMnke4LBlqhronKOosvrLka9vWPPH
         rq/nxpWTxL7ijWt9VPxQCiqKOuPwMrMEvUwwyk6VzvWL1Kvty91hYSZ5J8+J35CrRZXa
         lXlpP7pIOcrccncD5gcneh3sCWJydMm1m+JwLuetS8gWNA2IjXVdc+kJZ3Y2r4B/3j/Y
         fh/Nir4+8JqR6ZfY3SBrYTVqgw+BtafIqtX2Qb040K/tlzdDhiq2QLLgQ8JrS2i9eTFW
         iO8a0CgVtb36uvAcxhqfSKltgW8mB736c03vfCUavU6yXdoFFhFXJ5hDktYO9CQDzUhX
         8VKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgHkBVFh;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7c68991sor159416175ad.17.2025.04.17.02.33.24
        (Google Transport Security);
        Thu, 17 Apr 2025 02:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgHkBVFh;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882404; x=1745487204; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+WYqzNVMLotLX9cRFxRZE2qJnsZT4jC37pquHkVtjqA=;
        b=DgHkBVFhODIubJ1G6S38629gHPNHjvL1HFoWsNmQett8tFL6oiljFgza9uIjBZz7GL
         IVLNGgZt+ZFi1gINX8XpCLZWmkX16G5o7XDuDwf7tdmb2mEPd2QwtWd8Hv5oyxSFi4Um
         TiUI8fSCBDr2iWQBkTshpGDyZOjTgChGkw/H0B2KTcxboSbrJ7tLjdq+lgyWsoE6/GkO
         O0M+jLYzI9SVXCoFSX1SsRauQfUZymDpsDX1yfb99hQS8ENy4mugFwX0RxbMXfkeLzMc
         UoR7txkgGknYl/jAns6PBgLM4xqUs5zEQt2nOH0zInuRj6WAZYxtg6EjYbLiTUfTgruM
         dWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882404; x=1745487204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WYqzNVMLotLX9cRFxRZE2qJnsZT4jC37pquHkVtjqA=;
        b=Y2RCj59FXjNx2LTxhVRhVI6osN0ffjFY72qQM+C4H5/b6eBAKa0vPptfKlQs4S4ja7
         8MCQhtEmP9HdVRijHcXK6CzBZp3Vr+dCB11//3fsV6uby/fzycD6O7WfmbEATn0+eHZG
         kpgmy5SdGqxtFlqJ3lwcSPU+Hnn7NwYZIhzkTpzIORz2kYTD3A7iUtMPrUdhy9Dka4V4
         dGIWxYVCL8I0CgISPy9jltdwC+d+s+hKfZuYs8cVWTPdeVFnpO9vhbzP1VhJh2Sm1Zyf
         +GFkPZP3Y98/xOmGF2wmbCj1HTFseU9x3eQRISAvsW+cyrXElMCZ1CD2DilUNBZ6HGrJ
         ddiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhvdH70qByiP+g5vyQrwTJmWokhqoc7/l7NGEFJvocrHQjN6fZabcKVggOEnT6Hsahsx+Sj/VVR1OePG854gg0Ww==@linaro.org, AJvYcCWKbAI4w/823mlUcSWj+ubJFoxiiSjPZV9qeRAlSnBnu8lS6B/ePPDAtuBbSEpk8GjilTZiyFgnknJUhGio@linaro.org, AJvYcCWzITlePwLtvxWgNv+oEcXfCT4hFciBwSWnNIwmXTH87pGZx8h78OTnUHjhvAZv+GEweXxlTEytYayNP/WiSLnYhK0=@linaro.org
X-Gm-Message-State: AOJu0YzB0jby2qu21VdR+u/2YYzGUbFY9CAX9NQKfhkiGk3Z0dKE9KBh
	3I132BrL9kQRvcvi7VpENuI6dNbblidKColvZi/t2bSbCYC4cyxVUEP/ryFNxPvnFMdBxIWBDjK
	lDrfScT1GpamK8dyznXb15iHWQb9SP0uwnZw=
X-Gm-Gg: ASbGncs37/3kwdQXHDqe4eo6+gz4u5yqQqmTYJoYwMODCG2EWxZNTm9uGTO1FUbhHgX
	JDOa1+0pkgBT9UZ19U9m9wsC1Aq6VO8eSLEe40jb97DPpbK/N5EiidUpEA7K84Fb1IYKDwZDuOn
	2Hn95owj/N2RaTouE9JHYmbRX4zYfcd49yScHEwiMIJtBXib1faexV
X-Google-Smtp-Source: AGHT+IHNSWCxX47tiqfKqiS2sIxUAHE7DSXrly5hav+Iq0jvcClyO+qIcG5Xdnru5UXOvEB+NY0ZRbAO8V22CojlBAE=
X-Received: by 2002:a17:90b:5410:b0:2fe:b735:87da with SMTP id
 98e67ed59e1d1-30863c503c8mr9628237a91.0.1744882403663; Thu, 17 Apr 2025
 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <c2e3a58825c39678fcde361b685d1bd69d2fb1dd.1744787186.git.ktokunaga.mail@gmail.com>
 <e10f052d-b098-487e-a667-a0a19630d082@linaro.org>
In-Reply-To: <e10f052d-b098-487e-a667-a0a19630d082@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:33:11 +0900
X-Gm-Features: ATxdqUEuQG4VGOWT0iulbDeHqVr0sWZL9x5AQG50DesObBgdxTbSldSIx1e34BE
Message-ID: <CAEDrbUa9AF1uZfdwTy2WL1Er8FZOh2SbQxw8zPmxbOrw5zURMw@mail.gmail.com>
Subject: Re: [PATCH 14/19] Disable options unsupported on Emscripten
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
Content-Type: multipart/alternative; boundary="000000000000d863ee0632f61752"
X-TUID: tfNk0/ABNSeK

--000000000000d863ee0632f61752
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> >   #ifndef _WIN32
> > +#ifndef EMSCRIPTEN
>
> #if !defined(_WIN32) && !defined(EMSCRIPTEN)
>
> ?

Thank you for the sueggestion. I'll apply this in the next version of the
series.

--000000000000d863ee0632f61752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,<br><br>&gt; &gt; =C2=A0 #ifn=
def _WIN32<br>&gt; &gt; +#ifndef EMSCRIPTEN<br>&gt; <br>&gt; #if !defined(_=
WIN32) &amp;&amp; !defined(EMSCRIPTEN)<br>&gt; <br>&gt; ?<br><br>Thank you =
for the sueggestion. I&#39;ll apply this in the next version of the series.=
<br><br></div></div>

--000000000000d863ee0632f61752--
