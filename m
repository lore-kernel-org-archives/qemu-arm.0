Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4169347lff;
        Fri, 20 Dec 2019 13:37:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLvCWKma0U4NGZTdpLStU81Fw1VuQaaTWmR0TnrDpTMckbzXj1qaNUxGCyhd79/RG099va
X-Received: by 2002:a9d:600e:: with SMTP id h14mr16603539otj.113.1576877868798;
        Fri, 20 Dec 2019 13:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576877868; cv=none;
        d=google.com; s=arc-20160816;
        b=aQQWlUS9e9GAr2xXBWG/4TRnEtQ9NHbNgUEBD1surNq0POf4nPKzJmWNDH3el2gmRS
         gTGnx4rSeDhmyH8h7qxz9vOnrE8Qf3H7gZF6htN26q2nbwKBKWIYiiQtNcwLJ3h85h5x
         Boy2aNlL5wyhTSctxyEg/HFcM3VBB+OWSm7pEbIFc4qWzzYCXm+uH1WnJwVT0X4Q9p1c
         8ODKZaILlT0Cw4BSpQeLQexEcm+fq1OcWHIHqjUQFM2/RHQ2yVktcEcnGV3WRB1oYgf3
         G4N9lK1ruV+2B27A3BGGMu02kEzjT2e6geIznyHvd81NBUHF9UQ4mysE9xS1h6C7z4Zb
         gtnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qaNduU8pI7n8V/CKKVcoUQRc3In0xX5bjD7Gmv/Y+hc=;
        b=KgQc9Jhkbd4CSyNN+rPqD+W8dl/5Dg+Y44A4jaPAkEKTgtwc8n1ArcP0zoDg81IFHx
         /lO+DLp+LnezWzEptQeYvKnN1bQXG9Z+wQ1L9TkMNtKGLNSfAX2zlXcYcSvWTMA9GqLR
         rn3L6bY+o0Rm+Zh8/iCajQfYZX43N2TGWi66zTVPq1ZmtKYIFimGHcf5ZkSaiorTdIQN
         E5wd1CNxK6zaYY/urI8WCx/QzIBR1L1P7TB1mcDHwmBeX5oc/GhMOU4WpeEbva4ZVHHI
         zMC+5wqt/tbNdOwsC3qt8dR+/jIrEVDHMly9CeG9zXWZWzpwG5olMIttxpiXlKBvjzU7
         YyWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ts5KbL8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si4391555oic.18.2019.12.20.13.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 13:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ts5KbL8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiPy0-0007Ar-25
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 16:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iiPx3-0006jw-7R
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iiPx1-0000Vv-W9
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:36:49 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33708)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1iiPx1-0000Sf-MH; Fri, 20 Dec 2019 16:36:47 -0500
Received: by mail-il1-x144.google.com with SMTP id v15so9189604iln.0;
 Fri, 20 Dec 2019 13:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaNduU8pI7n8V/CKKVcoUQRc3In0xX5bjD7Gmv/Y+hc=;
 b=ts5KbL8gyyQ/p5//AlI3tqSjROTPVziRDg2LpRLvJ0cF/ZZ/YsEInO9QpS3Y8gSZWT
 MSFrM7ic5tyXr/Zh2K36PRr1ZXbSrKkxeJOymhVuARIIFCLwi3lyJNV2M5pvkfzti9Jx
 6W1OOthh5u6HCUqFfnRdAbO30u5L5PkE3mkiGj/r+Bvn/RMeHtkZg9rDa2QCBH6Uc/eV
 jELaXUCnrxmKglNhFV4TwL+alSTV0XW9sdWNmxIxQiTWLuwSoogZ6qQhKX74iZ9lCtpa
 FTHkWcN/lIIavRhoznr/xYl9qOCZ0zHw4Dvouo9SGkFlcIFMTdxplym3H1HM/fDymVFD
 Y4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaNduU8pI7n8V/CKKVcoUQRc3In0xX5bjD7Gmv/Y+hc=;
 b=sDK0gy5tpFiL1TacigLwHVfrEnDIe4Dyge2kmye1Us0vzMNrCpeXsf76z0jGxcJSfN
 jS4+tPWM74fUgRnlRfoe0QSrDQ33U6HMKiy8iOxqCb2DpzmnaluN8e4QHkqyUNnWkhWw
 Fq10wIEZmHYNwRgE2nxzIL2Uz2FcwzcXRnJNj+KETeOFjz3CA0yqF+nZ/hPV0y344DLB
 hXzZcXiVBcNt239zQ+VigA13XR7ZFbx05PMOTJ7anDJNQGT0ESGpy5WWyy9gNkZdggfm
 9eS7BLuiv9DkrWLzcXisJMHtRCZ5FgOJknWKJEd3fRwxFbFZ3IexqMxGMVDaIIHoc34G
 LWDg==
