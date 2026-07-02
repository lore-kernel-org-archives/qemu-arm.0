Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54451C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 13:15:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfHGC-0000dv-3u; Thu, 02 Jul 2026 09:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHG5-0000bZ-Cm
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHG3-0007g0-FR
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782998109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X8jfvXqJvjTl5eMJrgsH0/YnrKOsZNe7DWbKjldetr8=;
 b=BdOQ9oGG1MXFHjaCOtncMun6i123gItgk7wEXGI0J5wLbWjuMZiuBtrIpXeUP6036bkE74
 i5qbk5iGvDn1mWdHIuUH86cWUL3upZiMvuTraBVS3Cpl5BDXICHIZh0flWuXl0+HKnQzpe
 JGYqp1KLYX1jzAfeA0RXY5auLS+FrCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-OyxqGZjFP9a1dN3nyTCuKA-1; Thu, 02 Jul 2026 09:15:08 -0400
X-MC-Unique: OyxqGZjFP9a1dN3nyTCuKA-1
X-Mimecast-MFC-AGG-ID: OyxqGZjFP9a1dN3nyTCuKA_1782998108
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-472c330e555so898905f8f.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 06:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782998107; x=1783602907;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X8jfvXqJvjTl5eMJrgsH0/YnrKOsZNe7DWbKjldetr8=;
 b=hGPfCvTSiki5w4F3P0jnHxt5mfGDpHCBE7RzDwKPuOp6uzGSFNQ/vXfj/4rIvse9sR
 h599mREonE5Jr3r+hAGDGTwMgMc84t8o9PT4qbK8N0P5ZnGFxdd3YV7ipG+E+rqa5RHg
 DoL2/F7mxQ+YndI35pIdxbk4ZlD0At3R3U9FnePcIJWVs5WCmUvUw6LR69vQ3H8Up2Fs
 82fogoXsFmEfijXk1PwwNJ0c5QJqq8x/fBc9L3CdGL3z8u8vIOG7P4GdEzfTEZubJpr+
 tvM+gCu/RaDGcnsU4tuACQl3nOOVyxNjvzW9IbWBWVOBoukOvLg3OjWfGH+0BPmFgt4K
 SFYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cTrKmBkZEbv+LWHal3mMioIN9xDZYyijce8mN3AvOnJ8ztqlRUI3dEdr1bsUBoo4OA5NaB/hJ4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz9mXIkEwjvXnflQ4mSRt8ZMK2pf7WOULjjenmbk+3lFptPumWv
 725q55gpK8a43Jp0sFC5usCnmzcjml+7Lx/wrDpZyby4akrT/PbbPm3B6Vi/q3Qk1tJ3QCv9k5Y
 jyCoCEbVECwUb3Ky3BfQ+CfZMTPW9XE1w5/zamGN34LBHdVQ/FvMQBQ==
X-Gm-Gg: AfdE7cmFB/ulQ9BLNG4fn9F0rpQ8jMPOZ6fgv2Btukwat+gphfZh9FywJ4BFw6736P7
 Cc3rpsw2xliCZlT+MroOS/CR3xI7HbEk9SdRrvZKMY8vJ3TresIe35QBFlimiyZ3Wjp8VcKW6zF
 9cpY4Qe3CY2/FQn/TouS+0YAQ4ruX4d4EihpidFOgxID0mA8ZIQGhwjofzV6rV0dqBbbF0hpvmT
 wE2atovgPqfaakSReispohQejuIAkzsg6Lhm5AL8otGcnL+g73WsiZb578KKSyBeACj5L6Nucqp
 2LZpwUUXfCIrRlVZmesOu3umgJ06UaZZmsK9Sa9BaEiHiZ826PzOWr9HrQV3DgRr91NsOzTKAKM
 TRWGR2cNOtE7I03ajN5mSsQX+gfWKpE9K9f0dBv8t8jNJCYfnAjA2iEvLHRq2
X-Received: by 2002:a05:600c:1553:b0:493:c310:4106 with SMTP id
 5b1f17b1804b1-493c31041f0mr73355265e9.35.1782998104731; 
 Thu, 02 Jul 2026 06:15:04 -0700 (PDT)
X-Received: by 2002:a05:600c:1553:b0:493:c310:4106 with SMTP id
 5b1f17b1804b1-493c31041f0mr73351245e9.35.1782998101214; 
 Thu, 02 Jul 2026 06:15:01 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c6372c52sm55045165e9.14.2026.07.02.06.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:15:00 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:14:59 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/3] arm/kvm: get demuxed ID registers from kvm
In-Reply-To: <2c83f650-bfb5-4c59-aa62-db64ba81db81@redhat.com>
Message-ID: <61a26518-832b-c1c5-f5be-868da2adf4a8@redhat.com>
References: <20260622135627.40573-1-sebott@redhat.com>
 <20260622135627.40573-4-sebott@redhat.com>
 <2c83f650-bfb5-4c59-aa62-db64ba81db81@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0le01SJCoYov0tgGRqmBWNa9ciZwiBXPDsgvulsKOuE_1782998108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hey Eric,

On Mon, 29 Jun 2026, Eric Auger wrote:
> On 6/22/26 3:56 PM, Sebastian Ott wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> We now have the infrastructure in place to handle demuxed ID registers
>> from kvm. Use it to get the values that kvm emulates for CCSIDR_EL1.
>>
>> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  target/arm/kvm.c | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index a54ef51ec2..059d361d88 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -244,6 +244,33 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
>>      return ret;
>>  }
>>
>> +
>> +/* CSSELR values; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
>> +#define CSSELR_MAX 14
> where does this value come from? Worth to document

It's a kvm implementation detail..

>> +
>> +static int get_host_cpu_reg_demux(int fd, ARMHostCPUFeatures *ahcf,
>> +                                  ARMIDRegisterIdx index, int subindex)
>> +{
>> +
>> +    struct kvm_one_reg one_reg = {
>> +        .id = KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX,
>> +    };
>> +
>> +    switch (index) {
>> +    case CCSIDR_EL1_IDX:
>> +        if (subindex >= CSSELR_MAX) {
> Can't we introduce a macro that gets the size of the DEMUX register
> instead of hardcoding it?

Not really. What we can use with kvm is less than what we have for tcg.

>> +            return -EINVAL;
>> +        }
>> +        one_reg.id |= KVM_REG_ARM_DEMUX_ID_CCSIDR | subindex;
>> +        one_reg.addr = (uintptr_t)&ahcf->isar.idregs[index + subindex];
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return ioctl(fd, KVM_GET_ONE_REG, &one_reg);
>> +}
>> +
>>  static uint32_t kvm_arm_sve_get_vls(int fd)
>>  {
>>      uint64_t vls[KVM_ARM64_SVE_VLS_WORDS];
>> @@ -286,6 +313,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>      bool pmu_supported = false;
>>      uint64_t features = 0;
>>      int err;
>> +    int i;
> nit: you can declare it directly with the for (int i = 0

Done. Thanks!
Sebastian


