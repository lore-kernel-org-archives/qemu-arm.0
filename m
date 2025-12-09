Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5C1D1CDC6
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 10:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSuoI-0001AI-Hy; Tue, 09 Dec 2025 05:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSuoG-00019X-Ac
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:19:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vSuoE-0008KU-Ih
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 05:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765275545;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EKI/cbDBHbKZsK9LoLRPEKXmj7kEki7sWCgJioeY/8U=;
 b=ghTCI0AsCNYz363h5UAz4SdpsaWH7/EuJdF0098jFsHcZ/K46u6sEjkXsAYQmjHOEXvL3R
 70xM/+onWBkKUAA70Hj2rOdjFnSEqCzAQ4SY18HkbKGeie2f3QXizJSVANNRk6Z/aNKVvK
 gmemVP2vBNZXkDB2sKj5LTLzdVA5CfQ=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-7qPXPKJ7O0Ke3SI8pYJeZQ-1; Tue, 09 Dec 2025 05:19:03 -0500
X-MC-Unique: 7qPXPKJ7O0Ke3SI8pYJeZQ-1
X-Mimecast-MFC-AGG-ID: 7qPXPKJ7O0Ke3SI8pYJeZQ_1765275543
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b6ce1b57b9cso6390597a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 02:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765275543; x=1765880343;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKI/cbDBHbKZsK9LoLRPEKXmj7kEki7sWCgJioeY/8U=;
 b=j+FAwL7oyPdWtS8D1HfD6/o86ejghEx/zYGtpqte4HEBA91aQb5rgf3JEtKDMnnSAc
 7qH9xEPVDW/lKkrWxZAGFIEYMSIe8hlxgKCy1u/ZVA194TKY39EGzXVpKkARNQW620jv
 Gs1bXvm79N+iPiGWG+a7Q3hc1+RIqywFOBvfndKRPgTUHekkecuAhs2DR5V9RE6uOnTq
 UcZnuf3lqCUVQMR/GqpymWupQAztRd2bGJR5XMXZPiZVw2bd8ul/L7dNzPuiMr9Ia4va
 /VadxKoaPAebFs5oj8dOPavhBiWe/mdsqmAxM0hTaVEKtG+aUrbcSdrs5CG3GmJJv7Ai
 0/+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsaJp2W6FMvkUVID3dWHe8ctaUbECUO9Iz+Cde9uxLQBm9zLH1RmfXS8Q+FN6i7hdyzb2D68A2bQ==@nongnu.org
X-Gm-Message-State: AOJu0YxphF4PqXo5dsxSUD+C2raT7+9OtPmovtWVtHfFg51+RGof2mC4
 g6ma9ZCPAvM4XSh7dkUgwCAuUVthU97LXd9Z7ShXB3vMF1WLPhLrne0L5PCA18/5hqsifqPSa7z
 LL0SRrp9N29VkXo6aPZjaW0XsYlhBJ4LhQhKR/4vDde/JMjxoN8YNtQ==
X-Gm-Gg: ASbGncslwetHMKFrbdmnXZeaxlmt6c6ZDP/zwi2p3Pbb6135SgmBYi1tQ2233fbsFbG
 OzrKcQ/DpvW3/wgJPKy0fS+f5luC2Ul2XbZXdvfDR+xqQ1l+SZLS3bw/Lukct9yuCnLQnyXvmEq
 LYt6g7K1Tqg5ImCgdcP8uxf+4ByJKNW1U44l4n6xjd3DYFXfSN+JWPzwKjDaVO2HFmkl0SxVQe+
 Pu2NC2jsFZRLHSFU9aAiZowETb2CCLlOXtdpkvHFUzJ9byJ+FJHhcfnAcEj1tshIsl98BR2FjGb
 5VYcK0+xdUyhyPG3HBzc6UbUITEkxIIz09oNx27rk0JpfU+jAZIsgcREC01PLbYZocseXOwEPMV
 lvlpbO+5cMNIxFlQ+BNWd15AUnFjduIaowRI+IifvKOTVCVeqI1KjtZv5Fw==
X-Received: by 2002:a05:7300:d210:b0:2a4:874e:70cb with SMTP id
 5a478bee46e88-2abc71f59e1mr4987814eec.26.1765275542658; 
 Tue, 09 Dec 2025 02:19:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsMdzDgO7XLcWCc/dU5ng8es1aGNx40R9q+JTVzbUGAoTYqa4SM2GRfY7gHOYyxD4YcXTN+Q==
X-Received: by 2002:a05:7300:d210:b0:2a4:874e:70cb with SMTP id
 5a478bee46e88-2abc71f59e1mr4987794eec.26.1765275542107; 
 Tue, 09 Dec 2025 02:19:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2aba87d7b9dsm56031890eec.4.2025.12.09.02.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:19:01 -0800 (PST)
Message-ID: <69e9ac12-596d-415a-a669-980ba67d22ba@redhat.com>
Date: Tue, 9 Dec 2025 11:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] vEVENTQ support for accelerated SMMUv3 devices
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251204092245.5157-1-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251204092245.5157-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QMTyMlPrbrh6AIWM_dy9edtcpNjO0mFZ69DbhrXNkPg_1765275543
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 12/4/25 10:22 AM, Shameer Kolothum wrote:
> Hi,
>
> Changes from RFC v1:
> https://lore.kernel.org/qemu-devel/20251105154657.37386-1-skolothumtho@nvidia.com/
>
>  -Rebased on v6[0] of the "accelerated SMMUv3" series
>  -Addressed feedback on the RFC. Thanks!
>  -Dropped the RFC tag as the accelerated series is now more mature, and once
>   that lands, it makes sense to pick this up as well since it enables the
>   delivery of SMMUv3 events to the guest.
>
> When accel=on is enabled for an SMMUv3 instance, the host hardware SMMUv3
> may generate Stage-1 (S1) fault or event notifications that are intended
> for the vIOMMU instance in userspace.
>
> This series adds QEMU support for receiving such host events through the
> vEVENTQ interface and propagating them to the guest. The implementation
> uses the vEVENTQ support provided by the IOMMUFD subsystem in the kernel.
>
> I have lightly this on a Grace platform using some hacks to generate fault
tested

Eric
> events. Further testing and feedback are welcome.
>
> Thanks,
> Shameer
>
> [0]https://lore.kernel.org/qemu-devel/20251120132213.56581-1-skolothumtho@nvidia.com/
>
> Nicolin Chen (2):
>   backends/iommufd: Introduce iommufd_backend_alloc_veventq
>   hw/arm/smmuv3-accel: Allocate vEVENTQ for accelerated SMMUv3 devices
>
> Shameer Kolothum (2):
>   hw/arm/smmuv3: Introduce a helper function for event propagation
>   hw/arm/smmuv3-accel: Read and propagate host vIOMMU events
>
>  backends/iommufd.c       |  31 ++++++++++
>  backends/trace-events    |   1 +
>  hw/arm/smmuv3-accel.c    | 120 ++++++++++++++++++++++++++++++++++++++-
>  hw/arm/smmuv3-accel.h    |   8 +++
>  hw/arm/smmuv3-internal.h |   4 ++
>  hw/arm/smmuv3.c          |  25 ++++++--
>  hw/arm/trace-events      |   2 +-
>  include/system/iommufd.h |  12 ++++
>  8 files changed, 195 insertions(+), 8 deletions(-)
>


