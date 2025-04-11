Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp367943njc;
        Fri, 11 Apr 2025 04:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxxlmSeHUovzgS57vuJ12KpUJaJWWQYCeHxeyZz+V7BBCHBysT5Ty5SnhwbSK006g0naohKNJC7osz4Q==@linaro.org
X-Received: by 2002:a05:6a20:d493:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-201797b1f7cmr3908662637.21.1744370598000;
        Fri, 11 Apr 2025 04:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744370597; cv=none;
        d=google.com; s=arc-20240605;
        b=Q+wpMUAIJeB2b9tBhOFOedDUYJsUq/YQi2CD19wgyq+QMPLOYaZH9njKZAICbxf8CV
         Vdr9yOmSIJZhWzuPKnzP30Kg+sjE94YTL3PvAZllnh0r0ovADKacFk060znx+W0owHij
         yAFUtSoDncKXljroU0OaVJXbRCo3DHf0+o9CLwZSBWxdAr0JhEhcduFIe6+SW3Pml948
         7uDUn/o1/r+WL/w+6c1YIsI+e+pOAjkY+1VgvDYjXLOy6nY597nTWa62fq8jR7HccZ6Y
         1ZP0Yceu0WOgCCFPXJLIz5FLik8DfBXnLhwFkzcU/TbhqMLOjp8nDwtDkffyPt5kS+av
         NqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=POWa9amohhkg9IY0tHhBlk6A916balObl73gAB2+jZM=;
        fh=C3m0VmFBSIYBcHNtyqpM4g1q/u8NGjEtgcsAbbiHutk=;
        b=WfsxoupDHvxg5kZwrmRDgQQVR97AgK07N+O4k+EXNaHFj6JuuJZuiUyyJ8xniRqlzs
         pTCvfntr7GJygFpFlEd+/iqrJv+s/CCKLGxH9xqqfyrHDubNTxfU60evqGYQrNkGGCQw
         +zAFGZhnsB13nFxEMahFFkDhqCzPzIRrZcDAQGkvS9ui45F7Gsp5+y3XtuF8fSX0V2/T
         7Wn+IR29d8EJkx2jrlatErN2tzn8MFAGJA8NvPjo60vA6flTdv1oFIwxIpUe6HoGQE1B
         XxgBv+MXOrYdcIB5ETEZ6CX4QTAxvuy9h06eQQrKfWJwVnxPUQXKv74LSm9o/LXgw+hN
         o/9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LmKET8ge;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b03f6f950b9sor2282986a12.1.2025.04.11.04.23.17
        (Google Transport Security);
        Fri, 11 Apr 2025 04:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=LmKET8ge;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744370597; x=1744975397; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=POWa9amohhkg9IY0tHhBlk6A916balObl73gAB2+jZM=;
        b=LmKET8ge8Aa/zyN48AzaxzBg5kJzH0ncQg2wyZv8ecEQwb7+BjjdG00k6vLNI/CDcI
         e2M8Ky1RPqcHqGNrwA0F6vB82uY5XrmCUvPMlRx4gavm05VUXu8/rLdwYCAIxZVhQsSn
         FxJk5uJQCXiEDgSt4sEGvsGGIGK2KXfvm2zJCucIzmeOIBLgBiW8xlSleehTefao7nhx
         MerwZDZlbKBAO1b1IuglNZsfi5dr7VOotAksfu6jD/q07o1lr2wNnwZZJE8VHwRNmCI+
         yqwMOV2m2Dn+ao2iWRfn34Zry6LRo+UTg94m6cAGjzk4JvHu852uO3v11OodMAVmZ1t/
         2c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370597; x=1744975397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POWa9amohhkg9IY0tHhBlk6A916balObl73gAB2+jZM=;
        b=X07ZMbeWXwNZqPJhZdLMpzto+yqBInv7LZx7ftNFph00C6ZpPjGDl9zwKcQM1btsrN
         VEFbAV1hJjWHPX/G4SePy3W5ub4/02uac9sUpF7kyo1cosj0dH92yjkr0xsznHobgUti
         ICBStkGhNrT/k/gNdLBHG4tcPCAv/df7tUb6fHcMDSY8RtJSETB1PXe4JCeDDUe+PtuN
         wSWZJsTlIm+6vK4BKyjIsttlK6e+toxuYXNtzWboahVJ1JqV4UMIyszG9n2sPlYnNbv9
         Mt5mgxB8SninfWwJyoIRCUnTiqz1GK+Znx+P3j/9Ee/gKXvrI8BIUXhuyBQCMTaI2iK3
         JHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwLzeSubotP66TfhDXXhF04tzHUKYxcQVN08OzGnXLhaRyIfefpn/DkGKqNeF4axuY1KOD+sNwJVlaUg==@linaro.org, AJvYcCWWlrepikDhcncuydCITuQVXZ3Lljh3dKuUhWE6ZcxnFDxvZBhYVQy+6oRy026/jGhcKgN14zpuDsksXokqSUJdqg==@linaro.org, AJvYcCXLk6egCDUDeMdJ+RP9Wo8sP0Xp6j9No7NmhAtNlLbeN0iTXVBlCHbpRAfKEoDxgLgQN6uIhOqH5Tl7ErLK5Q==@linaro.org, AJvYcCXQ22i6mHUltKzwI0Cs/4IurEfIJ0dxXE5K6Ptp9/h8rv6ewdeZePGpJQIRyPSUl3gcytWSzqFqbwoOwtMkUfHswoU=@linaro.org
