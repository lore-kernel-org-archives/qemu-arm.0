Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp508264ejo;
        Mon, 11 Dec 2023 13:54:04 -0800 (PST)
X-Received: by 2002:a05:6512:716:b0:50c:21c2:a278 with SMTP id b22-20020a056512071600b0050c21c2a278mr1790658lfs.17.1702331644752;
        Mon, 11 Dec 2023 13:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702331644; cv=none;
        d=google.com; s=arc-20160816;
        b=AmX2xRy9FgesXe2Y8AggM8yjZju/wnkvaOHzCVP6qRnqfbDrGl6mAM4Hkvt0hlgqsX
         OWBrNAOShasxdENiOun2InDM5yrqdmsIVdX2vywc/IdmL23TWvDVbeW10hJM0wrvh1PB
         gISQ8iyAbbQQnrOua+GeGj7752KOcHDunCzDpK3dh4eQpnxj3xOOYZjBl+aGYvIpF3oN
         RHViQoSXiZhrNrPJsDqEMK0N4IrD5py+sK3y4AY3t/aVipJKZLCm6yo5/x4IfIuKKwjP
         tDLnZNpOAivOX+hWwXioiQBksBPegyF6sfG2SbJb0365kEBTujN3XOnrJhsMb52IJpes
         +w3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cxBNCytuKVpcMOMd1uTr/PXu7b7GfNOqYnE6uYYpyN4=;
        fh=eOqoSSwnjl5jaThnGlRW4g9uMXdn/sUszMfSc7si0fE=;
        b=iKtgFzc/bEEg7ELsYa7N5u2kDq0PCxjJiWTBozNTFoM/Ptuob18KvSUYuVsKdD44D2
         YgSu0pZZCUtSc2gVx+l2Y29imxQc90CSymo8ZM4J3iRWd6vFP2SimWTtGpJx0RKDDEOb
         R0cyWKSgxzpEZ2xBrhHt2VsBEyoTgAphAsxJW3QFpqu/cfjUm1rD+BO+7m8EBJBfT/Sk
         uufW4JNSBEKcC5URFRwnyK66VcxAB73QFUnNQbhGNPOSy+deYzkEAoMe1dytnkm4qodS
         xYWxFtE7HKNZkBKzbQUdjJ007YgIsayAkXYaBIS804VlHE1pRxBj1YkFhPFstyMh0Bx6
         4/bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=v+wfzcnN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
Return-Path: <wlosh@bsdimp.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v22-20020a50d596000000b0054c64f5061csor1784281edi.12.2023.12.11.13.54.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:54:04 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=v+wfzcnN;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of wlosh@bsdimp.com) smtp.mailfrom=wlosh@bsdimp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331644; x=1702936444; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxBNCytuKVpcMOMd1uTr/PXu7b7GfNOqYnE6uYYpyN4=;
        b=v+wfzcnN6of1cCDLtZsc0/ML06NgJjdlwIOGpua71xxLUL1nkzptLyuPJFO9UdWmHY
         ENvCiNVK7pZsSvgrya8D7oRi7GtDOtFNYi8Xg1dcDtJzNrMjtinQgo0stDRcgxiIaZ9i
         68OLJCQGtNikpbG1pOKLT3ma1I5vICRWWnFkewdsNOCY8qv2P7rCctIPPuzJvNXMuDCS
         2du063XFPg1CkuYXhck0KDl0ELh8w3uJ+J1Rxa42qe7ssygrP+yL5jfZtHr02q/R1JuG
         k0xLJZiK23IKdmSQEdst8f8wakYEkTbSwsopieGAcOfjDHfTjMz+1+49jNwvusKzEenq
         DnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702331644; x=1702936444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxBNCytuKVpcMOMd1uTr/PXu7b7GfNOqYnE6uYYpyN4=;
        b=oyj0G+INl6w9LONvTHtu6jq9UZICbNdw40/C7hlK3CKR3NZCf6s96Rt5/yxIZ7QOnJ
         DgxIl2nMbcuXNfP5XikxxmhQwkHUVQZWEn97e3fN4sTJBZKbBe94soTIg1JF2nr0YU7h
         zWvdPqsvMTgC4jYx3bCHQ0xyAqUFdFD4bUzenOx8p289v05xskZq932/7zszgPXrvEPP
         JNSrmKmmgbdMEzYfTWci7DcodRrFNhX13MtQMz65LBsGGaiFSgBxq531QZfsyiK7jXYj
         3pFJKsq6O8dLWvdzjc+Jq/63icAy+JTMrkN54K0QHfJlQoB3BWX12QSZd41vWtgVpTn0
         J2Yw==
X-Gm-Message-State: AOJu0YyjqiekEiixYl66pzrkInbRHR5YTzrqzY7HH6r/MpUi7NYa3N0W
	/9X+yBWvHL1gAR/G+m8E5mRoXZEMABkuFsQeHlHJMg==
X-Google-Smtp-Source: AGHT+IH/rFEPQKRev89Ru4IDb6qH9WoAKEry3fvz1dlxm0fD57lBoPZ4WauRolKVGm9zQT6JJAY8/X/Iy9si+eQTElE=
X-Received: by 2002:a50:f602:0:b0:54d:b2b8:171d with SMTP id
 c2-20020a50f602000000b0054db2b8171dmr3359635edn.35.1702331643743; Mon, 11 Dec
 2023 13:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org> <20231211212003.21686-2-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-2-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:53:52 -0700
Message-ID: <CANCZdfppY0D1HOBN-n1h9ZQUHSK23YVgewn-vcRAQTs6--TCzw@mail.gmail.com>
Subject: Re: [PATCH 01/24] exec: Include 'cpu.h' before validating
 CPUArchState placement
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
	Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ea6152060c42f8c0"
X-TUID: TxIH8sDIaAeQ

--000000000000ea6152060c42f8c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> CPUArchState 'env' field is defined within the ArchCPU structure,
> so we need to include each target "cpu.h" header which defines it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Signed-off-by: Warner Losh <imp@bsdimp.com>

--000000000000ea6152060c42f8c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:20=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">CPUArchState &#39;env&#39; field is defined within the ArchCP=
U structure,<br>
so we need to include each target &quot;cpu.h&quot; header which defines it=
.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/cpu-all.h | 9 +++++----<br>
=C2=A01 file changed, 5 insertions(+), 4 deletions(-)<br></blockquote><div>=
<br></div><div>Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div></div></div>

--000000000000ea6152060c42f8c0--
