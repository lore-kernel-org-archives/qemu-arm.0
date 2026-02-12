Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59927EE3698
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 15:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqYdP-0007kz-5C; Thu, 12 Feb 2026 10:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqYdN-0007kS-U0
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 10:29:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqYdM-0000vd-CY
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 10:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770910174;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7d0bws1k/lRL4L21yPFxA5JhKetr6tv4SA7mi55GBB0=;
 b=ZqwjHO/8lcZbkhs2C5rbld6A7xCJLvy8d85q/uolie/O/1ytIj2MA+A73qTc8V1D/I9NPg
 T8BtdOGtBQ6/SLDqYvsY6dUELUwxyllNb4NBpr95Dmuouonkg9e8dsxw72A0SDPf+6gHey
 Hlvw4mbEq73xl488LOMBF1eG0/NeKn4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-wyQod7FZO-map3yMaFUF7w-1; Thu, 12 Feb 2026 10:29:33 -0500
X-MC-Unique: wyQod7FZO-map3yMaFUF7w-1
X-Mimecast-MFC-AGG-ID: wyQod7FZO-map3yMaFUF7w_1770910172
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4830e7c6131so55728205e9.2
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 07:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770910171; x=1771514971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7d0bws1k/lRL4L21yPFxA5JhKetr6tv4SA7mi55GBB0=;
 b=qSNO62b4iKSkxmK+kfA7EEbvDx7DqFmTQimkXnV4NKJ8GItfyeetBrU2wEtw7oWi3W
 +S3XRMSsszu5mEB6YHp12COeHwg2HHKhgAl6qP6GkuoHpulrI+kcqV3ZuRReW5yutNFz
 CujTCyzQfiP39zLaGwXWcVStINPmUyIfWHkIgLrqCVrpl5CKE6mGye9h4/BxCaqGfCYV
 JEk0gBOux6A2aqlPxNP3v6c9WsuJN09adMtyPSpa0d21dK3ge42ArECEq38WC0IaILvi
 Zjiii8VaiGog0WGDOi7Iffb/G2c0fBPCH4PS+akcckvRFI2DGeSt/5/mLXCLhKUDUF+v
 lrdA==
X-Gm-Message-State: AOJu0YxfojqIhlS+T6ezk0lOiq8/pnM0Dx22gpxjEFerE793GiLt+eYF
 yxN3K+5+vbHsRcXn6zMmTi8kkBtgT7U2U+IiOV7YyIndmt3vde31dB+Db1ojCiIVso6YD0dXjth
 b++RAtQL2T39EVu+JHNHpHfGx4Jh8gMhnsUFmwgn5UIJArBUHsOlJdTsb9q8gWw==
X-Gm-Gg: AZuq6aLX/Pk0vy1AIpTef363gknRyA13/uei1wN5mDvVqf4aK/l3q/X5eAojSOPBq4R
 zPcHOJced+vqEFeffr6MtYI5a/6qZ0m1+fWz86wMBcOPTfBeurmAlg3PPW84jJhKD0nt7oRkzIW
 wsB+kVQPpe/lF9DjvliU08gveW1hC0mYvmURUyjgk9i8WmOWMnjE2uMmJSkoWYc2E4YMn3mB26g
 ogXUf53WH9tDsKzxcnU+/LWVysZL4l6zyARkRvtGROm+gK+L7vM5Sl6erpH1MELSFuO8fgEqUBO
 t1nuqlOmBfnss7XBtghmC1J4wdek4zPxI8wCDAXGoEBJh7XpJtBY9EEqg4IJEXhMfj2iQkf5Y2i
 Y1qvO/tb0jefWcDrJOqEfp+FgP9XUlRS8R132zNBfWaSDffqpFCafJdVHWah3PihV5Q+hNQ==
X-Received: by 2002:a05:600c:348d:b0:47d:3ead:7440 with SMTP id
 5b1f17b1804b1-4836571680emr47009635e9.32.1770910171456; 
 Thu, 12 Feb 2026 07:29:31 -0800 (PST)
X-Received: by 2002:a05:600c:348d:b0:47d:3ead:7440 with SMTP id
 5b1f17b1804b1-4836571680emr47009145e9.32.1770910171008; 
 Thu, 12 Feb 2026 07:29:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4378e122df9sm5741507f8f.15.2026.02.12.07.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 07:29:30 -0800 (PST)
Message-ID: <c9f728a3-1bd9-48c8-93e3-463fba94e130@redhat.com>
Date: Thu, 12 Feb 2026 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
 interface
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-6-skolothumtho@nvidia.com>
 <aYo4n4N3dW1OLzTk@Asurada-Nvidia>
 <CH3PR12MB75483C2BA4EDC24CA0F78A4CAB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <46d3b859-6e05-4c03-8e77-0aa76629f772@redhat.com>
 <CH3PR12MB7548F06A2BB9C009FD2043F2AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <dcde8f24-7523-4e2c-8ce6-4048d3ca9c7c@redhat.com>
 <CH3PR12MB7548A87A5BC62C6D90501947AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548A87A5BC62C6D90501947AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cJVYKxLQx7o5aQDnrAVOz-Q_sAjobCwCq9HF_9-h-lk_1770910172
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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



On 2/12/26 4:05 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 12 February 2026 14:57
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; Nicolin Chen
>> <nicolinc@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jiandi An
>> <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v2 05/24] hw/arm/smmuv3-accel: Introduce CMDQV ops
>> interface
>>>> I had
>>>> the impression you reverted to a fallback impl. If there is
>>>> specialization, I still think ops are relevant. Eric
>>> There is no fallback implementation. So just to confirm, you are suggesting
>>> to remove the ops completely or just keep the ops for reset/init only?
>> Depends on the code to come next. If your reset and init really differs
>> between normal accel SMMU and vcmdq enhanced accel SMMU, to me it is
>> still relevant to have separate implementations in different callbacks.
> It is not an either/or case.
>
> The vCMDQ path does not replace the normal accelerated SMMU init/reset.
> Instead, it requires additional init/reset steps on top of the regular accel flow.
>
> if (accel)
>     accel_init();
>
> if (accel && cmdqv)
>     cmdqv_init();   
>  
> So the vCMDQ logic is an extension of the accelerated mode, not a fallback
> or alternative implementation.
>
> I think the later patches in the series make this clearer.
> Please let me know if you still feel the ops necessary.

Well I am concerned by the lack of scalability overall. Until now this
was more or less generic. Now we may have several implementors coming
with their own implementations of even a vendor will come with several
generations: today it is tegra241_cmdq, tomorrow we will have
tegraxxx_cmdq, arm_cmdq, ... How to get prepared for this mess? Will we
have a property for each one?

Eric
>
> Thanks,
> Shameer


