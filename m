Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B8CD6E4A
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 08:32:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wV3Uf-0008PD-Dx; Thu, 04 Jun 2026 04:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV3Ud-0008OU-W6
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 04:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wV3Ub-00004w-5n
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 04:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780561916;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZUFFeE/zWYE0ibOF8MIRl7fETt/Cr7YoCjrXqi7Vrw=;
 b=TohJRe+yaxM16jHJxvFz88gvlAOgKgWk+JpXz2Ljs6jTQrk9RGqc01tW3shEN8en2JYMP9
 HDKD22Pi/30czRpiYgB+lDdL6ydZ12SfbcuwSSYTuzxd0sycqU25aoL8uLUyty9XsuHrua
 vvH6wwMDLvVjSl1BZe2cgDDSd+1V+1s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-vqsr2RnNMQSlVN1Ep0to0w-1; Thu, 04 Jun 2026 04:31:54 -0400
X-MC-Unique: vqsr2RnNMQSlVN1Ep0to0w-1
X-Mimecast-MFC-AGG-ID: vqsr2RnNMQSlVN1Ep0to0w_1780561914
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490b3f53c81so1764955e9.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 01:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780561914; x=1781166714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZUFFeE/zWYE0ibOF8MIRl7fETt/Cr7YoCjrXqi7Vrw=;
 b=OfcyzNuQaWiq+CzeVN4YhOLEt3ZZt69pjekRIlrlrLle+nnKpMWYeo2IwAY5ql/9L8
 d9KtEb9oMdrCUMNu7mS3mJ2Wac81CuW42q6Bm0oM3huLGHIodboEgAixGCXXlWwxX7Eq
 vc/tNK4rAjTCDhg4Kx/7mM3gT9WrhQkQwVkEp4lws2YOchUF2ZAm5RZf1ASke4wzbu/U
 fBek/HhD8d1AZ7fIpac9VbWv6eyo+stNqoLzDrTZsXRhKxdLkvcMnQKtY3IgQBxOnbn0
 SrRXIEVSAHJyuAMrJQHgSLuN3CJyEh4c2G1Lo6CYgn87K/bVjiCNrm+mgIZbHQRQSv0W
 o0GQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YrcVMsBu0EUYuZcvvKmlJA8Ge9Aa2heCdPDLxN91+Ai4jw1ab5dZWGKuWxVPJFUpNe9yttRMgkA==@nongnu.org
X-Gm-Message-State: AOJu0YzruPfNX8OLjGO7o8buqTvueMTUUO/1bcGvM9jWiqoGgS2KRJN6
 ltNr+7LYJ+DRBp+HaEYtoZl7FliMQJffvypTsa6zfWUCJbtGdTEKqCS5U2HmqZIU3r1TAOiYJ+2
 KRryaFgNOwqT5vSOvhItvj78QVO5+E4apLxh8BHJHBRm6LJkeSMKf7Q==
X-Gm-Gg: Acq92OHdr4XW6hxGzdPeyQiGwjY8vdwUhmJ7xTCeJP8bb3Nref00QbC61mht4h8fuet
 Gpr12jTlRYer4/6reZLIH9FuYOYGglTojd0pABe09VFYdtefyDKYxkXaDgnC1f8jPHBAFYkI4VG
 kGyjQs+G2OtlbXbf8ZhdcMKTGPkw3vgqbKWyDpnOEBs5WPz9dSs8PX+nxByWleGVvSmZWrERbk+
 WEa1UllKpIivVfbat2JHYxGiToIxmmzkaU4Iyt5ygIP9KyOgmFp3USEMr8an9NUBFinpRry2nIA
 p2YULZesKyt8fAK2QXkaaYuY6pCiRKNAurnhB6nUJS7Lv92rW4hJY0PrRY2vf/eP1Ko+4mvpGPr
 WH/tIWAy5huMvDmqzNjPzIxG6RoZi29LQI6yLXxNCWjty+iI+ZrZdwvCuJDMHnrSENU7Ko1BIch
 hwiEHb
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id
 5b1f17b1804b1-490b5e893admr109843415e9.8.1780561913517; 
 Thu, 04 Jun 2026 01:31:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id
 5b1f17b1804b1-490b5e893admr109842725e9.8.1780561913015; 
 Thu, 04 Jun 2026 01:31:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc4082c3sm50760335e9.13.2026.06.04.01.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 01:31:51 -0700 (PDT)
