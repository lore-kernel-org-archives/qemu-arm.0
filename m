Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C178CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 17:40:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4NGx-000348-6R; Thu, 02 Oct 2025 13:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4NGv-00031c-Fo
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 13:39:17 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4NGg-0003oW-5r
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 13:39:16 -0400
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3ee12332f3dso1123674f8f.2
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759426730; x=1760031530; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+V2wPuGfCio4QUFBc5XwSn82EF99kzO0rV5pMclAj8k=;
 b=I2grl3zJ8szvU4iwcLU3fAeVOtPrUzoVBzSyjCkieVPTmFMgrfXK1VBe2usyV4+uZL
 XS3hjB/TixcoA3GMdraJTEROTCi3WezMUKik8WztsQJ5KhFOpLr/6vNxxioyhbc0yr8P
 O3nMhfvAP03OwvQWVxThQWI+SD3mZzKmynLt0k9f7b8/GjuBJSItQAbkTS59vLx0Z2pn
 EzI101IzlrbqvPmf1LV0TLxCdCOxYF8b0qcrE3T+KlcIXhcRClT9YpGumdCe+D9TecHa
 PGBfVKKaPfr+Iybjry4bNMAefjSaIZ5HTDnRIveX+vFin/DJ/OoAAyOvxuAY0/ERIBXQ
 SYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759426730; x=1760031530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+V2wPuGfCio4QUFBc5XwSn82EF99kzO0rV5pMclAj8k=;
 b=AugXOyleDWnD0JujGbRIl9u7+eZSRC55wG1qMkav3+DvBE5QyyF+NGXgQyYXfl3cS8
 3R1YoEYzOQ2FRAGegj7a5iG3k7EZfqm91cuhW1reGXqNmlENrqDz+Im32SnjL18lbT3H
 kRxpQCT7K0shOMULMIsbQw793Zt2oHSqR1sswFma57rzsWfnqoL8oR2BmsWqoJTV7IBy
 jyYUpbJxj/Wva9FyWpOaQH3NIsqsp/puSYbgoUUZ2SzFtCRPvu1OOLIQZhVZjD43A7eI
 MDnLOLx1YjMXDKF6bnTWqupzCBhmGlKh4JcJjaVZKDp8j+W9dHbwJjbMPXeyNN20pOnB
 agcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyUnTWSur15LOARwoWaLTlHEyjqMxgAFTMGQUkBcdxz+8U/8eZL0aGfi99HzMk9+Wj6e0sx0PPbw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0vubtYqXFD5w0ZGeNq2AdmbXVUBMRsAGoXuftHsE7keTVD/7I
 xEosSnHfRkbHY7/uD7xsCC6kwzv/mwnmEsnv5FYO+0Hf0wNZNAmrDxs123Px7m/HdNk=
X-Gm-Gg: ASbGnctQRVquXOWjIzzDqYRGHTqrZ4OPOcIih+esd+8VoUyWqu60RfYX1a6V860Moac
 fjqeMxTfFzD7qcx4+wqxbsWVBsamEdkMtFe0GmPDyJgIzQEV3DdFr4Aznx+8xAAw6NxMOGBjJ9A
 gBJVCbRLO+tNn++psp/wwRjxW0h7N/7Pj32gj2mwW8QJiLQ4G3hs78X31MYGcfq3QUERCM+o7u0
 CtXKuGfmK+S9bd68aocRcLLjjmSIIY0zYGDTdVOhU0Z1DKxJRpVg/UNXHjWCmHEHW1bBUgmxok6
 32QQEoYmnEL3uipnfm6lxpeeh98xgqZTpOQwsa9MofW8WuUqRx/EnGMH3HBEHQU/jQ670d3QuKl
 taZW6fJTSl9wObCGdzBB6JtpiYF2fLgN/HdzOLzVISm/vlC+5yjsDltH5zgqSje1b3xfotF0a5F
 sEfWpCzL3BQLITswxZ/Q==
X-Google-Smtp-Source: AGHT+IEzLXvjBFsflezIs0tpM1/mJV+Aj4RSV5J6Itd4MVihCEh67jQ9oba/kdfrPT1zTJ0LBEFfLg==
X-Received: by 2002:a05:6000:2203:b0:40f:288e:9990 with SMTP id
 ffacd0b85a97d-425671abae4mr77123f8f.48.1759426730275; 
 Thu, 02 Oct 2025 10:38:50 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97fbsm4401347f8f.34.2025.10.02.10.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 10:38:49 -0700 (PDT)
Message-ID: <cb828163-d23f-4a1c-b312-4ff24c4e02f1@linaro.org>
Date: Thu, 2 Oct 2025 19:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] hw: Remove unnecessary 'system/ram_addr.h' header
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20251001175448.18933-1-philmd@linaro.org>
 <20251001175448.18933-7-philmd@linaro.org>
 <a8be844e-5f9d-478a-a96e-b76bfed9c764@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a8be844e-5f9d-478a-a96e-b76bfed9c764@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/10/25 17:59, Harsh Prateek Bora wrote:
