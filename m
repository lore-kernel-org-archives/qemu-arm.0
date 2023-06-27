Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1490080ejx;
        Tue, 27 Jun 2023 08:14:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6J/zMpEQLljrfHK7ErYoB+Js8ETDXRi9bBcgiDYQmUzpvU29iGMhx31C/584fjxiPiKJ1c
X-Received: by 2002:a05:620a:2995:b0:765:4e18:927 with SMTP id r21-20020a05620a299500b007654e180927mr3489622qkp.39.1687878894465;
        Tue, 27 Jun 2023 08:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687878894; cv=none;
        d=google.com; s=arc-20160816;
        b=RLS0PoUmvn8KPiejinLrC98rMzWRHXSsmeBJ0PeeKuO3w303s0y8M4Xm0PUfVhaqLo
         AHYExWNLTn3jBnsVqQNZyOUR8d+gf3a0r8NYwjKLtg1no6OBCAlsLasxnK6ViKdQtv3z
         uNrSgNRKF4MFauguyDLwh4rjQAm6XX+JWzM589cZmSdB4hRJWwCteOqvmKQcFZM1fga4
         6TkN+mB1bn7qGSLpt5QmicGD0zJHGkwZWfQ0HpBTtPzTTp6PfEeulAkG+xfAkggtFtLt
         emV1Nw1cIhgWMnDA3+NDRg1UUJV1TE2WQAGCAQa1Q69dzAvtbxKa9gKegVmxo4nPqah2
         o5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CuhokOJ3K/VUKDvT1wMHCk8fjqgkYkV4FO4y7glcPvI=;
        fh=W+9lqOwYKkeDrPoFWlFMGBkKiRi71vwD43j9ZyNwpms=;
        b=ycl8lNsS3y6umLbgii82YcdcB60pJfUPMW/9MfS2Nbm/Iiqm/A2+8D6Q2j94O53CP2
         akV0lEeg1Dn4YCNXQ0shbuzSuasVzwzhFRfjSa8QKDq1+SgCPlh3zPaz5VMqE0DePmyk
         BfLDy3nrWcsW1L5foJyEfyPDbd6xqj7+7aT/ZU9RufOEZn4r6jGCKDEwZtx30QhFP+dH
         K6R0AA65RSxlLVmtBTj8gSsdxk2QIMGUdnJBdk9L4c1mt+76lmTYfjj7+m6/3mxGgWKA
         gg2MBgwXp20ZVIXEwOKtVl50UdJHR5C/xN6QP1NUI12NpLjLRBMFbk8DqT0qaYH5SSTx
         zXSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wgp58xl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rr11-20020a05620a678b00b0075f34b05507si3247565qkn.36.2023.06.27.08.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 08:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wgp58xl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEAOk-0003jy-P8; Tue, 27 Jun 2023 11:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qEAOi-0003V2-Si
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 11:14:28 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qEAOh-0005B3-3C
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 11:14:28 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-bd6446528dcso4627052276.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687878866; x=1690470866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CuhokOJ3K/VUKDvT1wMHCk8fjqgkYkV4FO4y7glcPvI=;
 b=Wgp58xl2sRNtCwtNO0+8QpsLIKghpzGeu8Sid4mqrTrPXGQhtPA0LukUh3RPOnVzdm
 ZLj/25Z6lqIMxSqX04rMJZ8EuCtKf7QLD0UZ3y/co9E4sfUNIDN+jsy50qS/wtgbsy7t
 ZHfkpUb6/BwcmDFdXXgjn5fRVes4l+33Rb13MTULgJYb5lhlAxmvhvFJyH2ifdr+PPvI
 WOWG87xzNUF5IXiEC59/rgLpv7XPszJU54UTJHwc/j/04HTkv6K78BqO1wy04tkxfFYY
 mrXIeGaODrjkhXLdv1UtttBv/CblRtd5gjUrqWfDt8Wa4k09/7AqaZPUMms/j4ntu/dy
 XhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687878866; x=1690470866;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CuhokOJ3K/VUKDvT1wMHCk8fjqgkYkV4FO4y7glcPvI=;
 b=ZP6DBZgRYZFN80MD66PXaCxxuqC9Dq4/j9zK6t9yOG8OUNLDxsIo4VECmEiqTAlK88
 u5U7Y/XoWg0BZXp5Qjykl5HY0Zg6xj4qd1pZn7rzc9oIKKJYUHA7DMBY+eyBxw7qCxLP
 jrtgEcQLs/gC/GvDjwt6N1WWvX3EtK9TE0yw8RJYjNKt1cdWYp4Xv3L1UUF+o4I+XRsz
 L+2OaKVjokccmIQ3VqRP2xFWz3zw2I9H8VgonnwyVLpL0fs5GaJWOQyZ1wnQ+DNiGk+p
 E08fSC8VjhTqtSxrYu36Z+ylMF1P19oW6bdhhhtbjpLCiT9Q8eg5AIciFYiPva4MQY0F
 8C4g==
