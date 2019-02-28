Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp763205wrx;
        Thu, 28 Feb 2019 08:21:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBGaJQtZtMFFzvKN6kzAWE22sybeuXWGhPG7BpbzixxgGfmwOgoXQ66m7uVE8CG4vaw7Yh
X-Received: by 2002:a25:9848:: with SMTP id k8mr173700ybo.388.1551370870117;
        Thu, 28 Feb 2019 08:21:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551370870; cv=none;
        d=google.com; s=arc-20160816;
        b=MNFsTuLgGiSCcvt5XkU+rjy6cDW90Ug5Fq8n6KTq4qXPOCD9W7KOmBNL/0RMMBwxbh
         U/2pck0yT3fTjiNip4bFrz3+9iqJQCyLrSYAEZ6CB8VjeshNxqoWr7AdV5ORnOCnmPVo
         cAJBmeIyM45x0ULPj+3IvqrHjdbhx8x/cGKMdGfI0w2jqTJuVH7eaZW95zmzA19OU8Og
         +viIXgLstyT3b0yfkA8DGCjS74FgopEbYSHrSB/a9BwMOfiwiQKEwpRvw4iLD/aESBWy
         e/sIIUR5VDHd+RjuU7JkOx0sUYMQWQJ5/NUgbbIvoIZox3qh5+VHsy+KB1KWyL1nEZjU
         jh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=pe8ur8CnUyUI0pSV9SG4kNheu+9W8GsFPLInBFMXP9k=;
        b=jG5cdTGGAXppKgNMm0fYdNODqUoGbGSgrNa/7IOYyxkm0XjjQ3fnNB3iFMr8zp9CQk
         N0QiLmJ0KWCbEt0/x4pClw4mzkFSmmckGG+5xU8Uc+3SriYqmgKSwjLOo87cs0oqsNKE
         ERrJLK3oVPjI8EX4c+1ChdMvMy1fcGTLbOTgkTWPRc2zTKgwF4cABpOrZU1qQmpVn1DN
         E73p26e4dnx871NskZX6YzRDwo8MUyiXTYDm0haQRWlkJWq6F7FtmPvH/F9S0RDsL///
         iK7+zUZeon3Urm6Em7/lNgKwPhgJmgMF5iFOgYDzJuJb/cyXRwIADjmTqmjJezYapqQ1
         S5lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g204si10727543ywc.73.2019.02.28.08.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 08:21:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzOQn-0007dB-II
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 11:21:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOQ6-0007LO-Sm
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzOPv-0003dh-4A
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:20:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzOPq-0003Nx-TD; Thu, 28 Feb 2019 11:20:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B35822DC63;
	Thu, 28 Feb 2019 16:19:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51BF61001938;
	Thu, 28 Feb 2019 16:19:43 +0000 (UTC)
Date: Thu, 28 Feb 2019 17:19:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190228171942.28f2f953@redhat.com>
In-Reply-To: <20190228150324.25973-9-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 28 Feb 2019 16:19:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 08/10] hw/arm/virt: Implement kvm_type
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
X-TUID: Tsqljj8+JELE

On Thu, 28 Feb 2019 16:03:22 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This patch implements the machine class kvm_type() callback.
> It returns the number of bits requested to implement the whole GPA
> range including the RAM and IO regions located beyond.
> The returned value in passed though the KVM_CREATE_VM ioctl and
> this allows KVM to set the stage2 tables dynamically.
> 
> To compute the highest GPA used in the memory map, kvm_type()
> must freeze the memory map by calling virt_set_memmap().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
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
> index d7aa7d3f9d..7a158571b7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1439,7 +1439,13 @@ static void machvirt_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      bool aarch64 = true;
>  
> -    virt_set_memmap(vms);
> +    /*
> +     * In accelerated mode, the memory map is computed in kvm_type()
s/in/earlier in/

> +     * to create a VM with the right number of IPA bits.
> +     */
> +    if (!kvm_enabled()) {
maybe check not for KVM but for vms->memmap == NULL
so it would match with comment and be clear that we initializing memmap
because nobody else did it yet.

> +        virt_set_memmap(vms);
> +    }
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1828,6 +1834,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
this part is recurring pattern, is it worth using a helper function?

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
> @@ -1852,6 +1888,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->kvm_type = virt_kvm_type;
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;

