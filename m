Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp848788wrt;
        Mon, 26 Nov 2018 21:53:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5eDQO7m1H3vJ1kBKQ+TmPrkwwnS55YdYBj9Q9cWxMM9nDE8CN743zrMmqg1ix/zinOrZLW4
X-Received: by 2002:a81:1054:: with SMTP id 81-v6mr33264710ywq.271.1543298021126;
        Mon, 26 Nov 2018 21:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543298021; cv=none;
        d=google.com; s=arc-20160816;
        b=etTMxG5meHcdcyq+9E1aUAetkcSew/4D7OI9BQZShRPD8buXz4yxg/dGOmNBN1pjsf
         zippfgW+9KpxiW/PkGYxL2chOkvqirvYIzLZqaG2/O0dB3DCT4ic3kNfR0eHY98p82UG
         EWkO7KH5z0soCCQBWPhYk8vl58FWW8ige5jup+qDSrGMnCFB7gVYFTk+H/JPtlNoFLQA
         p5AGeIwd+GPXag+azgcg+b1zjKvGdEhaazo2ECsUUxW4rRuFrDsMI6Wz5vmu6G9ywVeH
         k7fqiq9MPF+zuHAR4iAnaqbARYrEXCn5k+iuWJXMvCRDLnbv+ZfVC43jrVakEyp6pQ0j
         wJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=rotfO14NtbXoEBiLEdrSFPgiexOKEiN6/kSFwCDOr9Y=;
        b=DwT+gIqbIcUDew3UI72NJmWpxxoFVO3l2z8Dmx0DsxpbdTJf26Ov3cjeY3PZezgv+K
         djbJ+NuHxDuA0DZvcBpJUVWdlAWtpZSkph55ECHQfiMos5tgLKr9m/TbKoWepUvfATgp
         JovsW70vZH/WAQubt8HmQblUWJ/yFmY2M64onsmM/5JygGVfXgYc6oXq5IlbCIAODDdx
         LYtc2NIoKoS1uuegumfoeSr8CvLcBMUgPC3azdJMnxQ3JkXaU1p0UcqWIZ2cfM8HWVY9
         n15m2qemynCQjD0nvI/dn3wZdFi22pTmNzQtGo+oPdR4kPPTF63ZiSRFxMGSDZbUBwQK
         uqlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si1755993ybq.488.2018.11.26.21.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 21:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRWJY-0004V2-M2
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 00:53:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRWJS-0004Qs-8Z
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 00:53:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gRWJP-0005he-3l
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 00:53:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gRWJO-0005h5-Se; Tue, 27 Nov 2018 00:53:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AAB0FA0770;
	Tue, 27 Nov 2018 05:53:28 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5819D60BE8;
	Tue, 27 Nov 2018 05:53:27 +0000 (UTC)
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com
References: <20181126154616.18173-1-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b3c22264-2a95-b851-025c-b8ff0f38f269@redhat.com>
Date: Tue, 27 Nov 2018 06:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181126154616.18173-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 27 Nov 2018 05:53:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build:
 Fix SMMUv3 ACPI integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XeopkS9KqduE

Hi Shannon,

On 11/26/18 4:46 PM, Eric Auger wrote:
> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
> proximity domain and the device id mapping index.
I fail to understand how we currently track the evolutions of the IORT
structures:

Looking at the smmuv3 node in kernel include/acpi/actbl2.h

- the following fields were added in c944230064eb  ACPICA: iasl: Update
to IORT SMMUv3 disassembling (1 year, 4 months ago)
	u8 pxm;
	u8 reserved1;
	u16 reserved2;
- id_mapping_index was added in 4c106aa411ee  ACPICA: iasl: Add SMMUv3
device ID mapping index support (1 year ago)
- current u32 pxm was introduced in d87be0438e3d  ACPICA: IORT: Update
for revision D (6 months ago)

I would have expected each of those evolutions to be tagged by a
revision increment in the acpi_iort_node.revision field but this is not
done. Also I fail to see any enum for encoding the revision.

The smmuv3 struct that has been exposed until now corresponds to Rev C
https://lists.linuxfoundation.org/pipermail/iommu/2017-May/022000.html
(0c2021c047ba  ACPICA: IORT: Update SMMU models for revision C (1 year,
4 months ago)

Also I noticed that in rev D, new fields were added in struct
acpi_iort_root_complex. We miss them at the moment in the IORT description.

How does the guest kernel know which revision of the IORT is exposed?
What do I miss?

Thanks

Eric

> 
> Also let's report IO-coherent access is supported for
> translation table walks, descriptor fetches and queues by
> setting the COHACC override flag. Without that, we observe
> wrong command opcodes. The DT description also advertises
> the dma coherency.
> 
> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c    | 1 +
>  include/hw/acpi/acpi-defs.h | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb697c..aa177ba64d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -448,6 +448,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->mapping_count = cpu_to_le32(1);
>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
> +        smmu->flags = ACPI_IORT_SMMU_V3_COHACC_OVERRIDE;
>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index af8e023968..c3ee1f517b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -628,6 +628,12 @@ struct AcpiIortItsGroup {
>  } QEMU_PACKED;
>  typedef struct AcpiIortItsGroup AcpiIortItsGroup;
>  
> +enum {
> +    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
> +    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
> +    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
> +};
> +
>  struct AcpiIortSmmu3 {
>      ACPI_IORT_NODE_HEADER_DEF
>      uint64_t base_address;
> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>      uint32_t pri_gsiv;
>      uint32_t gerr_gsiv;
>      uint32_t sync_gsiv;
> +    uint32_t pxm;
> +    uint32_t id_mapping_index;
>      AcpiIortIdMapping id_mapping_array[0];
>  } QEMU_PACKED;
>  typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
> 
