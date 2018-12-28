Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7916382wrt;
        Fri, 28 Dec 2018 04:33:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6G1zHKo90KPGCcObPt4U7qQdXM+lgVd3IGxY3f6hnX/OgIKJ5myi4Np5QuSJlLJKNENhTX
X-Received: by 2002:a37:4bd7:: with SMTP id y206mr25256102qka.167.1546000435113;
        Fri, 28 Dec 2018 04:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546000435; cv=none;
        d=google.com; s=arc-20160816;
        b=SaO60PxUUusb6DlchD/HSo3AAGwIUiBIHTCwiR3UO+9phybxvYGydQoGwyaK34fCqN
         +y6ifcL/hwJiMOmGd4Ugb2Yg/FTA+aifoNit1NpG9BWmt5y2e6f6JIYDcA8VsF2MckPQ
         tLfLmTthT22VRw5YSGWm7o4eJ9QAdLBPKCgc3r90p8WFE2poxXjzbFdCDrwFe+vST70K
         g4na5NX2VTSpt4XQQYMthuRVlEvE0buz158RN8fODvxuGWg5sSVEtc3sZ0mcXPb57IF8
         5avghF7By8LtEBQHCR0VDnypESIPvIzVrL2s5synxCA7dS9pdO59bw4JDHmmfNpHbwgd
         Xb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FtjizvtZxaU9xSOjLmIAb0at+bcXzP23G3Am7svSVUU=;
        b=JuLW9uaBnKB34haIsxZkDEPw2IEeJytFaGKunjryBy+lSE2JRX5srzA4LXuf0Ctbpc
         GQ89E4fkmYV6TbkUBhuW6rIDcoxBJbIYQ2NhRw8922s/xwv/syMzbaSInTbkE3A9Aacr
         /aG58C7hQF4iOTjATe5dcGYX358cKTGPlnoZ4H7UAaJq8TLq6HKcxQxn2SvI6Z69nzLa
         CMvLdGfsHIB8oZBJ7t1PW7fWbuxCU0QkxnEMiP0XcZbaczRTKOL5y/QYDpIrI1TsJ9c5
         YvewQeYf1gRP4rxc4OGXuNhW56hr6mkZJi6gmSDurb9NKf7r7rn2Hxw652JTFhGmkCo8
         gpwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MW4Qfnkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z3si1350975qtj.337.2018.12.28.04.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Dec 2018 04:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MW4Qfnkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gcrKs-0005QS-L8
	for alex.bennee@linaro.org; Fri, 28 Dec 2018 07:33:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gcrKl-0005Hg-Gy
	for qemu-arm@nongnu.org; Fri, 28 Dec 2018 07:33:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gcr9h-0000PB-1O
	for qemu-arm@nongnu.org; Fri, 28 Dec 2018 07:22:23 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:43003)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stast.3vium@gmail.com>)
	id 1gcr9f-0000Oa-AS
	for qemu-arm@nongnu.org; Fri, 28 Dec 2018 07:22:20 -0500
Received: by mail-ot1-x331.google.com with SMTP id v23so18527225otk.9
	for <qemu-arm@nongnu.org>; Fri, 28 Dec 2018 04:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=FtjizvtZxaU9xSOjLmIAb0at+bcXzP23G3Am7svSVUU=;
	b=MW4Qfnkd4FTMyzx1CHGqYaGN08bLIdscYy+nEByYwaKhZ3oenRL6Ix4XGA3gHpvUIZ
	h/YdJRIw3lIVoYefvp0mxSBz5nBxArWUJBXC/azepChJVbltXqL0wKxsCILCSwQARr9t
	rQo0YVaM24tP5XU4hk1NX2VSaLLfSozPsrRgDvn3rHNKJWc9U/EHzLC+/3tEuVkBtfHu
	7QC5bVAcLhu+foDAF4t2i7SAruabQBG/cHBiGfmU/RtPkaHbb8evBR+hH7KKJeqYa/Qb
	EXj18NWMJ1U6oqfvpJ5U0at6seqAZ8+HTVkYQStusNxgjPPpeQEP24MW3b5LRzr+ox0z
	ANLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=FtjizvtZxaU9xSOjLmIAb0at+bcXzP23G3Am7svSVUU=;
	b=qcKmI7NPPHiSQ6lctuuwGFa/TCOu76cyGSZ5fFUtbUhozgX04k5+X7daEKfQx4cAr6
	njKfAfyXNwin1UdcE8+qiJ/o75a2mTFa9AvhQwK1QVvAELDDiqq8k4etKiew4OOQ7vnW
	O7MDH13o5eUIETF0iBD3wreOHveHAD5XYBsz/XwRlxLdgaG9tfKuhrkiNkkzszmicVik
	LB+TxGuVlGzRcb2QwJZsT82lHStj3DpjQkN5T1MhhTbCxRDH8R7FHPolK09XmMhd2Ep1
	v7Eyl7Iug8wUReOoENx8xz4OPVL5W4JLD3h/sSx8p1v9wX4+TqyeQHKqIf/kfzFO4LUj
	bjpQ==
