Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F9CD6E64
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 09:56:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUiKU-0003hz-Es; Wed, 03 Jun 2026 05:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elbeheri95@gmail.com>)
 id 1wUiKS-0003h1-NT
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 05:56:04 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <elbeheri95@gmail.com>)
 id 1wUiKP-0002B1-WF
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 05:56:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bec450b950dso475147666b.2
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 02:56:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780480560; cv=none;
 d=google.com; s=arc-20240605;
 b=KYmIjmKzcEnNMTCcnEXATjtpjxw5YxlL3ffyK1wn88nJB7Ztqh165q/FXdrT9nivcx
 ZZfOjla2ymZGDNaVG2jTRs7FV285N4nZZZJOemVqzz3KY4wCGq9kTBaSOTHTez0L5lHM
 26q2ShoqE3Scpp4IUJZApulSxRHlN8pBLRobyz8+z9Adwb14H0wHpjDBEfU4IJ19bVW2
 QRXHSAZwCsMH4m2i3GR4mLxNQgiYbEFC5p7ovktgH14qrrqatD+Tuk9F9rK47oeioQ1p
 wg+Ce42jy0qprsNI5gl/6FvVAluDXZz2TaGh81B39/tY3J+L6lbBiPR2Tm7+kqWyzaxr
 3EIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3wV6twA4OCb95UQgBelEdlWkyfr83KjFZrbYjSJx1pM=;
 fh=uZYz4g/1RDzBCyut8hTtusOhh8glTI4K40hq0WyLNV8=;
 b=d3m1EcyGNur6fBdKVML4EjNbPBTqw5ay1qsY3LBdtpF/X2HE4gTdG5JDYqaYsyrP/0
 FNOrc/2CSi6NDCl3V867khU3CTHogcyWkWWF2x5bO00BEsa9vS2WBLFmk5FRxa4ncg2G
 Yz+c0ii6p/IzKaRusGYLtXFzbt8njCkHs0rFWcg1fY4FQliR5YnSCTCMgIq2fGLk45xD
 CaxIIda6fOgtRcR02Avn6gA2ibMWTRpTNqj1nS3abdoVkieCD9Z+8F6aspgF2ROcpKrq
 NIMii3uJ2qUZeZo9wS8q7UJ4UmB5LJFjWtOsDMLS7KbbUgeKbtbmKx4kQNhmYMNKnaA5
 c6sA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780480560; x=1781085360; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3wV6twA4OCb95UQgBelEdlWkyfr83KjFZrbYjSJx1pM=;
 b=iq3V4sxrFCFtU2wlAZl2SG98Z4ov+pJv0iKW5j3xXxL7vIOr20e00NdQRyVYOa/YQY
 AzFIWaO7WE2dtyNxwgSdTOElQN9NXw5LpjIsfXZxRSWX7f1+DQ5KDIO99BNPQErJJnJb
 z6fncHq9Kpqlgrdt9hE0aN0i98cQOza5uPkdrFunuCC4ijE6LoYpwry5fSDAS++mWrCE
 jcY5NDNeBnvmVU0P+mdukZOiKSd0GAJ/Uz7DOrWHrS+1DjASQNE/qjU/avzstEfeQsOl
 LuMVL7tLI4ThYtYXwGgtJ/EQc69bG6CYQtGa0nTp/JE6coruPKAg+s2kxTNync0kwa7P
 zWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780480560; x=1781085360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wV6twA4OCb95UQgBelEdlWkyfr83KjFZrbYjSJx1pM=;
 b=CI779iPFXrbztFUoZ3rqBiSZ6bDL7vpWNdq0Kd/D5BMMNSCXiCsaNvohbk+SkDrHnM
 UuKppIRCCMbPGHqSOvKk68fjiwgIg7a5JMFi5ssrG0M/2Bdk0f5rz8Ym04G9g+XK84TD
 IL5O1p9n7ccE9EGUEATqGGd5Cf7t3D++J0NNYoAoG5LhOPpO/pZlaJCkHV7WINJfHdgh
 yAbf4ZEOUPUF/jJjeQhU6bq8uxya3yPNcB1ZP5B3fQxJxUysWtH2pEYrxkOP0mqLdgGQ
 galT+tz2xdOymVxEC9+L2VGHycu/yn9DU+s5618Ijo8ZmYcugTqgrVhr64qqkWbkmhx6
 THWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Bo9CHfVmGs7zeBkI8TpJEkKHBi7tXcQR8KH75KCsw5zcFXQfBUe+4LjmX6KAlHWKFBFDVC8ewTw==@nongnu.org