X-Gm-Message-State: APjAAAUwt/pm0VS17Duqn5QZtXw5J7rf3xsxB9rcb99fB9MBvas1iFGL
 CljQsJ8HCdmjSVJTg3kRzlFaziUWTH0XoWtpgBQ=
X-Received: by 2002:a92:af08:: with SMTP id n8mr13914978ili.217.1576877803146; 
 Fri, 20 Dec 2019 13:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20191219185127.24388-1-f4bug@amsat.org>
 <20191219185127.24388-4-f4bug@amsat.org>
In-Reply-To: <20191219185127.24388-4-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 20 Dec 2019 22:36:32 +0100
Message-ID: <CAPan3WqzABfVmopUaCNkBxftZsZ=GR=Vts0qE_o7y81mP56EaQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] hw/timer/allwinner: Remove unused definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000004f9359059a297968"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5paQna+f662w

--0000000000004f9359059a297968
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 7:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Keeping unused definition is rather confusing when reviewing.
> Remove them.
>
Perhaps make it more clear that the definitions are unused IRQ defines?


>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/timer/allwinner-a10-pit.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/include/hw/timer/allwinner-a10-pit.h
> b/include/hw/timer/allwinner-a10-pit.h
> index 54c40c7db6..e4a644add9 100644
> --- a/include/hw/timer/allwinner-a10-pit.h
> +++ b/include/hw/timer/allwinner-a10-pit.h
> @@ -10,8 +10,6 @@
>  #define AW_PIT_TIMER_MAX        6
>
>  #define AW_A10_PIT_TIMER_NR    6
> -#define AW_A10_PIT_TIMER_IRQ   0x1
> -#define AW_A10_PIT_WDOG_IRQ    0x100
>
>  #define AW_A10_PIT_TIMER_IRQ_EN    0
>  #define AW_A10_PIT_TIMER_IRQ_ST    0x4
> --
> 2.21.0
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>


--=20
Niek Linnenbank

--0000000000004f9359059a297968
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2019 at 7:51 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Keeping unused definition is rather confusing when reviewing.<br>
Remove them.<br></blockquote><div>Perhaps make it more clear that the defin=
itions are unused IRQ defines?<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0include/hw/timer/allwinner-a10-pit.h | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwin=
ner-a10-pit.h<br>
index 54c40c7db6..e4a644add9 100644<br>
--- a/include/hw/timer/allwinner-a10-pit.h<br>
+++ b/include/hw/timer/allwinner-a10-pit.h<br>
@@ -10,8 +10,6 @@<br>
=C2=A0#define AW_PIT_TIMER_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
<br>
=C2=A0#define AW_A10_PIT_TIMER_NR=C2=A0 =C2=A0 6<br>
-#define AW_A10_PIT_TIMER_IRQ=C2=A0 =C2=A00x1<br>
-#define AW_A10_PIT_WDOG_IRQ=C2=A0 =C2=A0 0x100<br>
<br>
=C2=A0#define AW_A10_PIT_TIMER_IRQ_EN=C2=A0 =C2=A0 0<br>
=C2=A0#define AW_A10_PIT_TIMER_IRQ_ST=C2=A0 =C2=A0 0x4<br>
-- <br>
2.21.0<br>
<br></blockquote><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:ni=
eklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div>Tested-b=
y: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinn=
enbank@gmail.com</a>&gt;<br></div></div><br clear=3D"all"><br>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<=
br><br></div></div></div></div>

--0000000000004f9359059a297968--
