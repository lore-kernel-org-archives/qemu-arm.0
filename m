Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4940404wrt;
        Tue, 2 Oct 2018 04:34:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60/NhJZlY1EbY0HuU/+xmIimN92wNvjnDkerM7IGaaJJi/k1aNSx1Fddp2DOVg5RX8pLijU
X-Received: by 2002:a37:b101:: with SMTP id a1-v6mr11531279qkf.222.1538480082702;
        Tue, 02 Oct 2018 04:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538480082; cv=none;
        d=google.com; s=arc-20160816;
        b=hwo11PAGsSKZyQ9U0JIkgJaubY5mtstRB+lnIgQd60+8zE1bGaYmsbmi8WawayaSNP
         UUl6Ca7c+F7N0dYUt8AZPt43HoIVfM8MQJ+dhAxkS7KOFjK7l5IVMoZhW1xC3n+Hzuo6
         1yoGSSf48uGjTGxnuoq5bBHUSZQtyr/lO9LSLdeu1MY3McX2RB1I6VxkrF6wtceJTdAX
         OLhdUfCFSIm28g8aQsa54wiq2zP+FmDjKTOf93JHyUSjpTpPvoT5MmmifWfQeZJ76rim
         N/5I3NuhgI7Sa3Mtmi/5Y1W7W2GSKYH9OO4TDy6BtE+yfs5ilwGunehdRjLNf1nlD9FA
         2iTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=yN30wzb7wjFXROJMGzcxUTUwbspjR+eq/CVhit8P7To=;
        b=BrItCDPDbRCJ5i6yU03eO5T5Juu6RrD9dyjfeLqpwm07SHIAT1T3KHk+nBnjyhp2nV
         GtVumyJIkurW5ML5LIqLuVW/cjgAVmOG1jLBEwFprjoZMxox8L2llon79e3rAcucirbk
         89Fra65whgxkSiSXqPPPvnLWkliKO59EHWn1Qwu+2mlX3VxxWN+OCzsts6ydk9xupksC
         7XNE/mXo2at6G9k+g09Jdx1UodDL6TUH3WYQNWzvVDKXP1ZvorB8SEz7wluZmkpJpBsW
         yMOJVUw99V8oF7HxYR1WNkESc7OKel4J80grULgPogzrLn9bmaI0oMzHVMNZOI9BPxX/
         gMlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o83-v6si240423qkh.139.2018.10.02.04.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 04:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Iws-0005ZI-77
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 07:34:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7Ivo-0005YQ-9D
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 07:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7Ivk-000184-Rs
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 07:33:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7Ivk-00015U-Iw
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 07:33:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id x12-v6so1792431wru.8
	for <qemu-devel@nongnu.org>; Tue, 02 Oct 2018 04:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yN30wzb7wjFXROJMGzcxUTUwbspjR+eq/CVhit8P7To=;
	b=tNMVwEnWlSgoXYN91Xm+oeIKyMWOp9jjcPhG1qyF3H4bgonnajDG4EjjTsc3PCLaSc
	elXGgD+vrHWvtLWOeYR43NpnyXng0mmNj59sfmMZxoH6H/DgY1RBxuFW8zquA1gVpcX3
	hJviV9eEaBGL0S6LQR2QX8QPG3dsfJ6sn3q1TYsCq7FNJgc8/1gA7PgohgO9I9Uy0J5f
	kvwZouatlODuRV+TnyaQ0Hm5tmuNFLk99D9pofeHCVnzr/C8LwONZMyZuSgF1lBRN2GD
	1xZM7xY0kME4aR2JU3yNAtCVBRIjVlbPoSJz5jmABxq4lyqfVM88vKg12u49g/4hHJ4u
	h72Q==
X-Gm-Message-State: ABuFfojLoPiXPJRiZ2F+EpHUV1qcuci3GXMPBFPq6/lTkr8dFM+rgQI5
	8rOz88N4TiilzyMmUA5E4YD6Ng==
X-Received: by 2002:a5d:434c:: with SMTP id
	u12-v6mr10957670wrr.189.1538480009221; 
	Tue, 02 Oct 2018 04:33:29 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	l38-v6sm7183309wre.38.2018.10.02.04.33.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 04:33:28 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>,
	Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
Date: Tue, 2 Oct 2018 13:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-16-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put APUs and
 RPUs in separate GDB groups
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IFbnMTOTJd3c

Cc'ing more QOM involved people.

On 01/10/2018 13:57, Luc Michel wrote:
> Create two separate QOM containers for APUs and RPUs to indicate to the
> GDB stub that those CPUs should be put in different processes.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c195040350..5e92adbc71 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -22,10 +22,11 @@
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> +#include "exec/gdbstub.h"
>  
>  #define GIC_NUM_SPI_INTR 160
>  
>  #define ARM_PHYS_TIMER_PPI  30
>  #define ARM_VIRT_TIMER_PPI  27
> @@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>                                     Error **errp)
>  {
>      Error *err = NULL;
>      int i;
>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
> +    Object *rpu_group = gdb_cpu_group_container_get(OBJECT(s));

I'd rather keep this generic: not involve 'gdb' container name.

(qemu) info qom-tree
/machine (xlnx-zcu102-machine)
  /soc (xlnx,zynqmp)
    /gdb-group[0] (container)
      /apu-cpu[3] (cortex-a53-arm-cpu)
        /unnamed-gpio-in[0] (irq)
        /unnamed-gpio-in[2] (irq)
        /unnamed-gpio-in[1] (irq)
        /unnamed-gpio-in[3] (irq)
      ...
    /gdb-group[1] (container)


Maybe your create_processes() from patch [1] should enumerate all CPUs
with object_resolve_path_type("", TYPE_CPU, NULL) then sort by cpu?


[1] https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg00089.html

>  
>      for (i = 0; i < num_rpus; i++) {
>          char *name;
>  
>          object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
>                            "cortex-r5f-" TYPE_ARM_CPU);
> -        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
> +        object_property_add_child(rpu_group, "rpu-cpu[*]",
>                                    OBJECT(&s->rpu_cpu[i]), &error_abort);
>  
>          name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
>          if (strcmp(name, boot_cpu)) {
>              /* Secondary CPUs start in PSCI powered-down state */
> @@ -210,13 +212,14 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>  static void xlnx_zynqmp_init(Object *obj)
>  {
>      XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
>      int i;
>      int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
> +    Object *apu_group = gdb_cpu_group_container_get(obj);
>  
>      for (i = 0; i < num_apus; i++) {
> -        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
> +        object_initialize_child(apu_group, "apu-cpu[*]", &s->apu_cpu[i],
>                                  sizeof(s->apu_cpu[i]),
>                                  "cortex-a53-" TYPE_ARM_CPU, &error_abort, NULL);
>      }
>  
>      sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> 
