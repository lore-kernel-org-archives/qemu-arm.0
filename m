Received: by 10.25.27.66 with SMTP id b63csp314583lfb;
        Wed, 1 Jun 2016 11:08:14 -0700 (PDT)
X-Received: by 10.55.26.219 with SMTP id l88mr35438671qkh.14.1464804494042;
        Wed, 01 Jun 2016 11:08:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33si8439886qgl.30.2016.06.01.11.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 11:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8AYv-0001Mt-GS
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 14:08:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AYr-0001Mo-Q8
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1b8AYo-0002Jy-0j
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 14:08:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1b8AYn-0002Jr-RD; Wed, 01 Jun 2016 14:08:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20E816265B;
	Wed,  1 Jun 2016 18:08:05 +0000 (UTC)
Received: from localhost (vpn1-7-51.gru2.redhat.com [10.97.7.51])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51I83gw018695; Wed, 1 Jun 2016 14:08:04 -0400
Date: Wed, 1 Jun 2016 15:08:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160601180802.GC13503@thinpad.lan.raisama.net>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1464799050-11002-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Jun 2016 18:08:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 3/8] target-i386: cpu: use
 cpu_generic_init() in cpu_x86_init()
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
X-TUID: J8HFiG5d7DXx

On Wed, Jun 01, 2016 at 06:37:25PM +0200, Igor Mammedov wrote:
> now cpu_x86_init() does nothing more or less
> than duplicating cpu_generic_init() logic.
> So simplify it by using cpu_generic_init().
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Awesome.

It bothers me that we're replacing a function with consistent
error reporting with one where error reporting is inconsistent.
cpu_generic_init() sometimes prints error messages, and sometimes
simply returns NULL without printing anything.

But fixing that would require reviewing all cpu_init()
implementations. In the meantime, we are being as inconsistent as
all the other architectures that already use cpu_generic_init(),
so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  target-i386/cpu.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index c31afc7..238f69d 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -2240,25 +2240,7 @@ out:
>  
>  X86CPU *cpu_x86_init(const char *cpu_model)
>  {
> -    Error *error = NULL;
> -    X86CPU *cpu;
> -
> -    cpu = cpu_x86_create(cpu_model, &error);
> -    if (error) {
> -        goto out;
> -    }
> -
> -    object_property_set_bool(OBJECT(cpu), true, "realized", &error);
> -
> -out:
> -    if (error) {
> -        error_report_err(error);
> -        if (cpu != NULL) {
> -            object_unref(OBJECT(cpu));
> -            cpu = NULL;
> -        }
> -    }
> -    return cpu;
> +    return X86_CPU(cpu_generic_init(TYPE_X86_CPU, cpu_model));
>  }
>  
>  static void x86_cpu_cpudef_class_init(ObjectClass *oc, void *data)
> -- 
> 1.8.3.1
> 

-- 
Eduardo
