Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp137838ejc;
        Fri, 13 Jan 2023 21:23:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJrTcBpqIT/Z+BQVDpyHeQBVPp3ZoCV0ixlH/hfr6t7ta8mHV5BcRi5L88f9o1zz6pYYxX
X-Received: by 2002:a17:906:5da3:b0:86d:bf67:a1c5 with SMTP id n3-20020a1709065da300b0086dbf67a1c5mr159107ejv.22.1673673812805;
        Fri, 13 Jan 2023 21:23:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673673812; cv=none;
        d=google.com; s=arc-20160816;
        b=QsGxgWEt10cbbXUeBw4d89Tg5Z70mQp5I12eVyGWCskVwGBjRXO4hJLxdfkUMmOM2G
         d3aEOEmO1ALSdHVquExLbO3h3/CS9O8o+rTzn2ZjVVuYrDuyT0Iw/53bBYXJDU2z/bws
         FniWAgKztSfQDkQvEF+KUJGb4RN1798ZxetuXLYxlqiHSSdUhj306tL8QZKUB6DRUYFt
         irn0NAJRpymA6AzEWdVLQJv3k70a7AJGybH/utPGCrmY6DJUjI17G1QGHhBAmqk+GUge
         Ikkq+fwzCgtn03jW6zCeqCuqHay4KqqcfYvnHrrglMCm9bYhHtRwuVnfJAt5iRyMy97l
         tFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=HJS9xVv4/J7tNPXn+GQ+26s6z9YeJxqfTgmPHKGAKoc=;
        b=XRlXGCSf2X4MZRglCER8T2ZBzM41zbVYPpmVsI17s2zptiA1lF6O+449iEPq2gTv9C
         q/f6EppHT47iUJ2TXXI+T5RHfh1Yx9aANQdXYhWhS6oNU002H4gyIXRFl1lpGay3LJQm
         oRmcy470BOhFu2ETwERi45hXvQM2dMQj/+DUel4gglCCj0PWuHQwYVcIgzHwkVTh8Dt4
         uY/MREXKFUrwqTUYfhXwKBU7BBImnmATvpYVBiAbyBO/M2p2bvuyiHrKIaL3RjsUj6SY
         V9fpoOvtfWysmJs5AXiYwRO7sBZkvD60SrN/iaNbvzd1+7MaGch3k5axFU7/oDHi3BP5
         sqtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HfXs/+GL";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id xb13-20020a170907070d00b0081a9c3ca4c3si23827413ejb.374.2023.01.13.21.23.32;
        Fri, 13 Jan 2023 21:23:32 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HfXs/+GL";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjANFXa (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Sat, 14 Jan 2023 00:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjANFX3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Jan 2023 00:23:29 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB6235B8
        for <kvm@vger.kernel.org>; Fri, 13 Jan 2023 21:23:28 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id dw9so22939198pjb.5
        for <kvm@vger.kernel.org>; Fri, 13 Jan 2023 21:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJS9xVv4/J7tNPXn+GQ+26s6z9YeJxqfTgmPHKGAKoc=;
        b=HfXs/+GLH93iFYMGOaHO50H1DJTnlLpxu7kdWGMqiAYJ5YAu5pjGhBmmZT3gSGTIyH
         X0A6jY7BecSkgJ2lSI3Ry0MRgrnHuxV5bbvVs/K482DZGXrAt/yXgLlEO5kvzBvbXCUz
         GbEP7/FWE2VIVn0NMsKfD1jpkMk5voKpBrvv+14E5soU1L2U5XqQjI/GnWG8mhasnm9l
         guxEKp8dbicXZ+RYWJ4EZsbjmiJfDdx+1gK4Drcw18ufxaNUlKDYEoi+e4AVkiwf1jIy
         BHGmLA9AkgX1qMb37d/xfXZH3mirHZ4WD3oiHlM+er/EymNoZGcOejcOOpLNoIVj5Pmz
         dTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJS9xVv4/J7tNPXn+GQ+26s6z9YeJxqfTgmPHKGAKoc=;
        b=DWRdbIzJ7iCKj7sKwFX1uEV+7Fg5TSwf9mOg98/vbbAxSEdvmDvmUYyniJmw/znv01
         Y2JgeVRkhthH7y/09cwrcySRUTjkc+sRzsFWyHnfzFxgt7KXXbjeqGFJvo1amfjwb8zG
         lgtLr+2hE9jZp4cD62jJqBYPrBOoyYvunYlPCzkHutGDCw7DjLl46Qgm+d7k0cLfvZ91
         SiCVgUxYaifekzi4nR1UqGO/rpBuZVC4k54YiCTsGlg5trYZP5DCGQ2qhrqJoBQsawCL
         1b0zgQPvu4okoIeTbCFRURIU2YPNc9wuRu5PZOBql4u5S9nXSBmtB2sjHWqI3eGSiEXP
         W2cA==
