Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10232745lfb;
        Mon, 3 Jan 2022 03:24:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgRquyhwYYTSz3brvEXw0WsovHnk6bkn6UWtC2kvU/t4dZRMtZM9Uf8UkDemXDQRSV4MBi
X-Received: by 2002:a25:da4a:: with SMTP id n71mr50131438ybf.600.1641209067847;
        Mon, 03 Jan 2022 03:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641209067; cv=none;
        d=google.com; s=arc-20160816;
        b=sC1C6+CoGsqDpL3S0YRRHWhx4lLZcNP/3zokoDrEUd6/dL4TpXtwkJ++N8FAdkUaSL
         egM+V4sg3jFQ5JFzd8UdlDOEkAfI5NXUZs7O5JXWYoUZJfTNldF1QtHJff1OsMsq5fKX
         Jy3DMyWGtX9/GQRqH6WyKXGIVdJUCqflqZeHysa9LecKllSKWuFtRjNGbGgYciAV8OZ7
         D6Sy2UcKpKY6VVBAQxPT3n/plnAfgG0jsDzGVM0OiFV/4tv1bKPZaUXtuG55o2Ex9RBV
         0CYXsgioi0IjFNX7jIzqmn21StcH67hEgmGedRdZbz4xDSBTEX96h+dtzQrpSWuapVZJ
         4XBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=y8543RBcbTiihZAEfg+TpAZCXc3IeQ2oAodPtdz2D7Y=;
        b=DJIOA6A7347UISqJPau/K0HmAINHU5XSz4BV81BlHN6Q16eOgZyMyVETbj31Xk8ZkF
         FrzyNCqzWLXF202HfTEUee29QsA+U6C85hie15E4SH5RlaeRnQzp3I3OorIUmcGhiPEf
         UQgxQp9hfzaYRUAYCdQfTL4bAbpPX+n6qsFiCahva+yltDfgQpQ0jGyBpVvdHKwJTKHc
         vUcdd7hcihouXgBzJaJ2ADGSkqBMnd8jdDsIACZxXPrgjPNEWmT0LwnAIevpiQI5W66X
         FCxD2BgTOwoxI6IpCGyjK9VzwF3GZneB6g+3GaiSMPdkWquyj0zcEFKPzyaNCCLNiIgI
         gArQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AsSdG2Md;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si4018988ybt.486.2022.01.03.03.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 03:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AsSdG2Md;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4LRz-0003xr-6c
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 06:24:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LRo-0003tG-5f
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:24:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LRl-0001gf-I1
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y8543RBcbTiihZAEfg+TpAZCXc3IeQ2oAodPtdz2D7Y=;
 b=AsSdG2Mdv2X8WFbcA2V7ODJzsc66+/hsXdYNwvjQxIbKkhMTPudsZKqfTlsPXPhiHe5LgQ
 absuyBYcOSLtik/NvJ/Jsq48Ci4HyGII6bqnSBAOLLVWZIdxNEjn70caVq1fqAnh8dwD+X
 E0ZQKVvUk/2ze9C0Db6uRgvR8yuokmQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-yoZTrM6NOoSkydCD0mo3WA-1; Mon, 03 Jan 2022 06:24:11 -0500
X-MC-Unique: yoZTrM6NOoSkydCD0mo3WA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so22662628edd.11
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 03:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y8543RBcbTiihZAEfg+TpAZCXc3IeQ2oAodPtdz2D7Y=;
 b=QrSYhlx94owvrc8O/sQkdlBhiYTKcfyJpxrKW0i0a5Ktt27zicG8S5XIvoLVsWu2OU
 0xYmXcP0DDAEEHw3zbMRHCrNtgMP0VIgd4Gt5loXjzqrgrgcBfX8LxvWXOPHwC5mVj7X
 AIa4D0uOoG9S518sWkATr0+QfVU6M7MtmjYtTQfFnpA81iGlNweYGNqbcotkAtLkLHGq
 PXnJAdJlEul7yg+s2px0mrO1IIE+jkqjpmrfLeBMMDU+thLyG3ooGSrSN/pIXxO3Gv8n
 NAZIM/PfIs+7ER6Wg0eZFVSKZKgU31eF+UGBdBulvh/SO1rimn1i/D/UezAWNZ2iEiAX
 xjrg==
