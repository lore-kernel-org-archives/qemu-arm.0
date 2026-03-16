Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16CAEFCBD4
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Mar 2026 07:47:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w22eq-0004VC-Qj; Mon, 16 Mar 2026 03:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22ej-0004TU-E6
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 03:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w22eg-0004di-NP
 for qemu-arm@nongnu.org; Mon, 16 Mar 2026 03:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773647184;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMSXco3fuZJ+bg4maUAtmdN8ZUo2kYW7tF/TtoYWC+Q=;
 b=QEViQ0cC8a/POvM0kHQ6WUQXaStjGtLdTvQPb14PM2JisN0Zv/FYr95MsRb2F8KpMRA7Xh
 R0pC/xGnw0ImuZKAi3jIxP++aOohG4BZbEg1mX2fip7ABhgc2xIA+HaB+RClZKuB5DhHFk
 viNYZyPBR8OdaVPlFTcEUttgMRytC/A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-gc53Nn3oOJ2wRbhU_tD7lA-1; Mon, 16 Mar 2026 03:46:23 -0400
X-MC-Unique: gc53Nn3oOJ2wRbhU_tD7lA-1
X-Mimecast-MFC-AGG-ID: gc53Nn3oOJ2wRbhU_tD7lA_1773647182
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439c112b1a4so2716590f8f.3
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2026 00:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773647181; x=1774251981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMSXco3fuZJ+bg4maUAtmdN8ZUo2kYW7tF/TtoYWC+Q=;
 b=Wqp+Zr6KbnvROzhfkVQGoLrhwc+vVuN+TgEWa131WWmGCLr+MTJICrt94YBv6yXDC5
 hEpndzJAdIE9EyMIMSLR8Ph8gw8fZNcyuQa8l1Vm8aiaXufNONI1a1wAyqmfw9LyCphh
 KwSjt1FwZOU/5Dn5BpcdIZk+3T0QcM7z01swSMu97ze+8UfGz74V7sA8XImziQ41GxN9
 If7MutmqtiGJ2IHjuic+Bhjw8EAh8qyuelDw6aCtVVGKhHNj0cL05bq/kN4huERII6Lv
 Cz+ivsgVN/aGco1zlB38KrjerzEsZQ3yO0/+gXyyGGfPd5UvXYFInF82Vs8wW9OyFYLF
 Kufg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRJq77PsCr0fxFJEqJ49SkVVdbXLTN4qACNIADMGfZRB2LGJTF8DZw4AoCZafo3YIoBAEjmVlx3A==@nongnu.org
X-Gm-Message-State: AOJu0YwSMNgvkInoGucpu0D43JoXZJNduo4VNtnDlYWkBwM9JNoSE1/p
 Nwbo6Z3HxoxMUNpZC+VMJveGqbITLIt9pKrcitYVNzXoalI5e8FgQtYBFVad7d3WCow/eHKKb/K
 wpj3s/OLMXY5TzRam5wUZzhdHt2+us6i+/Z0Ph4lNYspqWbvDapRnxA==
X-Gm-Gg: ATEYQzxW5PFLrhxStVb4NBNtLgFZx8VF3bHZIzgTtx0p+GCPYLPh1k/Fmb2NYVAwJDX
 z4+bG+yVigBl81dKLuoTPnKOzfQQxm40QIAGWlLaLXeB38bT4WtgcS5tuYmyp70G1WuamoLCYM4
 JCwshNUyZ7AMQsQf+iTKAgICEgrs3q8xXuXTgpvloYup4wCpTF/EBppZMIRRkmnkxfWixVPrhqM
 x8Sj+rI6f8FNoZ1fZFxJXBKaLDrffcsZ1LgZ2OImqcGGPJuqhURWiRVidt+eAG4xCzZsrtGZxHM
 tgZvzHXYcBvcBy/Vjj/RZJEKaTpJ42GF3Fs2DPs6KnaF4lzSsnbSNU7lEz3tW6BBHPNcoelaVu5
 9ivLOVXPihPppdc3NiVdWJZAf0IVcIQrqdEMz0wW2xQrV6GPJ2OGaecq9KPPXxL83UMQcLQ==
X-Received: by 2002:a05:6000:2283:b0:436:3707:2bf0 with SMTP id
 ffacd0b85a97d-43a04db7556mr22330085f8f.35.1773647180723; 
 Mon, 16 Mar 2026 00:46:20 -0700 (PDT)
X-Received: by 2002:a05:6000:2283:b0:436:3707:2bf0 with SMTP id
 ffacd0b85a97d-43a04db7556mr22330039f8f.35.1773647180264; 
 Mon, 16 Mar 2026 00:46:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b46b41eb2sm2550932f8f.1.2026.03.16.00.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 00:46:19 -0700 (PDT)