X-Gm-Message-State: AOJu0YzeHP6JtFmXEMJPDDTKXbDyQK1SKuJPVTZm/ydxgZc7GskFZb9l
	T2+PkPhUJBli7DHMiwl9V0jgKR0Z+81IlY5n1M/a7ei+YPG6Rl717bcpayllWLLMgUpNggF3m9a
	RafbKt/SH59D6Fze21rgrtg7iPoY=
X-Gm-Gg: ASbGncsQkz5HJuUOtfW+L5+RiR1NtW3+1wl3sehTrDMAX8IEGokc6QYdNKVPX30gL9J
	hZpd/TXC+aSpQq0q2PIYRjOy878EnXL3wJBxYjC0VYO7Jkyd5gqgvgQyUiukGdhkv40/ow5QG5+
	cvCHjpS4GezU7MldaJaBpN4yGTJr3eGweCbUzys9KerESNil62KsE=
X-Google-Smtp-Source: AGHT+IEx09neglJA9sV2m9YQPc83Idqs+cTRdQSRaKY2RxTdStZP04TJkjZlR6ugPMRC7gQ/vlb15nFJyKWl3A+J2zQ=
X-Received: by 2002:a17:90b:5643:b0:2ef:31a9:95c6 with SMTP id
 98e67ed59e1d1-3082363461amr4452010a91.14.1744370597104; Fri, 11 Apr 2025
 04:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
 <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org> <671805c9-f802-412b-998e-ba83719f1e72@redhat.com>
 <CAEDrbUbnAzXpmNSNi11j7+a0DCYHy7d_MCY=TMqHUoxmo_ZHGw@mail.gmail.com> <CABgObfaL3f3BD56ajE=Dv+VKidjpW=FRuwTyFHr_Fpu5uAqmpg@mail.gmail.com>
In-Reply-To: <CABgObfaL3f3BD56ajE=Dv+VKidjpW=FRuwTyFHr_Fpu5uAqmpg@mail.gmail.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 11 Apr 2025 20:23:05 +0900
X-Gm-Features: ATxdqUEJFrccVS8JjDTk1JvgRBI7H_BQD53IPfrWwlrzj4rOHT-ZdCT1qDSf_Ok
Message-ID: <CAEDrbUbDuHPrRmTUUoM0nszzC_8i9Lxjs0vxrSxa6Wa8z4HW9A@mail.gmail.com>
Subject: Re: [PATCH 05/10] meson: Add wasm build in build scripts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
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
Content-Type: multipart/alternative; boundary="000000000000cc22a406327eedc0"
X-TUID: Iw4/R5zHE9Er

--000000000000cc22a406327eedc0
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

