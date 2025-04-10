Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8370436njd;
        Thu, 10 Apr 2025 05:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8vETQ0xnrI8B+Pee97X021B7X3o6qsOvgIHIf+Ts+LPx0d+MILWNUdKNb4JuaTSfNpJQG+Z5A1N1dJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZqS/Ft3BY0HzUYRCuZ30Z7ECgrJ8QeSoeeLsgLCSbAEmdDedLNlE4/QruSWMsicBILlny
X-Received: by 2002:a05:6902:4913:b0:e6b:7aa8:59f9 with SMTP id 3f1490d57ef6-e703e0ed7afmr4000819276.4.1744289724725;
        Thu, 10 Apr 2025 05:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744289724; cv=none;
        d=google.com; s=arc-20240605;
        b=KEVRFKIMT/NodWtF5z7L3HKXO21enKBkrUbiWMB7dqUCGzV9W2d+FkRqUP21F8IaPr
         xNdtkAe4BbdUG9v0Y5/1+nFGOD0p7qkbHZTKuNDqPAlBz/uedAoaKoEWU0ZXDcEy1IbR
         0n27Lc2ATRCf41feHp6zXShwpsjqU8tsyxPJuNie+tB62NmX+u+rktKPczcLwxwMxuAv
         EO6ZFUJmmceFFUM6c3pTTPUA948hdzsuPCPAYcoDgqOwSddChZArGj0x4cyIv+gZS4TU
         SGQ052JVO15iJ+jooTnj3fYpzoIS688qD0Hth6Rz0AetXSQm+z307geFyUTkKR//TkZt
         IEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uY+GXIRcFHjEMDAwApDq5u+dpMv+32eCMLTfB4Go5sE=;
        fh=h/xq0HSKuKGvYzHFttcQlJ5TBbXx1QoEvCv99+erpS4=;
        b=laVe07ECs+3WJBY6rC+I/e2KzCOJ+VUVrcL60L3r4a2xlqDnS2J+VRyscoltCdwxSR
         XguGKRQySzTqIRzYZfVrGzOBsDU7xk7LJFerfC8ty6fetaksXIlYykfi3eWB874Yr36H
         vqr5yJvEjbgvrEMbT6oKx+cVcYhfvFJuZwHIFPWpnn71hWRVrtK7tLWPL0kkoYdtaxS2
         T3a6yevSqB8+2D9Cs5SRngsGA/u5dPPZQ6C/544yw+Ps8pZqkh2INBFJWVEWXdc0Sq7r
         gEvtnSyy4oemtkX98npdjAa3o+NaX+wKVuOb+p7/CW+wBM1wqzAwrmz1R2rbIuzWlc6z
         9QMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OCBgQL91;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327c1bb7si4932221276.256.2025.04.10.05.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OCBgQL91;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744289724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uY+GXIRcFHjEMDAwApDq5u+dpMv+32eCMLTfB4Go5sE=;
	b=OCBgQL91BtwmaXqClGY0/katG9AY6OLu1srChBkJacCkR3CiPFVZA8fOlXtv/sUR0gQ7Dq
	9lHZ4Khi2nIBW7ejWFEV0dF/NQGRLmswoBl8NhD59vJrWHml7ZY2fxGE8aDJqW98J9Xm3j
	d9kig1Ss2g0OxTde/VTZcCnXWxyL9Hw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-aBrmER7zPCO7-z9oD_4W6Q-1; Thu, 10 Apr 2025 08:55:23 -0400
X-MC-Unique: aBrmER7zPCO7-z9oD_4W6Q-1
X-Mimecast-MFC-AGG-ID: aBrmER7zPCO7-z9oD_4W6Q_1744289722
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so4611755e9.2
        for <alex.bennee@linaro.org>; Thu, 10 Apr 2025 05:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289722; x=1744894522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY+GXIRcFHjEMDAwApDq5u+dpMv+32eCMLTfB4Go5sE=;
        b=e7SrevNog980DHQI06hH2aQ0EtgoKF5+HXTU4PmN+IBY9/aPwAvaqg/1w2RqWsXTH8
         EFJz2Jv2AoXKgK1qNI3xqUq1qEYb3+JgZvUsThDQHyH1WhXPcGC+bIXSKbC35ByYRra2
         bASuFW0H4Om3bhwaLvx5hGxxVQR3ZSFf6pYKOmoQTNE77KAZ49edYgwrfci0+OHjIiPR
         e5AZQG94+TmUCT9Zw4eVmdAM7n49zb/Kfmje+vft6uvnE31GJ+Jwe+lg9P4EB6HibTVG
         sbUPaBqPXe05v9ehI+/yFLbBwb1gWnig2U2/L3ardw/bwCyFsPRzPzze4r1J700abCOo
         G4yw==
X-Forwarded-Encrypted: i=1; AJvYcCVbx4XZB0rzhvpVNYxQZbUBpIzzOH84arozwnJlqm6lsQWebF9x04Ekugy3fBzBs1w0tCMcHSiOCBc5Cw==@linaro.org
X-Gm-Message-State: AOJu0Yzkhz/CwS1sDbkj7ad3L0fSwzbMoXJfIjxdArbUPxp4oQ7m0lpt
	X6HmLm+y0L0FpguIXfkt8A7JHFuGBjGHSjsK3hEqp0Muj0vTd3V/REeE45aJ9kwyMfBPrBifScI
	z81Dg2Hv8jtvkfO6vEAJnvXgQXWmhgEaKtvXhngqM/+gvpWZrg7Hmv9sK1q6SnyWU8nSbe67ziB
	jbnICAiQ6HB2goT+7sfCgAXHZYPktS
