Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E097C606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ADxRTTPA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMRXH-0006QQ-Uw; Thu, 29 Oct 2026 10:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xMRX2-0006Mt-9m
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xMRX0-0000jI-45
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793285704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1udsHb1Qa6RVVlGmmeUVSgZ2JeJYdPa+1ESuEtToCs=;
 b=ADxRTTPAIfMAhdQzb+7/rnOaLsB8wTXW6k1QfKEBsLeczQp4MYzC3cvR1eDzs3ydHEGkT/
 TlzmCMWj6k0S8VTnHK0hEroHDG39jrvLEq7QVHdj4WZcdn2nkfkjoj46PfF8aQCmH8xVIF
 wAdGp4c+XVlRZBO5eYzT/Xm6Oi4tiY4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-HRyf9KmQPDqgClRjJWuJ5Q-1; Thu, 29 Oct 2026 10:55:02 -0400
X-MC-Unique: HRyf9KmQPDqgClRjJWuJ5Q-1
X-Mimecast-MFC-AGG-ID: HRyf9KmQPDqgClRjJWuJ5Q_1793285701
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a2063be13dso19478765e9.3
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285701; x=1793890501;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=G1udsHb1Qa6RVVlGmmeUVSgZ2JeJYdPa+1ESuEtToCs=;
 b=pm/eAUW4w6aTj7zrQWJjCVmER0Ob46Lq1NNIfpcO6oQeOc6Xy3qqlwBJQpCUnZN4Xk
 Au1NXZ/EaIoMsPwUH3z/adTetZZ6VAGUSzEJrJ+blPnb0ERLmcTp3ZB7WGJmEbJmDydX
 X8Ur142iq5u4ehK4ETEXa8fkcNdtJe1dOej2FVRu29KV6qZapAwm7JGG5aF7pymKd3Bn
 zDpmN4bs4vgwDMAi6Igk95gSW4+Hd9qSqzm+ZrhuzLw5ozMS9Ri4Hk5x7kLzfn3/Oode
 GHA/j3oWJjTA9afWZiNgj4qPgwX2e3uWsh4EGkjTyHGcV0XzrGEx5Z5MQd94gXflLAE5
 0mtQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByTJQWSrjmgE/PaEfZ6hOfl+VmIXbIxitRfY1703Tto4Cuqb2sZZ7WASWNKO8iAncBQ+6yWoCX8xQ==@nongnu.org
X-Gm-Message-State: AFq9FYLj6wStOG9dNPUDVDHVumiXMhO6MJIGoQxKK8EJnZf4qGUf1cJF
 yfepQ60jL1P7E4cm/jX0IG5HT/UegEDMjLyM6YOBJ0bGMcv+7M7tigmkg9TJnutBzRKkD/Bi/8L
 cRm4slkM9FmK6P5GDYFkXAmrXO/+CEJIW1eeAi/JqcX/7SjU/gT/OKw==
X-Gm-Gg: AYBFou2hugulE5wmY6CuCibadsvGSn9oeAYxwi6yvc8rFvwsPwBbfn7qJRBRQA6Cy8r
 8ejzVgpkip0aq/mslpS65x2QPod+sthzU8KgvgZ8nUeENc6VG+T8h+MUE8FOQgS2Mo1P5qUF47Q
 UuBLrGi5/PP0OTv2CMReYZWFAYOmFE053YQoq9NRnosyjxmThnWWfXuJo//CwmV3qBXeFZkVmWe
 lH2Ny6E9ARwqaQdhi+EA1IljKQ4F8gzwdzhwY/0BgQsyWZDWjIfqwx0Q352CuNQUw+LEdK+AAd2
 CqxXdzQ8O1j7ckBskVdi5i7g0XqK91g0sci/GxODRYEOXOy2Kcam0eWfZcJOWQdg30vuJPesKih
 VyHbUnNstpQshf0lE110rSIhvZqb12KTrtgT4F8LdW4F09BU7OtRggSeneu7eZLFw7JOwBFNy9d
 lY9Cn5zp9LRvtRWlvu1h+Dzg==
X-Received: by 2002:a05:600c:1d26:b0:4a2:1612:636e with SMTP id
 5b1f17b1804b1-4a965ec952bmr131599105e9.5.1793285700839; 
 Thu, 29 Oct 2026 07:55:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1d26:b0:4a2:1612:636e with SMTP id
 5b1f17b1804b1-4a965ec952bmr131598495e9.5.1793285700462; 
 Thu, 29 Oct 2026 07:55:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f4188f4sm67573025e9.4.2026.10.29.07.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:54:59 -0700 (PDT)
Message-ID: <48af9561-c3e3-4f8b-9301-f15bd7b317c6@redhat.com>
Date: Thu, 29 Oct 2026 15:54:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 5/9] target/arm/kvm: Pass an error handle to
 kvm_arm_create_scratch_host_vcpu
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com,
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com,
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn,
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com,
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, armbru@redhat.com, mbawa@redhat.com
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-6-eric.auger@redhat.com>
 <CAFEAcA-v2s39f5n0b+9ZD4QHd5irxUwqzUfsYUb8x0GTqU_z4Q@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA-v2s39f5n0b+9ZD4QHd5irxUwqzUfsYUb8x0GTqU_z4Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pkSSCt8m2InCy5DxixCEBr4iBsZEnKSsGhtyz3YcjOQ_1793285701
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

On 10/29/26 3:37 PM, Peter Maydell wrote:
> On Thu, 29 Oct 2026 at 09:23, Eric Auger <eric.auger@redhat.com> wrote:
>> This allows to report a precise error message if any error occurs.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
>
>> @@ -371,7 +377,8 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>          features |= 1ULL << ARM_FEATURE_PMU;
>>      }
>>
>> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
>> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init, &local_err)) {
>> +        error_report_err(local_err);
>>          return;
>>      }
> This isn't supposed to report an error here. The caller of
> this function is kvm_arm_set_cpu_features_from_host(), which
> sets cpu->host_cpu_probe_failed for any failures. That is
But is there anything wrong output an error? Added errors are related to
- Failed opening /dev/kvm
- Failed creating the scratch VM
- Failed creating the scratch VCPU
- Failed getting the preferred target
- Failed the init of the scratch vcpu

all of those are practically tagged as errors, aren't they? So does it
add any spurious msg for something that is supposed to be normal?
> later checked by arm_cpu_realizefn(), which reports either
> that you didn't use an accelerator type you should have or else
> the rather vague "Failed to retrieve host CPU features".
>
> If you want to make that more specific, I think you need to save
> that more specific error information instead of the plain
> boolean host_cpu_probe_failed, so you have it in arm_cpu_realizefn
> where you can report it up.
Maybe I can store the error handle instead?
>
>> @@ -2653,8 +2660,10 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
>>  void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
>>  {
>>      int fdarray[3];
>> +    Error *local_err = NULL;
>>
>> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
>> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL, &local_err)) {
>> +        error_report_err(local_err);
>>          return;
>>      }
> The only caller of arm_gic_cap_kvm_probe() is qmp_query_gic_capabilities(),
> which has an Error parameter. So here we should be passing the error
> up to it to report, not reporting it locally.
makes sense.

Sorry I sent the v2 nearly at the same time you sent this ;-)

Thanks

Eric
>
> thanks
> -- PMM
>


