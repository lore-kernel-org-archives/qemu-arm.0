Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1313372lfr;
        Tue, 6 Apr 2021 03:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP+4LhAnP9wVPFM1UGxOZop5/4Q0gNFc8+xPI5Ed4ZtFNAuXlfxz9/H3Jn0thmxGHsbmv6
X-Received: by 2002:a6b:8ec2:: with SMTP id q185mr23121322iod.150.1617703858005;
        Tue, 06 Apr 2021 03:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617703858; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPjx7UklIb4TtgQvI3kYMpAHrfirAORn6MOCbmmzNyXgicj3BbqloeXsFF2KEwcRK6
         L/0c9Sxq303loB639pCTnITCAgw/p+pReMgxx4/+vZ+uJApyMV4YnFrseXfe0pkTykhk
         RzjKH69Plx0MgjfUrvARRKI3+7cDWhLwYdZiRUEMVqy5SQL5ZFZSeov+UzuzxgJ+q0F0
         nRQ5tUrRdMkJ2r7QIpAig52xjDoJJL4Tc9tkHIGt2N+98yCAa38CINv1zyamB9pr3Ps+
         PIevs5WJTr3VZ0QfPtc+qBqBCCKzohkrarnX+3hRm6FuCuiK87xYQA1OPB0HQlRGO9As
         ezAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=usulfOE0AzadG2EB/NS+SRJi/oO/areE8EYPHgELqrY=;
        b=YKp7Xb13/nRJvMoyn6AAaH88M4WzZuhaCyXUChF3d24tAn/RiOcYzQgGrzscJmISGT
         HB8Dik4YnaMX13x1sCgSmjs0Rnq2yQhSifOl/RgdXG7M66BQbS84GBQ024S+vRTXDWsz
         Zgx70dt/d+pYTQz6C7MMOH2kuWkUirdQCe6yNZtY+ir4Ps6aIaT1UGTYIOrnUqGjDiNg
         AhhrDD1COm5gz8FvM/bUBonSAWQBpKMRpRvs33Fh19RZI05RY45miwqLvVf/o7bYOa5u
         bbKTM+BlTwyFw8/q8nCUJ02AhOSi8w6upm2KwvuO4EXtlo2iWP6mkz/X/fyrMRgVE5HY
         NZHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDF5TpFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si16890236ilj.33.2021.04.06.03.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 03:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aDF5TpFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTifh-0000iw-Ae
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 06:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTifX-0000h3-GM
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 06:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lTifO-0004Cb-5u
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 06:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617703835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usulfOE0AzadG2EB/NS+SRJi/oO/areE8EYPHgELqrY=;
 b=aDF5TpFQ0Wy0Chae+HCRPgEdGTg6hyd5I6VPJcRT8mYogzLZUUI3Qqi4Bkl2KW658ml2YQ
 K1Dq0Lk1D67LsEo3Q98XQOODtGJXX5/3NXgyMsqWORiOoVR5BKIfi0erW1vZJYzAhVEQ+5
 G6Xyvqj+PGbXfzHW+fezKA9mDc3btyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-5PsT0Gt0ORCwHr--Z3m7Iw-1; Tue, 06 Apr 2021 06:10:33 -0400
X-MC-Unique: 5PsT0Gt0ORCwHr--Z3m7Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CF0802B40;
 Tue,  6 Apr 2021 10:10:31 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D219E19C45;
 Tue,  6 Apr 2021 10:10:29 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@broadcom.com,
 shannon.zhaosl@gmail.com
References: <20210402084731.93-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
Date: Tue, 6 Apr 2021 12:10:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210402084731.93-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPIM7eivDkXp

Hi Zenghui,

On 4/2/21 10:47 AM, Zenghui Yu wrote:
> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> our emulated vSMMU.
> 
> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/virt-acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..60fe2e65a7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
>          smmu->event_gsiv = cpu_to_le32(irq);
>          smmu->pri_gsiv = cpu_to_le32(irq + 1);
> -        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
> -        smmu->sync_gsiv = cpu_to_le32(irq + 3);
> +        smmu->sync_gsiv = cpu_to_le32(irq + 2);
> +        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
>  
>          /* Identity RID mapping covering the whole input RID range */
>          idmap = &smmu->id_mapping_array[0];
> 

