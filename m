Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C4A1125811
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 18:21:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0OB8-0007fx-U4; Wed, 11 Mar 2026 14:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0OB5-0007f7-Ov
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 14:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0OB2-0006QL-Kq
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773253259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOhLNeMkt/xUr6zSUOKnMS9UpFF66N4foeoMxSIjBwI=;
 b=D+doPlptbKOlJt5aGl1Bd5e/dVrPSJh1VWni7vB2e70rpYBuvr4y+P+RyI5BR3MCMjpmZM
 vzBN9LbQlhMQhNR+2BLUolEo8XwLysTj8he+J2eMNx49qa10Ys8dgW5ckVKX7mEFQbLy4Z
 L9uvg/7p7CCyko5W6mn7bZ0hndBaGVY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-VAJy3t2kMt6_UofSnk9O-g-1; Wed, 11 Mar 2026 14:20:57 -0400
X-MC-Unique: VAJy3t2kMt6_UofSnk9O-g-1
X-Mimecast-MFC-AGG-ID: VAJy3t2kMt6_UofSnk9O-g_1773253256
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439b9116e2eso106797f8f.2
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 11:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773253254; x=1773858054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOhLNeMkt/xUr6zSUOKnMS9UpFF66N4foeoMxSIjBwI=;
 b=ZqO5sAumfBLAceF0ADosFpwsHtbSb3M7bD04bttJ/H0eVBV0uIMqEtUXNXUw3U8Trz
 dF5KKAQK/hoYiCEXvSXLugsfh6kPcb4MXngg0ZHj5MZKf8gCut9sw+XiGiEpT7HnfwS3
 1hRTJgQeVt6mqKWSBt5WXufGTqwvx7gL5lo6QeBfQzuAGR77AOahw7gnwTY9XxD7sS+2
 haHddLhiwto7prnYGsphwOCorRZDVUS2sqttJHNsZQHbDvevjAfBbCw3bvhlfOyb+BpD
 nzd7F2sUxIXsKtXy+2i5HJ09BzYWUpdiEDEerjkWpWRZ+quuqe8rGaeHQZmo7fSWWE0H
 sq+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUySPPruSRGnvlj8xkWyR779aHFpaHFFWL6GsKbRsfZ8dgHrD8rjUCJe1720X1toZ6vFZE+arBsKw==@nongnu.org
X-Gm-Message-State: AOJu0Yy5HUE7U/u7uqncVFeauplEt7WdBBnuXqBTYl54ul6G4vmh/N0V
 fM+9t0pamiID5DsrPtWFLxgYFUJ9NcNEglA4V7d9RoWyv6E/QAR8vxF/CVIN5AhbbmcR8A+Pp2y
 9e09Q4B7mWfnVu5DJIjaCmS40eiVVcwr0UkiRvD+oL6vY9eU+6YfdaTcF+hE4pw==
X-Gm-Gg: ATEYQzyu4ENImM224pvSe71hH1mGhN9Cd5zuzy3NrdaDIh35nYzIveaYFuMAU0FdOHR
 Sw+giDlEen+vIiL9zGCm2RtopMG1u7x+3jgD5RZXFIzE5d+GBhqC7LpDktk4g4jwLY7KGqKmvNp
 1F46mHGoo+PnyQ4rDg5pg7heME2VZ7mWisoDsyEbh8JMUKYtfFKlWTRWa2UYOpVF26b80sFy+Ia
 EqMyLNamin6/1aH4mzJFhWt9xDZAIf3ZNAlSTl5aT/G8CBfp9xmDU8dmKNRrpzWR6mSHo4o+WdQ
 13Um7FOeqZFrN1KpygG6W2JVFOIUrAltuqKE/HhKQ1wzB7Hi7QpX6McX8AXzgo1em8JVZNiMhKZ
 Li1onOdqK26fDCYXPbVYiFWJlmDwlltc6/MfR0bxjEprq2kmM0sUL+HlCulMsWaRfQ16lUg==
X-Received: by 2002:a05:6000:3113:b0:439:c5cf:fc68 with SMTP id
 ffacd0b85a97d-439f81bd343mr6922383f8f.1.1773253253624; 
 Wed, 11 Mar 2026 11:20:53 -0700 (PDT)
