Received: by 10.28.71.155 with SMTP id m27csp160796wmi;
        Fri, 23 Mar 2018 00:48:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsV08EYnAH9HnxTN+8Rg7Dip5xoUaBIr5MHo5jpWN9ddY4Gj5Ho7NtY4BcGSl8T10iI9gNt
X-Received: by 10.237.40.99 with SMTP id r90mr40521936qtd.233.1521791321245;
        Fri, 23 Mar 2018 00:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521791321; cv=none;
        d=google.com; s=arc-20160816;
        b=hVepfWjtTserqv83NFXuKzwBCUQrzkM8voFPDb9Fm/BTzMI1oPovSWLx/Yuz/G5bCA
         pt1vCPfL03QjI9hAmhes3AJy/WnUMZRkfr9NAwKDjlCVmGR+xFfRZE7/XilGXtfNtSYO
         //k6mD7qtxa97gzp0B2nAd9+tjXpaaoXhBdFZ02Ux3RrunclltTFQHU0GnG8sI5vp0oO
         Svi1qi3uo5+tpZmNRHcAWewySNN/aftsHajgypmWnExmaLSE9E//Bk/eOWaBxzAkJ3s3
         HYYvS4xvmPFmog+sDanqTGatV0ft1zjjWbLbFbpLOyW1YLggnAKELz/bpChUSIPCt793
         EiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=YpyRBP+k/mJqP7mGHalOx35IV5h0W4+QDNEmhas9XGs=;
        b=hA0dNmIVWi8eFrZh3xWtcqBLlDdIfyTOdd2CGdG6u7xCFUr9VTO8nfqZ91fIB4v4Dh
         RA8V+cg+0Ph98qiXj4HcjfePX5NGXvF+r4vYWYhk3dyWCX3ZI2fZwuizTYTCc5Xqpli8
         /CzFEQNSq6hse7mCKy+4EzRnDYvoTmjoNZdHgXhlX/bG5L/n4wuY8SzWTgNXTNeBte4U
         4t+k1BK0DFlRFsUMP1abk4c1YoUY2VpSccEqFHRamTJjD0EeqzWL4N/2iyitIVUAZqt8
         nGNYXgb2Ufxa00A2SBI4LTUBals0cIDV3HQkjMW17ajjAawFMbovJxr+6LQYkMtUsbZd
         TjKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p31si2249492qtp.141.2018.03.23.00.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 00:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezHRI-00006J-Pr
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 03:48:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ezHRA-0008PJ-IK
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 03:48:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ezHR5-00033G-Ln
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 03:48:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47712 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ezHR5-00032y-Fe; Fri, 23 Mar 2018 03:48:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00CC48182D2E;
	Fri, 23 Mar 2018 07:48:24 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-59.brq.redhat.com [10.40.204.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FB210B2B21;
	Fri, 23 Mar 2018 07:48:13 +0000 (UTC)
Date: Fri, 23 Mar 2018 08:48:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20180323074808.eyxeqaqyuz5sm743@hawk.localdomain>
References: <20180322212318.7182-1-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322212318.7182-1-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 07:48:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 07:48:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V2 1/1] mach-virt: Set VM's
 SMBIOS system version to mc->name
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
X-TUID: elgeoW3nSyUA

On Thu, Mar 22, 2018 at 04:23:18PM -0500, Wei Huang wrote:
> Instead of using "1.0" as the system version of SMBIOS, we should use
> mc->name for mach-virt machine type to be consistent other architectures.
> With this patch, "dmidecode -t 1" (e.g., "-M virt-2.12,accel=kvm") will
> show:
> 
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: virt-2.12
>             Serial Number: Not Specified
>             ...
> 
> instead of:
> 
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>             Manufacturer: QEMU
>             Product Name: KVM Virtual Machine
>             Version: 1.0
>             Serial Number: Not Specified
>             ...
> 
> For backward compatibility, we allow older machine types to keep "1.0"
> as the default system version.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c         | 8 +++++++-
>  include/hw/arm/virt.h | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2c07245047..94dcb125d3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1132,6 +1132,8 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>  
>  static void virt_build_smbios(VirtMachineState *vms)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      uint8_t *smbios_tables, *smbios_anchor;
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
> @@ -1145,7 +1147,8 @@ static void virt_build_smbios(VirtMachineState *vms)
>      }
>  
>      smbios_set_defaults("QEMU", product,
> -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> +                        vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
> +                        true, SMBIOS_ENTRY_POINT_30);
>  
>      smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
>                        &smbios_anchor, &smbios_anchor_len);
> @@ -1646,8 +1649,11 @@ static void virt_2_11_instance_init(Object *obj)
>  
>  static void virt_machine_2_11_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_12_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
> +    vmc->smbios_old_sys_ver = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 11)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 33b0ff3892..ba0c1a4faa 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -85,6 +85,7 @@ typedef struct {
>      bool no_its;
>      bool no_pmu;
>      bool claim_edge_triggered_timers;
> +    bool smbios_old_sys_ver;
>  } VirtMachineClass;
>  
>  typedef struct {
> -- 
> 2.14.3
> 
>

I don't think we need the compat code in this case. I used to pedantically
recommend compat code for all guest visible changes, but after speaking
with Igor about the policy for introducing compat code for ACPI table
updates, I learned that we can relax a bit on a case by case basis. In
this case I would recommend relaxing, but I won't insist, as the compat
code is indeed the safest way to go.

Reviewed-by: Andrew Jones <drjones@redhat.com>
