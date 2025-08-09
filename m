Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAE2C87FCB
	for <qemu-arm@archiver.kernel.org>; Sat,  9 Aug 2025 16:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukmLy-0002uv-W0; Sat, 09 Aug 2025 12:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmLw-0002rm-Lc
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ukmLv-0001bH-3m
 for qemu-arm@nongnu.org; Sat, 09 Aug 2025 12:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754756606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSnAi1ZzIybsELu3rxbEJsg/jGxatT5hfy8+ZMlecMs=;
 b=FtwQcPQuehV5l6KqKAvIq44OsoXOPh56xBxWkxIp8GkZGi0rFcM+ly33GcJ0IkveDMEg9v
 KAi1YjNi2qppwGu9YAdOqECG4iZBKjHpwKII3R15892l2SPTwYM1L/wMKandWLXanh7bEf
 daWtEPGzremwhXDHozBbpJU4O26W1gQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-wLmQEfVoPnKnJe99oJ8CAA-1; Sat, 09 Aug 2025 12:23:25 -0400
X-MC-Unique: wLmQEfVoPnKnJe99oJ8CAA-1
X-Mimecast-MFC-AGG-ID: wLmQEfVoPnKnJe99oJ8CAA_1754756604
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b7886bfc16so1890332f8f.1
 for <qemu-arm@nongnu.org>; Sat, 09 Aug 2025 09:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754756604; x=1755361404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSnAi1ZzIybsELu3rxbEJsg/jGxatT5hfy8+ZMlecMs=;
 b=hzybPS5atqi+SiSsiWOYydeisyO2tXnSAfVn0R1Ri4dS5n3FkznIdTOF6nBOY2ocUC
 RofKryCsBKXB4bA+EgZV64E9vYt3550Lpcgm9kdTIoePk/sUxbvTGZabWPFBt2CePfZT
 PozRTedR7khi2clqd6/cVnEVyEPQwoDAPO7mJF5+fyxuDLUELEX9W1MfwCKW454v5q6p
 CVU9GSyvn6MtG2DyBg1sEWqKvEb7+eYx2Dou4Zbagn3VKZ3CbYcN8tgf78z3N2BF2RWc
 WsibbZGBBi8J+DPDVaabK2qcZ81qotJVGn0A2ZTQlz+4Olz3H+lZKA05Gr1gCYH1Kq5i
 71dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6E3rEpKj3dzNlCwopf4+CETd8KLa63sDsypWgm0itOuWJn7NBBVaLAHVtsqe61gxXZpqB1LSeGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxLOPlvHM6yUasJREE51bVW1Xqc6qmYPnYtT91fNKjs3jnJWfg/
 /p1M1/tQL0b+DG+e/uvKvCWB2ITiYqLMR0kYBZwTxOcu1FL3IwJ5P4OYoZb9iKFpqmQAoZhl1H2
 Et3domN8m8qPJ1mWDYcHH3V3ET07rCslyVRSIcPJ9AITVxcUrFRrCdQ==
X-Gm-Gg: ASbGncvEq+RKTDF2RYCs5WrRZXe/q0psPbRtSWLQEatLrNjFkpwNYO8xmBHL7+rF/SB
 hm71kZf+RQk/9+uFKw+dBrreXgZr3J/nrcxr26rJsikiwLQnWdkMt0YmU73ycKKKJza7d/HzMmA
 Xt1iqT7JYWCRks9onwRMna2w83i7xgnJxxL5TMfvnfaV3EtNBQIVJmIVUSAdhD5VRsRMzhGXriT
 1f5AYBtw0GDiqBaOlkEpa2/WSO4ElJlcU6NHoWXhLLLiDrPTt2HQKDOO4fkzH/MURsuYuI1K8kv
 wqeASffryiuSC1qyXi9nuWHKomJCm2TuATYpUtnDPNZUjH2Ga5FdME8IbrOOwj1XLk4RjFfU0tS
 CzI1PodlrdmE=
X-Received: by 2002:a05:6000:4305:b0:3b7:888d:8d9a with SMTP id
 ffacd0b85a97d-3b900b72c86mr5170930f8f.29.1754756603769; 
 Sat, 09 Aug 2025 09:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalrmSJXn0mwWYPD+R40P7xywl1csF1ob1TTSMMMrgVTkkxo3lH2jS67sB5ZJkUHeALj2KpA==
