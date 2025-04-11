Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp493312njc;
        Fri, 11 Apr 2025 07:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaw9hC2+zzk/8N2y8DvyEO9giGC82GRGZBD+s3KlV//SviLAC9U9Xrvmz/enOPE4yWUA6P6qKtel5J2Q==@linaro.org
X-Received: by 2002:a17:907:3d0e:b0:ac7:ec75:c65b with SMTP id a640c23a62f3a-acad34dd659mr271494166b.36.1744382530644;
        Fri, 11 Apr 2025 07:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744382530; cv=none;
        d=google.com; s=arc-20240605;
        b=YodZMjvoXrzjRX53fdwro2zSJVfFR93HpG+lh698/a0pqT0Af5+Er/hrQFG2QpOKLM
         +zQQC/LBZALHBZOwtNZJqZD3V9U04RSdc+3Ron+9M5aiEuiu9QdFMXzSNp495q2xDfOk
         WmUtE+vdUM7+C5gs9RNrJuGWScg/P0KmLHYbWrKKTlIzvsD/wlbvARCy4l9P0Cl73cEC
         MNOPCBqkA2UrXpMmwKRgqweD/V4f5yDpUFJGjieFzwG3l+O0fiV+By5/R2O2swAMtIbz
         1nEsRTR7wE+alRCcbO02RcBE7yG8CYiVotqT/ITQGTuIJwgMcYji6ztqjmuq8ASztNeG
         v3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fSg6VV0S2nSlCQBls/gUcOoEnqiGB9k8fi2W1vxyUOk=;
        fh=tr7Ipvk/kZDnbQQw6Z1UOEgk8lOR8wXN2NEB56ReSco=;
        b=FvCsF6de0MKGNcACMil532nNb/x2H9VI95SxGWis4rw+kSPMof9mIRtg9lWyExzOsi
         7lYutxBLSdck22Q8DsdpApIUIunB99T6PLD4UqScDbH0pYGNV+CWSeNTz5RDFsU3olH/
         y7uvBCbATzVEuhEVYiZ7SKDHNw4QRoHd84wsWPJBxwqK/SmAC38VzBSAVaeo8T4Sucaw
         jJ78OAyIMPLimwJcK0yKWa0DmQLoGIWCNbRoMtIWqqTtuMwai3VKimN5yho4KD8Bev8y
         DvNhSwUyGCx8XlEliORcnv5cr+jPx9WlJ63dKLaIJQpR5qTISZKlKljOd18r4TMXeNDX
         o1/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyaF7o2l;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-acaa1c02264sor293262366b.10.2025.04.11.07.42.10
        (Google Transport Security);
        Fri, 11 Apr 2025 07:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyaF7o2l;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382530; x=1744987330; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fSg6VV0S2nSlCQBls/gUcOoEnqiGB9k8fi2W1vxyUOk=;
        b=ZyaF7o2lW/WslNCqtSIf4h/Po5YJ/D4Z2AX2XGehii9kyuw+KQXIukq80wLqnh95XS
         M+ZQXzSRcFJSMwBAgXkQtHxgUHz7BsJXQx5HY1b9kIjnTCvrCPKAxQgMF3nWG0AYeJ/4
         +hJsYyA8Gabc9sP2qNfb/Y7icNGwMvGMQ2Z/w6qvxGBS8ev2Mj31KQJWJ2k9iHlR5AQX
         Gtoz47uOkd/sXcg4yT+vfZ9YhiaJfT4YHVMLBs+NA9ss80jzoSY+2YnclLq91G9pGWZN
         oUZ9e8lKsCbcwaTcGy/vr9mxdso7vqgE84mAQAIlFJQTiZFO4fGKRD63ma8bmYBdIJAe
         P10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382530; x=1744987330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSg6VV0S2nSlCQBls/gUcOoEnqiGB9k8fi2W1vxyUOk=;
        b=bBCP+8dyDZ0RWB0lZvXwD2ncKUWKPPHnnVO7e2qGUOIj8UyaA7HIC7Ny6+R3fLz3OC
         rXTV9HHovsjAXWllsmNtsgtumJALwS389Qxj3WCfvnr7FILzOI4bZ194UcP99RHQ+Vq+
         XXBtOVlLDX9Ddl87koC7+fxCYianCcryO+gjms7RZRxPQuaJFurxs4MpxhnB0IitnuIq
         ycbXPBGdCToyDikPTmsKPLf6nIc2jDMOotWunyawMhBCSqgScnnsxPYKk/GVF6dyQ45Y
         76x325Tr95++HEu08La6wSauzl+6vH2dJaFaYsda6N3fzZOBVqiHVnScOAQhuLLRyTot
         rY2w==
X-Forwarded-Encrypted: i=1; AJvYcCW/vaomvdFiIatJhWf3o51blTtXwG/7BaceAlHxO2R6q43BzgtZIabLt5cFwKzRb9ncXMamsGgtrLuWpA==@linaro.org, AJvYcCWLE4WtmgcSS/5d+ffWcM6XzQ9nP8PBgPmNI4NoovMVwjg95yvXJ40Qo0XgQmPvnw9MR4Ljr3K1LflgI2fdfQ==@linaro.org, AJvYcCXmTaD8RnV4zFWM7/xrStMHzonD7kK8+Xopm4vkzSvWJMLfYa7ktwqq3/LMVi2J5IoHYJm/C11cYnFWEqJuPPVb4vs=@linaro.org
X-Gm-Message-State: AOJu0YwfVK9bseiB1UYRJtL/RVg6MVVRnPz+U3eG9wajq/8d06+IgyIO
	v1Rd2xgktfEz9G0wioJMkCuOLGxcCRbtgloEP3Z1JGb+lugj1YKF+zQOO+PxjTgXezlnne80FeB
	hW/4yyAF1vLG5cRhUAUQ4QZwrQXc=
