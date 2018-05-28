Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2647885wre;
        Mon, 28 May 2018 09:29:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIn/HDwZtl1gxEfFYJZOm8Pe1EeC0Vbun329JndkTNUnIoGthvla2id281XOJ1kO48KRNYK
X-Received: by 2002:ac8:70c3:: with SMTP id g3-v6mr12495768qtp.95.1527524969636;
        Mon, 28 May 2018 09:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527524969; cv=none;
        d=google.com; s=arc-20160816;
        b=CX5zdmMAVeb0Fh7TrsCtMLfWAoXjsCsrLyBuDUJzbY8dHkGTVxhnY5Pj/g6jEErulS
         TNYgDgri99riW87bFkhJibVGMGhLoWfMGNldKyiEqSUh3WUnQNJbVXh5OCZxcptvrmqc
         pbdmpTNWurxlhvwQsHu2MEka/1hhEOvDEefobcuZTziF2ci1ZsR5XT+rqnIRcZfDn6FC
         lt3j9OzOYiGZlqonn6hv5uMOhLTkBuBCm6KZOyyRfafyAufwcS52Nh3CTDQ8ORz3X9nj
         07fWOprjWJSLMWlmpMUYtbLhWq30sCHFYbuP3iOfrW7n6oDFEeMT+T35ucmc1kcFfwpt
         Ei2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=OLWyiqbGlt2sYj78FxItHVhwIY/s3idrjBLJPl4nCQM=;
        b=DpVkgHGRvS2rvtdLPiDkTlKjo28AZW3w3bQ99GLNiKUlGNVfQGk1OfMZ06LxORGX9j
         2VFI4zvjJNPAcsqia+H0XFhZ9HAe1FiVLwA5gYnHhM9f8CA2uDsGPIdRbNhJKA84nDFo
         Q1RtqolRQkDckYRdcmsVkGWy44VSU6Mzc/KxsOkaYmYFaaqSXTNNjJ2GjS4n36/hIztA
         tleJUXQWSkC2AbKCgHBF8WvFqeQzbtPjOlfgnimfAOLzTMKpeOA+KP9cl2kXABgKSK5Z
         R026n5cJjN7AcY+iIijZtu6htgsVbhrCk6RdlsFULy5XiNGTxezBW6G0LO4IDv8sneq1
         l1XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=moMVDVyJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19-v6si811460qtd.162.2018.05.28.09.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 09:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=moMVDVyJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNL1V-0006xc-6g
	for alex.bennee@linaro.org; Mon, 28 May 2018 12:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKzy-0006UK-55
	for qemu-devel@nongnu.org; Mon, 28 May 2018 12:27:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKzu-0000xf-Uv
	for qemu-devel@nongnu.org; Mon, 28 May 2018 12:27:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNKzu-0000xR-RF; Mon, 28 May 2018 12:27:50 -0400
Received: by mail-qk0-x243.google.com with SMTP id h19-v6so9495142qkj.10;
	Mon, 28 May 2018 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OLWyiqbGlt2sYj78FxItHVhwIY/s3idrjBLJPl4nCQM=;
	b=moMVDVyJrAWnTra94FAT7JgC0BoAT/BAxFDh0A8C9uRWTahlbCZkVp4UgJ7XVE/e4q
	Y1H5PPNJPz9VQ7K5o60IFOXTmlQNr+zZB8ZHl6ZMNNYN5euOQ4zmAQh/WDA4AsowiQbC
	PT33tjlasdsWlCWYSik1Cigp7Ro+BoTVCOpsF7gE9rbE8pWuI58SYJYu8M9OhQJVKQfo
	LH+c4gc2JoF6YcLCWaCSWFeOZYeyDVeC/xjnjpjxRW0yBZ7Ms2qroQTgmkKzoAlNEywq
	eFVW08w9ySp9iijrSepZF5oIgRYQEm7st4yu2fG8QnHf4B1Aef3b2XIGNJDQlQY/2EJF
	LqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OLWyiqbGlt2sYj78FxItHVhwIY/s3idrjBLJPl4nCQM=;
	b=mBor+vOJuRCkVqwPcf3rWvrAjkeaj2V/nCrrF0aSK0Ofs/EOD7gAhcbw4+LNfNitjh
	7zKbFfYUPAO6UZfCEe+H61SNvkfJ9c9QzAFR4Phkx8ZxA+CpJyNxEnIz4EnAUQ+61xg8
	1NnGoylb6mmHm7YqGLStzyrHivboOH8Qtokzx+0t6YxD62GDYrbUj0P4yenmbHXdX/z8
	iB4x72puOXgmkhDlpXnXwjEkKQLQd1R05U8rWC+G4RpPJTxNtRMNsql+hQGrhq+MSnvz
	LTosuJ1/4cUozTVrS/8BBFfBh5GUOm08G7wRXnlD5RVDupWCMZtlD7gPFnaHYiqjohbZ
	w4jQ==
X-Gm-Message-State: ALKqPwd73t/selJED7d8D/yqKWGK5Eoicu3RlOn21X3PRVgYBzbNbMcR
	8WP3H1yu/N0j08T35ujIZTY=
X-Received: by 2002:ae9:ed02:: with SMTP id
	c2-v6mr11173216qkg.127.1527524870263; 
	Mon, 28 May 2018 09:27:50 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	v26-v6sm2987306qtc.12.2018.05.28.09.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 09:27:49 -0700 (PDT)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527496946-12036-1-git-send-email-zhaoshenglong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8b06a7d9-49d4-9d22-d357-5448fbaf7a56@amsat.org>
Date: Mon, 28 May 2018 13:27:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527496946-12036-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] ARM: ACPI: Fix use-after-free
 due to memory realloc
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
	shannon.zhaosl@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBmdwu6T2mFS

On 05/28/2018 05:42 AM, Shannon Zhao wrote:
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. So previous
> pointer could not be used any more. It must update the pointer and use
> the new one.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 92ceee9..30584ee 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiIortItsGroup *its;
>      AcpiIortTable *iort;
>      AcpiIortSmmu3 *smmu;
> -    size_t node_size, iort_length, smmu_offset = 0;
> +    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
>  
>      iort = acpi_data_push(table_data, sizeof(*iort));
> @@ -414,6 +414,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      iort_length = sizeof(*iort);
>      iort->node_count = cpu_to_le32(nb_nodes);
>      iort->node_offset = cpu_to_le32(sizeof(*iort));

Eventually similar comment to explain why you also use another var:

       /*
        * Use a copy in case table_data->data moves during
        * acpi_data_push operations.
        */
> +    iort_node_offset = iort->node_offset;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>      /* ITS group node */
>      node_size =  sizeof(*its) + sizeof(uint32_t);
> @@ -429,7 +430,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          int irq =  vms->irqmap[VIRT_SMMU];
>  
>          /* SMMUv3 node */
> -        smmu_offset = iort->node_offset + node_size;
> +        smmu_offset = iort_node_offset + node_size;
>          node_size = sizeof(*smmu) + sizeof(*idmap);
>          iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
> @@ -450,7 +451,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->id_count = cpu_to_le32(0xFFFF);
>          idmap->output_base = 0;
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
>      /* Root Complex Node */
> @@ -479,9 +480,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->output_reference = cpu_to_le32(smmu_offset);
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
> +    /*
> +     * Update the pointer address in case table_data->data moved during above
> +     * acpi_data_push operations.
> +     */
> +    iort = (AcpiIortTable *)(table_data->data + iort_start);
>      iort->length = cpu_to_le32(iort_length);
>  
>      build_header(linker, table_data, (void *)(table_data->data + iort_start),
> 
