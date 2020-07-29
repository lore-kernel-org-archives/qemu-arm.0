Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1864086lfy;
        Wed, 29 Jul 2020 12:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5pqky9Fa5TG4nMKoUBsV8jHKr/nkxJOmyVzCjvELGeuBUorlfd9eC9lLFXXzzR/DceFxN
X-Received: by 2002:a25:234a:: with SMTP id j71mr43840634ybj.504.1596049297950;
        Wed, 29 Jul 2020 12:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596049297; cv=none;
        d=google.com; s=arc-20160816;
        b=HAlIW/+AXh5KboRq/QSL5soqqVKlN1RAPP+0zQ//DIfKFfFkl51iCdkqnwEnKHkRps
         4a/0fPBwVZuOltC0jrvDCLN4qG0fxzU/bNfD877G8wdHxsjxkqyjgKgte9wdCpBH7TkS
         L1zvXZYVVyTHheFHTt0O9/+5lVwmqvyE2t7iAM2T3ODPaG6yoPuVe8uYUVRdu90Som9f
         7HeOSqWMnGXHWSz4HUzKDIzFYQp9T3KPpXo+AKBCR4tUoUZDKs+m1kYlmAaLuTNk4EiG
         AwP3EpYbuMfGsUVGzJUGR9wq7Pafo4O54D86uMkRjA4ySb2bYsdE5FOSK6pnvb8KNcCV
         9NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11ACC7wl10QDcG72oBbNufHK3f8E/gxoBd0Mn4qNUXM=;
        b=gk0q2RkrujAPnsT4zfr5sKC/OcwCzwsgAGmQE6AbJWXF1PIJx4PmH4/5t/6XYMu8lE
         trrCGRJ/FG59o0Td31M4Tf1fwFJWV1XD5t9cpIweZf43LaIebom1U2LEc/1sTppcLRWt
         hSJRZgD9wVvJ1EpyN3ty75h73fTsMhbhu3wO0r8xWKotxpVW6/Z9ST6Q1NX/AQBOTqiZ
         p7/2tLIPHDu9h/H0rDSIeTWSs/ZSZr4uayNuHYkNOBcspgxchbpoVXZY18RDAP4fyQed
         wstav4kJmochnDZOTOgLrxq/j+ikQlZWH/cFO5iQJrXf8LzHk4UHpsKLAe1O5yNnUc3M
         XPWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnfSNJ4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si2748878ybo.112.2020.07.29.12.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 12:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnfSNJ4o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0rKb-0001tc-Bi
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 15:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0rKS-0001tT-JB
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 15:01:28 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0rKQ-0001OJ-I2
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 15:01:28 -0400
Received: by mail-qv1-xf31.google.com with SMTP id a19so5363942qvy.3
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2020 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=11ACC7wl10QDcG72oBbNufHK3f8E/gxoBd0Mn4qNUXM=;
 b=NnfSNJ4o8mLstN0xix+Xb1qu+DosSnKVUmBxh+fBDjLB8JGIoUyNnlyfaR0IA2z2R2
 BmpI5xo3ShsMdLaRw6lLZt4BS0G9mTSzNrkOYWw7e+YHwPOGNzWHtQLIaNKnbFaWVREb
 528Hyd1FBKdqBwr6pJc/LFIlkV/vmsR+wJA/gAdKy8Hy1SeLsU7ASK1Tr6IQpbKPqt6Q
 yFEeSUn7EatyeCTg4FG7F8/2v/rR7wdoz1ZlftaA2IIimkSuytvaeOFpeOLTsQw5WGvB
 z0h98QcrZ4kIe9lQ8BfUz4Yp2HYjc2Ow5yD0+k5ZgIOZLQS1/y7YtEkA1wrpHWOQZ8t7
 ic0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=11ACC7wl10QDcG72oBbNufHK3f8E/gxoBd0Mn4qNUXM=;
 b=i6HJCFY7bD5NpYe00N25poFRVXI+XmeiAGpfr3++hCZk7h46ktZumpiKcn3kaKvI5V
 R4XsLXG/4wnNWLAYZuto7ikEfKOlU5ada1pw+O6u3iN06gqFVNaC1kI0E1ntTHRPQRNN
 yjunjJLqnSY3K3fJmKCFnC7pr4pQZji7em0OkPSqBJdQO+Rc7cPrFTMYJUn9ztPpea3n
 K6MgdQ5rTPjOA60jObf1Yuv1fnwhFFdUcZUe/W4xBivp0Eb+dPOlSe10cP9y1733p3Hb
 r+jkwK6t6FPm5U3aGIV5QgDS/WzM0+OMQTstPsl41zA3sF1wwYsdGeQtpNaCUTGIDrVf
 6NJg==
