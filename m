Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDC2CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 13:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGc90-0002Zs-5s; Tue, 13 Oct 2026 09:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGc87-0002QI-5K
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:01:28 -0400
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGc83-0001rl-0B
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:01:16 -0400
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-3115c4451c8so3045716eec.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 06:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896473; cv=none;
 d=google.com; s=arc-20260327;
 b=IPjiqguauXJriKmzZsoc4Igj+pgmBO3Ij9cUl4rq/RipEKk7DtQDZx0+nJuTIaYsXz
 BcVi37fDDonoUf2aXnPZsjAdO1zlsYWCYPw14xFCR9e2g8mJRxoUm6aojdd88RtcXgvz
 Uk0hI6bCvu3/HiBmeO/a++bOz3QQ9c7++FHACUo08lGl2qzHGvKpSOqJtHAfuQBUb+P3
 WoVZ/+v5cjGwd5qhv8I+vxmF+mlXuAOlHoIjWhk0N0vBr3Ko/QgD3yWJi1DFYuOcMTMe
 j6xZ5RXds4P3he0RJ9QvdRmRrmKQQC71rRjZpaY3Y0FvY+wxRowasZC7cASYZX5nIqSa
 9Sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 fh=cGwHduh7cDTIfha5Ko6EWLDxBdRff30OaUtj6piloL0=;
 b=bqUG0qJBldPE/yl1/3QA1IDlJ8WsoL4sJCvi8md9YSRlPYdO/SmMpoFienL7f6wtPs
 MUqCqysq2rCep1XLfLZupyygFgypyRkEmhf0rzCOEVOfIz0ZheboyPXec9RQf+xFN8ks
 SLhQz6Dg16k4arDSahbBcwHi0XTkDsrii+VVpP/FYa/n4JwwAib1hobvY0b5DFdgWIMp
 hczK6f9wJpHF6ioSFxGaGjv/w0ZTwNFU298YoR31KsbCdumPSPz67+NnVuoUEcFfoojL
 oNGKPeyGuY9hn0lcSs7VRQVPfWvlASgIFiK55VttojjCI6k73kivEsC90i1GAzCSuYM4
 Rsog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1791896473; x=1792501273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 b=LSuu6ve0vPwQb/oQjwAPPXgPmACPFsusqMi4Gj0Egcen9WUS7bp3tiFyWP68JpBDEB
 VtLWgV25QeqjikqIc9MYhQKuN8jOilt6FF0g3tBcQSyNADCg5TzlFyj4DQr793sZJypv
 sFwjdieXJaijYj1BNe1lO6NXNAY7//MNDFVkyU1wWYAbpjWvi3NkKEbWxEZJ2/wJAiUt
 xxiNf7LT6Zr8gfkb62s1ipLdZuZ0CD2W+6WI7Mg2NHO+SoOE5KmCda6O9tIz8kPF+uMR
 4GKyUPJbLBlkZ0r9M/n2jaRtMZMh8N8jb9amXtLpsGy34wh6zt4xbO5TU+c9cGIC6Dkh
 3JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791896473; x=1792501273;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PGY+6jZg5SqUd4l7AQTPRlEv3Ac2ljFgLNWX6rF802E=;
 b=TE4u1IkVIFnO11pJ1Nwglo07k/UU6bXpMP01wbfI6GTZMi3pqeWDq6OPV3O1hJIe8s
 +P4B8HoN3zo10SRclo4qmoyIKpm8oqBTKS+zlkh07pOKCLyMeC8Fueqq59a5TzFbHstC
 eXSBtIEC6wNxjiuZIs9USCYeSD1bBV8l+B/yqVoy8/2qEvD4ACp9McfEjzVJubQvhpCG
 WvfSAL1L13nInPUq6zlJ0kRxEvjbHRJJEcescb/Ttc6Jjh8piDamPjCSRYaG64Nub8gS
 QfWAbKwWJKlIFZsGRUgTtCIZZ8AwX/l22RIrhrvtcV63Di9QYwyk7e/AjraKXUeSZ7Pz
 NCSA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6KoPnBgWI4imJFtOmtTJPwLEWMdzg2hMXikaXcUi0MfTrN3CjNhbR911ea9b9lMuVIGKEyPm9zQ==@nongnu.org
