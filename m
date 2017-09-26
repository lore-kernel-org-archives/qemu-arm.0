Received: by 10.223.172.38 with SMTP id v35csp3440040wrc;
        Tue, 26 Sep 2017 03:54:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBnQwJvR7f4AO8WKDt1jviTHsvT4hrs3WacrFHiVT0sT2T/mVd6CyvNYKL7yUQgPYXNa4C4
X-Received: by 10.55.151.135 with SMTP id z129mr14625075qkd.119.1506423281997;
        Tue, 26 Sep 2017 03:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506423281; cv=none;
        d=google.com; s=arc-20160816;
        b=ASwrmkI4evZpjuv2QpqQHtzOhmV1kh72Ja7cXlLoWTaK3amw73cHQuSBdhC8fePWik
         R9yYtB4IWHAA8t5BX5567rOVow+2ItYY2qEY1EVudDeU35wP/GJS8VQEv2cI+jSf152/
         /Cc0Yc9W1p6cpfFUHEZLKELOuctyWM7a9eFW23Ij+MgElfB8sjutmDwcHwCFHaXZB7hT
         EchIlv/9rcaVNJ2WN68HzB69WCO5Nz/oCEgbZ4gVtnVdqTF9nNWDIMkqbFuA+PSLbezY
         oQBEbVXyKcs6lw8sJsei25HSIP5Uzk+ErlpcJMnUEJ9V3q6oVq1zXyiHuDf2zzm+ANnZ
         a1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=k9TPvsqs2n4nwGypK5IlB/yp6752anuzPDbbSN7jydQ=;
        b=UfRa0M+z4MEvyHyGa38clY7BugODb/cka6GEoMKn2OyedZJhCPAd7+1BqetWUjqFFG
         vJ3YzDNDZ2p6JNkCkGfe2C/uTt8rWdTTbci9XaxTzfUaGPmOpbUMZljqpVaBpCHo8qJ2
         ADMuehXHw5RTauyWHkD1dms5YLkhCyYeNi/9+iL1afUtdKucd3owf41CDMOJwQyLR+9X
         48XVb7KlEtdFSQaOYXydNVvow0YgnRZpM4D+s1NR+dkpa1ENriYcNBX/g1RTTWtu0eJh
         xedT6hMeZFgLeafjrBrNSJGmn7Zobz5D0LZw4DVp950tOhVC5xhBVo4r8GWlIMan6bwt
         ws9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si4779867qkf.467.2017.09.26.03.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 03:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwnVf-0008IE-QQ
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 06:54:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dwnVZ-0008Hw-4f
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 06:54:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dwnVW-0003Y9-2Z
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 06:54:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dwnVV-0003Xq-S7; Tue, 26 Sep 2017 06:54:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1D244E028;
	Tue, 26 Sep 2017 10:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D1D244E028
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D387D17CD1;
	Tue, 26 Sep 2017 10:54:24 +0000 (UTC)
Date: Tue, 26 Sep 2017 12:54:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20170926105422.vfaalzzmhufvrk34@kamzik.brq.redhat.com>
References: <1506088275-31734-1-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506088275-31734-1-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 26 Sep 2017 10:54:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->name
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MCIQABCM9SKc

On Fri, Sep 22, 2017 at 08:51:15AM -0500, Wei Huang wrote:
> Instead of using "1.0" as the system version of SMBIOS, we should use
> mc->name for mach-virt machine type. This matches with x86 code and
> prevents the smbios_table.machine_type test of Avocado from failing.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b41..8d0c6a9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
> @@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>      }
>  
>      smbios_set_defaults("QEMU", product,
> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> +                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
>  
>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>                        &smbios_anchor, &smbios_anchor_len);
> -- 
> 2.7.5
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
