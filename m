Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8384898njd;
        Thu, 10 Apr 2025 06:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgHq3cAKZqiyBA0ZP5YJhutmw81c6+9C/4ahlkoDmGN9w87aDi+6V6lndqtuBEXTKUhOt70COCKh9/lw==@linaro.org
X-Received: by 2002:a17:903:240e:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22b42c5c67fmr45928485ad.49.1744290825781;
        Thu, 10 Apr 2025 06:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744290825; cv=none;
        d=google.com; s=arc-20240605;
        b=lum/4L/+e6+prDUl13CSPzY7oS7Rd4G1G+1tP4SyTvkC3pQS7UgwhtToQ9NH7iyflP
         lxrJWjO2XxiVgt0VZFAWEZXwq004xNfOzxQEAQP4tqz4AKFc9C6K0clEGN9MwSiqHDvy
         W7wnYVw98MmZHQJFbQF99JCduAA181AJtUJCrIrG+gld6njdmH6Q8ShN6GLjafRvt7Pz
         CHMd//sUZqL3sBe1ajSZ/yivrWwDsMM58QY+8WJCaZV03E1gtjbuLZjFl7wUHjxQr+qi
         OKx1BooQ4h5NS6LHWU+GUmn22foFO11UEqkuKOxs7P4gxdcQf2nwhjilbQOWEsHTsajm
         dUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=udz9qh+QGhClyiDEnhuS+4N7zuIIA+8WZldsmLxEeaI=;
        fh=lm1bUqifjWnsS6ZGYpoJBP7T04PWWNvRDStm4NdJCP0=;
        b=YX5iBM8bJvNf+4hjqnmEpUOhvscNq4uwTi8wzxXdaL8vlLKHeiMHPTk7GxxTHAG3Xv
         P3cNznsJyur21zQhpZ/hf9GfZHX8pSwgGVFe6p5M2vNb5CL1TI1kYHuBSvasejXU9Zna
         9WQrk27uwaRQFxwbT1cNGjHK4zWe5re3cq5P/O2O0Yv+l8StfDWslfc/cd/sBPDNeBX5
         DHwodQWdnNtYnZoqVfBe4YKvjdNme56jM6iQnOa3Ytx3y5p6DSorUYhmqPqaccXIqV6j
         rSfNbGdcUG1dHA+BmQrALO4MRjbhFJmSd+JvqUs8fEJheJi0QiHN5RMjVQ00uoBOM3f5
         cY0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5qW34mz;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7c511a5sor29608465ad.17.2025.04.10.06.13.45
        (Google Transport Security);
        Thu, 10 Apr 2025 06:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5qW34mz;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290825; x=1744895625; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=udz9qh+QGhClyiDEnhuS+4N7zuIIA+8WZldsmLxEeaI=;
        b=F5qW34mzBr33CXdbZxk9wVz2g1EJmnRNlhNdXEzccqUuz6VgEVa5R+TdzZn6J7/Tmi
         XtoDFtUuBx9JH87XYMy7c5etquWLdc8KmeWRF74HyDpLPWAAPZlh5dSLerv201K0b21v
         gothNGiaSjVATYxBtkH8LOL39Tie5V+uZz+QyS8bPntkV6qcSATkIfDW2NSCXQUnwPCb
         gRqaYTYDdwlYf3jWDpK+PL23P/QdfwVLNJvTK2h5ZEynjNvI0BPTriX4wX/n88WkbI1a
         bKq5uFMAJyVYhyaMlUcMoIBNkG05dkcNPlMQL/sywj1/326Joswx/YTwbW1BwNsVt+EP
         dUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290825; x=1744895625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udz9qh+QGhClyiDEnhuS+4N7zuIIA+8WZldsmLxEeaI=;
        b=ufKGNJBaXbH5WtVIHZYD7C9ArO6HgN/lKw6tgg+N6dcoSGy2uM3BNuG/AUbSNeX6G6
         07xQExw018O9RxBwdUtO7EOrqi7rlW3bscl9FqIKn7X8RC1uTw2LlzLp5L5SpX0WZsky
         nkDZupSyWLFegGknL+P+7740wCyWpLVm2Nw/8arp4MJMMb9Khj7dywrkoA667FSFBxCs
         GcEKakTJliRKSbbP7UI2/Zmr59WFZP/kc2WSl0Fq2VJ7pfuYDXNNw4EwmWm/KNW+Mjao
         nJOJmSHBVVHJETvM/h7ceod4G5rVif3H0o6poxrz5vT4YLfbFBhBOSVMgVdxiw0itDIi
         qzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL0tFdV1bjxZ3iJY1+fXSjGCcREIREg2FPC5NCo9QhaA/IPOANbVIwYebReGtC3EgbAXYPOwjXI6pAipjivQ==@linaro.org, AJvYcCVmyacO3MDUf+DIUH+XveU//6aZ5wliHIEgucwwBrfbPyO3f72agui4BamWTPM8KbDI1eVxITey2hjmSg==@linaro.org, AJvYcCXfr0mQmMCsT5y2oy8q+hnwO/sMmDfrF68wXlOWawSfpgz4lvzX6m6vYktCsXoi4/gkDKRp5ObMQ7xRjcYyHIanmQo=@linaro.org
