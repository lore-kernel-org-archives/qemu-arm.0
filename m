Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4272042njd;
        Fri, 25 Apr 2025 03:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMYoKfqjZecHeA8pNTYAxEIosHM6yybv6tTMfKTBMu25kV6AuCAs/Nnoxt4jR2mM9pdlRRAzpR56Ye3A==@linaro.org
X-Google-Smtp-Source: AGHT+IHy0Nx7BjmgioA/Oah6Y26xRlS8b09OmPt+xe9tFAuPAjAP/G+ZITFrUqNXy7rOlhbYZukD
X-Received: by 2002:a05:620a:170f:b0:7c9:5eca:ea3b with SMTP id af79cd13be357-7c960729f78mr288992785a.31.1745577199007;
        Fri, 25 Apr 2025 03:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745577198; cv=none;
        d=google.com; s=arc-20240605;
        b=b9MvZ/NEycmPxDr4zM5cvnTsVVoK09dUnE/vCIf6DE5VfFJyACbeRpF6rnuOulhsrB
         Td/EoAJvJL4gs4h1Lto6r4FmmGMZ8SDRTiDNJjB0pH3CQr5kPiwXTsRFo4LjUQxUjD1K
         yJwGKz1NYX6qfM+O72VA5iT+KBg457pQXziRBbe8cEJIUWlQXxhz/eQEC5AGQKTa3UQk
         LsQzs4PVu45Uy/mQWAUlLZkFaN/UAErFC+w2qRMF+EiixpSf5WUXX6tYSIY68uAzxnWT
         1aL0EUkv5O65+m/+bOdGVNabAoepyWU97NxIm/s0VgovHGNrqqwrsG3TaWxC1LZVn1Rq
         8x4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sOvNB9OXakWwwLO478SymfKCouNPG/XyF/EAXAqw/50=;
        fh=OO4/ej4l9dPtmMsWb0SWc3jxhEaYQS116rVY4VS0eVg=;
        b=dMeDEuMroE3mGdBw7pk815oc9KHPxfy4e17mBg7VgA/yyIWbY/xueQxlmHxAoBwp/Y
         07mhrdN8T5EA19cCZsvNSIYW8Wf0XgIGJCL9BpR7GsnfJwc6PuxANXzejvMIY1Y43UQp
         H6LEVyG1170aNG+oHttI4foyQWuuuMDIH51anxU+1w/6UhkWVM/WFOnn8ty1PqrBQogG
         EvHn8h0Lf8rMTP+YtsQfr6P6+oyH+ZdnnMNWpVKOC4IiWNeP2jkeKZ+5rYjZaRzn/5kG
         0oBaA1134f8+8HTgysZx3Unw8QJ7e+LJAkTgKTtf1J/5E9e5E9nfzsqfHAw33rA6qBdD
         jZ9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwN32SDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ebf2cfsi340526485a.571.2025.04.25.03.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 03:33:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwN32SDd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8GMl-0007sl-4w; Fri, 25 Apr 2025 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GMi-0007rs-Ft
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:33:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8GMf-0007QS-1m
 for qemu-arm@nongnu.org; Fri, 25 Apr 2025 06:33:02 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso14097935e9.1
 for <qemu-arm@nongnu.org>; Fri, 25 Apr 2025 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745577179; x=1746181979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sOvNB9OXakWwwLO478SymfKCouNPG/XyF/EAXAqw/50=;
 b=GwN32SDdl6rMVmNI/5R6vcrD5kd9H37byn/zMchhMBwpQBrEuhtHKi8zojtFbX6Dxs
 fTbCrjD+1a5XonQtQxJHrMVKz48p/4tryzlPTOeiXGY0MveO2sfHj1rdC7rtQhLSwgiO
 ntsCWz/N+eDlCFKJxZb7p7BUgsnuGU+6/7cXUvpDEqtjL6PKlA5n8rUAI3UJpGpHaRgM
 DXst+g9ho71Mc186WFCLzESP0/vYdXlrBD6c6yIn4TopR5coLg81jLtB/fDakV+Jb6Yv
 4v3fzu7IuOUjHSylbPhrrdcQkzxCyDZh9x7quhqNWCy51TAD4ryy8VRiSmc1VZ6+NARr
 HGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745577179; x=1746181979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOvNB9OXakWwwLO478SymfKCouNPG/XyF/EAXAqw/50=;
 b=YLO8vfbY8tRXwSAF91gNdrzf8BrO59an/LIZs7SKxUDum3nm7DVihxVGB9kRiGU9ZQ
 3TBFk7mZY3QgW+MBpAzLR5qesQgsQ9sXLH2jn4jcB7dvqGd4azpGW6RZDwJDsdQ/2IwF
 Q2l5FL0Zxxh9OtdO2JA4vexsxmo/W39wwQR4xgiRjecgAGK86F/skKdtUraH0PZbNH6D
 ctubCQ0B7n463Xb6qRSInFs0RcAhSp8lDRzDqhM+tfr+TLhTUTewzHvy3QaDaORPDclc
 9FxSfhm5c3QHwLdQQGBiuaw3vBg+QUZ4wLt0Eri/PM8o/urRewW254MRAxdCGBgqefRN
 besg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6i9qf9pJeZLNuBv3OzwxTpeHm0Zj+qqc00+E8nFTvgkIBLwLVJOjkYI+cWnl3QjvHNLGOe3duow==@nongnu.org
