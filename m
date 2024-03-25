Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp888368ejj;
        Mon, 25 Mar 2024 11:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmNdhyjVUKiVorkm93UmV75n1SxzDWF8C8cxLaa6OtwA+DVekXgfpm6MYtFDO5FM4mz+aIOFi+Jb5R1HvjGLaHGdgIGRu0
X-Google-Smtp-Source: AGHT+IFEHOiruly7jsnFriggs53TfjdxSVSvENlLiBXokDlL5o3iQpGlg8AwvfYH3UOW2ETg3nDX
X-Received: by 2002:a05:6214:76c:b0:696:4771:9b57 with SMTP id f12-20020a056214076c00b0069647719b57mr10986464qvz.23.1711392193486;
        Mon, 25 Mar 2024 11:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711392193; cv=none;
        d=google.com; s=arc-20160816;
        b=zqo0JQM0GC02IAuZWMM0CIrcntpDO5m6EtCvbXsp2WXJTefy42Sgey7xk3XWJsD9/H
         dXmBj7mQZbRnOBsPQBhZbw0gO8S9+FlrErnrba+YUEkJrVrXj34XvCzFoVnTgEcOERKv
         xVud1s7KQp1UD1Izwn6qYAJFRiFimmPFUEY+aSYMsJCZArmLxjJc6dFoXNAlCCgRJq/g
         mSNoSewruYY3tMrM5AcCFaRukmjYnS94bu2BqrEknkzxfrhWnzYFxTbMAmVfgDt9hE6s
         IruIlDCM7rpIxBwSe/Uxc6D/y8nJdLyydglMkrWmLFT87PPCORYRSH//y/mQoVtrz0mG
         0H2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qq8q/Mm0zNrkMDJrUiYylqwQQwleQKmqYIx8eShQrIQ=;
        fh=XyaQPGj+Sws/7DipaWy3iq7fkmOJjCiax1/xkPCQg5Y=;
        b=gwsuF78TIB5Tu0d1QzIT5s1VAG10SBLl1bTmTDMT22i0nIk6WwXLCzSQU0U/lpeuUm
         2S9Ld31Pimqv1drOWpOXHSAUqCiGyguPvlSN5tDVEfavtL8Ok4q8UsszN6Xewje0Rc1E
         eq3hyo1iz7/ZuBou8OnwmZ4WNzUi2nOw4pvpJ6n57Bhix9Q3PKkQmQZpbCy0grmcmcne
         PTFwa5x0wbIMaCI36l+qsAZnNuOI+9Z4GNzLctM+3qy29DNKRWtrO8S5qizzI4BEN6W5
         xAyLj6wIqJilw6A/COin0fHubwB5R9Fg3zvfC2kQ2fqt6YCLCVapDu/UIQO2EkrSTD/V
         yXXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL0Yxy09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu15-20020ad45ccf000000b0069697bba134si864375qvb.336.2024.03.25.11.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 11:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OL0Yxy09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ropHi-0004nO-Ss; Mon, 25 Mar 2024 14:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ropHh-0004n3-Sv
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 14:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ropHg-0000sv-3Z
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 14:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711392179;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qq8q/Mm0zNrkMDJrUiYylqwQQwleQKmqYIx8eShQrIQ=;
 b=OL0Yxy09RXsCX9x2pSrObrhlQD1j4S1v/tYUjBM0iGU37F7M/BJ858yMtGFKTIrOKuh7c2
 phW+ap1RizQJzqgCRKMJVJO2jTaS3cx3GpfSd/h9K9Y5/zzKVRT3hGxMc5rMFriTewY2CL
 QJHBtp/iGOA7ZXhrPKgOt9Fyn7ovhsA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-5zJmyBh7PfS-y1JaKv9x8A-1; Mon, 25 Mar 2024 14:42:57 -0400
X-MC-Unique: 5zJmyBh7PfS-y1JaKv9x8A-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78a087e8b70so828122785a.1
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 11:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711392177; x=1711996977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qq8q/Mm0zNrkMDJrUiYylqwQQwleQKmqYIx8eShQrIQ=;
 b=mDAfxR6t+5SpYOw8QwDfQW9z/HfPBb/SizYzn8bems//ZUkQVE0vVikwDO3XZWJAqt
 +XTNBwJJT7oKhQ1noqALH7sjT7r+71+u1GMCJa7t/a4Fzsga5I7szG4Ikvi+y15qDl7D
 b/W/njA0nQC62dp1Nz99dGcaXrpoZ/9Tjq6f/YaMjdaQShmZNQZIRyUxIYVvHTHfeKe1
 QZxCmPkmpuDxrfFU5ah4rx7SUyskrGvv/XL9O/sisM488RVbJvZPO+91a7BjvYD2HWJq
 rYRcoCFIfuJSoGViZHvpTmjK49Vz06C7yh+dUHXH5+FohOMf7Hi9u540x3Z8KeHCD6m4
 iELw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW+kHagy9+vCxi7CaW9eQ9ZEkdNiuWT98qFCE+RNUzrHITNlcfnzhnctRHSUF3SOKpIbW5f4rrVS/ol76O1eWxnpnW