X-Gm-Message-State: AOJu0YwIOkU5vdYWoycw6fS7aj9/DOHKZdVqqvGfRt2FTZiecr7NUTut
	MS9w5hJERZpHeL22lDeKM3VssptNjdFsimhhoNjzHEOEIM8Km60/TSaTxdJLgnp2gwgl2UEX2Wz
	ST+dhOvgWiRoCxPuI+/Lcwb+YULRCbaYFDoM=
X-Gm-Gg: ASbGncsPEvCE4/XiEMxPBqAwVqGzO3rNvsPjAeaiiYRE306JAqKhYOrXM52Q5FJ9Zgd
	gMioIVLaCG5fjc/OwEn23GivKKe78mzckCd1a38rScuAAlUvh4Q8UhHTsqEc2KGOsvnIY1axwuW
	fg2VUMkEJrMmluNAeY+QUUvfiX6zFFK6nZnm/0PWLqSb9/qRUGQto=
X-Google-Smtp-Source: AGHT+IHA5DXV1VDngm6EMg4TX+jHyOpj7gQjHaUrbxc+wjrpGkmtyh7sngf76C1H6pvUi1ovpAomVHDyO9IzGi3fAxA=
X-Received: by 2002:a17:90b:2d46:b0:305:2d27:7ca7 with SMTP id
 98e67ed59e1d1-30718b82295mr4996389a91.16.1744290825050; Thu, 10 Apr 2025
 06:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora> <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
In-Reply-To: <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 10 Apr 2025 22:13:33 +0900
X-Gm-Features: ATxdqUEjYAQl__gpGILkSOZoqRiEYNdRUH2kWwRllWKDPgsh1gGixbU0w6jXpgQ
Message-ID: <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
	qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000003211406326c5bad"
X-TUID: NvMmtSUjDYoE

