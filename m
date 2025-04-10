Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8353361njd;
        Thu, 10 Apr 2025 05:24:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9O4WrwzQYeqlPaYsbv2Ht/mlaKMohd/IV1Cejygkjr4X8r41VYg3nzcHv+WGzORY5hWkujQQcfukf4A==@linaro.org
X-Received: by 2002:a17:903:1b06:b0:220:e362:9b1a with SMTP id d9443c01a7336-22be0322f16mr33128635ad.25.1744287871750;
        Thu, 10 Apr 2025 05:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744287871; cv=none;
        d=google.com; s=arc-20240605;
        b=Kqwt51huWnKe79GG+6LlR5X7JbL1WGILcewWkM+/Y20kUOQMwaV7rAK46kl0b2FxXA
         /qp2C9dvtciaOVikwMRtiMym1IyIEiP3GYHkogGJRgeW6K4ebWoVumrM6VWP4e/p4Nwl
         iE1PPw7uPvw6MoA0PfBMGAYetF+5SEJrhCkEj8tN+F1wLPA0TaRB4jM2KnoGh8nlDX74
         jtwo4pLdThGhW5dP+lQBe0/mmz/XZLwpTXRd2QGQOLDNakJy02rkViLLfmUsiUD4PVSO
         PANevwYbj49/EKIg2Gsnr3V8pF/QQ7CpKGZBdJENjtZLhaBtWNp61Hv2CnrBeSRCEXep
         IwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bUphInPLmEDCerY7cJxB4YMAiJbIiSaraVi2vqUAgHU=;
        fh=TdoSVBFfG3ZAROKZoR0ZIQON5NdULXfWhz3/6fCeP+g=;
        b=UixsD13bE9Bh4OZvdtnnLC2FsbVIUAPQTi0nB1ObKiD2ztoN5P9f2V+c8wLmViuyXe
         jFHudbv5bQH8qD8QAHxJR9GP2wGgYKILGHsyPrC26Mter7R6ERHFU1Br5wVi/32F+yzk
         qeczHWtYwbufondhZkbj8yniqc98QlbTYXGr5JvAgevEdpC7sRysb/7Gvv3ez68G6UAN
         rPNsUGJ9/hk498/g3KILvqzikglf7pFwUOa2Tjs7rOY6M5c85He+uFn9ykY7/CiCWRN0
         KNKDIUNMpXSPi9b0FsAwB8OvwF9h0pFFXNEECNHD5MwFXn7KhvR9/o1AijHNCRm5k6uz
         vsAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="THG/qLYI";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22be116d53dsor8157525ad.14.2025.04.10.05.24.31
        (Google Transport Security);
        Thu, 10 Apr 2025 05:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="THG/qLYI";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287871; x=1744892671; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bUphInPLmEDCerY7cJxB4YMAiJbIiSaraVi2vqUAgHU=;
        b=THG/qLYIxfc5PJQdi+dQ/7IDFaZ60JolmQeP8GFhuMts8QCAgQ59ugBzk/kmfv/NpV
         /OuE8D5W7E1CZ7vS/3Offctml4e8ikCsXLj+2MQABZUnqefT//Xxhdmf7Qh0YKNYh4v9
         GssEfnl6pOxhdWlyOeahGeX5EC9pIXLCZkwgeIVmJ7MAwakDh3v+zGbCYpGNG7lCJGQC
         s3O1ZCX2a/Ka0aFi0kCJyz2bW3vpG+svOlFPBENKJoqa6fgOhXlnfK1rh4AvoGYJadbb
         D7Hn0zU3hzMYbCz65EZTtvt/Vw+HTW+ZKnVXKWqphPI9+h9+4DS1JU917j4EKnIoYQa2
         rvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287871; x=1744892671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUphInPLmEDCerY7cJxB4YMAiJbIiSaraVi2vqUAgHU=;
        b=nFsgKG6eo5ltIQTzF9M8KJKVtLZ6LH0XppxqtVTCSgeeRSMP0JJ6ROy9D4Ui/uquI6
         JY2heJeRmKESfJqEwf5vf07VrDPhaK/tm/uPzhFIqvYDeeCmKQHH/lXsUa6Fmi39SJuC
         lQ67Dxns+ro3Lc4IdViHDiETNBqy51RevqJofepi2yzJoLQqJBF7+/NgJoLIeH2cve5Y
         NgBvDXXTF1X3bnNqYhBmNC4VMb36YcKuHXppdtRBgrXn7icbJax7EEaroSJXeRoNUL+4
         5WdqPuyy7SpwAgIwMQEZ3Lly912noNwRo4oXNT6/79e0KQhZIS1uZT8T7G/mbrAR2EO9
         ZbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjQ2OA2DTegWah0yIKvGTu4hzG1rv6Hs6pwQgYpU4/2jy2oF9PKkweSFSWoNxtWO9KHoDu3ffWqTfZag==@linaro.org, AJvYcCVN+i0pTn9e+oCdWqD7BUYC7b+QZvFO+ZkGaPiLkMtA5U1/ELRqiCUMDYgc68XHaZk05OUeAMoS2qIX+MKWuttHUg==@linaro.org, AJvYcCWzmdnOQjbE3KZo90AEDjbEfyad/bUTxRW+6uWuMEyLJiuLytIPPyOvscF28X4Pp2PCbjIwBOz5C5bUCWA1rA==@linaro.org, AJvYcCXanyQkQ/uMYUsDOL5q9Z0ZWGdUOEKLwoSZ+LuF6sWVTX507Yv78lj0kd+qyDKZZuLpn33sZ9BOW0e4mIhYXq0SOOM=@linaro.org
