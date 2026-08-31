Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676DFC61DE2
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 08:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0xJf-0007sS-9X; Mon, 31 Aug 2026 04:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xJP-0007nF-GT
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0xJO-0008DG-1l
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 04:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788164653;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8HguE2tO0ppIM7b/8zF7gN80KiHnxhpnh7ekrmt7A0=;
 b=XDVU6gMmgSnubb6ldduHHC9qyrCr8hFSZtF+9iN5zr62x+n7qRwetPqqrzc/lTD2PCIkey
 7td1aTUb7wKDZuBOrLslCDWDJWcB39Pb6WJbAmKxJu9icPkGow0JrYElOYPSCTYYOjgd1R
 2cIBWUXBLz9uhIKrHn+dkgabGDvtFDo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-j3Fxgh9JNoymR2x81g_dpw-1; Mon, 31 Aug 2026 04:24:11 -0400
X-MC-Unique: j3Fxgh9JNoymR2x81g_dpw-1
X-Mimecast-MFC-AGG-ID: j3Fxgh9JNoymR2x81g_dpw_1788164651
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-482bf4da3d5so1588995f8f.1
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 01:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788164650; x=1788769450;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n8HguE2tO0ppIM7b/8zF7gN80KiHnxhpnh7ekrmt7A0=;
 b=WytxJzMCtnPuc5/ZYhowhR4gKUvJYCFU0hfu3y9EUijBDgACLAUNJCwiEXqdaYiPRu
 CXGTx4fj13DmP9ci58yqtxDm5w///X/Dz0x450fWbT27EVntOlMH7yGGHNbSOQqq5tBn
 L08MlaRQPJoCrxbnFtIlS8PZRdlQReSQrKm/cRnMuuDIdsspOCGikql4ujBHccctGjQz
 d3TTZDTqCNnZrYgv2UoOTGvbGrk850ipksMaLPjadjF0u9oSqFKq17XaMKcreAPQQqFg
 3GsMaLMHB/3obs+p5gabZu4V9/4EcOYolB1CJe8xY+PgHE3kX9mIxCfeaRKYxBHUyzVw
 CQ0w==
X-Forwarded-Encrypted: i=1;
 AKwUvByzW4P7o4qE+pxZ2qwu0r8BmYpcYXH1WsCMpa0nVpDyaGhwSbYV9NEUE6raGEvORAo5klQfHD4rRg==@nongnu.org
X-Gm-Message-State: AFuF++nLnBWzDLHmsXPtblfwS0a/u1Dqg11bE6eAOqnx3dQStdpk/pid
 YZRLnzZQGEC0GksK0AIzrtOsfMED67OMieeuitT8xVRJQ/nw7kWEkQxtj+4MSTfBqOUa0spvLBq
 OAR4CqMo33stek/60K+IpNWfYhPiPwWqf1TsmHrFF7AV3HJOw5imWmQ==
X-Gm-Gg: AYBFou3wD/h7I7E7PDIDDOo/ttUbc4v7DuHJMCNbu2XP25Dn85onqPjrq3xPDkSVheN
 5EqNrAMivmmLA7Q1JzYAegK0SgWhZqjJpEznKHlISMbc6DreuJuLq6mrDyD+SjKOXkkHsAqCCOE
 PR8mPLPcSgYWul0/FJUnE2+REjun6hh3ECfs/M2QZj3dojdPY8QJcg7lMpFsiO5bb4tfkfep4Rk
 oO0hZPHpgL1MGwoR5cPYGBuRvsllun71YAnG5Ky6eHdi8xqmtrSaXfFd+RvJn8V0VwzpVnGyA49
 Ce0W5zg5vD4f2dV/3s7OZA/3WdMM3ZrKhd6kPC5krFivHYUIwTdpuf8tkrsd8ndfxCvTweQ0+fQ
 2ScI8DS+XNqqXuEoZxfu8ecoMmrWFCne5UY0+EN5o6cxRCSj+
X-Received: by 2002:a05:6000:607:b0:484:3313:77a1 with SMTP id
 ffacd0b85a97d-4843ea0b47fmr3255779f8f.28.1788164650641; 
 Mon, 31 Aug 2026 01:24:10 -0700 (PDT)
X-Received: by 2002:a05:6000:607:b0:484:3313:77a1 with SMTP id
 ffacd0b85a97d-4843ea0b47fmr3255698f8f.28.1788164650207; 
 Mon, 31 Aug 2026 01:24:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb33070sm21829774f8f.36.2026.08.31.01.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:24:09 -0700 (PDT)
Message-ID: <c6469ddd-f9f6-4e4f-aad5-29c61d0a93ce@redhat.com>
Date: Mon, 31 Aug 2026 10:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 25/28] hw/arm/smmuv3: Reject IOMMU notifiers for non-NS
 devices
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-4-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162624.2809349-4-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -hEa5SHWFiT8B4Yx1-ABGOsGZTziZk329eZRiiUAchQ_1788164651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 8/13/26 6:26 PM, Tao Tang wrote:
> VFIO and vhost IOMMU notifiers currently support only the Non-secure
> system-memory path. Reject notifier registration for non-NS devices
> instead of allowing an unsupported configuration.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index a755f1ebd69..2375b7a17a0 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2932,6 +2932,13 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      SMMUv3State *s3 = sdev->smmu;
>      SMMUState *s = &(s3->smmu_state);
>  
> +    if (new != IOMMU_NOTIFIER_NONE && sdev->sec_sid != SMMU_SEC_SID_NS) {
> +        error_setg(errp,
> +                   "SMMUv3 does not support IOMMU notifiers for "
> +                   "secure devices");
> +        return -EINVAL;
> +    }
> +
>      if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
>          error_setg(errp, "SMMUv3 does not support dev-iotlb yet");
>          return -EINVAL;


