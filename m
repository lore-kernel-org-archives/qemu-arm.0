Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp170043lff;
        Thu, 12 Dec 2019 17:33:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzV8CqziZL+uKSbvnfdHRVurClr7Bbe7ePfevcsaXN8FB4j7FZIARgglkE9xBhh6dfLr9O8
X-Received: by 2002:a05:6830:1608:: with SMTP id g8mr11140074otr.169.1576200812318;
        Thu, 12 Dec 2019 17:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576200812; cv=none;
        d=google.com; s=arc-20160816;
        b=eg8b/dRq4FDZtpUTORxyD6AFOzWePCm+lLN121QJBclVNhPyOUn8lumYPjQuhb/zf+
         YsuwnV9ITk35e8pPhMo/lqvvrlUm2QK4fx4TsxQ4i+N5DcPSbzVKarTD29nrcsyblvvU
         q1qNdg+3nmvSYKOeAZnrAh34t40h0EZY1HK4mxb9s6rUIAVj/XEXZn7ywl7u4AHSwQp6
         mN5xFlERBdSq5u0D3osVNWKCaYBLow1b7ZXRpGH5ow9i7yz7OmZokKcxMkaw97RoeZZv
         k69ZOXcoVnlHb22L0u4zeKjWbUyR/MmbgP3w3bLK6I1Uzu2Q6U3ZM92EGdxnW4DDF5Vr
         jRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xq7u/yPFq4clEQh0yyg9j9vXp34Z/WtY9Rb6zHIaCDI=;
        b=Q436QpR6tBXtGgs0ZAjOLBKuQmUWyNm3827+y20eDqdKVuRB59l+R7B9mvdlXJVo89
         0swr8IcHrkzMFO8lsFcZKbGWZhRvx0lq4d4LDrTDkptIBytsguonQkmLDmO/aA0fxnAE
         H4ENOWlYpnMX6nnMqhFr5CbteRdImH4DRBirMWCdsHiB9667Dv6X64f9y1RsM3HeBU7o
         NQartOD0PLOSO2+fW41r6DCkOmcoufUqrwKLEXdutLFHxwtOLGU+YTgO6Og6Vs6dPPML
         K2dqZpXqX5HQ2x86AzTi0Y19QCyFinrTqup5x8y+NL1LYgDBWy1kBh4YMNxhCG1go/WE
         7ABg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l125si4426399oih.223.2019.12.12.17.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 17:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifZpj-0007Kk-HR
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 20:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ifZpW-0007KQ-AV
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 20:33:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ifZpV-0002e2-6A
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 20:33:18 -0500
Received: from mga03.intel.com ([134.134.136.65]:14945)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1ifZpS-0002WF-93; Thu, 12 Dec 2019 20:33:14 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 17:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,307,1571727600"; d="scan'208";a="239148017"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.238])
 ([10.239.196.238])
 by fmsmga004.fm.intel.com with ESMTP; 12 Dec 2019 17:33:10 -0800
Subject: Re: [PATCH 2/2] numa: properly check if numa is supported
To: Igor Mammedov <imammedo@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1576154936-178362-1-git-send-email-imammedo@redhat.com>
 <1576154936-178362-3-git-send-email-imammedo@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <bf9dc1f6-514a-67ac-d09b-0b515545bf22@intel.com>
Date: Fri, 13 Dec 2019 09:33:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576154936-178362-3-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L2taGSAp6NrR

On 12/12/2019 8:48 PM, Igor Mammedov wrote:
> Commit aa57020774b, by mistake used MachineClass::numa_mem_supported
> to check if NUMA is supported by machine and also as unrelated change
> set it to true for sbsa-ref board.
> 
> Luckily change didn't break machines that support NUMA, as the field
> is set to true for them.
> 
> But the field is not intended for checking if NUMA is supported and
> will be flipped to false within this release for new machine types.
> 
> Fix it:
>   - by using previously used condition
>        !mc->cpu_index_to_instance_props || !mc->get_default_cpu_node_id
>     the first time and then use MachineState::numa_state down the road
>     to check if NUMA is supported
>   - dropping stray sbsa-ref chunk
> 
> Fixes: aa57020774b690a22be72453b8e91c9b5a68c516
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Leif Lindholm <leif.lindholm@linaro.org>
> CC: qemu-arm@nongnu.org
> CC: qemu-stable@nongnu.org
> 
> 
>   hw/arm/sbsa-ref.c | 1 -
>   hw/core/machine.c | 4 ++--
>   2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 27046cc..c6261d4 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -791,7 +791,6 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>       mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
>       mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
> -    mc->numa_mem_supported = true;
>   }
>   
>   static const TypeInfo sbsa_ref_info = {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1689ad3..aa63231 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -958,7 +958,7 @@ static void machine_initfn(Object *obj)
>                                           NULL);
>       }
>   
> -    if (mc->numa_mem_supported) {
> +    if (mc->cpu_index_to_instance_props && mc->get_default_cpu_node_id) {
>           ms->numa_state = g_new0(NumaState, 1);
>       }

I am wondering if @numa_mem_supported is unused here, it is unused for 
QEMU, because the only usage of @numa_mem_supported is to initialize 
@numa_state. Or there is other usage? So should it be removed from 
struct MachineClass?


