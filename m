Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2933504lfg;
        Sun, 21 Mar 2021 09:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpw148GJojQoW5z8PNuCq6aQ67wkOYyb1bqtJ91dZcItWGBimX/ohbmgwYA4lNSnDvuahJ
X-Received: by 2002:a92:da90:: with SMTP id u16mr8988724iln.275.1616345516686;
        Sun, 21 Mar 2021 09:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616345516; cv=none;
        d=google.com; s=arc-20160816;
        b=kPa6fsc5iGnp3dyPkT9EPDR6WpYIZ/8OyuRiBPJ+kSCI/sQz74g2xFKz+RFJDu0tyI
         Lk0Hf9p0KKnNAQ6ngogkIfj2yW/R1Z4F7DvJBHyLCc2S0lCgIQc6MimR3k/5SoHzsarj
         zQgdB8UkxQrKFuUeiOmUvrwcRYXSS4tLffLat59NjtIfnX2Sr5mf9EQvAbfkbiPl9qmT
         58uZGbS+gF+gW7kVpg74N5gjBP8y5pJi7mA+Ej1NgY96YATIsjXA2RSYPfj89zs+lfxe
         4aYNAN/RWSmEmvF6Xp5exZ56ZyQKO6k9imYiWjn8iP+MREQJtHtYMR1C+x5L2SU09q15
         VnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRBQ9u8meHpFJLMxo6KxHsi4qmBRdME1TQBDYII9cEs=;
        b=PBrM9LZ+JWHoLhnTTS90vk+qKH2JAcvyw8hXWj6PB26zieW0vrLtqCcapWPj8P9ACI
         LxJcGCt4M6ySTrJQ0gDJ/pDEVqfPa7ee1DVHmrcj/fNH2S8cl2lT1ohghr92TtmGkhQi
         fMsE3U0FYUkgYaF0mJ9Wojia6EoUzxX0IMyRw1oBH0YwJ6mKRXZEoPGM1zstf4otd930
         78lCOsJn/JeAVFmKAebNBcYr6TWoHrvBvxnHb583Dmh9B6Uopxo0IOKWtb/UXSv+TnUF
         ukb9o+nHtKQu7BanUaCbnbHpkdP8r1eBpIQPQ1rTMDH+b92+05o3VPawpq7/EduceLFj
         POoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dp9GPq01;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24si7390559jaq.43.2021.03.21.09.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 09:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dp9GPq01;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lO1Ix-0000m9-U6
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 12:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO1HW-0000Bs-CK
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 12:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lO1HQ-0001Xo-FK
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 12:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616345419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRBQ9u8meHpFJLMxo6KxHsi4qmBRdME1TQBDYII9cEs=;
 b=Dp9GPq01VIyYEUDJPP9t1nQMJ2e5i2l2QWa1Ubm1t9ESNdr/sHgi+yEPs1vXCbufWh/nKb
 PZAXcETFugZv4P16Ii0IIM2c54HcON5TirF0KcVaeZKDfc2wEDKnm6snMNkUdrLOnfBahL
 kCHtg7zBIKfgwdW8jz2UttwTlizHA2M=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-g_K9mDhGPye7vu4eKkyFdg-1; Sun, 21 Mar 2021 12:50:14 -0400
X-MC-Unique: g_K9mDhGPye7vu4eKkyFdg-1
Received: by mail-pf1-f198.google.com with SMTP id b21so26464517pfo.0
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 09:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRBQ9u8meHpFJLMxo6KxHsi4qmBRdME1TQBDYII9cEs=;
 b=i52zbULQDkGXV37KfgR1mstk9/krjvVGmRW+kVMB7dvOvrcty70Wknks/d6/96tnNB
 30FK0DzF5XON2gsxEynF994IxLZoBdyyPFzymfoQYmBA1u8e2KzVdBKTwQRmImsYrCkv
 SPOz0Zv+nIqWd+RC23ClwuHLOwznwtW1SYzG/6oFpFGok/96RQv9RAH8YsZO27oCyYws
 Ip5Ay5K5KD+kwz2mlf5XTxGrncRb1G2qGyUEubc6tPiX4eiNEqcgwKmIgmwNSmW3sDXL
 PKWduozd5SnQlUwM6/QEsS9Fa8K5SV+Y13BUNyKxNrEzYMB3h0nlEPTMQXGJwbl79a6G
 Oolw==