Message-ID: <15d35160-2f11-4821-80cb-42f76e6de00b@redhat.com>
Date: Mon, 16 Mar 2026 08:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] qdev: Add a SsidSizeMode property
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Matt Ochs <mochs@nvidia.com>
References: <20260312210328.2016191-1-nathanc@nvidia.com>
 <20260312210328.2016191-5-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260312210328.2016191-5-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o6YAxXLCJ8ze1diYLnSSCjqnZKD7a33wNKc918gQCxQ_1773647182
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/12/26 10:03 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Introduce a new enum type property allowing to set a Substream ID size
> for HW-accelerated smmuv3. Values are auto and 0..20. The auto value
> allows SSID size property to be derived from host IOMMU capabilities.
> A value of 0 disables SubstreamID, while non-zero values specify the
> SSID size in bits.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/core/qdev-properties-system.c         | 14 ++++++++++++++
>  include/hw/core/qdev-properties-system.h |  3 +++
>  qapi/misc-arm.json                       | 16 ++++++++++++++++
>  qapi/pragma.json                         |  1 +
>  4 files changed, 34 insertions(+)
>
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index a402321f42..4aca1d4326 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -18,6 +18,7 @@
>  #include "qapi/qapi-types-block.h"
>  #include "qapi/qapi-types-machine.h"
>  #include "qapi/qapi-types-migration.h"
> +#include "qapi/qapi-types-misc-arm.h"
>  #include "qapi/qapi-visit-virtio.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qemu/ctype.h"
> @@ -723,6 +724,19 @@ const PropertyInfo qdev_prop_zero_page_detection = {
>      .set_default_value = qdev_propinfo_set_default_value_enum,
>  };
>  
> +/* --- SsidSizeMode --- */
> +
> +QEMU_BUILD_BUG_ON(sizeof(SsidSizeMode) != sizeof(int));
> +
> +const PropertyInfo qdev_prop_ssidsize_mode = {
> +    .type = "SsidSizeMode",
> +    .description = "ssidsize mode: auto, 0-20",
> +    .enum_table = &SsidSizeMode_lookup,
> +    .get = qdev_propinfo_get_enum,
> +    .set = qdev_propinfo_set_enum,
> +    .set_default_value = qdev_propinfo_set_default_value_enum,
> +};
> +
>  /* --- Reserved Region --- */
>  
>  /*
> diff --git a/include/hw/core/qdev-properties-system.h b/include/hw/core/qdev-properties-system.h
> index ec21732ce5..4708885164 100644
> --- a/include/hw/core/qdev-properties-system.h
> +++ b/include/hw/core/qdev-properties-system.h
> @@ -14,6 +14,7 @@ extern const PropertyInfo qdev_prop_multifd_compression;
>  extern const PropertyInfo qdev_prop_mig_mode;
>  extern const PropertyInfo qdev_prop_granule_mode;
>  extern const PropertyInfo qdev_prop_zero_page_detection;
> +extern const PropertyInfo qdev_prop_ssidsize_mode;
>  extern const PropertyInfo qdev_prop_losttickpolicy;
>  extern const PropertyInfo qdev_prop_blockdev_on_error;
>  extern const PropertyInfo qdev_prop_bios_chs_trans;
> @@ -61,6 +62,8 @@ extern const PropertyInfo qdev_prop_virtio_gpu_output_list;
>  #define DEFINE_PROP_ZERO_PAGE_DETECTION(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_zero_page_detection, \
>                         ZeroPageDetection)
> +#define DEFINE_PROP_SSIDSIZE_MODE(_n, _s, _f, _d) \
> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_ssidsize_mode, SsidSizeMode)
>  #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
>                          LostTickPolicy)
> diff --git a/qapi/misc-arm.json b/qapi/misc-arm.json
> index f921d740f1..76ea0a09fa 100644
> --- a/qapi/misc-arm.json
> +++ b/qapi/misc-arm.json
> @@ -45,3 +45,19 @@
>  #                     { "version": 3, "emulated": false, "kernel": true } ] }
>  ##
>  { 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }
> +
> +##
> +# @SsidSizeMode:
> +#
> +# SMMUv3 SubstreamID size configuration mode.
> +#
> +# @auto: derive from host IOMMU capabilities
> +#
> +# Values 0-20: SSIDSIZE value in bits.  0 disables SubstreamID.
> +#
> +# Since: 11.0
> +##
> +{ 'enum': 'SsidSizeMode',
> +  'data': [ 'auto', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
> +            '10', '11', '12', '13', '14', '15', '16', '17', '18',
> +            '19', '20' ] } # order matters, see ssid_size_mode_auto()
> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 193bc39059..24aebbe8f5 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -68,6 +68,7 @@
>          'S390CpuEntitlement',
>          'S390CpuPolarization',
>          'S390CpuState',
> +        'SsidSizeMode',
>          'String',
>          'StringWrapper',
>          'SysEmuTarget',


