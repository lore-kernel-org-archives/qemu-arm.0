Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3767CCCD192
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 14:17:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8fpm-0005QY-4y; Tue, 14 Oct 2025 10:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v8fph-0005Nb-8x
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 10:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v8fpd-00061o-Aj
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 10:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760451409;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SgfOk8B3jU/TP/97nw+aYN/x2JeMujlv5ljYaWvjKd8=;
 b=TIAiMufmXxj3FMQBOhYyR0LadHlzojrxk9TQW+G501NiY8qvKt4yb3Y+ihxrsgiG14jpO1
 NaaoaNETXCB2ksXYMpTKYO/V7etb0ThN/T5As+MGZdG8+ZDSrP8/e0zb5I/nkvtSbF0Tgj
 CN6c1w8s9HEUodM8pPIahjdDaLpwGvs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-TPk69_I4PrGbhG2zvzn06g-1; Tue, 14 Oct 2025 10:16:48 -0400
X-MC-Unique: TPk69_I4PrGbhG2zvzn06g-1
X-Mimecast-MFC-AGG-ID: TPk69_I4PrGbhG2zvzn06g_1760451406
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e4c8fa2b1so23084855e9.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 07:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760451406; x=1761056206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgfOk8B3jU/TP/97nw+aYN/x2JeMujlv5ljYaWvjKd8=;
 b=GTRX1DO0DvBwTkcR1rXQsGx3Ys+KvFdh4+4Q5DVoR08fKyzk1Wtk8H5E6v1eWg3+yY
 T8m+vz+hD5JsRTStvLoWrB20ZtIbvOQTz1JR/ILyPrz+oesdP06iJ5WE+WiYopvj94fw
 Hbb9GOtPB3auwGldFrhUkRlUCe0QctVfjvR+/8Y3y9+K4a6oX9qbA42m//032hi7xQAe
 WLaA/1kJHUVew0GckxG0MrSU7t9CA0/9tGSiU8rHPC6ndX7VwGvPFM8JY9nV5vLyKmoJ
 1SGwfNn07uS46xvlQAOf3Sg2E2v1bemN9gFLeQL7jhpf1vPxizk2/FDUN4jzAIb1V+3y
 D5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVsxFQxvpfe71iGCMoxOcQ8Tr+f+MvxOrpy5d4Bciv76OxoDUemxHwS1BLxvMfXmnBcZppQn6gFA==@nongnu.org
X-Gm-Message-State: AOJu0YzhJZDqj59hTzs59RKhakIjuZmlPck51SPKNgpHU0tAIDKOePbe
 8a1cJsKCH1Ab5TGhPeUOJbJVaK7Qra/LXvwleWA3mzP9QiHCwG7BGtP13TZBeuwg5+ZYEAGpINF
 Sf0NzUiMdU8gVAG4DWhMi1WIkNpi2WFnR475WQgF1elfHDkWhLm2hKA==
X-Gm-Gg: ASbGncsyQiXbDhy1FTQcUZ7ORzLB+rjJ6NE1xQV24uuAtoq75QDL6FYzf3OmG1tb+cq
 ia/5RRiQAwGNcaKkkfOBGPnw0vfzCSkHbEiK5p+QfsNMKlk9iZuLGA7sM+ARr2uuGN7lfSd+6B0
 o8JRZpRtdoE4ApMw0NmKp83OeTojwIidvCNUYw/QWY81FKFlP/SnG2FFfb5PcXN/h4S5FPCL3Z0
 AesVUwhhsCBWO/2bD8tw/tQDcBvMjQhZXwf+lehhW8EIfqIRRxmUBTABJ9+6bRWUBfynnm5VK3U
 wiY3evOAJeNwyPkeeyo11wfG6SfRJ0gQ1Js7vI/dqpYAhUIJF4YvuqVRnUPYoXS4g9TMQgA84yM
 Rp/waIfzptTQ=
X-Received: by 2002:a05:600c:34c4:b0:46f:d682:3df6 with SMTP id
 5b1f17b1804b1-46fd682434fmr21345515e9.35.1760451405665; 
 Tue, 14 Oct 2025 07:16:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVKWDU/LEoFRvz/OaWfbB9mIGyCz/E39JBEpR8a7egs9SSUMsYNBXuw35EjzVMYkXvvTdWFw==
