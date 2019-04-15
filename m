Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2651430wrx;
        Mon, 15 Apr 2019 06:03:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGmfFCEwzOlCd3IklmOlwdB60pA1HqeDA4DIhLAP7Kexz3WVPFjcjwZukOGPQif3pEwsL3
X-Received: by 2002:a1c:39d7:: with SMTP id g206mr20596782wma.99.1555333409499;
        Mon, 15 Apr 2019 06:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555333409; cv=none;
        d=google.com; s=arc-20160816;
        b=A1ym1qFslEwLd5MLYnfsIBjOe499dQVTjbwNRSCRKUkcFCI85pSTE7VlJhPpB/Oo9m
         kZmfBsaJiNIZiNc9RCuHMM/13PFHac9fCqMRFX6NOIuN7zOzJNqm9be9y8iP9Gdn3DmA
         6F/xXgPEEl74ScyV2gQOkIRjI8rfAbB/vD+6ZBcnlRhj6mhpD9kfWDOFNo+1mnTZB3FS
         siXSK4CZwcZTnv/uZ7dyM7u2vAN/yxzHnXEDsKB+J5yLqZbsEtCpE2zbALLNyVsYK1s1
         g2WPKbEP9ymeu6dN6KmFuodtSOrGSH09XLyzE4qTMGXf5pBfaW+ShY1mE760dM274g5O
         lVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4Zpb98NN9UpmgwbN/OmilnYPFoUa7Uafq0ZGYEx6/Qk=;
        b=zTJqEjhmiMCuAzmKuFmHgpcpm/sHYKYnNCQaHJfZwXeEnyGxBiY+izkWiPESNJjWKl
         fVTKD1VVJySvigBUqjfcm5Kt0na6WTJFp5yGdpDmQtw0Tgz284oKKEebWT1QR1pYu18b
         LO7Qs5E5YXBzTWkqzhgxqHotAxWht45yZQ+h3oXAeepLKza8LvyiR1QhRAoylvCFfwDz
         bSTKYN9FKz/h7yk/mo/dvMBwIeBczsLO0MBx212b78vk6aTpnUe0pnVEb8LBE9qPctZp
         dV0H+7bC+83hEjlBUD5mm2y35Iungf+9/UYCiI6CTqmzrl8mzax6gv9xBiJwdZCxSAmJ
         FvWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si11108308wmg.105.2019.04.15.06.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 06:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hG1Gi-0004Ir-LG
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 09:03:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1G0-0004Hi-1q
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 09:02:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hG1Ft-0004zL-C1
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 09:02:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hG1Fp-0004ir-M2
	for qemu-devel@nongnu.org; Mon, 15 Apr 2019 09:02:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id s15so21810999wra.12
	for <qemu-devel@nongnu.org>; Mon, 15 Apr 2019 06:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4Zpb98NN9UpmgwbN/OmilnYPFoUa7Uafq0ZGYEx6/Qk=;
	b=bIjU2pMhOM4a/tOXIRojaOqS99TSQ8ZQ6uol5iRd25qphtUpjk5WFJ4h/g/hJkx+1l
	hbkHaarnLVUhNuhJYPwuGfF0fwC/CXq9IJP1mZgFkZh4JSCv2RWI4GuhWC9UwW206aOK
	Ujbv/Ipc6QG2oJvLoTJiP7z2sZN10T7vHUvv+ozOjhU9hm9mCer83BtiYHpS6dfWdhZa
	ZfrVZ5vP++cFpuZrkRAjP5973gty1bFnK5B7vTW5s8ukB/Y415E6PvjxHOioyMZbsMid
	olEl7Pz5BhoyUD2CTC0CcmtWL7FhAThpb4K6zr3S3D6ITXVDWttqnUx51LcZpz6WjasJ
	QbVg==
X-Gm-Message-State: APjAAAVR5NJlraK34KNm9L6vCXgc3xLKdamKubasZAiIdctgQr2evS5a
	gdWEg7Xu1Kf7xrS1kSq7lnmXeA==
X-Received: by 2002:a5d:5192:: with SMTP id k18mr12899757wrv.171.1555333341718;
	Mon, 15 Apr 2019 06:02:21 -0700 (PDT)
Received: from [10.1.5.6] (206.red-80-28-210.staticip.rima-tde.net.
	[80.28.210.206]) by smtp.gmail.com with ESMTPSA id
	v6sm64000555wrt.56.2019.04.15.06.02.20
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 06:02:21 -0700 (PDT)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
	<20190415070307.13668-2-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d4d6f1d4-9df8-a73e-4086-6c43e5ba7b4a@redhat.com>
Date: Mon, 15 Apr 2019 15:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415070307.13668-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 1/4] hw/arm/virt-acpi-build: remove
 unnecessary variable mcfg_start
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, imammedo@redhat.com,
	shannon.zhaosl@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZ4ewk5UJSNs

On 4/15/19 9:03 AM, Wei Yang wrote:
> mcfg_start points to the start of MCFG table and is used in
> build_header. While this information could be derived from mcfg.
> 
> This patch removes the unnecessary variable mcfg_start.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 857989362a..e09e7eff8d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -552,7 +552,6 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const MemMapEntry *memmap = vms->memmap;
>      int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
>      int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> -    int mcfg_start = table_data->len;
>  
>      mcfg = acpi_data_push(table_data, len);
>      mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
> @@ -563,8 +562,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      mcfg->allocation[0].end_bus_number =
>          PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
>  
> -    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> -                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> +    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
>  }
>  
>  /* GTDT */
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
