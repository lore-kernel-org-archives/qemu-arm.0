Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp247201lfr;
        Wed, 7 Apr 2021 01:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMYbVdEY/vhffDlKkbwN6qOZMhenGkMcCdOojge/6jiWItC3KSGz81GLbgkm3JWz2KnC9M
X-Received: by 2002:a5e:c809:: with SMTP id y9mr1774299iol.192.1617784930196;
        Wed, 07 Apr 2021 01:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617784930; cv=none;
        d=google.com; s=arc-20160816;
        b=n75Mda7s5b3Sj0NcFcbkMYR4RYwK77CIgMbbzqoUlVpFwl8fbUtPRG/pCkYQDaaZ+1
         u7cuW7Cw1rybORrnFBwlLKUJRh8wO7Uuzfuz7/gf3Y8YgF/MnZM3/ERRWDlLNuIYQSeI
         rC7uXxBXqqlPzVrbQrzqbFI3lMzrOs4WD0pTnF+URvYCYvGYD2QuCUiRGNzPhDi86UOk
         15wQWfnIB9vvpA207+g1jFFe0mJmOn9tm/vH2h5p2t4yDvEIV3TShlfmZJer4nayWQZP
         4w9z7L1ZivlNRvv4lkBhqE9dnHSs971rpYAm5PqtwgSnpCwYzwpf09LvbQjy+MN54Fhr
         W7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nzWnGq7XvO6kpG7/59gqfVyw9nQ2yjQBFE92/N/JH2A=;
        b=g8Es0ggQ0woG6MivoNOpTSpermA5AzJ40aoqnPBZbefJykM8LVAqzbDrQumvupkgOl
         Dd3pZm9EWn7gCVdJO8Xm0JLm0y1NRQCcOXpMhD5SqgkQh6JevcrEFTYLVVa/NLwaz+/t
         GlODmGMvgkmx/WyzZJkNfm0WuZitopZeYICH3QDy77Qz+MIwkJiwC0XkcS9gHGoUGLUt
         nrEQOICSpZ5zNyysSZxVqHM8lglovcxEehZF6spSYTlS+qAnjYrfNFdjY2m0Uo9OaqQ3
         7WjngXAgRrunTW5oYUs8+RLvFy2viZu7vcsIlY9hVAb6doN//2sVAjASxIUQqMi97P4I
         ZWxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ER3ECIzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si19350921iln.22.2021.04.07.01.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 01:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ER3ECIzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lU3lJ-0007xm-0m
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 04:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lU3l0-0007vn-Sp
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 04:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lU3kz-0002xn-2b
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 04:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617784908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzWnGq7XvO6kpG7/59gqfVyw9nQ2yjQBFE92/N/JH2A=;
 b=ER3ECIzP9rlpEyMYvIC5I34sI7ZbM/+omRrr+CqwOWQaP1eVSV3TMd5WmaJWm7cnZkRHq1
 oF9rFyAfHtWJmF2Qm4QyhU4xewyuZRshT9VIeBnz6zSVq8qfwoWOKY4dbyiehhBlokKTB9
 +iF3Awn6KBjb97rdNDGSKnTzBDA0YIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Pq8MTy9ROPGXXjhodp95bQ-1; Wed, 07 Apr 2021 04:41:46 -0400
X-MC-Unique: Pq8MTy9ROPGXXjhodp95bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 431301008060;
 Wed,  7 Apr 2021 08:41:45 +0000 (UTC)
Received: from [10.36.113.184] (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D368D6C356;
 Wed,  7 Apr 2021 08:41:39 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Support 16K translation granule
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 shameerali.kolothum.thodi@huawei.com
References: <20210331064713.1782-1-jiangkunkun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <480ded69-5141-9eed-9326-365260d05fe0@redhat.com>
Date: Wed, 7 Apr 2021 10:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331064713.1782-1-jiangkunkun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AjopnQDtJ75O

Hi Kunkun,

On 3/31/21 8:47 AM, Kunkun Jiang wrote:
> The driver can query some bits in SMMUv3 IDR5 to learn which
> translation granules are supported. Arm recommends that SMMUv3
> implementations support at least 4K and 64K granules. But in
> the vSMMUv3, there seems to be no reason not to support 16K
> translation granule. In addition, if 16K is not supported,
> vSVA will failed to be enabled in the future for 16K guest
> kernel. So it'd better to support it.
> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>

Looks good to me.
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 3b87324ce2..0a483b0bab 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -259,8 +259,9 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
>  
> -   /* 4K and 64K granule support */
> +    /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>  
> @@ -503,7 +504,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>          tg = CD_TG(cd, i);
>          tt->granule_sz = tg2granule(tg, i);
> -        if ((tt->granule_sz != 12 && tt->granule_sz != 16) || CD_ENDI(cd)) {
> +        if ((tt->granule_sz != 12 && tt->granule_sz != 14 &&
> +             tt->granule_sz != 16) || CD_ENDI(cd)) {
>              goto bad_cd;
>          }
>  
> 

