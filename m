Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34CCE99050
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 07:42:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB6Ux-0000Zy-7w; Fri, 10 Apr 2026 03:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6Uv-0000ZJ-0a
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wB6Ur-0000eL-1m
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 03:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1775806904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCf7g8F9KxcApSEA2qC2s65YlgaHMhK3MANE2ANARdQ=;
 b=GUFqcsxNxeFaB7moeDfnVsTunhOCZPhse2y02pphlEQrFQW7q0LmENJEfakADL/8DW/qk8
 3iBrsI7RiEtJIBXJHJn7CJVw1kF+/yyWrHyPXQfCYf7b5egAD7JotjRMXjSV8BlpDlCDNw
 zaY5jwGzrRLcL8Aidi5QX+Cbw/MknCE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-e21MMP2UPUGGjKjWe9vHRA-1; Fri, 10 Apr 2026 03:41:43 -0400
X-MC-Unique: e21MMP2UPUGGjKjWe9vHRA-1
X-Mimecast-MFC-AGG-ID: e21MMP2UPUGGjKjWe9vHRA_1775806902
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43d1dea12aaso1221995f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 00:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775806902; x=1776411702;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCf7g8F9KxcApSEA2qC2s65YlgaHMhK3MANE2ANARdQ=;
 b=BTmcEWTIy9BKzp0pnzlKeGPOQv2G4ZUfs31DD9B5ulzOBUOh47w1D8Hmg1B2dSLmXQ
 Ioa3GIvzgr6JqIRCE1B6K9XNgLKtvcIW5dViuUnikc6BSdvBpNgHv55vKTsC3dillYzg
 5t8PVurtzw/PUrU5oE09AuI7xkTYA3T+3eFjDh1Xy2AO194NgAQrFBc7i2IxBkdhFdcX
 05IeoWKOxRZ1bnRbHoFabbqMaMvonrYfLtd0xJrZ908n379GxXHDM6VrBi+ovfD94KUf
 d7FtHVTLrSaZSvMk5botvQ9hurzsOMfzLt6X55f2JrSPS1XcrsmNjI2guzS575TFGIeb
 BlSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtRLRaDNiMJTe5uxymmZohlnW8J2RFHHTOyVGufVC0tyXhFd60pYIif7FR8tqFq1DI2t8PsWzP9w==@nongnu.org
X-Gm-Message-State: AOJu0YxrgKU5J3wvCmrv6b3EKQX57BwnvDleC2mvZzNMnrPo7tmdoU7c
 +Zc2Di23GCKNjzJ24q1VejyxHkragUkLJdloWZkHDi8SZ8cGsOxp4Mj2wPF3TyfuMPH6fF2nbk7
 vMczAnkblfvw0SPcs8kip/vS7k2Oag1cRBH83/T2V7Sxr0bQsr9ocZQ==
X-Gm-Gg: AeBDievJNKONm4LvfEJf7o5GQWul7j+scB5vbgkLG6h+g18UbLXXycgaTrRr1+5ZIkv
 gern2EJ+wT10N3R8hjXPX0FnE7sKFDVjOMlVsHgZDJTgqP8pzszmXMaY8vAlS+iyJK4f2W0T0YX
 Evl8ha6KBwh8/S826lL19oTQKbFUl3gxsdXF65kCSucKxys8VfehxKHwN0dJknQ5DhgyL6d/SbU
 JzYL/r0b34ZCN2Dwt4YxredYmjJcFRAu9LI/GDgqyRCPCNlwtU9CjEr/3mAFwyQSEU2QFlHzBz3
 x6R743/d7AaKqbDecPe5MZ4vEWnQ0W5s0jhXi0PKiFQQ1EQ/rdrsI8RrVdrB1d61X5cbx0diooR
 CC7VV4zqNKlcFmormz64acgLvE9gSD61anRPypV8DD3BiscNjclKJ4mGWPxvfMpcc7hbPrw==
X-Received: by 2002:a05:6000:26c2:b0:439:ddf9:a205 with SMTP id
 ffacd0b85a97d-43d6427b793mr2884389f8f.10.1775806901751; 
 Fri, 10 Apr 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a05:6000:26c2:b0:439:ddf9:a205 with SMTP id
 ffacd0b85a97d-43d6427b793mr2884330f8f.10.1775806901260; 
 Fri, 10 Apr 2026 00:41:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63de2a53sm5506192f8f.5.2026.04.10.00.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 00:41:40 -0700 (PDT)
Message-ID: <a8cece25-47ff-4210-8962-cbc39ba7646e@redhat.com>
Date: Fri, 10 Apr 2026 09:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] hw/arm/smmuv3: Change the default ril support to
 match the host
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20260401010231.4166776-1-nathanc@nvidia.com>
 <20260401010231.4166776-7-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260401010231.4166776-7-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gF0ztms-FgaTJBhf10dLy_3RuwI6eyaUN9DaC11h3lk_1775806902
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hi Nathan,

On 4/1/26 3:02 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Set the default value of RIL to auto. The default for RIL support used
> to be set to on, but we change it to match what the host IOMMU
> properties report so that users do not have to introspect host IDR3 for
> Range Invalidation support. Include the previous default for ril in the
> 11.0 compat.
>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
> ---
>  hw/arm/smmuv3.c   | 2 +-
>  hw/core/machine.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index a2d2f0e3bc..74cc81ae32 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2153,7 +2153,7 @@ static const Property smmuv3_properties[] = {
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>      /* RIL can be turned off for accel cases */
> -    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_ON),
> +    DEFINE_PROP_ON_OFF_AUTO("ril", SMMUv3State, ril, ON_OFF_AUTO_AUTO),
>      DEFINE_PROP_ON_OFF_AUTO("ats", SMMUv3State, ats, ON_OFF_AUTO_AUTO),
>      DEFINE_PROP_OAS_MODE("oas", SMMUv3State, oas, OAS_MODE_44),
>      DEFINE_PROP_SSIDSIZE_MODE("ssidsize", SMMUv3State, ssidsize,
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 6796ab63cc..8f8c26bbe8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,7 @@
>  
>  GlobalProperty hw_compat_11_0[] = {
>      { TYPE_ARM_SMMUV3, "ats", "off" },
> +    { TYPE_ARM_SMMUV3, "ril", "on" },
I wonder if you shouldn't squash all the patches that change the default
values of accel props to auto mode into a single patch, at the end of
the series.

Eric
>  };
>  
>  GlobalProperty hw_compat_10_2[] = {


