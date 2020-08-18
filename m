Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3820412lfy;
        Tue, 18 Aug 2020 06:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+wwK4nWpv4mEKRJfdOmNngCgF4Zcqnhbneee1pGAm/o2crwQNXg8iveN2Sn0U4ToK7wrK
X-Received: by 2002:ad4:414b:: with SMTP id z11mr18314955qvp.116.1597756655555;
        Tue, 18 Aug 2020 06:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597756655; cv=none;
        d=google.com; s=arc-20160816;
        b=0FKvwMwH4D9H8Euy9qr31zQAU67KA33/mTV+RU/8jGrPOdnbjFw7Gcq3vE7/ohetNI
         oFG7G2+99KubzeINE8rFOrtle/SAInho6TNy+ZL8PDdXcP/0KUhM+ErX9dJYkJZxxKv3
         5TNzYt6lq1u//PO9RqrzxcjqDnrsbUJ8QJjUOnNNLGZMdEfCzCUs1NFCfZfcUuUaby5d
         pe3fTH7FNbvfR8Zyqy/Xbf+1+LXJhNYdryU5SYziR8yktNoFyZi+oB4i5r1Kh0lqJXbl
         BaUr2Zzwz3+ukMfwgr7F0wgWfH3yuSI4RZ85ZBaLAqSLB22SoduK0B9HWW/Dys3QcZb6
         C/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=xVgiVQT4meZsJA6dUXCt2oqxH2/uRmNdpjpHuyFpQlc=;
        b=TAwWBu/Lwc2kxTt9aTfEzzps9f8Q2hmtVKCCms4505s0PJ3mz4/5OjwrF8DiwnFPd9
         PwrhGDw3KdGOIRSMIOkMYHFNfhDL/A0ujy1vKlR7V+SLMDFtAVSJ6icN6OSMAD22Yksy
         uVyyncInb5sDIr7U3G/lWbhnEyX66My8UDeezUv+ek3rR4Duun9RIQZeNTMTiuMeMXtk
         jOkfbKRm8Rpo5gWbp/LCu3caAmegrKlK2xkCnWHh5IjQcOjWb9nLswYeY0mwLLe39arg
         Ye5IjkqivpagjoefAhe69ckYahkNsU9lW5RN8B+PeasPSQKl1XkqogXgnTA6/EKgjTOB
         1V7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b="DEDO4oD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si3671169vso.223.2020.08.18.06.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 06:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b="DEDO4oD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k81Uc-00054i-Pn
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 09:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k81UU-000530-I5
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 09:17:26 -0400
Received: from sonic314-13.consmr.mail.bf2.yahoo.com ([74.6.132.123]:40398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1k81UQ-0000YF-TK
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 09:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1597756641; bh=xVgiVQT4meZsJA6dUXCt2oqxH2/uRmNdpjpHuyFpQlc=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=DEDO4oD/2GltOO96Fc6eJDeWhlK53e1KTf6NZMsy0aZxBn9ogUZnH2XIF4yI+JEDOKqSE5RTaciBDGUiE/5PztI1PcAiS7g05QCcLZx0If0SP78akbrnxKko6IzeA++/tPnBzv26Nyy+Vsb+nSxGWVJpUEFDl+Sgl5ByPr9KUzqX4MiiEJ3u0rCfjFrpRzP5WnPhFPhOkuKO1GWO7AA3/RqGcPkHuSVh2dF6QnUZT3zzE4ehsRfkpTBWV+Fh57qTbyKkx7JJBZpgd6taFjT4upWekSfr27EMqWsPcXy11NCc/sHaFzt2kLd1xQ4TQgjWxrII6/O9kltWw+f9hRg18A==
X-YMail-OSG: 7bKp_GgVM1lJ43G3nPBYhwmaWZ4RmmJbfk4xoprXj38w3J2ka2JQnunlhxeyROq
 5ExPVq0b6_DAae3YUNYObzsfYHj_p0y4rVg_8wM_40xdM7Q_WUREzvL5MUGSPHbJcN0acbP38Lax
 ZXrt33QEd.tN7Mab.x__9Mpx_Whern1gxD_byZQHL8FZFdkDEy89HOb3bQ2nX6rNEFw3RD1bXtus
 x3Rx6gEXMwNwdGnczGxgYKKAspBnt1mxkhV1CceaWnLsmGDH0CEOtE01iJzXnap2ei_FvpPzqtv4
 QU_HvcXISdhEVAJo8aSvoVVpeE5XLb4y6ipdBJjWrAummgdSvqrq5gtTV39po5Sue4bQgFoSOKoV
 oYHUsfCrebDjj8mE6mIdnCBJY.JtTQO9HjwAfT2DPWqHXUZjupQCCZ264J.JxiOH2Pdrk3oW3y2K
 0D6hgf5_E0HbEDgB4Y2bOl3M5vXOThInWQFyzJYPNPUqCBHfPMDdBrQpY_J_NXB0EjR5pM8d5nD2
 DbvBBh1oBilT8ERrybUpJpaT7U.1BdCW2LSYAO3xxbvKcmDU1lk4h.RzF4VqMzI63f4PQCR0d6jj
 e_CAHzE8yBg97fWTL.1B1FFJvhJfcnP.mwoYCntr81Wdd94T9am5qiYrwFOgDaRtfG5wMAb8DoG2
 qc4RRgtP3moEM92DA4pxdo8tFDdOtzmMD3Cc8kuTCF0smFcOsG_9BJ2PXdZaXFMGOtmZBFXotxFG
 S8x.4aDCLY1sw4H5dty0KllRhf.ihS8a62yAyP7.kNScAgzIR3YOW__IbVi2c8QeD6YtH9B4ukqU
 pRAYn.vnGTP9oueLUO_gI.iSrYVoXHqhjmVPyzvuFVZS2IgdSV4UoTvxscDsWITiXuL4_maS78G3
 88qUo2E5A_7Vp64z4zfm3IJHtB0.XfZNhc37yWRuGf8Iv2MKbhwXaMg4AcIL0pNhS6w5ygA49rt7
 jntO1JhPdkyLP6eIDF2r6mPcRdAm3zL26OeD.OiD4xt1R_kVQfZcATGAoj6VluXV8nqhmucrz.Kt
 GnMU.9Bp6ZCWgtmHcqlxM.KiLf_EDGfcWMX7Xnkvcq0_LV_Drcga6pe_C4pRLMCxjEUu0KTds96m
 lqEE_5jM.mHrojHnMeCQEtDmN1qei.RaPo5gYBZvGbatvKIhR62aSg2MJm0yuG2TM6947FgYDtsL
 z2hf0p_bU8u4Kx8Dr.HmaUMV9qMXm2BgylOGXMgRkdZwbfdGHx_NMSFHflTTP1SfAUZpD4tPSHx6
 Xlr0.1LVwLQeAdjp4lJ0OuYf3vh_AdEKO9ZmU7oTrhs0P6bn0x4uyj6pCf51Vfpc5dcuRNQ7emsN
 ks5DvwrvU95bqgJeopKTNR.dFdw4tlK4iT_BD_93Yyqp0YODYJ29xjXjV4d9QzxuLdr.BjZphLQk
 PPeteOLvkDg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 18 Aug 2020 13:17:21 +0000
Date: Tue, 18 Aug 2020 13:17:16 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Message-ID: <2127347711.3710404.1597756636356@mail.yahoo.com>
In-Reply-To: <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3710403_477966817.1597756636355"
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125
 Safari/537.36
Received-SPF: pass client-ip=74.6.132.123;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic314-13.consmr.mail.bf2.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:16:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wg5TqPs9ytr1

------=_Part_3710403_477966817.1597756636355
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, the netduinoplus2 is not part of the machine list in qemu "QEMU emulator version 4.2.0"in which one is it?in the 4.1.0 version release notes it says "ARM: FPU emulation support for Cortex-M CPUs, FPU fixes for Cortex-R5F"
Now, is there an option to be passed to qemu to get the FPU working?

Mircea Cociuba"To be or not to be, that is not a question, it's FF". 

    On Tuesday, August 18, 2020, 03:56:31 PM GMT+3, Peter Maydell <peter.maydell@linaro.org> wrote:  
 
 On Mon, 17 Aug 2020 at 14:22, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
>
> Hello Guys,
>
> Currently trying to run some code that uses FPU instructions.
> Arm-CortexM4F core.
>
> Using the stelaris board with M3 core, but param M4.
>
> qemu-system-arm -M lm3s811evb -cpu cortex-m4 -m 8K -nographic -kernel notmain.bin
>
> How can I use the FPU in QEMU?

Try using a machine type that uses the Cortex-M4, like
the netduinoplus2. Usually it's a bad idea for arm boards
to try to specify a different CPU than the one they default
to.

thanks
-- PMM

  
------=_Part_3710403_477966817.1597756636355
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpeadfea0dyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hello, the netduinoplus2 is =
not part of the machine list in qemu "<span>QEMU emulator version 4.2.0</sp=
an>"</div><div dir=3D"ltr" data-setdir=3D"false">in which one is it?</div><=
div dir=3D"ltr" data-setdir=3D"false">in the 4.1.0 version release notes it=
 says "<span><span style=3D"color: rgb(0, 0, 0); font-family: Roboto, sans-=
serif; font-size: 14.6667px;">ARM: FPU emulation support for Cortex-M CPUs,=
 FPU fixes for Cortex-R5F</span></span>"</div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Now, is there a=
n option to be passed to qemu to get the FPU working?</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div><br></div><div class=3D"ydpeadfea0dsi=
gnature"><div class=3D"ydpeadfea0dyiv5090244957signature" id=3D"ydpeadfea0d=
yiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" style=3D"font-family:He=
lveticaNeue,;font-size:14px;"><i id=3D"ydpeadfea0dyiv5090244957yui_3_16_0_y=
m19_1_1484384922228_11431"><font class=3D"ydpeadfea0dyiv5090244957Apple-sty=
le-span" face=3D"'times new roman', 'new york', times, serif" id=3D"ydpeadf=
ea0dyiv5090244957yui_3_16_0_ym19_1_1484384922228_11430">Mircea Cociuba</fon=
t></i></div><div class=3D"ydpeadfea0dyiv5090244957signature" id=3D"ydpeadfe=
a0dyiv5090244957yui_3_16_0_ym19_1_1484384922228_11432" style=3D"font-family=
:HelveticaNeue,;font-size:14px;"><i id=3D"ydpeadfea0dyiv5090244957yui_3_16_=
0_ym19_1_1484384922228_11474"><font class=3D"ydpeadfea0dyiv5090244957Apple-=
style-span" face=3D"'times new roman', 'new york', times, serif" id=3D"ydpe=
adfea0dyiv5090244957yui_3_16_0_ym19_1_1484384922228_11473">"To be or not to=
 be, that is not a question, it's FF".</font></i></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydpe64b235eyahoo_quoted_8082171848" class=3D"ydpe6=
4b235eyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, August 18, 2020, 03:56:31 PM GMT+3, Peter M=
aydell &lt;peter.maydell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Mon, 17 Aug 2020 at 14:22, Mircea =
Cociuba &lt;<a shape=3D"rect" href=3D"mailto:cociuba_mircea@yahoo.com" rel=
=3D"nofollow" target=3D"_blank">cociuba_mircea@yahoo.com</a>&gt; wrote:<br =
clear=3D"none">&gt;<br clear=3D"none">&gt; Hello Guys,<br clear=3D"none">&g=
t;<br clear=3D"none">&gt; Currently trying to run some code that uses FPU i=
nstructions.<br clear=3D"none">&gt; Arm-CortexM4F core.<br clear=3D"none">&=
gt;<br clear=3D"none">&gt; Using the stelaris board with M3 core, but param=
 M4.<br clear=3D"none">&gt;<br clear=3D"none">&gt; qemu-system-arm -M lm3s8=
11evb -cpu cortex-m4 -m 8K -nographic -kernel notmain.bin<br clear=3D"none"=
>&gt;<br clear=3D"none">&gt; How can I use the FPU in QEMU?<br clear=3D"non=
e"><br clear=3D"none">Try using a machine type that uses the Cortex-M4, lik=
e<br clear=3D"none">the netduinoplus2. Usually it's a bad idea for arm boar=
ds<br clear=3D"none">to try to specify a different CPU than the one they de=
fault<div class=3D"ydpe64b235eyqt6209310267" id=3D"ydpe64b235eyqtfd62011"><=
br clear=3D"none">to.</div><br clear=3D"none"><br clear=3D"none">thanks<br =
clear=3D"none">-- PMM<div class=3D"ydpe64b235eyqt6209310267" id=3D"ydpe64b2=
35eyqtfd74190"><br clear=3D"none"><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_3710403_477966817.1597756636355--
