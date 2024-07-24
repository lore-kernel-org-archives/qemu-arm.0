Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3319490njc;
        Wed, 24 Jul 2024 13:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE6UnP7mQ8XPIy4DzMXyHwnk6t7FuzjDVHxsc1RU2WoRhv0+8AAUVX9WpNpfU+HWifpvizV9awz49uW5v+KNHse7LRhUM9
X-Google-Smtp-Source: AGHT+IF9n6PYwsbQem0jIqmj8gmr12Zed4NdrS/asFXvZXDpTlkBtIgy8fqx8k9t0FbbsIf/3nOZ
X-Received: by 2002:a05:6358:418f:b0:1a6:7e01:e4f4 with SMTP id e5c5f4694b2df-1acf8ae2503mr127142055d.28.1721852765426;
        Wed, 24 Jul 2024 13:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721852765; cv=none;
        d=google.com; s=arc-20160816;
        b=bx1pUZ9KrXqbFrP4InlL1hHux50fWmWl1CsYpWSNUIzfN11QYwOUQRrMJ8cRxioqu9
         nSjffmz15EcJWnm38uKcVNZEOO4D2r8eStaPUqP9IDhRT0HcONhgcZqSiiE8TlBtDmPb
         JJe/8DD2ncrHeEI5SjBO0XhEu3aPQieurvF1cSzAnr/GSPUIVeL1sHzfxbhq16nYQhgZ
         WG+HWoontvhMyJGDzkDg48Dp0tI1XcNJUFYGmJ/uXUZgpKn8FJSOctymrS9haU7U2E77
         jZYsYF/GgWCZW0YpkmOZA0yTEFQx+sF/L0yctlXL4wsSWgYn79GmiV0AViJZKnX9B2ez
         kysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=s4YPCnDOIa8NUGfAr2gZ4GzcVNlDcSYa3Xe5483kA78=;
        fh=AX0dIIDzbS035WxcCMncLEmP98v13vE5lA1ux9WwhIs=;
        b=PJay6DmakGS017yoWNaEA3LDz4NgKplGRR1nDl30Px3sI69ys+U7YpZSrVwrIbFb0s
         6V0PXQXpI8YFtteMmOrbMgCuJAQC8A54xoQfbII5C0KVl9YqtEt+fv3QcB1iFpRYNZD3
         Az8aAJrUfvid7O9+HT2ukkjcBV5+HJKC/EM1TBeBkJpH5ByXXI5EcAJ66EaXR8m4J2Ie
         gpLSnxIEoV782fg0RFZjDHs4yF4hipic+uRHkdYlmjxlIGj5KsSMG9Ju8RRwA34WQ5SY
         Nj4J2gQCHpq1tnldyFWihwRR7rrnbK2zb8KvBo296QyEshEHIvQQOVdrNe+sfvO060d0
         NZxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="B/2+a1i3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19904aabfsi1330589085a.325.2024.07.24.13.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 13:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b="B/2+a1i3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWiYN-0003fT-LM; Wed, 24 Jul 2024 16:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sWiYK-0003bd-Aq
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 16:25:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sWiYF-0001Dv-Ll
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 16:25:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2cd2f89825fso172530a91.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721852729; x=1722457529;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s4YPCnDOIa8NUGfAr2gZ4GzcVNlDcSYa3Xe5483kA78=;
 b=B/2+a1i3re1v4t/0FYrDcWobeIwyA4wU2B7I/dLjSAYtcgCK6topOJbUJeWoiBqTlR
 iY/yrPlHPichTa9BJQw/XRJ7l/VRpbNaiDXc+yT5v1SkXFgbKnj9PXOsUTS7NLIy5JHo
 gO0MmQ/+4A8HA2xbHbxQ6wdi9hcRohOJ7i2ls2U5xouH4YtbDxiflEwdJIhfxYvriV70
 HSjFKd4T17EoOW2M6O2Z6tIAkLjm4/W4BC4r2SbYneDSHsdRD+6zF8q20QxlTAVLq192
 32yXJlgnKmy0kqfflUpbFoaFUhfv5co0PJpycUZFBmlo/Gv4sihb6jNSFoqq0zlNVIge
 3jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721852729; x=1722457529;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4YPCnDOIa8NUGfAr2gZ4GzcVNlDcSYa3Xe5483kA78=;
 b=q/GGic2hcSVcW/CFkuFfS9adiIP1L6qbPCp8szzRFOTsyCkTOO2XZt8erUfVfNg13E
 SaxQGinYqRKqG57xq2d8noBseGOkElvGlGJV1aGlyC5u6kwdNqUZsFLK/H4k4plb/W9P
 zBmnD/lPUtekFOn4xBPYnPgl0VuGg3+aQ/LuEIyap7Rh8uc0WbANHohBUXw+InjdjpDh
 ogPq7+eBy1h4GaPoz5qqZD4tfvYnP1UiZdwReNMIJAXG+Mu+ZENL0+ZF4TTSQKANtMVF
 E4gCCuzY1i+74xkLwRz6MrOtOs1nDI93btdSdeiZDTpuzPdn7MrVPH8pT+QWj88b2w0k
 /B9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSJt+nIpz57kzS7SjKGFEFvFuMXoAZVCjykbejSGh/fE/5WFATSz2Nfk9QUoEQF2HrbvwrWpAyyyqUuH2OL55Uq0Mt
