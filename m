Received: by 10.28.4.212 with SMTP id 203csp167833wme;
        Tue, 1 May 2018 17:45:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrj8satACT8aVkf+Yl/I+qy0vXf1fNRORpiaebztheGvKt4cT9qx6CHnsd9gZAUKjgnPx87
X-Received: by 2002:a1f:c2:: with SMTP id 185-v6mr15996030vka.25.1525221921520;
        Tue, 01 May 2018 17:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525221921; cv=none;
        d=google.com; s=arc-20160816;
        b=GFE3a1cbkf8+3ugv4HSQUplpQ15KEfLVkQ+LdBehKdpLZBWhu9gZDVzSdJW8jsZlZv
         QpqBa8mSNuNdSioj5lBAKwHdG4BoBHmXbIXZF6w2bSZXfekqVQRlQZqoW9kvdHgyKqMH
         8fx/SA2uTbSnIOwMJf2jAuniPwT93BR8ixxa1Y/LlluwaYf7Cfx8xCJyJlTeegYb9PsC
         Bedv+WgsHmf38ae7xykpNM7q0knzBLTEqPOpG8bDgK3tyWCL5UZ8CC3l8NecHqUCLy4z
         ezH3YlND+MEFy74T82+oaHUBlVQFJtV3D1W3hIwErDkFjBOrVA7F1FbgsxCL3WaVzDV+
         yvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=u+xlHStSArfGqTNB1gdjEJjt090vPTm+I3BQzMXRdqs=;
        b=ZQFBU4q0aNmf18d63+RWVhcBCsC1pXTJBXpwRfFbcpyzRQJVGD8iKOINfbf+/FAZ3A
         D60PG5/1lr4rP2Yib1n3WXdfpOfyaXV5n10WziAMpR3Al6W10dWUs+CMraBw+kTZYsbh
         VuD0HGh33tjEDlzBmaKPe+NFtjHAXtgAqsZBwWANa6R2tASh1iYe4uKW5pfYlisWnwVj
         sDr1NWRrr71ofAFAwONmhhD6H2s6jObenwd0mDhdbc2zs8Rg5oDt+5DH2/grIvDZLvkf
         07ZLQj0iMPaFUhSiBL8+2pX9PQW0rBGbWL5g8aUXBhh+b5NE9J/0k1CG5sfOCxIU8wOZ
         GGQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCOvgs49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y186-v6si1280933vkg.314.2018.05.01.17.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 17:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UCOvgs49;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDftZ-00088N-1a
	for alex.bennee@linaro.org; Tue, 01 May 2018 20:45:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDftS-00087m-5O
	for qemu-arm@nongnu.org; Tue, 01 May 2018 20:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDftP-00013n-3B
	for qemu-arm@nongnu.org; Tue, 01 May 2018 20:45:14 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fDftO-00013g-V8; Tue, 01 May 2018 20:45:11 -0400
Received: by mail-qt0-x241.google.com with SMTP id f13-v6so6664804qtp.10;
	Tue, 01 May 2018 17:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u+xlHStSArfGqTNB1gdjEJjt090vPTm+I3BQzMXRdqs=;
	b=UCOvgs491fO7WswmgJBhx9CrT3b43GQimSvtypt1ea43QlFbCitnGn8dx3JZDvHtZM
	gRzzazc3AlKzNKeWDGu5wBCKnXxBQwOQw7FER4ebPsHz7CIaE5Iq098eVujAdLzQ17zt
	sgwGQ5k+mU9z1yOg0uslJq6T2tJfwX4/jsAHh8XBRJd9+XetV+sbr+rpmpLDrco0ViHm
	UmiHoh+TduAzXhWXdmm3CqJuEhte729gmK4zDWnvdQnrPIiju3Sdol4J5xMsVpUTMLG0
	DSieipaHmAt6fF3RC8RrC3WXtowJs/KWwKqdQqCn1+jQEFJfTB/vzkpYardurpPHAe7A
	bmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=u+xlHStSArfGqTNB1gdjEJjt090vPTm+I3BQzMXRdqs=;
	b=VUm3crE1nLSvuTnd/JGFrxNubzlO3tmkCxukempjeFQI90iBNZXvBvENP2V3XTEoXA
	7k9aO7Z6pYToEatRfg8E11sX1atuZGLpPKcfzJje3wV8CYiJgzJsuIGwd9b3Ze1Y4uLT
	lTakyhD4pIUdS5+UoocSjIySYIPUvbQvTWBPngojW4effkSuv0YRYYYxTCyPjkxsoPXj
	txRYFudG3nQX4odLSdKBPSqPswX5kNMpufZ7cACa42Ip7S/YUWwwBgjXL1BztBhRxvUK
	JDXk4gZUmG2qHtde0AcM5uU6IosdX3/t14EXKeLEEzfev+f7h6m89yaLXB5hNHe6YZxa
	3rFQ==
X-Gm-Message-State: ALQs6tBPBG67z2yWkFHjwu+EV/HPftDIK149K/0LPgMF9JNTP3tNYPcK
	JMr/PFQFwllCa0U56rKc4Ro=
X-Received: by 2002:ac8:33a3:: with SMTP id
	c32-v6mr15123694qtb.90.1525221910246; 
	Tue, 01 May 2018 17:45:10 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	42-v6sm10964342qty.78.2018.05.01.17.45.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 May 2018 17:45:09 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
	<1525176522-200354-6-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7d23da37-f15a-e2b3-7654-a737c990ecad@amsat.org>
Date: Tue, 1 May 2018 21:45:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525176522-200354-6-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v3 5/5] make sure that we aren't overwriting
 mc->get_hotplug_handler by accident
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0v3ZEM1T9n/g

On 05/01/2018 09:08 AM, Igor Mammedov wrote:
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/virt.c              | 1 +
>  hw/i386/pc.c               | 1 +
>  hw/ppc/e500plat.c          | 1 +
>  hw/ppc/spapr.c             | 1 +
>  hw/s390x/s390-virtio-ccw.c | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 71661c6..9b0a931 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1578,6 +1578,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->plug = virt_machine_device_plug_cb;
>  }
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 018fd8d..019be25 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2355,6 +2355,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>      pcmc->save_tsc_khz = true;
>      pcmc->linuxboot_dma_enabled = true;
> +    assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = pc_get_hotpug_handler;
>      mc->cpu_index_to_instance_props = pc_cpu_index_to_props;
>      mc->get_default_cpu_node_id = pc_get_default_cpu_node_id;
> diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
> index 1a469ba..d8e3f20 100644
> --- a/hw/ppc/e500plat.c
> +++ b/hw/ppc/e500plat.c
> @@ -74,6 +74,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
>      HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>      MachineClass *mc = MACHINE_CLASS(oc);
>  
> +    assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = e500plat_machine_get_hotpug_handler;
>      hc->plug = e500plat_machine_device_plug_cb;
>  
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b35aff5..5b2b00a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3995,6 +3995,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      mc->kvm_type = spapr_kvm_type;
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
>      mc->pci_allow_0_address = true;
> +    assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = spapr_get_hotplug_handler;
>      hc->pre_plug = spapr_machine_device_pre_plug;
>      hc->plug = spapr_machine_device_plug;
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 435f7c9..905583a 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -476,6 +476,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
>      mc->use_sclp = 1;
>      mc->max_cpus = S390_MAX_CPUS;
>      mc->has_hotpluggable_cpus = true;
> +    assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = s390_get_hotplug_handler;
>      mc->cpu_index_to_instance_props = s390_cpu_index_to_props;
>      mc->possible_cpu_arch_ids = s390_possible_cpu_arch_ids;
> 
