Received: by 10.28.71.27 with SMTP id u27csp4779479wma;
        Tue, 27 Feb 2018 04:43:43 -0800 (PST)
X-Google-Smtp-Source: AG47ELsx5wwxJK/BPgCrTf1Lgx1Mphs6r+9Vyqpx0kFggu2vyghhafOXKL+FLHrPZiw2J478HKlL
X-Received: by 10.129.46.77 with SMTP id u74mr2294972ywu.222.1519735422986;
        Tue, 27 Feb 2018 04:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519735422; cv=none;
        d=google.com; s=arc-20160816;
        b=eqXjccLd5f0Tkxl/UpDM859f6VvGeWFii5hkJQ3g4TxZQUmu6gh+FwYgDedeC66oTY
         qtz8V6shJr572w3vYjaKrxtKCaUM0SKVWG+lNud2dH6a7rGu1VWygKgpV5MTc16L7Imt
         tTVjl8VM2y3ViVvdO8xKsc0c1ZTvGBggCJ9tC6JEwluKUa9rXOHlYNYt1u6PFg355PVH
         2xs3MpdgR1m8SuutQZapdOCl3aGBfo1dsGUFI2wqdC+rq7kwVcyWlrEOo6Oj3CpxWd1p
         C2YG9osGR9I/PLFHGHNKzaT530ESwwgDJDguZDa2wK26kwq9o/LCC8Y0wP8uWtP7RSCi
         Uqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Sju0VvQYXoOcJTQN7vZKEhfMKJEvLijzWKZ9U/1T54E=;
        b=nhWdFODE9sojfgNNlfTJrxtKyzPHLbRD3goIOHgmG4p6wTgW+Lakh9re3PYvYlSmgP
         HzYUT0zPuvqMkh6XNUYgpB/nh+9I7tAnykPw8P9jMA7F4LPtA1oLPOEg6E+zt5lT9MTy
         eWOAHK0jiPPpJdvhEJwM0ugPxe06tjnRvQJ4cDfSL+cEd60wygkdNyaCm+OaYPlIypii
         xMdmVXRcWnPFYPhz/c2rH7kX0cNpKS15p5yXCTjpGAvhLy3DpJwLaFwcXhpNuIKqkkk9
         JyBb8mVvDYVQzPOUSEslaBbCuzr6zC4KDXK7cQCEP3CYEsF21D2tM+B2I1eJysq5vib2
         U2jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189si1905620ywe.282.2018.02.27.04.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 04:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqebe-0002rX-ED
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 07:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqeaZ-00024u-EV
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eqeaW-0002Hj-An
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 07:42:35 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50872 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eqeaW-0002Gk-5x; Tue, 27 Feb 2018 07:42:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A29340201A5;
	Tue, 27 Feb 2018 12:42:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920152024CA2;
	Tue, 27 Feb 2018 12:42:27 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
	<1519303376-92875-3-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0f55eea6-24ca-b5ea-7e6b-89eb93b70393@redhat.com>
Date: Tue, 27 Feb 2018 13:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519303376-92875-3-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 12:42:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Feb 2018 12:42:29 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/9] pc: replace pm object
 initialization with one-liner in acpi_get_pm_info()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kSeH+LcNfCJi

Hi,

On 22/02/18 13:42, Igor Mammedov wrote:
> next patch will need it before it gets to piix4/lpc branches
> that initializes 'obj' now.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/i386/acpi-build.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index deb440f..b85fefe 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -128,7 +128,7 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>  {
>      Object *piix = piix4_pm_find();
>      Object *lpc = ich9_lpc_find();
> -    Object *obj = NULL;
> +    Object *obj = piix ? piix : lpc;
>      QObject *o;
>  
>      pm->force_rev1_fadt = false;
> @@ -138,7 +138,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>      if (piix) {
>          /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
>          pm->force_rev1_fadt = true;
> -        obj = piix;
>          pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
>          pm->pcihp_io_base =
>              object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
> @@ -146,7 +145,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
>              object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
> -        obj = lpc;
>          pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
>      }
>      assert(obj);
> 
