Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp508666ejo;
        Mon, 11 Dec 2023 13:55:05 -0800 (PST)
X-Received: by 2002:a05:6512:2352:b0:50d:1e6f:b52c with SMTP id p18-20020a056512235200b0050d1e6fb52cmr1318733lfu.76.1702331704858;
        Mon, 11 Dec 2023 13:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702331704; cv=none;
        d=google.com; s=arc-20160816;
        b=abgnID7HvA/Zk7mFbrz3Vvl+vO6ZjpLUvSov0b5aRERAA5PHL+Vt24AkgzWP9hpeca
         dSMqS5gT/zRnqd1+mcuVk+7wdEy0kzFbPfUBPiNhG8FZMi8icm1NeWcbhiqT84zcQ2Cy
         x6gyINaLSqs0xgUorIZoGXiBTLaxcLhA45QWizjsr2ViZZLOc9An+ZmJjuqIJ/CskS34
         HxZDo50DStuK6VtjRs6qaLiET30TmjiE483X/z11hwGxPe1CkAvbXVdUUsZjPAc8C9U4
         gDMKRXxrFU63FyxWaCS5knv06YDrwgtI58bNQJH3nhsaRtxNOJWbnzOvLFjJNh4Cohlw
         TmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aF396CQf/xahnK9tLf7Jbhp/lY8WpZ39PZ0s6eBIOPk=;
        fh=T2SpRHSshlVouYo1RIJz5UllnvxrBNJXz7WE9Qu0mhg=;
        b=NFEcSeCYkZRJPzkohpPNAuD5h/JITUdILK3HTBIa+zMwTAEsq2VSCziE0RDdJn3zK1
         AoUyRP7ggiTZJu6NrpC7NBAkqMtyx/ZTXoEgnLBXaT69P0a6M+NGne3SGKFJaNbB+dMb
         8znLHcewcH2mNo0CGvaZYCnDjNbhufcpaFuv2fA+co45ajPKQT8/3R2QqzglLxzTxbWu
         V0+mMHzFYHJkyrZyWiJRYg0wROZdVaxmQZTVrqc9533jdIoXhl/b6qsGZLnwID+txKcr
         Y2hlIaozIWzUOdqOjLnO89N7ZEo0OiJfWKV1V5XedDSNqy+v2l609Hb0Fw5jMuSrikYv
         uA/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=tJwBeldU;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17-20020a50c111000000b0054b567f5ee9sor1992126edf.1.2023.12.11.13.55.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:55:04 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=tJwBeldU;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331704; x=1702936504; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aF396CQf/xahnK9tLf7Jbhp/lY8WpZ39PZ0s6eBIOPk=;
        b=tJwBeldUWDDCTaEz67O8X1dQ7t/yZll3SRKNy6b3El0nAyGMMCWEJWGsIXOF1vK5nz
         mRu9XESYFgiHibtwTVsj63Aej18skwzYS86T2VkXWAu8Ay0eF9oD7yJx26UnNeIOKGSu
         wHGqsDqOljVrlaVjHj1Tva+Xf7a+j+PUvtjaaEkWi7UdW5/7m2K84WBWWKiVPyNfLiom
         DemsnQ3cFJ0jdjg/2gbL4EA3Y/cssqQ9VoDPnZdPBNW58kPiMPkDerKmX995X0xVp+6F
         8n3Sm7zPa7q/ShevxLrpkAOOmCHWXTfNgw5CTPcMLhWWxtsdKN85iulCx3DBJBcSrv9K
         sAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331704; x=1702936504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aF396CQf/xahnK9tLf7Jbhp/lY8WpZ39PZ0s6eBIOPk=;
        b=gdJO1osdemyZNgPQaDcgfby6akXEyCdKv3gY6WmBFw0gq4o0FweNNCSjIRX/IuO6f6
         xvPuWi/CHC3jIv2LpyFeblVDsueD8Yh648zUipSFveX5BIex/0Fzs+6NuO67Z/IgV/34
         hQPuwadvAgBnXHYozLurBgW1k/rBdCCJHZ1V/Z95rMwydFGM8Uv9uwsfRTNo/QEepGNZ
         g61DuQDNQAt1S8cnTxnW14+TxULx/LepHv7atbIGu3UY6hQmpJsIO3x+0lkCLH1X1eE6
         0aBaPt5Z8EW6Ti2Zj0qA8Tw+as/MTR37eJJlhGd09NwqE7QmhKauc/AeWs8KcYcqw4nR
         n0kA==
X-Gm-Message-State: AOJu0Yx2MgCP+rVHfSl4ESFxiZuGTbTCVMzVTPeN0+/80B2O+5vdFjnZ
	JYSKIMCj6RwsvTv+fM8DxV6DK0alVMTzcyycaoNsHw==
X-Google-Smtp-Source: AGHT+IEc9xhaxbK7OOlF/iWmgNAMI9Q4YDpb5eCvtBFgma50RLU3srp1cW+tlkxsxIlEOUuBOWnSRcRs4OPQPyEO3IQ=
X-Received: by 2002:a50:955d:0:b0:54f:64f4:b6b2 with SMTP id
 v29-20020a50955d000000b0054f64f4b6b2mr2198492eda.59.1702331704500; Mon, 11
 Dec 2023 13:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org> <20231211212003.21686-3-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-3-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:54:53 -0700
Message-ID: <CANCZdfqt-PBNgFb19pyzoMbTF2yYvgRNdsyQuKZDQWCR=hvYJw@mail.gmail.com>
Subject: Re: [PATCH 02/24] exec: Expose 'target_page.h' API to user emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>, 
	Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000897434060c42fcb1"
X-TUID: EpKaHCntPJG9

--000000000000897434060c42fcb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> User-only objects might benefit from the "exec/target_page.h"
> API, which allows to build some objects once for all targets.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  meson.build      |  2 +-
>  page-target.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
>  system/physmem.c | 35 -----------------------------------
>  3 files changed, 44 insertions(+), 36 deletions(-)
>  create mode 100644 page-target.c
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000897434060c42fcb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">User-only objects might benefit from the &quot;exec/target_pa=
ge.h&quot;<br>
API, which allows to build some objects once for all targets.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0page-target.c=C2=A0 =C2=A0 | 43 +++++++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A0system/physmem.c | 35 -----------------------------------<br>
=C2=A03 files changed, 44 insertions(+), 36 deletions(-)<br>
=C2=A0create mode 100644 page-target.c<br></blockquote><div><br></div><div>=
Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.c=
om</a>&gt;</div></div></div>

--000000000000897434060c42fcb1--
