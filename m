Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF4BCA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 21:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEZP6-00035F-Rm; Wed, 07 Oct 2026 17:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEZP3-0002xI-SR
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 17:42:23 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEZOz-0001EQ-73
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 17:42:20 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a642495d81so3760868a12.2
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 14:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409335; cv=none;
 d=google.com; s=arc-20260327;
 b=MYcKpp13cRxdUsip8j7FAwdxLyVh7RyR00qkwhoMBDpwcPt9rvSTMYEyo6hUV7Dq2E
 e/ZJA3j5pYQzaEmbUXAVCG2oXvOgbCmGaa5pdkChU531IKfz7zwEBNKK+zK3F0OHbIGU
 jDdxSdBWxHXIw4NCbRy2nFZ5bvR3lGrtnfsd3AMOWmD1Nv/ae/dk0XpW1ec1D0eBipK/
 jWbidyn8ul0jLYyRigOV0BcQ8qNHRA63imZ0w8ucKW5sDuiCCnjgXnM477z0tnRmsUGh
 CbTn2gXyTeE427sCogq6ynCP1mh0jhYuoQF3r9WB6aol26AiZuhE/rOvWHUL1hz/QWEB
 Qynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ifvuOCNcDB8/LSO1lCX7Q/gMRQmkUUJ07GzL3LZ33z0=;
 fh=78ZGRKwQQFvCGTVx5EC4uKJspHbaT81C1jm10Ld8eSs=;
 b=C6/FoCnbsRqayF2OYcN6Kwyzqx98bls4J3S+JWQO2XhIfU/fBMB/MAKe2zS6Cbijz0
 zls946WJtYnytpLL+Req4Gt1J+9M/BO64LzbByLVLFrYDb4I/t4mAaUSmdTZB1qU1LZ0
 J5IFIczNbgItR2HTOwKNuhjJ83YALht0mkpEyV1D0rMAbr++Iy/C5hUiOeFGM9LSEBIi
 pDPWmadU6qt2MHFcYtElk/irs3HA6c5IUKVa2IHUL7LKXkfV0DB807EBmGX1CUso6ouJ
 pGs6f3FHQU483cjQArXa40TE/dzeOJUcj5AeQIcWqolbLiRFlkNlliVJer32mi7jfok6
 9blg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791409335; x=1792014135; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ifvuOCNcDB8/LSO1lCX7Q/gMRQmkUUJ07GzL3LZ33z0=;
 b=mgd3HsQrFnfvgbtdBbS74FjGNLYB/w92nTCv0nP6VKwPfPtb2eAz28KEJs1Y6sGqPk
 tJ7JYi650Smc+33r1POvX8agzG+G5SMd+UxGNhSlMYQmAghCprLSnqYgA369+H1WAfxw
 CRUlIVI+eGE7LD+AGysGdiDBZRgmC4y/5OvBIdFTwgDtaiv2jn2F7aXEu05Kb2tFxl10
 fVTgO6EVfsoUNZz1h8ole3eRG1RCSF9GA+jBPq83RLctBftmJofKKEJyaFJ3a2zUji2i
 IE9a7yU9p6gSgYujL9pyPwL++xFCEK8DhBFFVoZXFf509JRA0lI3D7Ax84V0QQNyChoW
 4GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791409335; x=1792014135;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ifvuOCNcDB8/LSO1lCX7Q/gMRQmkUUJ07GzL3LZ33z0=;
 b=XnOCaac38iRdDCqE5eZfNYCPgNct7A0qK33gQL5h90u9D6QcftxX4HY0nYNZ7LULMC
 ysQtcHQssqau1ZuBPemBzI9gQ7jHGXcNwN6I7d+zb0KvekJtb3TSffu9eK8opFNxyzf0
 /tjJVPiUMeM96F9iVpUbWhPfY1Ye7iTsbjjLJsMiSYlIxPdVcMRtnmKnANC52L19QXI+
 hT2wB6RfsYJ/bzE/PN7DiYNMS86mbpIbFCqa0Aaf6SAxGJXbp+Gi9UHnpay1Fl4hFcbu
 1KUqAfmMp76XUfx3h8FdydPQU+4doZTmSHm3vPz0LHw+6/v9pkbMzBtFSeBiLfjdw09q
 QNzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLQnZDbGO6oJfJ7RoQrOLZEwLuuBQ2Czmu7J8gLVwzFeQgr4IElHXdVLWdIQe033covJ0zASa2wA==@nongnu.org
