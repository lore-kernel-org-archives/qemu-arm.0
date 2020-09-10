Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1620540lfq;
        Thu, 10 Sep 2020 13:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiNcxV1O6RoTuvaK22W0jZrfxlmlBDzPez+eAQUD/IUYtiKLQr5abYgRhTRgXZDTWlSOF6
X-Received: by 2002:a25:5557:: with SMTP id j84mr15804371ybb.461.1599768406395;
        Thu, 10 Sep 2020 13:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599768406; cv=none;
        d=google.com; s=arc-20160816;
        b=rNJa1+teDZxUnhwQK2qEdEapE4oHG1GDd0llItxQKFRFtCKasItxqNZAm99dAIpT8z
         HV1wNQ2KpKXCh5+gUN5mAKFAXAmIGZ/lOTDoBvSb0MBfNSXzMmWiVhAYhBk3zJPkmsAK
         Z8n9H6dH7KqH5pjO4FUlSKP2K+W/zPd7UHMSTVTyCFwT0f+Dx5nVZpo7SqHkm8ZggduL
         +HanCdE7AltYXg4sbeHsq7rmRN2ZMH7u1EZd+J4MUhOlRiyKL4DIsy0v7/fPS0HbWdzn
         Q957LiDlt9AJ3r1MTLVlMkTBH4GXjRvwtozWpUTOhXdbS+nhHLrq5eb1kxX+3axsFCTt
         RL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9NhiAReKM+Boa40DXauFZF0PCmjlLggPNc6OR9kLVYU=;
        b=YP9ID/lDZSF3/Fjm6j+15wzV2HaopqhoTrurWaJN0WTq6zFYrLiqW96gX6+txsTClY
         nU956bBP2/j4GcmVWgfTJ6eIMqx13PJ0imMBrUpe81O0YwMaqiucVeduNTlWDg3KBOWc
         hYFRYi1dG+NOt3YgrhFmgi+69G07oe0T18BmdasCy2wk6JoivPu0bADHjK1lS5I2Dyfr
         W8m03OUyP6pfudlzHqc7FLOazyMBtquAUr32KlktrlHn/FyJAuFsANcIVPxKIsxcHOQi
         XSEnits2IWygJy0oCRkM8fC7sh+XWJeUq3+5jxnyL5XLczLETtvuVkUhZ51BeUfQyNtE
         LlPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BN6aMHne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si6203132ybl.460.2020.09.10.13.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 13:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BN6aMHne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGSqD-0003e2-Q8
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 16:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGSq4-0003cs-UJ
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 16:06:36 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGSq2-0002qW-R9
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 16:06:36 -0400
Received: by mail-ed1-x543.google.com with SMTP id q21so7658800edv.1
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9NhiAReKM+Boa40DXauFZF0PCmjlLggPNc6OR9kLVYU=;
 b=BN6aMHneys58jIZjfzXZZf4Tf6jQQFGBoBBBSd63ZSzfOKBrvIMNwEjJw/iATR+0KW
 ro53YHsv7slhZ1vYLVAz7f+Fg4Ck3dYKUry+oWZhgdnpw7omByXX95HPCP8Tu9FpfrB2
 8D1wObht9HnAmkfM410aQOTTlvSUPbFKVvv15nwTKlccuPsATuOKa4O0ceD2NGeslwTT
 3WnNqQcZItM1B+UmsL4HLWPWxwUmV8ix1b2yBdBb/LYIj7u30EhCmM7X5FDShpEmnJRe
 OSHtZv2SvrPKq5Pk9D2z88AEj906aLqpEuLb+zO3oTN9sD+ATwoSX4k70qN1XGWStiXZ
 j1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9NhiAReKM+Boa40DXauFZF0PCmjlLggPNc6OR9kLVYU=;
 b=E7N7UkXIuiTZnn3li2NNKqbbbwRIw9vR9mwFO/37a/wsnIiIyDw8We0BLJ3IoHREch
 kYQGAZMvrrPqcuFykSl1o1lGex38C3nFEzVSBNTX7KrqtnZTwSVfh7Qn7RlDmT5b5yb0
 dKSfzlm45g0ZDQvVA3dS3VyVLrz1sxLH+gC/mBUZR/C2EVUF/qtdlOFP8uJPTPAJRq0T
 j+afCZGkGTkTuPEPWQmwcFb+uJqJwOlL7A24npbjGJPYpUUSPTeIkXmgXdDl4s42tVbd
 /1E8b7tlJ67Fo+ydzCOeaeDInKWwd4PJuHbVCGNH9EgnDcxvKyY1/Jzg89GpbaSX5F1P
 HmhA==
