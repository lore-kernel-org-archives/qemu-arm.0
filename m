Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2743736lfo;
        Sun, 31 Jan 2021 08:13:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT54hwjnc4dYNkjvofkfm9pC+MHNic2j3fegYIiBSqRgHXiIR4wtDEDhzFrPJNn1GG93cM
X-Received: by 2002:a25:1984:: with SMTP id 126mr18234137ybz.341.1612109622472;
        Sun, 31 Jan 2021 08:13:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612109622; cv=none;
        d=google.com; s=arc-20160816;
        b=iYDCvmUND2njVd4Tlfy7PXwMjeCE72Rh00kZlvGnbGkDlkvrCG3Z9a20ezKwvB3we3
         tjaXixLbG6N+ZcZIGVZv3W+vcwV80kRraDDZuVx+DOFmBG+reaiG14MfeaDYkt3Nu0IF
         rl+VjIWFexZk+vlVJoliei6J6yam2TGkB5/btq1EGucNcMU0EwRZvIl7SS9UrUhbCHPL
         eac1SqTqlBBG17xE0hJSeUhPI7KMIujM9EHv+MIsgGnRbq1FjYKq0gvy0yaQiOraMgjb
         MAfhEfie+/DSwQg2ArowWatI2yac66ZA2SqY3H5SFyKHbqFPsFM6ZcosbHRWfdGB+glZ
         eEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/j+Zjll2kbbDasMODKwZPcNmLazi6q4NpcAEHcCfmtQ=;
        b=tFWIxpo3uVnivi5Aucy4p/Cvm+x2F6phxG1Fu8fpyD6xSDQQRpVoI2TZ7X3pVwAiTt
         dZh4nfzwjgPgENi5X7zQH1I8+ixqmuZNTGb/pZNWFAAoKnhyArnORKDgvZtMKFTQKePf
         h6TjDANBrh9wGHmcXlflafB3yt69r0mJ0Vns4tEV+d01MZFgVjowwz6+crQoWQ4YPjZV
         pf7LOxjeqeQCETcAvmy5j1sHzjBa2onZKExm+/AJUtMNzz23Qb9HOS1tKMK7GNRMTjiu
         6lfg+jQcm7j5sYztUpcjq+iVhQUiggs8YcqNK60G6pHSOtAosm3ZFvsSZ2jAnB8EFBAH
         yTFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xud0Pp5y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v201si15063219ybv.79.2021.01.31.08.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 08:13:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xud0Pp5y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6FM5-0007Wa-TS
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 11:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l6FKw-00072N-H9
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 11:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l6FKt-0007mV-P3
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 11:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612109545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j+Zjll2kbbDasMODKwZPcNmLazi6q4NpcAEHcCfmtQ=;
 b=Xud0Pp5yHNV6/8Bf5+fTA1wwcpRqZVrRn6/yOOlz1pi2riCHljyCqwOLNRyMHWoIF84Qkh
 wf63AmfFf1QW/sPjRQRjfsEDEWmWK+trZIu4sCUMcs3bmOBTGcnbQKAtfTFHHYCdlMhQ8A
 RvcDH1gRy5MmBXBGU7LBFisRN0d2RlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-s84SLo8AODO0VSeRKqRARA-1; Sun, 31 Jan 2021 11:12:23 -0500
X-MC-Unique: s84SLo8AODO0VSeRKqRARA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63851005504;
 Sun, 31 Jan 2021 16:12:21 +0000 (UTC)
Received: from [10.36.114.62] (ovpn-114-62.ams2.redhat.com [10.36.114.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 771342BFEC;
 Sun, 31 Jan 2021 16:12:19 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/smmuv3: Fix addr_mask for range-based
 invalidation
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20210130043220.1345-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <da41fca5-c491-2279-1cbe-9d38add1ed0c@redhat.com>
Date: Sun, 31 Jan 2021 17:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210130043220.1345-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1JYHLJQclMG

Hi Zenghui,

On 1/30/21 5:32 AM, Zenghui Yu wrote:
> When handling guest range-based IOTLB invalidation, we should decode the TG
> field into the corresponding translation granule size so that we can pass
> the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
> properly emulate the architecture.
> 
> Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
> * From v1:
>   - Fix the compilation error
> 
>  hw/arm/smmuv3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index bbca0e9f20..98b99d4fe8 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      IOMMUTLBEvent event;
> -    uint8_t granule = tg;
> +    uint8_t granule;
>  
>      if (!tg) {
>          SMMUEventInfo event = {.inval_ste_allowed = true};
> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>              return;
>          }
>          granule = tt->granule_sz;
> +    } else {
> +        granule = tg * 2 + 10;
>      }
>  
>      event.type = IOMMU_NOTIFIER_UNMAP;
> 
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