X-Gm-Message-State: AOAM5309kqPLpLKQQo0/2+oBINpfqbovi6sVWWY+zF4JuTS0aknmp7ei
 KwosOO9AVi06+XDMyMcRKfFSNHJWyFL0oiq+O44=
X-Received: by 2002:a0c:f081:: with SMTP id g1mr31741744qvk.219.1596049284910; 
 Wed, 29 Jul 2020 12:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <c5b4e931-f475-d0ab-70d4-0100cdb55dbc@linaro.org>
 <CAJoBWHxBv8L1nS_rf85kKPeWkq_E3bTvoMqNu1TRZZvYwg7ANQ@mail.gmail.com>
 <CAJoBWHwLX+GUTZoniC-SNjpghY+h2SaN=JjVnOk7Ux7DByR3jA@mail.gmail.com>
 <6ef5e106-3d74-d2ff-a9ec-6a93e019855f@linaro.org>
In-Reply-To: <6ef5e106-3d74-d2ff-a9ec-6a93e019855f@linaro.org>
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Wed, 29 Jul 2020 15:01:13 -0400
Message-ID: <CAJoBWHycMaNjPu9rpz4Qh11nZxq4qZz3p7NF+M2Y0+LMgrsYqg@mail.gmail.com>
Subject: Re: Differing PAC behavior between Qemu and Arm FVP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000abd70a05ab992eea"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qv1-xf31.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xEx8jbyL7Fiv

--000000000000abd70a05ab992eea
Content-Type: text/plain; charset="UTF-8"

Thanks!  I was completely unaware of that type of constraint.  I thankfully
never ran into a bug involving this, but it would have been a hell of a
time tracking it down!

On Tue, Jul 28, 2020 at 4:01 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/28/20 11:15 AM, Derrick McKee wrote:
> > asm("pacda %[loc], %[mod]"
> > : "=r"(result)
> > : [loc] "r"(addr_to_use), [mod] "r"(modifier)
> > :
> >   );
>
> As an aside, this asm statement is buggy.  You need to use a matching
> constraint to force RESULT and ADDR_TO_USE to be in the same register.
>
> Like so:
>
>   [loc] "0"(addr_to_use)
>
>
> r~
>


-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--000000000000abd70a05ab992eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!=C2=A0 I was completely unaware of that type of con=
straint.=C2=A0 I thankfully never ran into a bug involving this, but it wou=
ld have been a hell of a time tracking it down!<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 28, 2020 at =
4:01 PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.or=
g">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 7/28/20 11:15 AM, Derrick McKee wrote:<=
br>
&gt; asm(&quot;pacda %[loc], %[mod]&quot;<br>
&gt; : &quot;=3Dr&quot;(result)<br>
&gt; : [loc] &quot;r&quot;(addr_to_use), [mod] &quot;r&quot;(modifier)<br>
&gt; :<br>
&gt; =C2=A0 );<br>
<br>
As an aside, this asm statement is buggy.=C2=A0 You need to use a matching<=
br>
constraint to force RESULT and ADDR_TO_USE to be in the same register.<br>
<br>
Like so:<br>
<br>
=C2=A0 [loc] &quot;0&quot;(addr_to_use)<br>
<br>
<br>
r~<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Derrick McKee<br>Phone: (703) 957-9362<br>Email: <a href=3D=
"mailto:derrick.mckee@gmail.com" target=3D"_blank">derrick.mckee@gmail.com<=
/a><br></div>

--000000000000abd70a05ab992eea--