X-Gm-Message-State: AOJu0YypLyaEd/OIWCLzbP/btCNtphSVjGeENEEMx6X1AEEF/fOSpXMh
 excTCsZQ3n5ywH40HuQbdJr18pvJlaGcLfvs6BSbO8Z9kmSwAU8IRQQpXrjMsyVvKZdRyYhpUBL
 nqjZCAiGeg34WfPCVDR2mLaSeA44eai4=
X-Gm-Gg: Acq92OEOJ7cfu5PACak8sRxo5QKqldYZKWwMSnaepDhOs++T0ZdKVa0AOG/UX5iRkGq
 049YZvgo7YqjVnxrLLQTq2C11gsPuTGIxDYWJtyi3pXEjdySjD06aMSjPZbYYkKjIaEqJngbqyi
 F4SNMKZrqwASbXWgnznDLUTBAwhLG4jdqIbLrWvS+sxKTQu7lIhPQBuHCLEFZSk5OYiCTSDM1nf
 y+C9reP3MuTyWHEv5k6MTzSFcWHx7WjX+ws0O/hNzFjmJ4ckS9X7R7qUARaOfGsUgO5d4u3z/G3
 SguThBLpse5JaLkpo4RF+Mnbkvk1kVvC4NMrkXYEXyWl+WO03VM=
X-Received: by 2002:a17:906:c108:b0:bef:7481:8a34 with SMTP id
 a640c23a62f3a-bf0acf0f963mr123813066b.12.1780480559847; Wed, 03 Jun 2026
 02:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-enhance_arm_gdb_get_sysreg_performance-v1-1-f0a5b22003c0@gmail.com>
 <87qzmovrda.fsf@draig.linaro.org>
In-Reply-To: <87qzmovrda.fsf@draig.linaro.org>
From: abdelrahman elbehery <elbeheri95@gmail.com>
Date: Wed, 3 Jun 2026 12:55:47 +0300
X-Gm-Features: AVHnY4LC8AdouVdG5tBGga3mdrtijL-voLmUpiIkUv_XsXqWYcczRaW5FjbL0aA
Message-ID: <CAN1cRoO1HV-BU1bizHgaHpBBNGb7W_o-EOTDna_fWL6-8e-Vfw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: replace cp_regs hashtable lookup with direct
 array index
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004c9d080653566fcd"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=elbeheri95@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000004c9d080653566fcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks so much for pointing that out.

I am not aware if GDBFeatureBuilder shares the same lifetime as ARMCPU
struct or not. But noticed that builder object keeps a copy of register
object name pointer.

E.g. gdb_feature_builder_append_reg does

   builder->regs->pdata[regnum] =3D (gpointer *)name;

I guess if GDBFeatureBuilder is not destructed per core, won't this imply
we have a similar stale pointer issue (ri->name referenced at
builder->regs->pdata, and ri is freed) in the use case you mentioned?

But if it has the same lifetime as ARMCPU, won't this also imply we need to
call again the GDBFeatureBuilder append_reg method?

I will try to read the docs/tests or try any examples that do this struct
re-creation at run-time and test the above ri->name scenario.

Thank you


On Tue, Jun 2, 2026 at 7:28=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:

