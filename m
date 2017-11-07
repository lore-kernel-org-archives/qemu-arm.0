Received: by 10.223.150.237 with SMTP id u100csp441061wrb;
        Tue, 7 Nov 2017 12:05:06 -0800 (PST)
X-Google-Smtp-Source: ABhQp+S3dcMWLZswDPgUS1nPYpgLxnz1tnxYSPhioW3R9OwsL4DRCgO/0vbY6bGjdw0SfZw9gJWG
X-Received: by 10.129.109.214 with SMTP id i205mr12984908ywc.509.1510085105944;
        Tue, 07 Nov 2017 12:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510085105; cv=none;
        d=google.com; s=arc-20160816;
        b=wmUqQBrBWod8GBZl8VmGdBg4k2XfqlUmRTugQBbkfp3VFC/WzXcS6cVCXS1RShNs0J
         fSQ/K8KM0OHCmOykeNtjmKAIlT1tKWfQkQCGJFnVCV1NK9grWdO22ZmsN2z1oENu/Qnh
         tUU16IhLNhFQHnWECWP7uvYzstwR1O1UV5CuM7ffJ6WQK+PKmiay2Egt/uoU5Lx2cGi9
         dKY8lLK9rdhtPURdmvcP/8sEcXIc+wIgkdMez0LrHrHUbOBiPH2pPhndFns3NhcoGpdT
         YsHzQXEWFZDVGZ05yUWzm9GZRPGVXiQipimUAMUvGSpWq6i0vUdUTJBqlfxk+cN/RhLT
         cDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ffwca7GoRd3gPAR3N2sJlsxx3B57J2DgfVn10vgiGXs=;
        b=f7MrrYazfUFYxkxNQqKGHibXtdyrkIp95KZwLBTW7DHDyLIOjqRhmKCg72bJo3M/hj
         lK8e/opKv5RVHhfruWSdyceBImjS649onuCVOWKrZRvpwru9P+mnxwNY3zolFGnFUlfn
         nLb+hm/M72ZlQ6xynhhRCUUcteO75IPVv5TaM8cNahNHoIXD7ouMl4rTXtZwr6VnHm0A
         bv/wA1Y99mmqyOwuXWLA1agmciGZiO8N1LcW6d2PymJQTr3eg5l2qNW5H77/WNr4BIUI
         ggKQRi2XMxCBHdeqD+YtEasQ2oW2zWv8a2ENZCkob1Fd5gOWFvvx3bDvJTRqXoc/1OJY
         vJRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lrvfO2HV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si417698ybm.251.2017.11.07.12.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 12:05:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lrvfO2HV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCA7N-0000yh-Eb
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 15:05:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCA7C-0000wR-K5
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:04:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCA7B-0001w0-7K
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 15:04:54 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:54162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eCA77-0001s4-St; Tue, 07 Nov 2017 15:04:50 -0500
Received: by mail-wm0-x244.google.com with SMTP id r196so6448151wmf.2;
	Tue, 07 Nov 2017 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ffwca7GoRd3gPAR3N2sJlsxx3B57J2DgfVn10vgiGXs=;
	b=lrvfO2HVBm9VgSyxDAQP59ne6IMWTrEmkRLtGK/Oopbd64ial57HCRakTrP1JO/KKD
	OKfBiu/usXGB5A7XQWXhP5YhLT22vz72CvJiEoR5Lo87eqeRf59eL8KJD46cXnsLqZna
	TBJpN8cxMIPG2lljWgmcQX5W6IaI9VtcaXQ0Z8vWzyVXmfiYV7cx0M8FD0UvDZMWTdwj
	7dGOZ+LXhnlMhq6LwOf/D3aB4lyYTjlVzJ9V8w2hISuHDMIhlxKWXoIbqi/GirmOR/ua
	QppKiA56/BpmtjfPrljeie98vub2S4Z6rnznOqZ3+/PQVLcw+cmxOFejMiHOP6q7PQYK
	p67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Ffwca7GoRd3gPAR3N2sJlsxx3B57J2DgfVn10vgiGXs=;
	b=fsAJg519+OSeQFBGX2vABWN9JdhTzuY47SbkCY3rIVbfqiehalbg7FZedfD84h1MQ0
	/z1WIFpy4prwGrBAC0MBd6TonRahjG2N8DY9KuuRyqK9AOF9uPYQxty/990jsxonVsJW
	2/2Pz7tKuxlB/zop+NPjxAXUmlQeqqU7M/DYGL5Wj6hrntTK7JsPd0klhVt32i8YHLl9
	o0SgYDQgLtNUz+ITG4vRnhexbFPql5TEfRVLcMR5+KW4OZc80HjoNyExBTLBX/jFpGfn
	crO074u5S4A1urnjAmi6MKTXipIit482dH984W3aMEyGRVXV4WR9jZLvFWQk6Kfz3OhD
	hQnQ==
X-Gm-Message-State: AJaThX4LD0n1atdohPXhnargxq0LzBSip0QpYBEsHmxxNd6zuziewX/G
	tQmaYxNQCLfeJmLocwa9YMmjWP/y1F93g9UK0rg=
X-Received: by 10.28.145.13 with SMTP id t13mr256587wmd.40.1510085088746; Tue,
	07 Nov 2017 12:04:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Tue, 7 Nov 2017 12:04:18 -0800 (PST)
In-Reply-To: <20171107200026.GF3111@localhost.localdomain>
References: <cover.1510080103.git.alistair.francis@xilinx.com>
	<949865c4381080ce685097390f69115d7f6ef111.1510080103.git.alistair.francis@xilinx.com>
	<20171107200026.GF3111@localhost.localdomain>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 7 Nov 2017 12:04:18 -0800
