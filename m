Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1887141wro;
        Fri, 2 Nov 2018 02:41:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fIvgd1kXxtkD/76eFEvwzFowblzULI2stsHx09DvXMp5HH8wEeEsEwSg1WKdGmqQPluLBE
X-Received: by 2002:ae9:e311:: with SMTP id v17mr9367885qkf.193.1541151689089;
        Fri, 02 Nov 2018 02:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541151689; cv=none;
        d=google.com; s=arc-20160816;
        b=HNoKRZAR8cbPepiIbwccJ4y0637jHPIvobfeKhQPIpo00m0qJQswzY44WG5bywozXP
         Ns85Lt2Z78wNATuewYNkm6B6IVPW6BRGuiESP7OgimTQHmsKHHNaF52bvlNq0n0mvtAh
         zvn5BRgkDo8mAnTVSnb0jkOd50Tfpyv/RtAexOXWJ6p5U3XGtTH3Z37y/Zuuj+YXIHIf
         oYoWKAeyyFPvUo57vDPYej6VRR44mpk3hqJktmb0yzYIKGkO7C1zhrI2twptVzBkVKu3
         osFXmp1Yzol/76mf9lihulS9jXzdqYNmJuRt38cgyt65pHMs4bbB+NmI3TUkDaE+LhRc
         2YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=JtiUOupyMNjxBSdKM89oeQRXx/cOzFjc9KnZMfI+GDA=;
        b=IUmpjbet9qC7UvYjvpAo8RsPnQOi31PFuPgJZcSVD4uIBWku2uQuJ+jJU+Jxwm8ByO
         yPHoedk8n0qFqlAc5rPCIicfxFaFvWkhkP/h/aWZFZ/It+Mxs4Eppmz+82jrdjgRd/uI
         GIRqa3V+1n0jqX23p0n77NHHvxtlW6f6yL5mnIaaMRKcakBKMSWpQBknlKHE64oKZh4a
         X11H/mViPspnB9OkEoCgyLnywArFtptQqBY2LiMXcFW0rRTV0uXNsjtgn8P1AHlQ3W2R
         ZTCyYTZ0f4rdFaFQTOPwfrsLugYAVuRtilv7DuUTGUtFbAvcpxqAHZmuiwv75GyrDba5
         FPsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LKaqkQPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m25si1374965qtg.282.2018.11.02.02.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 02:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LKaqkQPZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIVxI-0007Za-Iw
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 05:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVx8-0007YH-Nd
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gIVx3-000295-1g
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:41:18 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gIVx1-00027h-5r; Fri, 02 Nov 2018 05:41:12 -0400
Received: by mail-ot1-x341.google.com with SMTP id 40so939634oth.4;
	Fri, 02 Nov 2018 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JtiUOupyMNjxBSdKM89oeQRXx/cOzFjc9KnZMfI+GDA=;
	b=LKaqkQPZoUYjS8zQXwReuhqZV2cUensR/ktWODYns9WtRu6HDQMLScc5JgR6VHsBOh
	Iuys7+Oo06jODjPmZaxoJM7vGj6UsmyCmDTHjAPP8mE0CkY+uu1YaD+Vg4EtXEneoNbs
	j5HacSjJ5wZmEn1EJRiNBVUu41mzecJQpOWz189gf6lqJTUu+6spZkEKhG2T7ObYyPJm
	DIEkJmZ4+CwNwv6sdrUtxA0Ke73GIsRLu2Pi8+aW9RkIYxQknzscfYrvJ4Y0/n3kmzdj
	aXyQmctDiaRy00ehoVBEVUs+aIKJBt0EMBp0DEwA1GkIquhrxtSUvCusPjahSCJEBTlv
	e82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JtiUOupyMNjxBSdKM89oeQRXx/cOzFjc9KnZMfI+GDA=;
	b=N7R0ppxGFyo/ubepuBAret3A7/Jx9iSt+ctpJ7mrn6M9PAtLryyPxwUeamB95Qyv+h
	0xfEBTBDmxPxsAHEUtI2Ofq5QdWZd0Y3KCPf5V9wepkUrcoZykkW/XrXdtMmoIfLXFIB
	Opj/AF+ZudW6CK/XRHEzYRkgHqgOVriqmktu6vexMFtoP7hrZzjo7I7CsNE7XPwkx6ME
	7JOiNX9T47/8ZWwwKfU3wTZMJTHCG7EDft/0BmXksAeZ13ZcriRmmRNFVI+dldMCn8eq
	eKF1SK+mISgLlR6IDtdJ3t/v6r4/MmdavX5/TdsaKTB+M7e2ae2prXyo8XNvsP/biqyW
	ka6g==
X-Gm-Message-State: AGRZ1gK+tRD19aDXxbYKQXkbjYxL/La8vxZxGaR0k8K9WUd36+QQfRFi
	BmVgtE2K5Cq8Ggjbd29kNtk=
X-Received: by 2002:a9d:7285:: with SMTP id t5mr6516161otj.345.1541151670456; 
	Fri, 02 Nov 2018 02:41:10 -0700 (PDT)
Received: from [30.43.112.38] ([47.89.83.58]) by smtp.gmail.com with ESMTPSA id
	30sm11171948otr.52.2018.11.02.02.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 02:41:09 -0700 (PDT)
To: Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-7-sameo@linux.intel.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <ef5c7f5c-b5b0-ad0f-7e49-3c900e668429@gmail.com>
Date: Fri, 2 Nov 2018 17:41:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181101102303.16439-7-sameo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v4 06/23] hw: acpi: Generalize AML build
 routines
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XupyGxdFupul



On 2018/11/1 18:22, Samuel Ortiz wrote:
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0a6a88380a..6822ee4eaa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -546,7 +546,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   }
>   
>   static void
> -build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +virt_build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
>       AcpiTableMcfg *mcfg;
>       const MemMapEntry *memmap = vms->memmap;
> @@ -791,7 +791,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       build_gtdt(tables_blob, tables->linker, vms);
>   
>       acpi_add_table(table_offsets, tables_blob);
> -    build_mcfg(tables_blob, tables->linker, vms);
> +    virt_build_mcfg(tables_blob, tables->linker, vms);
Looks like it doesn't share build_mcfg with x86. Why you still export 
the x86 build_mcfg and introduce this unnecessary change?

Thanks,
Shannon