> Abdelrahman Elbehery <elbeheri95@gmail.com> writes:
>
> > Profiling showed g_hash_table_lookup as a hot spot when running TCG
> > plugins that log all CPU registers (e.g. execlog with reg=3D*).
> > Replace it with a direct array index to avoid lookup overhead.
> >
> > Signed-off-by: Abdelrahman Elbehery <elbeheri95@gmail.com>
> > ---
> > While profiling (via callgrind) a TCG plugin that logs all the CPU
> registers
> > (very identical to execlog with reg=3D*) i noticed that arm_gdb_get_sys=
reg
> is a hot spot,
> > mostly while calling g_hash_table_lookup. Probably this is due to some
> hashtable collision
> > that is handleded by glib internally.
> >
> > Currently each DynamicGDBFeatureInfo item holds keys for cp_regs, and
> the keys are always
> > used to retrieve the ARMCPRegInfo pointer.
> >
> > By replacing the keys array with a GPtrArray, we now just access reg
> info directly from
> > the given index.
> >
> > The benchmarking was done on c2d-highcpu-16 (16 vCPUs, 32 GB memory) GC=
P
> >
> > Setup was to run qemu-system-aarch64 against a buildroot kernel and
> rootfs
> > with and without the patch mostly using:
> >     --plugin contrib/plugins/libstoptrigger.so,icount=3D2000000
> >     --plugin contrib/plugins/libexeclog.so,reg=3D*
> >     -M virt -cpu cortex-a710 -smp 1
> >
> > Benchmark showed ~15% performance gain when hashtable is not used.
> > For benchmarking, i used hyperfine with 3 warmup rounds and 10
> iterations each.
> > ---
> >  target/arm/cpu.h     |  6 +++---
> >  target/arm/gdbstub.c | 28 ++++++++++++++++------------
> >  2 files changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index
> 15a13b929276dad161032b61ba51ebbce7eeebc6..8816e94e3f8271ad403e77f6182fdb8=
cee31c527
> 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -121,15 +121,15 @@
> >   * DynamicGDBFeatureInfo:
> >   * @desc: Contains the feature descriptions.
> >   * @data: A union with data specific to the set of registers
> > - *    @cpregs_keys: Array that contains the corresponding Key of
> > - *                  a given cpreg with the same order of the cpreg
> > + *    @cpregs_regs: Array that contains the corresponding Register inf=
o
> pointer
> > + *                  of a given cpreg with the same order of the cpreg
> >   *                  in the XML description.
> >   */
> >  typedef struct DynamicGDBFeatureInfo {
> >      GDBFeature desc;
> >      union {
> >          struct {
> > -            uint32_t *keys;
> > +            GPtrArray *regs;
> >          } cpregs;
> >      } data;
> >  } DynamicGDBFeatureInfo;
> > diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> > index
> d6e29c4cf46745dc7851bc5f8339c8d7c6857b8c..e66af8207b436fe8f1dd27441a587b1=
eb52ff928
> 100644
> > --- a/target/arm/gdbstub.c
> > +++ b/target/arm/gdbstub.c
> > @@ -238,19 +238,23 @@ static int arm_gdb_get_sysreg(CPUState *cs,
> GByteArray *buf, int reg)
> >      ARMCPU *cpu =3D ARM_CPU(cs);
> >      CPUARMState *env =3D &cpu->env;
> >      const ARMCPRegInfo *ri;
> > -    uint32_t key;
> >
> > -    key =3D cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
> > -    ri =3D get_arm_cp_reginfo(cpu->cp_regs, key);
> > +    ri =3D g_ptr_array_index(cpu->dyn_sysreg_feature.data.cpregs.regs,
> > reg);
>
> I was only re-using key because we still use get_arm_cp_reginfo but I
> have no objection to making the access faster for plugins given the
> system registers don't change after CPU reset.
>
>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
> >      if (ri) {
> >          switch (cpreg_field_type(ri)) {
> >          case MO_64:
> >              if (ri->vhe_redir_to_el2 &&
> >                  (arm_hcr_el2_eff(env) & HCR_E2H) &&
> >                  arm_current_el(env) =3D=3D 2) {
> > -                ri =3D get_arm_cp_reginfo(cpu->cp_regs,
> ri->vhe_redir_to_el2);
> > +                ri =3D g_ptr_array_index(
> > +                    cpu->dyn_sysreg_feature.data.cpregs.regs,
> > +                    ri->vhe_redir_to_el2
> > +                );
> >              } else if (ri->vhe_redir_to_el01) {
> > -                ri =3D get_arm_cp_reginfo(cpu->cp_regs,
> ri->vhe_redir_to_el01);
> > +                ri =3D g_ptr_array_index(
> > +                    cpu->dyn_sysreg_feature.data.cpregs.regs,
> > +                    ri->vhe_redir_to_el01
> > +                );
> >              }
> >              return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env,
> ri));
> >          case MO_32:
> > @@ -269,19 +273,18 @@ static int arm_gdb_set_sysreg(CPUState *cs,
> uint8_t *buf, int reg)
> >
> >  static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builder,
> >                                         DynamicGDBFeatureInfo
> *dyn_feature,
> > -                                       ARMCPRegInfo *ri, uint32_t
> ri_key,
> > +                                       ARMCPRegInfo *ri,
> >                                         int bitsize, int n)
> >  {
> >      gdb_feature_builder_append_reg(builder, ri->name, bitsize, n,
> >                                     "int", "cp_regs");
> >
> > -    dyn_feature->data.cpregs.keys[n] =3D ri_key;
> > +    g_ptr_array_index(dyn_feature->data.cpregs.regs, n) =3D ri;
> >  }
> >
> >  static void arm_register_sysreg_for_feature(gpointer key, gpointer
> value,
> >                                              gpointer p)
> >  {
> > -    uint32_t ri_key =3D (uintptr_t)key;
> >      ARMCPRegInfo *ri =3D value;
> >      RegisterSysregFeatureParam *param =3D p;
> >      ARMCPU *cpu =3D ARM_CPU(param->cs);
> > @@ -292,7 +295,7 @@ static void arm_register_sysreg_for_feature(gpointe=
r
> key, gpointer value,
> >          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> >              if (ri->state =3D=3D ARM_CP_STATE_AA64) {
> >                  arm_gen_one_feature_sysreg(&param->builder, dyn_featur=
e,
> > -                                           ri, ri_key, 64, param->n++)=
;
> > +                                           ri, 64, param->n++);
> >              }
> >          } else {
> >              if (ri->state =3D=3D ARM_CP_STATE_AA32) {
> > @@ -302,10 +305,10 @@ static void
> arm_register_sysreg_for_feature(gpointer key, gpointer value,
> >                  }
> >                  if (ri->type & ARM_CP_64BIT) {
> >                      arm_gen_one_feature_sysreg(&param->builder,
> dyn_feature,
> > -                                               ri, ri_key, 64,
> param->n++);
> > +                                               ri, 64, param->n++);
> >                  } else {
> >                      arm_gen_one_feature_sysreg(&param->builder,
> dyn_feature,
> > -                                               ri, ri_key, 32,
> param->n++);
> > +                                               ri, 32, param->n++);
> >                  }
> >              }
> >          }
> > @@ -323,7 +326,8 @@ static GDBFeature
> *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
> >                               "org.qemu.gdb.arm.sys.regs",
> >                               "system-registers.xml",
> >                               base_reg);
> > -    cpu->dyn_sysreg_feature.data.cpregs.keys =3D g_new(uint32_t,
> num_regs);
> > +    cpu->dyn_sysreg_feature.data.cpregs.regs =3D g_ptr_array_new();
> > +    g_ptr_array_set_size(cpu->dyn_sysreg_feature.data.cpregs.regs,
> num_regs);
> >      g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_feature=
,
> &param);
> >      gdb_feature_builder_end(&param.builder);
> >      return &cpu->dyn_sysreg_feature.desc;
> >
> > ---
> > base-commit: ac6721b88df944ade0048822b2b74210f543d656
> > change-id: 20260518-enhance_arm_gdb_get_sysreg_performance-4288474401d6
> >
> > Best regards,
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--0000000000004c9d080653566fcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks so much for pointing that out.<div><br></div><div>I=
 am not aware if GDBFeatureBuilder=C2=A0shares the same lifetime as ARMCPU =
