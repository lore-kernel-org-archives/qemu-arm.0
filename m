Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp644938njk;
        Thu, 17 Apr 2025 02:40:57 -0700 (PDT)
X-Received: by 2002:a17:903:1a44:b0:224:1935:fb91 with SMTP id d9443c01a7336-22c358fd434mr71766615ad.27.1744882857329;
        Thu, 17 Apr 2025 02:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882857; cv=none;
        d=google.com; s=arc-20240605;
        b=LS6mdiZtXzHosILvGfSOtrdN2r/hEgC8OtKEob2Ln3rcIZFv57wrg1QfDyvpROnM0Y
         6eDzUx7NUY2HQk4cDW52ynJVVcBc1lIOTrYW/NEAd6eCPYXofypKDB30HWgMnruzU8e6
         XWafOSbm2XbV+oUGjrv2uBpOMF+lfFqPWjSk22kAt+ovgh4Cx1CGIZY0IvqCmaR+DH7B
         dPeojIG1tgiGaM/wqjUkekgB+4hNQsedJP0te3j0LGRujSbU3ggoNyAB3cI6ssRi9X5R
         8altPSWXrhpqHS/V0Ks3y/GsTszTRvU9m52bd4B9x9Xqs8XUjwrOinc6qGLMPZpiQkwk
         NRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QFj33q5/KeeGLRSrHE8hMSPyr/POvveEwsqwvFuHU1Q=;
        fh=l2x3Cuxtyy8O2Q4xLF3D/JR/1wGb5coWD5+2INhtQ+o=;
        b=OlvGiRUkzh4mYV7o7S4C1C/bltcfloKd4V4zZuXXKF+tyIs2D1TktyopIEPraNbeTB
         B6EDc8hey7851RfUCT+PS/yWl0Nvq3Rmfn49+h5H/WhDHedO3V41+IeN7DP4ulTYH3Dx
         3WtGPCoCNrE+guhZkEbQw0+T4Tt+AdxU/UWD1+c2H0O/V8JwICOmHcwN4IIz653AvUpu
         NjroKiAeTzxdwPyTHjsak4/fqdocJFDRFcEfKf2XJmVbqTyo+SaKYnzFXmRIR5TA6Nfq
         VgqwP2a9CWPK6BHyXGOLyveroMxnRdFDYB7noj4lkErvW4B0dR+mNMEwDRePl1Omz6co
         sNdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="e55/8Ln5";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7b86683sor119132365ad.6.2025.04.17.02.40.57
        (Google Transport Security);
        Thu, 17 Apr 2025 02:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="e55/8Ln5";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882857; x=1745487657; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QFj33q5/KeeGLRSrHE8hMSPyr/POvveEwsqwvFuHU1Q=;
        b=e55/8Ln5FPC7iiXJD0ZV2vAqrD3XEP5PafOTwnC2uJGQEokUMX+nWTocdAU/Y2X7Er
         abske5y7yjJJQGrXur9x2fufb1yjBr2eW+WXJgJLlHvYDk8vAzGBvDdWqq46EVV9/Vpu
         oGXKW+aG6rz+VdtZzg1N5Ke/HflPDtgVJlJ6u2OeSDkp6guR3mIIuimBi3bxqL+6KjEl
         lSmZ8X20cFH1shkQGULwkOIONv16gOGLAjmBfT7jdgTYtvlaSijMJXPSIUpjaCY1ExcS
         7pjMyY0XwoxR3i2Li0k65jCuhfqXrT97C2cpwWgjXaKMY2t8iGjZ7Yg8HTpr7movMT6t
         yQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882857; x=1745487657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFj33q5/KeeGLRSrHE8hMSPyr/POvveEwsqwvFuHU1Q=;
        b=AQYH21Jjg2yUR9fI4cdAaihmlJodKeY9LVKyHSxXCPlDTB4uO0nvEGK3GAIWlXABZL
         ERXdDyowfhd0iA2SRRaCjRAXfGqNNzZMSi00zReNmtukl1YRguvrOimQnM2KyAFAnuXB
         tX7uw3Dh+xBss/jJQAtDgq68OHtZC04bmODGOhT/ZaZp//A7emge8RdZPCIVM2QS7pQY
         VfVAaCTTDwaQjmrTHn/9D+HQIrKKfNvUkZyLO07kkqXkLR/NWrGkPHI1Vk2Iy0dAAZ18
         MsTvl80TZ1dfImu4yBtrWEdpzdsjRaveFQ4KPTQv5e3ZXQjiAF9n0PPTKcZzyRlCkd5p
         gpAg==