X-Gm-Gg: ASbGncsIEXiNmg9z36okCqkL+3luiKHCI+BTiyrNGUQjlt8+Q2TcSIYjeFHTIG2VUCU
	HfvPAxUFn3aLKxwqOBY8SMOz41NLMszhvz7mh/qIo+aTsSmSFvcNQnmIGRsk69yqiJlsbZhw=
X-Received: by 2002:a05:600c:444f:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43f2d95a8cemr20170425e9.26.1744289721792;
        Thu, 10 Apr 2025 05:55:21 -0700 (PDT)
X-Received: by 2002:a05:600c:444f:b0:43c:ec28:d301 with SMTP id
 5b1f17b1804b1-43f2d95a8cemr20170155e9.26.1744289721389; Thu, 10 Apr 2025
 05:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
 <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org> <671805c9-f802-412b-998e-ba83719f1e72@redhat.com>
 <CAEDrbUbnAzXpmNSNi11j7+a0DCYHy7d_MCY=TMqHUoxmo_ZHGw@mail.gmail.com>
In-Reply-To: <CAEDrbUbnAzXpmNSNi11j7+a0DCYHy7d_MCY=TMqHUoxmo_ZHGw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Apr 2025 14:55:07 +0200
X-Gm-Features: ATxdqUGKmzOKJOybqP1sPUXX_2b_QdTs7865rXacRygnAG-Afji3ov0U768K7SU
Message-ID: <CABgObfaL3f3BD56ajE=Dv+VKidjpW=FRuwTyFHr_Fpu5uAqmpg@mail.gmail.com>
Subject: Re: [PATCH 05/10] meson: Add wasm build in build scripts
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
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
	qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0E_9pO6qTZIoBghvIPjDGWqszYwnAuwWQQL_x0BiBTs_1744289722
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pRpgThObcoOi

On Thu, Apr 10, 2025 at 2:24=E2=80=AFPM Kohei Tokunaga <ktokunaga.mail@gmai=
l.com> wrote:
> > >> has_int128_type is set to false on emscripten as of now to avoid err=
ors by
> > >> libffi.
> >
> > What is the error here?  How hard would it be to test for it?
>
> When has_int128_type=3Dtrue, I encountered a runtime error from libffi. T=
o
> reproduce this, we need to actually execute a libffi call with 128-bit
> arguments.
>
> > Uncaught TypeError: Cannot convert 1079505232 to a BigInt
> >     at ffi_call_js (out.js:702:37)
> >     at qemu-system-x86_64.wasm.ffi_call (qemu-system-x86_64.wasm:0xa377=
12)
> >     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec_tci (qemu-system-x86_64=
.wasm:0x65f440)
> >     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec (qemu-system-x86_64.was=
m:0x65edff)
> >     at qemu-system-x86_64.wasm.cpu_tb_exec (qemu-system-x86_64.wasm:0x6=
762c0)
> >     at qemu-system-x86_64.wasm.cpu_exec_loop (qemu-system-x86_64.wasm:0=
x677c84)
> >     at qemu-system-x86_64.wasm.dynCall_iii (qemu-system-x86_64.wasm:0xa=
b9014)
> >     at ret.<computed> (out.js:6016:24)
> >     at invoke_iii (out.js:7574:10)
> >     at qemu-system-x86_64.wasm.cpu_exec_setjmp (qemu-system-x86_64.wasm=
:0x676db8)

Ok, I guess a comment mentioning that it's a libffi limitation is enough.

> > At least -g -O3 -pthread should not be necessary.
>
> Thank you for the suggestion. -sPROXY_TO_PTHREAD flag used in c_link_args
> always requires -pthread, even during configuration. Otherwise, emcc retu=
rns
> an error like:
>
> > emcc: error: -sPROXY_TO_PTHREAD requires -pthread to work!
>
> So I think -pthread needs to be included in c_link_args at minimum. I'll =
try
> to remove other flags in the next version of the series.

Reading more about -sPROXY_TO_PTHREAD it seems that you need it for
all calls to emcc, even when compiling, so it's better to leave it in
everywhere.

> > For -Wno-unused-command-line-argument what are the warnings/errors that
> > you are getting?
>
> I encountered the following error when compiling QEMU:
>
> > clang: error: argument unused during compilation: '-no-pie' [-Werror,-W=
unused-command-line-argument]
>
> It seems Emscripten doesn't support the -no-pie flag, and this wasn't cau=
ght
> during the configure phase. It seems that removing
> -Wno-unused-command-line-argument would require the following change in
> meson.build, but I'm open to better approaches.
>
> > -if not get_option('b_pie')
> > +if not get_option('b_pie') and host_os !=3D 'emscripten'
> >    qemu_common_flags +=3D cc.get_supported_arguments('-fno-pie', '-no-p=
ie')
> >  endif

Meson should have passed the -Werror=3Dunused-command-line-argument flag
when doing the above test (CLikeCompiler._has_multi_arguments ->
has_arguments -> Compiler.compiles -> _build_wrapper ->
build_wrapper_args -> ClangCompiler.get_compiler_check_args). It would
be great if you can check what's wrong in this theory so perhaps meson
can be fixed, or at least send here a meson-log.txt.

My suggestion is (if possible) to split out the parts of this series
that are enough to run QEMU under TCI, and get those in as quickly as
possible. The TCG backend can come second.

Thanks,

Paolo
