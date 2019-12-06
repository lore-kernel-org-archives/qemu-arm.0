Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1238457lff;
        Fri, 6 Dec 2019 12:21:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwW596UAPEVkNeza80eLroeecE019LpvGyNS35FNVZY7Aom1fb+Sem9Ju67L0iKXtOwld5N
X-Received: by 2002:a9d:7cd9:: with SMTP id r25mr12130367otn.326.1575663662771;
        Fri, 06 Dec 2019 12:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575663662; cv=none;
        d=google.com; s=arc-20160816;
        b=lJC7LL9Ob3quD8W/FxIePtLMKJpCw7dgOSZO49TU21Nkfnr5mnDMzWFYlA6t+O9tUj
         jcrI1vUV40MpwmprldOjgXhuH955qXJ4AfxFuGp9LzZY4rWhfoCBymt7Oau6dQtrQ7ww
         JL3Vs5ZNPGFruOVjLD/LlWO63vFZ5/uUTcXJThhTMaJP0vrK7+HxjmBp9+ZSr/nMs2ZB
         5YxERanJ1Bu5MQeKmvStWbQBUs63z2Pj9m1CWpiFJw9TneROcUUzY6D+DsUanpZRIr2T
         av+zSeCAqHJeAsUK8aloHppbI0i2plQvtIpTM4wd38iNCev0TnMC8gLi2aLaL4bkuR5L
         n1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VPrqLSDF6cbyZzlOcEit277juDu8n1Mg9FZXYf0DkF8=;
        b=Pg/IooFvd6s4Ho4FJG6rVcVMEdRjTlpKLIf/nL3a2TVr4LhZNXbLfbsOz1dFXOdkxf
         Ce6zwwS+Y7qxZuPiALFkk/ijwRBff22/WWJT2942/7E/WyC3Hjb+wkUjnW8fj4v8H0Mi
         0uUaOuAa/f9DoSHufmCLNSY9DqHel/chciqD07R/L610Dk0AFYK6s1o0s4RFFdVtUKBW
         hdDTO79br9eJvtWyrWi2kCdN7L8zm7n0Ug8EfzBGM63T/kW45cWQ1zq3qWkadvXW+ad3
         2O93nds4LIw/F1tp8pl6dv0pQHE5RhUZloXliC+FwVphk9fJ4AHznDpr63FXAxg3Zxnr
         BTIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=biYg6He5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si1063909otk.132.2019.12.06.12.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 12:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=biYg6He5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idK61-0005W0-Tw
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 15:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1idK5n-0005Vs-Ko
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 15:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1idK5l-0002V4-Bn
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 15:20:47 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:33990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1idK5l-0002T4-4w; Fri, 06 Dec 2019 15:20:45 -0500
Received: by mail-io1-xd43.google.com with SMTP id z193so8632636iof.1;
 Fri, 06 Dec 2019 12:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPrqLSDF6cbyZzlOcEit277juDu8n1Mg9FZXYf0DkF8=;
 b=biYg6He5J7jIk7sNgqpqyTA6deV7GDILYQE8zyKyRPVkR9r+Cq0+bIz2ji3lcUPATg
 wXmNwlEgPjVJY1sOU4Mu5g3gt/0nlAAqYQZbp63N0GWTnG3PkegYYPRlslUjW08etW43
 gZk736CpE1P2nmwp7H4tb43tU3ExA4ZYKK8xfgU1hrc8wNFrvXiuZtuEOsvswMR7Dv8Z
 PQABx4Q7r9Ro8JElzczbgvCU3x0OKwNePjG8UPjGGLp8LXGpqLFWcojGQ/raK2WXffAu
 0GMGxFW3dqJvKGRrjP/kQdGDDypcOsBewFIqZN5dedBREXKa2MqsekjmfAdh6adS896Z
 F30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPrqLSDF6cbyZzlOcEit277juDu8n1Mg9FZXYf0DkF8=;
 b=uoIFLYLAFsQ1fUC6L2JGFO4bKTLR7r5B+Szmw9geq7EOJbbN5pZeRi3891vuS98sy8
 B0IFa/i3TkcCOuCOMNfDUg6bGUApGtZJpXv7Jwz3h94X3Oh217mOd+xExFLByTOIm8lr
 hAB8gIs+1S3i0Q7Zo6kiRIB86lrRWa4TK5sGRpxbqsXmKbQgf0kl/r39UvxRzo8CrCZR
 bY1iQgPnub2ldbVK+J9td3VChv4COjZMG+uxplllSGXzZWhtg4YG9/9PG86yn5+2lkoX
 YOMH/2E+HI1LaBxUjaJLKOQ4Zl8nPnuTxNyR313O1Mqm+Ld0MGZWAmNMEsPriGBwAfTm
 Erbg==
X-Gm-Message-State: APjAAAWRKZqY0C7x7J07kzSgfsUm7Bpwj6D664q0aMS+oTCNOol64QG4
 tD71Nokwqxa+8A6WY0GjGoYZmdcKXifQ8j1IKHg=