X-Gm-Message-State: AFqh2ko+n6vMGschk7+iZKZHQRoR3S+TslJP2O+Yk3tnYr3gcoi8SGNO
        sEAkjO0NFJwlamRFwAXMApy3mcK/d64JsZZm
X-Received: by 2002:a17:902:b493:b0:191:3a8f:809 with SMTP id y19-20020a170902b49300b001913a8f0809mr78207941plr.7.1673673807810;
        Fri, 13 Jan 2023 21:23:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id o9-20020a170903210900b0017fe9b038fdsm15154029ple.14.2023.01.13.21.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 21:23:27 -0800 (PST)
Message-ID: <481867e4-b019-80de-5369-9a503fa049ac@linaro.org>
Date:   Fri, 13 Jan 2023 19:23:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/kvm: Specify default IPA size for arm64
Content-Language: en-US
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
References: <20230109062259.79074-1-akihiko.odaki@daynix.com>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109062259.79074-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 01v7LP3oDxZr

On 1/8/23 22:22, Akihiko Odaki wrote:
> libvirt uses "none" machine type to test KVM availability. Before this
> change, QEMU used to pass 0 as machine type when calling KVM_CREATE_VM.
> 
> The kernel documentation says:
>> On arm64, the physical address size for a VM (IPA Size limit) is
>> limited to 40bits by default. The limit can be configured if the host
>> supports the extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>> KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>> identifier, where IPA_Bits is the maximum width of any physical
>> address used by the VM. The IPA_Bits is encoded in bits[7-0] of the
>> machine type identifier.
>>
>> e.g, to configure a guest to use 48bit physical address size::
>>
>>      vm_fd = ioctl(dev_fd, KVM_CREATE_VM, KVM_VM_TYPE_ARM_IPA_SIZE(48));
>>
>> The requested size (IPA_Bits) must be:
>>
>>   ==   =========================================================
>>    0   Implies default size, 40bits (for backward compatibility)
>>    N   Implies N bits, where N is a positive integer such that,
>>        32 <= N <= Host_IPA_Limit
>>   ==   =========================================================
> 
>> Host_IPA_Limit is the maximum possible value for IPA_Bits on the host
>> and is dependent on the CPU capability and the kernel configuration.
>> The limit can be retrieved using KVM_CAP_ARM_VM_IPA_SIZE of the
>> KVM_CHECK_EXTENSION ioctl() at run-time.
>>
>> Creation of the VM will fail if the requested IPA size (whether it is
>> implicit or explicit) is unsupported on the host.
> https://docs.kernel.org/virt/kvm/api.html#kvm-create-vm
> 
> So if Host_IPA_Limit < 40, such KVM_CREATE_VM will fail, and libvirt
> incorrectly thinks KVM is not available. This actually happened on M2
> MacBook Air.
> 
> Fix this by specifying 32 for IPA_Bits as any arm64 system should
> support the value according to the documentation.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   accel/kvm/kvm-all.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index e86c33e0e6..776ac7efcc 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2294,7 +2294,11 @@ static int kvm_init(MachineState *ms)
>       KVMState *s;
>       const KVMCapabilityInfo *missing_cap;
>       int ret;
> +#ifdef TARGET_AARCH64
> +    int type = 32;
> +#else
>       int type = 0;
> +#endif

No need for an ifdef.  Down below we have,

     if (object_property_find(OBJECT(current_machine), "kvm-type")) {
         g_autofree char *kvm_type = object_property_get_str(OBJECT(current_machine),
                                                             "kvm-type",
                                                             &error_abort);
         type = mc->kvm_type(ms, kvm_type);
     } else if (mc->kvm_type) {
         type = mc->kvm_type(ms, NULL);
     }

and the aarch64 -M virt machine provides virt_kvm_type as mc->kvm_type.

How did you hit this?  Are you trying to implement your own board model?

Looking at this, I'm surprised this is a board hook and not a cpu hook.  But I suppose the 
architecture specific 'type' can hide any number of sins.  Anyway, if you are doing your 
own board model, I suggest arranging to share the virt board hook -- maybe moving it to 
target/arm/kvm.c in the process?


r~
