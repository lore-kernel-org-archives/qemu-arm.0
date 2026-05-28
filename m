Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC98CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 17:31:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSeZq-0004iD-Ip; Thu, 28 May 2026 13:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSeZn-0004hH-O0
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSeZl-00017X-99
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779989479;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0MvIsOMtx2WQpp0fYhvBDybCxrQLnoGgi8za0wNTLo=;
 b=ig3/dNXdH4sUCKvalY/vn2vyWhwq3YVVwOmGIv091NPUwWXIZwa2AZAhS1rUDncLL1p54f
 4nvuWhho1Jhef1oq2tQLKxNmu0vJ4XOqeJG3aAxDCRXGMcVF+z+sXy5wN+dHNcjIbnRdx3
 M8V+/D/kuPItKle61f61uT5T+JXFEeM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-POxLWIscNmazVj6t_-aLFw-1; Thu, 28 May 2026 13:31:17 -0400
X-MC-Unique: POxLWIscNmazVj6t_-aLFw-1
X-Mimecast-MFC-AGG-ID: POxLWIscNmazVj6t_-aLFw_1779989476
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45ea38c03a1so6680564f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 10:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779989476; x=1780594276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0MvIsOMtx2WQpp0fYhvBDybCxrQLnoGgi8za0wNTLo=;
 b=YSpArUha/2hXqwcdCy8O5ppALXbt9q0h1i+IGLt9+5MR0/IU82VJdU+d1yBO0b/FAm
 0oCPZe5Pwg7vuTbyd5t51RIk++uDVWjTQLey6C+6SpfU0eVWF7b2YQdxJa3G8DT6Nql9
 QwC0XLfCJiOpRQdSifyfSr0V5yRVLN437wmBt6jJFaEgVc8QIEAoYrb5Uy5W50ZhbHMv
 1vj/ozZ0CXOCRhZb502Mw5qzVdOfpyptnopKDHCBgX7/sxrsWosdsAsFguGVhmEp4sCY
 b6NNBKiLA7PhLlpJu3FAun4lgcYONlmnX0Alk65O/ajgOPKOM5nAz45z9NVTYKECl6UL
 q8Jw==
X-Forwarded-Encrypted: i=1;
 AFNElJ//5NZ6ig+Lis2usUvoq1eI84rw6FwMSMBd14jxiL9b2AT43Jzfp+x2J8v9+39fDfUJ6SWFflvPVg==@nongnu.org
X-Gm-Message-State: AOJu0YwjuQPJkqBD5764RzYU2ypwzzOpwagVZ6XgQFm6d9ZEkcGiZSzg
 FUdFNw37jUopp0ZezXHKDf/dncs2x2E09rO3YWjvYPmFskhXqRkQC0BiWiApXqeIJ6vE3L3ixas
 +maX64qM4PpCLdwKBkLD6fhdXzQUP/rG4bxrrURDRHCGvYpDmnDvLfA==
X-Gm-Gg: Acq92OGqF4xkYVrcKm1d6T+Qpom6FLVF7uhRtP8qJW+5LhQH+odvFAbJwUtIGBlGcQd
 is6b5z5xq42V0a54/EjPq2lRa7X8T4KqtKBcnYQmVGMV5VKfoN/4wtlxy7FBXH6M/LjmkgGa1Sk
 aUbcGlFvwCi5sNN0Re2HS8oMNgn2iVL6Pu3aF/V7ZfzubtX6F3fs+qqtZKxQVY9Cin2XbGxqPq+
 nh2b+Lr69D5kZLhzLlMc1oAYbSYQUhFqRjflYXRX5P5wZ8rB5WfppxzTQi4QT63yhSAk0g7mLmP
 DbPwTbPao3peBYn0XtDmdUGbMjJpXj/x7yZvplhW2DDxj+PVUoroqbHGrbaHinK9S3svzqZXZg/
 rJ8GXRoh7VO9AG7RnoZ1qgZytMe38exqbTieit6CBzsO3DqKP/ntFjmLrmaH6gT78JHpLEjZ7mQ
 nV4WwT
X-Received: by 2002:a05:6000:4698:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-45ef02895dcmr144947f8f.3.1779989476337; 
 Thu, 28 May 2026 10:31:16 -0700 (PDT)
X-Received: by 2002:a05:6000:4698:b0:45d:41e0:467b with SMTP id
 ffacd0b85a97d-45ef02895dcmr144891f8f.3.1779989475906; 
 Thu, 28 May 2026 10:31:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b2bbfsm15454279f8f.32.2026.05.28.10.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 10:31:15 -0700 (PDT)
Message-ID: <ad70e8f8-0dbb-407c-828e-96b9da188974@redhat.com>
Date: Thu, 28 May 2026 19:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/18] target/arm/cpu: Expose writable ID reg field
 properties on the kvm host vcpu model
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-17-eric.auger@redhat.com>
 <30F66A6A-E26B-486C-81D1-8E1B2CCB558A@nutanix.com>
 <6c14a58a-60ab-419f-9395-ca3489f6cff8@redhat.com>
 <CA136979-E0CC-420E-9271-63CF27CD7DA5@nutanix.com>
 <2fd2057d-c74b-4bbe-b2d0-cb9ed092a37d@redhat.com>
 <6F6ECB0E-82A8-4FFA-8687-2D6E243A2096@nutanix.com>
 <8ee2b611-ef48-4805-aaf0-087856dc30f0@redhat.com>
 <7737B413-51C1-49FA-AC0C-31DCEE1FD45E@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7737B413-51C1-49FA-AC0C-31DCEE1FD45E@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08L2kP5oCvg7ru-O_zd1ZpnCoielQvrU-Hnw8IiXQEI_1779989476
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Khushit,

On 5/28/26 7:29 AM, Khushit Shah wrote:
>
>> On 27 May 2026, at 10:50 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> My reasoning was:
>>
>> arm_cpu_post_init
>> ---> kvm_arm_add_vcpu_properties
>>     ---> set_sysreg_prop set the new value in cpu->isar.idregs
>> arm_cpu_finalize_features
>> ---> arm_cpu_sve_finalize
>> ---> arm_cpu_sme_finalize
>> ---> arm_cpu_pauth_finalize
>> ../..
>> those fonctions do some subsequent isar accesses
>>
>> So I think in general id reg field settings are applied before composite
>> legacy options
>>
>> Thanks
>>
>> Eric
>
>
> Nope, kvm_arm_add_vcpu_properties, just adds KVM specific properties.
right, wrong copy/paste. kvm_arm_add_vcpu_properties just registers the
props
>
> Right now, set_sysreg_prop are called along with legacy props during
Yes options are applied in order but the difference is ID reg field
props settings directly touch the isar array while others are stored in
some temporary field in either machine or cpu code and analyzed later,
for what I see in arm_cpu_realizefn(), either in
arm_cpu_finalize_features() or directly in the body. So isar access
related to compositive functions should be done after those related to
new SYSREG_REG_FIELD props. However I acknoledge the requires a case by
case check and testing.

Thanks

Eric


>
> The call stack is:
> machvirt_init
> ----> set cpu specific machine_props (has-el2, has-el3, mp-affinity)
> ----> dev_realize(cpu)
>   ----> set cmd cpu props (prop set in order they appear in cmdline)


>
>
> Warm Regards,
> Khushit


