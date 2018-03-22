Received: by 10.28.71.155 with SMTP id m27csp204947wmi;
        Thu, 22 Mar 2018 04:07:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuk35aDqSHHGM9cj+WZGuBOmL3rhKNQhVklmKWPx1C7Q328T5+y4jjo1+WrYiPzS53C/S03
X-Received: by 10.55.183.198 with SMTP id h189mr33830778qkf.345.1521716856551;
        Thu, 22 Mar 2018 04:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521716856; cv=none;
        d=google.com; s=arc-20160816;
        b=tec2RvWTi6jrZMGACSJHFmNg1yqYP4SyKTQmpG0Wxo8YSIq3oXL5QiD69QdEX0CFGX
         O9e0tNwei3sQltbAxs0mLXS2UiH6VteVawsQJQyU6DrRzLbIfaQTwYOa2Lwip9k2Jq/z
         z3ke/IFz3xjZHwY+UDvAJNiVY4P4TI7X28D5aCd7Jfqdpug53r0AWKuA1OCwL9Tif5Xg
         k02YRcf4gvR2WAby+ueNuD1OXeBt+TJielHldVfHda3Xb7wj75oN3xkyxLA3OAua4Hfu
         Xptp2RzdQJHa8LSylHG53lACqlXmHMnZp0koa6G7gJQo3p+dt9XqFJJu4zhvfqqILlVh
         bQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=bI/83Kx8iV/PDOUWpv2/zhxUxsr/Zuo4TOSNbQ2vv6o=;
        b=mYWKZ0XKeZ2AbatUZfxkj/+TBpXJzD1wpu3DHlh0wffCzWSABn9UbZ29Jki4Qe7cJk
         XsVCJlLpos/gdBPwjQixRBMDsM/2omz2v3d93hTZxurxuuW8wpwQTKRSi7OvO6j8viU3
         OukLlB9LPIRvL5tTTyiW6I+ri4cf9LHKIThxDhbESE/NfveNbLzJ90YYTY7LPu98BoEk
         B8wqUfFDRtla5zn8OjFCtJ3wvcrv1ziWRfYb+FTlLwoR4x6zL8/8liDyrI57Bol6YzQ0
         WMsji37jMusSo6pmVnDL1M6Ccp5BpwAa8oZuhrEWvW4R4CPDswLGSej2hNaxahlFQxwF
         aeOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9si323064qtg.433.2018.03.22.04.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 04:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyy4G-0003ex-4a
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 07:07:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyy47-0003ee-8l
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 07:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyy43-0001QK-7B
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 07:07:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40926 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyy43-0001Q6-1y; Thu, 22 Mar 2018 07:07:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12B538185928;
	Thu, 22 Mar 2018 11:07:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B39A2023230;
	Thu, 22 Mar 2018 11:07:13 +0000 (UTC)
Date: Thu, 22 Mar 2018 11:07:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20180322110712.GN3583@redhat.com>
References: <20180322031216.14569-1-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180322031216.14569-1-wei@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 11:07:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 11:07:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->desc
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: deD+3LcgQW7j

On Wed, Mar 21, 2018 at 10:12:16PM -0500, Wei Huang wrote:
> Instead of using "1.0" as the system version of SMBIOS, we should use
> mc->desc for mach-virt machine type. With this patch, "dmidecode -t 1"
> (e.g., "-M virt-2.12,accel=kvm") will show:
> 
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: QEMU 2.12 ARM Virtual Machine
>             Serial Number: Not Specified
>             ...
> 
> instead of:
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: 1.0
>             Serial Number: Not Specified
>             ...
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2c07245047..da7228b297 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1132,6 +1132,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
> @@ -1145,7 +1146,7 @@ static void virt_build_smbios(VirtMachineState *vms)
>      }
>  
>      smbios_set_defaults("QEMU", product,
> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> +                        mc->desc, false, true, SMBIOS_ENTRY_POINT_30);

Surely this needs to be handled in back compatible manner so that existing
machine types are not changed - only the new virt-2.12 machine type should
get new format.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