struct or not. But noticed that builder object keeps a copy of register obj=
ect name pointer.</div><div><br></div><div>E.g. gdb_feature_builder_append_=
reg does</div><div><br></div><div>=C2=A0 =C2=A0builder-&gt;regs-&gt;pdata[r=
egnum] =3D (gpointer *)name;</div><div><br></div><div>I guess if=C2=A0GDBFe=
atureBuilder is not destructed per core, won&#39;t this imply we have a sim=
ilar stale pointer issue (ri-&gt;name referenced at builder-&gt;regs-&gt;pd=
ata, and ri is freed) in the use case you mentioned?</div><div><br></div><d=
iv>But if it has the same lifetime as ARMCPU, won&#39;t this also imply we =
need to call again the GDBFeatureBuilder append_reg method?</div><div><br><=
/div><div>I will try to read the docs/tests or try any examples that do thi=
s struct re-creation at run-time and test the above ri-&gt;name scenario.</=
div><div><br></div><div>Thank you</div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Jun 2, 2026 at 7:28=E2=80=AFPM Alex Benn=C3=A9e &lt;<a href=3D"ma=
ilto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Abdelrahman Elbehery &lt=
;<a href=3D"mailto:elbeheri95@gmail.com" target=3D"_blank">elbeheri95@gmail=
.com</a>&gt; writes:<br>
<br>
&gt; Profiling showed g_hash_table_lookup as a hot spot when running TCG<br=
>
&gt; plugins that log all CPU registers (e.g. execlog with reg=3D*).<br>
&gt; Replace it with a direct array index to avoid lookup overhead.<br>
&gt;<br>
&gt; Signed-off-by: Abdelrahman Elbehery &lt;<a href=3D"mailto:elbeheri95@g=
mail.com" target=3D"_blank">elbeheri95@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; While profiling (via callgrind) a TCG plugin that logs all the CPU reg=
isters<br>
&gt; (very identical to execlog with reg=3D*) i noticed that arm_gdb_get_sy=
sreg is a hot spot,<br>
&gt; mostly while calling g_hash_table_lookup. Probably this is due to some=
 hashtable collision<br>
