Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1962637wru;
        Mon, 16 Jul 2018 14:57:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgvrObcHHTZPhRa2NppXu2nM5wOnvoWby3Hlk6iLljbUQMh4TaW2jg2jIw42+J9msQOpHC
X-Received: by 2002:aed:2457:: with SMTP id s23-v6mr16771490qtc.366.1531778278178;
        Mon, 16 Jul 2018 14:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778278; cv=none;
        d=google.com; s=arc-20160816;
        b=U8FAW/YlUbvw64rrCnZ+1QQRjqLDQVlbC59cksMg19e+EOYq1JewffWDYKwoGYkS9E
         lhh3saPFApTYK7BosVStbKdqvOpcniLW3TtLCsxeHEF/ads/DcZvqKlJ7kQtJxEH+s9C
         LwcaW1D0MjlzoO/fB1jvTaIPGzP1w0QCemwysGezBMNgagPaz7CGKxibR3jLje5kooRm
         fcZKNraTjV9buXRfXRoc/8m+NOUIf0CzVIPSK2naZ7Hfey1DYOzMNscVax1CXuxEXxQF
         gccxaAqrAxOdohZ2ItAbW+Bq5wTZIL41zhoJcJW9ESPvosZZ+8mrIYGKJ73QYpj37gZO
         hfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Jb1dKAg23N1xL5oTmREWtRfMrDmC/C77kZHniARbMhs=;
        b=q43gLydXswb9SyI4L6Sz/jsi43ZRTBqq3ckyR8cmZYpaG/5ezZboGbP+yr0f/LDqKE
         F8G+ekO3ru8NigFC8D6jPv2AdSWSlDYsRq2VGbfG3E7aoN45/jxWOcHvANlIPrtOlb9y
         HiskgAWSzWzIf4sBBIHuIbRjuIa3YpThJWB3hUunpPVFpG7wJpqdswK3x9PQHn+3M6Fx
         VRUsSVAA8x0iA+1n8yjpwSFoLwlbDLnKoPJzP/29XAI+QJ6iDGw0lePexN1MnypBzM+U
         M8LUeNasWcJ9fGtb7P4lOTu4yoKbaSxURrr+EuB+4Va0YNIaGA137bdtxefXg7LPhJg7
         Pj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HOgGINSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j124-v6si3901920qkd.328.2018.07.16.14.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HOgGINSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBVF-0001t3-Lf
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:57:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBV0-0001qL-Ar
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBUz-0000Rs-2g
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:57:42 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBUv-0000R0-NW; Mon, 16 Jul 2018 17:57:38 -0400
Received: by mail-lf0-x243.google.com with SMTP id f18-v6so17244719lfc.2;
	Mon, 16 Jul 2018 14:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jb1dKAg23N1xL5oTmREWtRfMrDmC/C77kZHniARbMhs=;
	b=HOgGINSNXvtieOgom+4zV/zxpKewfZet8vPOik+ZprycLwJ/I3GVxmefCPNF050ENh
	mZZozqiYiRtDLX7ClvkkK2qoC4eLFEK372inif6gNgiCbSb7K6UGUsYygdXTrXEbaCSv
	gp+V3GYPKNiknJsTBxRVrMPAN7B0QDzHvDkoSdE3LzlnpHEBmSkHuyhKL+Ss6ewm1maR
	ubn1bypF5QjvAFlvKw5Ruiigiq05RWtpvh/1eNWYL7ODRmdv1A5qRrOapDIxYZWjNsgD
	uoP2JOOw9sSW+B55Sg51V4RPYdNtjXLguW5W4splBpDtdVuorRr4+yfMiiDZaIamRRqa
	CWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jb1dKAg23N1xL5oTmREWtRfMrDmC/C77kZHniARbMhs=;
	b=Uzi97Gv/+h23XT6fp8s2dhzoAb0WYzJHJVwSLioamj+4faXkg/gEDph4ebM5TRwrlp
	99PWcO5SiyHxu7lYktBGWyfmKfUuLR2Yw3ir0HkzBXL/04y1p0Nw/zD/DDQ6bz+arPop
	YO0inIfM1CcReI8zHdjjH2N4uwamUppqvcbsTqN/VnqxUEzku59kqrtO2A0lSwAJsqLq
	KUEYP+Ee6e+HxAEf5sAifsghmY25vBxMevygzHPtFEMhQ+ZW7vutomoDmmFbqehH2rg5
	M1CIujQUofpdJFVIrRm49mZqMdsvkAlbMxcn+nXbQZ9jKf1scHs6aCm7vDfOoKtZTebn
	wHUw==