X-Gm-Message-State: AOJu0Yy4mA8Id5ugH9oS8BlsEkUNKR4mzoMI+FVVPkG5mkf9xyZmxrnA
 x4YPhCTEanNd6aVpgESTlJ4Y/TfaUx3ZsMjX+NSyA0mYFqQyaZpmyz0hS9Rx5mc=
X-Gm-Gg: ASbGncthZkZHxhhGDCvLiTPzEUn7iNEjZPym5t6lA2xuRmX5zn0eEWIqvY2FR4kwVxz
 q73Iheqmvbn0HtBDAqWjGXp7OiYA0NNsxPJIbCWUG+Vc66WcIGQYQKd/xI0Ct6vH+9tl5dnLH61
 cRK1LbiQzYsdMpCNyqGq6JVVlbgeC/tg82kO56xDU4KRhmT16zOcfzOY1owsHuy/DHXvMmm9jPa
 irTr9TwckhFu/3Wn7XTQb/JOtwIRnPsaQ8CTzzzhi19xiutASqdmUafAWELSzYYbKf4hnI+vqLz
 COhEIJIDiFAL42gjmUm19+DQS0B4A0lo8icxlKTE2XiVVtRLdYKEHKP9asHzZNFTZ6Pp462telF
 KCq9+x5+u
X-Received: by 2002:a05:6000:4304:b0:38f:4f60:e669 with SMTP id
 ffacd0b85a97d-3a074e3c47cmr1386882f8f.29.1745577178843; 
 Fri, 25 Apr 2025 03:32:58 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46976sm1941254f8f.63.2025.04.25.03.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 03:32:58 -0700 (PDT)
Message-ID: <6a93fa6b-d38d-48ac-9cde-488765238247@linaro.org>
Date: Fri, 25 Apr 2025 12:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i386/kvm: Support fixed counter in KVM PMU filter
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, Shaoqin Huang <shahuang@redhat.com>,
 Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Dapeng Mi <dapeng1.mi@intel.com>, Yi Lai <yi1.lai@intel.com>
References: <20250409082649.14733-1-zhao1.liu@intel.com>
 <20250409082649.14733-6-zhao1.liu@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250409082649.14733-6-zhao1.liu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oJVOCfUIsHuc

