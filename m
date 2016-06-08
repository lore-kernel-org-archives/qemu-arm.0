Received: by 10.25.27.66 with SMTP id b63csp2632781lfb;
        Wed, 8 Jun 2016 10:00:49 -0700 (PDT)
X-Received: by 10.55.153.3 with SMTP id b3mr5668105qke.102.1465405249464;
        Wed, 08 Jun 2016 10:00:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w20si1167160qge.118.2016.06.08.10.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 10:00:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAgqW-0000iT-VE
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 13:00:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAgl2-0004RP-0w
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 12:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bAgkw-0002iX-Vy
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 12:55:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bAgkw-0002iT-Nx; Wed, 08 Jun 2016 12:55:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 403EBC05B1FE;
	Wed,  8 Jun 2016 16:55:02 +0000 (UTC)
Received: from localhost (vpn1-7-99.gru2.redhat.com [10.97.7.99])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58Gt1Ml028573; Wed, 8 Jun 2016 12:55:01 -0400
Date: Wed, 8 Jun 2016 13:55:00 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160608165500.GN18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-10-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465226212-254093-10-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 Jun 2016 16:55:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 09/10] arm: virt: parse cpu_model only once
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m0UeroAamzoQ

On Mon, Jun 06, 2016 at 05:16:51PM +0200, Igor Mammedov wrote:
> considering that features are converted to
> global properties and global properties are
> automatically applied to every new instance
> of created CPU (at object_new() time), there
> is no point in parsing cpu_model string every
> time a CPU created.
> So move parsing outside CPU creation loop and
> do it only once.
> Parsing also should be done before any CPU is
> created so that features would affect the first
> CPU a well.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Peter, do you prefer to get this included through my tree with
the rest of the series, or wait to included it in your tree after
the other patches get merged to master?

> ---
>  hw/arm/virt.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 473e439..0dbee47 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1112,6 +1112,10 @@ static void machvirt_init(MachineState *machine)
>      VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
>      VirtGuestInfo *guest_info = &guest_info_state->info;
>      char **cpustr;
> +    ObjectClass *oc;
> +    const char *typename;
> +    CPUClass *cc;
> +    Error *err = NULL;
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>  
>      if (!cpu_model) {
> @@ -1191,27 +1195,24 @@ static void machvirt_init(MachineState *machine)
>  
>      create_fdt(vbi);
>  
> -    for (n = 0; n < smp_cpus; n++) {
> -        ObjectClass *oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> -        const char *typename = object_class_get_name(oc);
> -        CPUClass *cc = CPU_CLASS(oc);
> -        Object *cpuobj;
> -        Error *err = NULL;
> -        char *cpuopts = g_strdup(cpustr[1]);
> -
> -        if (!oc) {
> -            error_report("Unable to find CPU definition");
> -            exit(1);
> -        }
> -        /* convert -smp CPU options specified by the user into global props */
> -        cc->parse_features(typename, cpuopts, &err);
> -        cpuobj = object_new(typename);
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> +    if (!oc) {
> +        error_report("Unable to find CPU definition");
> +        exit(1);
> +    }
> +    typename = object_class_get_name(oc);
>  
> -        g_free(cpuopts);
> -        if (err) {
> -            error_report_err(err);
> -            exit(1);
> -        }
> +    /* convert -smp CPU options specified by the user into global props */
> +    cc = CPU_CLASS(oc);
> +    cc->parse_features(typename, cpustr[1], &err);
> +    g_strfreev(cpustr);
> +    if (err) {
> +        error_report_err(err);
> +        exit(1);
> +    }
> +
> +    for (n = 0; n < smp_cpus; n++) {
> +        Object *cpuobj = object_new(typename);
>  
>          if (!vms->secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
> @@ -1242,7 +1243,6 @@ static void machvirt_init(MachineState *machine)
>  
>          object_property_set_bool(cpuobj, true, "realized", NULL);
>      }
> -    g_strfreev(cpustr);
>      fdt_add_timer_nodes(vbi, gic_version);
>      fdt_add_cpu_nodes(vbi);
>      fdt_add_psci_node(vbi);
> -- 
> 1.8.3.1
> 

-- 
Eduardo
