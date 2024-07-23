Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2297439njc;
        Mon, 22 Jul 2024 22:02:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSoEQH8bx2AXxtgCsWO6ueo2hIx3kAasIJ8ltPSt20jlZTDjDlvIL+eWfSe5GJVpGgaJgvHjTEFQQwnGdHmgfxyVCk/kmV
X-Google-Smtp-Source: AGHT+IHpwdX6UY2qCirxQGbkwz9YzNhGWWpCfQdshwf/KIIq+V4zUNwl7L7HFJQz64mWRG85OD7T
X-Received: by 2002:ad4:5aee:0:b0:6b5:1976:98ac with SMTP id 6a1803df08f44-6b95a6dfc98mr129093566d6.28.1721710933493;
        Mon, 22 Jul 2024 22:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721710933; cv=none;
        d=google.com; s=arc-20160816;
        b=XlJxDSKUiuObSpef/q/JYh+rO4uF6HFVnPhVEwhvWtYtDyFJUtwoCih+mTN4XX1SVR
         FENVkq82NqczNoYz3PvpHV1O6CXsGMMxLYLa/933W+0h966tpuXYcRBO+t4Z5rrEHsNi
         Abw+t3bQUqFbfOcAOh+Q+mlOtc0ndR+4xxz/YLz8NRY6L1U4Gl8oLaDVKui3ZNlTtECN
         ib6vMPpILBIvNZUynqE3bAR5+3idmSWFVCKSE4muqImQGRRAQBHQX1OfrztmuIZ9uYei
         QPJa7ciVB+d9UUzikPcsOFPH5maXTh7Am8GZfyuGqd3J/gMRQWkmMr25GTz1rlEsLFm9
         rABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qz/OcFwqVgU0/Dz3ngh1jGLeo5eueOn8viJ12CZYnIY=;
        fh=dkOgu64m314pDAVGLEfjPnTbWDVYioZhIzDLFgWivN0=;
        b=dZ4AmMK6OrGp3PSJ8ZM7K+o2Bb1KutC7Ao6yIA9NZoZ6UKRvZ+i2trEiXOathWUMJz
         YOsJO0pAKBUg4kVKC6LGNzTd3+G+G6z3wZkD/0+AtajbpzhyKS12kTcn0ptElR0QoUj2
         1eUQ7bW4VMSLpYCR/UrkQGZMR2NsPgUxrqBfE0FJ7QeNYpAkKgEHsKA9KFqvc9NFuoXj
         quFz4ZrxqYsiKLDoK5r0urfkceXROHzda1lraXj/zXm7hjQNYBiEK4Wu60WE7mPTP/E3
         BcwmVCQOpGnmfdJ9YybLyeZjczs7ldLV1oK+Ggj/v8PWV8qennv2p/XkJX1VPlJfRHUz
         6BHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=C6yQjnmd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdd34d2si94059271cf.394.2024.07.22.22.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 22:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=C6yQjnmd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW7ev-0004Fn-2i; Tue, 23 Jul 2024 01:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW7et-0004E4-Ex
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 01:01:55 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW7er-00069h-0a
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 01:01:55 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-79b530ba612so2683327a12.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 22:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721710911; x=1722315711;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qz/OcFwqVgU0/Dz3ngh1jGLeo5eueOn8viJ12CZYnIY=;
 b=C6yQjnmdgF0EXTuiCygSF9jmAT/AoXBZxQVvkHrlzkjy+J7E1bP7lzqKDqW3YFYY70
 1VxqEz7RKCOhvUaSkmnHo9Bm6wFKfoseDS4YgsGawtD/Cz+XBxTXLmADZO+Hn47ychOQ
 ECroqjM40/97sci3zVULV26pBuWujmbPhe7sguv7l+/CPnyeeBYkXnoECAehGEuh94u2
 m8Cs64uG6u98IOAZj+O7SJYV51G62bJLkGbGEWMC1xYKm3naLLXnP1DcltCB0POeWs6Y
 Uscu+hSRTcEAUhgnUQsI0UutqDQjZG46E/oYLiyfx+bZEGiOskYHJ9xp+TYNjikcJbGE
 3JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721710911; x=1722315711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qz/OcFwqVgU0/Dz3ngh1jGLeo5eueOn8viJ12CZYnIY=;
 b=OqcHjNd9lOzH4aThxiGs7/esdmjFSxxGlJF2vYeK+YNOq2qEWGWouv0cmmDfVtleI5
 lRpZkmQpDd9FqMfiUFoeMVIC+d6tyOh0iB/B6vyXbPFpLg1VgA43JTwCCzejpdCXoIrV
 b9aacT4CaNEAsH0+4Uta/CCS+FSPd8A6JseM2W0IXkOEejSm5xHxUz3nEWrK4vV/3qoW
 CImOzPZ2QXHAxU45Ml40Shh8tb6M+ChVhvEoGaytZgCcArNztNCvUnAJGuNwZXfg8+H6
 4nDUQaDnWST+bwX2OrVvj3q0qhJSfw2AChi4qmb2jjUd3XsZIQyVwaRaBCkDakMD5e0v
 H+2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoSFpv/8Rd2zetAo4Y0akAq1k6/z9ODruzeSxca+6f/KxQph/couaYIofqDHhfnmbzuIq+cme1XR+xr3d/klt/9DKM
