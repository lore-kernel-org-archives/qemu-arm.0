Received: by 10.25.27.66 with SMTP id b63csp304640lfb;
        Wed, 1 Jun 2016 10:47:04 -0700 (PDT)
X-Received: by 10.55.212.133 with SMTP id s5mr13897880qks.85.1464803224622;
        Wed, 01 Jun 2016 10:47:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198si35572342qhb.51.2016.06.01.10.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 10:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8AES-0004qU-3C
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 13:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AEM-0004oc-HV
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 13:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AEI-0005rc-Ep
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 13:46:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8AEI-0005rY-9L; Wed, 01 Jun 2016 13:46:54 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87E72C00F229;
	Wed,  1 Jun 2016 17:46:53 +0000 (UTC)
Received: from localhost (vpn1-7-51.gru2.redhat.com [10.97.7.51])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51Hkqef012596; Wed, 1 Jun 2016 13:46:53 -0400
Date: Wed, 1 Jun 2016 14:46:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160601174651.GB13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-3-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464799050-11002-3-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 01 Jun 2016 17:46:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 2/8] target-i386: cpu: move
 xcc->kvm_required check to reaize time
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X3gt1GR/tsDF

On Wed, Jun 01, 2016 at 06:37:24PM +0200, Igor Mammedov wrote:
> it will allow to drop custom cpu_x86_init() and use
> cpu_generic_init() instead reducing cpu_x86_create()
> to a simple 3-liner.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Nice, it also gets us closer to finally making X86CPU
qmp_device_list_properties()-safe. Only one request:

> ---
>  target-i386/cpu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 6159a7f..c31afc7 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -2200,7 +2200,6 @@ static void x86_cpu_load_def(X86CPU *cpu, X86CPUDefinition *def, Error **errp)
>  X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
>  {
>      X86CPU *cpu = NULL;
> -    X86CPUClass *xcc;
>      ObjectClass *oc;
>      gchar **model_pieces;
>      char *name, *features;
> @@ -2219,12 +2218,6 @@ X86CPU *cpu_x86_create(const char *cpu_model, Error **errp)
>          error_setg(&error, "Unable to find CPU definition: %s", name);
>          goto out;
>      }
> -    xcc = X86_CPU_CLASS(oc);
> -
> -    if (xcc->kvm_required && !kvm_enabled()) {
> -        error_setg(&error, "CPU model '%s' requires KVM", name);
> -        goto out;
> -    }
>  
>      cpu = X86_CPU(object_new(object_class_get_name(oc)));
>  
> @@ -2901,6 +2894,13 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>      static bool ht_warned;
>      FeatureWord w;
>  
> +    if (xcc->kvm_required && !kvm_enabled()) {
> +        char *name = g_strdup(object_get_typename(OBJECT(dev)));
> +        *strstr(name, X86_CPU_TYPE_SUFFIX) = 0;

I am not sure if I actually like this trick, but in either case
please use x86_cpu_class_get_model_name().

> +        error_setg(&local_err, "CPU model '%s' requires KVM", name);
> +        goto out;
> +    }
> +
>      if (cpu->apic_id < 0) {
>          error_setg(errp, "apic-id property was not initialized properly");
>          return;
> -- 
> 1.8.3.1
> 

-- 
Eduardo