X-Gm-Message-State: AOJu0YxBzNapXqjPvHSgCOm6RqKaNu4hbcdK6szULJHSZE6UZOQi2kIO
	AhTOXJPyajKd4Nhpy3+YI62XXBI7k0YxHUF+TmJCF6wTE0MldRFfjXg4iLtv84eqUmnVZQMvyvw
	43vQ68ZnrF53TEl1Z7AXkfBI0sos=
X-Gm-Gg: ASbGncv58JoGiY4Fs109oZvwRpfpOGPq/U1qC6uLPLIwIJPLNYFwTImxPGkPosLxac6
	IsPUk8JCmEl0j2v+ryQAGAgOSBOR0kVVRpQYqIrOqXXFvxowwWhCWpU6NxRGMiXpaadvwWVKdws
	iycBj4D6FypBxJ/hEP1wChEPo1JbgtoZI2VeQrBdtm7ujt6O1UxZM=
X-Google-Smtp-Source: AGHT+IFjSY680fopcspcV4dUSl5ihWrJhgbnXfs2mZ+dOnxVdG/BfQfFtKhI2p5hFRI6D7GBe8EyIw2lqwpHRV7Cn6k=
X-Received: by 2002:a17:90b:1f88:b0:2ee:44ec:e524 with SMTP id
 98e67ed59e1d1-307e9b3f36dmr3334852a91.35.1744287871077; Thu, 10 Apr 2025
 05:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
 <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org> <671805c9-f802-412b-998e-ba83719f1e72@redhat.com>
In-Reply-To: <671805c9-f802-412b-998e-ba83719f1e72@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 10 Apr 2025 21:24:18 +0900
X-Gm-Features: ATxdqUEAUMCgXq0GAn2bYNIHf98GyBjr_QDHwkvX6Mgc8qM0VB1vNeJy_FRznks
Message-ID: <CAEDrbUbnAzXpmNSNi11j7+a0DCYHy7d_MCY=TMqHUoxmo_ZHGw@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000f1196306326baa44"
X-TUID: /eqOUh9aTw9v

--000000000000f1196306326baa44
Content-Type: text/plain; charset="UTF-8"

Hi Paolo, thank you for the comments.

> >> has_int128_type is set to false on emscripten as of now to avoid
errors by
> >> libffi.
>
> What is the error here?  How hard would it be to test for it?

When has_int128_type=true, I encountered a runtime error from libffi. To
reproduce this, we need to actually execute a libffi call with 128-bit
arguments.

> Uncaught TypeError: Cannot convert 1079505232 to a BigInt
>     at ffi_call_js (out.js:702:37)
>     at qemu-system-x86_64.wasm.ffi_call (qemu-system-x86_64.wasm:0xa37712)
>     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec_tci
(qemu-system-x86_64.wasm:0x65f440)
>     at qemu-system-x86_64.wasm.tcg_qemu_tb_exec
(qemu-system-x86_64.wasm:0x65edff)
>     at qemu-system-x86_64.wasm.cpu_tb_exec
(qemu-system-x86_64.wasm:0x6762c0)
>     at qemu-system-x86_64.wasm.cpu_exec_loop
(qemu-system-x86_64.wasm:0x677c84)
>     at qemu-system-x86_64.wasm.dynCall_iii
(qemu-system-x86_64.wasm:0xab9014)
>     at ret.<computed> (out.js:6016:24)
>     at invoke_iii (out.js:7574:10)
>     at qemu-system-x86_64.wasm.cpu_exec_setjmp
(qemu-system-x86_64.wasm:0x676db8)

> >> And tests aren't integrated with Wasm execution environment as of
> >> now so this commit disables tests.
>
> Perhaps it would be enough to add
>
> [binaries]
> exe_wrapper = 'node'
>
> to the emscripten.txt file?

