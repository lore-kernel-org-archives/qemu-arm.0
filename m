Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp445893wrw;
        Fri, 9 Nov 2018 01:12:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMRKz2QcplBezDLxe0y93V3QSUIKmNCmMp9r9KldWB5OXg+PN+E8RNRchNe6QXpIfl0fVG
X-Received: by 2002:ac8:3b42:: with SMTP id r2mr7970771qtf.364.1541754753506;
        Fri, 09 Nov 2018 01:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541754753; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5P8tNTvorYh8777nya8UeJyaQT9Wvj8ktEzNrGVG/UcY1ArNWKjWfEDgQzFXPfiYN
         uZ5g03iY2rvxtCrcEC/DwJdb/qOAyMejC8x+J7CnfQCNGGx0oaHAjlFcSDfgvN5mv+g/
         V9VFJiwiSzb0aTna6k09qtkHf3pp7adkRg8jSCIGuEq7cqrW3zkfDW+pOeC905075E4F
         OZshnETMHV8qRUHPc9YkHcJGoznICg4Q6o0kifl9I2GyrRvmFyC6nJot2ecnKx2ozzll
         RsN1NhYaVzb61Df95blqMaTznSnoBOMFKEt1zajjlF5zCiwsXo25Ccluq3/conVa+lNC
         sKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=mOwGXMeBPMjvyTbgkY10+WBx5e6GUrUqG/k4UkHskvA=;
        b=ykBMezMw/+3ZevsD+gYSqdzVNSl8vDkmBA+/DQfgAOU5PuWMqbLe7IdGtwGFO0X+A5
         IK8HglvLSxXLq5Z4IU/MfxEfBCg9lMWnr1Y8CrFgf4k2fSBaa5iFW1UTZ7rmsziPH/x6
         qzUCl6GdDdFqt1RQPmFQIm2E9BvxwHR9dhQpQuotdB1oOje75FmO2EIuN5a2KNaWILme
         V91GOxr34fJkfwU6GNelBh5dzXyk/wk8yZXPIlT4u3ZoT/zen/3adGxfJYlFwdPNAiMP
         4wdWgVVv2NCNsqm8yGjxf5djbOTij5FdPzlP+a2ShHgfVbHQ37QnxIyimlVUA798sRwS
         Mr+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h50si5186510qte.159.2018.11.09.01.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 01:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL2q9-0002rI-21
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 04:12:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL2pz-0002rD-PV
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 04:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL2pv-0004oq-Hi
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 04:12:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gL2pv-0004nO-2p; Fri, 09 Nov 2018 04:12:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8EAF307DACA;
	Fri,  9 Nov 2018 09:12:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47F6D1057047;
	Fri,  9 Nov 2018 09:12:12 +0000 (UTC)
Date: Fri, 9 Nov 2018 10:12:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181109101210.0ee25ec8@redhat.com>
In-Reply-To: <20181105014047.26447-14-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-14-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 09 Nov 2018 09:12:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 13/24] hw: acpi: Do not
 create hotplug method when handler is not defined
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
X-TUID: XyjWeKggshSr

On Mon,  5 Nov 2018 02:40:36 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> CPU and memory ACPI hotplug are not necessarily handled through SCI
> events. For example, with Hardware-reduced ACPI, the GED device will
> manage ACPI hotplug entirely.
> As a consequence, we make the CPU and memory specific events AML
> generation optional. The code will only be added when the method name is
> not NULL.
patch doesn't belong to this series, it should be go along with
GED device patch.

Suggest to drop it for now.

>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/acpi/cpu.c            |  8 +++++---
>  hw/acpi/memory_hotplug.c | 11 +++++++----
>  2 files changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f10b190019..cd41377b5a 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -569,9 +569,11 @@ void build_cpus_aml(Aml *table, MachineState *machin=
e, CPUHotplugFeatures opts,
>      aml_append(sb_scope, cpus_dev);
>      aml_append(table, sb_scope);
> =20
> -    method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> -    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> -    aml_append(table, method);
> +    if (event_handler_method) {
> +        method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZED=
);
> +        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
> +        aml_append(table, method);
> +    }
> =20
>      g_free(cphp_res_path);
>  }
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 8c7c1013f3..db2c4df961 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -715,10 +715,13 @@ void build_memory_hotplug_aml(Aml *table, uint32_t =
nr_mem,
>      }
>      aml_append(table, dev_container);
> =20
> -    method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> -    aml_append(method,
> -        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
> -    aml_append(table, method);
> +    if (event_handler_method) {
> +        method =3D aml_method(event_handler_method, 0, AML_NOTSERIALIZED=
);
> +        aml_append(method,
> +                   aml_call0(MEMORY_DEVICES_CONTAINER "."
> +                             MEMORY_SLOT_SCAN_METHOD));
> +        aml_append(table, method);
> +    }
> =20
>      g_free(mhp_res_path);
>  }

