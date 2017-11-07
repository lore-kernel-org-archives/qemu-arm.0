Received: by 10.223.150.237 with SMTP id u100csp435731wrb;
        Tue, 7 Nov 2017 12:00:47 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RTyoqU/21CP8bkOSuqHXLC9OGXfExBHQPLS/6VIXc/g8CPWZPCmbhDhxjsz3KOvAb5fFo2
X-Received: by 10.37.195.198 with SMTP id t189mr7978270ybf.73.1510084847807;
        Tue, 07 Nov 2017 12:00:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510084847; cv=none;
        d=google.com; s=arc-20160816;
        b=i5V/KOrBBJiuuVUlorjr8o3hPC2ObrcWxmW9ligfBCG4mVY7r6C0kRVgwwK55Bescq
         FCNco9AIiMnCTZEceoTDUC/TQ6flEJHTQKxhil3jNviEss4dalgQQaQyjdC2y4v212S1
         +fJ9iJEJ12Jffnrpkj1GxZnC6bA5tuxrRJlheYcE6KysvJ3LSI9ajuxxBXPnodX4+PDo
         sRfRUEWE/YsSnzC6c/+LDaWmuwJuO5kTs0OI2aCQaO+EM0vFB/Kyd/f/YGy60aWLa00X
         CJMDSDYoWWNRHuO1R+sTO4Bo4yKXEipC6F1eS+Hx/ALywf6V6Mycj9BpsuoRq49FKIlc
         DjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=azZgacPiadi/6DQ4n2s1s447KE6d5VNgYJe/lw3sYj8=;
        b=CWQjYilY3mb+qjIyus+1oKLOzYBMbXu7Fi1+VUygpfgwpy+tHTuox9QrMsDTkO4Q5+
         WX6UdNQ2FV4hLb85ZfSPNdBfRdeI7gQtStIMw1j/V8vIKPOA3zH0B+r4pxyME+FMMJtW
         LElER9AYIhw7c0rWsqxGCWXPP4dSWaevtSrA0Oauo8aD2YuWNRSaNDTuo8UiaTIkRHKj
         4NNdYOMvyv/0aBb/ZlSVLNxeopwrkBW1YgkfbckX44ETaW8N5A5BM+DM6DUdDo2F0v21
         +PIfonvgOxSyj5/qup8u4Huz4Whumv8G9mTqzF5F8Rqbk0IVe5KDv3pqbaZ1v94xuS5F
         TeAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si447404ybg.641.2017.11.07.12.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 12:00:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCA3D-0007yE-8k
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 15:00:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCA31-0007y7-QN
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCA2y-0000Ij-NI
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:00:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42475)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eCA2y-0000IV-DO; Tue, 07 Nov 2017 15:00:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B0D3A58A5;
	Tue,  7 Nov 2017 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B0D3A58A5
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDE415EDE0;
	Tue,  7 Nov 2017 20:00:27 +0000 (UTC)
Date: Tue, 7 Nov 2017 18:00:26 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171107200026.GF3111@localhost.localdomain>
References: <cover.1510080103.git.alistair.francis@xilinx.com>
	<949865c4381080ce685097390f69115d7f6ef111.1510080103.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <949865c4381080ce685097390f69115d7f6ef111.1510080103.git.alistair.francis@xilinx.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 Nov 2017 20:00:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v1 1/2] xlnx-zynqmp: Properly support the smp
 command line option
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, f4bug@amsat.org, cota@braap.org,
	qemu-arm@nongnu.org, alistair23@gmail.com,
	Marcel Apfelbaum <marcel@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kb8AiixC93DZ

On Tue, Nov 07, 2017 at 10:59:39AM -0800, Alistair Francis wrote:
> Allow the -smp command line option to control the number of CPUs we
> create.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> 
>  hw/arm/xlnx-zcu102.c |  3 ++-
>  hw/arm/xlnx-zynqmp.c | 26 ++++++++++++++++----------
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index e2d15a1c9d..7ec03dad42 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -235,7 +235,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
>  
> -    mc->desc = "Xilinx ZynqMP ZCU102 board";
> +    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5s based on " \
> +               "the value of smp";
>      mc->init = xlnx_zcu102_init;
>      mc->block_default_type = IF_IDE;
>      mc->units_per_default_bus = 1;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index d4b6560194..c707c66322 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -98,8 +98,9 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>  {
>      Error *err = NULL;
>      int i;
> +    int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>  
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> +    for (i = 0; i < num_rpus; i++) {
>          char *name;
>  
>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> @@ -132,8 +133,9 @@ static void xlnx_zynqmp_init(Object *obj)
>  {
>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
>      int i;
> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>  
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +    for (i = 0; i < num_apus; i++) {
>          object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
>                            "cortex-a53-" TYPE_ARM_CPU);
>          object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
> @@ -182,6 +184,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *system_memory = get_system_memory();
>      uint8_t i;
>      uint64_t ram_size;
> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>      const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
>      ram_addr_t ddr_low_size, ddr_high_size;
>      qemu_irq gic_spi[GIC_NUM_SPI_INTR];
> @@ -233,10 +236,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
> -    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
>  
>      /* Realize APUs before realizing the GIC. KVM requires this.  */
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +    for (i = 0; i < num_apus; i++) {
>          char *name;
>  
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
> @@ -292,7 +295,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          }
>      }
>  
> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> +    for (i = 0; i < num_apus; i++) {
>          qemu_irq irq;
>  
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
> @@ -307,11 +310,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      }
>  
>      if (s->has_rpu) {
> -        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> -        if (err) {
> -            error_propagate(errp, err);
> -            return;
> -        }
> +        info_report("The 'has_rpu' property is no longer required, to use the "
> +                    "RPUs just use -smp 6.");
> +    }

Is "-global driver=xlnx,,zynqmp,property=has_rpu,value=on"
without an explicit -smp option supposed to be a supported
configuration?

0) On current master, we have this:

  $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on
  **
  ERROR:/home/ehabkost/rh/proj/virt/qemu/tcg/tcg.c:538:tcg_register_thread: assertion failed: (n < max_cpus)
  Aborted (core dumped)

1) With your patch we have this:

  $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
  QEMU 2.10.50 monitor - type 'help' for more information
  (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
  (qemu) info cpus
  * CPU #0: thread_id=1662
  (qemu) 

2) With your patch plus Emilio's original min_cpus/default_cpus
proposal[1], we have this:

  $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
  QEMU 2.10.50 monitor - type 'help' for more information
  (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
  (qemu) info cpus
  * CPU #0: thread_id=7112
    CPU #1: (halted) thread_id=7113
    CPU #2: (halted) thread_id=7114
    CPU #3: (halted) thread_id=7115
  (qemu)

3) With Emilio's max_additional_cpus proposal[2], we have this:

  $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
  QEMU 2.10.50 monitor - type 'help' for more information
  (qemu) info cpus
  * CPU #0: thread_id=4045
    CPU #1: (halted) thread_id=4046
    CPU #2: (halted) thread_id=4047
    CPU #3: (halted) thread_id=4048
    CPU #4: (halted) thread_id=4049
    CPU #5: (halted) thread_id=4050
  (qemu) 


Which option is preferred?  I like option #2 because it's
simpler, but I would like to confirm this is really the intended
behavior.


[1] https://mid.mail-archive.com/1509734853-3014-1-git-send-email-cota@braap.org
[2] https://mid.mail-archive.com/20171106215454.GB2152@flamenco


> +
> +    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
>      }
>  
>      if (!s->boot_cpu_ptr) {
> -- 
> 2.11.0
> 

-- 
Eduardo