X-Gm-Message-State: AOJu0YxxdU5cQ8LRXOOkb4EwceePapXb7puoLsMT4PTM8rwPnrKlEzgY
 ccP0NsbhIgMt2d8nwYUjOf1cL+VAfCsqWFsHdDGS2nm4IobX6B+wfnYJgzlVZsJPDTnVUHTWzJe
 OrPZTrEb5ii3qEYquaRb+DBd/9dPl43NiTVAlNQ==
X-Received: by 2002:a05:6a21:99a5:b0:1c0:f2d9:a44a with SMTP id
 adf61e73a8af0-1c4228d03e6mr9885508637.22.1721710910744; Mon, 22 Jul 2024
 22:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-11-imp@bsdimp.com>
 <11297acc-de3d-4e74-9e1c-5f08ed219269@linaro.org>
In-Reply-To: <11297acc-de3d-4e74-9e1c-5f08ed219269@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Jul 2024 23:01:39 -0600
Message-ID: <CANCZdfptOuaNavrM-rYgqOhgwATeY7vaNUrAMCEgm9ySFQP3wA@mail.gmail.com>
Subject: Re: [PATCH 10/14] bsd-user: Hard wire aarch64 to be 4k pages only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003dc494061de30f5d"
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=wlosh@bsdimp.com; helo=mail-pg1-x535.google.com
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
X-TUID: foPnqapiWMg5

--0000000000003dc494061de30f5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 7:10=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/23/24 07:43, Warner Losh wrote:
> > Only support 4k pages for aarch64 binaries. The variable page size stuf=
f
> > isn't working just yet, so put in this lessor-of-evils kludge until tha=
t
> > is complete.
>
> Hmm.  In what way is it not working?
>
> What if we limit this to bsd-user/main.c instead?
>
>    set_preferred_target_page_bits(TARGET_PAGE_BITS_MIN);
>

It's a compile issue that this won't solve:
In file included from ../bsd-user/aarch64/signal.c:21:
../bsd-user/qemu.h:146:20: warning: variable length array used [-Wvla]
  146 |         void *page[MAX_ARG_PAGES];
      |                    ^~~~~~~~~~~~~
../bsd-user/qemu.h:138:23: note: expanded from macro 'MAX_ARG_PAGES'
  138 | #define MAX_ARG_PAGES (TARGET_ARG_MAX / TARGET_PAGE_SIZE)
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../bsd-user/qemu.h:146:20: note: initializer of 'target_page' is unknown
../bsd-user/qemu.h:138:41: note: expanded from macro 'MAX_ARG_PAGES'
  138 | #define MAX_ARG_PAGES (TARGET_ARG_MAX / TARGET_PAGE_SIZE)
      |                                         ^
/dune/imp/git/qemu/include/exec/cpu-all.h:152:37: note: expanded from macro
'TARGET_PAGE_SIZE'
  152 | # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
      |                                     ^