Thank you for the suggestion. I'll explore this approach.

> >> +[built-in options]
> >> +c_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> >> +cpp_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> >> +objc_args =
['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> >> +c_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-
> >> pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-
> >> sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-
> >> sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-
> >> sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
> >> +cpp_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-
> >> pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-
> >> sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-
> >> sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-
> >> sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
>
> At least -g -O3 -pthread should not be necessary.

Thank you for the suggestion. -sPROXY_TO_PTHREAD flag used in c_link_args
always requires -pthread, even during configuration. Otherwise, emcc returns
an error like:

> emcc: error: -sPROXY_TO_PTHREAD requires -pthread to work!

So I think -pthread needs to be included in c_link_args at minimum. I'll try
to remove other flags in the next version of the series.

> For -Wno-unused-command-line-argument what are the warnings/errors that
> you are getting?

I encountered the following error when compiling QEMU:

> clang: error: argument unused during compilation: '-no-pie'
[-Werror,-Wunused-command-line-argument]

It seems Emscripten doesn't support the -no-pie flag, and this wasn't caught
during the configure phase. It seems that removing
-Wno-unused-command-line-argument would require the following change in
meson.build, but I'm open to better approaches.

> -if not get_option('b_pie')
> +if not get_option('b_pie') and host_os != 'emscripten'
>    qemu_common_flags += cc.get_supported_arguments('-fno-pie', '-no-pie')
>  endif

> >> +elif host_os == 'emscripten'
> >> +  supported_backends += ['fiber']
>
> Can you rename the backend to 'wasm' since the 'windows' backend also
> uses an API called Fibers?

Sure, I'll rename the coroutine backend in the next version of the series.

--000000000000f1196306326baa44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo, thank you for =
the comments.<br><br>&gt; &gt;&gt; has_int128_type is set to false on emscr=
ipten as of now to avoid errors by<br>&gt; &gt;&gt; libffi.<br>&gt; <br>&gt=
; What is the error here?=C2=A0 How hard would it be to test for it?<br><br=
>When has_int128_type=3Dtrue, I encountered a runtime error from libffi. To=
<br>reproduce this, we need to actually execute a libffi call with 128-bit<=
br>arguments.<br><br>&gt; Uncaught TypeError: Cannot convert 1079505232 to =
a BigInt<br>&gt; =C2=A0 =C2=A0 at ffi_call_js (out.js:702:37)<br>&gt; =C2=
=A0 =C2=A0 at qemu-system-x86_64.wasm.ffi_call (qemu-system-x86_64.wasm:0xa=
37712)<br>&gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.tcg_qemu_tb_exec_tc=
i (qemu-system-x86_64.wasm:0x65f440)<br>&gt; =C2=A0 =C2=A0 at qemu-system-x=
86_64.wasm.tcg_qemu_tb_exec (qemu-system-x86_64.wasm:0x65edff)<br>&gt; =C2=
=A0 =C2=A0 at qemu-system-x86_64.wasm.cpu_tb_exec (qemu-system-x86_64.wasm:=
0x6762c0)<br>&gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.cpu_exec_loop (q=
emu-system-x86_64.wasm:0x677c84)<br>&gt; =C2=A0 =C2=A0 at qemu-system-x86_6=
4.wasm.dynCall_iii (qemu-system-x86_64.wasm:0xab9014)<br>&gt; =C2=A0 =C2=A0=
 at ret.&lt;computed&gt; (out.js:6016:24)<br>&gt; =C2=A0 =C2=A0 at invoke_i=
ii (out.js:7574:10)<br>&gt; =C2=A0 =C2=A0 at qemu-system-x86_64.wasm.cpu_ex=
ec_setjmp (qemu-system-x86_64.wasm:0x676db8)<br><br>&gt; &gt;&gt; And tests=
 aren&#39;t integrated with Wasm execution environment as of<br>&gt; &gt;&g=
t; now so this commit disables tests.<br>&gt; <br>&gt; Perhaps it would be =
enough to add<br>&gt; <br>&gt; [binaries]<br>&gt; exe_wrapper =3D &#39;node=
&#39;<br>&gt; <br>&gt; to the emscripten.txt file?<br><br>Thank you for the=
 suggestion. I&#39;ll explore this approach.<br><br>&gt; &gt;&gt; +[built-i=
n options]<br>&gt; &gt;&gt; +c_args =3D [&#39;-Wno-unused-command-line-argu=
ment&#39;,&#39;-g&#39;,&#39;-O3&#39;,&#39;-pthread&#39;]<br>&gt; &gt;&gt; +=
cpp_args =3D [&#39;-Wno-unused-command-line-argument&#39;,&#39;-g&#39;,&#39=
;-O3&#39;,&#39;-pthread&#39;]<br>&gt; &gt;&gt; +objc_args =3D [&#39;-Wno-un=
used-command-line-argument&#39;,&#39;-g&#39;,&#39;-O3&#39;,&#39;-pthread&#3=
9;]<br>&gt; &gt;&gt; +c_link_args =3D [&#39;-Wno-unused-command-line-argume=
nt&#39;,&#39;-g&#39;,&#39;-O3&#39;,&#39;-<br>&gt; &gt;&gt; pthread&#39;,&#3=
9;-sASYNCIFY=3D1&#39;,&#39;-sPROXY_TO_PTHREAD=3D1&#39;,&#39;-sFORCE_FILESYS=
TEM&#39;,&#39;-<br>&gt; &gt;&gt; sALLOW_TABLE_GROWTH&#39;,&#39;-sTOTAL_MEMO=
RY=3D2GB&#39;,&#39;-sWASM_BIGINT&#39;,&#39;-<br>&gt; &gt;&gt; sEXPORT_ES6=
=3D1&#39;,&#39;-sASYNCIFY_IMPORTS=3Dffi_call_js&#39;,&#39;-<br>&gt; &gt;&gt=
; sEXPORTED_RUNTIME_METHODS=3DaddFunction,removeFunction,TTY,FS&#39;]<br>&g=
t; &gt;&gt; +cpp_link_args =3D [&#39;-Wno-unused-command-line-argument&#39;=
,&#39;-g&#39;,&#39;-O3&#39;,&#39;-<br>&gt; &gt;&gt; pthread&#39;,&#39;-sASY=
NCIFY=3D1&#39;,&#39;-sPROXY_TO_PTHREAD=3D1&#39;,&#39;-sFORCE_FILESYSTEM&#39=
;,&#39;-<br>&gt; &gt;&gt; sALLOW_TABLE_GROWTH&#39;,&#39;-sTOTAL_MEMORY=3D2G=
B&#39;,&#39;-sWASM_BIGINT&#39;,&#39;-<br>&gt; &gt;&gt; sEXPORT_ES6=3D1&#39;=
,&#39;-sASYNCIFY_IMPORTS=3Dffi_call_js&#39;,&#39;-<br>&gt; &gt;&gt; sEXPORT=
ED_RUNTIME_METHODS=3DaddFunction,removeFunction,TTY,FS&#39;]<br>&gt; <br>&g=
t; At least -g -O3 -pthread should not be necessary.<br><br>Thank you for t=
he suggestion. -sPROXY_TO_PTHREAD flag used in c_link_args<br>always requir=
es -pthread, even during configuration. Otherwise, emcc returns<br>an error=
 like:<br><br>&gt; emcc: error: -sPROXY_TO_PTHREAD requires -pthread to wor=
k!<br><br>So I think -pthread needs to be included in c_link_args at minimu=
m. I&#39;ll try<br>to remove other flags in the next version of the series.=
<br><br>&gt; For -Wno-unused-command-line-argument what are the warnings/er=
rors that<br>&gt; you are getting?<br><br>I encountered the following error=
 when compiling QEMU:<br><br>&gt; clang: error: argument unused during comp=
ilation: &#39;-no-pie&#39; [-Werror,-Wunused-command-line-argument]<br><br>=
It seems Emscripten doesn&#39;t support the -no-pie flag, and this wasn&#39=
;t caught<br>during the configure phase. It seems that removing<br>-Wno-unu=
sed-command-line-argument would require the following change in<br>meson.bu=
ild, but I&#39;m open to better approaches.<br><br>&gt; -if not get_option(=
&#39;b_pie&#39;)<br>&gt; +if not get_option(&#39;b_pie&#39;) and host_os !=
=3D &#39;emscripten&#39;<br>&gt; =C2=A0 =C2=A0qemu_common_flags +=3D cc.get=
_supported_arguments(&#39;-fno-pie&#39;, &#39;-no-pie&#39;)<br>&gt; =C2=A0e=
ndif<br><br>&gt; &gt;&gt; +elif host_os =3D=3D &#39;emscripten&#39;<br>&gt;=
 &gt;&gt; + =C2=A0supported_backends +=3D [&#39;fiber&#39;]<br>&gt; <br>&gt=
; Can you rename the backend to &#39;wasm&#39; since the &#39;windows&#39; =
backend also<br>&gt; uses an API called Fibers?<br><br>Sure, I&#39;ll renam=
e the coroutine backend in the next version of the series.<br><br><br></div=
></div>
</div>

--000000000000f1196306326baa44--