X-Gm-Gg: ASbGncti4E+sxOzTfTVQaKsFhgY6iYXhBXmGbJDhValuuLki7Fivqbyc+S7WfK6NWc5
	0Yr0gBjrjHjTbzn9y/F7pZPJSpqaHrvmLP1hryXhfkk1F4xK/3FI+VFdEda1C8vNYVyUgH4ZPWH
	pev5EJvphcFpN0z2dp7xTpncWw9GVVkypNhvV36uPAHj7BjkhRBaY=
X-Google-Smtp-Source: AGHT+IGM/L1G5c/pGv0mWpPy9S2TrZVYAgbtjuqt00gDkNmv2LT9mD9EBklEQnolow+B7gZfjm/5nJqKbNTR9trnpjI=
X-Received: by 2002:a17:907:7f0d:b0:ac3:bd68:24f0 with SMTP id
 a640c23a62f3a-acad3457c9dmr311069566b.7.1744382529777; Fri, 11 Apr 2025
 07:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora> <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com> <26951ab5-cc40-465c-88d2-d70e98bae3f6@redhat.com>
In-Reply-To: <26951ab5-cc40-465c-88d2-d70e98bae3f6@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 23:41:55 +0900
X-Gm-Features: ATxdqUHuiB3X5nnUlwjG9zchkT6JXAC7eww0fXhplrsQCQJM-9blRapTad2xPWE
Message-ID: <CAEDrbUYj9362hWQuTNA28cMRLTrjd4MeqkN8BUpZUpEVbPcsTg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000a3dd7063281b5e4"
X-TUID: vAuJ957HPiUW

--0000000000000a3dd7063281b5e4
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

> > > The biggest problem I'm seeing is we no longer support 64-bit guests
on
> > > 32-bit hosts, and don't plan to revert that.
> >
> > Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
> > guest addresses on emscripten") should be considered as a temporary
> > workaround, enabled only for Emsripten builds. It will be removed once
> > wasm64 gains broader support and is adopted in the Wasm backend.
>
> Maybe there's a way though. Currently we don't support 64-bit guests on
> 32-bit hosts, but more precisely we don't support 64-bit guests with
> 32-bit host word size.
>
>
> The wasm TCG backend is able to compile with 64-bit words:
>
> +#define TCG_TARGET_HAS_div_i64          1
> +#define TCG_TARGET_HAS_rem_i64          1
> etc.
>
> and if x32 was a thing it would as well.  In fact the changes in patch
> 6/10 are not a full revert, and the "#ifdef EMSCRIPTEN" could be changed
to
>
> #if HOST_LONG_BITS >= TARGET_LONG_BITS
> ... use uintptr_t
> #else
> ... use uint64_t
> #endif

Thank you for the feedback.

Yes, the Wasm backend can be compiled with 64-bit words. The change
regarding the macro looks good to me.

--0000000000000a3dd7063281b5e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Paolo,<br><br>&gt; &gt; &gt;=
 The biggest problem I&#39;m seeing is we no longer support 64-bit guests o=
n<br>&gt; &gt; &gt; 32-bit hosts, and don&#39;t plan to revert that.<br>&gt=
; &gt; <br>&gt; &gt; Yes, so the sixth patch (&quot;[PATCH 06/10] include/e=
xec: Allow using 64bit<br>&gt; &gt; guest addresses on emscripten&quot;) sh=
ould be considered as a temporary<br>&gt; &gt; workaround, enabled only for=
 Emsripten builds. It will be removed once<br>&gt; &gt; wasm64 gains broade=
r support and is adopted in the Wasm backend.<br>&gt; <br>&gt; Maybe there&=
#39;s a way though. Currently we don&#39;t support 64-bit guests on<br>&gt;=
 32-bit hosts, but more precisely we don&#39;t support 64-bit guests with<b=
r>&gt; 32-bit host word size.<br>&gt; <br>&gt; <br>&gt; The wasm TCG backen=
d is able to compile with 64-bit words:<br>&gt; <br>&gt; +#define TCG_TARGE=
T_HAS_div_i64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>&gt; +#define TCG_TARG=
ET_HAS_rem_i64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>&gt; etc.<br>&gt; <br=
>&gt; and if x32 was a thing it would as well.=C2=A0 In fact the changes in=
 patch<br>&gt; 6/10 are not a full revert, and the &quot;#ifdef EMSCRIPTEN&=
quot; could be changed to<br>&gt; <br>&gt; #if HOST_LONG_BITS &gt;=3D TARGE=
T_LONG_BITS<br>&gt; ... use uintptr_t<br>&gt; #else<br>&gt; ... use uint64_=
t<br>&gt; #endif<br><br>Thank you for the feedback.<br><br>Yes, the Wasm ba=
ckend can be compiled with 64-bit words. The change<br>regarding the macro =
looks good to me.<br><br></div>

--0000000000000a3dd7063281b5e4--
