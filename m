Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1872316ejb;
        Sat, 3 Jun 2023 09:19:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pTeLW79MI1fnp+lEyoz1pFYBbhxZv6mJ/bCdEaJUq7NpgXofmT/M0Q+R14MQJXVfcs34L
X-Received: by 2002:a05:622a:288:b0:3f5:44c4:fbb with SMTP id z8-20020a05622a028800b003f544c40fbbmr2402688qtw.21.1685809186925;
        Sat, 03 Jun 2023 09:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685809186; cv=none;
        d=google.com; s=arc-20160816;
        b=W7e3N6WhOnqXBPdWoYsu9k2/7WvrOfuyLZxjJ6KyDoKruhyw7DR4OAeboaIriM1DYd
         jIm4HClX+A7NuaXCpCEkHYaXN+PmeW/yuBHVZ3uWlk2YTDnVpr4PToPhJHlzg+QQtwtp
         6QIFhSaHip7DA+AeixWPhY/ttx6ckP1vjvcbApbRUjW+5NseupceFEGFdky9ZNlrWGLu
         ym7HP+FpjLEzkB7TR2YAFojmatRGLauKVs1UAGW++q6qxU/rIAq8MAKYVdMzReXH4zwe
         hINl2bpUHJ+HXYJtveKJ0nXqMwF1AoAyLIKglKy49lbmlLX/D4hDEhUVHoCCsgxVH/PB
         7Euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VA+YzqgIpFcYLlBlrPTBzjLSYTAFBcz3KlXovQg/1Ck=;
        b=EAinEFPmh+liyM5EoMtBPuUKl2Or9RckQqusferbkBNgGF1oYHVaf26fK8TUAYoeO5
         ir7UdGACVWXciZ8TZ0TybDdrSkinGApJjUSVnlJ726S8JoSmrRp4FirUOXAX+o0IGMFa
         RbYwLC+orbeT5ypL8HoJJJ7AYO12SZHdkSM/1X8zF0PqLj92yFF4RZWf1u3SQ+I4o4T6
         3XihIgTfOC6oc4tuS8bpmKoBImRkD2unyTB5NcW1V6oH7oY21PiG2JPkbZ0JCmJ24jgQ
         TqDmtiDM9dBCtv7kyGDe1YSOBWR879zFEUQJ7P86pKM5Y9ccNUDnOIRWvTk8r2URvnQa
         82fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/Gobysv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a188b00b003f504ae15d3si2490740qtc.262.2023.06.03.09.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 09:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F/Gobysv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5TyL-0005nn-Pq; Sat, 03 Jun 2023 12:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q5TyK-0005lV-34
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 12:19:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q5TyI-0001I3-2h
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 12:19:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-514953b3aa6so4342246a12.1
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685809155; x=1688401155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VA+YzqgIpFcYLlBlrPTBzjLSYTAFBcz3KlXovQg/1Ck=;
 b=F/Gobysvdn/5F7VVB2LchhvihO0800bWOUMaNddbA/biLN2bu0miR3pdo/7/T3tz9F
 ffjv8Shuk5ByEG/dmpm77hNt3HId88n9XyCB4y4u4tWVgkqwf/1MOqv0iS2lewn82hNO
 lc7J6CsAmSPxR//1CuybniB8TIdsg9IlAJei/7ruji5nnyZm+d7a1dpYkD3l8f07C/5d
 2rpieyVH06YH9ZRomGaGunjBQYCz5yuZI3/GtxIwslJzbXqtQIbOOzvPUhXsplqdsn7A
 q5bTgHXfU18pUfnfw1dp1hyqYnqNn6Gg8uxXvWX5GhlhhUQyTBh6lQ+b6inI2dq8qKZU
 pssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685809155; x=1688401155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VA+YzqgIpFcYLlBlrPTBzjLSYTAFBcz3KlXovQg/1Ck=;
 b=i9goDKouwkgCoKv2mbecOsdcmptmJefVDqYX82g86PlCJ2rKwtVsOBWb/TnHJX/ZWI
 raLyozjhXM6XhiBnXKQR7JKsLKqCuBBNxhAItBrhdnbGvLNIDu20E8tN0yQPc/oCnxiX
 cFPhl22Yt1wCh6rEJw44hD83dlS5W6HylCmVMqbeN9k8z0swD94OOSyZfC/5KjTz1HZI
 asvuHwjKbyRn+2Fs4Hwq+aDJXTTxhdafw+qs+y0JdvJUPgUH02j1sLMwuUVxJvZXHrM2
 drctCr9pcv5FHikPOLUQ0uDWGXMShwomi5ixhsyEYTZCOOLMuw7uPZwpyb06BGdSbhNs
 N6ag==
