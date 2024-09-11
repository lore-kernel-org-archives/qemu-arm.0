Received: by 2002:a05:7022:439e:b0:89:eff1:5568 with SMTP id bo30csp188491dlb;
        Wed, 11 Sep 2024 05:13:29 -0700 (PDT)
X-Received: by 2002:a05:6808:19a7:b0:3e0:4758:8ed5 with SMTP id 5614622812f47-3e047589095mr7110031b6e.10.1726056809220;
        Wed, 11 Sep 2024 05:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726056809; cv=none;
        d=google.com; s=arc-20160816;
        b=gvZeUPtV7jMdOuGVd8oVIgy9oZhK7yDmLjW8Xd2QUHGIfkDn1rM35/8N7TkS1bO+Gx
         j0y0759NGmHpmvd1auWp7Wx1J3fjRchsiwSUQKLId2xGc1TszwT4pLhxbAzKZZ5xXXv8
         vmPGngm+crpwe2Vrv2+wl0U9VFPPu4Z2wfXsuH70whOmmAoW0Br/CheczS+uYKLV2rk4
         xtzW1YAoRwcDRNCk7KR9VIsSxbjA2hWxLHg6R5K51noWUl0D/X0CIv+3sShc2hzwIrif
         VBoHlbnensa5MnWrIWOaNEqP5FUjmpcrB99WP9l9GJj8/rL6hZHFCc5kML8Zh96nIcXw
         Kzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B4zJTe1HjensxJkepgTLoCaShkon96OYhwrjOcteWeY=;
        fh=yxBwRMsmHw2JziOEKN4hctj4TlZ1NjURzFcQtZVeTAI=;
        b=HOkYAxsG0mJMfJmUk5n2zdnoyO9+cZayQBqAqdgqWC+V4kTM//hJ/+lOC710aw+2u9
         DqZpJaJzPogJJAUg5d8vr3RNcKIuSiFtBPfy1EJDMwXiLjgD1Agoxs1x/Q2ZXCQjT7Fi
         xjOdTkCAMo5zGJXF7eJUjO5hK/Y10Dg2etpjQ+x8U7yha4ik1VwC9H5bQ0FLrnKz09C1
         ee/HEAM8uVnfOpHkdHJH1kgW655szXM/BxUwGQMiQU4oyJ6AFWpImuGpOlibbcVAQJa/
         +HxBLAsZ2DEy4fjFg905Ytmhqa7AHwJJkba8FIB+tXNmitbbfrBRU1ox98+LTDHL9JpQ
         951g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TerIWFkn;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <marietto2008@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db18fc3230sor368394a12.4.2024.09.11.05.13.28
        (Google Transport Security);
        Wed, 11 Sep 2024 05:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=TerIWFkn;
       spf=pass (google.com: domain of marietto2008@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=marietto2008@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726056808; x=1726661608; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B4zJTe1HjensxJkepgTLoCaShkon96OYhwrjOcteWeY=;
        b=TerIWFkn/iSdEz2jdYbTXY8/gprpnM37I4GupNQqHd9W48dcFnfW6QoykwcqVyEQ85
         5Z3w0CiFsh6bSue1ph/csUHddPZfHJot77YxdFTN0J4GN7nhJkNaE8/VQ/0yPMTAF03C
         lj62KE6ABtUmKSQBcSvUsXlqfYdXTVxdYBF3jfpdItIL5zjNHlVgp5O6GSXPJ8MgQzFV
         mP7j1vPEOi7G9MRe9qjx+ejuxf76168w6tr4Gh+nKk/+Z4n/629k/iU3SEqqRE7O+GnP
         hk0bl/HF9cZNLhKqB6WhqwriZYg4LMaViHTVX1Syl59eGpDV7lS2li0FOR+7pqIjGSdN
         pVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056808; x=1726661608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4zJTe1HjensxJkepgTLoCaShkon96OYhwrjOcteWeY=;
        b=kawevvnxmIjbiTbW0OnWqzSpOnqI/5VzNeGqNEjki4YYUOPF3t+x5QT0F2m2ZSTX5Y
         upDkrQB76zeVzZp4dRr2QnVoJG+5C56RkQd9FVreq486z6Xm0gwAPABwCVSbd+TIYF/R
         EKCZHJpnQOCEz0KAfOBqwt3GZBasrizTMA05pExuCZD3/M5aaoZf2t8+MlJLbqkHF1ou
         vWfGSsxt4+XQ1iJmGPJwqqnwwK7AYghU24Ls29XSNYaARjLEJiBczK/lk5ngx085VzZ/
         1es1Oukhi7ymgEsPtmm2Q05WQNcgx3fRQPEDHBLYtGdNs+67kRWuSq2xZW0IsUcGkL/8
         IOCw==
X-Forwarded-Encrypted: i=1; AJvYcCW+PWiitR63ZGHgc+qq4n82+aJgdttALvqy0LTwU4qXlJsvPggfhjc3YRgQlu5x+wE2mXq+/RQ=@linaro.org
X-Gm-Message-State: AOJu0YzSa5fZFS8QNMRuuMgvqwPdRxufNbccEwsabjUro9hGVcIVe6oT
	Ta0zMbVkh4RzadBtCauXS2H2I+nVQX07KCl7GLZgQK5gDi0pZEHWM9JQ1YALj9adMPAO+o6pA/c
	pUZyN8sMDmAH5iIO9JHEdEDhdMT5reezJtRU=
X-Google-Smtp-Source: AGHT+IH0A/Jb7Ib0wPPtCOi/7KA9dojZuII7UTAR9JImr72wk5XCYNzN/1HlArKm8K6WqVdXxtQ0W4x7i2ljIfWQnN4=
X-Received: by 2002:a17:90b:380a:b0:2d8:f12f:6bed with SMTP id
 98e67ed59e1d1-2dad4efdcd7mr15871219a91.3.1726056808115; Wed, 11 Sep 2024
 05:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
 <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
 <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
 <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
 <CA+1FSih+6cHb5c9pA-79ZP1Qvd=xTTNuVZm+Q66be3NuM8gCJQ@mail.gmail.com>
 <CA+1FSiitCXFhbdWH15razOYyXp7xAY5ScmV3ZRCePqrZ_FdaNg@mail.gmail.com>
 <CA+1FSihfdrfth=+5xgmmsr_4uOEgm-hhB7i6_8mMeby4OKbC7w@mail.gmail.com> <CAFEAcA9rHJLqi7CxhNkAz+wwFmkKnmVUCHJmkp_8Vnu=OQh=Rg@mail.gmail.com>
In-Reply-To: <CAFEAcA9rHJLqi7CxhNkAz+wwFmkKnmVUCHJmkp_8Vnu=OQh=Rg@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 11 Sep 2024 14:12:51 +0200
Message-ID: <CA+1FSigUhkCz=rSPc6QLSuWWUX2Zxev5ja54+hprP+uSphOnZg@mail.gmail.com>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04
 X64 bit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: alex.bennee@linaro.org, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "cc: Sergey Kambalin" <sergey.kambalin@auriga.com>, 
	qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e8f5ee0621d6eaf4"
X-TUID: P1IsUhnWrcj3

--000000000000e8f5ee0621d6eaf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This suggests your host kernel is either too old or does not have the VGI=
C support compiled into it.
> (QEMU produces this message if it asks the host kernel "please create a v=
GICv3" and that fails and then
> it asks "please create a vGICv2" and that also fails.)


Ok, it seems that the emulator should be launched using this command :

/opt/android-sdk/emulator/emulator @MyAVD -cores 4 -lowram -memory
2048 -gpu swiftshader_indirect -ports 5554,5555 -skip-adb-auth
-no-boot-anim -no-snapshot -no-metrics -qemu -machine gic-version=3D2

or

/opt/android-sdk/emulator/emulator @MyAVD -cores 4 -lowram -memory
2048 -gpu host -ports 5554,5555 -skip-adb-auth -no-boot-anim
-no-snapshot -no-metrics -qemu -machine gic-version=3D2

Regarding Cuttlefish,maybe the error that I get can be solved in the
same way,declaring -qemu -machine gic-version=3D2...

The tutorial says to use :

HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
-report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse

So maybe it should be something like this ?

HOME=3D$(pwd) ./bin/launch_cvd -vm_manager qemu_cli
-report_anonymous_usage_stats=3Dn --start_webrtc=3Dfalse -cores 4 -lowram
-memory 2048 -gpu host -ports 5554,5555 -skip-adb-auth -no-boot-anim
-no-snapshot -no-metrics -qemu -machine gic-version=3D2

or similar...


On Wed, Sep 11, 2024 at 12:19=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org>
wrote:

> On Wed, 11 Sept 2024 at 01:02, Mario Marietto <marietto2008@gmail.com>
> wrote:
> >
> > Hello to everyone.
>
> (Please trim your quoted text and don't top-post: it makes emails
> a pain to read.)
>
> > qemu-system-aarch64-headless: Unable to determine GIC version supported
> by host
>
> This suggests your host kernel is either too old or does not have the
> VGIC support compiled into it. (QEMU produces this message if it
> asks the host kernel "please create a vGICv3" and that fails and
> then it asks "please create a vGICv2" and that also fails.)
>
> -- PMM
>


--=20
Mario.

--000000000000e8f5ee0621d6eaf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre>&gt; This suggests your host kernel is either too old=
 or does not have the VGIC support compiled into it. <br>&gt; (QEMU produce=
s this message if it asks the host kernel &quot;please create a vGICv3&quot=
; and that fails and then <br>&gt; it asks &quot;please create a vGICv2&quo=
t; and that also fails.)<br><br><br>Ok, it seems that the emulator should b=
e launched using this command :<br><br>/opt/android-sdk/emulator/emulator @=
MyAVD -cores 4 -lowram -memory 2048 -gpu swiftshader_indirect -ports 5554,5=
555 -skip-adb-auth -no-boot-anim -no-snapshot -no-metrics -qemu -machine gi=
c-version=3D2<br><br></pre><pre>or <br><br>/opt/android-sdk/emulator/emulat=
or @MyAVD -cores 4 -lowram -memory 2048 -gpu host -ports 5554,5555 -skip-ad=
b-auth -no-boot-anim -no-snapshot -no-metrics -qemu -machine gic-version=3D=
2<br><br></pre><pre>Regarding Cuttlefish,maybe the error that I get can be =
solved in the same way,declaring -qemu -machine gic-version=3D2...<br><br><=
code class=3D"gmail-hljs gmail-language-swift"><span class=3D"gmail-hljs-re=
gexp">The tutorial says to use :<br><br></span><span class=3D"gmail-hljs-re=
gexp">HOME=3D$(pwd) ./</span>bin<span class=3D"gmail-hljs-operator">/</span=
>launch_cvd <span class=3D"gmail-hljs-operator">-</span>vm_manager qemu_cli=
 <span class=3D"gmail-hljs-operator">-</span>report_anonymous_usage_stats<s=
pan class=3D"gmail-hljs-operator">=3D</span>n <span class=3D"gmail-hljs-ope=
rator">--</span>start_webrtc<span class=3D"gmail-hljs-operator">=3D</span><=
span class=3D"gmail-hljs-literal">false</span></code><br><br></pre><pre>So =
maybe it should be something like this ?<br><br><code class=3D"gmail-hljs g=
mail-language-swift"><span class=3D"gmail-hljs-regexp">HOME=3D$(pwd) ./</sp=
an>bin<span class=3D"gmail-hljs-operator">/</span>launch_cvd </code><code c=
lass=3D"gmail-hljs gmail-language-swift"><span class=3D"gmail-hljs-operator=
">-</span>vm_manager qemu_cli <span class=3D"gmail-hljs-operator">-</span>r=
eport_anonymous_usage_stats<span class=3D"gmail-hljs-operator">=3D</span>n =
<span class=3D"gmail-hljs-operator">--</span>start_webrtc<span class=3D"gma=
il-hljs-operator">=3D</span><span class=3D"gmail-hljs-literal">false </span=
></code>-cores 4 -lowram -memory 2048 -gpu host -ports 5554,5555 -skip-adb-=
auth -no-boot-anim -no-snapshot -no-metrics -qemu -machine gic-version=3D2<=
br><br></pre><pre>or similar...<br></pre></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2024 at 12:19=E2=
=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 11 Sept 2024 at 01:02, Mario =
Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank">ma=
rietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello to everyone.<br>
<br>
(Please trim your quoted text and don&#39;t top-post: it makes emails<br>
a pain to read.)<br>
<br>
&gt; qemu-system-aarch64-headless: Unable to determine GIC version supporte=
d by host<br>
<br>
This suggests your host kernel is either too old or does not have the<br>
VGIC support compiled into it. (QEMU produces this message if it<br>
asks the host kernel &quot;please create a vGICv3&quot; and that fails and<=
br>
then it asks &quot;please create a vGICv2&quot; and that also fails.)<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000e8f5ee0621d6eaf4--