X-Gm-Message-State: AFq9FYLRdKmdP7RbhB3CqVja1qJx50VZBQ01ZIsiGDdZr1qnngLQwoTe
 bwIiNghZsWfKTboNCQWPmIlA8nwAAqn2IGqcAPI2LAr0V41UCybfo4Zr86ZI56ZvgzXxUaLrBID
 FK9fwp86U4R54Rh4ZFQtxtgUGaAI2he4=
X-Gm-Gg: AYBFou0KNBqWCYtU9x+6+CMS8d7+V8Jdlyppt+0vl9jdwd8N2g1yDU5ja6CswOILzZq
 brAoNu54WsPdSFpQWoOPwpPbpszHOJ8CiMaItdLT7HxoSR2GCus4lN5z4AMQoUSooVawe8ke61n
 wwpNL1xMf5xLVhKRAip4xFHDZhPvOrAT7aSphPxtbhnGv1gvFUdGCGhqUtu7aUW0md09hp1fBQO
 eHZvwr8AyDR/vgAoW9T1EJBApumyNXMJJuHTvLnAsh5DqV/5f+mj8kivzs1t7u1hSWgrkpIHe38
 ae/Fch1+5TX9K/EhOsddisGP0Pd3IS/Mn0dG2wKHlNsw7h3VCl7fhIQ=
X-Received: by 2002:a05:6402:440c:b0:6ad:b23f:e325 with SMTP id
 4fb4d7f45d1cf-6aff45900d4mr3776151a12.20.1791409335321; Wed, 07 Oct 2026
 14:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