X-Gm-Message-State: AOJu0YzyToH/hApPBq4lZIyo4Dx61YUZVbazGO7AfAJ5z3Ts1FiobB+b
 Tafp2JqhoZfQD5j2limVlL3vfG43kz8o+ZM5hAtU7yi97S8wTBNDTLtdu0acAAA7ghO0x5qgEGh
 zGUB1eiUWJhn2bEi7te9Ns3pSwvVKsOHL03vNOK10EqRNQ66vPQ==
X-Received: by 2002:ae9:f504:0:b0:78a:1ebf:12d with SMTP id
 o4-20020ae9f504000000b0078a1ebf012dmr11477595qkg.16.1711392177100; 
 Mon, 25 Mar 2024 11:42:57 -0700 (PDT)
X-Received: by 2002:ae9:f504:0:b0:78a:1ebf:12d with SMTP id
 o4-20020ae9f504000000b0078a1ebf012dmr11477569qkg.16.1711392176841; 
 Mon, 25 Mar 2024 11:42:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05620a148f00b00789f3e53d04sm2342509qkj.126.2024.03.25.11.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 11:42:56 -0700 (PDT)
Message-ID: <4a5e2d39-6d98-4a79-a33c-e4f144d7fcdd@redhat.com>
Date: Mon, 25 Mar 2024 19:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/5] target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is
 supported
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org,
 maz@kernel.org, gkulkarni@amperecomputing.com
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <20240209160039.677865-5-eric.auger@redhat.com>
 <CAFEAcA_y9uHa5cdtqgyneUSj=DzhDfrWc73xyr9x54tF5MedNg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_y9uHa5cdtqgyneUSj=DzhDfrWc73xyr9x54tF5MedNg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZTbywoewQVHm

Hi Peter,

On 3/5/24 17:49, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Haibo Xu <haibo.xu@linaro.org>
>>
>> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
>> In case the host does support NV, expose the feature.
>>
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - remove isar_feature_aa64_aa32_el2 modif in target/arm/cpu.h
>>   [Richard] and use el2_supported in kvm_arch_init_vcpu
>> ---
>>  target/arm/kvm.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 0996866afe..a08bc68a3f 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -238,6 +238,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>       */
>>      int fdarray[3];
>>      bool sve_supported;
>> +    bool el2_supported;
>>      bool pmu_supported = false;
>>      uint64_t features = 0;
>>      int err;
>> @@ -268,6 +269,14 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>          init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
>>      }
>>
>> +    /*
>> +     * Ask for EL2 if supported.
>> +     */
>> +    el2_supported = kvm_arm_el2_supported();
>> +    if (el2_supported) {
>> +        init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
>> +    }
>> +
>>      /*
>>       * Ask for Pointer Authentication if supported, so that we get
>>       * the unsanitized field values for AA64ISAR1_EL1.
>> @@ -449,6 +458,10 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>      features |= 1ULL << ARM_FEATURE_PMU;
>>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>>
>> +    if (el2_supported) {
>> +        features |= 1ULL << ARM_FEATURE_EL2;
>> +    }
>> +
>>      ahcf->features = features;
>>
>>      return true;
>> @@ -1912,6 +1925,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>          cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
>>                                        1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>>      }
>> +    if (kvm_arm_el2_supported()) {
>> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
>> +    }
>>
>>      /* Do KVM_ARM_VCPU_INIT ioctl */
>>      ret = kvm_arm_vcpu_init(cpu);
> Am I reading this right that if the kernel supports FEAT_NV
> then we will always ask for a vCPU with that feature?
> Is that a good idea, or should we arrange to only do it if
> the user uses the 'virtualization=on' option to -M virt ?
> (Or does that happen already in some way I'm not seeing?)
yes you're right, if the host supports it, the feature is currently set
on the vcpu. I am not totaly clear under which conditions the features
shall be instantiated in the scratch VM and when the host passthrough
model shall be altered by machine option.  

Thanks

Eric 
>
> thanks
> -- PMM
>

