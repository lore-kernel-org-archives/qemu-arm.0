Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CBFCAC5B0
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 12:28:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4IPy-0001qD-J9; Thu, 02 Oct 2025 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4IPv-0001oo-8d
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 08:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4IPo-0005To-V1
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 08:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759408081;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rFOj97qj38f//+FgXYjk95Fy8po6/WBLsb31mdg278=;
 b=ZPcu1gkPrbIFftturp8cj19/KZUMf3ZJjiSw89zVdSXritiWnoyPNBGl8wqpjURn4bXKhM
 B8YxA6Y8hSGzSptx1in/iccakIsOG39rekGLc75OeBdI4PjHhdFC2R43XS85oPQxwvhIJy
 QutYeCwAWEig170GKwGJw059O9WDHQo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-JMCAFs1VNJiybnn7ITVM5Q-1; Thu, 02 Oct 2025 08:27:58 -0400
X-MC-Unique: JMCAFs1VNJiybnn7ITVM5Q-1
X-Mimecast-MFC-AGG-ID: JMCAFs1VNJiybnn7ITVM5Q_1759408077
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e4c8fa2b1so3809335e9.0
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 05:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759408077; x=1760012877;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rFOj97qj38f//+FgXYjk95Fy8po6/WBLsb31mdg278=;
 b=s/pJUEVB+FFEEwaExlfxewdJsl8BR1BVrUx/TUolVEU2wdOdrJUAXIAhCu4WAPA4DT
 GEs5sJlqjA2lBIAhLeuwCqDbY/+XUJEucb2MVGyfILVn0+FQ2MaOBHM96+nHW5ie/q6b
 FQKWbn0Qi+OsxZXL6uhal25BqqiPRD6KOSrFhgz2M5WTEJcnOO8XIjzOBhuhkSkaaaHz
 /wNJ6578syb2/ZO6FMelhsjvvf1lNhfXuIcuEATpVaGwNzawxoPgNHb7rYTKBM1OGa95
 /H7f+4MM5s6KHjfZOpivheADhB3AtsJAh50TJWuQXwgF2R+L0jJ0sFMlSzyUNFDBw1C9
 EupQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDC/bZbSJcPrbm3j+YfR9rRbAPMZPXPHPZj8QgXIiHoqFnZc8EPwTARJjTVz5cmY6oZkd/0WtW4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxv860uB68IuyD7cR0qFOSRAP6MAcqdhvxFS6OKIR9fLH+Lzd0Y
 3huF9jVXc5BGsSA3RctmY6VEsJfyzSuuUt8bO9MrZixtBrH/g4nWPLGD4yMfrrD40DcNTTTvsRj
 D5frGhXV6m54+88j3C6z1HVKjYngLeEf0v8Wv32pXVNxQDVM4EgSeOw==
X-Gm-Gg: ASbGncswSzzkF+B1MkXQy6LY8D5sTl2N+PoVYdXq4bxCA0dFhRu2iVlrvwe0hKXdQwh
 BFoipVVjN9lGJgYFCw0TSIGJEavUFzifIR2CY2l4/o2Sa2152E1mZKSuIoIcPYp1zSV/B+oKIto
 h5IvYsAoCkqfN/4iykX7orSIGCpuK83+Tq7W4QApc5bDeJHnMd2OBDt5LmnoiCCD81tCrtQpLb5
 e1viDiKZsRX5GpwAL3urG9va/FrMQYjTnpiuqRX0gnY2E4oKfDZ0ZIKlenqySJsrkJzxpuUB73Z
 w0gOh8VN02/yaHLmCGKSPTpV+ZN8NrvUosTAMbNNwZvlQXTPnASe78cZD+sLzmqHw7Ls0O+dfRA
 SF9V22jyXhpC1tL6H
X-Received: by 2002:a05:600c:c162:b0:46e:376a:c9db with SMTP id
 5b1f17b1804b1-46e612dd058mr56266155e9.26.1759408077284; 
 Thu, 02 Oct 2025 05:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCOb8ysezD9VaG+UpYqBWzCScwHz+Kh/zZBhNi50UU0eQ17iEz+PDmBOCZDOter6FuLKjySA==
X-Received: by 2002:a05:600c:c162:b0:46e:376a:c9db with SMTP id
 5b1f17b1804b1-46e612dd058mr56265935e9.26.1759408076768; 
 Thu, 02 Oct 2025 05:27:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b7e37sm79856835e9.1.2025.10.02.05.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 05:27:56 -0700 (PDT)
Message-ID: <86a647b1-5ab8-4064-968e-e3f5def81ee3@redhat.com>
Date: Thu, 2 Oct 2025 14:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/27] hw/arm/smmuv3-accel: Support nested STE
 install/uninstall support
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-10-skolothumtho@nvidia.com>
 <a0a149c6-e05a-40b1-87dc-c4a9470a85ed@redhat.com>
 <CH3PR12MB7548BF0AE78D2DE5FA0E3102ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548BF0AE78D2DE5FA0E3102ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _nwmIgUR7wNBBsG_ooEytcUvytjiKbgU1uPIOR6J_g0_1759408077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/2/25 2:08 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 02 October 2025 11:05
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 09/27] hw/arm/smmuv3-accel: Support nested STE
>> install/uninstall support
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Allocates a s1 HWPT for the Guest s1 stage and attaches that to the
>>> pass-through vfio device. This will be invoked when Guest issues
>>> SMMU_CMD_CFGI_STE/STE_RANGE.
>> ON set both alloc + attachment are done. On unset you shall explain the
>> gym related to config/abort hwpt. Those are S1 hwpt, right? I think this
>> shall be reflected in the name to make it clearer? In the previous patch
>> I didn't really understand that.
> Ok. There are three HWPTs in play here.
>
> BYPASS HWPT
> ABORT HWPT
> S1 HWPT --> This is when Guest has a valid S1 (STE_VALID && STE_CFG_S1_ENABLED)
>
> In previous patch we allocate a common BYPASS and ABORT HWPT for all devices
> in a vIOMMU. We reuse that here in this patch and attach if Guest request a S1
> bypass or abort case.
>
> The S1 HWPT is allocated as and when the Guest has a valid STE with context
> descriptor and use that for attachment.
>
> Whether we can call them S1 HWPT only, I am not sure. Because, I think,
> during alloc() call the kernel allocates a Nested HWPT(IOMMU_DOMAIN_NESTED)
> which uses a Guest S1 nested on a S2 HWPT.
the role of BYPASS HWPT and ABORT_HWPT must be better explained I think.
Same in previous patch. I understand they abstract stage 1 in abort or
bypass. I think we shall better explain what HWPT hierarchy we are
putting in place refering to the kernel uapi (and not kernel internal
implementation). Thanks Eric
>
> Anyway, I will rephrase the comments and variable names to make it clear.
>
> Thanks,
> Shameer


