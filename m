Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp120343wrq;
        Tue, 5 Jun 2018 16:10:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJxojYz9V4x8xPp6qBgnSAL2S2PyWaLvAs41EIk54gQhVjf5OSAlHdYQbLq697WIPuAyvQM
X-Received: by 2002:a0c:b665:: with SMTP id q37-v6mr610452qvf.43.1528240201142;
        Tue, 05 Jun 2018 16:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528240201; cv=none;
        d=google.com; s=arc-20160816;
        b=km9ePt15/lND0IFhqGcMcrJbm5CdkxivzGSOWRQKqdZ+9cZQBMMbDCwDpAPW3m0pM/
         sUxo51hmm5AFFvVEkGFJKteGFmjtF8CcwzrDM3ik1FUeuo4ucgrocnPXtEPi9M4pCw8I
         /Hv2asloEoZ6kflD/+zxQjFoP2BdKtyIdFmLcoUi71RA4w9Iz4YfWvpO2RCKMBY6rIV0
         8lvON5ShNn5wC1RGUO2vKJ09uiPGbX32rKMwo68l7Mk6DSzgv+9EvpqwyJCkFn9Rg196
         1nLec1ddiISQnbtLgwpPfhZUJyRJh4zQ7POQTx3x1GgqFjRnhSV+lTpfgmomPKmSOPp6
         jgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=v0RanHkJaJx7URtrzYeOL5rkXUVW1+pHmQfT9PGi6nk=;
        b=i+Sx1tAcKTLCxFvstK+TUzvT3pgwG7djxaqu+57blNfPzW889mNq4gtoHhs7TqFgbk
         CJ+LyvZN6uG7ee2PwNjZ0y165zZZsEX/fmMLxUXB1WK1jMIxm2mJKXaRJgCEyupXE7aV
         P3kDcw9L8dt5lqspYG8coVO1stjVqqSBkA1x73fj+zh93A1DCkisElPmVXDfjrQsFEy/
         RuLpevVlGQT0k2n/dgfdVU1A3uu+uGLxFucyNIy8fP1aOWTfV/XpxzrHrteM8/yWORJI
         UBbyAqWdNG0m5RGNLdzNYWNl9gUk1RDnrwPuf/Q1zSlOqjsKGNhX9LqElLCUrgEAKNJx
         TCkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EGWJCJSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m24-v6si1249123qtb.86.2018.06.05.16.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 16:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EGWJCJSC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQL5U-0001td-Jk
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 19:10:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQL5K-0001ls-FF
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 19:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQL5J-0006nC-8O
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 19:09:50 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:43332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fQL5G-0006lh-ES; Tue, 05 Jun 2018 19:09:46 -0400
Received: by mail-lf0-x242.google.com with SMTP id n15-v6so6140644lfn.10;
	Tue, 05 Jun 2018 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=v0RanHkJaJx7URtrzYeOL5rkXUVW1+pHmQfT9PGi6nk=;
	b=EGWJCJSCa7I7Yr9luipW4oH7fBDS+TsccZj5BW0dlIVPsg8JaqR/Z9TOp1MdjU78wM
	y5JCwyDkiTdVzWRnmp+RPnWlMv9Wsg22SM0q7rU2pekf0lznV6w37XaiINqRqGROqxXy
	+/gx0cKyTNR0dEMqCjmXqm8QrOL5oqt+1rzvrnxT5yjXCJnjsPkr5DbITo1qtTdlMV4h
	wuo7vT+ii20pmLv22FVjRm+Ioq78uXJZWndLDbVHRaergGlTAKGCkyIBIWR8cw6w7j7w
	A5k6VlwalGR0ORw87t7IUaCJdCsnLBJpGPXVV/3OpbtFXtzkUac2NWx9vGeKE/ymUego
	Eo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=v0RanHkJaJx7URtrzYeOL5rkXUVW1+pHmQfT9PGi6nk=;
	b=qe1qn6w6dRDwjwtp9RIxxHQ3qV0jhAv3pIsU6umwoTb3Cu5FBsMjUT30KVnRuVGdsB
	v14o6Mt+6idty9RbnStk/DkkXZiAVK+Touw+yIBAWNTn0bxPwWuGjCItJlMTcKCjSWPA
	934+ykzgsP036WPvogLMGvcuoSd/H7KK51MXRv9C2TprK09yyB7G7zrOlnVIVb9bDApg
	2NFKbntZdhi42i9UDfOj++ENDf1h7Bjjg2KXJw9J4EX9Ci1gYRxdmskOFDf68qq39/aH
	jyCZwxIW1nPz6vR+GR9JbZL2YJQcooLnFqTOeY3y7PivLzJBoLo4TiUXXp3hsc/daiNP
	wZqQ==
X-Gm-Message-State: APt69E3LXSbEbcn3/a9Glm1ZjXWSPYGtnLMdAz3frAuWpiNM3PJT9fQT
	Dt9DuMpgN4aZrIywpNjOktFW2mPJvWwC78SRBmc=
