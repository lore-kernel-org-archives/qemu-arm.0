Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp275719lfg;
        Thu, 25 Feb 2021 03:47:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx4qoFNrK+ukozX/eI5xpMGwbvLyjZNg13kIZRMHGxUdEdDF0wE2zi8JEmciBMMQDgLaO4
X-Received: by 2002:a6b:c40b:: with SMTP id y11mr2228425ioa.205.1614253675474;
        Thu, 25 Feb 2021 03:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614253675; cv=none;
        d=google.com; s=arc-20160816;
        b=yFRfZloXiiX+cbFJGZJt7sofMaa5ksm7vlbg7WIY8QFukB7vax66wg2219vUH0c/Tb
         iCPK/ccGLZmYpoz7kxFvLf113ISGx5msM3HCHZ8RX7FaB9TPFtdMCllvtDxRRDGIXbY5
         MSbkULk7d8lJPeqPKEn5u/Pf1LlmdMdJFntWFrAUZqYSiGbTTeGPQqIkMxNO2J6LA4T0
         5xSpwEVMNqIKEZeuEaVQdxzsUbtIcZdHd7Kbe04EgfUC7e/IKNPiQmYDhh9kZXXgwE/a
         G5HDIWFj4bhKTPuEhfmgzrVpN2ceY0ixwSquFu7RVI0eId3scv05lOOViGNA85YQ518j
         ZYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4gyZvG1CnyZJcbsIKlmlk2mlU2HIrNBV0wH+jOOR6jo=;
        b=K48Mi56YI+LsNtHoAX/dzy5sMt781UeH0EI9Xbiwoe3Rmw40VjfNTY6pEkOqpoqAK1
         gZjfV2JaV3O93HHAWlJAI8yxzdWPgagpAPjeeEUwQBGL50bChMCWp8eGjaqu8wGuxvju
         TnYU3WynsW5Z767LeUuWh27ud0nQqe97fXwX3kNXGGpCwrnyA//F5xD0oCf8bOp0/GDn
         TYcxdCci9KlR5Mk9ERrQSuX9aZ5/9NhKeh0OJygpQwf0lDm3Z3L8YujDx4CIad0Qfbtm
         j81ebUBc32LNWNeib/qGufjjKOuSz4kDOf5p2WE+l3nTXcw+m8N5mnEB1oSbVo1Bv3iQ
         tZkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KPuBfGOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si4660301ilj.116.2021.02.25.03.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KPuBfGOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFF7a-0006jx-Pc
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFF7T-0006jr-Vl
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFF7R-0004i6-Tw
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614253665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4gyZvG1CnyZJcbsIKlmlk2mlU2HIrNBV0wH+jOOR6jo=;
 b=KPuBfGOQH5jkzYpTimU9v+jWPpAvQu8l+upD/7MA4a66UPEXqmxEB1GnmAGSnEsbrBqhJK
 2JuPouOBBUOalG2ZMdsaRxNaLqbtu5VrWyXnECnl8EgQMyejyX/0NdZAZjPo4gd7J5IBuV
 LMbYIUEwYvVhsvalo4NE5BN+qXP2GPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-8IpdxKtoNwSBSp90YzgZZQ-1; Thu, 25 Feb 2021 06:47:43 -0500
X-MC-Unique: 8IpdxKtoNwSBSp90YzgZZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6782A1020C21;
 Thu, 25 Feb 2021 11:47:41 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B9D85D9D7;
 Thu, 25 Feb 2021 11:47:35 +0000 (UTC)
Date: Thu, 25 Feb 2021 12:47:32 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 4/5] hw/acpi/aml-build: add processor hierarchy node
 structure
Message-ID: <20210225114732.5f7gqgl7lym7d4hs@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-5-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210225085627.2263-5-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, Henglong Fan <fanhenglong@huawei.com>,
 alistair.francis@wdc.com, qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BjlkbOqPWhGh

On Thu, Feb 25, 2021 at 04:56:26PM +0800, Ying Fang wrote:
> Add the processor hierarchy node structures to build ACPI information
> for CPU topology. Since the private resources may be used to describe
> cache hierarchy and it is variable among different topology level,
> three helpers are introduced to describe the hierarchy.
> 
> (1) build_socket_hierarchy for socket description
> (2) build_processor_hierarchy for processor description
> (3) build_smt_hierarchy for thread (logic processor) description
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 40 +++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/acpi-defs.h | 13 ++++++++++++
>  include/hw/acpi/aml-build.h |  7 +++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index a2cd7a5830..a0af3e9d73 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1888,6 +1888,46 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   table_data->len - slit_start, 1, oem_id, oem_table_id);
>  }
>  
> +/*
> + * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
> + */
> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
> +    build_append_byte(tbl, 20);         /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
> +    build_append_int_noprefix(tbl, ACPI_PPTT_PHYSICAL_PACKAGE, 4);

Missing '/* Flags */'

> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> +}
> +
> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> +                               uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR);  /* Type 0 - processor */
> +    build_append_byte(tbl, 20);         /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> +}
> +
> +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
> +    build_append_byte(tbl, 20);           /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
> +    build_append_int_noprefix(tbl,
> +                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
> +                              ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD |
> +                              ACPI_PPTT_ACPI_LEAF_NODE, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent , 4); /* parent */

'parent' not capitalized. We want these comments to exactly match the text
in the spec.

> +    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..45e10d886f 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -618,4 +618,17 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>  
> +enum {
> +    ACPI_PPTT_TYPE_PROCESSOR = 0,
> +    ACPI_PPTT_TYPE_CACHE,
> +    ACPI_PPTT_TYPE_ID,
> +    ACPI_PPTT_TYPE_RESERVED
> +};
> +
> +#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
> +#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
> +#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)      /* ACPI 6.3 */
> +#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)      /* ACPI 6.3 */
> +#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)      /* ACPI 6.3 */
> +
>  #endif
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 380d3e3924..7f0ca1a198 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -462,6 +462,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> +
> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> +                               uint32_t parent, uint32_t id);
> +
> +void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);

Why does build_processor_hierarchy() take a flags argument, but the
others don't? Why not just have a single 'flags' taking function,
like [*] that works for all of them? I think that answer to that is
that when cache topology support is added it's better to break these
into separate functions, but should we do that now? It seems odd to
be introducing unused defines and this API before it's necessary.

[*] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11

Thanks,
drew

> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> -- 
> 2.23.0
> 
> 