X-Gm-Message-State: AJcUukftvnXwWfzcdrN+lIrc7AkbFdSlqQ7HSuvJoDjtI6HDvceDfxkd
	7+5HhEfu0YUYtmiA1u/aMIllakBDENeN/ICMSRV5zA==
X-Received: by 2002:a05:6830:16d3:: with SMTP id
	l19mr19375675otr.50.1545999737992; 
	Fri, 28 Dec 2018 04:22:17 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
	<CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
	<CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
	<CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
	<CAC-7+Cg-VJ9wivBYM+15mUs6cPUZ-Zu1Q818KieyjEVz02eLig@mail.gmail.com>
	<CAC-7+Cg2muWTajKd-nSEz37oHPug6AD-WGyXJ8E7yASGc9p-dA@mail.gmail.com>
	<CAFEAcA-a4zhmhkzT8OqCkEwwJH89G+u3FL=CZGnUp9Mw4_WNLw@mail.gmail.com>
In-Reply-To: <CAFEAcA-a4zhmhkzT8OqCkEwwJH89G+u3FL=CZGnUp9Mw4_WNLw@mail.gmail.com>
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Date: Fri, 28 Dec 2018 15:22:07 +0300
Message-ID: <CAC-7+Ch4M9DEhYvHG2Z0KAJCBDLrDnzj3FF_P3d8qAY7jtMTCQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000034bcea057e141d83"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-arm] Run Kernel+rootfs for ARM Cortex-A72 on QEMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBNiE7QjSLmh

--00000000000034bcea057e141d83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for information!

=D1=87=D1=82, 27 =D0=B4=D0=B5=D0=BA. 2018 =D0=B3. =D0=B2 20:26, Peter Mayde=
ll <peter.maydell@linaro.org>:

> On Tue, 25 Dec 2018 at 07:30, =D0=A1=D1=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=81=D0=BE=D0=B2 <stast.3vium@gmail.=
com>
> wrote:
> > Although there is no big difference now. I really want to see the logs.
> > If the board is not suitable for the kernel, the logs will not be
> displayed?
>
> If the kernel is not suitable for the board, then typically the
> kernel will just crash very early in bootup, before it has
> been able to output logs. (In particular, because the serial
> port location depends on the board, the kernel needs to be
> able to work with the board to be able to output anything at all.)
>
> This is the same as with real hardware -- if you boot the wrong
> kernel or a badly configured kernel or a kernel with the wrong
> device tree on a real hardware board, it will generally crash with
> no output. The process for debugging this in QEMU is the same as
> for real hardware (ie use a known-good config, trial and error,
> if all else fails use a debugger to see what's happening).
>
> thanks
> -- PMM
>

--00000000000034bcea057e141d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for information!<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">=D1=87=D1=82, 27 =D0=B4=D0=B5=D0=BA. 2018 =D0=B3.=
 =D0=B2 20:26, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Tue, 25 Dec 2018 at 07:30, =D0=A1=D1=82=D0=B0=D0=BD=
=D0=B8=D1=81=D0=BB=D0=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=81=D0=BE=D0=B2 &=
lt;<a href=3D"mailto:stast.3vium@gmail.com" target=3D"_blank">stast.3vium@g=
mail.com</a>&gt; wrote:<br>
&gt; Although there is no big difference now. I really want to see the logs=
.<br>
&gt; If the board is not suitable for the kernel, the logs will not be disp=
layed?<br>
<br>
If the kernel is not suitable for the board, then typically the<br>
kernel will just crash very early in bootup, before it has<br>
been able to output logs. (In particular, because the serial<br>
port location depends on the board, the kernel needs to be<br>
able to work with the board to be able to output anything at all.)<br>
<br>
This is the same as with real hardware -- if you boot the wrong<br>
kernel or a badly configured kernel or a kernel with the wrong<br>
device tree on a real hardware board, it will generally crash with<br>
no output. The process for debugging this in QEMU is the same as<br>
for real hardware (ie use a known-good config, trial and error,<br>
if all else fails use a debugger to see what&#39;s happening).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000034bcea057e141d83--
