Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650BC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 00:44:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wj4m1-0001JH-Fq; Sun, 12 Jul 2026 20:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj4lz-0001Hx-Dm
 for qemu-arm@nongnu.org; Sun, 12 Jul 2026 20:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wj4lx-0004oc-Kj
 for qemu-arm@nongnu.org; Sun, 12 Jul 2026 20:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783903428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcmQ/kaPfeKQ7YJOUmwuqtIspVQgNQK5b+PB69aVoBY=;
 b=Q+nKWTpwVL4dGfJgpPQZrvo+3eVuvMDOY+ELfR0qvsHzxtewgEyJ0LZ9TQMz8iAmmGBlWw
 SLAfvDqmWknJ2+Fd2r4+KLsoNIGikW0Ab3n/XJAanT5Nat6anWl+8cq4Kf6RgeqfNRmi/N
 jU8RRGgSpEIjACDEGgyF4xske2/BPxM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-pCfhmmPRO--YP6zhhqE8vA-1; Sun, 12 Jul 2026 20:43:47 -0400
X-MC-Unique: pCfhmmPRO--YP6zhhqE8vA-1
X-Mimecast-MFC-AGG-ID: pCfhmmPRO--YP6zhhqE8vA_1783903426
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38127ae6b99so3356693a91.1
 for <qemu-arm@nongnu.org>; Sun, 12 Jul 2026 17:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783903426; x=1784508226;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZcmQ/kaPfeKQ7YJOUmwuqtIspVQgNQK5b+PB69aVoBY=;
 b=L+PvqHL0Ksto6tq7TH8Lq2wd4jv0D21iwtIhs/uUroCQMrNHppkRpTQv+M9y3dZtF+
 0T1m+ft014Nuy2LP3ohuACEq77kKoCp8/ycNHrOlpFbEBZXnwm4qmpvVyhnXVTc9IZrA
 AvI3W6ITeMBNSMezdYglX4sFIgErzhmnNKbxardIm1uygsFygXiQTQssvjGv4k3zV7C+
 Nc0vW+7X2gx5XIjin3ST0uhsKONdMEC+/SWm6o9xaqlEFNA6lamR0AFddS7ekwaF2a9k
 inN463t7qSorPwtcOBvHRLlZzPh48iXJhbljqZYPuLu6EYjwEEZdH1z1UFWCxveJ75SL
 upUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrHue1qxh7GsB46K6GGOo/QSxxfCyckwf2dJvxaiTWZ4+Se4uO9zdPAY+2Navxkwf2tQX5/nAzmBA==@nongnu.org
X-Gm-Message-State: AOJu0YzYNgZ15n057UZxCSbw3l/r6u5QLVs2Fzk7/9xLPbiFraLQUTmf
 ae1jnu7SP/mcrx/U6VzvOcCTvs91++LGtqmNGqmauIFtMOnZNjnDfN/vGFZw+cRYbiJ7+BOfAvV
 b+TOzaYYg+/r0FAcQ1uyosHoPntUmU0jRVfDhNOpP65gu2VVa1116Jw==
X-Gm-Gg: AfdE7clowaJ4eYk3gAsnxy6jxzggJw8U9lwOZw4V7p/FUkAKxPFY6E0f/3c/TN7FhH5
 8byLC1wCgOgSwJcE14Ymcx4BjY+NBkSsTv/b/a9K+A8T4J5F9e1KhZwGpVyz4/VHEvqdIaxeBe7
 hY903ob/YwQ25f2wQvPSyVCu6XsUdJuGoPcQHEvhG7csrHjI0MLXrphtuKmQQvrCMyCueXU64YF
 9VLXycCrXTAJ8E18+v+MaAZV1HqWMs/lDnY1lDKxiubWsSO6nQoUkzvICeHPXZBjJYQHV+IUztU
 /AHGuCQz+oLqB4ujsdfld4IR1+NafIOGp9uCK2q1Rguf8BcQd7LYn0YFjAYez/yUcvYyNk3dHpQ
 IlGqkecoY8wlE9x4mDIj7PEomRQLjkwaVYoEwRxGSzcv7hHRM86ZRoA==
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id
 98e67ed59e1d1-38dc81c1b09mr5083858a91.9.1783903426247; 
 Sun, 12 Jul 2026 17:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id
 98e67ed59e1d1-38dc81c1b09mr5083849a91.9.1783903425797; 
 Sun, 12 Jul 2026 17:43:45 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38d2fdd777csm3075407a91.1.2026.07.12.17.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 17:43:45 -0700 (PDT)
Message-ID: <3ac5a5b7-e41d-499e-a4d2-e9a5a78f8c0c@redhat.com>
Date: Mon, 13 Jul 2026 10:43:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 08/25] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
To: Mathieu Poirier <mathieu.poirier@linaro.org>, berrange@redhat.com,
 kchamart@redhat.com, pierrick.bouvier@oss.qualcomm.com,
 peter.maydell@linaro.org, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com, jpb@kernel.org,
 lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
 <20260707224306.1202330-9-mathieu.poirier@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260707224306.1202330-9-mathieu.poirier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wJgNf6Zb2ep0CbjdUyTTMwFlD-4iyn9f52IeIL1dx-0_1783903426
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=gshan@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/8/26 8:42 AM, Mathieu Poirier wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The Arm KVM code can return different values from KVM_CHECK_EXTENSION
> depending on the VM type. Use kvm_vm_check_extension() where necessary
> to ensure we get the right response from KVM.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   target/arm/kvm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

I'm putting a note here so that we won't forget. The following changes are needed
so that capability KVM_CAP_ARM_NISV_TO_USER won't be enabled for realm guest since
it has been hidden from the realm guest in (v14) host series.

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3d5e16a21c..4c52ee7e1b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -623,7 +623,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
          return -EINVAL;
      }
  
-    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
+    if (kvm_vm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
          if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
              error_report("Failed to enable KVM_CAP_ARM_NISV_TO_USER cap");
          } else {

> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 6aa1cd04e484..c69b5310c184 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -328,7 +328,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
>       }
>   
> -    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
> +    if (kvm_vm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
>           init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>           pmu_supported = true;
>           features |= 1ULL << ARM_FEATURE_PMU;
> @@ -654,11 +654,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>           }
>       }
>   
> -    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
> +    max_hw_wps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
>       hw_watchpoints = g_array_sized_new(true, true,
>                                          sizeof(HWWatchpoint), max_hw_wps);
>   
> -    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
> +    max_hw_bps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
>       hw_breakpoints = g_array_sized_new(true, true,
>                                          sizeof(HWBreakpoint), max_hw_bps);
>   
> @@ -1905,7 +1905,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
>   
>   void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
>   {
> -    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
> +    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
>   
>       if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
>           if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {


