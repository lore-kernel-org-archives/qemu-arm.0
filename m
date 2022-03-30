Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp977137lfb;
        Wed, 30 Mar 2022 07:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3yItocCBgoI9rRyKuk21JLy8SNB3g2MUQH7kDKKjo8lLi4LC3MIDgH5NdxYhkkbWg/zxD
X-Received: by 2002:a05:622a:28a:b0:2e1:f71f:9cf8 with SMTP id z10-20020a05622a028a00b002e1f71f9cf8mr33224672qtw.184.1648649483173;
        Wed, 30 Mar 2022 07:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648649483; cv=none;
        d=google.com; s=arc-20160816;
        b=Jx0/k2Hx3/W8YNqpeyiXHZlmyBe+I5IugmE7tG+Za6HFQ1p5KFYCdpbik41EnNq5AJ
         ZYqNB9LVS9OJuiDyr+3qPgsQoRmrcoVbvWPZOlLT+I10BdOT3y0hFJjV4PW58Os54v5Y
         KPbpMGGhrpHgPwNd8Z5RiHU22p4+05OyEXjKM1m2SIeWaWVWyC/jxfCIRpgy9V1MzzbQ
         gwQYW5SKlDz4rCKiwP7lVuA1gS+tZ3fg7SM9UWrHuGql88XbtCxZg81tH45/wJV713Rf
         uBaOE8sObq58Ch1359+ZrkqzL6VYrQKkPOUn2TePHEq4JUhG4fnpihqdT1E38DqEnkb9
         Zvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=XGha0LN4yIpz+2QmjNP4jXhpkJkaIAoDwpKa+sKvHG4=;
        b=F/3Nb6KXbS3LfBA0eMA6d7tjJkPOeHi5fBIIFbrh0rt3vp0yF9DOgdSQCMBjmJqnFH
         LPJbOPIs1dNdK7W6jKlxiIFF9V5j8CdzarNBb1hMXjuHg5l6h/99iCA51AdnpWKaUw4h
         old8LuXXxcSuLQs445L5BeRRQ6mEElLyrmOVeb6Ye8m3dd1vfKN8YbGR1TKQy9G48MOb
         V9bx5ma8fVbCEL/kRON4fzPCCvKFhIjnPdOMe/ys+55yeJBOuBfBvZpftJbpZIEq5gjk
         oVFYcQuMWIjUqORR5hcX26BTp9hAE+0z8WKflmwbhvcFsC755jzFqpcq9FpmhA6kiavb
         xUkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c5qfOUt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89-20020a0c8062000000b00440ea37a04dsi10702455qva.259.2022.03.30.07.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Mar 2022 07:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c5qfOUt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZZ2g-0002LM-M1
	for alex.bennee@linaro.org; Wed, 30 Mar 2022 10:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZZ2V-0002Kk-Mv
 for qemu-arm@nongnu.org; Wed, 30 Mar 2022 10:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZZ2S-0002o3-37
 for qemu-arm@nongnu.org; Wed, 30 Mar 2022 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648649465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGha0LN4yIpz+2QmjNP4jXhpkJkaIAoDwpKa+sKvHG4=;
 b=c5qfOUt8RIAvGRV7aC1WM60GpLm8Qfb6Pc2kFuiXIXdGu2/IUhbBNOwfbHuwnS8OZURMkV
 ng9D0936Y7DIbFC8NC49JOCOnMa75d5NQv0LxPe6lQhXkZhCDS1WlqLgbvuhGvSoHLZAWG
 xSvEGH6VPDpU5SFMKzp451OElPA1joA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-tRz2WdmrPJ2UUT2OLMl5Ow-1; Wed, 30 Mar 2022 10:11:04 -0400
X-MC-Unique: tRz2WdmrPJ2UUT2OLMl5Ow-1
Received: by mail-ed1-f69.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so13046512eda.5
 for <qemu-arm@nongnu.org>; Wed, 30 Mar 2022 07:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGha0LN4yIpz+2QmjNP4jXhpkJkaIAoDwpKa+sKvHG4=;
 b=q42Z92v6cbTTpXPlZisJzVC9WxE+mwCyA9hWRYnXoSde0cBz1VzNUhdVrJrCaDoM3E
 4wd4Oz/QAhysSAm3qPJGb6bP9/Lev4GD7e5M0CNX6EPxEuxp4SU+xrh6+1+OrjLAfIfy
 ijBvYaHDqNOWBi/yEU78omT8UP12fbxexsGAl8qTPDNj5VNhYltceii0tTG05gCl+n4z
 vpcqG7sVNZJbpgHjCJxwibEJM2Xb/bPlEotMI9g8bEXjSTvpEb2XOT4lnsWHc7nJMDzh
 8IQ3h8Cm5N8TxNerYCQTPTJp3GD6sEEYGppP83mixOcfObwAt1QHz0vVR5F0ZZcBxafM
 y61Q==
