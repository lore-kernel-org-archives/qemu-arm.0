Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99777CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 07:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWrDi-0000WJ-P2; Tue, 09 Jun 2026 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWrDh-0000Vc-0g
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 03:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWrDf-0000Fm-8D
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 03:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780991392;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30lp4WUtqRDeoZ4j3sEJ16dmtXImE0oV8R9IIwLZRho=;
 b=NkDptpGdYm4tXXtC0wPJJEzJTi2JsAiJLnV4eEi+OL5eqDrIP48DPKdFR89UOoZRtmARsv
 RlwqVpS5V5+BAlAnMYeg4WmqFPraZnl2D2yf0b/u0dm+qoAuauz2MqFdQdsJWRpqd8SK5X
 I0TfUZabw6JhftPXZME040mehrAgg2c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-qGr2sKg0PbK8lDPbC_ZIDQ-1; Tue, 09 Jun 2026 03:49:47 -0400
X-MC-Unique: qGr2sKg0PbK8lDPbC_ZIDQ-1
X-Mimecast-MFC-AGG-ID: qGr2sKg0PbK8lDPbC_ZIDQ_1780991386
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490cc1ae292so19428115e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 00:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780991386; x=1781596186;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30lp4WUtqRDeoZ4j3sEJ16dmtXImE0oV8R9IIwLZRho=;
 b=KWZGZrtNaqkmDZRFtmXUXUqVLb1bPkiCIZpYzMw84v9HMYVe3QvYjjhqAhHSuoaRWK
 Mzm5Z1AXkkDpBip+3wbpJ1CqwoW0XbP6PbjnxP2dAUmrIu34Z8d6sbtw0WAWrdQmzf9o
 CRHGmf4llg/76ltdzWmp9y1CnXg22RAu7Og3bMzA532k/L3vKT2iJENSfcb5Op40bpBO
 fnS3Ex33YgZP7FrdWVTHHb1whVfpbYlHQBeHKirozLe5McD9FM1dAnMM1TWJW78Xe9jK
 atpWW7nysk3r6Sk4ZQ7Sahfwtc5Pzr0mhLustlDKaszXnG3nrG8s5215a1VjKioJv+0+
 3tyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bM28jsXWwtCy2qtimPnHGzbMSNgdQcbbnwJv4nvXelbP2eSpWS7vtxgRP6mz1khyjcOwwkMcxuA==@nongnu.org
X-Gm-Message-State: AOJu0YyPc0XU6RSUImM6tW89xNnV/dhhvjMGvKD8L743qU9TC6cq2vIm
 x6zEk32xavYXeTqqmVL0eU2/u5JRK3awy4QP7VMywKW7j0sKaEn+BN3izz8UaQ22YMuO1FNlcHc
 P+d466soMLxC742gJb9SqXXV46DFDqQmozXWwKgpHSeursXumB7COwQ==
X-Gm-Gg: Acq92OHH8MGgSkr91g9gB+j5zufNxmK8aEUG71RzLQfb1nXO1qRpzTfLFD3Tj/GpmFm
 82hYDiUXnK476U2dc8pYYJjoQZ/3Rjkav7z3qLOvle9S036t7hIxsp+D99RpcR/9oubIy/UxBvp
 cvlaBDCL6HrpcODBp7m8CxfuF/AQ7dZrvR8REginLVhFKWV6TytCS+Zq5ky3LIDJmHQX/PIXMXU
 VZiL8unVD7AAAVlgJLZEh/wJDGcMBCY01t0aHH//XbZPd7QV9VPcnwf6HD0iLswHh93KQrl8y1b
 8ZE7uwNGEy9AOpU7ipu5J8GQw+mwZBrx7j0vQvPGICH1AEQV1b0RAdEgs6nvy5hGnmeKbxad3kI
 yv+0J/W1bFRn54ql1Ugm7iiZM2jxzkcRbMba+3osz4n8nmBhFhpAj9r5J/whOrPsLbMbNO48wSO
 msjTQv
X-Received: by 2002:a7b:c845:0:b0:490:53b0:9e5a with SMTP id
 5b1f17b1804b1-490c2cceba8mr165072335e9.5.1780991386352; 
 Tue, 09 Jun 2026 00:49:46 -0700 (PDT)
X-Received: by 2002:a7b:c845:0:b0:490:53b0:9e5a with SMTP id
 5b1f17b1804b1-490c2cceba8mr165072095e9.5.1780991385939; 
 Tue, 09 Jun 2026 00:49:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda363bsm47520708f8f.31.2026.06.09.00.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 00:49:45 -0700 (PDT)
Message-ID: <20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com>
Date: Tue, 9 Jun 2026 09:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] hw/arm/smmuv3-accel: Resolve AUTO properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260608174900.2227340-1-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260608174900.2227340-1-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QApov3ztmbfFxi4F5Xo-9nAOYSlF_UOPDWP1lBhOt8A_1780991386
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Nathan, Peter,

