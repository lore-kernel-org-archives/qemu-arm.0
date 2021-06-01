Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3734095lfm;
        Tue, 1 Jun 2021 08:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy79VyMZqVCO0naEKbwYNFohO3YZj8VKlnBO7MkgVZNf5NKEvMu2uxcklVFnP3eyJtaoWtk
X-Received: by 2002:a05:6402:50d1:: with SMTP id h17mr34540993edb.199.1622561399729;
        Tue, 01 Jun 2021 08:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622561399; cv=none;
        d=google.com; s=arc-20160816;
        b=r3+iEqT7Fkvq2Urw86C6NrEWsUzm4zfRTM78/cWeRiHHMjlFKjG+zjvVN8CwQJhEqu
         e+7+m17ZryePB2/EXmIoafdVT1lz3bdAYmJQINm/iGGKZK1SULGG/z8mnXwFh/gBjiWG
         UGKHe3TzzCsSCcuwS7V7g7sg+pabwGK16g0R2XR1PiMR8rZK3uUHY4FlfY5ItWofNNfZ
         dEnDVFOiar5GXXE0z8p6R3vUdYdE+i+EYQJO29yp/OtDlfjIdk1+7UwW8nd6hDPcnlrG
         UCkbwkDrTVOi3PLG1hkCu9q28ne82Moq3qwABQnpT1Rip2kFoQE7+9/2TOrNFBxP072o
         0A1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C+7DEb22BEvtItehjPr9U48yd44UE8dUIQpK3BIdDZE=;
        b=UhWavw7u3aJ/hprEBPFr9wiaLFIkzr5DgnQ88ZKQkFKaC6ndc3ZGS2sv8Krlo5oMkX
         XVC4tSzMB+ASD1faVXqYkr0Ocb4fTGl7gn6QMAD8S05fwWNG2FFKzY1B2itLkyu1CUhk
         PNToHegj2Lx6EFg1LOBv7wAWr4Z0hSt1eemrztcBCxLqjihEdQmCeK32q5CU2PtW3uEF
         m4IwcMeIVbaOOXcCKRHof952W0ub3WxCEZRyPGC15WEIG0jcNgrLKQrVqd7KGGYlbM9p
         4dSyNSur7u06G0Vfrxcr0qAeipfwASstiksCiJoHDc7OCkyeD5ItGLkoM1buXkvj4C87
         31eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtSg82TJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gj23si20618926ejb.7.2021.06.01.08.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jun 2021 08:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtSg82TJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lo6L8-00060O-QY
	for alex.bennee@linaro.org; Tue, 01 Jun 2021 11:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo6Db-0006iM-9x
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 11:22:12 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lo6DY-0007pC-EY
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 11:22:11 -0400
Received: by mail-ed1-x536.google.com with SMTP id j10so17813094edw.8
 for <qemu-arm@nongnu.org>; Tue, 01 Jun 2021 08:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+7DEb22BEvtItehjPr9U48yd44UE8dUIQpK3BIdDZE=;
 b=VtSg82TJpZgYUUWtqM4O050rAKQUAFlpjqPe02SX/9qfcphQoNyfgq9tGXrRwKTWxe
 rRTXpflK4qtmhKZMIGPA++lUVqJ3CWs6VO+dRikMsXEhPV98vmQkdzqz0W6dXmATYBvI
 pMfJLx4DzPyEAhdwkazTKxqP3kc007yu2yse0YEyS6vAbnaIqYEVccSnziFSFFfWjqZK
 4NWO1fhg5o68/S4pHHQ5ZBCAPfCqovlewkCwSC+uQJiq1hblNrYjq8PQ5z9MuZcZLSIh
 LOlsptGxDLXPFRe8+X15vNq2gRmeCuOi7DAbAI+O+42Q5jJXXCBT93L/vF08UNODQhfJ
 jzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+7DEb22BEvtItehjPr9U48yd44UE8dUIQpK3BIdDZE=;
 b=A0l/PEyKfbj7TyiFKGlQhZmvlnDAaEikLf2uv/wJkYZoxjpBT0GilzBrwLY/kkrtBw
 fM2SqWA+jOJirLOUmzTSOBGCVmhNxXhpiEiQPcw90MbCzLHbONnjxtwuSeyAz0MapLfw
 rgMkv7yCEAIzRWYCcIXbEqtqzMIZ+y4onAzf6jPbEA4V5oVnTwZ0PPBDnilZuto1evtB
 BVTJ1HFD0VQnWkHyyQFGV1wXWstJavYNGmHXZtpzAP1+rIu0//gLNrB5azx4G/rFv+VZ
 dnR137427znEIL9megC2IJ7OLtA3jTjabyJ8zb3Es/Ta0/NQNEuEoCu6vJHDQvWj8uW4
 a7TQ==
