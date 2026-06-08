Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5063CCD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 09:19:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWW8Q-0008Og-Al; Mon, 08 Jun 2026 05:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWW8M-0008Na-Tn
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wWW8L-0004om-Fc
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 05:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780910340;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+zW08Pl7ILs1Vo32rmEYB2yCbBTXKjogUoZD02mssY=;
 b=Gp5AFktf2qUS6bMe9HXGc1LcJ9TPdqs+M0I4H1OPKf3Tm/qYWI/YRwk0CTo029qZeop24u
 xG+HPYeZ+/lwcTXXm8aB1rZA9ERt2f6+k1euxLJzFKMNkKMo00dKGd/7vU8kiKoZFKTVMi
 Ayj3WNZbi2W/JdipQIlcFqoAD4sK3Ic=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-ZQASccCOM-iyFHVKg8N5hw-1; Mon, 08 Jun 2026 05:18:59 -0400
X-MC-Unique: ZQASccCOM-iyFHVKg8N5hw-1
X-Mimecast-MFC-AGG-ID: ZQASccCOM-iyFHVKg8N5hw_1780910338
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-bf473656dcdso174159866b.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 02:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780910338; x=1781515138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+zW08Pl7ILs1Vo32rmEYB2yCbBTXKjogUoZD02mssY=;
 b=FcEbsOPHdFs08iVgP6gDBMTN8pq+x/TnL/mTA6Ot/H03VFC7vm4sWPKVbVMzkt/+WZ
 +3pGz8qwadsjw6h+ShU2xa7W8tqDHhi1dL438h820kAIStdRZSafAFQ2mK+mZhZsWu0t
 FU57mi1K2z9XrXR9sU8x3XR9Slq2SHN1RqUL4kxlavH312UmvRGNYyr3iaIk9iu6o+IR
 3+k1Bw8VWG5mYxl3kGa/DZa8WuKiGXMcgsUW5boBOg6Wl2AAgS7TaLzgueG1Dp49tX+G
 Si06rtMoCdNtZza49kgQVICz69rf9VZ9Pkkdq+/6en+bes/HFMdST6rdJ1TtdzcfMRbj
 s+PA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ficc84DXHMZF2f0PeqeoBZfXSp3HQSrahCCPor9UVfKcNHlz8I0pFzBKLhqXM+1lsajK+7q6aew==@nongnu.org
X-Gm-Message-State: AOJu0YyiucI1OsZqWYymUrH22gwKZ9/nZIt2dv0USDW/oTG3fmKkLizP
 4fciMuesqCJHu8N/loLdaXF92wIzq9Qaweenkmo7bAwbgmfA24NqGQxkbdTumS9bJSgsqnuVlyp
 OfVhydxH3y4oc8+rudwrgxHGvXrCKqrdFkGkSAc+pOmffrFxO1A6vLA==
X-Gm-Gg: Acq92OHYGlgqBo4HoERpdVcceou1/H/DkZDbqXrWQGodo2ZjpAG0pXj31LopdCnta5y
 u+I+jL09mq3lFvBv0whiaO013ie+eaog1MUNcrJBjL0HqRVwPMaSfw8/ia6OIZWpXaj5v2LDjQl
 esOFyNSnG56ohUrK512HtS98+YTHVGbrAdD9KCKUqO1uNLBYlN/GJoQvy9+b2owiBSomI1zm2qf
 6xbouAejTj+8nlIYOHPXLWgjx90bvOA2qpR7+VUMZxDHaFIeKKM5obFlknsLRrROr2/ye0I4QAN
 9JXE115iZHBvTRsd88UUy8OX2OAVcr931GYFQidJIwBSRV7gLoMptutuvsNRNFZxx8WHt1gz8IU
 kxHYaO3K2HMa07ofM5HU6g9p2t4gGTXEM/D7U/Atds+9rnmd/+VxQaCTTT/Jqj2JdbfEsep6x9H
 v47QT5
X-Received: by 2002:a17:907:8b9b:b0:bec:894d:dd3f with SMTP id
 a640c23a62f3a-bf37164d6demr686680766b.14.1780910337669; 
 Mon, 08 Jun 2026 02:18:57 -0700 (PDT)
X-Received: by 2002:a17:907:8b9b:b0:bec:894d:dd3f with SMTP id
 a640c23a62f3a-bf37164d6demr686676766b.14.1780910336485; 
 Mon, 08 Jun 2026 02:18:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0553060dasm841276166b.44.2026.06.08.02.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 02:18:55 -0700 (PDT)
Message-ID: <de367a12-b814-4a65-97e2-ac7a63a9653f@redhat.com>
Date: Mon, 8 Jun 2026 11:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] hw/arm/smmuv3: Improve accel SMMUv3 usage
 documentation
To: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
References: <20260605001712.1823737-1-nathanc@nvidia.com>
 <20260605001712.1823737-3-nathanc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260605001712.1823737-3-nathanc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4vtIkmz2yzDlMiRoZa3U9ojT0YtQg24jRjY8zsDWyCc_1780910338
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Nathan,

On 6/5/26 2:17 AM, Nathan Chen wrote:
> From: Nathan Chen <nathanc@nvidia.com>
>
> Add a statement to clarify that the host SMMUv3 must support HW-accelerated
> vfio-pci device assignment when setting accel=on.
>
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Nathan Chen <nathanc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0c65dc8c91..6b5035e11f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2165,7 +2165,9 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>  
>      object_class_property_set_description(klass, "accel",
>          "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
> -        "configured in nested mode for vfio-pci dev assignment");
> +        "configured in nested mode for vfio-pci dev assignment. Please "
> +        "ensure the host SMMUv3 supports nested translation before "
> +        "enabling.");
>      object_class_property_set_description(klass, "ril",
>          "Disable range invalidation support (for accel=on). ril=auto "
>          "is not supported.");