On 6/8/26 7:48 PM, Nathan Chen wrote:
> Hi,
>
> This is a follow-up to the series [0] that introduces support for
> resolving 'auto' for arm-smmuv3 accelerated mode's ATS, RIL, SSIDSIZE,
> and OAS feature properties based on host IOMMU capabilities. This is
> dependent on the series [1] for changing these property types to accept
> 'auto' values.
>
> Accelerated SMMUv3 Address Translation Services support is derived from
> IDR0, Range Invalidation support is derived from IDR3, Substream ID
> size is derived from IDR1, and output address space is derived from
> IDR5.
>
> The default values are set to 'auto' for all properties. If accel=off
> and the values are set to 'auto' or are omitted and resolve to 'auto',
> the default property values defined in smmuv3_init_id_regs() for OAS
> and RIL will remain unchanged, while SSIDSIZE and ATS values will
> remain initialized at 0.
>
> A complete branch can be found here:
> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto-resolve-v6
>
> Please take a look and let me know your feedback.

The series looks good to me and I tested it with Grace-Hopper GPU
passthrough
with explicit option settings and auto settings. It collected R-bs for
all the patches. Feel free to collect my T-b:

Tested-by: Eric Auger <eric.auger@redhat.com>

Peter, please could you consider pulling it if it suits you.  

There is also 
[PATCH v2] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is called only
once per bus
which collected R-bs and does not clash with the above series

Thanks

Eric


>
> Thanks,
> Nathan
>
> [0] https://lore.kernel.org/all/20260605001712.1823737-1-nathanc@nvidia.com/
> [1] https://lore.kernel.org/qemu-arm/20260323182454.1416110-1-nathanc@nvidia.com/
>
> Changes from v5:
> - Added R-by tags, thanks all!
> - Rebase over latest upstream
>   (https://lore.kernel.org/all/20260601215410.517009-15-stefanb@linux.ibm.com/)
>
> Changes from v4:
> - Added R-by tags, thanks all!
> - Re-word smmuv3_class_init() accel description to list nested
>   translation support as a pre-requisite
> - Fix typo in smmuv3_class_init() SubstreamID size description
>
> Changes from v3:
> - Added R-by tags, thanks all!
> - Include a fix patch for resolving ATS support in ATC invalidation
>   case
> - Update host requirements documented for accel=on, oas, and ssidsize
> - Fix style issue, update comments
> - Update function name for smmuv3_accel_machine_done
> - Remove unnecessary early return for smmuv3_accel_machine_done
> - Fix formatting in qemu-options.hx based on html render
>
> Changes from v2:
> - Added R-by tags, thanks Eric, Shameer, Cédric for the feedback!
> - Re-worded descriptions in qemu-options.hx and smmu_validate_property()
> - Emphasize accel=off auto behavior in a comment for smmuv3_properties[]
>
> Changes from v1:
> - Update qemu-options.hx to explicitly mention auto is supported
> - Update qemu-options.hx to mention auto as default
> - Simplify comments in smmuv3_accel_auto_finalise()
> - Update descriptions in smmuv3_class_init()
> - Consolidate all default value change patches into one patch
> - Implement and use smmuv3_pasid_supported() for setting PASID support
>   flag
> - Move smmuv3_machine_done() and qemu_add_machine_init_done_notifier()
>   to smmuv3-accel.c
> - Register machine done notifier only in case auto_mode is set
>
> Testing:
> Basic sanity testing was performed on an NVIDIA Grace platform with GPU
> device assignment and running CUDA test apps on the guest. Observed the
> feature properties being set based on host IOMMU capabilities.
> Verified that the VM boot will fail without a cold-plugged device, and
> that a hot-plugged device re-uses the resolved values from the initial
> cold-plug. Additional testing and feedback are welcome.
>
> Nathan Chen (9):
>   hw/arm/smmuv3: Update ATC invalidation check
>   hw/arm/smmuv3: Improve accel SMMUv3 usage documentation
>   hw/arm/smmuv3-accel: Add helper for resolving auto parameters
>   hw/arm/smmuv3-accel: Implement "auto" value for "ats"
>   hw/arm/smmuv3-accel: Implement "auto" value for "ril"
>   hw/arm/smmuv3-accel: Implement "auto" value for "ssidsize"
>   hw/arm/smmuv3-accel: Implement "auto" value for "oas"
>   hw/arm/smmuv3: Set default ats, ril, ssidsize, oas to auto
>   qemu-options.hx: Support "auto" for accel SMMUv3 properties
>
>  hw/arm/smmuv3-accel.c   | 77 ++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmuv3-accel.h   |  2 +
>  hw/arm/smmuv3.c         | 81 +++++++++++++++++++++++------------------
>  hw/core/machine.c       |  5 +++
>  include/hw/arm/smmuv3.h |  3 ++
>  qemu-options.hx         | 25 ++++++++++---
>  6 files changed, 150 insertions(+), 43 deletions(-)
>