X-Received: by 2002:a19:b2c2:: with SMTP id t63-v6mr325917lfk.27.1528240183657;
	Tue, 05 Jun 2018 16:09:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:20e2:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 16:09:13 -0700 (PDT)
In-Reply-To: <1528233505-25842-1-git-send-email-thuth@redhat.com>
References: <1528233505-25842-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 5 Jun 2018 16:09:13 -0700
X-Google-Sender-Auth: LxyWXlsmKdWPbLiL1l5TGkr1SK8
Message-ID: <CAKmqyKM0O+oLZyxXuW+tdydgrHEi1SpJdTkO_5ixT8pXGGZrKA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Remove the deprecated
 xlnx-ep108 machine
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
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PmcYI7t8z55m

On Tue, Jun 5, 2018 at 2:18 PM, Thomas Huth <thuth@redhat.com> wrote:
> It has been marked as deprecated since QEMU v2.11, so it is time to
> remove this now. The xlnx-zcu102 machine is very much the same and
> can be used as a replacement instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zcu102.c | 62 ++--------------------------------------------------
>  qemu-doc.texi        |  5 -----
>  2 files changed, 2 insertions(+), 65 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index c70278c..f26fd8e 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -39,10 +39,6 @@ typedef struct XlnxZCU102 {
>  #define ZCU102_MACHINE(obj) \
>      OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
>
> -#define TYPE_EP108_MACHINE   MACHINE_TYPE_NAME("xlnx-ep108")
> -#define EP108_MACHINE(obj) \
> -    OBJECT_CHECK(XlnxZCU102, (obj), TYPE_EP108_MACHINE)
> -
>  static struct arm_boot_info xlnx_zcu102_binfo;
>
>  static bool zcu102_get_secure(Object *obj, Error **errp)
> @@ -73,8 +69,9 @@ static void zcu102_set_virt(Object *obj, bool value, Error **errp)
>      s->virt = value;
>  }
>
> -static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
> +static void xlnx_zcu102_init(MachineState *machine)
>  {
> +    XlnxZCU102 *s = ZCU102_MACHINE(machine);
>      int i;
>      uint64_t ram_size = machine->ram_size;
>
> @@ -183,60 +180,6 @@ static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
>      arm_load_kernel(s->soc.boot_cpu_ptr, &xlnx_zcu102_binfo);
>  }
>
> -static void xlnx_ep108_init(MachineState *machine)
> -{
> -    XlnxZCU102 *s = EP108_MACHINE(machine);
> -
> -    if (!qtest_enabled()) {
> -        info_report("The Xilinx EP108 machine is deprecated, please use the "
> -                    "ZCU102 machine (which has the same features) instead.");
> -    }
> -
> -    xlnx_zynqmp_init(s, machine);
> -}
> -
> -static void xlnx_ep108_machine_instance_init(Object *obj)
> -{
> -    XlnxZCU102 *s = EP108_MACHINE(obj);
> -
> -    /* EP108, we don't support setting secure or virt */
> -    s->secure = false;
> -    s->virt = false;
> -}
> -
> -static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "Xilinx ZynqMP EP108 board (Deprecated, please use xlnx-zcu102)";
> -    mc->init = xlnx_ep108_init;
> -    mc->block_default_type = IF_IDE;
> -    mc->units_per_default_bus = 1;
> -    mc->ignore_memory_transaction_failures = true;
> -    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
> -    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
> -}
> -
> -static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
> -    .name       = MACHINE_TYPE_NAME("xlnx-ep108"),
> -    .parent     = TYPE_MACHINE,
> -    .class_init = xlnx_ep108_machine_class_init,
> -    .instance_init = xlnx_ep108_machine_instance_init,
> -    .instance_size = sizeof(XlnxZCU102),
> -};
> -
> -static void xlnx_ep108_machine_init_register_types(void)
> -{
> -    type_register_static(&xlnx_ep108_machine_init_typeinfo);
> -}
> -
> -static void xlnx_zcu102_init(MachineState *machine)
> -{
> -    XlnxZCU102 *s = ZCU102_MACHINE(machine);
> -
> -    xlnx_zynqmp_init(s, machine);
> -}
> -
>  static void xlnx_zcu102_machine_instance_init(Object *obj)
>  {
>      XlnxZCU102 *s = ZCU102_MACHINE(obj);
> @@ -289,4 +232,3 @@ static void xlnx_zcu102_machine_init_register_types(void)
>  }
>
>  type_init(xlnx_zcu102_machine_init_register_types)
> -type_init(xlnx_ep108_machine_init_register_types)
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index f00706b..2effe66 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -2965,11 +2965,6 @@ support page sizes < 4096 any longer.
>
>  @section System emulator machines
>
> -@subsection Xilinx EP108 (since 2.11.0)
> -
> -The ``xlnx-ep108'' machine has been replaced by the ``xlnx-zcu102'' machine.
> -The ``xlnx-zcu102'' machine has the same features and capabilites in QEMU.
> -
>  @section Block device options
>
>  @subsection "backing": "" (since 2.12.0)
> --
> 1.8.3.1
>
>
