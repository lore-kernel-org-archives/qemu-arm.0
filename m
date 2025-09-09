Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5A7CA0FED
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 13:38:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvyYB-00030L-MG; Tue, 09 Sep 2025 09:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyY8-0002zT-2G
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyXt-0002Sj-P8
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757425081;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrAP9rSqWOIaXCvFA81T681Fn/neRL6et1UgBbTm7jo=;
 b=EyNkV9XuCjwQUapZwBzzG2f+7RqNWaJ+OnMY45RvdfJl+UgFEyqaSPbCgMc42kXH3w2+bs
 lt60DPGQ9Rnlmf+JclO9Gf8uJnLtnWpS/1Sr7/wQs6svJpoUYv4+IMRCk4Ne9ot0FFz3E7
 ZC3BIK7Y2psdQmF/WHwvTLC34kIe/Q0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-giI4uxHsMBKw9yeVjnPW9g-1; Tue, 09 Sep 2025 09:38:00 -0400
X-MC-Unique: giI4uxHsMBKw9yeVjnPW9g-1
X-Mimecast-MFC-AGG-ID: giI4uxHsMBKw9yeVjnPW9g_1757425078
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45decfa5b26so5345125e9.3
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425078; x=1758029878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GrAP9rSqWOIaXCvFA81T681Fn/neRL6et1UgBbTm7jo=;
 b=cmlwtxSGupeC+YMwZY9pPa0wgtYxLzugDzGgwhu4AUKWSkv64f+/DDjhHWlm+5froV
 znd/uqj32fFpx+v8/SwFB5wzZR/p96rlJza3h6mxYOfjKUHxOTVeLs+XDUAls0m93nmU
 Vv+NbRi8eYa2RM8riMSimqEcWlTwdJmiBZBBGTPsi+iXofV9FO6vs6AJDF+2aOBhHgJl
 mhtlxquKe1351EQ6Ie/je7c48wRLAw7Btk65R/B6W8dO87Oz5azwGR2i7KezKmD4PRgZ
 vwSUi7fP7k7KEYRA6D9nAf2AMx/L25wOpNQEPbIlyoy++AXs6PCjVGfglZZiR7loTCEU
 2KYg==
X-Gm-Message-State: AOJu0Yxwveq7VqGeMMOK8Rd8G54uFvtiS9sgVfk7E8PO45xJpPR4HARf
 aUZkV6EFPkVzkmSuQaVYsMKz8mNuoDxN7sqXPaIiXnST4T6g5pSer1+e1IrIZ7mkTDUQG52nuJD
 LLixUiEWHlXkJtF1InsY9Yu0GGYnKlzfVoB28u2s3N/W2MUtFdVgCHA==
X-Gm-Gg: ASbGncsshb8ATTrAPl05HYB8x6khHfnlP/LxWyseAKX3MjjeBVkyeD42yMjBu+WXERz
 r4Qp0QnZHY36sqlpBOfj8qb/uvkR7oM6Gtj3MCQ5zl/TNNA+5jhEBWL2DeYgbXfkqa9ipqhnZO/
 IUh7HCoGNYqlSakadXu2zgFsXNtIF0c5j2k5Tmcx6tvfm4CIgBuF5Ue17LisoKoxp9U4OssmV5A
 RXDtlGA05HcKaljjOtUfDl++OxitJ4Eqn90gOn72LjOBGZzl3VnEVmLBlEGx79VYuGELUmGWqfk
 AkwVo0R/CRJNLgdcGOHw4ZwI5ZAtrGoNG2ogZkzS+6iAqRc=
X-Received: by 2002:a05:600c:840f:b0:45b:6365:794e with SMTP id
 5b1f17b1804b1-45dddecdacemr113680855e9.24.1757425077804; 
 Tue, 09 Sep 2025 06:37:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQeixLWcTdEbly64R52FEdqYxYew4FhKB2D2VCtNgzmJUAbRKYc+KCWcQLQrdZhaIEkL8diw==
X-Received: by 2002:a05:600c:840f:b0:45b:6365:794e with SMTP id
 5b1f17b1804b1-45dddecdacemr113680545e9.24.1757425077341; 
 Tue, 09 Sep 2025 06:37:57 -0700 (PDT)
Received: from [192.168.43.95] ([37.167.152.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df15cac87sm10478285e9.2.2025.09.09.06.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 06:37:56 -0700 (PDT)
Message-ID: <b8f2fd5a-12ff-4413-8456-e1ee9ee6c823@redhat.com>
Date: Tue, 9 Sep 2025 15:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/15] hw/arm/smmuv3: Implement get_viommu_cap()
 callback
To: Jason Gunthorpe <jgg@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-8-shameerali.kolothum.thodi@huawei.com>
 <b13d3596-1498-462d-ab2c-1a626f050dbe@redhat.com>
 <CH3PR12MB75482B0418C01770FAEFF56CAB0CA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20250908134030.GG616306@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250908134030.GG616306@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h1fi70A6wsJ92RVieSEAzVB4OUQsfik0JE4lQ-3MKck_1757425078
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Hi Jason, Shameer,

On 9/8/25 3:40 PM, Jason Gunthorpe wrote:
> On Mon, Sep 08, 2025 at 08:22:59AM +0000, Shameer Kolothum wrote:
>>> nit: strictly speaking couldn't we have a stage2 being used at guest
>>> level implemented by a stage1 at physical level?
>>> but it is totally fair to restrict the support.
>> Yeah it is possible I guess. But then we have to use the S2TTB to configure
>> Host SMMUv3 S1 instead of S1ContextPtr which is used now. 
> S1 and S2 have different PTE formats, you cannot take a guest S2 table
> with S2 PTEs and have the hypervisor program it to a S1.
>
> The guest must see a SMMU with no S2 support in the IDRs.

Yes you're right. As PTE are different we cannot do it.

Sorry for the noise.

Eric
>
> Jason
>