X-Gm-Message-State: AOAM531RRMSD805QTdVty/EB8TmV5rozMyAS9cNMT6GvJ4WwI95zfVWm
 r77NohQHnVBIu0ojEQUnK5QbvF78YHolNUxgqVwxYXmd+go=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr12411647edv.100.1622560926058; 
 Tue, 01 Jun 2021 08:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jun 2021 16:21:35 +0100
Message-ID: <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 48/oA2wQ2zUa

It looks like you didn't get any responses because something went
wrong and your email never went out to the mailing lists.
I only got it because I was cc'd directly. I'll try effectively
resending it like this to see if that works better. You might want
to check whether the mail server at your end actually sent the
email or if you got a bounce mail or something.

thanks
-- PMM

On Tue, 1 Jun 2021 at 05:53, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Ping?
> I'd appreciate any comments.
>
> Best regards,
> Shuuichirou Ishii
>
> > -----Original Message-----
> > From: Ishii, Shuuichirou/=E7=9F=B3=E4=BA=95 =E5=91=A8=E4=B8=80=E9=83=8E=
 <ishii.shuuichir@fujitsu.com>
> > Sent: Wednesday, May 26, 2021 4:57 PM
> > To: 'peter.maydell@linaro.org' <peter.maydell@linaro.org>;
> > 'qemu-arm@nongnu.org' <qemu-arm@nongnu.org>;
> > 'qemu-devel@nongnu.org' <qemu-devel@nongnu.org>
> > Cc: Ishii, Shuuichirou/=E7=9F=B3=E4=BA=95 =E5=91=A8=E4=B8=80=E9=83=8E <=
ishii.shuuichir@fujitsu.com>
> > Subject: [RFC] Adding the A64FX's HPC funtions.
> >
> > Hi all!
> >
> > I'm thinking of implementing A64FX HPC extension in qemu.
> > A64FX [1] is a CPU developed by Fujitsu that implements armv8+SVE.
> >
> > [1]
> > https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitectur=
e
> > _Manual_en_1.4.pdf
> >
> > A64FX is a CPU developed for HPC (High Performance Computing), and HPC
> > extensions [2] are implemented to improve the performance of user progr=
ams.
> >
> > [2]
> > https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HP
> > C_Extension_v1_EN.pdf
> >
> > The details of each function are described in [2], and the HPC extensio=
ns
> > include
> > 1) Tag address override
> > 2) Sector cache
> > 3) Hardware barrier
> > 4) Hardware prefetch assist
> > are implemented.
> >
> > The A64FX has been installed in systems such as the supercomputer Fugak=
u,
> > FX700, and FX1000, but since the A64FX functions have not yet been
> > implemented in QEMU, we would like to be able to develop programs in QE=
MU
> > to use the HPC extensions.
> >
> > Currently, the register specifications for the HPC extensions have been
> > published in [2],  so we would like to implement these registers in QEM=
U and
> > make them accessible.
> > Eventually, we would also like to consider a mechanism that allows HPC
> > extensions  to operate within the scope of the published information.
> >
> > We would like your comments on the following points in this RFC.
> >
> > 1) Is target/arm/helper.c enough to implement the register (ARMCPRegInf=
o
> > structure) of HPC extension function of A64FX?
> >
> > 2) Is it OK to specify the option to set the HPC extension of A64FX as =
follows,
> > for example?
> >
> > -M virt -cpu max,a64fx-hpc-sec=3Don (*sector cache function) -M virt -c=
pu
> > max,a64fx-hpc-hwpf=3Don (*hardware prefetvh assist function) -M virt -c=
pu
> > max,a64fx-hpc-hwb=3Don (*hardware barrier function)
> >
> > It is also possible to implement something like -cpu a64fx, but since w=
e don't
> > know if we can implement it immediately, we assume that we will use the=
 -cpu
> > max option first.
> >
> > Since there is no example of A64FX function implemented in QEMU, we wou=
ld
> > appreciate your comments before we post a patch.
> >
> > Best regards.