X-Google-Sender-Auth: 8yFPuQ867JSAYcGVdp8G_2U-pkk
Message-ID: <CAKmqyKPtzhQk+=vW=fmOxWrWiDhBZJ9FCPcKroeW7756Fd-R4Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ef8SudN5mcHr

On Tue, Nov 7, 2017 at 12:00 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Nov 07, 2017 at 10:59:39AM -0800, Alistair Francis wrote:
>> Allow the -smp command line option to control the number of CPUs we
>> create.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>>  hw/arm/xlnx-zcu102.c |  3 ++-
>>  hw/arm/xlnx-zynqmp.c | 26 ++++++++++++++++----------
>>  2 files changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
>> index e2d15a1c9d..7ec03dad42 100644
>> --- a/hw/arm/xlnx-zcu102.c
>> +++ b/hw/arm/xlnx-zcu102.c
>> @@ -235,7 +235,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>>  {
>>      MachineClass *mc = MACHINE_CLASS(oc);
>>
>> -    mc->desc = "Xilinx ZynqMP ZCU102 board";
>> +    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5s based on " \
>> +               "the value of smp";
>>      mc->init = xlnx_zcu102_init;
>>      mc->block_default_type = IF_IDE;
>>      mc->units_per_default_bus = 1;
>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>> index d4b6560194..c707c66322 100644
>> --- a/hw/arm/xlnx-zynqmp.c
>> +++ b/hw/arm/xlnx-zynqmp.c
>> @@ -98,8 +98,9 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>>  {
>>      Error *err = NULL;
>>      int i;
>> +    int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>>
>> -    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
>> +    for (i = 0; i < num_rpus; i++) {
>>          char *name;
>>
>>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
>> @@ -132,8 +133,9 @@ static void xlnx_zynqmp_init(Object *obj)
>>  {
>>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
>>      int i;
>> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>>
>> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
>> +    for (i = 0; i < num_apus; i++) {
>>          object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
>>                            "cortex-a53-" TYPE_ARM_CPU);
>>          object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
>> @@ -182,6 +184,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>      MemoryRegion *system_memory = get_system_memory();
>>      uint8_t i;
>>      uint64_t ram_size;
>> +    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
>>      const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
>>      ram_addr_t ddr_low_size, ddr_high_size;
>>      qemu_irq gic_spi[GIC_NUM_SPI_INTR];
>> @@ -233,10 +236,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>
>>      qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
>>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>> -    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
>> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
>>
>>      /* Realize APUs before realizing the GIC. KVM requires this.  */
>> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
>> +    for (i = 0; i < num_apus; i++) {
>>          char *name;
>>
>>          object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
>> @@ -292,7 +295,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>          }
>>      }
>>
>> -    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
>> +    for (i = 0; i < num_apus; i++) {
>>          qemu_irq irq;
>>
>>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
>> @@ -307,11 +310,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>      }
>>
>>      if (s->has_rpu) {
>> -        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
>> -        if (err) {
>> -            error_propagate(errp, err);
>> -            return;
>> -        }
>> +        info_report("The 'has_rpu' property is no longer required, to use the "
>> +                    "RPUs just use -smp 6.");
>> +    }
>
> Is "-global driver=xlnx,,zynqmp,property=has_rpu,value=on"
> without an explicit -smp option supposed to be a supported
> configuration?
>
> 0) On current master, we have this:
>
>   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on
>   **
>   ERROR:/home/ehabkost/rh/proj/virt/qemu/tcg/tcg.c:538:tcg_register_thread: assertion failed: (n < max_cpus)
>   Aborted (core dumped)
>
> 1) With your patch we have this:
>
>   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
>   QEMU 2.10.50 monitor - type 'help' for more information
>   (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
>   (qemu) info cpus
>   * CPU #0: thread_id=1662
>   (qemu)
>
> 2) With your patch plus Emilio's original min_cpus/default_cpus
> proposal[1], we have this:
>
>   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
>   QEMU 2.10.50 monitor - type 'help' for more information
>   (qemu) qemu-system-aarch64: info: The 'has_rpu' property is no longer required, to use the RPUs just use -smp 6.
>   (qemu) info cpus
>   * CPU #0: thread_id=7112
>     CPU #1: (halted) thread_id=7113
>     CPU #2: (halted) thread_id=7114
>     CPU #3: (halted) thread_id=7115
>   (qemu)
>
> 3) With Emilio's max_additional_cpus proposal[2], we have this:
>
>   $ ./aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -global driver=xlnx,,zynqmp,property=has_rpu,value=on -monitor stdio
>   QEMU 2.10.50 monitor - type 'help' for more information
>   (qemu) info cpus
>   * CPU #0: thread_id=4045
>     CPU #1: (halted) thread_id=4046
>     CPU #2: (halted) thread_id=4047
>     CPU #3: (halted) thread_id=4048
>     CPU #4: (halted) thread_id=4049
>     CPU #5: (halted) thread_id=4050
>   (qemu)
>
>
> Which option is preferred?  I like option #2 because it's
> simpler, but I would like to confirm this is really the intended
> behavior.

After this patch (and the fix to TCG otherwise it seg faults) no one
should use the has_rpu property. It is ignored and will print a
message saying that it is ignored.

Users should only use the -smp option now. So option 2 is the way to go.

Thanks,
Alistair

>
>
> [1] https://mid.mail-archive.com/1509734853-3014-1-git-send-email-cota@braap.org
> [2] https://mid.mail-archive.com/20171106215454.GB2152@flamenco
>
>
>> +
>> +    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>>      }
>>
>>      if (!s->boot_cpu_ptr) {
>> --
>> 2.11.0
>>
>
> --
> Eduardo