In-Reply-To: <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 8 Oct 2026 05:42:02 +0800
X-Gm-Features: AclHuK-nyl-2YGeMlRyLTrHN6_wEb3WduM5B5iGfFbi7Roona1cuqAP59T0lymU
Message-ID: <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 8, 2026 at 4:44=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/7/2026 4:48 AM, Yonggang Luo wrote:
> > Change TypeInfo.is_available to the new TypeIsAvailable type, which
> > takes a const TargetInfo *. Registration passes target_info(), so
> > behavior is unchanged. object.h only forward-declares TargetInfo.
> >
> > Switch the existing users (raspi, raspi4b, ast27x0 evb and fc) and the
> > generated machine parents to the matching target_is_<arch> helpers.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  hw/arm/aspeed_ast27x0-fc.c  |  2 +-
> >  hw/arm/aspeed_ast27x0_evb.c |  4 ++--
> >  hw/arm/raspi.c              |  4 ++--
> >  hw/arm/raspi4b.c            |  2 +-
> >  hw/arm/virt.c               |  4 ++--
> >  hw/m68k/virt.c              |  4 ++--
> >  hw/or1k/virt.c              |  2 +-
> >  include/qom/object.h        | 12 +++++++++++-
> >  qom/object.c                |  3 ++-
> >  9 files changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
> > index 73362b60d2a..8a7c6a116ac 100644
> > --- a/hw/arm/aspeed_ast27x0-fc.c
> > +++ b/hw/arm/aspeed_ast27x0-fc.c
> > @@ -234,7 +234,7 @@ static const TypeInfo ast2700fc_types[] =3D {
> >          .parent         =3D TYPE_MACHINE,
> >          .class_init     =3D ast2700fc_class_init,
> >          .instance_size  =3D sizeof(Ast2700FCState),
> > -        .is_available   =3D target_aarch64,
> > +        .is_available   =3D target_is_aarch64,
> >      },
> >  };
> >
> > diff --git a/hw/arm/aspeed_ast27x0_evb.c b/hw/arm/aspeed_ast27x0_evb.c
> > index 460c9ff0d2e..02a8cff1d9d 100644
> > --- a/hw/arm/aspeed_ast27x0_evb.c
> > +++ b/hw/arm/aspeed_ast27x0_evb.c
> > @@ -75,13 +75,13 @@ static const TypeInfo aspeed_ast27x0_evb_types[] =
=3D {
> >          .name          =3D MACHINE_TYPE_NAME("ast2700a1-evb"),
> >          .parent        =3D TYPE_ASPEED_MACHINE,
> >          .class_init    =3D aspeed_machine_ast2700a1_evb_class_init,
> > -        .is_available  =3D target_aarch64,
> > +        .is_available  =3D target_is_aarch64,
> >      },
> >      {
> >          .name          =3D MACHINE_TYPE_NAME("ast2700a2-evb"),
> >          .parent        =3D TYPE_ASPEED_MACHINE,
> >          .class_init    =3D aspeed_machine_ast2700a2_evb_class_init,
> > -        .is_available  =3D target_aarch64,
> > +        .is_available  =3D target_is_aarch64,
> >      }
> >  };
> >
> > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > index fadbacb2534..22b06c6ca22 100644
> > --- a/hw/arm/raspi.c
> > +++ b/hw/arm/raspi.c
> > @@ -403,12 +403,12 @@ static const TypeInfo raspi_machine_types[] =3D {
> >          .name           =3D MACHINE_TYPE_NAME("raspi3ap"),
> >          .parent         =3D TYPE_RASPI_MACHINE,
> >          .class_init     =3D raspi3ap_machine_class_init,
> > -        .is_available   =3D target_aarch64,
> > +        .is_available   =3D target_is_aarch64,
> >      }, {
> >          .name           =3D MACHINE_TYPE_NAME("raspi3b"),
> >          .parent         =3D TYPE_RASPI_MACHINE,
> >          .class_init     =3D raspi3b_machine_class_init,
> > -        .is_available   =3D target_aarch64,
> > +        .is_available   =3D target_is_aarch64,
> >      }, {
> >          .name           =3D TYPE_RASPI_MACHINE,
> >          .parent         =3D TYPE_RASPI_BASE_MACHINE,
> > diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
> > index 566d64572db..a1dc477f25e 100644
> > --- a/hw/arm/raspi4b.c
> > +++ b/hw/arm/raspi4b.c
> > @@ -121,7 +121,7 @@ static const TypeInfo raspi4b_machine_type =3D {
> >      .parent         =3D TYPE_RASPI_BASE_MACHINE,
> >      .instance_size  =3D sizeof(Raspi4bMachineState),
> >      .class_init     =3D raspi4b_machine_class_init,
> > -    .is_available   =3D target_aarch64,
> > +    .is_available   =3D target_is_aarch64,
> >  };
> >
> >  static void raspi4b_machine_register_type(void)
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9d192515d85..18160f7fad3 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -132,7 +132,7 @@ static void arm_virt_compat_default_set(MachineClas=
s *mc)
> >          .name =3D MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
> >          .parent =3D TYPE_VIRT_MACHINE, \
> >          .class_init =3D MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)=
, \
> > -        .is_available =3D target_base_arm, \
> > +        .is_available =3D target_is_base_arm, \
> >      }; \
> >      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
> >      { \
> > @@ -4430,7 +4430,7 @@ static const TypeInfo virt_machine_info =3D {
> >           { TYPE_HOTPLUG_HANDLER },
> >           { }
> >      },
> > -    .is_available =3D target_base_arm,
> > +    .is_available =3D target_is_base_arm,
> >  };
> >
> >  static void machvirt_machine_init(void)
> > diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> > index e52546e4fab..ad2a43ef3fb 100644
> > --- a/hw/m68k/virt.c
> > +++ b/hw/m68k/virt.c
> > @@ -327,7 +327,7 @@ static const TypeInfo virt_machine_info =3D {
> >      .parent       =3D TYPE_MACHINE,
> >      .abstract     =3D true,
> >      .class_init   =3D virt_machine_class_init,
> > -    .is_available =3D target_m68k,
> > +    .is_available =3D target_is_m68k,
> >  };
> >
> >  static void virt_machine_register_types(void)
> > @@ -355,7 +355,7 @@ type_init(virt_machine_register_types)
> >          .name =3D MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
> >          .parent =3D MACHINE_TYPE_NAME("virt"), \
> >          .class_init =3D MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)=
, \
> > -        .is_available =3D target_m68k, \
> > +        .is_available =3D target_is_m68k, \
> >      }; \
> >      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
> >      { \
> > diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
> > index a3ff903839b..89fb786641f 100644
> > --- a/hw/or1k/virt.c
> > +++ b/hw/or1k/virt.c
> > @@ -559,7 +559,7 @@ static const TypeInfo or1ksim_machine_typeinfo =3D =
{
> >      .parent     =3D TYPE_MACHINE,
> >      .class_init =3D openrisc_virt_machine_init,
> >      .instance_size =3D sizeof(OR1KVirtState),
> > -    .is_available =3D target_or1k,
> > +    .is_available =3D target_is_or1k,
> >  };
> >
> >  static void or1ksim_machine_init_register_types(void)
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 4c0645817a5..7d52a15f6b8 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -17,6 +17,7 @@
> >  #include "qapi/qapi-builtin-types.h"
> >  #include "qemu/module.h"
> >
> > +typedef struct TargetInfo TargetInfo;
> >  struct TypeImpl;
> >  typedef struct TypeImpl *Type;
> >
> > @@ -117,6 +118,15 @@ typedef void (ObjectUnparent)(Object *obj);
> >   */
> >  typedef void (ObjectFree)(void *obj);
> >
> > +/**
> > + * typedef TypeIsAvailable:
> > + * @ti: TargetInfo to test.
> > + *
> > + * Returns whether a type is available for @ti. Typical implementation=
s
> > + * are target_is_*().
> > + */
> > +typedef bool (TypeIsAvailable)(const TargetInfo *ti);
> > +
> >  #define OBJECT_CLASS_CAST_CACHE 4
> >
> >  /**
> > @@ -498,7 +508,7 @@ struct TypeInfo
> >      void (*class_base_init)(ObjectClass *klass, const void *data);
> >      const void *class_data;
> >
> > -    bool (*is_available)(void);
> > +    TypeIsAvailable *is_available;
> >      const InterfaceInfo *interfaces;
> >  };
> >
> > diff --git a/qom/object.c b/qom/object.c
> > index 96498f3d001..253b9562b41 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -15,6 +15,7 @@
> >  #include "qom/compat-properties.h"
> >  #include "qom/object.h"
> >  #include "qom/object_interfaces.h"
> > +#include "qemu/target-info.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/memalign.h"
> >  #include "qapi/visitor.h"
> > @@ -167,7 +168,7 @@ static TypeImpl *type_register_internal(const TypeI=
nfo *info)
> >          abort();
> >      }
> >
> > -    if (info->is_available && !info->is_available()) {
> > +    if (info->is_available && !info->is_available(target_info())) {
> >          return NULL;
> >      }
> >
>
> ```
> info->is_available(target_info())
> ```
>
> or
>
> ```
> is_available() {
>   TargetInfo ti * =3D target_info();
>   ...
> }
> ```
>
> Are doing the exact same thing today.
>
> So what is the future goal requiring to introduce this?

From Daniel P. Berrang=C3=A9's
requesthttps://lore.kernel.org/qemu-devel/apAszS1ewxM0Y1XU@redhat.com/
        I forgot to mention that this is also pretty important for making
        introspection work, as we need to be able to say

          'qemu-system --machine none -qmp ...'

        and connect to QMP to introspect the binary. Having to add a
        '--target <name>' into that mix is undesirable, as it creates
        a chicken & egg problem. You don't know what targets are built
        into qemu-system without introspecting it and you can't
        introspect it without selecting a target to introspect.

From Pierrick's review
https://lore.kernel.org/qemu-devel/557262df-b8e7-49b5-a245-ae46b8885b30@oss=
.qualcomm.com/So,
for existing binary: -M virt works as before.

        For new multi binary:
        $ qemu-system -M virt:
        Multiple machines were found, select one among:
        - aarch64-virt
        - riscv64-virt

        Does it matches what you would expect?

From Daniel's review
https://lore.kernel.org/qemu-devel/aro93NuZBXYGbD33@redhat.com/
        We already have  'QemuTargetInfo' struct which is used
        with 'query-target', that should also be used with the
        new 'query-targets' command.

        We need to add the 'endianness' field to QemuTargetInfo.

        I don't think that we need to report machines though.
        We already have 'query-machines' which gives much broader
        information on the machines. "MachineInfo" needs to
        gain

        "targets": ["SysEmuTarget"]

        to list which target(s) a machine can be used with.


To achieve these, we needs add TypeInfo parameter to it so that we can do

static void report_unsupported_machine_type(const char *name, Error **errp)
{
    g_autoptr(GSList) machines =3D machine_class_get_list(true);
    g_autoptr(GString) targets =3D g_string_new(NULL);
    TargetInfoNode *node;
    GSList *el;

    error_setg(errp, "unsupported machine type: \"%s\" for target \"%s\"",
               name, target_name());
    QLIST_FOREACH(node, target_info_list(), next) {
        for (el =3D machines; el; el =3D el->next) {
            MachineClass *mc =3D el->data;

            if ((!strcmp(mc->name, name) || !g_strcmp0(mc->alias, name)) &&
                object_class_get_is_available(OBJECT_CLASS(mc))(node->info)=
) {
                g_string_append_printf(targets, "  %s\n",
                                       node->info->target_name);
                break;
            }
        }
    }
    if (targets->len) {
        error_append_hint(errp, "Available for targets:\n%s", targets->str)=
;
    }
}

That is we can iterate on all target-list, and check if it's can be fitlere=
d.


>
> It's something we asked multiple times, and until we don't have a short
> series doing this change + a single and minimal modification showing the
> reason, I will still be asking.
>
> If the goal is to implement some sort of classification for
> machines/cpus, I would suggest to just send a simple series doing this
> change (and only this - no additional cleanups/refactoring), and an
> example for a single machine + cpu, so we can talk about it.
>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

