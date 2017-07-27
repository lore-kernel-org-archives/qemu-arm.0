Received: by 10.25.44.15 with SMTP id s15csp2427376lfs;
        Thu, 27 Jul 2017 13:26:22 -0700 (PDT)
X-Received: by 10.200.36.145 with SMTP id s17mr7190248qts.224.1501187182769;
        Thu, 27 Jul 2017 13:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501187182; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXRMAXboJzjuRyCGLMFfn3+Ni7E7aK+fkPh74n07B413Vd7lIdkiirGTg0vCqrSL6A
         WJXPoSYnEAG+3IyijwVPmxmtvGJlnF9ELXf1I7gzHxyS8hROOtFifn++j833dTvPIu5K
         Sa+YlxOcc+G4T1bH26gezUyWBsM50mBQGhpuxXwwy9k/yhpO/H3/iGV86uk3ZHcrj3z1
         1lM0+1yQUc4X8DJhZCfrn5ScbRG2KM2tfQj19GKPw6YMXqvAew/j2Ypuqys7J2rM3xRq
         lQ4SyiVxkX+TThdF1EVr3Ca0Yy9dhqtRZMKEFxOO6Lu1GeTTgR5YhlXZnSv/CmDji/pJ
         139Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=JY54wUQMC4r4+oO8HHFx2ybSecHtjaUV0lDZyELGRYo=;
        b=QhvncKCF+9W4uKEFVdMx82/giq5PtmdOy8Mz0S2ZpwRm02Kp4p1Bo3BOQbSE5c0siF
         qwOiGIZoibsGmxf51kOQaHoO8EcmTJcUGGDw0wMZrOb8R7f901Ih76qmm99wENDsE1NS
         RfamJnjD/mXq9gFExj5vykCDryfAp7C6iPxb8r927QmAawHWD+JC1XsANHy4M5mSa6WO
         0nDsEObfAhcugm64kUrE1PRO6G7/nsY1OXev8dcFsCzBoWwziSp+uMvNLMyM09y1VH4J
         69ud6hYz77byF7MtIXzSu2WYqm8uupTL63mtQxF8/qTYb+GiMhTt3rnsGnxKO6fQhdIh
         G9Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q55si15943642qtq.264.2017.07.27.13.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 13:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dapMS-0002J0-2K
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 16:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapMM-0002It-8J
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 16:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapMJ-0004hd-4o
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 16:26:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53600)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dapMI-0004du-VI; Thu, 27 Jul 2017 16:26:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68C30D69A3;
	Thu, 27 Jul 2017 20:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 68C30D69A3
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2E36FF04;
	Thu, 27 Jul 2017 20:25:55 +0000 (UTC)
To: Tomasz Nowicki <tn@semihalf.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-3-git-send-email-eric.auger@redhat.com>
	<448765a4-1ffc-f27b-fcb1-61445fd785d4@semihalf.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <eb6021f4-b0c1-22c2-dddf-e30f331abcbc@redhat.com>
Date: Thu, 27 Jul 2017 22:25:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <448765a4-1ffc-f27b-fcb1-61445fd785d4@semihalf.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 27 Jul 2017 20:26:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v5 2/8] hw/arm/smmuv3: smmuv3 emulation model
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 12Ki2JDcy1Vd

Hi Tomasz,

On 13/07/2017 14:57, Tomasz Nowicki wrote:
> Hi Eric,
> 
> On 09.07.2017 22:51, Eric Auger wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> Introduces the SMMUv3 derived model. This is based on
>> System MMUv3 specification (v17).
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v4 -> v5:
>> - change smmuv3_translate proto (IOMMUAccessFlags flag)
>> - has_stagex replaced by is_ste_stagex
>> - smmu_cfg_populate removed
>> - added smmuv3_decode_config and reworked error management
>> - remwork the naming of IOMMU mrs
>> - fix SMMU_CMDQ_CONS offset
>>
> 
> [...]
> 
>> +
>> +static void smmu_update_qreg(SMMUV3State *s, SMMUQueue *q, hwaddr reg,
>> +                             uint32_t off, uint64_t val, unsigned size)
>> +{
>> +   if (size == 8 && off == 0) {
>> +        smmu_write64_reg(s, reg, val);
> 
> Based on my observation we never get here.
> 
> If I read the code correctly,
> memory_region_dispatch_{write|read}()->memory_region_{write|read}_accessor()
> will cut all 8-bytes accesses into 4-bytes slices. However, this makes
> my SMMUv3 register handling happy:
> 
>  static const MemoryRegionOps smmu_mem_ops = {
>      .read = smmu_read_mmio,
>      .write = smmu_write_mmio,
>      .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 8,
>      },
> +    .impl = {
> +        .min_access_size = 4,
> +    .max_access_size = 8,
> +    },
Yes indeed: without the .impl setting, only 4byte accesses are performed
by access_with_adjusted_size() which sets access_size_max to 4.

Thanks a lot.

Best regards

Eric
>  };
> 
> Thanks,
> Tomasz