--00000000000003211406326c5bad
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> On 9/4/25 21:21, Stefan Hajnoczi wrote:
> > On Mon, Apr 07, 2025 at 11:45:51PM +0900, Kohei Tokunaga wrote:
> >> This patch series enables QEMU's system emulator to run in a browser
using
> >> Emscripten.
> >> It includes implementations and workarounds to address browser
environment
> >> limitations, as shown in the following.
> >
> > I think it would be great to merge this even if there are limitations
> > once code review comments have been addressed. Developing WebAssembly
> > support in-tree is likely to allow this effort to develop further than
> > if done in personal repos (and with significant efforts required to
> > rebase the code periodically).
> >
> >> # New TCG Backend for Browsers
> >>
> >> A new TCG backend translates IR instructions into Wasm instructions
and runs
> >> them using the browser's WebAssembly APIs (WebAssembly.Module and
> >> WebAssembly.instantiate). To minimize compilation overhead and avoid
hitting
> >> the browser's limitation of the number of instances, this backend
integrates
> >> a forked TCI. TBs run on TCI by default, with frequently executed TBs
> >> compiled into WebAssembly.
> >>
> >> # Workaround for Running 64-bit Guests
> >>
> >> The current implementation uses Wasm's 32-bit memory model, even
though Wasm
> >> supports 64-bit variables and instructions. This patch explores
implementing
> >> TCG 64-bit instructions while leveraging SoftMMU for address
translation. To
> >> enable 64-bit guest support in Wasm today, it was necessary to
partially
> >> revert recent changes that removed support for different pointer widths
> >> between the host and guest (e.g., commits
> >> a70af12addd9060fdf8f3dbd42b42e3072c3914f and
> >> bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
> >> Emscripten. While this serves as a temporary workaround, a long-term
> >> solution could involve adopting Wasm's 64-bit memory model once it
gains
> >> broader support, as it is currently not widely adopted (e.g.,
unsupported by
> >> Safari and libffi). Feedback and suggestions on this approach are
welcome.
>
> The biggest problem I'm seeing is we no longer support 64-bit guests on
> 32-bit hosts, and don't plan to revert that.

Yes, so the sixth patch ("[PATCH 06/10] include/exec: Allow using 64bit
guest addresses on emscripten") should be considered as a temporary
workaround, enabled only for Emsripten builds. It will be removed once
wasm64 gains broader support and is adopted in the Wasm backend.

--00000000000003211406326c5bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,</div><br>&gt; On 9/4/25 21:2=
1, Stefan Hajnoczi wrote:<br>&gt; &gt; On Mon, Apr 07, 2025 at 11:45:51PM +=
0900, Kohei Tokunaga wrote:<br>&gt; &gt;&gt; This patch series enables QEMU=
&#39;s system emulator to run in a browser using<br>&gt; &gt;&gt; Emscripte=
n.<br>&gt; &gt;&gt; It includes implementations and workarounds to address =
browser environment<br>&gt; &gt;&gt; limitations, as shown in the following=
.<br>&gt; &gt; <br>&gt; &gt; I think it would be great to merge this even i=
f there are limitations<br>&gt; &gt; once code review comments have been ad=
dressed. Developing WebAssembly<br>&gt; &gt; support in-tree is likely to a=
llow this effort to develop further than<br>&gt; &gt; if done in personal r=
epos (and with significant efforts required to<br>&gt; &gt; rebase the code=
 periodically).<br>&gt; &gt; <br>&gt; &gt;&gt; # New TCG Backend for Browse=
rs<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; A new TCG backend translates IR instru=
ctions into Wasm instructions and runs<br>&gt; &gt;&gt; them using the brow=
ser&#39;s WebAssembly APIs (WebAssembly.Module and<br>&gt; &gt;&gt; WebAsse=
mbly.instantiate). To minimize compilation overhead and avoid hitting<br>&g=
t; &gt;&gt; the browser&#39;s limitation of the number of instances, this b=
ackend integrates<br>&gt; &gt;&gt; a forked TCI. TBs run on TCI by default,=
 with frequently executed TBs<br>&gt; &gt;&gt; compiled into WebAssembly.<b=
r>&gt; &gt;&gt;<br>&gt; &gt;&gt; # Workaround for Running 64-bit Guests<br>=
&gt; &gt;&gt;<br>&gt; &gt;&gt; The current implementation uses Wasm&#39;s 3=
2-bit memory model, even though Wasm<br>&gt; &gt;&gt; supports 64-bit varia=
bles and instructions. This patch explores implementing<br>&gt; &gt;&gt; TC=
G 64-bit instructions while leveraging SoftMMU for address translation. To<=
br>&gt; &gt;&gt; enable 64-bit guest support in Wasm today, it was necessar=
y to partially<br>&gt; &gt;&gt; revert recent changes that removed support =
for different pointer widths<br>&gt; &gt;&gt; between the host and guest (e=
.g., commits<br>&gt; &gt;&gt; a70af12addd9060fdf8f3dbd42b42e3072c3914f and<=
br>&gt; &gt;&gt; bf455ec50b6fea15b4d2493059365bf94c706273) when compiling w=
ith<br>&gt; &gt;&gt; Emscripten. While this serves as a temporary workaroun=
d, a long-term<br>&gt; &gt;&gt; solution could involve adopting Wasm&#39;s =
64-bit memory model once it gains<br>&gt; &gt;&gt; broader support, as it i=
s currently not widely adopted (e.g., unsupported by<br>&gt; &gt;&gt; Safar=
i and libffi). Feedback and suggestions on this approach are welcome.<br>&g=
t; <br>&gt; The biggest problem I&#39;m seeing is we no longer support 64-b=
it guests on<br>&gt; 32-bit hosts, and don&#39;t plan to revert that.<br><b=
r>Yes, so the sixth patch (&quot;[PATCH 06/10] include/exec: Allow using 64=
bit<br>guest addresses on emscripten&quot;) should be considered as a tempo=
rary<br>workaround, enabled only for Emsripten builds. It will be removed o=
nce<br>wasm64 gains broader support and is adopted in the Wasm backend.<br>=
<br></div>

--00000000000003211406326c5bad--
