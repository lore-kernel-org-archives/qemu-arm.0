Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1189489ejc;
        Tue, 26 Sep 2023 08:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeAddWNohNasF4OGzZ8R2khVt3O06HZWtvKXSQS1PBZK2VxL7QdkW/zll3BXccd7Tm2VTq
X-Received: by 2002:ac8:5fce:0:b0:417:8f5b:f896 with SMTP id k14-20020ac85fce000000b004178f5bf896mr11491252qta.55.1695742772600;
        Tue, 26 Sep 2023 08:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695742772; cv=none;
        d=google.com; s=arc-20160816;
        b=Va7ZT7RPAlnD/Sq+fr+kvO5bV3kYiuocyEXfuLlN+TTA18tARxPdN5ZUx4OGzZUrAO
         Qd33djm2tcU7EPJCVISUpx4WWnOQenzxlvioBWwJA0R7/fS/S9/cuyk7AV4wsDjE5tIp
         Z1Cg+DUto7ODBMmZ29pFZm/VLOZOp3XTkVvOE9Ksuu3EY9ItQiCgonpJxQ/b3oKcPXlj
         2d67pd37SKuDojQqhhhryWhUImhLKIm8Du3KKW2foI+pEpGBCwDb68zkJE3e7fktIQhc
         doP1rKltNROakHYFDsdzczzubtuAr1l+4gPlk8lGMULwI3vMUm8jgxPM0HFtL5wYEc+K
         lIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ajuvXVOphlmV/SSckwSiXuo4QwYthV5liTFlBAbmoiY=;
        fh=0EG6RQyxC2EtFbpWOKakEtxYjFPaJnFsRkAqgEoOp2M=;
        b=HrdFeHqM8byf647wlml1lGwLAXv5r4YT8QEZTmd9H2KlLbaAD0vfu289UGj4G4jerL
         v0qXgFrtm7a0G7SGoIHB3XCROYxT4QyacX2wFAZOWjIkJTb8U2AxGr+XPIpMBTHpPez7
         Pank7ody3zPhzy1EymznSi2pWGeEbVXLeZ1mSzZsMbVTy56Oer63Tf1HdapHuEwJNKQA
         aCeJGU/9AC6erFO4+Hrd0XHBlj1HomeyMit+GilSjOjKIzLHlPKy19UELIKj1wpoI8xk
         aAxJKDGv4rlhu+LjIsyI+BTHE0Pl/uYk57aI/xqws72RNsuQrWeslqfDUR9xhdq/Yqya
         7quQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQimsNcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020ac85813000000b0041819819519si2633298qtg.694.2023.09.26.08.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MQimsNcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlA9i-0003Vy-Ob; Tue, 26 Sep 2023 11:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlA9h-0003VX-Ke
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlA9g-0002wn-5q
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695742759;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajuvXVOphlmV/SSckwSiXuo4QwYthV5liTFlBAbmoiY=;
 b=MQimsNcMvY6SK6DtCSFXWgl5AkOI3Oz/lRs9i1TUks8uES1b4m4P1kTbkfY0yiVfvm0mRl
 6+NJodSYnLELbPzcTDnjZiJVR9x9Opnt5z4oSflwstgnUSRafsBwCgTnhf+/SiqQYFYBVd
 N01gWFc4xd6D4V9kBaJAYA0SzbGqFs8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-qGdGUhXwPB2SZ5fkJSpDoQ-1; Tue, 26 Sep 2023 11:39:16 -0400
X-MC-Unique: qGdGUhXwPB2SZ5fkJSpDoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-405535740d2so62694455e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695742755; x=1696347555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ajuvXVOphlmV/SSckwSiXuo4QwYthV5liTFlBAbmoiY=;
 b=SJDuZ7FSziCDQ8trlWuFDF73TlsfJE5A6HYHPrDsE87stukfXhVxDD1H8u9iRzsUJq
 mraqwGQvH6fuKt/KHgplvfLRgxfZgs7H5UNKDfEvb1MiAy3FAVF6RGqXlH8C/vaHV4We
 htzeXdn6yp+KfRcUXTbwYx64T6BLNjCM7xE0WaXgDV+xI9cjnDDrhTVIwycRUZcH8gOC
 kC09KEBvwUBcpL6MU6H0fX8LERXSv5wzaVg/kGkmL9ZmW97JL7sWvaVmmmWxnoARE7w6
 yIbxugbvTUBFeDYk2/aGnChVewiNnC+m3SMwZc9sJBz+farCgiP5leecAEH5bjgkmgvR
 g69A==
X-Gm-Message-State: AOJu0YxijkVZMt0x9Mz4cIMD55PM36NJCAPN9Z/XnDRuWSk9X05l/IpC
 vgUwU22qJRzbdC4gItskmi6pm/ertjsNdBlSBTdNSin7obaOpZjyjM/2YMaOgXaZA63g/kwmUi4
 /lEnSC+Xuf4RB
X-Received: by 2002:a05:600c:280b:b0:3fb:e2af:49f6 with SMTP id
 m11-20020a05600c280b00b003fbe2af49f6mr8584158wmb.39.1695742755117; 
 Tue, 26 Sep 2023 08:39:15 -0700 (PDT)
X-Received: by 2002:a05:600c:280b:b0:3fb:e2af:49f6 with SMTP id
 m11-20020a05600c280b00b003fbe2af49f6mr8584145wmb.39.1695742754811; 
 Tue, 26 Sep 2023 08:39:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003fe601a7d46sm18368605wmr.45.2023.09.26.08.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:39:13 -0700 (PDT)
Message-ID: <f254b6e5-f02a-5781-570a-2c9688667b36@redhat.com>
Date: Tue, 26 Sep 2023 17:39:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Mostafa Saleh <smostafa@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
 <20230914145705.1648377-4-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230914145705.1648377-4-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qS2cfgQXrGai

Hi Peter,

On 9/14/23 16:57, Peter Maydell wrote:
> The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
> supported, so we should theoretically have implemented it as part of
> the recent S2P work.  Fortunately, for us the implementation is a
> no-op.
>
> This feature is about interpretation of the stage 2 page table
> descriptor XN bits, which control execute permissions.
>
> For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
> IOMMUAccessFlags) only indicate read and write; we do not distinguish
> data reads from instruction reads outside the CPU proper.  In the
> SMMU architecture's terms, our interconnect between the client device
> and the SMMU doesn't have the ability to convey the INST attribute,
> and we therefore use the default value of "data" for this attribute.
>
> We also do not support the bits in the Stream Table Entry that can
> override the on-the-bus transaction attribute permissions (we do not
> set SMMU_IDR1.ATTR_PERMS_OVR=1).
you may precise it is called INSTCFG
>
> These two things together mean that for our implementation, it never
> has to deal with transactions with the INST attribute, and so it can
> correctly ignore the XN bits entirely.  So we already implement
> FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
> that we need to.
>
> Advertise the presence of the feature in SMMU_IDR3.XNX.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 94d388fc950..d9e639f7c41 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -279,6 +279,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>  
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
With Mostafa's suggestion
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

