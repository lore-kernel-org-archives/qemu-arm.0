Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB365CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 13:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDk71-00068J-Sq; Tue, 28 Oct 2025 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDk70-000685-Ml
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDk6v-0006mn-Ck
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 09:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761659494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Kev6t20m35Sur5GwaaA9VI9x+6gqS/Fhq9CtLp8eYU=;
 b=Mo2pYgwEqTxxxIYYqK/0LZs7sqbEmt30vbrIa9jpjAt0nTG4f821Y0ylz8CKhTGWwMFlf0
 fOPbys7GJYani08WhyUfVcwdiqa0EEpdjV5NI9qcrhlv4oYE2CWBzSo64XEwCyjFZ55F5d
 Zlj2hqRVXTGiRapb1daYTDCS0Cm2roM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-pBiK8nVnMdCiJJy1P2XyNw-1; Tue, 28 Oct 2025 09:51:33 -0400
X-MC-Unique: pBiK8nVnMdCiJJy1P2XyNw-1
X-Mimecast-MFC-AGG-ID: pBiK8nVnMdCiJJy1P2XyNw_1761659492
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-427a125c925so3000153f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761659492; x=1762264292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Kev6t20m35Sur5GwaaA9VI9x+6gqS/Fhq9CtLp8eYU=;
 b=g08zhjG2QYSNG+mPNsTB+eogXv1uSTrKPbJ5NTtfl7KDMFGaOiT7lbONC3AsV95+MH
 OidLHZs0Kp1kS9uikOVINr4ikgAo2mRa4NN14TOUUBnmqWi56vb5b48Vqcl7IqDagwUF
 tMDbQauDihUMJF8WRkR1AbDlZemrJq3dCSJIBzGRnWSfijo9hY6rwkdsOHy3MZjI0svu
 I/LiALYVzpDxvPTasNPFij9cLWyD0iujQXRH/1t2n/IMFWXNLGYcfHycZNsHWBmrQNkX
 BDKv5rG9JMErvCbpEeQVpUpNKUp84DTvp7wgsGtMZXm0ZnaKhiRiHptjdRwUxsKH412N
 mepQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRI3nsUtl76pMg8dag76+HEp70Xs45CcWo7OQfiayT64xmcRg91mOmBhX6bNkkimtY7SV31iH/8g==@nongnu.org
X-Gm-Message-State: AOJu0YxYvW/tsqET5aXallG/vQkBrUic9vvz6BHRyG/6w0+fct/jf6/C
 40TBkdve61OLTI3z0Fh+SMg/LEmqcoSjPKpq7cgyOqB9wdOPEprXwvxmqwlLvEHp+WCI6KDj6xF
 VGpvYFj1iDBnogIEEXpDlCQBFyv0rVE8R0LYdIj3A5nPwtuU4ovcSBw==
X-Gm-Gg: ASbGncsyzSXLWaPqn+p1Fav9TgJDnqFKs2OPb5uFvoqC7zrhZYxn82km2QaqG9nOyxx
 jCcPHeZ8kzRCGARUEyZYR1PW8COSJO7662BZGPEN9pJRcRKjTjVh17psg6tAaI3uUeSkItROhdu
 pSFFrwyskbT0PF7ZWKLE8BRUplPXssJUliA2yEq3NOlXn8gkiDwwy3qexqigbCZuthoJfFUFOcd
 ehfyod9ZDeyjxVYB3FprWWuYan1GWhK15fJFYqGiLsyUblLWVxrqEu4CapN1TuxAsoUREPfNQ8y
 wHBbjO3cy7FvG8KGOdQSFF3HfxeS1mH4eGQFPS/m5CHa5IuVrqVjvAY0apKZX/V+i5WIkccVq3W
 og+dNE7S/P1CyRA9OTlD1eqUTuCmWFdh5TGMhEcIafHLJPg==
X-Received: by 2002:a5d:5c89:0:b0:429:58f:325 with SMTP id
 ffacd0b85a97d-429a7e568d7mr3718086f8f.24.1761659491837; 
 Tue, 28 Oct 2025 06:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiUgsWEsXtK5uBXXWtxAHALEmtshMTzTInPuOK9gujW5bicw5QIYlgeHRdEfW2+L5q3+RSEw==
X-Received: by 2002:a5d:5c89:0:b0:429:58f:325 with SMTP id
 ffacd0b85a97d-429a7e568d7mr3718051f8f.24.1761659491403; 
 Tue, 28 Oct 2025 06:51:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7ce1sm20189382f8f.0.2025.10.28.06.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 06:51:30 -0700 (PDT)
Message-ID: <15e0d683-e524-44ed-b253-c6221585d9bd@redhat.com>
Date: Tue, 28 Oct 2025 14:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-23-skolothumtho@nvidia.com>
 <26f4d9b2-75be-4913-bb60-01e647a7ec83@redhat.com>
 <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
 <25d22f06-69e2-4954-9bd9-f73f899fc114@redhat.com>
 <aP+xhmLCRu6y0eQm@Asurada-Nvidia> <20251028121625.GF1018328@nvidia.com>
 <9748e922-057b-4e7c-ad6b-b83f5591290a@redhat.com>
 <20251028134148.GH1018328@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251028134148.GH1018328@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MONTLWHVlJmqtl2Ppdln7tScYdh54W97A83c1aus_Uc_1761659492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/28/25 2:41 PM, Jason Gunthorpe wrote:
> On Tue, Oct 28, 2025 at 02:21:32PM +0100, Eric Auger wrote:
>>
>> On 10/28/25 1:16 PM, Jason Gunthorpe wrote:
>>> On Mon, Oct 27, 2025 at 10:53:10AM -0700, Nicolin Chen wrote:
>>>
>>>> Hmm, that sounds a legit reason, though adding the ATS support to
>>>> the emulated SMMUv3 isn't seemingly a small effort...
>>> What is "emulated ATS" anyhow?
>> I guess it means implementing ATS translation requests and capability to
>> send ATS invalidations. something like:
>>
>> https://lore.kernel.org/all/20250628180226.133285-1-clement.mathieu--drif@eviden.com/
> Why would you even want this? The cover letter didn't explain what the
> point was.

well I am just concerned about exposing ATS support to emulated EPs
while we actually do not support it.
>
> qemu emulating two levels of IOTLB caching in software, with a
> software page table walk?? Why??
About the actual use case for ATS emulation you'd rather ask the
contributor, early SW development, IP development?

Eric
>
> Jason
>