X-Forwarded-Encrypted: i=1; AJvYcCUme3czg/gwoEXQDu6+hb/6xjD7bCyFWFHUcn+H+HxfbXGaG+8koGC5HqxKOsDCngpUUmy16Mx+6S8NKWk4@linaro.org, AJvYcCW0LmQwKAxueybQgZtMAAk1VmRsLc098brFgqQu1RrQFXjSRW4asvyHv9WLJ0vagVYNC3onM8ys1hYvsT6jVqB+wQ==@linaro.org, AJvYcCXRY9Q7vYkEFGBczsoH7nMIUVZPEHjupuctbi2jYONpvIcyknxIfZpWp8SizcneChXT14G9Ul+gwxcq3blcjsV2SPI=@linaro.org
X-Gm-Message-State: AOJu0YzOP0p1rbGEA6RLEiJ3yl0j4FaJZVrecCtYpx+5KtkxOxnKEida
	LYWmyNE2zuKuacs6xh1mt5X4g/D74X7SlT62a1R0bv8tDUJLnBxW7VZ0T62WyFDAoob/8oCKbOO
	X3evawmBie+G+aRxDAqOYUeniFT0iV5ghWPw=
X-Gm-Gg: ASbGncsnfU4ZoPwDIhMFciVH/iBYK7QYLNu1/HJhELG69oCZ7KUuU2lI6F+WxYOSGSU
	uDAFYE6y8nOxjtUmlsgWZt2S+nIXoOuGMTIZM9Po7l5x7Igb+yIxlFu8qV5oGkKQE4R8i3SHOjy
	y5wHCzTC2vGwcbZhcY89WVMzhu1DP16Fj/8yU/dxv351UCbsi5UeJH
X-Google-Smtp-Source: AGHT+IGKwwOAuBmQI+wOClsZaLQqiMd4YBE6pAZkKS9df9Jtvkx3A3NVX5PnAcsCgGCvP6Qr3G2oyYFnnMwDpbf4ZD0=
X-Received: by 2002:a17:90a:d64c:b0:2fe:955d:cdb1 with SMTP id
 98e67ed59e1d1-3086415ce8dmr5382416a91.23.1744882856771; Thu, 17 Apr 2025
 02:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <185cfff812b952abb24e25dfcc8bab7c65da6214.1744787186.git.ktokunaga.mail@gmail.com>
 <4962b53d-c507-49df-91b4-cf51d724e8ea@linaro.org>
In-Reply-To: <4962b53d-c507-49df-91b4-cf51d724e8ea@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:40:44 +0900
X-Gm-Features: ATxdqUGA5J1i1cY3gaT0zt7hUBvEXbJ-92uPofOuCttG0cZ-o8_-C-TylCAxRMU
Message-ID: <CAEDrbUZZ5E228PgRiykPdkdOSS4qU5V_wh37x-gvKxZr2Q_-xw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: Update MAINTAINERS file for
 wasm-related files
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
Content-Type: multipart/alternative; boundary="000000000000da4b8d0632f63285"
X-TUID: /tgbcYBcgw7d

--000000000000da4b8d0632f63285
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> Just "WebAssembly target"? (I'd add the future
> tcg/wasm/ files in another MAINTAINERS section).
>
> Maybe better to squash with patch 17? Or start adding
> the section when you add a new file, then update for
> each new file added?

Sure, I'll update the patch to follow this approach.

--000000000000da4b8d0632f63285
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,<br><br>&gt; Just &quot;WebAs=
sembly target&quot;? (I&#39;d add the future<br>&gt; tcg/wasm/ files in ano=
ther MAINTAINERS section).<br>&gt; <br>&gt; Maybe better to squash with pat=
ch 17? Or start adding<br>&gt; the section when you add a new file, then up=
date for<br>&gt; each new file added?<br><br>Sure, I&#39;ll update the patc=
h to follow this approach.<br><br></div></div>

--000000000000da4b8d0632f63285--