X-Gm-Message-State: AC+VfDyOiv8xSQgpIRwAGUxpke9ZMXcG5wy8/YmRXxPefQHk5TcnL5GA
 5aKHDXuz0yxf7f5VKMlPi4NriVVmTcf5N7cG5AE0gmXKUGU/dB9v
X-Received: by 2002:aa7:df81:0:b0:514:af52:e49a with SMTP id
 b1-20020aa7df81000000b00514af52e49amr4004988edy.25.1685809155571; Sat, 03 Jun
 2023 09:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-14-peter.maydell@linaro.org>
 <13e60074-adc0-f3f2-e5fe-f48e6778cf04@linaro.org>
In-Reply-To: <13e60074-adc0-f3f2-e5fe-f48e6778cf04@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 3 Jun 2023 17:18:43 +0100
Message-ID: <CAFEAcA9mi0KxN5Ncvm-h5h0Ydjh1X6q2Xbq-9PtxSC2LdTtGDg@mail.gmail.com>
Subject: Re: [PATCH 13/20] target/arm: Convert LDR/STR with 12-bit immediate
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FcErAvsltugw

On Fri, 2 Jun 2023 at 21:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Peter,
>
> On 2/6/23 17:52, Peter Maydell wrote:
> > Convert the LDR and STR instructions which use a 12-bit immediate
> > offset to decodetree. We can reuse the existing LDR and STR
> > trans functions for these.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/tcg/a64.decode      |  25 ++++++++
> >   target/arm/tcg/translate-a64.c | 103 +++++---------------------------=
-
> >   2 files changed, 41 insertions(+), 87 deletions(-)
> >
> > diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> > index 4dfb7bbdc2e..c3a6d0b740a 100644
> > --- a/target/arm/tcg/a64.decode
> > +++ b/target/arm/tcg/a64.decode
>
>
> > +# Load/store with an unsigned 12 bit immediate, which is scaled by the
> > +# element size. The function gets the sz:imm and returns the scaled im=
mediate.
> > +%uimm_scaled   10:12 sz:3 !function=3Duimm_scaled
> > +
> > +@ldst_uimm      .. ... . .. .. ............ rn:5 rt:5 &ldst_imm unpriv=
=3D0 p=3D0 w=3D0 imm=3D%uimm_scaled
> > +
> > +STR_i           sz:2 111 0 01 00 ............ ..... ..... @ldst_uimm s=
ign=3D0 ext=3D0
> > +LDR_i           00 111 0 01 01 ............ ..... ..... @ldst_uimm sig=
n=3D0 ext=3D1 sz=3D0
> > +LDR_i           01 111 0 01 01 ............ ..... ..... @ldst_uimm sig=
n=3D0 ext=3D1 sz=3D1
> > +LDR_i           10 111 0 01 01 ............ ..... ..... @ldst_uimm sig=
n=3D0 ext=3D1 sz=3D2
> > +LDR_i           11 111 0 01 01 ............ ..... ..... @ldst_uimm sig=
n=3D0 ext=3D0 sz=3D3
> > +LDR_i           00 111 0 01 10 ............ ..... ..... @ldst_uimm sig=
n=3D1 ext=3D0 sz=3D0
> > +LDR_i           01 111 0 01 10 ............ ..... ..... @ldst_uimm sig=
n=3D1 ext=3D0 sz=3D1
> > +LDR_i           10 111 0 01 10 ............ ..... ..... @ldst_uimm sig=
n=3D1 ext=3D0 sz=3D2
> > +LDR_i           00 111 0 01 11 ............ ..... ..... @ldst_uimm sig=
n=3D1 ext=3D1 sz=3D0
> > +LDR_i           01 111 0 01 11 ............ ..... ..... @ldst_uimm sig=
n=3D1 ext=3D1 sz=3D1
>
> Why not use "sz:2 111 0 01 sign:1 ext:1", returning false for the
> cases not covered?

That would also catch the PRFM case (which is size=3D0b11 sign=3D1 ext=3D0
in your pattern); and it gives the wrong ext value for 11 111 0 01 01.

You could do more of the decode in the trans_ functions and less
here; but my impression is that we tend to prefer decoding in the
.decode file where we can.

thanks
-- PMM