X-Received: by 2002:a5d:8f17:: with SMTP id f23mr12298036iof.265.1575663644369; 
 Fri, 06 Dec 2019 12:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-9-nieklinnenbank@gmail.com>
 <CAFEAcA-1Re0noxPN04uXqRYX=-g97jtiweZA=WcFo1OwXBoN5w@mail.gmail.com>
 <41ab9f5a-3318-b412-44e8-f8571a64da64@redhat.com>
In-Reply-To: <41ab9f5a-3318-b412-44e8-f8571a64da64@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 6 Dec 2019 21:20:33 +0100
Message-ID: <CAPan3Wq_fFcHb1TR5bP0O4T8mRo73Fi5Fe-8VNw93Cv6jwLg=g@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm: allwinner-h3: add Security Identifier device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ceea9005990ec7cb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VYlS2nG1Ecg/

--000000000000ceea9005990ec7cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Peter, Philippe,

On Fri, Dec 6, 2019 at 5:35 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 12/6/19 3:27 PM, Peter Maydell wrote:
> > On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >>
> >> The Security Identifier device in Allwinner H3 System on Chip
> >> gives applications a per-board unique identifier. This commit
> >> adds support for the Allwinner H3 Security Identifier using
> >> randomized data as input.
> >
> > If this is a fixed value in hardware, I'm not sure that
> > having the QEMU model pick a random value is the best
> > choice. If we just set it to a fixed value in QEMU, is
> > that going to cause problems?
> >
> > (Generally it's nice for QEMU to be deterministic, so it
> > behaves the same way every time you run it. Also if it's
> > always the same we don't need to bother migrating the
> > ID value.)
>
> Agreed. Since the identifier is 128-bit, I'd use DEFINE_PROP_UUID() or,
> to be even safer, DEFINE_PROP_UUID_NODEFAULT().
> See how the ipmi-bmc-sim device checks its guid field and fails if unset.
>

Thank you both for clarifying this. OK, I'll update this patch such that
the identifier is fixed,
using the functions Philippe suggested.

The reason I originally chose to make it randomized is that U-Boot mainline
reads out the
SID data in order to create a MAC address for the ethernet device. So when
a user runs multiple
QEMU machines inside a virtualized network, they will get the same MACs if
the SID isnt unique.
However this problem can also be solved very easy with U-Boot itself by
just overriding the ethaddr environment variable.

For your interest, in the U-Boot source you can see this behaviour in the
file
arch/arm/mach-sunxi/cpu_info.c:139 in sunxi_get_sid(), sun8i_efuse_read()
where it reads the SID
and in board/sunxi/board.c:782 in setup_environment() where it uses the SID
to create the MAC address.

Regards,
Niek

--=20
Niek Linnenbank

--000000000000ceea9005990ec7cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Peter, Philippe,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2019 at 5:35 P=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">phil=
md@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 12/6/19 3:27 PM, Peter Maydell wrote:<br>
&gt; On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank &lt;<a href=3D"mailto:nie=
klinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; The Security Identifier device in Allwinner H3 System on Chip<br>
&gt;&gt; gives applications a per-board unique identifier. This commit<br>
&gt;&gt; adds support for the Allwinner H3 Security Identifier using<br>
&gt;&gt; randomized data as input.<br>
&gt; <br>
&gt; If this is a fixed value in hardware, I&#39;m not sure that<br>
&gt; having the QEMU model pick a random value is the best<br>
&gt; choice. If we just set it to a fixed value in QEMU, is<br>
&gt; that going to cause problems?<br>
&gt; <br>
&gt; (Generally it&#39;s nice for QEMU to be deterministic, so it<br>
&gt; behaves the same way every time you run it. Also if it&#39;s<br>
&gt; always the same we don&#39;t need to bother migrating the<br>
&gt; ID value.)<br>
<br>
Agreed. Since the identifier is 128-bit, I&#39;d use DEFINE_PROP_UUID() or,=
 <br>
to be even safer, DEFINE_PROP_UUID_NODEFAULT().<br>
See how the ipmi-bmc-sim device checks its guid field and fails if unset.<b=
r></blockquote><div><br></div><div>Thank you both for clarifying this. OK, =
I&#39;ll update this patch such that the identifier is fixed,</div><div>usi=
ng the functions Philippe suggested.</div><div><br></div><div>The reason I =
originally chose to make it randomized is that U-Boot mainline reads out th=
e</div><div>SID data in order to create a MAC address for the ethernet devi=
ce. So when a user runs multiple</div><div>QEMU machines inside a virtualiz=
ed network, they will get the same MACs if the SID isnt unique.</div><div>H=
owever this problem can also be solved very easy with U-Boot itself by just=
 overriding the ethaddr environment variable.<br></div><div><br></div><div>=
For your interest, in the U-Boot source you can see this behaviour in the f=
ile</div><div>arch/arm/mach-sunxi/cpu_info.c:139 in sunxi_get_sid(), sun8i_=
efuse_read() where it reads the SID</div><div>and in board/sunxi/board.c:78=
2 in setup_environment() where it uses the SID to create the MAC address.<b=
r></div></div><div><br></div><div>Regards,</div><div>Niek<br></div><br>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Li=
nnenbank<br><br></div></div></div></div>

--000000000000ceea9005990ec7cb--