> > > >> has_int128_type is set to false on emscripten as of now to avoid
errors by
> > > >> libffi.
> > >
> > > What is the error here?  How hard would it be to test for it?
> >
> > When has_int128_type=true, I encountered a runtime error from libffi. To
> > reproduce this, we need to actually execute a libffi call with 128-bit
> > arguments.
> >
> > > Uncaught TypeError: Cannot convert 1079505232 to a BigInt
> > >     at ffi_call_js (out.js:702:37)
> > >     at qemu-system-x86_64.wasm.ffi_call
(qemu-system-x86_64.wasm:0xa37712)
> > >     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec_tci
(qemu-system-x86_64.wasm:0x65f440)
> > >     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec
(qemu-system-x86_64.wasm:0x65edff)
> > >     at qemu-system-x86_64.wasm.cpu_tb_exec
(qemu-system-x86_64.wasm:0x6762c0)
> > >     at qemu-system-x86_64.wasm.cpu_exec_loop
(qemu-system-x86_64.wasm:0x677c84)
> > >     at qemu-system-x86_64.wasm.dynCall_iii
(qemu-system-x86_64.wasm:0xab9014)
> > >     at ret.<computed> (out.js:6016:24)
> > >     at invoke_iii (out.js:7574:10)
> > >     at qemu-system-x86_64.wasm.cpu_exec_setjmp
(qemu-system-x86_64.wasm:0x676db8)
>
> Ok, I guess a comment mentioning that it's a libffi limitation is enough.
>
> > > At least -g -O3 -pthread should not be necessary.
> >
> > Thank you for the suggestion. -sPROXY_TO_PTHREAD flag used in
c_link_args
> > always requires -pthread, even during configuration. Otherwise, emcc
returns
> > an error like:
> >
> > > emcc: error: -sPROXY_TO_PTHREAD requires -pthread to work!
> >
> > So I think -pthread needs to be included in c_link_args at minimum.
I'll try
> > to remove other flags in the next version of the series.
>
> Reading more about -sPROXY_TO_PTHREAD it seems that you need it for
> all calls to emcc, even when compiling, so it's better to leave it in
> everywhere.
>
> > > For -Wno-unused-command-line-argument what are the warnings/errors
that
> > > you are getting?
> >
> > I encountered the following error when compiling QEMU:
> >
> > > clang: error: argument unused during compilation: '-no-pie'
[-Werror,-Wunused-command-line-argument]
> >
> > It seems Emscripten doesn't support the -no-pie flag, and this wasn't
caught
> > during the configure phase. It seems that removing
> > -Wno-unused-command-line-argument would require the following change in
> > meson.build, but I'm open to better approaches.
> >
> > > -if not get_option('b_pie')
> > > +if not get_option('b_pie') and host_os != 'emscripten'
> > >    qemu_common_flags += cc.get_supported_arguments('-fno-pie',
'-no-pie')
> > >  endif
>
> Meson should have passed the -Werror=unused-command-line-argument flag
> when doing the above test (CLikeCompiler._has_multi_arguments ->
> has_arguments -> Compiler.compiles -> _build_wrapper ->
> build_wrapper_args -> ClangCompiler.get_compiler_check_args). It would
> be great if you can check what's wrong in this theory so perhaps meson
> can be fixed, or at least send here a meson-log.txt.

According to meson-log.txt as shown below,
-Werror=unused-command-line-argument was passed to the compiler, but it
didn't catch the warning.

> Working directory:  /build/meson-private/tmp4q_5wl_9
> Code:
> extern int i;
> int i;
>
> -----------
> Command line: `/emsdk/upstream/emscripten/emcc -m32
/build/meson-private/tmp4q_5wl_9/testfile.c -o
/build/meson-private/tmp4q_5wl_9/output.o -c -D_FILE_OFFSET_BITS=64 -O0
-Werror=implicit-function-declaration -Werror=unknown-warning-option
-Werror=unused-command-line-argument -fno-pie` -> 0
> Compiler for C supports arguments -fno-pie: YES
> Running compile:
> Working directory:  /build/meson-private/tmpl9yy_8gs
> Code:
> extern int i;
> int i;
>
> -----------
> Command line: `/emsdk/upstream/emscripten/emcc -m32
/build/meson-private/tmpl9yy_8gs/testfile.c -o
/build/meson-private/tmpl9yy_8gs/output.o -c -D_FILE_OFFSET_BITS=64 -O0
-Werror=implicit-function-declaration -Werror=unknown-warning-option
-Werror=unused-command-line-argument -no-pie` -> 0
> stderr:
> clang: warning: argument unused during compilation: '-no-pie'
[-Wunused-command-line-argument]
> -----------
> Compiler for C supports arguments -no-pie: YES

