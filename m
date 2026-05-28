Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BF1CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 08:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSWDT-0003VA-24; Thu, 28 May 2026 04:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWDS-0003Ur-2r
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSWDQ-0003gH-6n
 for qemu-arm@nongnu.org; Thu, 28 May 2026 04:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779957342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7p32ZveSOYd79eJSK7Qr4Uf8PGaqfR2i4ZQxMCYgJM=;
 b=R9HTbjYu4cIFyW4dh7rGVPkkupql55jj/M988/T1QLzU4+bYO3D/ERzpO/r3KshucFFVTB
 TZEj6UFUzim9jbmYfKBqJmqhaXtZzOIjYVr5Nv4A+ggLZaSeemk2CDdfoMXAkD5R+CdPrp
 LAVi+N10rHNgobdDpsfYfq6yPQ/6lZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-UHtv7BSKMcuQ33GYhl00sw-1; Thu, 28 May 2026 04:35:41 -0400
X-MC-Unique: UHtv7BSKMcuQ33GYhl00sw-1
X-Mimecast-MFC-AGG-ID: UHtv7BSKMcuQ33GYhl00sw_1779957340
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4904ee02e72so46304615e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 01:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779957340; x=1780562140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7p32ZveSOYd79eJSK7Qr4Uf8PGaqfR2i4ZQxMCYgJM=;
 b=CzBdxLxqtkLe/NeYDRH0EGDmF4Uwai+/+fCJ736ip/yt/+LQUYWpk2wytx53TZFxV8
 2Ok3hA20vpk41iFoXC8/2k7XelqyZTGZigGAnO4gFiJ1l4sz/q7ZOaJqcqfVJ4dn1qGs
 wy5VgyzdHvHzbQQnSRhFbk+kwN5uslo4ZdzmZhgykv9+nsFbfvdhIntUtScRDrQ7yzqP
 5/8f6fQg2bsm/ScsEM4l1rey0joB+ml5l3eVx00B+qTu1dF1ciQJjDNy69umCsQXQ/SU
 4baqmXVBOjHLz70t7DY7r52VF9IWYkvH9uoA/+DAS1FAcqU1gdwUbAt6APNjXE9IGADk
 6MYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9SnTJ67sEQeViQImRBsEAfXGQR6ugds1pVaaY6OMUUDbFi2ElL0jckqY1t+uDs69pnDKnfeD9VJA==@nongnu.org
X-Gm-Message-State: AOJu0YyxtUhG5wxlTYElvzjEbxYLTv8U4s6wJMkjUaV+CAejc6nZRTvS
 3EWN3hPZDR07yIgXpNqailcGF8xHVA7KIn1vESbG55bxZWhe64KArq9e5LijaGLfJJECAm2EGrY
 gsLzevWbKlpZKPl7EQEKiXwMTdINswIgWc1w4qHQZulZjERwZi8rEmw==
X-Gm-Gg: Acq92OHGko9CplkdUDyURIW89AXMsRE+59b3kWrYFA4eqKZ2+cIbDXSHfb3AXDkSFB8
 bFCMXl/LXmurRF5RsSvzZD0FHT0yGGxsRyaonik1j/8Cv73fl1SkBNZkCzvqsQOlM8tXc0cBjSd
 pGv9+xGEPaY0ZbhS/bu7PP7kibRY+rM7mbbgmrnT+bSYmkXrpVAKTpwEc/w+wztKgnp8iJcVQuT
 1D8od7wC+P7kM015WDbzQ+azir6VHDc6RW16NgYHZyg1ig26wYYrXzskdSC1H2bzmI7DPisbKar
 5yAq8NuDlQtHnPWGgNguH9rFaZGO3t4pzwD68WQYgN/hs/BCls8rmZDup3Ci+kNWDQx038ux6Br
 PosJMsJhxxMgPHGrAvAPEVHwObh/hSR+68lJacpZqs1Pf+01xXihzlqv1cmI2Cebi/KpQMYdVAy
 ErkOJt
X-Received: by 2002:a05:600d:8499:20b0:48a:5970:1fe1 with SMTP id
 5b1f17b1804b1-4904248ad4cmr334141365e9.4.1779957339767; 
 Thu, 28 May 2026 01:35:39 -0700 (PDT)
X-Received: by 2002:a05:600d:8499:20b0:48a:5970:1fe1 with SMTP id
 5b1f17b1804b1-4904248ad4cmr334140895e9.4.1779957339327; 
 Thu, 28 May 2026 01:35:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092a902bfsm43631575e9.12.2026.05.28.01.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 01:35:38 -0700 (PDT)
Message-ID: <f4d57564-12e3-4f04-aa1c-4b828049dd15@redhat.com>
Date: Thu, 28 May 2026 10:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] hw/arm/smmuv3: Update ATC invalidation check
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-stable@nongnu.org
References: <20260527221631.612026-1-nathanc@nvidia.com>
 <20260527221631.612026-2-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260527221631.612026-2-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AWntJ2DzFKJWGxikpnoJxDTNAEKsxN__QRrCrD17h8U_1779957340
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 5/28/26 12:16 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Use smmuv3_ats_enabled() to determine whether ATS is enabled for the
> guest when handling an ATC invalidation command, as setting the ATS
> property value to 'auto' will resolve to ATS being detected as
> enabled in the ATC invalidation check otherwise.
>
> Fixes: f7f5013a55a3 ("hw/arm/smmuv3-accel: Add support for ATS")
> Suggested-by: Shameer Kolothum <skolothumtho@nvidia.com>
nit: Reported-by whould have been more suited
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 5c2855c377..0c65dc8c91 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1528,7 +1528,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>          {
>              SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
>  
> -            if (!sdev || !s->ats) {
> +            if (!sdev || !smmuv3_ats_enabled(s)) {
>                  trace_smmuv3_unhandled_cmd(type);
>                  break;
>              }
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


