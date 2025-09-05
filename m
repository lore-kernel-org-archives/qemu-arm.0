Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13389CA1013
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 09:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuT6B-0005us-I5; Fri, 05 Sep 2025 05:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuT6A-0005uM-Lc
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuT65-0006nf-U2
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757065866;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1vq3EHGQZY9x5nXDExeSo6nYDb33OxxqgtOv3NzN7g=;
 b=PPX13U+HSnIQapT548du7u1cMquPtJuPRvCj1x67lq+/GRs2jFelbs1I5jyisugCVQBGxu
 JMRXymFMXK+2ruPvZUgRdcILyHNk4+f9ipAw9/5+7yCOouY1RxCZPrPsBT+ETpnFGmz5Gy
 o8er9FAvXu7Q8wkrsqkNkeOZU5GvQ8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-HxbK8GIeMVWSxzuYQCJtFw-1; Fri, 05 Sep 2025 05:51:04 -0400
X-MC-Unique: HxbK8GIeMVWSxzuYQCJtFw-1
X-Mimecast-MFC-AGG-ID: HxbK8GIeMVWSxzuYQCJtFw_1757065864
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45cb6d8f42bso16267525e9.2
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 02:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757065863; x=1757670663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1vq3EHGQZY9x5nXDExeSo6nYDb33OxxqgtOv3NzN7g=;
 b=QjqIEvbPXh1/rfmPg8v4PPtF0Ye8SESMszKVvq7LMjLeCQtIadNzrMWy8EfLDk5jyt
 2j+WplLiImGvqhA9r9565behNRk13XPRjHIra24EQWIizXtcRpvLW5Vk93bzdBaI73dV
 9+jvZvdtPx+AxYWb9eZp0DVtU07Fzm7wuoY049K4QXBhJZ3KT4P+5zl48lWi+EBMNabd
 SoEpQAo+RZ+ZwrDB3d7NpnnOMfoSDakN3XmhpllxNpBbnQ4fJUIgURwTfsPokafrMtYc
 QQz8N9K2iPwk17k34tY7colIYx56hmvVWhk+jKNNQ27Dv80OzD5+co5QQNxl85JRFxml
 VgXg==
X-Gm-Message-State: AOJu0YwqJYVMhxYjGafDsLOWBNPc+bpq0MavtlcD3ZjqRC2UetI9g7lc
 XUCjS9xOJCPQ7LXANty6hrMbZ8c7HyFNhW4G9Mj7KfUi680tVdKm/Hwy6KVDljGUePZA+ftQ4HN
 tTELpTeFHYeM1Zd8YF8VT//hUgFZCg/42KWoM5huhYYfYJkpZ2s1U7Q==
X-Gm-Gg: ASbGncuk39AfBV7mrWCW8h/wYPazClAHYTBRne7djoTwLBW4ZTS5hY/CLrNf8VZvwkG
 xai31uX87hnp/2YR4Y9FceHE065B8E2ng/vuEUSTyc6SYjL2D0tN6lSncBcwWZ6lpe78T913C+N
 SEiMSNdRh7bxyU7Dte2NYwL8O/M2oqwx+Vnsk+n1xmoO5532T8K8lFlM7mpcBeibxVvdlT81Vak
 Pb55okwFg9DfJkRa8guOo2+sgo+wB+KXQ7/GnxU8pBhr//P05sSdNVJfVG6frO+VCxU7OFsla5W
 Yv6lheKNx9/xniYbPURA1wRVi0YQ80nzQ4Ec2t0lLLaCespbjVidi4r65K6W09P5PxYDbF5MZiN
 0OrokLpvKcoc=
X-Received: by 2002:a05:600c:3502:b0:45b:9291:320d with SMTP id
 5b1f17b1804b1-45ddbdd6c1emr4396435e9.31.1757065863466; 
 Fri, 05 Sep 2025 02:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlJCfZ37T0pYOnIrkKm1SPfQDFb71IAil+eiY545iqvvc8QDtKUVSTSVKkVbR6UzCgp1CggQ==
