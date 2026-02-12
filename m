Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A9EE36AC
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 17:12:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqaEd-00059h-T0; Thu, 12 Feb 2026 12:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqaEc-000592-Jj
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqaEa-0001Lh-JH
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 12:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770916327;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PzN1WE3GD0GND6zNm9NxG5NxpCZo4KC1G3L4q0sgVp4=;
 b=H3yhk803S+3mKVbpsN6DHwDNwrj9Czf8twzhVVS1OhfBSh+uBrmovkaHb+rx6tlaK+PW5r
 37oWbFq+IY4z0jsJyqRD+3GEsNTRr9LRUYQUfnHYQBTqZ19g163z8szJqeQ8ElUSGumyH7
 5Szyi/D/AnwCZoa6JBVCRepRMon9IWA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-JG9WeV5AM92KbKOYpM8rKQ-1; Thu, 12 Feb 2026 12:12:06 -0500
X-MC-Unique: JG9WeV5AM92KbKOYpM8rKQ-1
X-Mimecast-MFC-AGG-ID: JG9WeV5AM92KbKOYpM8rKQ_1770916325
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4376ec2b1cfso78530f8f.0
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 09:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770916325; x=1771521125;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzN1WE3GD0GND6zNm9NxG5NxpCZo4KC1G3L4q0sgVp4=;
 b=mGxp9Qb1I1kCmth2zOjQz0Kk8Z9tG1KWD4SMRbpbTSGUJO0fZOpAV7tZLvVL1NlPXp
 MdQose4FhaOITwWamRro40XYbScM4c7u1vRCzeQs5xhbLjdhl3XvQd3rIh7SjwhixpZS
 pEbzchWv7olRiH2TkKDr837yJDVAQgIZr+l95kcNtLgt/2vabtmoRXAqFovi3U/dCvFf
 FfC8wdWRbu/lDn98g/GABJNLLgv1E5v/GrO4bd9C0Rv45XeKkx7GJupZnLNu9L12dptS
 Zgpif0zPNWjt3KC4z584rrlXyh0sfk5pVizaweElBNJ45IOac/9OfuvkF0VvEC9Uji2B
 CTmg==
X-Gm-Message-State: AOJu0YxVKCsLNh4/i82njNDAP17AR/kppK69lFFhqq6YGdNogGtQD5tP
 0hBqQH+o3GOdAB+iHo5+eohDZx7zWE1+bZwmBZmEcHXTdRFlmId8OmRhS0k8SUXiMLyE1IUQpYd
 4IZhgQDEifOU02zHJk1LRBCBGlNFkQpYYBqttQ1Tqo+LIDEhpWXJGwg==
X-Gm-Gg: AZuq6aK44yXco2M2KHJGOR4wicgyw3LPGWDAstij6bkRlDEVI4cZDhQe4dcVaCzxDny
 1c5u8HXQjqrhO2afwe02Ayps9wZGWwyBGErxf+N/KB5mJQOtFPtOjXk9tgBge7+M1Jq/x/JmP1/
 p2PWqvztHqOxKiIrBBRykaBTJuCDxo6Wv1c7lZVHtqVjGBFp8G0wbsH7twgJWTFcdhGTmow9g1l
 OGFiG8t7J9T19pLzGxPLt74g0pB5q9mRbPaYDd4CRFZi+/przELfOH/R1bQ1r0nf17S+ENimquu
 pv+p0uUwDzpJdyY5ksCwTv1pcnsSfdgo7tkcQwhH2HpHzZzERFklGR18qIkhSAjubzwZTs6ZI8k
 6MoGFbuqW7WCAeY+uMXxk4COznt9D86Xt9Bz+sS7tg+P02QvWeTqyIscPg9rP/aDOa5VIFw==
X-Received: by 2002:a05:6000:2901:b0:435:b7ca:7521 with SMTP id
 ffacd0b85a97d-4378aa0cd4fmr6499196f8f.15.1770916324869; 
 Thu, 12 Feb 2026 09:12:04 -0800 (PST)
X-Received: by 2002:a05:6000:2901:b0:435:b7ca:7521 with SMTP id
 ffacd0b85a97d-4378aa0cd4fmr6499147f8f.15.1770916324440; 
 Thu, 12 Feb 2026 09:12:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d46ec6sm13514876f8f.9.2026.02.12.09.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 09:12:03 -0800 (PST)
Message-ID: <db4a1b89-aae2-4328-98b1-5233283e9351@redhat.com>
Date: Thu, 12 Feb 2026 18:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
 accelerated SMMUv3 devices
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260211083415.133534-1-skolothumtho@nvidia.com>
 <20260211083415.133534-4-skolothumtho@nvidia.com>
 <aYzFeMh1szhJlJJk@Asurada-Nvidia>
 <e66e82d6-0953-49f0-9d84-bf2776e8f3ce@redhat.com>
 <aYzJhEFg/zxtrJ8z@Asurada-Nvidia>
 <CH3PR12MB754855AE35A087B900B0C311AB63A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <aYzTUDmTzIZZCwnW@Asurada-Nvidia>
 <39acf072-3227-442b-acfe-658829071917@redhat.com>
 <aY14rcVQuLs3ugll@Asurada-Nvidia>
 <CH3PR12MB75482F20A549CD3D480226E4AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75482F20A549CD3D480226E4AB60A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nEZEzyI91-tvtt2XZHYNx8osxpltcJ31QDXENYKaRPU_1770916325
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



On 2/12/26 5:28 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: 12 February 2026 06:52
>> To: Eric Auger <eric.auger@redhat.com>
>> Cc: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> Jiandi An <jan@nvidia.com>; Jason Gunthorpe <jgg@nvidia.com>;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 3/5] hw/arm/smmuv3-accel: Allocate vEVENTQ for
>> accelerated SMMUv3 devices
>>
> ...
>>> Usually error_append_hint() is used to append a user friendly msg that
>>> helps the user to fix the problem.
>>> In qapi/error.h there is an example that relates to "Receive and
>>> accumulate multiple errors (first one wins):" by using
>>> error_propagate()
>> I didn't look very closely but just run a grep for "append" :)
>>
>> Yea, I think error_propagate() should work better.
> I am not sure error_propagate makes things better though.
>
> If I am not wrong, this is how the change will look like,
>
> static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>                                 uint64_t data, MemTxAttrs attrs)
>  {
> +    Error *err = NULL;
>      Error *local_err = NULL;
>
>      switch (offset) {
> @@ -1614,9 +1616,15 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>          /* in case the command queue has been enabled */
>          smmuv3_cmdq_consume(s, &local_err);
> +        if (local_err) {
> +            error_propagate(&err, local_err);
> +            local_err = NULL;
> +        }
>          /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is available */
> -        if (local_err == NULL) {
> -            smmuv3_accel_alloc_veventq(s, &local_err);
> +        smmuv3_accel_alloc_veventq(s, &local_err);
> +        if (local_err) {
> +            error_propagate(&err, local_err);
> +            local_err = NULL;
>          }
>          break;
>      case A_CR1:
> @@ -1724,8 +1732,8 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          break;
>      }
>
> -    if (local_err) {
> -        error_report_err(local_err);
> +    if (err) {
> +        error_report_err(err);
>      }
>      return MEMTX_OK;
>  }
>
> And error_propagate() only will keep the first error.
>
> Instead, if we do below:
>
> @@ -1614,10 +1615,12 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>          /* in case the command queue has been enabled */
>          smmuv3_cmdq_consume(s, &local_err);
> -        /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is available */
> -        if (local_err == NULL) {
> -            smmuv3_accel_alloc_veventq(s, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            local_err = NULL;
>          }
> +        /* Allocate vEVENTQ if EventQ is enabled and a vIOMMU is available */
> +        smmuv3_accel_alloc_veventq(s, &local_err);
>          break;

If you want to accumulate, why don't you use the example in qapi/error.h:

 * Receive and accumulate multiple errors (first one wins):
 *     Error *err = NULL, *local_err = NULL;
 *     foo(arg, &err);
 *     bar(arg, &local_err);
 *     error_propagate(&err, local_err);
 *     if (err) {
 *         handle the error...
 *     }
 *
 
Eric
>
> This will report errors from both paths.
>
> Please let me know if there is a better way.
>
> Thanks,
> Shameer
>


