Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3310068ejb;
        Mon, 19 Dec 2022 00:40:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Div3YerT62A2ZFddRRNUsPerzw9qkyp68lfm3VV7oKr4LAbaUBjVMF+MbtiBEv8ZMboPP
X-Received: by 2002:ad4:4e30:0:b0:4c7:16:f909 with SMTP id dm16-20020ad44e30000000b004c70016f909mr49889859qvb.23.1671439233592;
        Mon, 19 Dec 2022 00:40:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671439233; cv=none;
        d=google.com; s=arc-20160816;
        b=UlChPzIr/Zy9pI5fviMwFQEJMcPDxN7ccA2tGt1qg/krugmhJWoM+CIlKxYDY9CRPi
         Dlx3Jn6lwwrWqDg1pEksJGBZx4qgAhyvomyA7JKqnOfHfuoql5vAA5ddsqUbjJqZBjdd
         Yx1Mzub4FB7+uJM05sLR8r3LU6LIrp4PKCXy4R6ZMoIHo337HCZ89pfQe3ywDQPhOpsk
         LD0N4D6Kh8pezuw6lgTLTIBuyNvMBPh0XUW0BZazrpcjvNYjnb5clzRu3Pn6a2+Khf+o
         t1gb4Qn/TRUkTatESDYu1QnUI3hAba3VFLFH3UaQylwmomeaNdy8PtZsXFr74kc+Pe/W
         +trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ytofBJVkfpW+gFtfBo3vLT5zyrk3b4zzTiuL/3hZ+kQ=;
        b=da6ZOIL/+l8/6kzoYaZ7f60IZae59SzOn5jcC4ATPVxQfAfpNqAwQpu29pyZtej9OP
         BkQzOnQAmsw+DkhZ/2i4l/4pfjFieGXcZbht3b4dhmQs0KHK1yi1V3hWjX0uBvFiddmz
         db/hk066Q4y7vSpYveRIdM7WqPno0ubj3j0Z0/O+OL72RhRvxI0QoElLAYEHjS7KCTTc
         NVqiNNCPt83l7N5UkOfYG8Xw1Q3aC38TXH/Ggqoi6FcFCch418Lx2Wy6ilr+AIOYKIqw
         V9bUPgYQelwfYT5MXBZcOljdBWypgb0rbLK+bHCpn3T+Dj92pQlnrBF+HLaNvwMe6W2S
         lpJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Um+01/D8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a0562140c8500b004c6e1c249d9si3770340qvr.376.2022.12.19.00.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 00:40:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Um+01/D8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7BgM-0003JE-0v; Mon, 19 Dec 2022 03:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgK-0003IR-SW
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 03:39:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgJ-0006Tq-Dq
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 03:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytofBJVkfpW+gFtfBo3vLT5zyrk3b4zzTiuL/3hZ+kQ=;
 b=Um+01/D88d8MZU76WVPYNM3ATEV3HYXCrOwp2ZakaqZcMMFyqT025t9o0F+gQG9kJYKxEi
 CSBgyWrrkuTZQs7uw+wprbVpM66uDZ0hywTvY8EAJvnHSmRyEzO8gA5KjsoMJbmZEDtSds
 fPTh9NXB0xCgx0bcf3rTPMdEqmMgcS0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-VvML4viPNrWVoUvPM8U8uA-1; Mon, 19 Dec 2022 03:39:29 -0500
X-MC-Unique: VvML4viPNrWVoUvPM8U8uA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so1276572wra.2
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 00:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytofBJVkfpW+gFtfBo3vLT5zyrk3b4zzTiuL/3hZ+kQ=;
 b=31k8VOC8T8ko2wxqt/5BOKeizLDQwPD1ae2bNr7kcdDKPYjjGyGMp/gjv81vGlSgRb
 V2VvBs3uNJL5aZmMq90VmLG/YIMQIiwkf2jRgvfbZY8ozkwHhtY8N09+J/ULzzMgFayj
 bajb+U4m+MOG5NfpEKe8kg64BfJFC6xl36RsVa8klyrs4rxVZ/qHfQn9NK1cORBtB2am
 E2QFgyKSt/l5cEmNy10M3l/1CPnXqq8f6QH1/mP+lAdySMV45u/OihtN+BKNFTwJ9hsn
 ta9JkGmgdhXgnmly7QQO3TXXT1KisgW0y2wyUmd+qd+4VY8hlbUf9/kEF6CmpMuBqxrP
 SXZg==
X-Gm-Message-State: ANoB5pntBJgFzD/2PH4JcVWuKp8cHLlCsxWtVS9xC/dGyiyC/o7u+Ygg
 tgQ7JGj/267WATgyQzQGbQVDTmjwl7Af67fufxlcYLpm70fpbXXkNzSXSsDRIsi6xZwBATZrtxO
 TSnUPT3gmba8n
X-Received: by 2002:adf:e4c3:0:b0:242:3ca5:5e6d with SMTP id
 v3-20020adfe4c3000000b002423ca55e6dmr29648105wrm.56.1671439168570; 
 Mon, 19 Dec 2022 00:39:28 -0800 (PST)
X-Received: by 2002:adf:e4c3:0:b0:242:3ca5:5e6d with SMTP id
 v3-20020adfe4c3000000b002423ca55e6dmr29648089wrm.56.1671439168248; 
 Mon, 19 Dec 2022 00:39:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm9405911wrb.41.2022.12.19.00.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:39:27 -0800 (PST)
Message-ID: <88700341-7a3b-db42-d5d7-bf088192e9b0@redhat.com>
Date: Mon, 19 Dec 2022 09:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr()
 scope
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-2-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221216214924.4711-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KCh3gx/2hMbl

Hi

On 12/16/22 22:49, Philippe Mathieu-Daudé wrote:
> This function is not used anywhere outside this file,
> so we can make the function "static void".
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c         | 2 +-
>  include/hw/arm/smmu-common.h | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 220838525d..9f196625a2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
>  }
>  
>  /* Unmap all notifiers attached to @mr */
> -inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
> +static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
>  {
>      IOMMUNotifier *n;
>  
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 21e62342e9..c5683af07d 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -173,7 +173,4 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  
> -/* Unmap the range of all the notifiers registered to @mr */
> -void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
> -
>  #endif /* HW_ARM_SMMU_COMMON_H */