X-Gm-Message-State: AOJu0Yz1HSWXbfeQ0iPO6iB5MIcpBroPGoOVB39XediGmpwOSOCoIvle
 7KR6cayN4Kv8wYiUMRO8Put8jJUuJLHMGuFSoHSZ6/BJBlGZpNmV8Td5DgZIy4KfgshHuGwvXVz
 hUyHX0JXYcK4HjQDpuRBEVmNQgZmbN/zz8cWLwQ==
X-Received: by 2002:a17:90a:8407:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2cf238fab75mr704541a91.34.1721852728871; Wed, 24 Jul 2024
 13:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240723180725.99114-1-imp@bsdimp.com>
 <d76f7003-e36e-4b9f-a7db-7e8e962b446d@linaro.org>
In-Reply-To: <d76f7003-e36e-4b9f-a7db-7e8e962b446d@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 24 Jul 2024 14:25:17 -0600
Message-ID: <CANCZdfpx=tvtpXkV0AMc7+d2cOPC7c5RDvWJZuWW1cJq+VBjrA@mail.gmail.com>
Subject: Re: [PULL 00/14] Bsd user for 9.1 patches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000042ac9e061e04142e"
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=wlosh@bsdimp.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ATIzErFLN1oG

--00000000000042ac9e061e04142e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 2:55=E2=80=AFAM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/24/24 04:07, Warner Losh wrote:
> > The following changes since commit
> 3cce8bd4d737f2ca688bbdcb92cd5cc683245bbd:
> >
> >    Merge tag 'ui-pull-request' ofhttps://
> gitlab.com/marcandre.lureau/qemu into staging (2024-07-23 15:23:05 +1000)
> >
> > are available in the Git repository at:
> >
> >    git@gitlab.com:bsdimp/qemu.git tags/bsd-user-for-9.1-pull-request
> >
> > for you to fetch changes up to afdb6be1bd8528395af65a087bd668bf7a42ab99=
:
> >
> >    bsd-user: Add aarch64 build to tree (2024-07-23 10:56:30 -0600)
> >
> > ----------------------------------------------------------------
> > bsd-user: Misc changes for 9.1 (I hope)
> >
> > This patch series includes two main sets of patches. To make it simple =
to
> > review, I've included the changes from my student which the later
> changes depend
> > on. I've included a change from Jessica and Doug as well. I've reviewed
> them,
> > but more eyes never hurt.
> >
> > I've also included a number of 'touch up' patches needed either to get
> the
> > aarch64 building, or to implmement suggestions from prior review cycles=
.
> The
> > main one is what's charitably described as a kludge: force aarch64 to
> use 4k
> > pages. The qemu-project (and blitz branch) hasn't had the necessary
> changes to
> > bsd-user needed to support variable page size.
> >
> > Sorry this is so late... Live has conspired to delay me.
>
> Something didn't get committed properly, as it doesn't build:
>
> $ ninja
> [343/1144] Compiling C object
> libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o
> FAILED: libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o
> cc -m64 -Ilibqemu-aarch64-bsd-user.a.p -I. -I../src -Itarget/arm
> -I../src/target/arm
> -I../src/common-user/host/x86_64 -I../src/bsd-user/include
> -Ibsd-user/freebsd
> -I../src/bsd-user/freebsd -I../src/bsd-user/host/x86_64 -Ibsd-user
> -I../src/bsd-user
> -I../src/bsd-user/aarch64 -Iqapi -Itrace -Iui/shader
> -I/usr/local/include/capstone
> -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include
> -I/usr/local/include
> -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g
> -fstack-protector-strong
> -Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-security
> -Wformat-y2k
> -Wignored-qualifiers -Winit-self -Wmissing-format-attribute
> -Wmissing-prototypes
> -Wnested-externs -Wold-style-definition -Wredundant-decls
> -Wstrict-prototypes
> -Wtype-limits -Wundef -Wvla -Wwrite-strings
> -Wno-gnu-variable-sized-type-not-at-end
> -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-psabi
> -Wno-shift-negative-value
> -Wno-string-plus-int -Wno-tautological-type-limit-compare
> -Wno-typedef-redefinition
> -Wthread-safety -iquote . -iquote /home/rth/qemu/src -iquote
> /home/rth/qemu/src/include
> -iquote /home/rth/qemu/src/host/include/x86_64 -iquote
> /home/rth/qemu/src/host/include/generic -iquote
> /home/rth/qemu/src/tcg/i386 -pthread
> -msse2 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE
> -fno-strict-aliasing -fno-common -fwrapv -ftrivial-auto-var-init=3Dzero
> -fzero-call-used-regs=3Dused-gpr -fPIE -DCOMPILING_PER_TARGET
> '-DCONFIG_TARGET=3D"aarch64-bsd-user-config-target.h"'
> '-DCONFIG_DEVICES=3D"aarch64-bsd-user-config-devices.h"' -MD -MQ
> libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -MF
> libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o.d -o
> libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -c
> ../src/bsd-user/aarch64/target_arch_cpu.c
> In file included from ../src/bsd-user/aarch64/target_arch_cpu.c:20:
> In file included from ../src/bsd-user/aarch64/target_arch.h:23:
> ../src/bsd-user/qemu.h:38:10: fatal error: 'target.h' file not found
>     38 | #include "target.h"
>        |          ^~~~~~~~~~
> 1 error generated.
>

