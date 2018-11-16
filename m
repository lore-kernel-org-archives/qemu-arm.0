Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp149326wrw;
        Fri, 16 Nov 2018 01:28:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5dkE/HZs3aUR91uSLEaBrf/E1F6wOXQa1tDhZpR3M498GoPYxiw4dBOBdIfA0OQcIwQ3HOa
X-Received: by 2002:a37:8ac3:: with SMTP id m186mr9325939qkd.263.1542360481560;
        Fri, 16 Nov 2018 01:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542360481; cv=none;
        d=google.com; s=arc-20160816;
        b=YJyda6qtF71Pn+csSjWUSdaOwQHCipTkaqyRu04+WkbARbo0iEAGxVZjI+hQwoQ3k/
         ZnoAg7PcZjGOXoE/wAUrU4NfGEAdjJ6r3wTEfZ6PZ/n242mEMD+jzmREOt73krmm8c3g
         fBZi/WJwafuRBRp0fe7G1YA4AgWh779gjrJdGM7YscIlk9IMifKxBEf1BpzuiHF3A22h
         QPe5VgqYabHoFwsbriDtceSJ1gsDhDFKuKvTnCd23aiXMoOd2clkMGk01GdFczq7GRkf
         QE9L/CbTTXHnRKPHoDUN/gv7ZSkyFmaKAEfEK071pUQzox4BSNIlfk3fbOUX14LRPdJG
         MOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=dFpHD6qSQEO0JFxZty4TcC7svTPfuy6KLF0EphF8uEo=;
        b=A+ftTD7YYjIYPh36kcTwY5/ux2lxrV8fM/Aex5xNtOimkpOGwfu+kzq7OH8J/bQTvX
         9ppRS4TinAgVvHfZFett/I6EjveLMfJgAUHqnSSwiD1UV4+R25ssRZrtsD6QxZAk4NNi
         xHvFtPa8Chb3HiHFF3cJOKjVFD/awbHbrOfUukktPbZCBhtk6ecA9MRkG3yfXMV49SYM
         fYuRI6EZuB13k57AqjBMfrv4qaCRjOw8wOVYLBtbBP2D+qIPdfczRJj1h4AsFmOy3x7U
         JGv46QFTuxvK9iB7ihVWpOhDBCXy9Z9/L81tEyNl287uE1M1ILZesmsGDaVACvpayme0
         p+Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n69si14248473qkn.55.2018.11.16.01.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:28:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNaPw-0001OY-FO
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:28:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNaPm-0001N7-8G
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:27:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNaPi-0004l9-DL
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:27:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNaPh-0004jN-4H; Fri, 16 Nov 2018 04:27:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4BD63084244;
	Fri, 16 Nov 2018 09:27:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D91B1019633;
	Fri, 16 Nov 2018 09:27:37 +0000 (UTC)
Date: Fri, 16 Nov 2018 10:27:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181116102735.7e506760@redhat.com>
In-Reply-To: <20181105014047.26447-19-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-19-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 16 Nov 2018 09:27:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 18/24] hw: i386: Export the
 MADT build method
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
X-TUID: p+uzYrMs6wND

On Mon,  5 Nov 2018 02:40:41 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> It is going to be used by the PC machine type as the MADT table builder
> method and thus needs to be exported outside of acpi-build.c
>=20
> Also, now that the generic build_madt() API is exported, we have to
> rename the ARM static one in order to avoid build time conflicts.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/i386/acpi.h   | 28 ++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c |  4 ++--
>  hw/i386/acpi-build.c     |  4 ++--
>  3 files changed, 32 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/i386/acpi.h
>=20
> diff --git a/include/hw/i386/acpi.h b/include/hw/i386/acpi.h
> new file mode 100644
> index 0000000000..b7a887111d
> --- /dev/null
> +++ b/include/hw/i386/acpi.h
[...]

> +/* ACPI MADT (Multiple APIC Description Table) build method */
> +void build_madt(GArray *table_data, BIOSLinker *linker,
> +                MachineState *ms, AcpiConfiguration *conf);
> +
> +#endif
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b5e165543a..b0354c5f03 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -564,7 +564,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
> =20
>  /* MADT */
>  static void
> -build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +virt_build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState=
 *vms)
>  {
You are moving build_madt() into x86 specific header i386/acpi.h
so question is why do you touch ARM variant at all?

[...]