On 9/4/25 10:26, Zhao Liu wrote:
> KVM_SET_PMU_EVENT_FILTER of x86 KVM allows user to configure x86 fixed
> function counters by a bitmap.
> 
> Add the support of x86-fixed-counter in kvm-pmu-filter object and handle
> this in i386 kvm codes.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yi Lai <yi1.lai@intel.com>
> ---
> Changes since RFC v2:
>   * Drop KVMPMUX86FixedCounter structure and use uint32_t to represent
>     bitmap in QAPI directly.
>   * Add Tested-by from Yi.
>   * Add documentation in qemu-options.hx.
>   * Bump up the supported QAPI version to v10.1.
> 
> Changes since RFC v1:
>   * Make "action" as a global (per filter object) item, not a per-counter
>     parameter. (Dapeng)
>   * Bump up the supported QAPI version to v10.0.
> ---
>   accel/kvm/kvm-pmu.c      | 31 +++++++++++++++++++++++++++++++
>   include/system/kvm-pmu.h |  5 ++++-
>   qapi/kvm.json            |  6 +++++-
>   qemu-options.hx          |  6 +++++-
>   target/i386/kvm/kvm.c    | 39 ++++++++++++++++++++++++---------------
>   5 files changed, 69 insertions(+), 18 deletions(-)
> 
> diff --git a/accel/kvm/kvm-pmu.c b/accel/kvm/kvm-pmu.c
> index 9205907d1779..509d69d9c515 100644
> --- a/accel/kvm/kvm-pmu.c
> +++ b/accel/kvm/kvm-pmu.c
> @@ -101,6 +101,29 @@ fail:
>       qapi_free_KvmPmuFilterEventList(head);
>   }
>   
> +static void kvm_pmu_filter_get_fixed_counter(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    KVMPMUFilter *filter = KVM_PMU_FILTER(obj);
> +
> +    visit_type_uint32(v, name, &filter->x86_fixed_counter, errp);
> +}
> +
> +static void kvm_pmu_filter_set_fixed_counter(Object *obj, Visitor *v,
> +                                             const char *name, void *opaque,
> +                                             Error **errp)
> +{
> +    KVMPMUFilter *filter = KVM_PMU_FILTER(obj);
> +    uint32_t counter;
> +
> +    if (!visit_type_uint32(v, name, &counter, errp)) {
> +        return;
> +    }
> +
> +    filter->x86_fixed_counter = counter;
> +}
> +
>   static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)
>   {
>       object_class_property_add_enum(oc, "action", "KvmPmuFilterAction",
> @@ -116,6 +139,14 @@ static void kvm_pmu_filter_class_init(ObjectClass *oc, void *data)
>                                 NULL, NULL);
>       object_class_property_set_description(oc, "events",
>                                             "KVM PMU event list");
> +
> +    object_class_property_add(oc, "x86-fixed-counter", "uint32_t",
> +                              kvm_pmu_filter_get_fixed_counter,
> +                              kvm_pmu_filter_set_fixed_counter,
> +                              NULL, NULL);
> +    object_class_property_set_description(oc, "x86-fixed-counter",
> +                                          "Enablement bitmap of "
> +                                          "x86 PMU fixed counter");

Adding that x86-specific field to all architectures is a bit dubious.

>   }
>   
>   static void kvm_pmu_filter_instance_init(Object *obj)
> diff --git a/include/system/kvm-pmu.h b/include/system/kvm-pmu.h
> index 6abc0d037aee..5238b2b4dcc7 100644
> --- a/include/system/kvm-pmu.h
> +++ b/include/system/kvm-pmu.h
> @@ -19,10 +19,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(KVMPMUFilter, KVM_PMU_FILTER)
>   
>   /**
>    * KVMPMUFilter:
> - * @action: action that KVM PMU filter will take for selected PMU events.
> + * @action: action that KVM PMU filter will take for selected PMU events
> + *    and counters.
>    * @nevents: number of PMU event entries listed in @events
>    * @events: list of PMU event entries.  A PMU event entry may represent one
>    *    event or multiple events due to its format.
> + * @x86_fixed_counter: bitmap of x86 fixed counter.
>    */
>   struct KVMPMUFilter {
>       Object parent_obj;
> @@ -30,6 +32,7 @@ struct KVMPMUFilter {
>       KvmPmuFilterAction action;
>       uint32_t nevents;
>       KvmPmuFilterEventList *events;
> +    uint32_t x86_fixed_counter;
>   };
