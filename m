Received: by 10.223.150.237 with SMTP id u100csp326649wrb;
        Fri, 3 Nov 2017 15:24:20 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RrpcfTnn3M13TSsvtQHFJmRsxyTpNjBFA619qtrQ3+5D6wVnjeFL0joAxR2pN5aPraNUcu
X-Received: by 10.129.227.76 with SMTP id w12mr5685422ywl.81.1509747860363;
        Fri, 03 Nov 2017 15:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509747860; cv=none;
        d=google.com; s=arc-20160816;
        b=aD+8So1lzvuLhhlfSOjYhcbKsZksii8Kw3FrxNBA/uc9u4xGHZLrJNrJYuxFPr98L8
         nmXDk+L34uxvoL8pwGJoygp9mj/XiHVdx5omHVUPpI+5mbG2L6ZQiaOJYdKjpBTJb5fx
         Y9T9TW/vYSZb786p7OPJ5vZ+FO/BL1LOQMSY4ykyItTiYadxYtqwffT9mA1PMdQ3W20E
         o+BJiAfuwcp1KpcGy7h9SwC3LJxOLr/PwTx2CKWEXQZXTmntSfC4mxz+asnCS+iS5CLl
         91QkMdI6Ut7XLqsduthiye7dYYr04a2n9Aq8LQXsVyzcRQd1WJnK9cKAfSw6iXbmeAka
         NXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=KPXyjjBGehXwj5P5Pp5CEeWhPf4OE1qilR2X7KAgho4=;
        b=M6IB4OZA8I2c8fw+Tq4OMkByiJz8KAgqZE9ACkOE1v4BwaqCOj0VrKCTgqht0DqBi2
         RBBotRAc1q67IB8VNio5BaB2wI3fqwRnBr0l0RWi2+M4+TmnlaAW7lBsMS+zAcL7TTxa
         7XsKp/sKckyCRLIZoIRzanQZxERzkUnZtrU9hdDIYE9zzMgTmIcitPHvG+R2rtHOnS1s
         D3+5PSAWm8jd9DgoDZGqbrvgmGKjpvxtWgaWQGL+0we8PQyuP+TTC1Qzz2okPg54tecE
         mFFGBEkG1vxzNmlfEqNSqZ0FoWSRtmsJINnqgTHQ9z8yXsBD5TBrqyVgU585fscp3fqc
         Tb5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mq2O6eau;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=R4nM5gmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si1642559ywm.151.2017.11.03.15.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 15:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=mq2O6eau;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=R4nM5gmv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAkNv-0003rJ-OE
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 18:24:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAkNo-0003qw-Q9
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 18:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAkNl-0001MT-LI
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 18:24:12 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50175)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eAkNl-0001M0-Dy; Fri, 03 Nov 2017 18:24:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 43BB2202F7;
	Fri,  3 Nov 2017 18:24:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 03 Nov 2017 18:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=KPXyjjBGehXwj5P5Pp5CEeWhPf4OE1qilR2X7KAgho4=; b=mq2O6
	eauBWDRECE23jDk/0s0AaOdGMdTocRFnev7APWWsqu/Lxg6SHkAkMoOTPBEMvIiN
	NV+W+45tMAXEAkuq4yLGjuQm9+o7payPfsk71yM35bA3YWnh1+VaPkW+jixGpswK
	FLop/hJ+j0A4KnrW/odi9AwDzeklUuqOJprI6A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=KPXyjjBGehXwj5P5Pp5CEeWhPf4OE
	1qilR2X7KAgho4=; b=R4nM5gmvyXudz2blSP+JerR+p5hAzzHv++jekl3+U2CS7
	wOWL50KeUxc3ux/txcARXfCoZzt044W2bNx0ylGyRM26X0lZOviM08eBZfk2jj0k
	7LxxePjNp3bABvw+eYJrH+dsI6ozyou8c2r61u3XSss1skRucP6CJria2hJUSxIs
	pVfIvzjj3+Rql8FOgBX/JFq/AdRpNB6Y8+/Too/rEycVfZXYof3riagbPBZsoRNI
	Z2y3KscIS9AubxjmW33I4aCT1wqbIVNnhVCAVl0HDxcJOqbZb9ROqEoRjhIvQLqS
	ti+2jUogfVMTVr+5eQl8pFVFgBPQP2vvehV6SgvaQ==