Message-ID: <68090ea2-fe45-4935-80f2-1a4201b5c148@redhat.com>
Date: Thu, 4 Jun 2026 10:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] kvm/arm: Introduce a customizable aarch64 KVM
 host model
To: Jinqian Yang <yangjinqian1@huawei.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, shaju.abraham@nutanix.com,
 khushit.shah@nutanix.com, cohuck@redhat.com, richard.henderson@linaro.org,
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@linaro.org
Cc: maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <5a533932-06fe-4401-abfe-66546c15c4ec@huawei.com>
 <1bdf5296-874b-488e-8a34-d6f8d23ddcae@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1bdf5296-874b-488e-8a34-d6f8d23ddcae@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8FLrfJOlmUco1DbVV7dreDLLduQUUV-TTOjxrVcoUtg_1780561914
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

Hi Jinqian,

On 6/4/26 8:32 AM, Jinqian Yang wrote:
>
>
> On 2026/6/4 14:08, Jinqian Yang wrote:
>>
>>
>> On 2026/5/19 21:27, Eric Auger wrote:
>>> This series enhances the current host KVM model with capability to
>>> set writable ID reg fields.
>>>
>>> Since v6.7 kernel, KVM/arm allows the userspace to overwrite the values
>>> of a subset of ID regs. The list of writable fields continues to grow.
>>> The feature ID range is defined as the AArch64 System register space
>>> with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
>>>
>>> The end goal is to get more flexibility when migrating guests
>>> between different host hardware.
>>>
>>> QEMU retrieves the writable ID fields from KVM UAPI [1] and
>>> match them against a generated description of ID regs and their
>>> named fields that stem from AARCHMRS Registers.json file.
>>> Current description is based on latest 2026-03 edition.
>>> The content of the generated files was compared against kernel
>>> linux/arch/arm64/tools/sysreg file. It is not straightforward
>>> to have unit tests for python scripts as there are many cases for
>>> field extraction.
>>>
>>> For each writable named field a uint64 property is created
>>> following the "SYSREG_<REG>_<FIELD>" naming convention. REG and
>>> FIELD names are those described in ARM ARM Reference manual.
>>>
>>> The list of SYSREG_ID properties can be retrieved through the qmp
>>> monitor using query-cpu-model-expansion [2].
>>>
>>> Connie & Eric
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/arm-cpu-model-v5
>>>
>>> History:
>>> --------
>>>
>>> v4 -> v5:
>>> - generate target/arm/cpu-idregs.h.inc that look similar to
>>>    the format used in [RFC PATCH v1 02/13] target/arm:
>>>    named_cpu_model: Add ID Register Fields without the
>>>    description of the value values nor safe policy/value.
>>>    I guess valid values could be generated from the Registers.json
>>>    file too. Safe policy/values cannot.
>>>    I reused one patch from the above series.
>>>    Let's see how both series can progress/coexist without any
>>>    anticipated bias.
>>> - Addressed all comments from Shameer on v4
>>> - Addressed 2 comments from v4 that were missed including the
>>>    issue of IDreg visibility affected by some other settings.
>>>    Unfortunately I was not able to test it.
>>> - Further look at overrides between low level id reg field
>>>    properties versus legacy CPU options. I have the feeling they
>>>    can coexist as long as we document the hierarchy between them:
>>>    host kvm default -> ID reg field props -> legacy CPU options
>>> - Noticed more writable fields that are RES0/RAZ
>>> - Improved commit messages in general
>>>
>>> References:
>>> -----------
>>>
>>> [1]
>>> KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES
>>> KVM_ARM_GET_REG_WRITABLE_MASKS
>>> Documentation/virt/kvm/api.rst
>>>
>>> [2]
>>> qemu-system-aarch64 -qmp unix:/home/augere/TEST/QEMU/qmp-
>>> sock,server,nowait -M virt --enable-kvm -cpu custom
>>> sudo build/run qmp-shell /home/augere/TEST/QEMU/qmp-sock
>>> Welcome to the QMP low-level shell!
>>> Connected to QEMU 11.0.50
>>> (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
>>>
>>>
>>> Cornelia Huck (3):
>>>    target/arm/kvm: Introduce kvm_get_writable_id_regs
>>>    arm-qmp-cmds: introspection for ID register props
>>>    arm/cpu-features: document ID reg properties
>>>
>>> Eric Auger (14):
>>>    scripts: introduce scripts/update-aarch64-cpu-sysregs-header.py
>>>    target/arm/cpu-sysregs.h.inc: Sort by name alphabetical order
>>>    target/arm/cpu-sysregs.h.inc: Update with automatic generation
>>>    arm/cpu: Add infra to handle generated ID register definitions
>>>    scripts: Introduce scripts/aarch64_sysreg_helpers module
>>>    scripts: Introduce scripts/update-aarch64-cpu-sysreg-properties.py
>>>    target/arm/cpu-idregs.h.inc: generate with script
>>>    target/arm/cpu64: Retrieve writable ID reg map in
>>>      aarch64_host_initfn()
>>>    arm/kvm: Initialize all writable ID registers from host
>>>    arm/kvm: write back modified ID regs to KVM
>>>    target/arm/kvm: Introduce kvm_arm_expose_idreg_properties
>>>    target/arm/kvm: Special case REVIDR_EL1 and AIDR_EL1
>>>    target/arm/kvm: Ignore some writable bits that shouldn't be
>>>    target/arm/cpu: Expose writable ID reg field properties on the kvm
>>>      host vcpu model
>>>
>>> Shaju Abraham (1):
>>>    target/arm/cpu_idregs: generate tables for Arm64 ID registers and
>>>      fields
>>>
>>>   docs/system/arm/cpu-features.rst              | 106 ++-
>>>   scripts/aarch64_sysreg_helpers.py             | 109 ++++
>>>   .../update-aarch64-cpu-sysreg-properties.py   | 168 +++++
>>>   scripts/update-aarch64-cpu-sysregs-header.py  |  51 ++
>>>   target/arm/arm-qmp-cmds.c                     |  19 +
>>>   target/arm/cpu-idregs.c                       |  50 ++
>>>   target/arm/cpu-idregs.h                       |  33 +
>>>   target/arm/cpu-idregs.h.inc                   | 617
>>> ++++++++++++++++++
>>>   target/arm/cpu-sysregs.h.inc                  |  57 +-
>>>   target/arm/cpu.h                              |   3 +
>>>   target/arm/cpu64.c                            |  14 +
>>>   target/arm/kvm-stub.c                         |   5 +
>>>   target/arm/kvm.c                              | 320 ++++++++-
>>>   target/arm/kvm_arm.h                          |  12 +
>>>   target/arm/meson.build                        |   1 +
>>>   target/arm/trace-events                       |   6 +
>>>   16 files changed, 1539 insertions(+), 32 deletions(-)
>>>   create mode 100644 scripts/aarch64_sysreg_helpers.py
>>>   create mode 100644 scripts/update-aarch64-cpu-sysreg-properties.py
>>>   create mode 100755 scripts/update-aarch64-cpu-sysregs-header.py
>>>   create mode 100644 target/arm/cpu-idregs.c
>>>   create mode 100644 target/arm/cpu-idregs.h
>>>   create mode 100644 target/arm/cpu-idregs.h.inc
>>>
>>
>> Thanks for the patch series. I tested it, and it works as expected.
>> After configuring the QEMU command, it was able to successfully migrate
>> on Hisilicon KunPeng HIP09 and HIP12 chips.
>>
>> Tested-by: Jinqian Yang <yangjinqian1@huawei.com> 
Thank you very much Jinqian for the testing. If it does not contain
anything confidential, could you paster the cmd line (restricted to the
SUSREG_* props) you used to tune your host vcpu model. This would
provide another example of usage for reviewers/maintainers?

Thank you in advance

Best Regards

Eric
>>
>> Thanks,
>> Shameer
>>
>
> Sorry, I forgot to update the salutation name at the end.
>
> Thanks,
> Jinqian
>


