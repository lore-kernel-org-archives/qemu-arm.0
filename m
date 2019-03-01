Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp793834wrx;
        Fri, 1 Mar 2019 08:09:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDDJwhE1RKQnRjBtqcqGz8zLlpjrbpM40JkmToOj+npizu53ulBQFpGlh9ekDKjPn9UlJN
X-Received: by 2002:a25:3446:: with SMTP id b67mr4675855yba.87.1551456587902;
        Fri, 01 Mar 2019 08:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551456587; cv=none;
        d=google.com; s=arc-20160816;
        b=bzvvppehbifjwZ9TbYbtmum+jfPTihy4lxKn3rHgPWm2laDEOCBxlP5aYV7kNH0CBP
         lArXKjNzoMbMkW1d+FmGY+uNjYjJ+K9lR1TcDAZfoQGfQv6fIM1DhI+5GbFG5UIUIHEZ
         yJkl6ynCyUysrehelIkLlFQJXzGAQu/x8Ec5op3dmlKh273lIDUiezMTjbBOXImwO+nE
         U7hEZcoZj+mlZ7iFEqlU7uFbA0mTPiB9Int/7hyQQLGKwOXMa/k5123CG+fYI7Z48udg
         peipIyhVdEhx7QZgGjJ/qZhOOk/nyLoXsm6jxPoKOxblqA40G4kajdQP5Ue2KpyddYF3
         QlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cNaD7XlZlkBzvK7bT+x2jpGvjdIXPQQbqYjhSv72v7U=;
        b=txcT94xgFeZGuoiO4ct77fk2pP/39UtYW2LLEPBExHHOIeig/zYzQ9IWCpYWyOLqk5
         y/08qpLGrD3fs6181GyU6QKgmZVtKp74/taMIuYJ+2+J6DqHISdvTkEd4q6SVYCiiHDy
         qjxKRAOvgCzGXcnvfYThwT25nxgj1DHp+8lQeIeBnA+AX7YU5zmLt3RRUxfPpLQNSb5Z
         bg4zsQzIqSubNL20Vs+tweetwBy/seKPzc0eqqEwjTNbSrRtbIQcgHj0IhtZHBd9x0MD
         Yd1SF7RgnL6lF+rdot8PEaqfkii71oRHFhrTvYxK3Becm5CjC/N5odpDVuIgpZtM1Bd7
         U3GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si12018192ybi.121.2019.03.01.08.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 08:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkjL-0006Tl-AQ
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 11:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkdd-0001n2-PW
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 11:03:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzkdc-0007F4-MV
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 11:03:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzkdc-0007Ei-DG; Fri, 01 Mar 2019 11:03:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4359230B96AA;
	Fri,  1 Mar 2019 16:03:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E3BA60A9A;
	Fri,  1 Mar 2019 16:03:44 +0000 (UTC)
Date: Fri, 1 Mar 2019 17:03:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190301170344.59e654ae@redhat.com>
In-Reply-To: <20190301134709.4695-9-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
	<20190301134709.4695-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 01 Mar 2019 16:03:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v11 08/10] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dchkAIC4+lKm

On Fri,  1 Mar 2019 14:47:07 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This patch implements the machine class kvm_type() callback.
> It returns the number of bits requested to implement the whole GPA
> range including the RAM and IO regions located beyond.
> The returned value in passed though the KVM_CREATE_VM ioctl and
s/in/is/

> this allows KVM to set the stage2 tables dynamically.
> 
> To compute the highest GPA used in the memory map, kvm_type()
> must freeze the memory map by calling virt_set_memmap().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
with fixed commit:

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v10 -> v11:
> - replace !kvm_enabled check by !vms->memmap
> 
> v7 -> v8:
> - remove vmc->no_extended_memmap and vms->extended_memmap
> 
> v6 -> v7:
> - Introduce RAMBASE and rename add LEGACY_ prefix in that patch
> - use local variables with explicit names in virt_set_memmap:
>   device_memory_base, device_memory_size
> - add an extended_memmap field in the class
> 
> v5 -> v6:
> - add some comments
> - high IO region cannot start before 256GiB
> ---
>  hw/arm/virt.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 624f417cd4..300eaae26f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1440,7 +1440,13 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 = true;
>  
> -    virt_set_memmap(vms);
> +    /*
> +     * In accelerated mode, the memory map is computed earlier in kvm_type()
> +     * to create a VM with the right number of IPA bits.
> +     */
> +    if (!vms->memmap) {
> +        virt_set_memmap(vms);
> +    }
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1829,6 +1835,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>      return NULL;
>  }
>  
> +/*
> + * for arm64 kvm_type [7-0] encodes the requested number of bits
> + * in the IPA address space
> + */
> +static int virt_kvm_type(MachineState *ms, const char *type_str)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(ms);
> +    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
> +    int requested_pa_size;
> +
> +    /* we freeze the memory map to compute the highest gpa */
> +    virt_set_memmap(vms);
> +
> +    requested_pa_size = 64 - clz64(vms->highest_gpa);
> +
> +    if (requested_pa_size > max_vm_pa_size) {
> +        error_report("-m and ,maxmem option values "
> +                     "require an IPA range (%d bits) larger than "
> +                     "the one supported by the host (%d bits)",
> +                     requested_pa_size, max_vm_pa_size);
> +       exit(1);
> +    }
> +    /*
> +     * By default we return 0 which corresponds to an implicit legacy
> +     * 40b IPA setting. Otherwise we return the actual requested PA
> +     * logsize
> +     */
> +    return requested_pa_size > 40 ? requested_pa_size : 0;
> +}
> +
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1853,6 +1889,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;