X-Gm-Message-State: AOAM532L7gchGCyhpj3C2Gr8bQJ2gSqee2RdZ+WA2jdmvQ7vWviGsnsN
 h3ZfT8YbAgxh0e6rkhyM+JVtQ5hOLh07P3jR6RhgwIW/ns7vBqViveW9acoOBS6qKdMTfifjjfo
 APQ1ibhppmFH7
X-Received: by 2002:a17:907:7f29:: with SMTP id
 qf41mr35422736ejc.715.1641209050364; 
 Mon, 03 Jan 2022 03:24:10 -0800 (PST)
X-Received: by 2002:a17:907:7f29:: with SMTP id
 qf41mr35422716ejc.715.1641209050123; 
 Mon, 03 Jan 2022 03:24:10 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id gs17sm10467012ejc.116.2022.01.03.03.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:24:09 -0800 (PST)
Date: Mon, 3 Jan 2022 12:24:07 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 3/7] hw/acpi/aml-build: Improve scalability of PPTT
 generation
Message-ID: <20220103112407.p7aep3yqnlhevylc@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hrfw446xTAT8

On Mon, Jan 03, 2022 at 04:46:32PM +0800, Yanan Wang wrote:
> Currently we generate a PPTT table of n-level processor hierarchy
> with n-level loops in build_pptt(). It works fine as now there are
> only three CPU topology parameters. But the code may become less
> scalable with the processor hierarchy levels increasing.
> 
> This patch only improves the scalability of build_pptt by reducing
> the loops, and intends to make no functional change.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b3b3310df3..be3851be36 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>  void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
> -    int pptt_start = table_data->len;
> +    GQueue *list = g_queue_new();
> +    guint pptt_start = table_data->len;
> +    guint father_offset;

"parent_offset" would be more conventional.

> +    guint length, i;
>      int uid = 0;
>      int socket;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
> @@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      acpi_table_begin(&table, table_data);
>  
>      for (socket = 0; socket < ms->smp.sockets; socket++) {
> -        uint32_t socket_offset = table_data->len - pptt_start;
> -        int core;
> -
> +        g_queue_push_tail(list,
> +            GUINT_TO_POINTER(table_data->len - pptt_start));
>          build_processor_hierarchy_node(
>              table_data,
>              /*
> @@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>               */
>              (1 << 0),
>              0, socket, NULL, 0);
> +    }
>  
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            uint32_t core_offset = table_data->len - pptt_start;
> -            int thread;
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int core;
>  
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (core = 0; core < ms->smp.cores; core++) {
>              if (ms->smp.threads > 1) {
> +                g_queue_push_tail(list,
> +                    GUINT_TO_POINTER(table_data->len - pptt_start));
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (0 << 0), /* not a physical package */
> -                    socket_offset, core, NULL, 0);
> -
> -                for (thread = 0; thread < ms->smp.threads; thread++) {
> -                    build_processor_hierarchy_node(
> -                        table_data,
> -                        (1 << 1) | /* ACPI Processor ID valid */
> -                        (1 << 2) | /* Processor is a Thread */
> -                        (1 << 3),  /* Node is a Leaf */
> -                        core_offset, uid++, NULL, 0);
> -                }
> +                    father_offset, core, NULL, 0);
>              } else {
>                  build_processor_hierarchy_node(
>                      table_data,
>                      (1 << 1) | /* ACPI Processor ID valid */
>                      (1 << 3),  /* Node is a Leaf */
> -                    socket_offset, uid++, NULL, 0);
> +                    father_offset, uid++, NULL, 0);
>              }
>          }
>      }
>  
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int thread;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (thread = 0; thread < ms->smp.threads; thread++) {
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 2) | /* Processor is a Thread */
> +                (1 << 3),  /* Node is a Leaf */
> +                father_offset, uid++, NULL, 0);
> +        }
> +    }
> +
> +    g_queue_free(list);
>      acpi_table_end(linker, &table);
>  }

This patch actually increases the number of loops, since we need to visit
higher hierarchical nodes twice (once to enqueue and once to dequeue). We
do reduce code indentation and it looks like we could more easily skip
hierarchy levels we don't want, though. While my impulse is to say we
should just keep this simple and add another nested loop for clusters, I
guess I'm OK with this too.

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

