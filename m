Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF72BCA5FD4
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 16:41:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCJq5-0007UA-FS; Thu, 01 Oct 2026 12:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCJq3-0007TP-GS
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCJq1-0002JL-JW
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790872852;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+d5BA/o4/DJWgRC7JbYOChISWKn7wqrzMH+zuVl9EY=;
 b=YSrz1PJ9HbQdjcHvWaunv4y670hFIghn+oSg/4uqZbp3IyeJdIg2O/6BR3wbYGko4zf+Bb
 BbwuPV2DJAMY69a5cmLSqeSAeUt90+xc/6YrMsDVYzCKQ3J9ecItdZtHpWg0E/kwpnPN0V
 29DuJZnFwXBUz4wqQoMWk8vXbr+BQvY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-8QQ91zrgOS6G0wqGeM_jsQ-1; Thu, 01 Oct 2026 12:40:51 -0400
X-MC-Unique: 8QQ91zrgOS6G0wqGeM_jsQ-1
X-Mimecast-MFC-AGG-ID: 8QQ91zrgOS6G0wqGeM_jsQ_1790872850
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-47f6e8b5996so6163896f8f.2
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 09:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790872850; x=1791477650;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h+d5BA/o4/DJWgRC7JbYOChISWKn7wqrzMH+zuVl9EY=;
 b=dn+bPww0nLCuuPSX4EEzn/X+3YngNHPUwZeQ6g3/8HCnhlCPhr5Np7qNxz09PXkzIc
 MhgKk4o74CxPAaevICZsKWw35kzxtbuUEuoJeRpnEZoWOw+bGSCVDGb6NpHatTuuwjaq
 XOI3xu9F5yfRClIuHuI+4p8YwC5lTzxhnCuJOFIVX+wGkvcLGU5S8DBBZp57qcqyQ7R4
 20VRLpFS7uv2XYD42LUr9Nmk05tx+Gy2fF321dlyu7SLmCf53X50ygB4Bmpx7Dt8l1G6
 l85yOT+mwM4X2KDy7N9izeJzxzFwfBfGdrqT4XON7n7OG5G929xHZ3KZDMAzy5pq4De6
 Y0kw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDNf57C63DP9WXaf5qj07S0iJJPiTWf0QzAts6Ju7T3FLNBaSwGPDZ9UM9PIBh8DcVvV+Qbqq2bQ==@nongnu.org
X-Gm-Message-State: AFq9FYLwnQR3goY05jeNStROrqxo0zyQgKXGf3DuHBcOULmVS9VqvUKq
 Rpcg8sW8KIL6k4OSuFI/LWvlCsWrwFhiD1J0IYNoOaibcdTD36jhHAUY4D6hMmalbuvj4VfmTjJ
 nNrG+9z4PGWOQcOfgrqZAzyR2yxVP83rZXxBHUCOfrAmtLVn5980CaQ==
X-Gm-Gg: AYBFou0zn+uKKhIfMVwFsEF0ycr7+NZuftwqJRRfp+04P+nvTX8a0eZew4j3ti6m3x/
 oZ9T93uJJg8mxUQ32AH/BXGqdVgj5ajIwSQnsh1JKT0pvxHdLGYbs8QMq0uZv8BI8OyaXo0yEVN
 Ofbwl34TuEH2iPQrS/fhNACXs9wpGVUnUvkZktb0TwxeC+rUWMypHOwk9wxSXsiOVWGvUvvdgoh
 ZH6iuxdbyMlQvTVnIbV8tVoWzmphf/QiNk9z7hxm/9Yu6tPx3xbokRxX3wmUe2cLXTP93wZpvXp
 P14tFaVruaLs7TBykxeHcF053CKpuNIyrakRIdu1HZV0jLfbeBMFfQ/9tFDS6A1qmGNLVsqxTJ0
 zSLfkEXnYkUjoH+O5MnmJGds9VE710s0Tlk05BZ6FCubmBolN