X-Gm-Message-State: AC+VfDzQctECXKDtnCLwZnzUakr+GxSCfw2hpwTzp66mFvj9SsOXHRYi
 eAAksnu3W+GF0Q91XM/4FUBqY+S5MZeb/PsJdoY=
X-Received: by 2002:a25:ae98:0:b0:c14:11e4:ca4 with SMTP id
 b24-20020a25ae98000000b00c1411e40ca4mr9862958ybj.46.1687878865813; Tue, 27
 Jun 2023 08:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
 <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
 <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
In-Reply-To: <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
From: abhijit patil <patilabhijit180@gmail.com>
Date: Tue, 27 Jun 2023 20:44:14 +0530
Message-ID: <CAJ-ErDAF0n9UoSSXHDz36VFzntidjKYyAzOCtXnL2CqPDS9OiQ@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003891c205ff1deccb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PtCfvIEDbhbl

--0000000000003891c205ff1deccb
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks for the info!

On Tue, Jun 27, 2023, 8:02 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 27 Jun 2023 at 15:09, abhijit patil <patilabhijit180@gmail.com>
> wrote:
> >
> > Does it have for ARM M7 any board?...I read somewhere that if you have
> latest version 5 for qemu then it supports the ARM M7 machine...is it
> right?...and if yes where can we download the same and the programs and
> other things for ARM M7 using qemu
>
> Yes, QEMU supports the Cortex-M7; the machine using it is the
> mps2-an500 (which is a model of an FPGA image for an Arm
> development board).
>
> We (ie the upstream QEMU community) provide QEMU in source
> code form. You can find more information about compiling it
> here: https://www.qemu.org/download/
> Or if you're running a Linux distro it's probably more
> convenient to use the distro-packaged QEMU.
>
> Generally we do not try to provide support for how to build
> and run guest binaries -- there are too many possible
> development environments and target boards and so on for
> that. We provide the emulated hardware, you have to bring
> the software :-)
>
> thanks
> -- PMM
>

--0000000000003891c205ff1deccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Awesome, thanks for the info!=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 27, 2023=
, 8:02 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">pet=
er.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On Tue, 27 Jun 2023 at 15:09, abhijit patil &lt;<a href=3D"mailto:patilab=
hijit180@gmail.com" target=3D"_blank" rel=3D"noreferrer">patilabhijit180@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Does it have for ARM M7 any board?...I read somewhere that if you have=
 latest version 5 for qemu then it supports the ARM M7 machine...is it righ=
t?...and if yes where can we download the same and the programs and other t=
hings for ARM M7 using qemu<br>
<br>
Yes, QEMU supports the Cortex-M7; the machine using it is the<br>
mps2-an500 (which is a model of an FPGA image for an Arm<br>
development board).<br>
<br>
We (ie the upstream QEMU community) provide QEMU in source<br>
code form. You can find more information about compiling it<br>
here: <a href=3D"https://www.qemu.org/download/" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.qemu.org/download/</a><br>
Or if you&#39;re running a Linux distro it&#39;s probably more<br>
convenient to use the distro-packaged QEMU.<br>
<br>
Generally we do not try to provide support for how to build<br>
and run guest binaries -- there are too many possible<br>
development environments and target boards and so on for<br>
that. We provide the emulated hardware, you have to bring<br>
the software :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000003891c205ff1deccb--