X-Gm-Message-State: AOAM532kSF3UvwDYjyQkwP729G9+2Pi2ieCiqRVEHiBHHVzESfen72gm
 mu2GmSIZSbyH0NA/DmGO/rSga8/gfNCsG8+/rxZt7w==
X-Received: by 2002:a50:8f45:: with SMTP id 63mr11562568edy.52.1599768393227; 
 Thu, 10 Sep 2020 13:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200903202048.15370-1-peter.maydell@linaro.org>
 <20200903202048.15370-3-peter.maydell@linaro.org>
 <29d7a1aa-7289-dabb-db3a-7bc5324d297f@amsat.org>
In-Reply-To: <29d7a1aa-7289-dabb-db3a-7bc5324d297f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Sep 2020 21:06:22 +0100
Message-ID: <CAFEAcA8dMgyOoyLYweb5cSCEX3QnHKZXwa+_hoiK9VTJnZHydQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm/mps2: New board model mps2-an500
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kumar Gala <kumar.gala@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zwJIqkTsihVg

On Fri, 4 Sep 2020 at 14:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 9/3/20 10:20 PM, Peter Maydell wrote:
> > Implement a model of the MPS2 with the AN500 firmware. This is
> > similar to the AN385, with the following differences:
> >  * Cortex-M7 CPU
> >  * PSRAM is at 0x6000_0000
> >  * Ethernet is at 0xa000_0000
> >  * No zbt_boot_ctrl remapping of the low 16K
> >    (but QEMU doesn't implement this anyway)
> >  * no "block RAM" at 0x01000000
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The AN500 also defines some behaviour for CFG_REG[2567] in
> > the SCC (QEMU hw/misc/mps2-scc.c) but none of it is anything
> > QEMU can conveniently support so I have left that code as-is
> > (a guest accessing those registers will hit the LOG_GUEST_ERROR
> > case for "bad offset").
> >
> > Tested with a buildroot image created using the instructions at:
> >  https://community.arm.com/developer/tools-software/oss-platforms/w/doc=
s/578/running-uclinux-on-the-arm-mps2-platform
> > and the "arm_mps2_CM7fpga" defconfig; QEMU commandline is
> >  qemu-system-arm -M mps2-an500 -serial stdio -display none -kernel boot=
.axf -device loader,file=3Dlinux.axf
>
> Maybe worth adding in the commit description.
>
> > @@ -143,13 +149,14 @@ static void mps2_common_init(MachineState *machin=
e)
> >       * tradeoffs. For QEMU they're all just RAM, though. We arbitraril=
y
> >       * call the 16MB our "system memory", as it's the largest lump.
> >       *
> > -     * Common to both boards:
> > -     *  0x21000000..0x21ffffff : PSRAM (16MB)
> > +     * AN385/AN386/AN511:
> > +     *  0x21000000 .. 0x21ffffff : PSRAM (16MB)
>
> ^ Actually this belong to the previous patch.

I guess so...

> > -     * AN385/AN386 only:
> > +     * AN385/AN386/AN500:
> >       *  0x00000000 .. 0x003fffff : ZBT SSRAM1
> >       *  0x00400000 .. 0x007fffff : mirror of ZBT SSRAM1
> >       *  0x20000000 .. 0x203fffff : ZBT SSRAM 2&3
> >       *  0x20400000 .. 0x207fffff : mirror of ZBT SSRAM 2&3
> > +     * AN385/AN386 only:
>
> Ditto?

No, this part is fine: at the previous patch it said
"AN385/AN386 only" for both these ZBT lines and the
parts below. It's only in this patch where we add the AN500
that it has to split into the ZBT lines being 385/386/500
and the remainder being 385/386 only.

> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

thanks
-- PMM
