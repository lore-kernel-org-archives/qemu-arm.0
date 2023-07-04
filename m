Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2993147ejy;
        Tue, 4 Jul 2023 08:44:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48wClGEzv2dDP6n51yztq5FWqSKJ4zULCFMJxo693N8UlSGHYN4/iYh812csc5w0ouUnYI
X-Received: by 2002:ac8:5948:0:b0:403:3b39:45a0 with SMTP id 8-20020ac85948000000b004033b3945a0mr20480492qtz.33.1688485499294;
        Tue, 04 Jul 2023 08:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688485499; cv=none;
        d=google.com; s=arc-20160816;
        b=nnRF1APxJE9hOt/u/vYnnldgnKCXNeeBLJ81ed+/ZufpbIuJhIzsPmUAviIh3E4YTZ
         J4/j0tQ8LX46edjpstHleL9lYUtmwXafkScVmPZcU27wwVlH7hzqMWZVgbIyN3ULFr3P
         RL3xzILD19htDAo0n4xOl4u53Rla3IohTfH5kz0hPgsOiGwi6Z5+FT3iSVPpSV/4qUwG
         SjcsakLtwbBZOKM+qiASnw5ZHPKpu5hXZKH+UVxs5JuaF13bXIDoFPUhOhyl/M49eJPt
         S3mpZdZ/JLTqipvbLUw+dgBPnvddbnRmBMxq1fCIBMp32pPXuLoWY+l0n6wQuezDkqoW
         9GaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2n43NzrRMUeCvFkdouayT6vAz0ieP1Csbq1cNy23Ha0=;
        fh=JV3lXTziiMHSbHe4zrFeY2HQ133VPWTvOvCsimM7QpA=;
        b=SEEMZ8t2GrLoAaQNVDINMrDX93gdiUf3aE93PB1xW/N+z3eoPfZVU9QP5gp41Xjt13
         oBO+0+sxVVHit2xnciIsaFKitCpSbtOyOxcpwg8mWK4AQ473uof2GQxesFSXw+Pr5H7D
         cIedwTtnQjk56hIftAGe5NMJlYwMCBqtjmRpqf+yuqqfV9XLnI2PqOWDoGFsFWUIdie2
         lfPIYMve+raR0TGW8IuHZ8jEWRStG2Tlc6jO1KttcPJuVAJevGYhxdWhmPAe43zqOME1
         kQhoaAnAJhyiNoT7AAmoEFqZc6cPs/rQSdmlMx7ipYRX2K0yJM6WRsCkZoeSicIX+vGi
         DRmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZWOlHnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05622a145100b004036e610f2csi1125686qtx.44.2023.07.04.08.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 08:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VZWOlHnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGiCz-0001LP-Q9; Tue, 04 Jul 2023 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiCy-0001Ky-C9
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:44:52 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiCw-0006RD-I4
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:44:52 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so681351e87.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688485488; x=1691077488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2n43NzrRMUeCvFkdouayT6vAz0ieP1Csbq1cNy23Ha0=;
 b=VZWOlHnhKARRv8p24Kl0p5WFsE4Ksc2xr1e89m+0UhlLrBINr9EpN1SSZr3rlWv+CS
 ygzOnMr5Mj7IT8jbr36caNzRAjF80pVNi40mbexDyk0RpO7ngJvW4JuZnzmmtb2v9jOB
 2DOZdBsDJitr8V8TRIXyC+15SS2fXIXQW/aQhBQMHg6Y1i1WBzfwxdRDj/2R8NwdxtBI
 1VUCMDi6V1DUfdyau/wBkohB6ESmDJlSj06h3kcfgAyEyPp66qZ1acmyZbZn1tmAWJIK
 aABi0tDI2cjhONnpnsR4pgfR7/1p8m1VWqkpOWk/XS0rS1nu/AI4SJKnaMZLIwQanf5Q
 1BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688485488; x=1691077488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2n43NzrRMUeCvFkdouayT6vAz0ieP1Csbq1cNy23Ha0=;
 b=REWvwtn6Mm8kcm9i7MCshzMmzOrGcwUrGU9RwqRPu7/E3v1rNyyjZE4etBdI73viM/
 jMQopUSAnnVXTVIkm3M484lYplaGq+xQItODwzLO5ks2FAMNPpUL3V1k6GCOGj74HWk4
 gBeseGdp7vjpfaDEDjPbmqFDq1uYYXS0dp330WD6Lzd6Lk7l8Jf9w9Gr0dfnHwT9qdXX
 JZ+QlVxj8ILMgEER7ZQ+VNrKrRvuO3NNz9vj7lSlrEimKM0DSH5XhhJNBB4MpKfcrPWB
 fanDpPiBlK7nTJc2bEqrKUz0dh7ktDZVwJ2i2eXHli22TAqdSc9mOUlphcDYdi3KJoRG
 jFSA==
