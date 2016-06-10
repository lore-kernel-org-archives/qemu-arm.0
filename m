Received: by 10.25.27.66 with SMTP id b63csp267806lfb;
        Fri, 10 Jun 2016 05:40:33 -0700 (PDT)
X-Received: by 10.55.12.12 with SMTP id 12mr1580872qkm.8.1465562433783;
        Fri, 10 Jun 2016 05:40:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30si6168877qgx.85.2016.06.10.05.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 05:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBLjl-0005EN-7V
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 08:40:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bBLjg-0005EF-8Z
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 08:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bBLjb-0003Pd-7d
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 08:40:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bBLjb-0003PW-1a; Fri, 10 Jun 2016 08:40:23 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B450071096;
	Fri, 10 Jun 2016 12:40:21 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ACeJsV021338; Fri, 10 Jun 2016 08:40:19 -0400
Date: Fri, 10 Jun 2016 14:40:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160610144018.32480226@nial.brq.redhat.com>
In-Reply-To: <20160610114833.GF17952@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-4-git-send-email-imammedo@redhat.com>
	<20160609183430.GC17952@thinpad.lan.raisama.net>
	<20160610091544.67b6a69a@nial.brq.redhat.com>
	<20160610113904.GF18662@thinpad.lan.raisama.net>
	<20160610114833.GF17952@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 10 Jun 2016 12:40:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] target-i386: Remove assert(kvm_enabled())
 from host_x86_cpu_initfn()
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
X-TUID: XENI1UYwoY0V

On Fri, 10 Jun 2016 08:48:33 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The code will be changed to allow creation of the CPU object and
> report kvm_required errors only at realizefn, so we need to make
> the instance_init function more flexible.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> I am applying this before "Move xcc->kvm_required check to
> realize time" to avoid triggering the assert().
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target-i386/cpu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 647cd30..c91902f 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -1547,16 +1547,17 @@ static void host_x86_cpu_initfn(Object *obj)
>      CPUX86State *env = &cpu->env;
>      KVMState *s = kvm_state;
>  
> -    assert(kvm_enabled());
> -
>      /* We can't fill the features array here because we don't know yet if
>       * "migratable" is true or false.
>       */
>      cpu->host_features = true;
>  
> -    env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
> -    env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
> -    env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
> +    /* If KVM is disabled, cpu_x86_create() will already report an error */
> +    if (kvm_enabled()) {
> +        env->cpuid_level = kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
> +        env->cpuid_xlevel = kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
> +        env->cpuid_xlevel2 = kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
> +    }
>  
>      object_property_set_bool(OBJECT(cpu), true, "pmu", &error_abort);
>  }

