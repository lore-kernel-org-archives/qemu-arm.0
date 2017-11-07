Received: by 10.223.150.237 with SMTP id u100csp461491wrb;
        Tue, 7 Nov 2017 12:26:56 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Stbup+sD3vaHNBbLtRMjpHy0dTitvx1jdm8BDri045UWQBm9o7Z4hpKjJZup/Neo9oMYy2
X-Received: by 10.129.181.84 with SMTP id c20mr12475316ywk.505.1510086416216;
        Tue, 07 Nov 2017 12:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510086416; cv=none;
        d=google.com; s=arc-20160816;
        b=r1VTsj3t6Jbet9E78uzLUP8SxKR5IIjbiAB4Pp5dadzq5QpGzXwc2pQxU49DtgG3mM
         R9qtQhrvhkQgRdivv2XCsFTkLaOOlnL1u52IYcbx3jWnd0mXXwJliw2ZjYw1i99PmHIG
         Zxp04EvXnJnyWqrs1tS94PS8RTHoOcuvl3Wumv98eM+ExNPe5PeaqNAIASS2sts+lLbo
         nD/Yp7Q9NxAkHQw/YeNERMViJ808QWQ/qp32ZQqoXOawE/BJVM+p+GlLMqxc+fnCp1bd
         TZIbtZv8bJicDqaTHovFhWTjAViDrNu7+6zBww8kbASnFF4OwRrqJfaeg84YQe+N7Q3i
         2M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=EDkqbvXWssCOqh72rt+n0E87f6NJJ9StUdFCuBsaOPQ=;
        b=GV7stthjHVV9PhjlSiaT3ljx1BWtHLGPt57cHJk84FOu0dQbqY1FXAXWt7eXGtxE7r
         wuqDVL1B9NPa/qB+LNrvbFGmhnAiWIqOcgTW7jXdwWKrBRuzz5OwoJXS6v/JrCjTCUuV
         wdJgsK0j0++qrfukI2KrzPZLx7UyAZWnpKg+wnz76D+OGo01vFtR1h0O9SqxDA282n9v
         ScRVQgri8oYJhUBdEJJIvvG+BWEJAWbJRL31tSyFFbnUSsadZrlLf2cP7BDzfuRajun8
         eIIlqfXJeeO/HrUMnSFXaTl90sg59tEuSVv8m3fij/I7Q6L7E7ERN6p668EXkhPgFMBf
         QvKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n128si465774ywd.186.2017.11.07.12.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 12:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCASV-0001ei-Jd
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 15:26:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCASG-0001dF-W0
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eCASC-0002An-Fb
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:26:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eCASC-0002AT-6A; Tue, 07 Nov 2017 15:26:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03B4961D0E;
	Tue,  7 Nov 2017 20:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 03B4961D0E
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 055BD648C1;
	Tue,  7 Nov 2017 20:26:31 +0000 (UTC)
Date: Tue, 7 Nov 2017 18:26:30 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20171107202630.GG3111@localhost.localdomain>
References: <cover.1510080103.git.alistair.francis@xilinx.com>
	<949865c4381080ce685097390f69115d7f6ef111.1510080103.git.alistair.francis@xilinx.com>
	<20171107200026.GF3111@localhost.localdomain>
	<CAKmqyKPtzhQk+=vW=fmOxWrWiDhBZJ9FCPcKroeW7756Fd-R4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKPtzhQk+=vW=fmOxWrWiDhBZJ9FCPcKroeW7756Fd-R4Q@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 07 Nov 2017 20:26:35 +0000 (UTC)
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I82F59rJwsAG