X-ME-Sender: <xms:iOz8WWIfaSbD8TF-G7stwfRGkfDI3kclk099TvdYvTpBvuIkFwPgRA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B87487E17C;
	Fri,  3 Nov 2017 18:24:07 -0400 (EDT)
Date: Fri, 3 Nov 2017 18:24:07 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20171103222407.GA22411@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103200233.GI3111@localhost.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 17XxcJLJtgCd

On Fri, Nov 03, 2017 at 21:02:33 +0100, Eduardo Habkost wrote:
> On Fri, Nov 03, 2017 at 02:56:10PM -0400, Emilio G. Cota wrote:
> > On Fri, Nov 03, 2017 at 14:47:33 -0400, Emilio G. Cota wrote:
> > > diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> > > index e2d15a1..395d1b5 100644
> > > --- a/hw/arm/xlnx-zcu102.c
> > > +++ b/hw/arm/xlnx-zcu102.c
(snip)
> > 
> > Should we update max_cpus to just NUM_APU_CPUS as well for these boards?
> > -smp 5 or 6 (NUM_APU + NUM_RPU) still gets us 4 vCPUs.
> > 
> > I see there's code for RPU cpus but it seems disabled at compile-time
> > at xlnx-zynqmp.c:431:
> >    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false)
> > Or is there a run-time way to override this?
> 
> Device properties can be overridden using -global, e.g.:
> 
>   -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> 
> (",," is how commas are escaped in QEMU options)

Very interesting! This raises two separate issues.

1. Using this feature breaks 55c3cee ("qom: Introduce CPUClass.tcg_initialize",
  2017-10-24). For instance:
	qemu-system-aarch64 -machine xlnx-zcu102 \
	 -global driver=xlnx,,zynqmp,property=has_rpu,value=on
  This will try to initialize TCG twice. The reason is that the second
  set of CPUs (the "RPUs") is of a different "object type name", which ends
  up as a different CPUClass. In xlnx-zynqmp.c:

    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
        char *name;

        object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
                          "cortex-r5-" TYPE_ARM_CPU);
  This hunk only runs when we use the -global override.

  This other hunk always runs. It initializes the "APUs":
      for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
        object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
                          "cortex-a53-" TYPE_ARM_CPU);

  A trivial, ugly fix would be to either use the same "object name"
  for both sets of CPUs or (re)introduce a static variable in
  arm_translate_init.
  I'd prefer to be able to set tcg_initialized field directly for
  the RPU's CPUClass. Is that possible? I don't know much about
  qom/object code, so any good suggestion here would be appreciated.

2. Coming back to the original problem: given that we can get
  additional vCPUs, I think we need an additional flag to signal
  this. Otherwise we'll have to always do "max_cpus = mc.max_cpus",
  which for most machines would be a huge waste of TCG regions.
  See delta below.

Thanks,

		Emilio

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 62f160e..8c8ce51 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -103,6 +103,7 @@ typedef struct {
 /**
  * MachineClass:
  * @max_cpus: maximum number of CPUs supported. Default: 1
+ * @force_max_cpus: if set, force the global max_cpus to match @max_cpus
  * @min_cpus: minimum number of CPUs supported. Default: 1
  * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
  * @get_hotplug_handler: this function is called during bus-less
@@ -181,7 +182,8 @@ struct MachineClass {
         no_sdcard:1,
         has_dynamic_sysbus:1,
         pci_allow_0_address:1,
-        legacy_fw_cfg_order:1;
+        legacy_fw_cfg_order:1,
+        force_max_cpus;
     int is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 395d1b5..e406dc3 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -186,6 +186,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->force_max_cpus = 1;
     mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
     mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
@@ -244,6 +245,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->force_max_cpus = 1;
     mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
     mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
diff --git a/vl.c b/vl.c
index 3ca5ee8..a21183d 100644
--- a/vl.c
+++ b/vl.c
@@ -4339,6 +4339,15 @@ int main(int argc, char **argv, char **envp)
         max_cpus = machine_class->default_cpus;
     }
 
+    /*
+     * Some boards can instantiate additional CPUs, e.g. by overriding
+     * device params via -global arguments, so they enforce the value
+     * that max_cpus should take.
+     */
+    if (machine_class->force_max_cpus) {
+        max_cpus = machine_class->max_cpus;
+    }
+
     /* sanity-check smp_cpus and max_cpus */
     if (smp_cpus < machine_class->min_cpus) {
         error_report("Invalid SMP CPUs %d. The min CPUs "
