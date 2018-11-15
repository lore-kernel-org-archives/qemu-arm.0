Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7008338wrw;
        Thu, 15 Nov 2018 05:29:29 -0800 (PST)
X-Google-Smtp-Source: AJdET5eEsW/eHpfDXD9Ht2XpVLw4S/CTRYe2m68JpLlhnGSCRpU/ruI0YPQZdfXHWTpS+ATT1B4j
X-Received: by 2002:ac8:2f38:: with SMTP id j53mr5711300qta.87.1542288569648;
        Thu, 15 Nov 2018 05:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542288569; cv=none;
        d=google.com; s=arc-20160816;
        b=MiceIhyp/CY5+oLWdQWAq3FJ6KPQTfjnrPG2/wrARx1NiHRyLgzBi49EBLiWtiQRrM
         d5nrkI+qu1CgCjZkOnrMi/wXrIPVUIZ+kcqIZO6rLBiPo20pnKD4rv4FQ6uTdKm35kNx
         q4oV0lcAPYTf/e5z475Cd4aXJaSfS/a6vufce1xU3RpLkZsCCV+vANDddooI9nPRaooZ
         wSzeNGnFHbIiDnd2pSqo0ukt3U2CztZNmFog96IBNWYVsX4yBC4amBCKl9s/7XpUF6KW
         q4To8Q0+XZcfWFn566HNQRzLxhfEv7LnIZspfeMFPzPXoyxKSZ30gjgcCtkuL0ByCK/A
         0LqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Ee9cQaMXhn0dpoTrK7qHAA6p8ogr1kIpLFI7nMYwaQc=;
        b=WsmHzf1gb/a6ebRA/T7tzbJDq9zdf/TJf6YMJpBH6GlosZlE1vS1Jsrx7Xg6WReT1M
         9E7RZ5Pjpuupbk9HxItXLAiSTTLGUZhs1xK8tXUyxoTgg+2qxtesA7Ybahd2M+UR82cw
         gp5UkNjWp1phOb5VsTe6bVHUzm+WiCmDJWFO9GiUQsAeu1Vy72VgWrxpULChk3sM7BS7
         zaFOdpz4sdSO5Q/NNT/9bpnu+OT2z/SdOSZXxVLLJaPQ2WRZubaEEolvV9XADca9z43u
         uAGz8VSYRQLJghu2fUqoczWEVjrldGMyFFqXrQJyDN4N8NiFK8ppLfyTGCbh5t6ZdpwR
         L9Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v18si4987685qtp.194.2018.11.15.05.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 05:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNHi5-00086U-09
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 08:29:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNHhs-000853-UC
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 08:29:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNHhn-0001VV-GI
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 08:29:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNHhn-0001Uq-Av; Thu, 15 Nov 2018 08:29:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D36189ACB;
	Thu, 15 Nov 2018 13:29:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD8F05D9CA;
	Thu, 15 Nov 2018 13:28:55 +0000 (UTC)
Date: Thu, 15 Nov 2018 14:28:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181115142854.1c62f32f@redhat.com>
In-Reply-To: <20181105014047.26447-16-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-16-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 15 Nov 2018 13:29:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 15/24] hw: i386: Export the
 i386 ACPI SRAT build method
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XI39IqxsW+Da

On Mon,  5 Nov 2018 02:40:38 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> This is the standard way of building SRAT on x86 platfoms. But future
> machine types could decide to define their own custom SRAT build method
> through the ACPI builder methods.
> Moreover, we will also need to reach build_srat() from outside of
> acpi-build in order to use it as the ACPI builder SRAT build method.
SRAT is usually highly machine specific (memory holes, layout, guest OS
specific quirks) so it's hard to generalize it.

I'd  drop SRAT related patches from this series and introduce
i386/virt specific SRAT when you post patches for it.

What we could generalize here is building blocks used to
create entries into acpi/aml-build.c
   build_srat_memory -> build_srat_memory_entry()
   build_apic_entry()
   build_x2apic_entry()
and please switch these blocks to build_append_int_noprefix() API
before moving them to acpi/aml-build.c

> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/i386/acpi-build.h | 5 +++++
>  hw/i386/acpi-build.c | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 065a1d8250..d73c41fe8f 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -4,6 +4,11 @@
>  
>  #include "hw/acpi/acpi.h"
>  
> +/* ACPI SRAT (Static Resource Affinity Table) build method for x86 */
> +void
> +build_srat(GArray *table_data, BIOSLinker *linker,
> +           MachineState *machine, AcpiConfiguration *acpi_conf);
> +
>  void acpi_setup(MachineState *machine, AcpiConfiguration *acpi_conf);
>  
>  #endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1ef1a38441..673c5dfafc 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1615,7 +1615,7 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>  #define HOLE_640K_START  (640 * KiB)
>  #define HOLE_640K_END   (1 * MiB)
>  
> -static void
> +void
>  build_srat(GArray *table_data, BIOSLinker *linker,
>             MachineState *machine, AcpiConfiguration *acpi_conf)
>  {