X-Received: by 2002:a5d:5d08:0:b0:48b:b6:6a92 with SMTP id
 ffacd0b85a97d-48b12743d91mr316943f8f.26.1790872850263; 
 Thu, 01 Oct 2026 09:40:50 -0700 (PDT)
X-Received: by 2002:a5d:5d08:0:b0:48b:b6:6a92 with SMTP id
 ffacd0b85a97d-48b12743d91mr316886f8f.26.1790872849674; 
 Thu, 01 Oct 2026 09:40:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0db6de18sm3754213f8f.44.2026.10.01.09.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 09:40:49 -0700 (PDT)
Message-ID: <cfca1664-2d41-4f02-b7cc-6e0e421426cc@redhat.com>
Date: Thu, 1 Oct 2026 18:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] hw/arm/smmuv3: Live migration for accel=on
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _45NX2ESiTMlWGABPdrPrUHOOj3hjG2f7KbgjvdPPGw_1790872850
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

Hi Shameer,

On 9/4/26 8:05 PM, Shameer Kolothum wrote:
> Hi,
>
> This series adds live migration support for an accelerated SMMUv3
> (-device arm-smmuv3,accel=on) with vfio-pci endpoints on the iommufd
> backend.
>
> The destination replays rather than receives. The stream table, the STEs,
> the CDs and the Stage 1 page tables all live in guest RAM, so once that
> and the registers are restored, the destination walks the stream table
> again and rebuilds the vDEVICE and the nested HWPT for every device.
>
> What the series does:
>
>  - drains the kernel vEVENTQ into the guest event queue when the VM stops,
>    so that pending fault events are not lost (1, 2)
>  - migrates the resolved SMMUv3 feature set in a new smmuv3/accel
>    subsection and fails the load if the two ends differ (3)
>  - replays the guest stream table on the destination and restores the
>    vEVENTQ and the GBPA HWPT (4, 5)
>  - asks VFIO for dirty tracking on the Stage 2 nesting parent (6)
>  - replaces the accel migration blocker with one scoped to CMDQV, which
>    cannot be migrated for now (7)
>
> This depends on the host kernel supporting dirty tracking on the Stage 2
> nesting parent, for assigned devices that cannot track dirty pages
> themselves. A branch based on Jason's iommu page table work is here [0].
>
> Big caveat:
>
> This is not yet tested with a real device that supports migration as I
> do not have a test setup for that. Folks who do have such a setup have
> reached out and are copied here, so hopefully this RFC lets them give
> it a spin and provide some early feedback.

Please could you clarify all the requirements for supporting this
migration scenario (at EP, SMMU and kernel level)?

Thanks in advance

Eric
>
> QEMU branch is here:
>
> https://github.com/shamiali2008/qemu-master/tree/smmuv3-accel-live-migrn-rfcv1
>
> Please let me know your feedback.
>
> Thanks,
> Shameer
> [0]: https://github.com/shamiali2008/linux/commits/iommu_pt_arm64_s2_dbm/ 
>
> Shameer Kolothum (7):
>   hw/arm/smmuv3-accel: Factor out the single vEVENT read
>   hw/arm/smmuv3-accel: Drain the vEVENTQ when the VM stops
>   hw/arm/smmuv3: Migrate the accelerator feature set
>   hw/arm/smmuv3-accel: Add a helper to replay all STEs
>   hw/arm/smmuv3-accel: Restore accelerator state on incoming migration
>   hw/arm/smmuv3-accel: Request dirty tracking on the nesting parent
>   hw/arm/smmuv3: Support migration with accel=on
>
>  hw/arm/smmuv3-accel.h       |   2 +
>  include/hw/arm/smmuv3.h     |   7 +-
>  hw/arm/smmuv3-accel-stubs.c |  17 ++++
>  hw/arm/smmuv3-accel.c       | 192 ++++++++++++++++++++++++++++++++++--
>  hw/arm/smmuv3.c             |   6 +-
>  5 files changed, 210 insertions(+), 14 deletions(-)
>