&gt; that is handleded by glib internally.<br>
&gt;<br>
&gt; Currently each DynamicGDBFeatureInfo item holds keys for cp_regs, and =
the keys are always<br>
&gt; used to retrieve the ARMCPRegInfo pointer.<br>
&gt;<br>
&gt; By replacing the keys array with a GPtrArray, we now just access reg i=
nfo directly from<br>
&gt; the given index.<br>
&gt;<br>
&gt; The benchmarking was done on c2d-highcpu-16 (16 vCPUs, 32 GB memory) G=
CP<br>
&gt;<br>
&gt; Setup was to run qemu-system-aarch64 against a buildroot kernel and ro=
otfs<br>
&gt; with and without the patch mostly using:<br>
&gt;=C2=A0 =C2=A0 =C2=A0--plugin contrib/plugins/libstoptrigger.so,icount=
=3D2000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--plugin contrib/plugins/libexeclog.so,reg=3D*<br>
&gt;=C2=A0 =C2=A0 =C2=A0-M virt -cpu cortex-a710 -smp 1<br>
&gt;<br>
&gt; Benchmark showed ~15% performance gain when hashtable is not used.<br>
&gt; For benchmarking, i used hyperfine with 3 warmup rounds and 10 iterati=
ons each.<br>
&gt; ---<br>
&gt;=C2=A0 target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
&gt;=C2=A0 target/arm/gdbstub.c | 28 ++++++++++++++++------------<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 15 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/arm/cpu.h b/target/arm/cpu.h<br>
&gt; index 15a13b929276dad161032b61ba51ebbce7eeebc6..8816e94e3f8271ad403e77=
f6182fdb8cee31c527 100644<br>
&gt; --- a/target/arm/cpu.h<br>
&gt; +++ b/target/arm/cpu.h<br>
&gt; @@ -121,15 +121,15 @@<br>
&gt;=C2=A0 =C2=A0* DynamicGDBFeatureInfo:<br>
&gt;=C2=A0 =C2=A0* @desc: Contains the feature descriptions.<br>
&gt;=C2=A0 =C2=A0* @data: A union with data specific to the set of register=
s<br>
&gt; - *=C2=A0 =C2=A0 @cpregs_keys: Array that contains the corresponding K=
ey of<br>
&gt; - *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a gi=
ven cpreg with the same order of the cpreg<br>
&gt; + *=C2=A0 =C2=A0 @cpregs_regs: Array that contains the corresponding R=
egister info pointer<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of a=
 given cpreg with the same order of the cpreg<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in the XML description.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 typedef struct DynamicGDBFeatureInfo {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GDBFeature desc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *keys;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GPtrArray *regs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } cpregs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } data;<br>