X-Received: by 2002:a05:600c:34c4:b0:46f:d682:3df6 with SMTP id
 5b1f17b1804b1-46fd682434fmr21345275e9.35.1760451405199; 
 Tue, 14 Oct 2025 07:16:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab4f3b07sm156546175e9.2.2025.10.14.07.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:16:44 -0700 (PDT)
Message-ID: <9590ce96-6617-4cfb-849e-b24ea7fcacb9@redhat.com>
Date: Tue, 14 Oct 2025 16:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] target/arm/cpu: Add new CPU property for KVM regs to
 hide
To: Cornelia Huck <cohuck@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 gshan@redhat.com
References: <20250911134324.3702720-1-eric.auger@redhat.com>
 <20250911134324.3702720-2-eric.auger@redhat.com>
 <0f05a0ec-8b98-a9b7-6e3a-9ef73d0c34e7@redhat.com>
 <b2ae3dc0-9bf0-4e89-a995-b97410d57861@redhat.com> <87ikgpv6yo.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87ikgpv6yo.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kHeM67xHHKW3YjCwvUcBj45naAfYuSYObEJIbeucWYM_1760451406
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 10/8/25 3:49 PM, Cornelia Huck wrote:
> On Fri, Oct 03 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
>> Hi Sebastian,
>>
>> On 9/18/25 6:16 PM, Sebastian Ott wrote:
>>> On Thu, 11 Sep 2025, Eric Auger wrote:
>>>> New kernels sometimes expose new registers in an unconditionnal
>>>> manner.  This situation breaks backward migration as qemu notices
>>>> there are more registers to store on guest than supported in the
>>>> destination kerenl. This leads to a "failed to load
>>>> cpu:cpreg_vmstate_array_len" error.
>>>>
>>>> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
>>>> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
>>>> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
>>>> migration from a host kernel which features the commit to a destination
>>>> host that doesn't fail.
>>>>
>>>> Currently QEMU is not using that feature so ignoring this latter
>>>> is not a problem. An easy way to fix the migration issue is to teach
>>>> qemu we don't care about that register and we can simply ignore it,
>>>> including its state migration.
>>>>
>>>> This patch introduces a CPU property, under the form of an array of
>>>> reg indices which indicates which registers can be ignored.
>>>>
>>>> The goal then is to set this property in machine type compats such
>>>> as:
>>>> static GlobalProperty arm_virt_kernel_compat_10_1[] = {
>>>>    /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
>>>>    { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
>>>> }
>>> One thing worth noting - once this series lands:
>>> https://lore.kernel.org/qemu-devel/20250801074730.28329-1-shameerkolothum@gmail.com/
>>>
>>> we might need to add a bit more logic here. Either using the kvm
>>> interfaces (only ignore KVM_REG_ARM_VENDOR_HYP_BMAP_2 when the register
>>> value is 0) or qemu knowledge (only ignore KVM_REG_ARM_VENDOR_HYP_BMAP_2
>>> when the impl-cpu property is not used).
>> Effectively if we "hide" KVM_REG_ARM_VENDOR_HYP_BMAP_2 on save/restore
>> we must enforce the reg is not used by userspace.
>>
>> One way would be to test whether KVM_REG_ARM_VENDOR_HYP_BMAP_2 is hidden
>> in kvm_arm_target_impl_cpus_supported() and if it is, report false.
>> However for every new functionality in qemu it does not sound sensible
>> to check whether new KVM regs being used are anonymously hidden.
>>
>> Another way could be to fail kvm_set_one_reg/kvm_get_one_reg in case the
>> register is hidden. That way in Shameer's series, kvm_arch_init_vcpu()
>> would fail if BMAP_2 is hidden, ie. in our example for all machines
>> types before 10.2. By the way adding Shameer.
> I think tying this to the state of the reg (hidden or not) is less
> error-prone (I'd assume we'd have different ways of detecting whether
> something is used for future cases, and "is the reg hidden?" would work
> in all cases.) We'd need to tie migration to matching machine versions
> anyway, I think.
>
I guess you suggest to check the hidden/fake state in

kvm_set_one_reg/kvm_get_one_reg too. One issue is those helpers are arch agnostic. I would need to either introduce a callback in the CPU class to check the actual status or add the props in the parent CPU object. Or introduce a KVM IOTCL to teach KVM a reg shall never be accessed.

Thoughts?

Thanks

Eric


