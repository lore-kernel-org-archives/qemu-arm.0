Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B70CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:58:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDOfL-0004ru-Om; Mon, 27 Oct 2025 10:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDOfJ-0004mr-DS
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDOfG-0001yt-Gv
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761577052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zGaeFNSF8Mx0lpSFWIUY06kERol+iaDPy5ooIN4uAI=;
 b=OcPbuJhCqxKTAAWQlKZR418189uoPg+aD8s7zj26glDuon8r6YBgswNblTM7GuhUklqvTJ
 2VmfnvNIcDhpxYf6tvqFW0Tierpx+qJSPNEqzaNXKqThDBmZO+c75hpUhPR+7Hj2yvk23N
 tXmsAMXjHWeJuuAgVjBXskEHyoJGyyI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-BhmJgDkdNTyqsxXMZ-1-Gw-1; Mon, 27 Oct 2025 10:57:30 -0400
X-MC-Unique: BhmJgDkdNTyqsxXMZ-1-Gw-1
X-Mimecast-MFC-AGG-ID: BhmJgDkdNTyqsxXMZ-1-Gw_1761577049
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-471168953bdso44941755e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577049; x=1762181849;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0zGaeFNSF8Mx0lpSFWIUY06kERol+iaDPy5ooIN4uAI=;
 b=cZpFhIws7qwTXf7QJTtyoENE36pixEOaoyI5IgFDD8lUPzrdgDERjp+F2x7q/7HhpO
 TCy/Wo8OHVDhLICkOpkxsiVAu+YqyhvhUOx9TuySH2T3XM8kZy9lV4iNaUZQ48yLE770
 UDTfVdTDxxYFMn0ZbVkkhiOkvRcDA2t7TCHNcjs3j7l4juqcYCjopdPT1a0Gx85zt1f3
 5HYQCYnzS173fR9hTnwosZFRgKq+D6SVdLG+LFsMLDjmasgXCAx4U5YosRDtLqludqmF
 qXAikaWgqBHh7Yfv9WZQGeUrBDNlot6aPFdnsSfqI3JA2sQFx/zdNQCmxRT6uQ4+pR8l
 7jCA==
X-Gm-Message-State: AOJu0Yyjf8vSvMw6DqfFwW2n7x84hIDN2Z91o7erCQXZRQv5h1Tzaog8
 n0iYYfqGYQIekeSbEIyYunC138bdG9ZXGZjW4IhDm6oIVsTTr5PePzcKIkrB43tM58nLKjYGby6
 bOnSlD+O6WJ397aIhUn43EEi85lUbFftPS21u//ijAOwqYaKsqWqIjg==
X-Gm-Gg: ASbGncuqS9cPlJQy+PZb6QMV9ji+59isjwWP/N8KtjwZSsds4YfQ08fXsWWYUeMIuM2
 mM2MUT9U84CcN/PO2DXFUgxWJ1ufS2Ja2B3ETNfe1pmMCsWdfO0UiKkCO0dME4wQCvbL46RMxXa
 W8Qz/+dPw9/0foqQtk/C4zKI7LHHdU+VgKVzGAYYihsQFGzwRc4wR8kXd994voMoLLgF9zULZYV
 6v61FDXVXBUTLvHbhuOGbByNdXBDOmfGpUu3ZJ2K6hrAW9cIl/ls7HSBsUDY3dLw/WfQfukWvjH
 zUpsH1z17EnwRAylqTVpQ8p3/g+X9xqnCfq8sDvGL3StjzizVarxirAVnMu0nNZtc1CfmaDnbmS
 Pp8uE+d8nagZb+6SdiweHpD1h8Bsr24tqmSbeoaYar1u2qg==
X-Received: by 2002:a05:600c:2254:b0:477:f2c:291c with SMTP id
 5b1f17b1804b1-4770f2c2a07mr26706635e9.14.1761577049445; 
 Mon, 27 Oct 2025 07:57:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMxVMvKqeURDWv0Y4UThrbAQkFVRGj2HE5ulcLA66V3GIh9gB9ezsMhV6cRBo4spgq49cjAQ==
X-Received: by 2002:a05:600c:2254:b0:477:f2c:291c with SMTP id
 5b1f17b1804b1-4770f2c2a07mr26706485e9.14.1761577049000; 
 Mon, 27 Oct 2025 07:57:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm14804853f8f.8.2025.10.27.07.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:57:28 -0700 (PDT)
Message-ID: <dce9bc94-f1ae-44ec-8067-ee4dbe3688f2@redhat.com>
Date: Mon, 27 Oct 2025 15:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/27] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-24-skolothumtho@nvidia.com>
 <20251001144653.0000456b@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251001144653.0000456b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ouPivq12urp3nY_VHZBhb3NmFlSezqZvb_QBaM24y88_1761577049
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



On 10/1/25 3:46 PM, Jonathan Cameron wrote:
> On Mon, 29 Sep 2025 14:36:39 +0100
> Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>> QEMU SMMUv3 currently sets the output address size (OAS) to 44 bits. With
>> accelerator mode enabled, a guest device may use SVA where CPU page tables
>> are shared with SMMUv3, requiring OAS at least equal to the CPU OAS. Add
>> a user option to set this.
>>
>> Note: Linux kernel docs currently state the OAS field in the IDR register
>> is not meaningful for users. But looks like we need this information.
> So is there a kernel documentation fix pending? :)
>
> Mind you I think we should ensure this is true anyway in QEMU as some other
> OS might do weird things if it's not.
>
> Maybe we should just raise the default QEMU uses (with compat stuff for older
> qemu) and not worry about an exposed control for this?

I tend to agree with Jonathan. We may assess the effort to increase OAS
value in general.

Eric
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>  hw/arm/smmuv3-accel.c    | 15 +++++++++++++++
>>  hw/arm/smmuv3-internal.h |  3 ++-
>>  hw/arm/smmuv3.c          | 15 ++++++++++++++-
>>  include/hw/arm/smmuv3.h  |  1 +
>>  4 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>> index eee54316bf..ba37d690ad 100644
>> --- a/hw/arm/smmuv3-accel.c
>> +++ b/hw/arm/smmuv3-accel.c
>> @@ -86,6 +86,17 @@ smmuv3_accel_check_hw_compatible(SMMUv3State *s,
>>          return false;
>>      }
>>  
>> +    /*
>> +     * ToDo: OAS is not something Linux kernel doc says meaningful for user.
>> +     * But looks like OAS needs to be compatibe for accelerator support. Please
> spell check this too..
>
>> +     * check.
>> +     */
>