X-Gm-Message-State: AOAM533oCLUVwydvN/kew+akDzfGLylwYxQn/7RoCYL1dOcS9Z1D0MlJ
 G0ON9UEnbIVK8hxBaR0gtKnP7FH7zecF36zDcvnH14Rt3Sqz7zhY8FNNzspXP+hsPeBTIzpOlU8
 UazCFzlTylLGlu6saiJIr7pdk8rq/Mko=
X-Received: by 2002:a63:7e51:: with SMTP id o17mr10333637pgn.281.1616345413518; 
 Sun, 21 Mar 2021 09:50:13 -0700 (PDT)
X-Received: by 2002:a63:7e51:: with SMTP id o17mr10333623pgn.281.1616345413294; 
 Sun, 21 Mar 2021 09:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
In-Reply-To: <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 21 Mar 2021 17:50:01 +0100
Message-ID: <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000031b01005be0ebedc"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0E6ha3Zfp8kb

--00000000000031b01005be0ebedc
Content-Type: text/plain; charset="UTF-8"

Il dom 21 mar 2021, 16:49 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> What exact version of gcc are you guys using?  Something from rawhide that
> I can just install?
>

I am using Fedora 34. I upgraded just to test this bug and it seems stable
except that GNOME Shell extensions need an upgrade. However I haven't tried
building all of QEMU, only the test case.

So far I have failed to compile with gcc master with --enable-lto.  Lots of
> missing symbols reported at link time.  Therefore I've been unable to
> actually
> test what I intended to test.
>
> That said, I'm not hopeful that __attribute__((const)) will work.  I have
> an
> idea that early inlining will inline tiny function calls too soon, before
> the
> attribute has a change to DTRT during CSE.


Yeah that's at least plausible.

Another workaround may be to avoid compiling exec-vary.c with -flto.  I'm
> not
> sure that my meson fu is up to that.  Paolo?
>

You would have to define a static library.

I have filed a gcc bug report:
>
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
>
> Hopefully someone can address that before gcc 11 gets released.  At which
> point we need do nothing in qemu.  Aldy?


Good point, I can give it a shot too just to see how rusty I am... That
would be the best outcome, though we would have to check LLVM as well. If
const doesn't work it would indeed be prudent to include Gavin's configure
check.

Paolo


>
> r~
>
>

--00000000000031b01005be0ebedc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il dom 21 mar 2021, 16:49 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">What exact version =
of gcc are you guys using?=C2=A0 Something from rawhide that I can=C2=A0jus=
t install?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I am using Fedora 34. I upgraded just to test this bug and it see=
ms stable except that GNOME Shell extensions need an upgrade. However I hav=
en&#39;t tried building all of QEMU, only the test case.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">So far I have failed to compile with gcc master with --enab=
le-lto.=C2=A0 Lots of <br>
missing symbols reported at link time.=C2=A0 Therefore I&#39;ve been unable=
 to actually <br>
test what I intended to test.<br>
<br>
That said, I&#39;m not hopeful that __attribute__((const)) will work.=C2=A0=
 I have an <br>
idea that early inlining will inline tiny function calls too soon, before t=
he <br>
attribute has a change to DTRT during CSE.</blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yeah that&#39;s at least plausible.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Another workaround may be to avoid compiling exec-vary.c with -flto=
.=C2=A0 I&#39;m not <br>
sure that my meson fu is up to that.=C2=A0 Paolo?<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">You would have to define a=
 static library.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I have filed a gcc=
 bug report:<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D9969=
6" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gcc.gnu.org/bugz=
illa/show_bug.cgi?id=3D99696</a><br>
<br>
Hopefully someone can address that before gcc 11 gets released.=C2=A0 At wh=
ich point we need do nothing in qemu.=C2=A0 Aldy?</blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Good point, I can give it a sh=
ot too just to see how rusty I am... That would be the best outcome, though=
 we would have to check LLVM as well. If const doesn&#39;t work it would in=
deed be prudent to include Gavin&#39;s configure check.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--00000000000031b01005be0ebedc--