Doh! A missing git add indeed. That change didn't cherry-pick from blitz
(since
it was something I'd invented for an upstream review that didn't fold back
into
blitz properly and I didn't notice until I started prepping this series and
fixed it
in blitz)... I goofed up doing it by hand. Will send v2 out shortly.  Sorry
for the noise.

Warner

--00000000000042ac9e061e04142e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 24, 2024 at 2:55=E2=80=AF=
AM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 7/24/24 04:07, Warner Losh wrote:<br>
&gt; The following changes since commit 3cce8bd4d737f2ca688bbdcb92cd5cc6832=
45bbd:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Merge tag &#39;ui-pull-request&#39; ofhttps://<a href=3D"=
http://gitlab.com/marcandre.lureau/qemu" rel=3D"noreferrer" target=3D"_blan=
k">gitlab.com/marcandre.lureau/qemu</a> into staging (2024-07-23 15:23:05 +=
1000)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 git@gitlab.com:bsdimp/qemu.git tags/bsd-user-for-9.1-pull=
-request<br>
&gt; <br>
&gt; for you to fetch changes up to afdb6be1bd8528395af65a087bd668bf7a42ab9=
9:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 bsd-user: Add aarch64 build to tree (2024-07-23 10:56:30 =
-0600)<br>
&gt; <br>
&gt; ----------------------------------------------------------------<br>
&gt; bsd-user: Misc changes for 9.1 (I hope)<br>
&gt; <br>
&gt; This patch series includes two main sets of patches. To make it simple=
 to<br>
&gt; review, I&#39;ve included the changes from my student which the later =
changes depend<br>
&gt; on. I&#39;ve included a change from Jessica and Doug as well. I&#39;ve=
 reviewed them,<br>