X-Gm-Message-State: AFq9FYKGjqmh85ArZ/lxbQdEV0U//HAJRCu3UQdoxJkqLq/cz6onwqa8
 eerw30N7PS5LC3OvRTOxJt2zeyhOWQsAwSd8zVa45foi1JtikaYGOPqkwX7uYOcPR5TH4/nsXrH
 JNpKnQV/uqyKnfWLImM1Z9jcBJDwmXcI=
X-Gm-Gg: AYBFou20PEZSPditABd2j0ht7PM1wy7Qr9LEk9o9tO2fipYj3qvGuGD1h2P972VWKdE
 pCyIUS6xBpxEtXDgd99vpxTvyDY0aN5nNa5sJpQOQafTi1AcayAY8uQbddeS9eVEzgWQmvVPqeb
 Kpqt87jOzWN8vmjSwHccBtGDweavSXy2YcUEybMKeSBbVn4s/H11jBmCXLEJ6gc0GaG1rJcWWr6
 edI1AnheHK973aGDs1cJAwqVLcNCcdsx+52WVT0PVT46scHt9gSJJtnqG9xBivo/NfkjmOdXlxd
 opnvBpr3Y4tL3vWv3x+1HFisKWmXKe1MfKRoODjn+nAqpSrGzi1Hn86+MFeZ1IfK0U5DfTR/R7W
 3RamK9RG6rsI=
X-Received: by 2002:a05:693c:811a:b0:351:7e5d:3caf with SMTP id
 5a478bee46e88-3537dfb8c44mr17683397eec.7.1791896472825; Tue, 13 Oct 2026
 06:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-query-reg-v2-0-6f95a2e139a9@redhat.com>
 <20261013-query-reg-v2-4-6f95a2e139a9@redhat.com>
 <87ik36gfe6.fsf@draig.linaro.org>
In-Reply-To: <87ik36gfe6.fsf@draig.linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 13 Oct 2026 17:00:59 +0400
X-Gm-Features: AclHuK_blaIwYzH5KQnLuLReYYXS7Ov9FVamAZSe3X0WjS8D3Um413MnIE6moeg
Message-ID: <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Tue, Oct 13, 2026 at 12:51=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>
> > Add support for registering coprocessor features that are only visible
> > to QEMU's internal APIs (HMP monitor $register expressions, plugins) bu=
t
> > hidden from GDB's target description XML.
> >
> > When a feature is registered as internal:
> > - It is excluded from the target.xml sent to GDB
> > - Its XML is not served via qXfer:features:read
> > - 'p'/'P' packets for internal register numbers return E14
> >
> > This is useful for exposing system registers to the HMP monitor without
> > affecting GDB's register namespace. Exposing aliases or synthetic
> > registers through GDB's target description can cause problems: name
> > collisions with GDB's pseudo-registers, independent register caching,
> > and missing DWARF unwind rules.
>
> Hmm are they *that* useful for HMP then?
>
> The front-ends do limit what they export to gdb (see for example
> ARM_CP_NO_GDB) generally because reading them causes side-effects. Those
> restrictions are also a reason to limit them from the HMP interface.

I am not a user, but I can imagine they are useful for developers.

I would like to be able to implement "info registers" purely based on
QMP for ex.

>
> >
> > Internal features must be registered after all GDB-visible features to
> > keep remote register numbering consistent. This ordering is enforced
> > with an assertion.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  gdbstub/gdbstub.c      | 71 ++++++++++++++++++++++++++++++++++++++++++=
++------
> >  include/exec/gdbstub.h | 21 +++++++++++++++
> >  2 files changed, 84 insertions(+), 8 deletions(-)
> >
> > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> > index 912e31b66744..ac0f76d62333 100644
> > --- a/gdbstub/gdbstub.c
> > +++ b/gdbstub/gdbstub.c
> > @@ -54,6 +54,7 @@ typedef struct GDBRegisterState {
> >      gdb_get_reg_cb get_reg;
> >      gdb_set_reg_cb set_reg;
> >      const GDBFeature *feature;
> > +    bool internal; /* hidden from GDB, accessible via API/monitor */
> >  } GDBRegisterState;
> >
> >  GDBState gdbserver_state;
> > @@ -385,6 +386,11 @@ static const char *get_feature_xml(const char *p, =
const char **newp,
> >              }
> >              for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> >                  r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, =
i);
> > +                /* The core target.xml feature must never be internal.=
 */
