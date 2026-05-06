Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC9ECD3436
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 12:28:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKbMP-0005Wk-6O; Wed, 06 May 2026 08:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wKbMM-0005W7-6U
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wKbMB-0001oC-MJ
 for qemu-arm@nongnu.org; Wed, 06 May 2026 08:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778070479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kWbdYPK9ijBNeZPnqCRf5jGhK4jLag5YL0PqMZr3XHs=;
 b=Zuvjinj4h16TLTV4VvFa5HtHlYemjLinUfazpqgAlzC5Begz+wD0ZTl5UBrujzZAmwz0lI
 8E6Q2XkNTdHkLieaOJcYagNANkqSLRF78/gRZFYj44fKftrLJAP37ktLwVwyJqyUvru8dT
 WCOLvs95e6PU07FooN1wG0BBPRzZmuY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-CmoouiBAMlOz1Bcpsb689g-1; Wed, 06 May 2026 08:27:58 -0400
X-MC-Unique: CmoouiBAMlOz1Bcpsb689g-1
X-Mimecast-MFC-AGG-ID: CmoouiBAMlOz1Bcpsb689g_1778070477
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488f973ddfeso47375585e9.3
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 05:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778070477; x=1778675277;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWbdYPK9ijBNeZPnqCRf5jGhK4jLag5YL0PqMZr3XHs=;
 b=A3inE6XDAjQ81bmtTnDNILoQkXnUiB4/NgLbmbuARtcsCqK6p9NEky/4gNkjodrTAi
 phHUcxP90SZ3qWx1qO8LWeDBRgP91bz64g/gTE1Zw3PVxwhsdcsu8YjTYUmvd0/EIAYG
 nt2hkj9oXF5+tyXb/VCbfQo6TlJFxaKxAyF/cf2MVOGTyp6YzofJJRUxYsYGqo9/Tt3a
 J7MgpTJosRbg+EM7zQyWQW99Z8ejzvLFB6h5wIlwYZOTaAsK+eqQikloZEI6UK1iCQwQ
 tbJptzGeqnT4SV2D60Hh/bTojObo1e27hQ6YSKITYH3bR90UjJyCNKyMgw6b7nsyANPw
 W2kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VsHW9kTZHlduGGezVETh+VQqYOMUrrzlMw2RPYVZm8c1IoKNqim9aeOGp75XV9zPm5mYOIE76kw==@nongnu.org
X-Gm-Message-State: AOJu0YwfeQ1tztSBJ9ZwLHhVcdPjl79bz+lkCGbZehfGjOOK2cXrU/YC
 UOI46cbssrtIaJ2GJpZ6USPo5soIg3MjyqNhP5bSxCQmuYD6opAiDaimZ9FozfN6HfP1rkTBgeT
 +69XS6+L75X+hM+Y1caY1lxuP0KVc6A8zZhHa/l76HKbqiPJ+Sc7ggQ==
X-Gm-Gg: AeBDievNL2t3cZUSijg2/18BzjLFLGviP+9WhkrW+s9xydq7ouC5x6E/Z9hOyDwsSmg
 WdwnaguvbWj3LUkP0heu4WCZc9KcX0yH7m2/SqSdYfTdHhO6zMHfjFoY3J7vaK8g7SvyI/GjCrI
 QWGD5QXy3NPdl4O4Pcef5sWRawWbgtjCCLgCc4p/N7iU5ur4OVa+hMJyr5cKKZlvPNNpBHxfMhY
 Mk4lGc+QPgyW0q4rdd5ps++7hMCEKotg8lcrmEC1ASEsGw7+dCYqJRm27K/cJeB/4JeptkYB1lh
 +dNbZE7hCbGhDqzewSB3XMKODPKsdE+h4ry+M0z+ckSpjza+GAXTvD20xrv8/+5xcSyoKXwz2+x
 0v8EZmgrIL2BsTGMxT+gxM9OndgW1y/zmIApr8TYkw4sqnHjYsApZwJcm/qs6D0MbDCzc81E=
X-Received: by 2002:a05:600c:3b17:b0:489:e696:836f with SMTP id
 5b1f17b1804b1-48e51e15718mr51702745e9.10.1778070476888; 
 Wed, 06 May 2026 05:27:56 -0700 (PDT)
X-Received: by 2002:a05:600c:3b17:b0:489:e696:836f with SMTP id
 5b1f17b1804b1-48e51e15718mr51702135e9.10.1778070476470; 
 Wed, 06 May 2026 05:27:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a48c04sm12668833f8f.15.2026.05.06.05.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 05:27:56 -0700 (PDT)
Message-ID: <7d05a03d-9f29-4b7c-90ce-b61d23e5d07e@redhat.com>
Date: Wed, 6 May 2026 14:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] aspeed/hace: security fixes
To: Kane Chen <kane_chen@aspeedtech.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20260504213421.710035-1-clg@redhat.com>
 <SI6PR06MB7631B46DF67C1532B154FFE1F73F2@SI6PR06MB7631.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI6PR06MB7631B46DF67C1532B154FFE1F73F2@SI6PR06MB7631.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CQFlEGyOGvBSc0EzqSY9Hyk4kpAUx3TKKmSGqLWksuo_1778070477
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 5/6/26 11:53, Kane Chen wrote:
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: Tuesday, May 5, 2026 5:34 AM
>> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: Peter Maydell <peter.maydell@linaro.org>; Steven Lee
>> <steven_lee@aspeedtech.com>; Troy Lee <leetroy@gmail.com>; Jamin Lin
>> <jamin_lin@aspeedtech.com>; Kane Chen <kane_chen@aspeedtech.com>; Cé
>> dric Le Goater <clg@redhat.com>
>> Subject: [PATCH 0/2] aspeed/hace: security fixes
>>
>> Hello,
>>
>> A couple of issues in the Aspeed HACE model were reported on the
>> qemu-security list. Here are fixes.
>>
>> Thanks,
>>
>> C.
>>
>> Cédric Le Goater (2):
>>    aspeed/hace: Fix out-of-bounds read in has_padding()
>>    aspeed/hace: Prevent total_req_len overflow
>>
>>   hw/misc/aspeed_hace.c | 29 +++++++++++++++++++++++++++--
>>   1 file changed, 27 insertions(+), 2 deletions(-)
>>
>> --
>> 2.54.0
> 
> Hi Cédric,
> 
> Thank you for fixing the defects. These changes look good. However,
> I have one question regarding another potential issue.
> 
> In the do_hash_operation function, after calling hash_prepare_sg_iov
> and hash_prepare_direct_iov, the function may return early if iov_idx
> is -1. In this case, the code flow will not reach hash_execute_acc_mode
> or hash_execute_non_acc_mode, which means the mapped address may not be
> unmapped properly.
> 
> I think we may also need to unmap the address when this error condition
> occurs. Do you think this should be included in this patch series, or
> would a separate patch be preferred?
> 
> If a separate patch is preferred, 

yes. Do you have time for it ?

> then for this patch series:
> Reviewed-by: Kane Chen kane_chen@aspeedtech.com

Thanks,

C.