&gt;=C2=A0 } DynamicGDBFeatureInfo;<br>
&gt; diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c<br>
&gt; index d6e29c4cf46745dc7851bc5f8339c8d7c6857b8c..e66af8207b436fe8f1dd27=
441a587b1eb52ff928 100644<br>
&gt; --- a/target/arm/gdbstub.c<br>
&gt; +++ b/target/arm/gdbstub.c<br>
&gt; @@ -238,19 +238,23 @@ static int arm_gdb_get_sysreg(CPUState *cs, GByt=
eArray *buf, int reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUARMState *env =3D &amp;cpu-&gt;env;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const ARMCPRegInfo *ri;<br>
&gt; -=C2=A0 =C2=A0 uint32_t key;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 key =3D cpu-&gt;dyn_sysreg_feature.data.cpregs.keys[reg=
];<br>
&gt; -=C2=A0 =C2=A0 ri =3D get_arm_cp_reginfo(cpu-&gt;cp_regs, key);<br>
&gt; +=C2=A0 =C2=A0 ri =3D g_ptr_array_index(cpu-&gt;dyn_sysreg_feature.dat=
a.cpregs.regs,<br>
&gt; reg);<br>
<br>
I was only re-using key because we still use get_arm_cp_reginfo but I<br>
have no objection to making the access faster for plugins given the<br>
system registers don&#39;t change after CPU reset.<br>
<br>
<br>
Tested-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" t=
arget=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ri) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (cpreg_field_type(ri)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_64:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ri-&gt;vhe_redir_t=
o_el2 &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (arm_hcr=
_el2_eff(env) &amp; HCR_E2H) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_curr=
ent_el(env) =3D=3D 2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ri =3D get_ar=
m_cp_reginfo(cpu-&gt;cp_regs, ri-&gt;vhe_redir_to_el2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ri =3D g_ptr_=
array_index(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cpu-&gt;dyn_sysreg_feature.data.cpregs.regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ri-&gt;vhe_redir_to_el2<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ri-&gt;vhe_=
redir_to_el01) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ri =3D get_ar=
m_cp_reginfo(cpu-&gt;cp_regs, ri-&gt;vhe_redir_to_el01);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ri =3D g_ptr_=
array_index(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cpu-&gt;dyn_sysreg_feature.data.cpregs.regs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ri-&gt;vhe_redir_to_el01<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_get_reg64(b=
uf, (uint64_t)read_raw_cp_reg(env, ri));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_32:<br>
&gt; @@ -269,19 +273,18 @@ static int arm_gdb_set_sysreg(CPUState *cs, uint=
8_t *buf, int reg)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builde=
r,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DynamicGDBFeatureInfo *dyn_feature,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARMCP=
RegInfo *ri, uint32_t ri_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARMCP=
RegInfo *ri,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int bitsize, int n)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_feature_builder_append_reg(builder, ri-&gt;nam=
e, bitsize, n,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;int&quo=
t;, &quot;cp_regs&quot;);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 dyn_feature-&gt;data.cpregs.keys[n] =3D ri_key;<br>
&gt; +=C2=A0 =C2=A0 g_ptr_array_index(dyn_feature-&gt;data.cpregs.regs, n) =
=3D ri;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void arm_register_sysreg_for_feature(gpointer key, gpoint=
er value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 gpointer p)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 uint32_t ri_key =3D (uintptr_t)key;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARMCPRegInfo *ri =3D value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RegisterSysregFeatureParam *param =3D p;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(param-&gt;cs);<br>
&gt; @@ -292,7 +295,7 @@ static void arm_register_sysreg_for_feature(gpoint=
er key, gpointer value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_feature(env, ARM_FEATURE_AAR=
CH64)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ri-&gt;state =3D=
=3D ARM_CP_STATE_AA64) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_gen_=
one_feature_sysreg(&amp;param-&gt;builder, dyn_feature,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ri, ri_key, 64, param-&gt;n++);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ri, 64, param-&gt;n++);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ri-&gt;state =3D=
=3D ARM_CP_STATE_AA32) {<br>
&gt; @@ -302,10 +305,10 @@ static void arm_register_sysreg_for_feature(gpoi=
nter key, gpointer value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ri-&=
gt;type &amp; ARM_CP_64BIT) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arm_gen_one_feature_sysreg(&amp;param-&gt;builder, dyn_feature,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ri, ri_key, 64, param-&gt;n++);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ri, 64, param-&gt;n++);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arm_gen_one_feature_sysreg(&amp;param-&gt;builder, dyn_feature,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ri, ri_key, 32, param-&gt;n++);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ri, 32, param-&gt;n++);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -323,7 +326,8 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(=
CPUState *cs, int base_reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;org.qemu.gdb.arm.sys.regs&qu=
ot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;system-registers.xml&quot;,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_reg);<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;dyn_sysreg_feature.data.cpregs.keys =3D g_new(u=
int32_t, num_regs);<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;dyn_sysreg_feature.data.cpregs.regs =3D g_ptr_a=
rray_new();<br>
&gt; +=C2=A0 =C2=A0 g_ptr_array_set_size(cpu-&gt;dyn_sysreg_feature.data.cp=
regs.regs, num_regs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_hash_table_foreach(cpu-&gt;cp_regs, arm_register=
_sysreg_for_feature, &amp;param);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdb_feature_builder_end(&amp;param.builder);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return &amp;cpu-&gt;dyn_sysreg_feature.desc;<br>
&gt;<br>
&gt; ---<br>
&gt; base-commit: ac6721b88df944ade0048822b2b74210f543d656<br>
&gt; change-id: 20260518-enhance_arm_gdb_get_sysreg_performance-4288474401d=
6<br>
&gt;<br>
&gt; Best regards,<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>

--0000000000004c9d080653566fcd--