X-Gm-Message-State: AOAM530rXnyleit9mOgTRJErLdFt1N5J5Zm/79VzhT8EHA0FgPC5ovbe
 EGsmj0a7fQby8GYI1WbWVgClVr5mGvtO/FrP7YcmE1Fwmib289bgMnZJxuhYhlRHoeEqP5mZK/T
 mNDaT2Z5hdhv8
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr39157712ejs.40.1648649463058; 
 Wed, 30 Mar 2022 07:11:03 -0700 (PDT)
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr39157675ejs.40.1648649462806; 
 Wed, 30 Mar 2022 07:11:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090674cd00b006df78d85eabsm8349859ejl.111.2022.03.30.07.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 07:11:02 -0700 (PDT)
Date: Wed, 30 Mar 2022 16:10:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 3/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220330161059.14e3a990@redhat.com>
In-Reply-To: <20220323072438.71815-4-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4XKnsv8PN8j9

On Wed, 23 Mar 2022 15:24:37 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
> 
> This avoids to re-calculate the CPU topology by reusing the existing
> one in ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/aml-build.c | 96 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 72 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..10a2d63b96 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    GQueue *socket_list = g_queue_new();
> +    GQueue *cluster_list = g_queue_new();
> +    GQueue *core_list = g_queue_new();
>      GQueue *list = g_queue_new();
>      guint pptt_start = table_data->len;
>      guint parent_offset;
>      guint length, i;
> -    int uid = 0;
> -    int socket;
> +    int n, socket_id, cluster_id, core_id, thread_id;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
>  
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +    for (n = 0; n < cpus->len; n++) {
> +        socket_id = cpus->cpus[n].props.socket_id;
> +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
> +            continue;
> +        }

maybe instead of scanning cpus[n] every time for each topology level
and trying to keep code flattened (which mimics PPTT fattened tree
table for not much of the reason, spec doesn't require entries
from the same level to e described contiguously),
try to rebuild hierarchy tree from flat cpus[n] in 1 pass first
and then use nested loops or recursion to build PPTT table,
something like:

 sockets = cpus_to_topo(possible) 
 build_pptt_level(items = sockets, parent_ref = 0)
  for item in items
     level_ref = table_data->len - pptt_start
     build_processor_hierarchy_node(item {id, flags, ...}, parent_ref)
     if not leaf:
        build_pptt_level(item, level_ref)

which is much more compact and easier to read compared to
unrolled impl. it's now with all push/pop stack emulation.


> +
> +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
>          g_queue_push_tail(list,
>              GUINT_TO_POINTER(table_data->len - pptt_start));
>          build_processor_hierarchy_node(
> @@ -2023,65 +2032,104 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               * of a physical package
>               */
>              (1 << 0),
> -            0, socket, NULL, 0);
> +            0, socket_id, NULL, 0);
>      }
>  
>      if (mc->smp_props.clusters_supported) {
>          length = g_queue_get_length(list);
>          for (i = 0; i < length; i++) {
> -            int cluster;
> -
>              parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +
> +            for (n = 0; n < cpus->len; n++) {
> +                if (cpus->cpus[n].props.socket_id != socket_id) {
> +                    continue;
> +                }
> +
> +                cluster_id = cpus->cpus[n].props.cluster_id;
> +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
> +                    continue;
> +                }
> +
> +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
>                  g_queue_push_tail(list,
>                      GUINT_TO_POINTER(table_data->len - pptt_start));
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> +                    parent_offset, cluster_id, NULL, 0);
>              }
>          }
>      }
>  
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
> -        int core;
> -
>          parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> +        if (!mc->smp_props.clusters_supported) {
> +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> +        } else {
> +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
> +        }
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (!mc->smp_props.clusters_supported &&
> +                cpus->cpus[n].props.socket_id != socket_id) {
> +                continue;
> +            }
> +
> +            if (mc->smp_props.clusters_supported &&
> +                cpus->cpus[n].props.cluster_id != cluster_id) {
> +                continue;
> +            }
> +
> +            core_id = cpus->cpus[n].props.core_id;
> +            if (ms->smp.threads <= 1) {
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (1 << 1) | /* ACPI Processor ID valid */
>                      (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    parent_offset, core_id, NULL, 0);
> +                continue;
> +            }
> +
> +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
> +                continue;
>              }
> +
> +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
> +            g_queue_push_tail(list,
> +                GUINT_TO_POINTER(table_data->len - pptt_start));
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (0 << 0), /* not a physical package */
> +                parent_offset, core_id, NULL, 0);
>          }
>      }
>  
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
> -        int thread;
> -
>          parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
> +
> +        for (n = 0; n < cpus->len; n++) {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                continue;
> +            }
> +
> +            thread_id = cpus->cpus[n].props.thread_id;
>              build_processor_hierarchy_node(
>                  table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 2) | /* Processor is a Thread */
>                  (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                parent_offset, thread_id, NULL, 0);
>          }
>      }
>  
>      g_queue_free(list);
> +    g_queue_free(core_list);
> +    g_queue_free(cluster_list);
> +    g_queue_free(socket_list);
>      acpi_table_end(linker, &table);
>  }
>  

