Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp899034lfg;
        Fri, 5 Aug 2022 02:27:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7sPqDEjGHaH29EnaPO3+MLvMe0dWYGFaCSzkF24EOVeWqaaRcjmLvLDa45dshNPLwbNX17
X-Received: by 2002:a05:6214:4186:b0:474:74d0:7aeb with SMTP id ld6-20020a056214418600b0047474d07aebmr4780900qvb.75.1659691648740;
        Fri, 05 Aug 2022 02:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659691648; cv=none;
        d=google.com; s=arc-20160816;
        b=mtEph36l4ACg1oFamhF/CsYwxbPHXLrslWpcSlhUV0EmOZPSUfqUkzEqpBIzflgja+
         gccY1hZz0MFAHEDmUIW6LG6gmFq1FpzlUHPDWUNp9o6loksMcVs0o16MAPfsMo85SL5S
         yxDDHt6XEWhZjVjaWL0gCJY3i18Sw+sNaKwlfYGDYoSddm55/LlaFfSip0U2LB5rUkmO
         rRn7/ugp30HGuWF+WEOnqPFWK/cf8Tvjn0o1xeFZyVT3H9Ibub9NCEp9T6eQNTqrmK9K
         Toc20avGePpP3a6krx4PFZYHoTfEfJzowCbq0kIY8lD95p8A+rwK3UexBHWiC8C7bcEY
         5ADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Tl3CkRBUYMxN3HCo0CqvoNObtX4UDwKdhSw6OJigr7c=;
        b=GyufyIJBlrAvKNzuSvvG3JPiwEFdY1acLUagl6lrHY/TDryfY11HwdR2bje4JgXeUO
         ZdoDtqZ7Ca0g5L2M7y2wEHj3NdEM9gFzEJipRtttnuiJgCRpfERfm90l7oj0MxBvAnYE
         MLyOVYxIMAZ8T04jeC08L6rO2RFYl+EjHULKUrENSilGemMHmwVldvo4+7lPO+KSxSoR
         P2mHH1dgfRm15NqNfNKC/oyk1NskWNtKXLwZe/pZE8knWuKj1qI7hJoGc6Qf+IdM1ZVt
         byYlw4g4Xvw/Wtfcj60WPWD03KSqVOZjavOkq3V85X2wGtECw2Az9wIK0w4gPPBWzTKn
         T6hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PvQ3pkdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc7-20020a056214410700b0047298eab3f8si1573868qvb.487.2022.08.05.02.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Aug 2022 02:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PvQ3pkdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJtc8-0007yH-8t
	for alex.bennee@linaro.org; Fri, 05 Aug 2022 05:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJtYV-0004h8-Nv
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:23:48 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oJtYT-0007Ce-Ds
 for qemu-arm@nongnu.org; Fri, 05 Aug 2022 05:23:43 -0400
Received: by mail-ed1-x52c.google.com with SMTP id a89so2629135edf.5
 for <qemu-arm@nongnu.org>; Fri, 05 Aug 2022 02:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Tl3CkRBUYMxN3HCo0CqvoNObtX4UDwKdhSw6OJigr7c=;
 b=PvQ3pkdn/16TKaJyH5udZucRcCZBbCzVo2PXJ2w4VqqWt+ljGbiRxD68jSZ47JV4iI
 q0mYIzaMvTWLjgkvITR9qWzmfJn7uTmtSnbf1oJXPrRckOQtjkKcYr7DF3s3AEt3uMkL
 ImlSEkKyj7/uXdUcz9bhEVJmOXp8wpI1oceMJ13mIrtuAF5EWE4qLrUvOfRsoUprdWXu
 KMv1b7N6tmzXFIqDjDQeanqrRm3LOVi9vjbZBM1GNpJFLwOZbJpbCZg1AdyAniF95o2T
 eIvecPYSRPQaLBXnCi1FsDr5TeNGRcb4MqCgAbvZRYej5LgjnQMsz1QMbWAhMWAAvURo
 BJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Tl3CkRBUYMxN3HCo0CqvoNObtX4UDwKdhSw6OJigr7c=;
 b=6LJggkjKWVl/zT6MknaedOcJWfRnV0pWOJ2WLuZvmGUCQyhv0vyZjhUWcEAoarxrfN
 rzYuKp80nozM6qSiS8RjcBdf+JR32VaZYA6cmPHChpVQ6tUx5ngQI7wn5z7JRFiSbcV5
 M3899FYoGEp7g3HZ7SVhEntWbw5xHDjHwGh5rZwNotl+bLEpma22Pp1BW6yCfAUi6snU
 xrng/zQTZHe4zZIhymCk2Rdq6LtRUQ+fek4ASXO+WJW/KHkYRlXKodmqyjWYI5j8tk0B
 8dE6QeNuWiKBXWC0L0ZM/Z9qzsN2PwYnvSWZxeyLUKFuFUFJbq0w+VkShoeRD4jK2EAM
 no4Q==