X-Received: by 2002:a05:6000:3113:b0:439:c5cf:fc68 with SMTP id
 ffacd0b85a97d-439f81bd343mr6922345f8f.1.1773253253149; 
 Wed, 11 Mar 2026 11:20:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe23afc5sm1166520f8f.39.2026.03.11.11.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 11:20:52 -0700 (PDT)
Message-ID: <793c6796-177a-4e31-bda7-60bf2b9e1574@redhat.com>
Date: Wed, 11 Mar 2026 19:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] qdev: Add an OasMode property
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <20260309192119.870186-8-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260309192119.870186-8-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uAveZw5HCh_N_icDUaHrCFY_rXkYgw81oLLCFMHVITA_1773253256
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

Hi Nathan,

On 3/9/26 8:21 PM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Introduce a new enum type property allowing to set an Output Address
> Size. Values are auto, 44, and 48, where a value of N specifies an
> N-bit OAS.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/core/qdev-properties-system.c         | 13 +++++++++++++
>  include/hw/core/qdev-properties-system.h |  3 +++
>  qapi/misc-arm.json                       | 16 ++++++++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 4aca1d4326..a805ee2e1f 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -737,6 +737,19 @@ const PropertyInfo qdev_prop_ssidsize_mode = {
>      .set_default_value = qdev_propinfo_set_default_value_enum,
>  };
>  
> +/* --- OasMode --- */
> +
> +QEMU_BUILD_BUG_ON(sizeof(OasMode) != sizeof(int));
> +
> +const PropertyInfo qdev_prop_oas_mode = {
> +    .type = "OasMode",
> +    .description = "oas mode: auto, 32, 36, 40, 42, 44, 48, 52, 56",
> +    .enum_table = &OasMode_lookup,
> +    .get = qdev_propinfo_get_enum,
> +    .set = qdev_propinfo_set_enum,
> +    .set_default_value = qdev_propinfo_set_default_value_enum,
> +};
> +
>  /* --- Reserved Region --- */
>  
>  /*
> diff --git a/include/hw/core/qdev-properties-system.h b/include/hw/core/qdev-properties-system.h
> index 4708885164..2cbea16d61 100644
> --- a/include/hw/core/qdev-properties-system.h
> +++ b/include/hw/core/qdev-properties-system.h
> @@ -15,6 +15,7 @@ extern const PropertyInfo qdev_prop_mig_mode;
>  extern const PropertyInfo qdev_prop_granule_mode;
>  extern const PropertyInfo qdev_prop_zero_page_detection;
>  extern const PropertyInfo qdev_prop_ssidsize_mode;
> +extern const PropertyInfo qdev_prop_oas_mode;
>  extern const PropertyInfo qdev_prop_losttickpolicy;
>  extern const PropertyInfo qdev_prop_blockdev_on_error;
>  extern const PropertyInfo qdev_prop_bios_chs_trans;
> @@ -64,6 +65,8 @@ extern const PropertyInfo qdev_prop_virtio_gpu_output_list;
>                         ZeroPageDetection)
>  #define DEFINE_PROP_SSIDSIZE_MODE(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_ssidsize_mode, SsidSizeMode)
> +#define DEFINE_PROP_OAS_MODE(_n, _s, _f, _d) \
> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_oas_mode, OasMode)
>  #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
>                          LostTickPolicy)
> diff --git a/qapi/misc-arm.json b/qapi/misc-arm.json
> index b372a3661b..76b6965502 100644
> --- a/qapi/misc-arm.json
> +++ b/qapi/misc-arm.json
> @@ -60,3 +60,19 @@
>  { 'enum': 'SsidSizeMode',
>    'data': [ 'auto', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
>              '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20' ] }
> +
> +##
> +# @OasMode:
> +#
> +# SMMUv3 Output Address Size configuration mode.
> +#
> +# @auto: derive from host IOMMU capabilities
> +#
> +# @44: 44-bit output address size
> +#
> +# @48: 48-bit output address size
> +#
> +# Since: 11.0
> +##
> +{ 'enum': 'OasMode',
> +  'data': [ 'auto', '44', '48' ] }
you also miss other enum values

Thanks

Eric


