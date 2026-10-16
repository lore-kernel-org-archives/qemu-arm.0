Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC6CCCA462
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 12:33:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHh7R-0008BG-NN; Fri, 16 Oct 2026 08:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHh7P-0008Az-Je
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 08:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xHh7N-0002Du-GC
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 08:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792153979;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zwror2p8KN+DkhwJz1nlrN5PC2zqCKnxg3U809RTV4=;
 b=QdplgxqJiHm3aM9cSES3ROEVa3O19GLhdcSL650FqJivdVc3ySJdQ4AFjcxdWO7sp0Itnn
 BPcMpGtCyOJ0A1RSd9pzUYFQ5Ijf7F8GlcachCZ86wUmCE2zmN0t/hklkil/RyuX7J5Wwt
 sDm30dA5yMw8PqaCEdw9TrczT6okWfs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-inFc4aZ5OmaPFPlcmUWowg-1; Fri, 16 Oct 2026 12:32:39 +0000
X-MC-Unique: inFc4aZ5OmaPFPlcmUWowg-1
X-Mimecast-MFC-AGG-ID: inFc4aZ5OmaPFPlcmUWowg_1792153958
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-48e00f3929bso274584f8f.0
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792153958; x=1792758758;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Zwror2p8KN+DkhwJz1nlrN5PC2zqCKnxg3U809RTV4=;
 b=M3dQeIq4GPao17GdUdPplKYAMEvuygyzGNlOhogU+p+fw/8ny3lnUoz7PukPy4v5sD
 inxZKOKJaeHhOff8nsRpv8zOA7+x7Dy60NG+9c7EpN5+8TCsk95bmhyAAOW6OwdkW3TW
 4KLgtj4iSsmD8HHIVug3Q+S9rJekXLPyPa9mac/KJopbUw2MRQegajLJI2MReXHJ6bLv
 5VOw8oOBFqFGeDcDEGtxsRF1g91c1Qtc5qC1+DQKwoYkzBkVfjkuEQmoCh5vGVTdElG1
 fU9ed2wqOwRqP5vXGeNeOGC1jbN0xDjQp9zJkwYUAh3+q+xUtDFSAv5mE6u30HgjqADA
 rjxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6e67VNVy4QGdwP4ozqv7kyTQydvDdY0vCQ+MMBQqWPTfvJxp6BWDeX5L60wDR5DR+Am6lE006rA==@nongnu.org
X-Gm-Message-State: AFq9FYLAKk87gschq3VdDDC+WE0ioAoTJ+3QFyLz6MmvX9LESZv6qhmo
 qBKqUhS60Cs/fszsueCx6fK5ACXIRSUXeX25Ai1Y+UtC4kIU/YV6FHOJfEfcF0TnfUAqT4piDf4
 yRkrqFayrGeKlUyP/vXhr0AUhp1/EjzBfXnzPiz3VbcDuIcPMBwrStw==
X-Gm-Gg: AYBFou0hZFHC91and4eqaskwRWT8FILL0dpNfAMcWGpQLJSw1BubYni4VmUWkcUf+JP
 i1nsJIAfdikeXcZGeKYVNaiXcGXJi8WT5HSeDCeEiw0oMUNyVQu+r0l0RU+ijDW+53ouiIl/z3M
 9t+/kRagusNJehfG6FMW2K0Q0e7EUAAHARFBCAPQ4wEXIrl4QSWl2jnf90Uj9KKnBqPhORtswpy
 tv7t6fuS6lIu9gkZ1DWaZ97FFyMXXmbpqati/Y1Rsmqtz7ox0SWceoZOVpkXHtN8iQFQaKvUv8g
 1CbghSDbJjqqYz8RsMCi0BBRYuF3jWc64pacpfjR7t51iaxgsnWuSZnlHz6u6vbvIs+jmyyg8wM
 tIJ18EWx1/I8gyyOGLV5x2GEbgCgsN83kmawI0liaa3jKtaNl
X-Received: by 2002:a05:6000:469b:b0:48a:f4b7:25c4 with SMTP id
 ffacd0b85a97d-48dfacf5408mr4857835f8f.1.1792153958301; 
 Fri, 16 Oct 2026 05:32:38 -0700 (PDT)
X-Received: by 2002:a05:6000:469b:b0:48a:f4b7:25c4 with SMTP id
 ffacd0b85a97d-48dfacf5408mr4857781f8f.1.1792153957862; 
 Fri, 16 Oct 2026 05:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f9c41sm5130048f8f.38.2026.10.16.05.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 05:32:37 -0700 (PDT)
Message-ID: <fc9f71e8-7b5e-44ea-97a3-895ea050f8ef@redhat.com>
Date: Fri, 16 Oct 2026 14:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 19/25] target/arm/qmp: allow named CPU models on
 cpu-model-expansion
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 ping@khushitshah.com, sandesh.patel@nutanix.com
References: <20260921123249.1708067-1-khushit.shah@nutanix.com>
 <20260921123249.1708067-20-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260921123249.1708067-20-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1PUhn0UVlOGx9XwhqOrtPnFUWjKoNoYzZ49BUZziTN0_1792153958
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/21/26 2:32 PM, Khushit Shah wrote:
> Allow expansion of the new KVM-only named CPU models through the
> cpu-model-expansion QMP query.
>
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

we might need to add some new tests in tests/qtest/arm-cpu-features.c too

Eric
> ---
>  target/arm/arm-qmp-cmds.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
> index 5fbdca3253..0940285af1 100644
> --- a/target/arm/arm-qmp-cmds.c
> +++ b/target/arm/arm-qmp-cmds.c
> @@ -36,6 +36,7 @@
>  #include <linux/kvm.h>
>  #include "system/kvm.h"
>  #include "cpu.h"
> +#include "cpu-models.h"
>  
>  static GICCapability *gic_cap_new(int version)
>  {
> @@ -96,6 +97,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>      Object *obj;
>      const char *name;
>      int fdarray[3];
> +    bool named_model = (arm_find_model(model->name) != NULL);
>      int i;
>  
>      if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> @@ -108,6 +110,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>          return NULL;
>      }
>  
> +    if (!kvm_enabled() && named_model) {
> +        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
> +        return NULL;
> +    }
> +
>      oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
>      if (!oc) {
>          error_setg(errp, "The CPU type '%s' is not a recognized ARM CPU type",
> @@ -121,6 +128,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>          if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
>              /* These are kvmarm's recommended cpu types */
>              supported = true;
> +        } else if (named_model) {
> +            supported = true;
>          } else if (current_machine->cpu_type) {
>              const char *cpu_type = current_machine->cpu_type;
>              int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);