X-Gm-Message-State: AOUpUlEV19llAGWwSEdf+vpcaiUkhUB4YbzOTiJJ3T4XX5ukBifKT8S8
	FFQ0W66mEqifr8BWzEn+Qf6qymBnf+aNXDQdeiY=
X-Received: by 2002:a19:5c8c:: with SMTP id
	u12-v6mr13059349lfi.98.1531778256286; 
	Mon, 16 Jul 2018 14:57:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 14:57:05
	-0700 (PDT)
In-Reply-To: <1531745974-17187-5-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-5-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 14:57:05 -0700
Message-ID: <CAKmqyKMmMDAxghw7bvKxoHqAKBWQsaEA87TdkyPCPZRakAsv_g@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 04/17] hw/arm/armv7: Fix
 crash when introspecting the "iotkit" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nn0D98uWDkfF

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently crashes when introspecting the "iotkit" device and
> runnint "info qtree" afterwards, e.g. when running QEMU like this:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'iotkit'}}" "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
>
> Use the new functions object_initialize_child() and sysbus_init_child_obj()
> to make sure that all objects get cleaned up correctly when the instances
> are destroyed.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/armv7m.c       |  7 +++--
>  hw/arm/iotkit.c       | 74 ++++++++++++++++++++++-----------------------------
>  hw/intc/armv7m_nvic.c |  5 ++--
>  3 files changed, 37 insertions(+), 49 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 9e00d40..6b07666 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -134,14 +134,13 @@ static void armv7m_instance_init(Object *obj)
>
>      memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
>
> -    object_initialize(&s->nvic, sizeof(s->nvic), TYPE_NVIC);
> -    qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "nvnic", &s->nvic, sizeof(s->nvic), TYPE_NVIC);
>      object_property_add_alias(obj, "num-irq",
>                                OBJECT(&s->nvic), "num-irq", &error_abort);
>
>      for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> -        object_initialize(&s->bitband[i], sizeof(s->bitband[i]), TYPE_BITBAND);
> -        qdev_set_parent_bus(DEVICE(&s->bitband[i]), sysbus_get_default());
> +        sysbus_init_child_obj(obj, "bitband[*]", &s->bitband[i],
> +                              sizeof(s->bitband[i]), TYPE_BITBAND);
>      }
>  }
>
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 133d5bb..c76d3ed 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -30,15 +30,6 @@ static void make_alias(IoTKit *s, MemoryRegion *mr, const char *name,
>      memory_region_add_subregion_overlap(&s->container, base, mr, -1500);
>  }
>
> -static void init_sysbus_child(Object *parent, const char *childname,
> -                              void *child, size_t childsize,
> -                              const char *childtype)
> -{
> -    object_initialize(child, childsize, childtype);
> -    object_property_add_child(parent, childname, OBJECT(child), &error_abort);
> -    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
> -}
> -
>  static void irq_status_forwarder(void *opaque, int n, int level)
>  {
>      qemu_irq destirq = opaque;
> @@ -119,53 +110,52 @@ static void iotkit_init(Object *obj)
>
>      memory_region_init(&s->container, obj, "iotkit-container", UINT64_MAX);
>
> -    init_sysbus_child(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> -                      TYPE_ARMV7M);
> +    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
> +                          TYPE_ARMV7M);
>      qdev_prop_set_string(DEVICE(&s->armv7m), "cpu-type",
>                           ARM_CPU_TYPE_NAME("cortex-m33"));
>
> -    init_sysbus_child(obj, "secctl", &s->secctl, sizeof(s->secctl),
> -                      TYPE_IOTKIT_SECCTL);
> -    init_sysbus_child(obj, "apb-ppc0", &s->apb_ppc0, sizeof(s->apb_ppc0),
> -                      TYPE_TZ_PPC);
> -    init_sysbus_child(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
> -                      TYPE_TZ_PPC);
> -    init_sysbus_child(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
> -    object_initialize(&s->mpc_irq_orgate, sizeof(s->mpc_irq_orgate),
> -                      TYPE_OR_IRQ);
> -    object_property_add_child(obj, "mpc-irq-orgate",
> -                              OBJECT(&s->mpc_irq_orgate), &error_abort);
> +    sysbus_init_child_obj(obj, "secctl", &s->secctl, sizeof(s->secctl),
> +                          TYPE_IOTKIT_SECCTL);
> +    sysbus_init_child_obj(obj, "apb-ppc0", &s->apb_ppc0, sizeof(s->apb_ppc0),
> +                          TYPE_TZ_PPC);
> +    sysbus_init_child_obj(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
> +                          TYPE_TZ_PPC);
> +    sysbus_init_child_obj(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
> +    object_initialize_child(obj, "mpc-irq-orgate", &s->mpc_irq_orgate,
> +                            sizeof(s->mpc_irq_orgate), TYPE_OR_IRQ,
> +                            &error_abort, NULL);
> +
>      for (i = 0; i < ARRAY_SIZE(s->mpc_irq_splitter); i++) {
>          char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
>          SplitIRQ *splitter = &s->mpc_irq_splitter[i];
>
> -        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
> -        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
> +        object_initialize_child(obj, name, splitter, sizeof(*splitter),
> +                                TYPE_SPLIT_IRQ, &error_abort, NULL);
>          g_free(name);
>      }
> -    init_sysbus_child(obj, "timer0", &s->timer0, sizeof(s->timer0),
> -                      TYPE_CMSDK_APB_TIMER);
> -    init_sysbus_child(obj, "timer1", &s->timer1, sizeof(s->timer1),
> -                      TYPE_CMSDK_APB_TIMER);
> -    init_sysbus_child(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
> -                      TYPE_UNIMPLEMENTED_DEVICE);
> -    object_initialize(&s->ppc_irq_orgate, sizeof(s->ppc_irq_orgate),
> -                      TYPE_OR_IRQ);
> -    object_property_add_child(obj, "ppc-irq-orgate",
> -                              OBJECT(&s->ppc_irq_orgate), &error_abort);
> -    object_initialize(&s->sec_resp_splitter, sizeof(s->sec_resp_splitter),
> -                      TYPE_SPLIT_IRQ);
> -    object_property_add_child(obj, "sec-resp-splitter",
> -                              OBJECT(&s->sec_resp_splitter), &error_abort);
> +    sysbus_init_child_obj(obj, "timer0", &s->timer0, sizeof(s->timer0),
> +                          TYPE_CMSDK_APB_TIMER);
> +    sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
> +                          TYPE_CMSDK_APB_TIMER);
> +    sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
> +                          TYPE_UNIMPLEMENTED_DEVICE);
> +    object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
> +                            sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
> +                            &error_abort, NULL);
> +    object_initialize_child(obj, "sec-resp-splitter", &s->sec_resp_splitter,
> +                            sizeof(s->sec_resp_splitter), TYPE_SPLIT_IRQ,
> +                            &error_abort, NULL);
>      for (i = 0; i < ARRAY_SIZE(s->ppc_irq_splitter); i++) {
>          char *name = g_strdup_printf("ppc-irq-splitter-%d", i);
>          SplitIRQ *splitter = &s->ppc_irq_splitter[i];
>
> -        object_initialize(splitter, sizeof(*splitter), TYPE_SPLIT_IRQ);
> -        object_property_add_child(obj, name, OBJECT(splitter), &error_abort);
> +        object_initialize_child(obj, name, splitter, sizeof(*splitter),
> +                                TYPE_SPLIT_IRQ, &error_abort, NULL);
> +        g_free(name);
>      }
> -    init_sysbus_child(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
> -                      TYPE_UNIMPLEMENTED_DEVICE);
> +    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
> +                          TYPE_UNIMPLEMENTED_DEVICE);
>  }
>
>  static void iotkit_exp_irq(void *opaque, int n, int level)
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 661be88..7a5330f 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2296,9 +2296,8 @@ static void armv7m_nvic_instance_init(Object *obj)
>      NVICState *nvic = NVIC(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>
> -    object_initialize(&nvic->systick[M_REG_NS],
> -                      sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
> -    qdev_set_parent_bus(DEVICE(&nvic->systick[M_REG_NS]), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "systick-reg-ns", &nvic->systick[M_REG_NS],
> +                          sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
>      /* We can't initialize the secure systick here, as we don't know
>       * yet if we need it.
>       */
> --
> 1.8.3.1
>
>