It seems there's a related issue thread on the Meson repository [1].

[1] https://github.com/mesonbuild/meson/issues/5355

> My suggestion is (if possible) to split out the parts of this series
> that are enough to run QEMU under TCI, and get those in as quickly as
> possible. The TCG backend can come second.

Sure, I'll try to split this patch series.

--000000000000cc22a406327eedc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div>Hi Paolo,<br><br>&gt; &gt; &gt;=
 &gt;&gt; has_int128_type is set to false on emscripten as of now to avoid =
errors by<br>&gt; &gt; &gt; &gt;&gt; libffi.<br>&gt; &gt; &gt;<br>&gt; &gt;=
 &gt; What is the error here?=C2=A0 How hard would it be to test for it?<br=
>&gt; &gt;<br>&gt; &gt; When has_int128_type=3Dtrue, I encountered a runtim=
e error from libffi. To<br>&gt; &gt; reproduce this, we need to actually ex=
ecute a libffi call with 128-bit<br>&gt; &gt; arguments.<br>&gt; &gt;<br>&g=
t; &gt; &gt; Uncaught TypeError: Cannot convert 1079505232 to a BigInt<br>&=
gt; &gt; &gt; =C2=A0 =C2=A0 at ffi_call_js (out.js:702:37)<br>&gt; &gt; &gt=
; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.ffi_call (qemu-system-x86_64.was=
m:0xa37712)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.tcg_=
qemu_tb_exec_tci (qemu-system-x86_64.wasm:0x65f440)<br>&gt; &gt; &gt; =C2=
=A0 =C2=A0 at qemu-system-x86_64.wasm.tcg_qemu_tb_exec (qemu-system-x86_64.=
wasm:0x65edff)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.c=
pu_tb_exec (qemu-system-x86_64.wasm:0x6762c0)<br>&gt; &gt; &gt; =C2=A0 =C2=
=A0 at qemu-system-x86_64.wasm.cpu_exec_loop (qemu-system-x86_64.wasm:0x677=
c84)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.dynCall_iii=
 (qemu-system-x86_64.wasm:0xab9014)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at ret.=
&lt;computed&gt; (out.js:6016:24)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at invoke=
_iii (out.js:7574:10)<br>&gt; &gt; &gt; =C2=A0 =C2=A0 at qemu-system-x86_64=
.wasm.cpu_exec_setjmp (qemu-system-x86_64.wasm:0x676db8)<br>&gt; <br>&gt; O=
k, I guess a comment mentioning that it&#39;s a libffi limitation is enough=
.<br>&gt; <br>&gt; &gt; &gt; At least -g -O3 -pthread should not be necessa=
ry.<br>&gt; &gt;<br>&gt; &gt; Thank you for the suggestion. -sPROXY_TO_PTHR=
EAD flag used in c_link_args<br>&gt; &gt; always requires -pthread, even du=
ring configuration. Otherwise, emcc returns<br>&gt; &gt; an error like:<br>=
&gt; &gt;<br>&gt; &gt; &gt; emcc: error: -sPROXY_TO_PTHREAD requires -pthre=
ad to work!<br>&gt; &gt;<br>&gt; &gt; So I think -pthread needs to be inclu=
ded in c_link_args at minimum. I&#39;ll try<br>&gt; &gt; to remove other fl=
ags in the next version of the series.<br>&gt; <br>&gt; Reading more about =
-sPROXY_TO_PTHREAD it seems that you need it for<br>&gt; all calls to emcc,=
 even when compiling, so it&#39;s better to leave it in<br>&gt; everywhere.=