> > +                g_assert(i > 0 || !r->internal);
> > +                if (r->internal) {
> > +                    continue;
> > +                }
> >                  g_ptr_array_add(
> >                      xml,
> >                      g_markup_printf_escaped("<xi:include href=3D\"%s\"=
/>",
> > @@ -400,6 +406,9 @@ static const char *get_feature_xml(const char *p, c=
onst char **newp,
> >      /* Is it one of the features? */
> >      for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> >          r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> > +        if (r->internal) {
> > +            continue;
> > +        }
> >          if (strncmp(p, r->feature->xmlname, len) =3D=3D 0) {
> >              return r->feature->xml;
> >          }
> > @@ -563,13 +572,14 @@ int gdb_write_register(CPUState *cpu, uint8_t *me=
m_buf, int reg)
> >
> >  static void gdb_register_feature(CPUState *cpu, int base_reg,
> >                                   gdb_get_reg_cb get_reg, gdb_set_reg_c=
b set_reg,
> > -                                 const GDBFeature *feature)
> > +                                 const GDBFeature *feature, bool inter=
nal)
> >  {
> >      GDBRegisterState s =3D {
> >          .base_reg =3D base_reg,
> >          .get_reg =3D get_reg,
> >          .set_reg =3D set_reg,
> > -        .feature =3D feature
> > +        .feature =3D feature,
> > +        .internal =3D internal
> >      };
> >
> >      trace_gdbxml_register_feature(feature->name, feature->xmlname,
> > @@ -605,7 +615,7 @@ void gdb_init_cpu(CPUState *cpu)
> >          assert(feature->base_reg =3D=3D 0);
> >          gdb_register_feature(cpu, 0,
> >                               cc->gdb_read_register, cc->gdb_write_regi=
ster,
> > -                             feature);
> > +                             feature, false);
> >          cpu->gdb_next_base_reg =3D cpu->gdb_num_g_regs =3D feature->nu=
m_regs;
> >      } else {
> >          cpu->gdb_next_base_reg =3D cpu->gdb_num_g_regs =3D cc->gdb_num=
_core_regs;
> > @@ -616,20 +626,26 @@ void gdb_init_cpu(CPUState *cpu)
> >                            cc->gdb_num_core_regs);
> >  }
> >
> > -void gdb_register_coprocessor(CPUState *cpu,
> > -                              gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> > -                              const GDBFeature *feature)
> > +static void do_gdb_register_coprocessor(CPUState *cpu,
> > +                                        gdb_get_reg_cb get_reg,
> > +                                        gdb_set_reg_cb set_reg,
> > +                                        const GDBFeature *feature,
> > +                                        bool internal)
> >  {
> >      GDBRegisterState *s;
> >      guint i;
> >      int base_reg =3D cpu->gdb_next_base_reg;
> >
> >      for (i =3D 0; i < cpu->gdb_regs->len; i++) {
> > -        /* Check for duplicates.  */
> >          s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> > +        /* Check for duplicates.  */
> >          if (s->feature =3D=3D feature) {
> >              return;
> >          }
> > +        /* GDB-visible features must not follow internal ones.  */
> > +        if (!internal) {
> > +            g_assert(!s->internal);
> > +        }
> >      }
> >
> >      if (base_reg < feature->base_reg) {
> > @@ -637,12 +653,27 @@ void gdb_register_coprocessor(CPUState *cpu,
> >                                                feature->base_reg);
> >          base_reg =3D feature->base_reg;
> >      }
> > -    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature);
> > +    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature, int=
ernal);
> >
> >      /* Add to end of list.  */
> >      cpu->gdb_next_base_reg =3D base_reg + feature->num_regs;
> >  }
> >
> > +void gdb_register_coprocessor(CPUState *cpu,
> > +                              gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> > +                              const GDBFeature *feature)
> > +{
> > +    do_gdb_register_coprocessor(cpu, get_reg, set_reg, feature, false)=
;
> > +}
> > +
> > +void gdb_register_internal_coprocessor(CPUState *cpu,
> > +                                       gdb_get_reg_cb get_reg,
> > +                                       gdb_set_reg_cb set_reg,
> > +                                       const GDBFeature *feature)
> > +{
> > +    do_gdb_register_coprocessor(cpu, get_reg, set_reg, feature, true);
> > +}
> > +
> >  void gdb_unregister_coprocessor_all(CPUState *cpu)
> >  {
> >      /*
> > @@ -1223,6 +1254,18 @@ static void handle_remove_bp(GArray *params, voi=
d *user_ctx)
> >   * the remote gdb to fallback to older methods.
> >   */
> >
> > +static bool gdb_register_is_internal(CPUState *cpu, int reg)
> > +{
> > +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> > +        GDBRegisterState *r =3D &g_array_index(cpu->gdb_regs, GDBRegis=
terState, i);
> > +
> > +        if (r->base_reg <=3D reg && reg < r->base_reg + r->feature->nu=
m_regs) {
> > +            return r->internal;
> > +        }
> > +    }
> > +    return false;
> > +}
> > +
> >  static void handle_set_reg(GArray *params, void *user_ctx)
> >  {
> >      int reg_size;
> > @@ -1232,6 +1275,12 @@ static void handle_set_reg(GArray *params, void =
*user_ctx)
> >          return;
> >      }
> >
> > +    if (gdb_register_is_internal(gdbserver_state.g_cpu,
> > +                                 gdb_get_cmd_param(params, 0)->val_ull=
)) {
> > +        gdb_put_packet("E14");
> > +        return;
> > +    }
> > +
> >      reg_size =3D strlen(gdb_get_cmd_param(params, 1)->data) / 2;
> >      gdb_hextomem(gdbserver_state.mem_buf, gdb_get_cmd_param(params, 1)=
->data, reg_size);
> >      gdb_write_register(gdbserver_state.g_cpu, gdbserver_state.mem_buf-=
>data,
> > @@ -1248,6 +1297,12 @@ static void handle_get_reg(GArray *params, void =
*user_ctx)
> >          return;
> >      }
> >
> > +    if (gdb_register_is_internal(gdbserver_state.g_cpu,
> > +                                 gdb_get_cmd_param(params, 0)->val_ull=
)) {
> > +        gdb_put_packet("E14");
> > +        return;
> > +    }
> > +
> >      reg_size =3D gdb_read_register(gdbserver_state.g_cpu,
> >                                   gdbserver_state.mem_buf,
> >                                   gdb_get_cmd_param(params, 0)->val_ull=
);
> > diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> > index 75eb4d9c365e..1bc778324758 100644
> > --- a/include/exec/gdbstub.h
> > +++ b/include/exec/gdbstub.h
> > @@ -40,6 +40,27 @@ void gdb_register_coprocessor(CPUState *cpu,
> >                                gdb_get_reg_cb get_reg, gdb_set_reg_cb s=
et_reg,
> >                                const GDBFeature *feature);
> >
> > +/**
> > + * gdb_register_internal_coprocessor() - register internal registers
> > + *
> > + * Like gdb_register_coprocessor(), but the feature is NOT exposed to
> > + * GDB via the target description XML. The registers are only
> > + * accessible through QEMU's internal APIs (HMP monitor ``$register``
> > + * expressions via gdb_get_register_list()).
> > + *
> > + * Internal features must be registered after all GDB-visible features
> > + * to avoid register numbering mismatches with GDB.
> > + *
> > + * @cpu - the CPU associated with registers
> > + * @get_reg - get function
> > + * @set_reg - set function
> > + * @feature - the GDBFeature describing the registers
> > + */
> > +void gdb_register_internal_coprocessor(CPUState *cpu,
> > +                                       gdb_get_reg_cb get_reg,
> > +                                       gdb_set_reg_cb set_reg,
> > +                                       const GDBFeature *feature);
> > +
> >  /**
> >   * gdb_unregister_coprocessor_all() - unregisters supplemental set of =
registers
> >   * @cpu - the CPU associated with registers
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