On Tue, Nov 07, 2017 at 12:04:18PM -0800, Alistair Francis wrote:
> On Tue, Nov 7, 2017 at 12:00 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Tue, Nov 07, 2017 at 10:59:39AM -0800, Alistair Francis wrote:
> >> Allow the -smp command line option to control the number of CPUs we
> >> create.
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> >> ---
> >>
> >>  hw/arm/xlnx-zcu102.c |  3 ++-
> >>  hw/arm/xlnx-zynqmp.c | 26 ++++++++++++++++----------
> >>  2 files changed, 18 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> >> index e2d15a1c9d..7ec03dad42 100644
> >> --- a/hw/arm/xlnx-zcu102.c
> >> +++ b/hw/arm/xlnx-zcu102.c
> >> @@ -235,7 +235,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
> >>  {
> >>      MachineClass *mc = MACHINE_CLASS(oc);
> >>
> >> -    mc->desc = "Xilinx ZynqMP ZCU102 board";
> >> +    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5s based on " \
> >> +               "the value of smp";
> >>      mc->init = xlnx_zcu102_init;
> >>      mc->block_default_type = IF_IDE;
> >>      mc->units_per_default_bus = 1;
> >> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> >> index d4b6560194..c707c66322 100644
> >> --- a/hw/arm/xlnx-zynqmp.c
> >> +++ b/hw/arm/xlnx-zynqmp.c
> >> @@ -98,8 +98,9 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
> >>  {
> >>      Error *err = NULL;
> >>      int i;
> >> +    int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
> >>
> >> -    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
> >> +    for (i = 0; i < num_rpus; i++) {
> >>          char *name;
> >>
> >>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> >> @@ -132,8 +133,9 @@ static void xlnx_zynqmp_init(Object *obj)
> >>  {
> >>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
> >>      int i;
> >> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> >>
> >> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> >> +    for (i = 0; i < num_apus; i++) {
> >>          object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
> >>                            "cortex-a53-" TYPE_ARM_CPU);
> >>          object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
> >> @@ -182,6 +184,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >>      MemoryRegion *system_memory = get_system_memory();
> >>      uint8_t i;
> >>      uint64_t ram_size;
> >> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> >>      const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
> >>      ram_addr_t ddr_low_size, ddr_high_size;
> >>      qemu_irq gic_spi[GIC_NUM_SPI_INTR];
> >> @@ -233,10 +236,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >>
> >>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
> >>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
> >> -    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
> >> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
> >>
> >>      /* Realize APUs before realizing the GIC. KVM requires this.  */
> >> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> >> +    for (i = 0; i < num_apus; i++) {
> >>          char *name;
> >>
> >>          object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
> >> @@ -292,7 +295,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >>          }
> >>      }
> >>
> >> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
> >> +    for (i = 0; i < num_apus; i++) {
> >>          qemu_irq irq;
> >>
> >>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
> >> @@ -307,11 +310,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
> >>      }
> >>
> >>      if (s->has_rpu) {
> >> -        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> >> -        if (err) {
> >> -            error_propagate(errp, err);
> >> -            return;
> >> -        }
> >> +        info_report("The 'has_rpu' property is no longer required, to use the "
> >> +                    "RPUs just use -smp 6.");
> >> +    }
> >
> > Is "-global driver=xlnx,,zynqmp,property=has_rpu,value=on"
> > without an explicit -smp option supposed to be a supported
> > configuration?
> >
> > 0) On current master, we have this:
> >
> >   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> >   **
> >   ERROR:/home/ehabkost/rh/proj/virt/qemu/tcg/tcg.c:538:tcg_register_thread: assertion failed: (n < max_cpus)
> >   Aborted (core dumped)
> >
> > 1) With your patch we have this:
> >
> >   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
> >   QEMU 2.10.50 monitor - type 'help' for more information
> >   (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
> >   (qemu) info cpus
> >   * CPU #0: thread_id=1662
> >   (qemu)
> >
> > 2) With your patch plus Emilio's original min_cpus/default_cpus
> > proposal[1], we have this:
> >
> >   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
> >   QEMU 2.10.50 monitor - type 'help' for more information
> >   (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
> >   (qemu) info cpus
> >   * CPU #0: thread_id=7112
> >     CPU #1: (halted) thread_id=7113
> >     CPU #2: (halted) thread_id=7114
> >     CPU #3: (halted) thread_id=7115
> >   (qemu)
> >
> > 3) With Emilio's max_additional_cpus proposal[2], we have this:
> >
> >   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
> >   QEMU 2.10.50 monitor - type 'help' for more information
> >   (qemu) info cpus
> >   * CPU #0: thread_id=4045
> >     CPU #1: (halted) thread_id=4046
> >     CPU #2: (halted) thread_id=4047
> >     CPU #3: (halted) thread_id=4048
> >     CPU #4: (halted) thread_id=4049
> >     CPU #5: (halted) thread_id=4050
> >   (qemu)
> >
> >
> > Which option is preferred?  I like option #2 because it's
> > simpler, but I would like to confirm this is really the intended
> > behavior.
> 
> After this patch (and the fix to TCG otherwise it seg faults) no one
> should use the has_rpu property. It is ignored and will print a
> message saying that it is ignored.
> 
> Users should only use the -smp option now. So option 2 is the way to go.

Sounds reasonable to me.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I just sent one small comment to the min_cpus/default_cpus patch
at [1], and I'm waiting for Richard's input on Emilio's TCG
fix[3].

[3] https://mid.mail-archive.com/20171106201332.GA2152@flamenco


> 
> Thanks,
> Alistair
> 
> >
> >
> > [1] https://mid.mail-archive.com/1509734853-3014-1-git-send-email-cota@braap.org
> > [2] https://mid.mail-archive.com/20171106215454.GB2152@flamenco
> >
> >
> >> +
> >> +    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
> >> +    if (err) {
> >> +        error_propagate(errp, err);
> >> +        return;
> >>      }
> >>
> >>      if (!s->boot_cpu_ptr) {
> >> --
> >> 2.11.0
> >>
> >
> > --
> > Eduardo

-- 
Eduardo
