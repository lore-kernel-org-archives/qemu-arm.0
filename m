Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1277764wrs;
        Tue, 12 Mar 2019 23:07:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxg3eJsydid8JuImR/PXPWPv490pkJmvALjLsG2I44S4MwLPwyZtzKf/Ixu8EjC+w4jOzLB
X-Received: by 2002:a25:d309:: with SMTP id e9mr31176461ybf.354.1552457233039;
        Tue, 12 Mar 2019 23:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552457233; cv=none;
        d=google.com; s=arc-20160816;
        b=syjbYy09DGIbeTakYhlUXruJrTWUXpGWsNUxAreecFcDhdSM6uGuZxYpP2dDfTffHe
         P6RYwiyh1TT9jtOZefwg9eyQgRH8CFyHaQIRPXFDX/4Hs5+bhoupzCaqa2cDjG8M8MWt
         cyuDuiOGzIs7JOHOm+tkVFWgZk+1FPg35zt+RWkhbbXbXh5BEkC5b7I547Exkvws9xBk
         A8sHFzi7EQgrEkmTMsiN/Qv4Nj10FhR7IUvZcb1jKRefXl2gM7fZvdvnmC/vCh2I1q//
         7c9QKd/iASWj1tdqEN+m0jj4RvoOcEww77xGvUUyOFhUTggZVGeTsFtdEkeG+QIpxWzJ
         M1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=vsbQW1fmcUHSxKWV5QMOySN+4bZWbs38K0t2l4hs8JU=;
        b=ddKeO1ld0uq0x0AXUXSbhWpiBBz4jOf0OowmYW3m3bMXT4xJnZ/uGA1upcIKdkXMg8
         lVOL1Z/PYrNI/ogy9qF0nk0whxXHaTe8opFJxhb5plVtsOHxEuViZdCg6Vk0AhGWg1l9
         SNav7V0NNCpQyd4LWdBmpXy6hkZgT3l6w8qBOifyonAIZH9dPKYze6geI/DtqlG/6hAC
         9mcLewqNwbiJQeOYLCdlC0EljEPWEG4RiO91It8PkIPhfAgOjDIf+/hRCHMv/FpYQZic
         btteTg16sguLQSpkX+8jiNpeG7gV8gW7uFJaIBpmV3qBb5yu+C09alFyo0nIgKyEZ5yU
         RoTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZNMs8c1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si6271973ywu.63.2019.03.12.23.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 23:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZNMs8c1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:38942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3x2m-00051L-Fd
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 02:07:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1h3x2Y-0004oZ-4b
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 02:06:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1h3wrp-0000ix-Pk
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 01:55:54 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1h3wrp-0000hT-D7; Wed, 13 Mar 2019 01:55:53 -0400
Received: by mail-ot1-x344.google.com with SMTP id c18so627963otl.13;
	Tue, 12 Mar 2019 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=vsbQW1fmcUHSxKWV5QMOySN+4bZWbs38K0t2l4hs8JU=;
	b=QZNMs8c1ien35zWcRYRlzvFnLnlFHMDoZaB9fhcOPf6CxpbvLgEDoBDmXd7DPj2QWn
	/akQCgxpq/1PquEbJddtI10r41MOqqCba4Hdn1gbXMQl+5nUFQHEjlRRtZT6jYASD5eA
	NMfK9cJ3yCR4nRd3+y6arnD4+Fg5j56CfJZmEM1GYkHCWYkMy7lQhLN5BP4b2GlKu7Gr
	N+OHQ//GjZEMhGdpyJ/llapB5QagqqShoP0K1krLDpq57wAhFxJpASwtEsIDN85vz2b8
	ZbEqBGC/ynL6G8mYMwNfMbwVmjDyxVgT2/nLbIGhcqis77FItSrY9JvtN7Oj9yyHxHDK
	0x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vsbQW1fmcUHSxKWV5QMOySN+4bZWbs38K0t2l4hs8JU=;
	b=ELzxziSiCifIZTOokJRVcJ06VVfvpUAXVWMgKU0HFJKFPT2fT0b+3PlEOWpPxRT8r9
	XilfhtUMdzmdLAPgY24PX3TsOlNZEcj5WJB1fhUCHzd7fh1MRm7S/Wfwip8Z7Nxewzo5
	wq3Rnbl569loL2/oolnMxApbZbJ4vKs5CGFMfLvBdRDH+mTGekc3H/rRUi66R0QwmJmE
	h7U55oNTNJPvjbCnvBI72qUN1Sx4PysA90Vx5f/9e0kdqI9u9zbBc/lI07Cz5lMxenZg
	S7wA5RMZhZ55WjQ9DwwtMmQAhUAPER4E2NKEOmshbf7lde7uiEXLhaUpGo9iHttYWELb
	YWAQ==
X-Gm-Message-State: APjAAAXcMfjavLm2da9o51jgyLNENMkz39UT8lfGohKcc8DulMAjihhg
	BMzZ58GE9K7MylTmfxF7xoI=
X-Received: by 2002:a9d:27a5:: with SMTP id c34mr27111519otb.30.1552456552292; 
	Tue, 12 Mar 2019 22:55:52 -0700 (PDT)
Received: from [30.43.122.2] ([47.89.83.57]) by smtp.gmail.com with ESMTPSA id
	w17sm4461823otk.12.2019.03.12.22.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 22:55:51 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190312091031.5185-1-eric.auger@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <d38ed94b-fff2-183b-4f67-ef8711744a6e@gmail.com>
Date: Wed, 13 Mar 2019 13:55:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190312091031.5185-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt-acpi-build: Fix SMMUv3 GSIV
 values
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+qS1Bskgxs/



On 2019/3/12 17:10, Eric Auger wrote:
> The GSIV numbers of the SPI based interrupts is not correct as
> ARM_SPI_BASE was not added to the irqmap[VIRT_SMMU] value. So
> this may collide with VIRTIO_MMIO irq window.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>

> ---
>   hw/arm/virt-acpi-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7e2e4885b..aa02d8d74e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -405,7 +405,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       its->identifiers[0] = 0; /* MADT translation_id */
>   
>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        int irq =  vms->irqmap[VIRT_SMMU];
> +        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>   
>           /* SMMUv3 node */
>           smmu_offset = iort_node_offset + node_size;
> 