<br>&gt; <br>&gt; &gt; &gt; For -Wno-unused-command-line-argument what are =
the warnings/errors that<br>&gt; &gt; &gt; you are getting?<br>&gt; &gt;<br=
>&gt; &gt; I encountered the following error when compiling QEMU:<br>&gt; &=
gt;<br>&gt; &gt; &gt; clang: error: argument unused during compilation: &#3=
9;-no-pie&#39; [-Werror,-Wunused-command-line-argument]<br>&gt; &gt;<br>&gt=
; &gt; It seems Emscripten doesn&#39;t support the -no-pie flag, and this w=
asn&#39;t caught<br>&gt; &gt; during the configure phase. It seems that rem=
oving<br>&gt; &gt; -Wno-unused-command-line-argument would require the foll=
owing change in<br>&gt; &gt; meson.build, but I&#39;m open to better approa=
ches.<br>&gt; &gt;<br>&gt; &gt; &gt; -if not get_option(&#39;b_pie&#39;)<br=
>&gt; &gt; &gt; +if not get_option(&#39;b_pie&#39;) and host_os !=3D &#39;e=
mscripten&#39;<br>&gt; &gt; &gt; =C2=A0 =C2=A0qemu_common_flags +=3D cc.get=
_supported_arguments(&#39;-fno-pie&#39;, &#39;-no-pie&#39;)<br>&gt; &gt; &g=
t; =C2=A0endif<br>&gt; <br>&gt; Meson should have passed the -Werror=3Dunus=
ed-command-line-argument flag<br>&gt; when doing the above test (CLikeCompi=
ler._has_multi_arguments -&gt;<br>&gt; has_arguments -&gt; Compiler.compile=
s -&gt; _build_wrapper -&gt;<br>&gt; build_wrapper_args -&gt; ClangCompiler=
.get_compiler_check_args). It would<br>&gt; be great if you can check what&=
#39;s wrong in this theory so perhaps meson<br>&gt; can be fixed, or at lea=
st send here a meson-log.txt.<br><br>According to meson-log.txt as shown be=
low,<br>-Werror=3Dunused-command-line-argument was passed to the compiler, =
but it<br>didn&#39;t catch the warning.<br><br>&gt; Working directory: =C2=
=A0/build/meson-private/tmp4q_5wl_9<br>&gt; Code:<br>&gt; extern int i;<br>=
&gt; int i;<br>&gt; <br>&gt; -----------<br>&gt; Command line: `/emsdk/upst=
ream/emscripten/emcc -m32 /build/meson-private/tmp4q_5wl_9/testfile.c -o /b=
uild/meson-private/tmp4q_5wl_9/output.o -c -D_FILE_OFFSET_BITS=3D64 -O0 -We=
rror=3Dimplicit-function-declaration -Werror=3Dunknown-warning-option -Werr=
or=3Dunused-command-line-argument -fno-pie` -&gt; 0<br>&gt; Compiler for C =
supports arguments -fno-pie: YES <br>&gt; Running compile:<br>&gt; Working =
directory: =C2=A0/build/meson-private/tmpl9yy_8gs<br>&gt; Code:<br>&gt; ext=
ern int i;<br>&gt; int i;<br>&gt; <br>&gt; -----------<br>&gt; Command line=
: `/emsdk/upstream/emscripten/emcc -m32 /build/meson-private/tmpl9yy_8gs/te=
stfile.c -o /build/meson-private/tmpl9yy_8gs/output.o -c -D_FILE_OFFSET_BIT=
S=3D64 -O0 -Werror=3Dimplicit-function-declaration -Werror=3Dunknown-warnin=
g-option -Werror=3Dunused-command-line-argument -no-pie` -&gt; 0<br>&gt; st=
derr:<br>&gt; clang: warning: argument unused during compilation: &#39;-no-=
pie&#39; [-Wunused-command-line-argument]<br>&gt; -----------<br>&gt; Compi=
ler for C supports arguments -no-pie: YES <br><br>It seems there&#39;s a re=
lated issue thread on the Meson repository [1].<br><br>[1] <a href=3D"https=
://github.com/mesonbuild/meson/issues/5355">https://github.com/mesonbuild/m=
eson/issues/5355</a><br><br>&gt; My suggestion is (if possible) to split ou=
t the parts of this series<br>&gt; that are enough to run QEMU under TCI, a=
nd get those in as quickly as<br>&gt; possible. The TCG backend can come se=
cond.<br><br>Sure, I&#39;ll try to split this patch series.</div>

--000000000000cc22a406327eedc0--