X-Received: by 2002:a05:600c:3502:b0:45b:9291:320d with SMTP id
 5b1f17b1804b1-45ddbdd6c1emr4396105e9.31.1757065862907; 
 Fri, 05 Sep 2025 02:51:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b93fae643sm168288405e9.3.2025.09.05.02.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 02:51:02 -0700 (PDT)
Message-ID: <0eb54880-e6b5-4eb8-b07d-21ca80bd00b4@redhat.com>
Date: Fri, 5 Sep 2025 11:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/15] hw/arm/smmuv3-accel: Support nested STE
 install/uninstall support
To: Nicolin Chen <nicolinc@nvidia.com>, skolothumtho@nvidia.com
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-10-shameerali.kolothum.thodi@huawei.com>
 <aHbgc8LXuuuJ/cz0@Asurada-Nvidia>
 <6110ab250e844af9982dddb230fb8707@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6110ab250e844af9982dddb230fb8707@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sQLh_GSv0jbJRTsjb9a3wtAQZEcLF8ySjfgciKpU7Ns_1757065864
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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



On 7/16/25 10:36 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Wednesday, July 16, 2025 12:13 AM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
>> mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; shameerkolothum@gmail.com
>> Subject: Re: [RFC PATCH v3 09/15] hw/arm/smmuv3-accel: Support nested
>> STE install/uninstall support
>>
>> On Mon, Jul 14, 2025 at 04:59:35PM +0100, Shameer Kolothum wrote:
>>> +static void
>>> +smmuv3_accel_ste_range(gpointer key, gpointer value, gpointer
>> user_data)
>>> +{
>>> +    SMMUDevice *sdev = (SMMUDevice *)key;
>>> +    uint32_t sid = smmu_get_sid(sdev);
>>> +    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
>>> +
>>> +    if (sid >= sid_range->start && sid <= sid_range->end) {
>>> +        SMMUv3State *s = sdev->smmu;
>>> +        SMMUState *bs = &s->smmu_state;
>>> +
>>> +        smmuv3_accel_install_nested_ste(bs, sdev, sid);
>>> +    }
>>> +}
>>> +
>>> +void
>>> +smmuv3_accel_install_nested_ste_range(SMMUState *bs,
>> SMMUSIDRange *range)
>>> +{
>>> +    if (!bs->accel) {
>>> +        return;
>>> +    }
>>> +
>>> +    g_hash_table_foreach(bs->configs, smmuv3_accel_ste_range, range);
>> This will not work correctly?
>>
>> The bs->configs is a cache that gets an entry inserted to when a
>> config is fetched via smmuv3_get_config(), which gets invoked by
>> smmuv3_notify_iova() and smmuv3_translate() only.
>>
>> But CMDQ_OP_CFGI_ALL can actually happen very early, e.g. Linux
>> driver does that in the probe() right after SMMU CMDQ is enabled,
>> at which point neither smmuv3_notify_iova nor smmuv3_translate
>> could ever get invoked, meaning that the g_hash_table is empty.
>>
>> Without the acceleration, this foreach works because vSMMU does
>> not need to do anything since the cache is indeed empty.
>>
>> But, with accel, it must call smmuv3_accel_install_nested_ste().
> Ok. The only place I can see CMDQ_OP_CFGI_ALL get invoked by Linux
Easy to say but I think we shall rather look at what the spec mandates
and not what the Linux driver does ;-)

Thanks

Eric
> kernel is during arm_smmu_device_reset() and that is to clear all.
> But I am not sure we will have any valid STEs at that time. Just curious,
> are you seeing any issues with this at the moment?
>  
>> So, I think this should foreach the viommu->device_list instead.
> But agree. Using device_list is more appropriate unless we cache the 
> configs during each install_netsed_ste() path.
>
> Thanks,
> Shameer 
>


