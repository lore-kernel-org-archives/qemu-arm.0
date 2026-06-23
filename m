Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1A8CD4F26
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Jun 2026 08:32:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbwYb-0001fm-7P; Tue, 23 Jun 2026 04:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wbwYQ-0001f0-BC
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wbwYN-0001Zy-BJ
 for qemu-arm@nongnu.org; Tue, 23 Jun 2026 04:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782203534;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXcYChGDCgCZU0HD3bk3aBjI+qRlzASUENGEs3N9t1o=;
 b=jTSs8IzmtLGP/51Drvvnzm97BPeyso2wKiCDCZplWOzQ17f7IUvG4hDmMjhmOVA0+PomXk
 6K47zGPIw13J78q95Yv5+n5nVGgfFmAITnbFactAvCLxqNiUHWipuFE4fQvWz5vknZSfoD
 IoiNAi6fx3Joze7HXYssKmKX9iXXFKw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-eqw_57eiN9mCbDtrCX39Zg-1; Tue, 23 Jun 2026 04:32:12 -0400
X-MC-Unique: eqw_57eiN9mCbDtrCX39Zg-1
X-Mimecast-MFC-AGG-ID: eqw_57eiN9mCbDtrCX39Zg_1782203531
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-46ab0ea1f72so446016f8f.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2026 01:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782203531; x=1782808331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXcYChGDCgCZU0HD3bk3aBjI+qRlzASUENGEs3N9t1o=;
 b=LnZCCcSSgp/140tC+wrt0OWlM4ACvJb6fb+DtH17+0NWY0LdJPQDIYVX7yRVfMOZKs
 +F+OR54txQ/MNe9vVNdfyx7B2UHEcK+JPXKAbqqCZ9moTv+UB71FzIbse0NnXosQRq3t
 tCMjRRcoPkOkYm0JT4Eu+lNM/+4znNowodJn0GvhfZg51xWxw3SGqtah6zQ/6yMr8tH4
 A184K9kIJJuY6h3C9UUOesz4/R5rvRKaAm4wLlmb71/k14I3CFC7qPKwd1DEBBSc5mMc
 BPNW/7bIKNg/fY5veqlfP6/DpegdSq32GCw6dhVo1F/bLnUnIZ8xJ7viMfCNfSNaeAOV
 fFmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpM82VvhsfEwePWqBbCrADCMF2owjAtnwQLmj2OxZY6VOCbsaUjSxsmjpO+gu4Tl8FZU+5D7CRaBA==@nongnu.org
X-Gm-Message-State: AOJu0YwwpRF1Fnu+/8yKCluG0xSXOa8u/PEHfHh+UWmfSLpip3hdTzTE
 ZDPOJxGtepm+DOT0B1kymmhaDTsv2fkuFDNFZ9DNpKirRTqe68P+PelGK97eAoIlGpmTG2mIqKI
 3pte9108SWnqcUJsamOF0FksU04AMUOCQp+RMLhFHO4tKN5yDtgy31g==
X-Gm-Gg: AfdE7cng8ZDZEIdtkwInOVCTRyLsz2+ptLrg4njGoVJ7BXSUx2Okt2J9EyUJqFGwtJt
 Y88+H7VMN5yFJf4H9BK8A2yv5N3DZOuImOEJpdt9ZkIHH9ZoVonjv2rIN/VaT3O47SjVX7uFUsZ
 +sRUALIdOxcqjx3hrXxQPwk8gf1eOxZBnmGM4Woi/S9OstKHrXusy08PtEon19cnkLLcGVQ0zs7
 aZ221KpjLkY8CPB/nx7Z39JfIckx/Z8gQbK3sMpEiHs6KGncxvcELtrffHMBVLr+2G2d8ue2jsp
 V6Rufn+5aaBKZQs/i3KDOmGeIpO0MWv5XzwhbBZlBbPbT6se65TsjAxuScBW8zJR1ugJ2f3x9H3
 AHfCRaLUKeySDUNuCR4qWPq14ee1u7P0Dzg4uRZYV1EtFVGAa9OoLpRtTabE=
X-Received: by 2002:a05:6000:101:b0:460:2eee:4e2b with SMTP id
 ffacd0b85a97d-46508afacb8mr26703343f8f.28.1782203530922; 
 Tue, 23 Jun 2026 01:32:10 -0700 (PDT)
X-Received: by 2002:a05:6000:101:b0:460:2eee:4e2b with SMTP id
 ffacd0b85a97d-46508afacb8mr26703294f8f.28.1782203530496; 
 Tue, 23 Jun 2026 01:32:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c4fd2sm33098696f8f.14.2026.06.23.01.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 01:32:09 -0700 (PDT)
Message-ID: <1105dfee-f1bc-4ba0-b8b7-0382c95463c2@redhat.com>
Date: Tue, 23 Jun 2026 10:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmuv3-accel: Fix veventq read returning true on
 EAGAIN/EINTR
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com
References: <20260623075101.17770-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260623075101.17770-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IxRmAgUIKvTdHu0K48QhlF6eI0Iq9g8HYJGaXmxGm4k_1782203531
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer,

On 6/23/26 9:51 AM, Shameer Kolothum wrote:
> smmuv3_accel_event_read_validate() returns true for EAGAIN/EINTR, but
> no data has been read into the buffer. Callers treat true as success and
> proceed to use the uninitialized buffer. Return false instead and guard
> warn_report_err_once() against NULL Error in both callers.
>
> Resolves: Coverity CID 1660057
> Fixes: d4aea0f75b ("hw/arm/smmuv3-accel: Introduce common helper for veventq read")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c   | 6 ++++--
>  hw/arm/tegra241-cmdqv.c | 4 +++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 80900c2521..6d402d2ba6 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -451,7 +451,7 @@ bool smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
>      bytes = read(veventq->veventq_fd, buf, size);
>      if (bytes <= 0) {
>          if (errno == EAGAIN || errno == EINTR) {
> -            return true;
> +            return false;
>          }
>          error_setg(errp, "vEVENTQ(type %u id %u): read failed (%m)", type, id);
>          return false;
> @@ -491,7 +491,9 @@ static void smmuv3_accel_event_read(void *opaque)
>      if (!smmuv3_accel_event_read_validate(veventq,
>                                            IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &buf,
>                                            sizeof(buf), &local_err)) {
> -        warn_report_err_once(local_err);
> +        if (local_err) {
> +            warn_report_err_once(local_err);
> +        }
>          return;
>      }
>      smmuv3_propagate_event(s, (Evt *)&buf.vevent);
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 29c488e0e4..bb0b417e90 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -845,7 +845,9 @@ static void tegra241_cmdqv_event_read(void *opaque)
>      if (!smmuv3_accel_event_read_validate(veventq,
>                                            IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
>                                            &buf, sizeof(buf), &local_err)) {
> -        warn_report_err_once(local_err);
> +        if (local_err) {
This is not aligned with the general policy. If a function taking an
error handle fails (and returns false), it should set errp.
Don't you have a way to initialize buf in smmuv3_accel_event_read() and
only call smmuv3_propagate_event() if the hdr of vevnt is checked valid?

Thanks

Eric
> +            warn_report_err_once(local_err);
> +        }
>          return;
>      }
>  