> 
> 
> On 10/1/25 23:24, Philippe Mathieu-Daudé wrote:
>> None of these files require definition exposed by "system/ram_addr.h",
>> remove its inclusion.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/ppc/spapr.c                    | 1 -
>>   hw/ppc/spapr_caps.c               | 1 -
>>   hw/ppc/spapr_pci.c                | 1 -
>>   hw/remote/memory.c                | 1 -
>>   hw/remote/proxy-memory-listener.c | 1 -
>>   hw/s390x/s390-virtio-ccw.c        | 1 -
>>   hw/vfio/spapr.c                   | 1 -
>>   hw/virtio/virtio-mem.c            | 1 -
>>   8 files changed, 8 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 82fb23beaa8..97ab6bebd25 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -77,7 +77,6 @@
>>   #include "hw/virtio/virtio-scsi.h"
>>   #include "hw/virtio/vhost-scsi-common.h"
>> -#include "system/ram_addr.h"
>>   #include "system/confidential-guest-support.h"
>>   #include "hw/usb.h"
>>   #include "qemu/config-file.h"
>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>> index f2f5722d8ad..0f94c192fd4 100644
>> --- a/hw/ppc/spapr_caps.c
>> +++ b/hw/ppc/spapr_caps.c
>> @@ -27,7 +27,6 @@
>>   #include "qapi/error.h"
>>   #include "qapi/visitor.h"
>>   #include "system/hw_accel.h"
>> -#include "system/ram_addr.h"
>>   #include "target/ppc/cpu.h"
>>   #include "target/ppc/mmu-hash64.h"
>>   #include "cpu-models.h"
>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>> index 1ac1185825e..f9095552e86 100644
>> --- a/hw/ppc/spapr_pci.c
>> +++ b/hw/ppc/spapr_pci.c
>> @@ -34,7 +34,6 @@
>>   #include "hw/pci/pci_host.h"
>>   #include "hw/ppc/spapr.h"
>>   #include "hw/pci-host/spapr.h"
>> -#include "system/ram_addr.h"
>>   #include <libfdt.h>
>>   #include "trace.h"
>>   #include "qemu/error-report.h"
> 
> I am seeing error while applying patch series:
> 
> harshpb:patches$ git log --oneline -n1
> 29b77c1a2d (HEAD -> review-20251002, upstream/master, master) Merge tag 
> 'rust-ci-pull-request' of https://gitlab.com/marcandre.lureau/qemu into 
> staging
> harshpb:patches$ git am ./ 
> v2_20251001_philmd_system_physmem_extract_api_out_of_system_ram_addr_h_header.mbx
> 
> 
> Applying: system/ram_addr: Remove unnecessary 'exec/cpu-common.h' header
> Applying: accel/kvm: Include missing 'exec/target_page.h' header
> Applying: hw/s390x/s390-stattrib: Include missing 'exec/target_page.h' 
> header
> Applying: hw/vfio/listener: Include missing 'exec/target_page.h' header
> Applying: target/arm/tcg/mte: Include missing 'exec/target_page.h' header
> Applying: hw: Remove unnecessary 'system/ram_addr.h' header
> Applying: system/physmem: Un-inline cpu_physical_memory_get_dirty_flag()
> Applying: system/physmem: Un-inline cpu_physical_memory_is_clean()
> Applying: system/physmem: Un-inline 
> cpu_physical_memory_range_includes_clean()
> Applying: system/physmem: Un-inline cpu_physical_memory_set_dirty_flag()
> Applying: system/physmem: Un-inline cpu_physical_memory_set_dirty_range()
> Applying: system/physmem: Remove _WIN32 #ifdef'ry
> Applying: system/physmem: Un-inline 
> cpu_physical_memory_set_dirty_lebitmap()
> Applying: system/physmem: Un-inline 
> cpu_physical_memory_dirty_bits_cleared()
> Applying: system/physmem: Reduce cpu_physical_memory_clear_dirty_range() 
> scope
> Applying: system/physmem: Reduce cpu_physical_memory_sync_dirty_bitmap() 
> scope
> Applying: system/physmem: Drop 'cpu_' prefix in Physical Memory API
> error: patch failed: hw/vfio/container.c:255
> error: hw/vfio/container.c: patch does not apply
> Patch failed at 0017 system/physmem: Drop 'cpu_' prefix in Physical 
> Memory API
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> harshpb:patches$
> 
> However, changes for ppc/spapr looks fine to me.

Sorry, I forgot the 'Based-on' tag on v1 and added it separately:
https://lore.kernel.org/qemu-devel/ef4baceb-671f-4afe-8a41-cafb89ea1707@linaro.org/
then forgot to add it again on v2 :/

> 
> Thanks
> Harsh



