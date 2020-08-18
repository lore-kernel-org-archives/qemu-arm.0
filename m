Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3721826lfy;
        Tue, 18 Aug 2020 04:03:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZjVYU+zUDPpJTq1ytNZvm1sebFiLUv3VsZ/Bhbw7GmS6Nik/t6vyZI5LrYVi5uTEu0wAv
X-Received: by 2002:a25:8491:: with SMTP id v17mr27282121ybk.227.1597748583997;
        Tue, 18 Aug 2020 04:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597748583; cv=none;
        d=google.com; s=arc-20160816;
        b=ar26F1Rc9qdcTAG4X7orjIJr+WqGa0k/F9K7vZgvYj2jiqfI6mY4JxCygzg51MDTs3
         MQ1hXLFu9RMg55Uk/7SKVbtK3X7HB8e3XqipChyP5fTm1vyQoodGaVngeut/mhdQkJz9
         llgTfa4i2dVQkeh7UeacavgJyt8ieZtcHYzvSrJVfMTJYTR36SVE0HVW9GidNxDepBna
         IKmTmOh9MC6vxN97lJJ0GsyviUEZJM8//79cAvIAvJboWwtN7b7hk8B91SRX8ZUK95uH
         EZBI+aA/7KIs1g7xO8BDQCj5u+txal7/q/WZGUmMp38xaVB3SF7t64BI4XrJ0YOqnPiu
         XX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=VOsFZAgnz0eIAgMXTGDtTPSElQdXe0+Sudz5oXli/ac=;
        b=PU56hCz0K7WMqv412MG3resCAncOi41Xu6zAfIfaUm5YrPi6SZgEj+YEMqjWHDQNCZ
         hdWOwxTiSWRB5EKaTKantWpoQq075WKjADfY/kkONd0uks8cExcGWpf3wkMqBmOgEP86
         jlkHDgzXAiE8LcLUb+YPWZ9TnoLxkHHJTOp2SXJq6mXocCHqeVGOZRXCaEpCoy9992U2
         HS5OEWXZZRrpZarNNRSGjiwkDq8iSVH3jZ9abTQAv2K2TeyY1xB+mRZ4S450j0O96m/F
         fAFzGXX3BqJMfHBmY8GNjTswKy6fqecEbIivWxbYV4JFMdnW72D1lH4T9uN/mhAIUISZ
         X/Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbJ2f7cj;
       spf=neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 3si20156516ybr.388.2020.08.18.04.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:03:03 -0700 (PDT)
Received-SPF: neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbJ2f7cj;
       spf=neutral (google.com: 205.139.110.61 is neither permitted nor denied by best guess record for domain of imammedo@redhat.com) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597748583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOsFZAgnz0eIAgMXTGDtTPSElQdXe0+Sudz5oXli/ac=;
	b=VbJ2f7cjt3R/jg4y5VtQto30tnF3FqUWeWPvEE50gSSi9AeVFJ3JinLAuz7fo074LgAuhg
	ZZt7insIFKd+aLRs837uadv9A1CnQ64DBaNvE3Y1p67A1BpjNiea0peaIYDcP+kgkUyjns
	XB6xfOYLPF9AelfqKtR8p/CIoO49V64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-NzrpHyNVNi6-5ml-e2xWUg-1; Tue, 18 Aug 2020 07:03:01 -0400
X-MC-Unique: NzrpHyNVNi6-5ml-e2xWUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36FEE801AAE;
	Tue, 18 Aug 2020 11:02:58 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5AD25C1DC;
	Tue, 18 Aug 2020 11:02:44 +0000 (UTC)
Date: Tue, 18 Aug 2020 13:02:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, David
 Hildenbrand <david@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Thomas Huth <thuth@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>, Cornelia
 Huck <cohuck@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState
 property
Message-ID: <20200818130243.38d00c5d@redhat.com>
In-Reply-To: <20200818033323.336912-5-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
	<20200818033323.336912-5-bauerman@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: EQipljXIxntt

On Tue, 18 Aug 2020 00:33:19 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

[...]

> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize() because cpu_create() realizes the CPU and it's not possible
> to set a property after the object is realized.

cpu_create was introduced to remove code duplication in simple cases where
we do not need to set properties on created cpu.

returning back to manual object_new + realize() is fine if it 's only
small set of of boards. If it's tree-wide change then that would bring
back all code duplication that cpu_create() got rid of.

An alternative way is to use 'hotplug' callbacks to let board set
additional properties before cpu's realize is called.

example:
  hw/ppc/spapr.c:
   spapr_machine_class_init()
     mc->get_hotplug_handler = spapr_get_hotplug_handler;                         
     hc->pre_plug = spapr_machine_device_pre_plug; 
   ...
   static const TypeInfo spapr_machine_info = {
   ...
        { TYPE_HOTPLUG_HANDLER },

that might work in generic case if it is put into generic machine code,
and existing users of mc->get_hotplug_handler/hc->pre_plug were taken care of.
In which case board would only need to set MachineClass:cpu-start-powered-of
to gate property setting.

 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/ppc/e500.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..0077aca74d 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
>  
>      cpu_reset(cs);
>  
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted = 1;
>      cs->exception_index = EXCP_HLT;
>  }
>  
> @@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
>          PowerPCCPU *cpu;
>          CPUState *cs;
>          qemu_irq *input;
> +        Error *err = NULL;
>  
> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>          env = &cpu->env;
>          cs = CPU(cpu);
>  
> @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to change
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                     &error_abort);
> +        }
> +
> +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
> +            error_report_err(err);
> +            object_unref(OBJECT(cs));
> +            exit(EXIT_FAILURE);
>          }

btw:
board leaks cpu reference (from cpu_create()/object_new()) since qdev_realize()
adds it's own and the caller of object_new() is suposed to free the original one.

in this case qdev_realize_and_unref() fits nicely.


>      }
>  
> 