X-Gm-Message-State: ACgBeo1eijLKlor1GPFO11LdCUv2dYooDMN8ESe47wqvyRwWkbhJ6NzD
 nYVgsLySOQh0qMTrlgzSLAP2k+1jOY9dwB/bFD2UyHL3Zj8=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr5849846edd.16.1659691419854; Fri, 05
 Aug 2022 02:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF8ZPDC+HOoJd=ssDT++KVbGyXV6bZUmri1anz08tfdWMA@mail.gmail.com>
 <CAFEAcA_qOWrJt45gffZCBTDGku=K7NLhQ=zp20efYDm5jMAe9A@mail.gmail.com>
In-Reply-To: <CAFEAcA_qOWrJt45gffZCBTDGku=K7NLhQ=zp20efYDm5jMAe9A@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Fri, 5 Aug 2022 11:23:28 +0200
Message-ID: <CAL7npF--=JXKYYpSZ39y+DAg6Z1WJG_w5ZZzFcM8YHEjFzd8Ew@mail.gmail.com>
Subject: Re: [qemu-arm-static] [Known-issue] readdir() returns NULL
 (errno=EOVERFLOW) for 32-bit user-static qemu on 64-bit host
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000846a9105e57b0578"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wt8/80QierYH

--000000000000846a9105e57b0578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

thank you for the updated information.
I have to go for a workaround then :-)

Best regards
Jon


El jue, 4 ago 2022 a las 10:49, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Wed, 3 Aug 2022 at 23:16, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Hello qemu-arm community,
> >
> > I did not set up this email with usual format and contents, as this is =
a
> known issue.
> > See Bug #1805913 =E2=80=9Creaddir() returns NULL (errno=3DEOVERFLOW) fo=
r 32-bi...=E2=80=9D
> : Bugs : QEMU (launchpad.net)
>
> We don't use launchpad any more; the current gitlab issue is:
> https://gitlab.com/qemu-project/qemu/-/issues/263
>
> > I have currently this issue as I am using libc2.28. If I take specially
> for that, libc2.27, as explained within the link, the issue disappears.
> > However, I would like to avoid this effort because of maintenance
> problems.
> > I was not able to find a solution to this problem and I see, it is stil=
l
> reproducible on latest QEMU versions (7.0.50).
> > In the link's thread a Kernel adaptation could fix it, but I saw nothin=
g
> valuable there.
> > Do you know how to fix or at least workaround it with QEMU or with
> Kernel?
>
> This cannot be fixed in QEMU -- the only way to fix it is for the
> kernel to gain a new API that QEMU can use to insist that
> readdir directory offsets are restricted to 32 bit values.
> So far that appears to be stalled: we have failed to persuade
> the kernel developers to do anything :-(
>
> thanks
> -- PMM
>


--=20
j.A

--000000000000846a9105e57b0578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>thank you for t=
he updated information.</div><div>I have to go for a workaround then :-)</d=
iv><div><br></div><div>Best regards</div><div>Jon</div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El ju=
e, 4 ago 2022 a las 10:49, Peter Maydell (&lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org">peter.maydell@linaro.org</a>&gt;) escribi=C3=B3:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 3 Aug 2022 at 23:16=
, Jon Alduan &lt;<a href=3D"mailto:jon.alduan@gmail.com" target=3D"_blank">=
jon.alduan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello qemu-arm community,<br>
&gt;<br>
&gt; I did not set up this email with usual format and contents, as this is=
 a known issue.<br>
&gt; See Bug #1805913 =E2=80=9Creaddir() returns NULL (errno=3DEOVERFLOW) f=
or 32-bi...=E2=80=9D : Bugs : QEMU (<a href=3D"http://launchpad.net" rel=3D=
"noreferrer" target=3D"_blank">launchpad.net</a>)<br>
<br>
We don&#39;t use launchpad any more; the current gitlab issue is:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/263" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/263</=
a><br>
<br>
&gt; I have currently this issue as I am using libc2.28. If I take speciall=
y for that, libc2.27, as explained within the link, the issue disappears.<b=
r>
&gt; However, I would like to avoid this effort because of maintenance prob=
lems.<br>
&gt; I was not able to find a solution to this problem and I see, it is sti=
ll reproducible on latest QEMU versions (7.0.50).<br>
&gt; In the link&#39;s thread a Kernel adaptation could fix it, but I saw n=
othing valuable there.<br>
&gt; Do you know how to fix or at least workaround it with QEMU or with Ker=
nel?<br>
<br>
This cannot be fixed in QEMU -- the only way to fix it is for the<br>
kernel to gain a new API that QEMU can use to insist that<br>
readdir directory offsets are restricted to 32 bit values.<br>
So far that appears to be stalled: we have failed to persuade<br>
the kernel developers to do anything :-(<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000846a9105e57b0578--