/dune/imp/git/qemu/include/exec/cpu-all.h:150:44: note: expanded from macro
'TARGET_PAGE_MASK'
  150 | #  define TARGET_PAGE_MASK   ((target_long)target_page.mask)
      |                                            ^
/dune/imp/git/qemu/include/exec/cpu-all.h:142:29: note: declared here
  142 | extern const TargetPageBits target_page;
      |                             ^
In file included from ../bsd-user/aarch64/signal.c:21:
../bsd-user/qemu.h:146:15: error: fields must have a constant size:
'variable length array in structure' extension will never be supported
  146 |         void *page[MAX_ARG_PAGES];
      |               ^
1 warning and 1 error generated.
ninja: build stopped: subcommand failed.
gmake: *** [Makefile:167: run-ninja] Error 1

that have a couple of additional levels after those issues are fixed...
It's fixable, but will take a fair amount more time that I have before the
deadline...

Warner

--0000000000003dc494061de30f5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 7:10=E2=80=AF=
PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 7/23/24 07:43, Warner Losh wrote:<br>
&gt; Only support 4k pages for aarch64 binaries. The variable page size stu=
ff<br>
&gt; isn&#39;t working just yet, so put in this lessor-of-evils kludge unti=
l that<br>
&gt; is complete.<br>
<br>
Hmm.=C2=A0 In what way is it not working?<br>
<br>
What if we limit this to bsd-user/main.c instead?<br>
<br>
=C2=A0 =C2=A0set_preferred_target_page_bits(TARGET_PAGE_BITS_MIN);<br></blo=
ckquote><div><br></div><div>It&#39;s a compile issue that this won&#39;t so=
lve:</div><div>In file included from ../bsd-user/aarch64/signal.c:21:<br>..=
/bsd-user/qemu.h:146:20: warning: variable length array used [-Wvla]<br>=C2=
=A0 146 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *page[MAX_ARG_PAGES];<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~<br>../bsd-user/qemu.h:138:23: note: expanded from m=
acro &#39;MAX_ARG_PAGES&#39;<br>=C2=A0 138 | #define MAX_ARG_PAGES (TARGET_=
ARG_MAX / TARGET_PAGE_SIZE)<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~<br>../bsd-user/qemu.h:146:20: note: initializer of &#39;ta=
rget_page&#39; is unknown<br>../bsd-user/qemu.h:138:41: note: expanded from=
 macro &#39;MAX_ARG_PAGES&#39;<br>=C2=A0 138 | #define MAX_ARG_PAGES (TARGE=
T_ARG_MAX / TARGET_PAGE_SIZE)<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>/dune/imp/git/qemu/in=
clude/exec/cpu-all.h:152:37: note: expanded from macro &#39;TARGET_PAGE_SIZ=
E&#39;<br>=C2=A0 152 | # define TARGET_PAGE_SIZE =C2=A0 =C2=A0(-(int)TARGET=
_PAGE_MASK)<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^<br>/dune/imp/git/qemu/include/exec/cpu-all.h:150:44: no=
te: expanded from macro &#39;TARGET_PAGE_MASK&#39;<br>=C2=A0 150 | # =C2=A0=
define TARGET_PAGE_MASK =C2=A0 ((target_long)target_page.mask)<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^<br>/dune/imp/git/qemu/include/exec/cpu-all.h:142:29: =
note: declared here<br>=C2=A0 142 | extern const TargetPageBits target_page=
;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>In file included =
from ../bsd-user/aarch64/signal.c:21:<br>../bsd-user/qemu.h:146:15: error: =
fields must have a constant size: &#39;variable length array in structure&#=
39; extension will never be supported<br>=C2=A0 146 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 void *page[MAX_ARG_PAGES];<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>1 warning and 1 error generated.<br=
>ninja: build stopped: subcommand failed.<br>gmake: *** [Makefile:167: run-=
ninja] Error 1<br></div><div><br></div><div>that have a couple of additiona=
l levels after those issues are fixed... It&#39;s fixable, but will take a =
fair amount more time that I have before the deadline...<br></div><div><br>=
</div><div>Warner<br></div></div></div>

--0000000000003dc494061de30f5d--