&gt; but more eyes never hurt.<br>
&gt; <br>
&gt; I&#39;ve also included a number of &#39;touch up&#39; patches needed e=
ither to get the<br>
&gt; aarch64 building, or to implmement suggestions from prior review cycle=
s. The<br>
&gt; main one is what&#39;s charitably described as a kludge: force aarch64=
 to use 4k<br>
&gt; pages. The qemu-project (and blitz branch) hasn&#39;t had the necessar=
y changes to<br>
&gt; bsd-user needed to support variable page size.<br>
&gt; <br>
&gt; Sorry this is so late... Live has conspired to delay me.<br>
<br>
Something didn&#39;t get committed properly, as it doesn&#39;t build:<br>
<br>
$ ninja<br>
[343/1144] Compiling C object <br>
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o<br>
FAILED: libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o<b=
r>
cc -m64 -Ilibqemu-aarch64-bsd-user.a.p -I. -I../src -Itarget/arm -I../src/t=
arget/arm <br>
-I../src/common-user/host/x86_64 -I../src/bsd-user/include -Ibsd-user/freeb=
sd <br>
-I../src/bsd-user/freebsd -I../src/bsd-user/host/x86_64 -Ibsd-user -I../src=
/bsd-user <br>
-I../src/bsd-user/aarch64 -Iqapi -Itrace -Iui/shader -I/usr/local/include/c=
apstone <br>
-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include -I/usr/loca=
l/include <br>
-fdiagnostics-color=3Dauto -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g -fstack-=
protector-strong <br>
-Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-security -Wform=
at-y2k <br>
-Wignored-qualifiers -Winit-self -Wmissing-format-attribute -Wmissing-proto=
types <br>
-Wnested-externs -Wold-style-definition -Wredundant-decls -Wstrict-prototyp=
es <br>
-Wtype-limits -Wundef -Wvla -Wwrite-strings -Wno-gnu-variable-sized-type-no=
t-at-end <br>
-Wno-initializer-overrides -Wno-missing-include-dirs -Wno-psabi -Wno-shift-=
negative-value <br>
-Wno-string-plus-int -Wno-tautological-type-limit-compare -Wno-typedef-rede=
finition <br>
-Wthread-safety -iquote . -iquote /home/rth/qemu/src -iquote /home/rth/qemu=
/src/include <br>
-iquote /home/rth/qemu/src/host/include/x86_64 -iquote <br>
/home/rth/qemu/src/host/include/generic -iquote /home/rth/qemu/src/tcg/i386=
 -pthread <br>
-msse2 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE <b=
r>
-fno-strict-aliasing -fno-common -fwrapv -ftrivial-auto-var-init=3Dzero <br=
>
-fzero-call-used-regs=3Dused-gpr -fPIE -DCOMPILING_PER_TARGET <br>
&#39;-DCONFIG_TARGET=3D&quot;aarch64-bsd-user-config-target.h&quot;&#39; <b=
r>
&#39;-DCONFIG_DEVICES=3D&quot;aarch64-bsd-user-config-devices.h&quot;&#39; =
-MD -MQ <br>
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -MF <br>
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o.d -o <br>
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -c <br>
../src/bsd-user/aarch64/target_arch_cpu.c<br>
In file included from ../src/bsd-user/aarch64/target_arch_cpu.c:20:<br>
In file included from ../src/bsd-user/aarch64/target_arch.h:23:<br>
../src/bsd-user/qemu.h:38:10: fatal error: &#39;target.h&#39; file not foun=
d<br>
=C2=A0 =C2=A0 38 | #include &quot;target.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<b=
r>
1 error generated.<br></blockquote><div><br></div><div>Doh! A missing git a=
dd indeed. That change didn&#39;t cherry-pick from blitz (since</div><div>i=
t was something I&#39;d invented for an upstream review that didn&#39;t fol=
d back into</div><div>blitz properly and I didn&#39;t notice until I starte=
d prepping this series and fixed it</div><div>in blitz)... I goofed up doin=
g it by hand. Will send v2 out shortly.=C2=A0 Sorry for the noise.</div><di=
v><br></div><div>Warner</div></div></div>

--00000000000042ac9e061e04142e--
