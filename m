Received: by 10.25.44.15 with SMTP id s15csp2378298lfs;
        Thu, 13 Jul 2017 09:21:34 -0700 (PDT)
X-Received: by 10.55.166.2 with SMTP id p2mr5976669qke.179.1499962894340;
        Thu, 13 Jul 2017 09:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499962894; cv=none;
        d=google.com; s=arc-20160816;
        b=yaIxZh2KUp8WOaV9nptAT/x7dzw6AzHtlb8BQe0re9HXQys0zHlryBFvEVzYzqnmxs
         AZjUljV/i7RGTAjHutXDplNYO+ebPjFfaJA55NNPewoaC51qDSdumh+oJPmeO7xx+fKj
         51NNo81zOwC7GadHyhccOxWtYCubu9RbaH7GBvnvK7QqCyySfWRJ2QKRk/9KOZO6xr3S
         0vv95ox0HuLGSFML1VwgcxSp6akLkXrYLeiSnMU2cfJ70OqmvPIupFlwAliY/0JytzU8
         yNiaFUtGm05Qh2HggBBAasqaLAzYX2hNk7bIKHXrVU2gwMOK5l52J9xiwq6fwcODIuYa
         NLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=dvSnADPYjRF5HgvXS3m+m0C92EHXuHBchYj4M5JhihQ=;
        b=wtf+aUQuIi2aIdxAntv6UWGYKymeH2aWJcPi4lJtALetLi+SQpwWAfPv9IKLOK6CVm
         YAHTxO55u+i/MjNPtYcDXkbFz+YQOfK3dCNofq6QYMoCUTVq2EK2AJb5qN4ClbrzsCSD
         XnJtt02uy7/uARhLAaBNr+R/UxxzmEF5F8/DpVgiRW9AX5WA7IxlHWeVv+Avpg0Zd7eG
         CnK9XB7ma7qjkqxSLOzD3ndeTWLHgZf0cnh8mEjg/SiQvGFqh1jr+73E28WMGOE3Cz1M
         bmjhD6wb3DdpNvB+cPwiXH5tezFA1PnrOERksjNeYxxtntiEaCCvC7Olbg1iNaPy1B+e
         O2ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=aBZEtNO/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i20si5512696qtf.145.2017.07.13.09.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 09:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=aBZEtNO/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVgrr-0005qy-JV
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 12:21:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVcoF-0001IY-Nx
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dVco9-0002mD-Ti
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:01:31 -0400
Received: from mail-lf0-f48.google.com ([209.85.215.48]:34935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tn@semihalf.com>) id 1dVco9-0002jo-Mp
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 08:01:25 -0400
Received: by mail-lf0-f48.google.com with SMTP id b207so35281031lfg.2
	for <qemu-arm@nongnu.org>; Thu, 13 Jul 2017 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=semihalf-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dvSnADPYjRF5HgvXS3m+m0C92EHXuHBchYj4M5JhihQ=;
	b=aBZEtNO/ZJNx85K9uaAcV2UMonx4ZyyuLs2tVnnRyfyyRfNOLgaNQl0Q+HsMBNUBE8
	M0x3Eut98CYyhj2UK4iZ5rjtAsEILmiev8wZo+SsGzU6XdF6apdOfTcGkPaq4OsJwWg+
	IrnFPnDpUvgdEsViZHZXXx/i0jhR5MCOZMudCS5A1Cc6Ds5oS4WevXwmEqFfZNY0T3Jg
	jO0OdtnX2sJZPvr1UdlMkWW8JcQW1iEmebvvgH5pBWlec1ERYtRxQox3nCeW49BqdRzV
	y3bYFPBuhLvDlztdRawqPCyRKDUz8xu//v+Lm/u3Yonw3E5jf/6d/W5RhJk8zooQbsKh
	dZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dvSnADPYjRF5HgvXS3m+m0C92EHXuHBchYj4M5JhihQ=;
	b=ZHn+srlgP7ro6hv2stS38qVnqi6tuCNwf6AMuk2XuieYZwpiA2pQ0lDf1uTHvEnzjp
	SVB9wY3Z/klbDa5PYWyYam33zFxWB5kfH0cX7WnBDoBLMJ0r6CO9TrRjPqqPEc4zvv62
	S4q+g80QObJ56rrgHb7MVuUExTSKOZzuOjQ0AZ+V86w7kcOUsJ5JEyoMOOwlDliJ8MxR
	uX3qvOkPWLIdv9B8BCYcSWl+0XzGO33ZyTWdt7pbsQxTr/Pt513sw9R+0jLhGzws4Hus
	MMDaXT9d/SfoZwtiFh5sy0pl/R/tZuWPGldTI1z/sZBVDoNausZd0h9vATayHPUyuwUJ
	F93g==
X-Gm-Message-State: AIVw110ty35DM0V6S6WwgF7aFrWE5I47pKipRP543G5TXr4gsw8rmebS
	ium0QuTi+Jsds0Nt
X-Received: by 10.25.115.85 with SMTP id o82mr1238919lfc.96.1499947224224;
	Thu, 13 Jul 2017 05:00:24 -0700 (PDT)
Received: from [10.0.0.85] (31-172-191-173.noc.fibertech.net.pl.
	[31.172.191.173]) by smtp.googlemail.com with ESMTPSA id
	w9sm1244659lff.45.2017.07.13.05.00.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 05:00:23 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-3-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tn@semihalf.com>
Message-ID: <04b06baa-75d8-291b-ef6e-89bbb89b3fd1@semihalf.com>
Date: Thu, 13 Jul 2017 14:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1499633493-19865-3-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
X-Mailman-Approved-At: Thu, 13 Jul 2017 12:19:38 -0400
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
X-TUID: SmNU9NXhjeE+

Hi Eric,

On 09.07.2017 22:51, Eric Auger wrote:
> From: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> Introduces the SMMUv3 derived model. This is based on
> System MMUv3 specification (v17).
> 
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v4 -> v5:
> - change smmuv3_translate proto (IOMMUAccessFlags flag)
> - has_stagex replaced by is_ste_stagex
> - smmu_cfg_populate removed
> - added smmuv3_decode_config and reworked error management
> - remwork the naming of IOMMU mrs
> - fix SMMU_CMDQ_CONS offset
> 

[...]

> +
> +/*****************************
> + *  Register Access Primitives
> + *****************************/
> +
> +static inline void smmu_write64_reg(SMMUV3State *s, uint32_t addr, uint64_t val)
> +{
> +    addr >>= 2;
> +    s->regs[addr] = val & 0xFFFFFFFFULL;
> +    s->regs[addr + 1] = val & ~0xFFFFFFFFULL;
> +}
> +
> +static inline void smmu_write_reg(SMMUV3State *s, uint32_t addr, uint64_t val)
> +{
> +    s->regs[addr >> 2] = val;
> +}
> +
> +static inline uint32_t smmu_read_reg(SMMUV3State *s, uint32_t addr)
> +{
> +    return s->regs[addr >> 2];
> +}
> +
> +static inline uint64_t smmu_read64_reg(SMMUV3State *s, uint32_t addr)
> +{
> +    addr >>= 2;
> +    return s->regs[addr] | (s->regs[addr + 1] << 32);

To be consistent with smmu_write64_reg() we should not shift here second 
half of register, instead simply:

return s->regs[addr] | s->regs[addr + 1];

Thanks,
Tomasz
