Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3741CD3C922
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 16:08:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTMjK-00055c-VP; Wed, 10 Dec 2025 11:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTMjG-00055F-3l
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 11:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTMjE-0004jX-Gz
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 11:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765382867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jJd2RcEojrLll/2Xf4OOUxOF8v//SIA+fVx+4tO/9fg=;
 b=RvCxK2yA5tBc8gHmZ5O5P8DPGUmYpPtocC/a1yEv1CCj/40RhcP2xkq7YyK7C6RZUu+Hwx
 FqSEmr5/pCQbObXQEpmyzKhIDTNH3qlihgfhe7we8ZuRdZtXLy2gmg7qUrk098LN4PWNHi
 OoZTc8ytnV/aJou8N7/DxHl3yAu0bh4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-X6EKBNuzN7i2OVw_1jmhpg-1; Wed, 10 Dec 2025 11:07:46 -0500
X-MC-Unique: X6EKBNuzN7i2OVw_1jmhpg-1
X-Mimecast-MFC-AGG-ID: X6EKBNuzN7i2OVw_1jmhpg_1765382864
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-b79e98a23c5so569372366b.3
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 08:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765382864; x=1765987664;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJd2RcEojrLll/2Xf4OOUxOF8v//SIA+fVx+4tO/9fg=;
 b=DJuWQEfnp8k6P+3p1YcO8uczVH2JF0WHSX3z1si5zyzwwHZL1rFZS1C9mpPRFE9EEI
 9ligW8ICk79nKNoUa4LENI2HIioCZ8SKT2dP9T3m/4WLiTnVK5OxFHOz4tQG70r7O2BN
 u99XVWtxP+ojqpxKOp7IL9imB7zV/WUJQtrCKr8e1+mrm4LfhS8eUZ5+lXx95JzVmQ5t
 M9QX694J4o+ve34+NwKTSw65vMcqpQ9Is7jax9zfavZntG5xSF1ABU/x0UWDbPfO9NBs
 /NWO+XqCftHclv68vz9aWXqQc8EBF1MZujAzNmzMgSpLcE+BEzWT4JfwtcdLMVQsTIRu
 qrlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPuW0fm4Nh9btdB0Ii9908nRbzrHjn644jV0imi2iWIbRLKr56d3k9MgjUoh0sDajjCS9fIqzaOg==@nongnu.org
X-Gm-Message-State: AOJu0YzEZM+7HZmj+wFSNXegOOyRBeTEccL9GCYrKYum7GFiVsZetmoR
 gJnnxgMPlCBV+udvDsOH8Dc/cMtI0Ww0SMsj0lrQuXCk5tWimE/gevFvE7N9xmjrDD0WQA1ye1k
 KR1e1LLZ4tJn3HujVk9kM6WrLz7GzA5A5dmHm6rngVQGqGdL/YxCVZQ==
X-Gm-Gg: ASbGncvxS52fCczrDW2Rant16HlQHiUtGvaOtQuuhMYLdzu443BAHvfcC+tIU87YXPn
 RIHI5ZRzOInuhMKQLDKpeRyWxzwC3JXjpU/4ckCEIdGsW6U2xLtHtN8+PzeB8eahGrtNFwwUgC9
 vyjpQNBkrNJfkenbA5jwOwNOFUpSNVhvNiQmX/pRxYziLLkSG1UR4/7tDqL2ajQHlFeccU2uCt+
 80Jq8VQ6NHFEcLmIIC0c4kJYqTAWCbGYUN5Wz7MV16olHbdsWRss0QtmIuMex5XXM5hO488y6dU
 MwvOq/4ilweGMffoyWmjl9ve3bBb1/iyB7hrEsfHbv14rXIKR5nuzinjGXx3hegSnZffnGR4fLg
 L3IVyi7hhKOWyO565svUME6TX1OiAbkJn+jOdDUENd74NKD1B
X-Received: by 2002:a17:906:f59b:b0:b73:2aa1:f9fb with SMTP id
 a640c23a62f3a-b7ce84d637fmr323567566b.32.1765382863523; 
 Wed, 10 Dec 2025 08:07:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwws4rzgyN0TBObeo0DwiQFPpmvGekbaxQrSJVAW/5Yeq4WFh9SrTqzOXUZSfvzGUHyWd1qg==
X-Received: by 2002:a17:906:f59b:b0:b73:2aa1:f9fb with SMTP id
 a640c23a62f3a-b7ce84d637fmr323562366b.32.1765382863014; 
 Wed, 10 Dec 2025 08:07:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f449d181sm1762991766b.26.2025.12.10.08.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 08:07:41 -0800 (PST)
Message-ID: <a2961cd3-e874-4641-9b2e-4951f265473a@redhat.com>
Date: Wed, 10 Dec 2025 17:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/33] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
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
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <1ee20ead-6978-4c2b-9b2f-ad778107ad04@redhat.com>
 <CH3PR12MB754885FC0E83EEB2A2D58D3AABA0A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <CH3PR12MB754885FC0E83EEB2A2D58D3AABA0A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TdS8jM3fP3Ihirb7K5gHMG6fBOzASYZgjOpHem6Jcsg_1765382864
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/10/25 16:07, Shameer Kolothum wrote:
> 
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@redhat.com>
>> Sent: 09 December 2025 10:32
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: eric.auger@redhat.com; peter.maydell@linaro.org; Jason Gunthorpe
>> <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v6 00/33] hw/arm/virt: Add support for user-creatable
>> accelerated SMMUv3
>>
> [...]
> 
>>
>> FYI, I am seeing configure errors :
>>
>> The following clauses were found for ARM_SMMUV3_ACCEL
>>       select ARM_SMMUV3_ACCEL if ARM_VIRT
>>       config ARM_SMMUV3_ACCEL depends on (ARM_SMMUV3 && IOMMUFD)
> 
> -    select ARM_SMMUV3_ACCEL
> +    imply  ARM_SMMUV3_ACCEL
> 
> the above will fix it?

No. I would propose :

@@ -12,7 +12,6 @@ config ARM_VIRT
      select ARM_GIC
      select ACPI
      select ARM_SMMUV3
-    select ARM_SMMUV3_ACCEL
      select GPIO_KEY
      select DEVICE_TREE
      select FW_CFG_DMA
@@ -627,12 +626,13 @@ config FSL_IMX8MP_EVK
      depends on TCG
      select FSL_IMX8MP
  
-config ARM_SMMUV3
+config ARM_SMMUV3_ACCEL
      bool
+    depends on ARM_SMMUV3
  
-config ARM_SMMUV3_ACCEL
+config ARM_SMMUV3
      bool
-    depends on ARM_SMMUV3 && IOMMUFD
+    select ARM_SMMUV3_ACCEL if IOMMUFD
  
  config FSL_IMX6UL
      bool

>>
>> KconfigDataError: contradiction between clauses when setting
>> ARM_SMMUV3_ACCEL
> 
> Just curious, how to trigger these errors easily? Any scripts?
Try the windows build :

   ../configure --cross-prefix=x86_64-w64-mingw32- \
     --disable-sdl \
     --prefix=/path/to/install-mingw64 \
     --target-list=aarch64-softmmu,ppc64-softmmu,x86_64-softmmu,s390x-softmmu \
     --disable-docs

problems such as :

../hw/arm/smmuv3-accel.h:14:10: fatal error: linux/iommufd.h: No such file or directory
    14 | #include <linux/iommufd.h>
       |          ^~~~~~~~~~~~~~~~~

should be fixed too.

Thanks,

C.