X-Gm-Message-State: ABy/qLbNFMCV/e6xMTvuksLItaJLqyylYMqay8lMZ4cpXuB14cBSko6t
 7cPmZlJOn4vqpLnAlgPX9Z3hqM8ZhsbB8cDrkdBZAg==
X-Received: by 2002:ac2:4f0e:0:b0:4fb:8bea:f5f6 with SMTP id
 k14-20020ac24f0e000000b004fb8beaf5f6mr11057784lfr.34.1688485488627; Tue, 04
 Jul 2023 08:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230628164821.16771-1-farosas@suse.de>
 <d8f954dc-8a69-7593-716c-e360d2c8e47b@linaro.org>
In-Reply-To: <d8f954dc-8a69-7593-716c-e360d2c8e47b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 16:44:37 +0100
Message-ID: <CAFEAcA9QSS7qs2kcCuyrDrRc6tb_0euMD3vFJ=_Q8s8dJYBRfw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Nl0Ql1jyDs82

On Tue, 4 Jul 2023 at 16:21, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 28/6/23 18:48, Fabiano Rosas wrote:
> > This code is only relevant when TCG is present in the build. Building
> > with --disable-tcg --enable-xen on an x86 host we get:
> >
> > $ ../configure --target-list=3Dx86_64-softmmu,aarch64-softmmu --disable=
-tcg --enable-xen
> > $ make -j$(nproc)
> > ...
> > libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sys=
reg_ptr':
> >   ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_p=
tr'
> >   ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_p=
tr'
> >
> > libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_g=
db_get_m_systemreg':
> > ../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_contro=
l'
> >
> > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > ---
> > This is a respin of:
> > https://lore.kernel.org/r/20230313151058.19645-5-farosas@suse.de
> > ---
> >   target/arm/gdbstub.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> > index 03b17c814f..f421c5d041 100644
> > --- a/target/arm/gdbstub.c
> > +++ b/target/arm/gdbstub.c
> > @@ -324,6 +324,7 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs,=
 int base_reg)
> >       return cpu->dyn_sysreg_xml.num;
> >   }
> >
> > +#ifdef CONFIG_TCG
>
> OK.
>
> >   typedef enum {
> >       M_SYSREG_MSP,
> >       M_SYSREG_PSP,
> > @@ -481,6 +482,7 @@ static int arm_gen_dynamic_m_secextreg_xml(CPUState=
 *cs, int orig_base_reg)
> >       return cpu->dyn_m_secextreg_xml.num;
> >   }
> >   #endif
> > +#endif /* CONFIG_TCG */
> >
> >   const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname=
)
> >   {
> > @@ -561,6 +563,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU =
*cpu)
> >                                arm_gen_dynamic_sysreg_xml(cs, cs->gdb_n=
um_regs),
> >                                "system-registers.xml", 0);
> >
> > +#ifdef CONFIG_TCG
>
> IIUC tcg_enabled(), this guard shouldn't be necessary; if CONFIG_TCG
> is not defined, tcg_enabled() evaluates to 0, and the compiler should
> elide the whole block.

IME it's a bit optimistic to assume that the compiler will always
do that, especially with no optimisation enabled.

thanks
-- PMM
