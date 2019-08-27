Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5333396wrs;
        Tue, 27 Aug 2019 07:48:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyi7vSi9dRKkywbo9BWTYwMH7ZJnseSnqF5Iq6Q2VhbFBEaG+hWF7hKsE+feTZQpkj7u5+f
X-Received: by 2002:a05:6214:11e2:: with SMTP id e2mr20335562qvu.82.1566917334680;
        Tue, 27 Aug 2019 07:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566917334; cv=none;
        d=google.com; s=arc-20160816;
        b=du5DZ5w5V5jQQOUtZi96r0ptqAbuMO1+ZfEu0fmTitTZ8wy1YtrVoL7roIXQOC9/B/
         rNqhd8FNvPNVEL+aJiaxuL6fx5POtFV9+Kh1smi50IIe3gWzqgVAsN3yjWDCjoU00ZCA
         PXmSg4w1BOtIFKCHm8swisp5GZE2EFqKyqIOHHfEMjB/Y4DyW7Fmml2LO9wTi2B3WhpC
         1TIRUcPTOdRqqEytuFGMO9gyKrFrOTgSPz6xBDFmRLpcAdI8ZDRi0zkQWDIUePo0Xw5m
         GPenVLlVD/MLPF7YGc3JAYEJx7CYPIlwdmMup8v2xOGLtBlKQ+3GsmQn0Ti7xku26qM8
         RnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lW+YK6SnMWC3ZEnbo6JUkf1RfG9JQUesY/CuxMgaErk=;
        b=BJELN25LZ0P+KdWVsQHP6g4SgJ/+x6JafwS3Cfi9q1i6Zt0M7qvUOOWb8jZw56BSFz
         kiBdBgI5xZIRYbz3aCX8UAllgA14yyFYHOLEYaqT0PRcjHTeQhNj3aK8Ap2FBGlx4JKW
         Ox4r6mxGx1Xndjf7hNwIGFHC0+3Pj960w2A8dzatpVZ9jF3y5DzcADYeF2pdVRKltzYc
         JjACI2HmKdj4WFY0UfvG2mD5K1dEvlgs8n4siyuByTMIh3Tf4x3mPK5BTFeXUBM9R5fp
         lXF8bkpyY6ntOV0NnMcZh9sr1VRZzIqs7KBl1Lnjc1Ndag5Pm7AgC7nanTgO1qdkJOX3
         PjMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OE4SX5eg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si10227438qka.158.2019.08.27.07.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 07:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OE4SX5eg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2cmD-0005T6-Tt
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 10:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2clZ-0005RH-FX
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 10:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2clY-0006jw-7m
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 10:48:13 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2clX-0006iD-UU
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 10:48:12 -0400
Received: by mail-oi1-x243.google.com with SMTP id y8so15132004oih.10
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 07:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lW+YK6SnMWC3ZEnbo6JUkf1RfG9JQUesY/CuxMgaErk=;
 b=OE4SX5eg2GNwwgbpt28iFBfILUagA+sAQOzC012wB//3L8aNkHOqvBgqFZSVrh4RIE
 VbzCJ1JN9lW5mL/x7WE7UE+sFsLpoRT17yquTLFFv+HVxeb2lerHL7gAWJ/c0QeF9XDL
 kC4dbgUfeY1zB+61Rc43ahdZSOvo1vK2dKehD0d9tFwkzHn0bsI5x3BePfOrX8GpsZXx
 SYGSxSzawaC6as5LhmNBUETe7ov+5R/JfJQDHHQncZBlteJqyTZQv202CCqUEb+DMjsK
 fBWyYPw2JCWvsyX0+14WwflPf2MwWx7qkDdEuLZ3nFahoPT1UoQgSox5k7y2cEUk1ven
 1rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lW+YK6SnMWC3ZEnbo6JUkf1RfG9JQUesY/CuxMgaErk=;
 b=cFMeIoS54e5Ef5u/OeWz2eZqYEqF4va47K3usQYrIFchwcCGxnkMCm8JHiJJ8nFrbY
 2aVGm49NQIQxDHf1aDHJZi4PVnoEzVuyO5DrTt30KhY5lo1RtLrLeGqwJYek1iuCaM2L
 yAR/IJYkHiccu90IoZHmLZlnleU0q2F/prawrS3YlLp75CQRS7HAfIEMlgd/v28XOCiQ
 LoJXdaU3Zdxw5mtbWDS37LShI9vKWo40EavN/TMzdDQohFgoDDPb5Ms1qLPKFGgK6rsz
 VD7wPzXKNcPLIYWY4yA8VVpxPsKabdZKnDKHFidESxxLtFwwVLAeE9hSUCFPWDhglH4N
 uqFQ==
X-Gm-Message-State: APjAAAWbNwXwKTOxH2okqM+s54TytbpDEuEACJp5h115lk95hfiz5W2E
 sldOVlPYMJzSaebuOKYnrQRgRdC5xPh0Jo6YvvJTnw==
X-Received: by 2002:a54:4718:: with SMTP id k24mr1012227oik.146.1566917287301; 
 Tue, 27 Aug 2019 07:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190816125802.25877-1-peter.maydell@linaro.org>
 <20190816125802.25877-2-peter.maydell@linaro.org>
 <750250d4-e4a0-43de-add5-24488b87cfea@linaro.org>
In-Reply-To: <750250d4-e4a0-43de-add5-24488b87cfea@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 15:47:56 +0100
Message-ID: <CAFEAcA9VoFNSLmPgosPat4GAyC50uDq7aeUeyvZ7D_1CoEHRoA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] target/arm: Allow
 ARMCPRegInfo read/write functions to throw exceptions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H35NEhTJM1Qi

On Sun, 18 Aug 2019 at 07:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/16/19 1:58 PM, Peter Maydell wrote:
> > @@ -1729,6 +1729,12 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
> >          tcg_temp_free_ptr(tmpptr);
> >          tcg_temp_free_i32(tcg_syn);
> >          tcg_temp_free_i32(tcg_isread);
> > +    } else if (ri->type & ARM_CP_RAISES_EXC) {
> > +        /*
> > +         * The readfn or writefn might raise an exception;
> > +         * synchronize the CPU state in case it does.
> > +         */
> > +        gen_a64_set_pc_im(s->pc - 4);
>
> This will now need an update for master, but otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; applied series to target-arm.next with this squashed
in to handle the changes in master:

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b3053d3fb89..4d09ae6f424 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1719,7 +1719,7 @@ static void handle_sys(DisasContext *s, uint32_t
insn, bool isread,
          * The readfn or writefn might raise an exception;
          * synchronize the CPU state in case it does.
          */
-        gen_a64_set_pc_im(s->pc - 4);
+        gen_a64_set_pc_im(s->pc_curr);
     }

     /* Handle special cases first */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index adb97dc6a3d..78d93f63cab 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7197,7 +7197,7 @@ static int disas_coproc_insn(DisasContext *s,
uint32_t insn)
              * synchronize the CPU state in case it does.
              */
             gen_set_condexec(s);
-            gen_set_pc_im(s, s->pc - 4);
+            gen_set_pc_im(s, s->pc_curr);
         }

         /* Handle special cases first */


-- PMM
