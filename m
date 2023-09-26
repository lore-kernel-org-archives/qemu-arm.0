Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1160034ejc;
        Tue, 26 Sep 2023 08:01:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE627t0EPfg/1S3dBatDoDkfDNzCFpWjC/28X7KfWKXk+dmhLLlI0PuenO1hwqGOKGKkTtP
X-Received: by 2002:a0c:e749:0:b0:65a:f253:24d with SMTP id g9-20020a0ce749000000b0065af253024dmr3037763qvn.20.1695740489261;
        Tue, 26 Sep 2023 08:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695740489; cv=none;
        d=google.com; s=arc-20160816;
        b=CBZiNmGyag7aF4lurJYDNk7WZUpHvadUJGgI/bMuj3bICNYI0l+Asnft/O9hWCeJgA
         FZ0gymcBXBZKzUUftqQYsMsBSoO0lNi2W/Gqd/oivi+Fe6g/bZgm8OOWpvZpH+GtV4Xn
         2z85hWGGqis7lMSchLbxWtMy/LTSwwntc48WUrUfifTsXenKq8o3SjeX50jFheBQTu7G
         fxqkjVvZk+z+FKeN53f9pD2/xN21XEDwUhBn5ZVNJPkqPGy784hGIwbZTqNL2j/uBDyX
         O2bttuB0YDaMXrXxbXOikIQ/kv7KLgCnDbmRwu8N5HikP8fpZsypl+uiaMduzZU+iVWY
         CbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fsBkGdWY2QjaADeU2lhQ95H9ogtMQY68ZoZKabzKHz8=;
        fh=uM169AtInUOucBzgcl/S6Q8QNPD6R9MmBsZljHHnV50=;
        b=rpo7ZUp4x9dAIjwiqQn34gPRSPfABzx3J1fOvFU7zoPjlHyW5yfG/dNwf4hGrL9cTc
         eDmaDc4r+lLb6slut15AuSu6b/QakgGqKXTYW+41ETlzS2rAvl47IybFov1juGo8GKcU
         G8r1UL0G4trGsIrji37ObWzzVa/ECe9UCCyovrA/ybr1T7s82wKou8+JDG8KDiZH2sex
         xuQMGPSus9YKxdV2MTQaxhHQYwYm3DofmOUIDxRrAa/XqAv58NHQvgewUEDc0QpYutzT
         SjIroH9P2z+ISfGW7rPUavKSm981jj3hob3vN0ikAMHVJzU7RXaYxybPSpRvNr7C+aVC
         s7wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fCx1JvhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a0cac04000000b0063c6d558d11si7102981qvb.45.2023.09.26.08.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fCx1JvhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql9Yl-0001v2-Es; Tue, 26 Sep 2023 11:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9Yh-0001uH-Ae
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ql9Yd-0001g8-NJ
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695740460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsBkGdWY2QjaADeU2lhQ95H9ogtMQY68ZoZKabzKHz8=;
 b=fCx1JvhC7gLupnyovQ5EmKA6yjTYhDGtzBs5Nc1D7oboHRvzltbVILtpXHHmMyP46im8Xs
 g0QKUj+fla2+6AiKhacsi4OHwMr55OE3YCSFxkskMKBuUrY+PmlPJHWmZkmC05j2Urg+q8
 js3+xMoLia1Rpk6nVjfd8ZEIoyMRhdI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-HeLRPWe9OCqzd8KuJVPTkg-1; Tue, 26 Sep 2023 11:00:57 -0400
X-MC-Unique: HeLRPWe9OCqzd8KuJVPTkg-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6564dbde089so111032536d6.1
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695740456; x=1696345256;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fsBkGdWY2QjaADeU2lhQ95H9ogtMQY68ZoZKabzKHz8=;
 b=uE817jhmeZT3zbV1eB8VlauUXmHgY3a+AZMO+xn/PWytzXxNQil/SPpsY+hmKewXQW
 Xl8gsRSq+CuvHvSDCH4UDczeBZGkLwJvq/q0dHuIyK898FWu9n0DJrrTVxl7PpHioolh
 CwsY9RHF8SnJV2gYlYmvXwgJhpEt9HTkUADPB4a9Qk6Ofq0glKxUEDUDBawCaAjiJHfq
 GGqMAPs9SHd1cY13L5trfiOWiddtrv8/SmVqP1wEr+mQVoQwUBEuj5DoB2JcUiQHIFfO
 FjZH+Qbez7T4PMnZqfnQhON4HS73nEmN3dMSr9qgo2PCethbDK//Umbv/YO9Ut86lLBI
 19OA==
X-Gm-Message-State: AOJu0Yzsce98GKJfnWj4TJr+uCRd+NzcBKwOfVevx/FP4eVx1l+Wxtzk
 o28zOdwaFxDgMn8jb4MMwtys7IfYfMnMc0MpRk6C+apENKo7QZ6WEOWo1JbKEfBmMohEtiWem9B
 5PqNyjlAxmyO5
X-Received: by 2002:a05:6214:519d:b0:65a:f7b2:2057 with SMTP id
 kl29-20020a056214519d00b0065af7b22057mr2641724qvb.24.1695740456210; 
 Tue, 26 Sep 2023 08:00:56 -0700 (PDT)
X-Received: by 2002:a05:6214:519d:b0:65a:f7b2:2057 with SMTP id
 kl29-20020a056214519d00b0065af7b22057mr2641700qvb.24.1695740455958; 
 Tue, 26 Sep 2023 08:00:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a0cca11000000b0065b21f1b687sm935603qvk.80.2023.09.26.08.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:00:55 -0700 (PDT)
Message-ID: <8dc93aed-d107-3514-01cb-19bba64ce7fe@redhat.com>
Date: Tue, 26 Sep 2023 17:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] hw/arm/smmuv3.c: Avoid shadowing variable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
 <20230922152944.3583438-4-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230922152944.3583438-4-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DgufTd+/8RWC

Hi Peter,

On 9/22/23 17:29, Peter Maydell wrote:
> Avoid shadowing a variable in smmuv3_notify_iova():
>
> ../../hw/arm/smmuv3.c: In function ‘smmuv3_notify_iova’:
> ../../hw/arm/smmuv3.c:1043:23: warning: declaration of ‘event’ shadows a previous local [-Wshadow=local]
>  1043 |         SMMUEventInfo event = {.inval_ste_allowed = true};
>       |                       ^~~~~
> ../../hw/arm/smmuv3.c:1038:19: note: shadowed declaration is here
>  1038 |     IOMMUTLBEvent event;
>       |                   ^~~~~
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 1e9be8e89af..6f2b2bd45f9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1040,8 +1040,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>      SMMUv3State *s = sdev->smmu;
>  
>      if (!tg) {
> -        SMMUEventInfo event = {.inval_ste_allowed = true};
> -        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &event);
> +        SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> +        SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
>          SMMUTransTableInfo *tt;
>  
>          if (!cfg) {
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric

