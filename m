Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp510259ejo;
        Mon, 11 Dec 2023 13:58:52 -0800 (PST)
X-Received: by 2002:a2e:2c01:0:b0:2ca:27b:af5a with SMTP id s1-20020a2e2c01000000b002ca027baf5amr1815234ljs.26.1702331931880;
        Mon, 11 Dec 2023 13:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702331931; cv=none;
        d=google.com; s=arc-20160816;
        b=TUQb7NHV2lqN+DZtrPrOW7eNVO5x+zRVEjCbFIb9nHzH8uJLlyUTx43O3Wp5bIMI9d
         kh6Z3zlrf1oqhOYROxL6W7pU22xzzRtvw5CxqrulyqrjSm+6a03BU3zC13AGNJzPox1Q
         16TSfr1S1rvnk9gbXMlC4Nt7s9sucF07wY9PzYQJouejju3pYOOFiHzmYYcJAypv/uf+
         8dzzHih657d5Tsrlv/ZjPqF1yowFdUC/4hTb/lOrV2SiPPvBBrNgwIy1eVzXw13O7Nkq
         yxeZVFBz3n8qWjGKFzL/Lj79bnfXelMZzNJsnyRfa9tuxjHnIYBTKJLa2ic41cg9dVcR
         jtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ag5QWYGMr8OKDlGLjEjdsqgHLAGNFiobL7ohMrWWdmY=;
        fh=9JPT/dXJUFLv9sFX3uEqq6jgwklmAPJrQh+b/0VNCZ4=;
        b=jnTNqoC7+IDS2TJQf6ER/IQZ+bFHDh95EWexhXPeYaidigbgvAygOkShNYHUNtK4k4
         lp9sSQxlWP9lRI3OqgNWo6shwGO64lBICnd2LUFhBX4mUuHo6K4gT957FflC9NWlm6g8
         Rv3TDtr20P6VFJQhkucCQGO3ymJTxsquLfRX94fkSGKSWpL3laM0cAZcSjc6tk/VGSMM
         ssMf59C7qyFpixfAN9WawB3Glq1fV8LgkpU//5mpYnZgKRrNrg089Cequ7IJjFHM0L1Y
         0OBfZZ8H9UeaMEwStK8XMoTVK7B2fEeZmNBPtF15ngzaglubvWv/dGfiq3eTLc+qg4zn
         dEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=lhwirGH6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z4-20020a2e9b84000000b002c9e81cdc73sor1667937lji.10.2023.12.11.13.58.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:58:51 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=lhwirGH6;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331931; x=1702936731; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag5QWYGMr8OKDlGLjEjdsqgHLAGNFiobL7ohMrWWdmY=;
        b=lhwirGH6Z4NBLsz2ECshGQg/xgkA97NH2hsYG2/MUl6VUZbCTl9D1W0J+dw/C9wZz4
         H/tfjMbzK/AxGsA3s8/bZKdJKiOGuVZOgDCddQQUKdagyjGtRM1BvPt96MeiVG4N108e
         o0Ylvz6rd4bvqolTNMm1Thxiu0Ly0fEcAtBfojDif4Tn8YDmum2ypqg1NlHQvqFPdO9a
         /BJayyhr9D9ro3ajRJ86ntELP3OEk/IhqSZ0mpNE6a6k3wEwEf15P1GyAOZAM/pWhtN4
         rFA3PD+Ydp98qxCjPDZ5T/ITkHVxjY3C+QaOoztMIbWDzcQEC91llB16dAInM/ABlIUM
         Qn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331931; x=1702936731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ag5QWYGMr8OKDlGLjEjdsqgHLAGNFiobL7ohMrWWdmY=;
        b=hDunMCFAjD8/LxffwxCNAUHdf8RJJYQ3gMSyT13oCc7a35Xn4VIVrmWGq647tUqkg7
         0YfiSXFBCf5gwBYRGRvhlHrIu6l7VxgLpaSMBYkC6ltD9B/eEZ3hR3j0I2OzqLOPBD6T
         2dRip6Lv5bDXwmkowTxFDU6x7SzrvnEExVEaOCZGlFgIdUkjg3UI2Cvo+AxeOBPKDYik
         9xwWLyWEDde90jEyWNzd9yzvs41P0nFkV994CNTlAghHrIl2WRhdoguOMKsXOV9N85zV
         NrwwdIq4Lq4Gy4WGczUCcZU84jkIccCc5NtK+jO0bSwL4KGLie4H4bt7B6Nlw3gwRzMs
         jjjQ==
X-Gm-Message-State: AOJu0YzRPOuaI+m9Gjqh+lg3LZqsb2A57XcKXhQMJe0PxZ676pZB+WPI
	NEXuK/O6h4c/G3QbaKwQCvVROjk6vq5MiFyFdQwPmA==
X-Google-Smtp-Source: AGHT+IFu/22NNlvmuVBdx9iabaMrIHvkDXx66MwkobR7MrmOmMSaJs6J/KH39V4umYutXtJdGJyBQN/nUFu6T2uzLIU=
X-Received: by 2002:a2e:9a83:0:b0:2ca:1d0:498f with SMTP id
 p3-20020a2e9a83000000b002ca01d0498fmr2043981lji.102.1702331931024; Mon, 11
 Dec 2023 13:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org> <20231211212003.21686-25-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-25-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:58:40 -0700
Message-ID: <CANCZdfouN2MtZOeEXi0jaXrG7_TqhupoDM98FzC_q=EPZghn6Q@mail.gmail.com>
Subject: Re: [PATCH 24/24] target: Restrict 'sysemu/reset.h' to system emulation
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
	Thomas Huth <thuth@redhat.com>, Song Gao <gaosong@loongson.cn>
Content-Type: multipart/alternative; boundary="00000000000009f55e060c430a26"
X-TUID: 3sWk69tqRSX4

--00000000000009f55e060c430a26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:23=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> vCPU "reset" is only possible with system emulation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/cpu.c      | 2 +-
>  target/loongarch/cpu.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--00000000000009f55e060c430a26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:23=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">vCPU &quot;reset&quot; is only possible with system emulation=
.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/i386/cpu.c=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/loongarch/cpu.c | 2 ++<br>
=C2=A02 files changed, 3 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m">imp@bsdimp.com</a>&gt;=C2=A0</div></div></div>

--00000000000009f55e060c430a26--