X-Received: by 2002:a05:6000:4305:b0:3b7:888d:8d9a with SMTP id
 ffacd0b85a97d-3b900b72c86mr5170915f8f.29.1754756603345; 
 Sat, 09 Aug 2025 09:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0846777sm24460863f8f.48.2025.08.09.09.23.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 09:23:22 -0700 (PDT)
Message-ID: <58d3fc9a-08ca-4b38-b608-89c162c18b67@redhat.com>
Date: Sat, 9 Aug 2025 18:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH RESEND 2/4] target/arm/kvm: Add QAPI struct
 ArmTargetImplCPU
To: Shameer Kolothum <shameerkolothum@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 berrange@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 armbru@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, salil.mehta@huawei.com,
 yangjinqian1@huawei.com, shameerali.kolothum.thodi@huawei.com
References: <20250801074730.28329-1-shameerkolothum@gmail.com>
 <20250801074730.28329-3-shameerkolothum@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250801074730.28329-3-shameerkolothum@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nmmprm1uoM2hKKzuLIw_A37zQv46xZT8YSvPXZxgNqs_1754756604
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer,

On 8/1/25 9:47 AM, Shameer Kolothum wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>
> Introduce a QAPI‐defined struct (and its array) for target implementation
> CPUs. This enables specifying target implementation CPU parameters
> via -machine, for example:
>
> -M virt, \
>   impl-cpu.0.midr=1,impl-cpu.0.revidr=1,impl-cpu.0.aidr=1, \
>   impl-cpu.1.midr=2,impl-cpu.1.revidr=2,impl-cpu.1.aidr=0
>
> Subsequent patch will make use of this by using object_property_add(),
> allowing users to configure each target CPU’s midr, revidr, and aidr
> fields directly from the command line.
>
> While at it, also provide a helper function to set the target CPUs.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  qapi/machine.json    | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/kvm.c     | 16 ++++++++++++++++
>  target/arm/kvm_arm.h |  8 ++++++++
>  3 files changed, 58 insertions(+)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index a6b8795b09..d6e0e3b2e3 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1898,3 +1898,37 @@
>  { 'command': 'x-query-interrupt-controllers',
>    'returns': 'HumanReadableText',
>    'features': [ 'unstable' ]}
> +
> +##
> +# @ArmTargetImplCPU:
> +#
> +# Info for a single target implementation CPU.
> +#
> +# @midr: MIDR value
> +# @revidr: REVIDR value
> +# @aidr: AIDR value
> +#
> +# Since: 10.2
> +##
> +{ 'struct': 'ArmTargetImplCPU',
> +  'data': {
> +    'midr': 'uint64',
> +    'revidr': 'uint64',
> +    'aidr': 'uint64'
> +  }
> +}
> +
> +##
> +# @ArmTargetImplCPUs:
> +#
> +# List of target implementation CPUs.
> +#
> +# @target-cpus: List of ArmTargetImplCPU entries.
> +#
> +# Since: 10.2
> +##
> +{ 'struct': 'ArmTargetImplCPUs',
> +  'data': {
> +    'target-cpus': ['ArmTargetImplCPU']
> +  }
> +}
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index eb04640b50..8f325c4ca4 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -66,6 +66,9 @@ typedef struct ARMHostCPUFeatures {
>  
>  static ARMHostCPUFeatures arm_host_cpu_features;
>  
> +static uint64_t target_impl_cpus_num;
> +static ArmTargetImplCPU *target_impl_cpus;
> +
>  /**
>   * kvm_arm_vcpu_init:
>   * @cpu: ARMCPU
> @@ -2816,3 +2819,16 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
>          cpu->kvm_mte = true;
>      }
>  }
> +
> +bool kvm_arm_set_target_impl_cpus(uint64_t num, ArmTargetImplCPU *cpus)
> +{
> +
> +    if (target_impl_cpus_num) {
> +        return false;
> +    }
> +
> +    target_impl_cpus_num = num;
> +    target_impl_cpus = cpus;
see my question on 4/4 wrt array.

Eric
> +
> +    return true;
> +}
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 3cd6447901..8754302333 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -244,6 +244,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
>  
>  int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap);
>  
> +bool kvm_arm_set_target_impl_cpus(uint64_t num, ArmTargetImplCPU *cpus);
> +
>  #else
>  
>  /*
> @@ -280,6 +282,12 @@ static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
>      return -ENOSYS;
>  }
>  
> +static inline
> +bool kvm_arm_set_target_impl_cpus(uint64_t num, ArmTargetImplCPU *cpus)
> +{
> +    return false;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */


