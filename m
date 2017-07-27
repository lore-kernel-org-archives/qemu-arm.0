Received: by 10.25.44.15 with SMTP id s15csp2428543lfs;
        Thu, 27 Jul 2017 13:27:53 -0700 (PDT)
X-Received: by 10.237.49.132 with SMTP id 4mr8089750qth.105.1501187273421;
        Thu, 27 Jul 2017 13:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501187273; cv=none;
        d=google.com; s=arc-20160816;
        b=bDG3cWhDi3rCrMtBxfan6EP5R38xZ+TlMCV07n5DTUU9dzn+sKkL4eUDHXUqLH6kha
         vxRdha9L/97QjSgPOAC2J9XoFbjS0sG6Vw8PfdH245ZT1t2viY53NUwfYhSXbz1TGuKX
         8lq2QrUMa1RcIS/8b8fQNzEHPz9o0Lm7nraQ/gVFUUPNCU0lqHgBoZbLJFfDarfnmnW0
         0HT5cuucMHi3D+VUsTv2pwr3NuDWxjslDwegOrKIUurwiCOS+ymYXRiWWIoXHji2IVvd
         eJh+40WosuCLxeVgHbxew1PsnqQRtwT8/mnSGPmpp2xPSG/RFL709Et7y8pV+cHPapSt
         vQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=jT/jswYPfmnK5hvlRthsLRbfRS50KXsZ/uTrxuP1jqg=;
        b=Gtos5xjchTBQ87/mgj29aruPkZkA7OHzaG6ghQ3zqsXiQOO9asKFxSkom1ui3UOdWm
         IskdF5kE0nOr2i/oqh2dSeuolZ7NUukXpydDTvAdlzSF5Gl8mXksvKNN3mUQpwn+Qokx
         YsDYm3Wn5xeuZW/YOJnu+fdmU9krp0toxziK+mR0q44MlphT4Cedk+UtgvAkxqu5LyG9
         N9XrcijsydQE2AbQbDPhjatjAqfPJCWKPZQrMVOnUvwaKX+9N1L1EHGOJjwqdbX3ex7Y
         frIPi80spQSxZayR74kL8uDxkv2p28Mn6IanYc+fbWozwpMuwb+hadncOpbVo9sJT1ql
         ZMNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 101si16611671qkz.51.2017.07.27.13.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 13:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dapNu-000325-HO
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 16:27:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapMf-0002SM-Qr
	for qemu-devel@nongnu.org; Thu, 27 Jul 2017 16:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapMe-000561-Pr
	for qemu-devel@nongnu.org; Thu, 27 Jul 2017 16:26:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dapMX-0004xw-PU; Thu, 27 Jul 2017 16:26:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86A87C0D8030;
	Thu, 27 Jul 2017 20:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 86A87C0D8030
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D30F5D9C9;
	Thu, 27 Jul 2017 20:26:13 +0000 (UTC)
To: Tomasz Nowicki <tn@semihalf.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-3-git-send-email-eric.auger@redhat.com>
	<04b06baa-75d8-291b-ef6e-89bbb89b3fd1@semihalf.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9a41e0b1-0519-2c93-70b4-30e0a38a2405@redhat.com>
Date: Thu, 27 Jul 2017 22:26:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <04b06baa-75d8-291b-ef6e-89bbb89b3fd1@semihalf.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 27 Jul 2017 20:26:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v5 2/8] hw/arm/smmuv3: smmuv3 emulation model
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DPHa4Bof3Cnv

Hi Tomasz,

On 13/07/2017 14:00, Tomasz Nowicki wrote:
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
>> +/*****************************
>> + *  Register Access Primitives
>> + *****************************/
>> +
>> +static inline void smmu_write64_reg(SMMUV3State *s, uint32_t addr,
>> uint64_t val)
>> +{
>> +    addr >>= 2;
>> +    s->regs[addr] = val & 0xFFFFFFFFULL;
>> +    s->regs[addr + 1] = val & ~0xFFFFFFFFULL;
>> +}
>> +
>> +static inline void smmu_write_reg(SMMUV3State *s, uint32_t addr,
>> uint64_t val)
>> +{
>> +    s->regs[addr >> 2] = val;
>> +}
>> +
>> +static inline uint32_t smmu_read_reg(SMMUV3State *s, uint32_t addr)
>> +{
>> +    return s->regs[addr >> 2];
>> +}
>> +
>> +static inline uint64_t smmu_read64_reg(SMMUV3State *s, uint32_t addr)
>> +{
>> +    addr >>= 2;
>> +    return s->regs[addr] | (s->regs[addr + 1] << 32);
> 
> To be consistent with smmu_write64_reg() we should not shift here second
> half of register, instead simply:
> 
> return s->regs[addr] | s->regs[addr + 1];

Thanks for spotting this. I think regs should be uint32_t instead and
extract64() could be used on write64 and shift would stay on read64().

Regards

Eric
> 
> Thanks,
> Tomasz
