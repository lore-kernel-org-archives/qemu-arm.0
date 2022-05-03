Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1274139lfj;
        Tue, 3 May 2022 02:04:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrL2bUsuigDZCDrtnA1fULCD3DFCWq6MpeEpmmFtwQm5eguJ2KG9ODb1tAK0QaMMeH4s5C
X-Received: by 2002:a05:6214:3002:b0:446:2083:6939 with SMTP id ke2-20020a056214300200b0044620836939mr12604946qvb.43.1651568655880;
        Tue, 03 May 2022 02:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651568655; cv=none;
        d=google.com; s=arc-20160816;
        b=gKdsivq0xVAaNXQfAlZCVFvcfd3scJnj+0r63q2Zi35qR8WQ2QFgzz1e83Xmx1ogxF
         nYQISRguB7kw6APh5cEPZWyaZvNd6gz4iw/33dc+9Xfq/UTtw+cuIhzfvJzbaVmvJd72
         Cof1ujs4PdbXt4lH9rU0CzpPMFsA2R9nGpXIg20M7tJ4fzviM0+HBcoY7JyisDAGvvM7
         YRQ5CKp06GRGRJbHTzJ/nsJsMVN2ZvhB8ChjdnSp4c/SpIZa/01jTewd9F2JfUYX04Sf
         B8mjLSJQkS2KGKuzHwUYfMny0CV7GdqCQw0A0EZdWZwxE8acZBx2wHFVZIU+A/FgBPby
         Txdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Ynf200O3Ih5MndiHA1iT4GFgB8QjKekL1cYyVcI3uZ0=;
        b=jeZO/lwDH7ePPFTFoJW0M0Mi3Ncd5qtbzMCT8V/umMZ5j+T2sLyCWiNpoOZ6aCjPmy
         7tYfvCTaxKYDuPaLFHsCknpShq3QXe3QFKrqYw4kbOVJbLdU2He5YfJfu8pVnCbLTu/b
         NzCn9BS55l2uROuaM4UDRTMVQ5tcL/obesCGCnSigD5xjZJvlXmomQeXB8N6YUAFzgnn
         qm3LUnQf58LqiyF3jpz5TbaS2hk6zcM05fYRjhXO2ghL5fORtvYiO/3umfbF/92pqfzs
         Oa0ziWjNqtx/ShvfiKoBPR/cUGiXBC3c4UDhb6rBR33qHVvNbD+EYHoYtGBYZpn+/QLh
         Aemg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IfMcWcK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020ae9ee16000000b0069f9e4d85e0si6217863qkg.714.2022.05.03.02.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 02:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IfMcWcK8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nloS7-0007kF-BZ
	for alex.bennee@linaro.org; Tue, 03 May 2022 05:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloJ8-0004hS-IA
 for qemu-arm@nongnu.org; Tue, 03 May 2022 04:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nloJ6-0005oq-SC
 for qemu-arm@nongnu.org; Tue, 03 May 2022 04:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ynf200O3Ih5MndiHA1iT4GFgB8QjKekL1cYyVcI3uZ0=;
 b=IfMcWcK8FDwsLSA9f46XerJog3J8QYikKS+GLUpxd2xJ+KzKCa3OcL2LvL2hh+ODQtOI7y
 LYuDifgIVQk3fFyAFnpXcD8qqt2jdYbJgg5pVENWc8ip0I0fI5NYBziO/Suc7ldaIhdBwh
 hYRxZfxC8/Zsku00tzd7F+fztice8H4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-r6vSpArfM5-3C592Cl6W6A-1; Tue, 03 May 2022 04:54:54 -0400
X-MC-Unique: r6vSpArfM5-3C592Cl6W6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 j5-20020a05600c1c0500b0039419a269a1so3919125wms.3
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 01:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ynf200O3Ih5MndiHA1iT4GFgB8QjKekL1cYyVcI3uZ0=;
 b=rvwGwD9bqwl8Aq0dPg2/SHdWbJ1d8vr6wONlnId6HYT2bpQIqvrfJ8Jkh8NKCeBgHF
 WgH6NXgMbVwzoEtTllJK4uyegBw5RGW00+CCXk+83ApZiKpMWMeKqAkHOuDQR2wunWO5
 T7819aMujxnvj/Ynb5BdoflzzL1n4pJSRYYkYQoztwQyfuGmftvxhz8hWGXvbkqWqo8Z
 TxqpxprR5V5MFgLuGkkRElxbdGLnEaiGtVfhg6oQ9CwrgR0edz2aox+surwpaMpqZk3R
 lmA2pv1tjw3hadY4iInailHkxMreBLzuY039GFSDj0uN7pDhhsenT/1x7bvstQPx0eC8
 HZ4A==
X-Gm-Message-State: AOAM532+ZFf5jhXuMB2Xg3lwCMTBiKIMv985Lw2LI8x06H8qh65DVwhh
 kkmKPk5fbjViPYL6ro7V8TCRTYAnJpce/adf5abui3v56KZFTG3RhAygtmDxHpBPJ149ad82Wco
 UOjRFjdgf4xPQ
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr2377634wmb.199.1651568093636; 
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr2377615wmb.199.1651568093407; 
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003942a244ed7sm1202325wmb.28.2022.05.03.01.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 01:54:53 -0700 (PDT)
Date: Tue, 3 May 2022 10:54:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, berrange@redhat.com,
 shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 armbru@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org,
 wangyanan55@huawei.com
Subject: Re: [PATCH v8 1/5] qapi/machine.json: Add cluster-id
Message-ID: <20220503105451.40a00f2e@redhat.com>
In-Reply-To: <20220425032802.365061-2-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
 <20220425032802.365061-2-gshan@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+vYBIYocciy

On Mon, 25 Apr 2022 11:27:58 +0800
Gavin Shan <gshan@redhat.com> wrote:

> This adds cluster-id in CPU instance properties, which will be used
> by arm/virt machine. Besides, the cluster-id is also verified or
> dumped in various spots:
> 
>   * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>     CPU with its NUMA node.
> 
>   * hw/core/machine.c::machine_numa_finish_cpu_init() to record
>     CPU slots with no NUMA mapping set.
> 
>   * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>     cluster-id.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine-hmp-cmds.c |  4 ++++
>  hw/core/machine.c          | 16 ++++++++++++++++
>  qapi/machine.json          |  6 ++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 4e2f319aeb..5cb5eecbfc 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>          if (c->has_die_id) {
>              monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>          }
> +        if (c->has_cluster_id) {
> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
> +                           c->cluster_id);
> +        }
>          if (c->has_core_id) {
>              monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>          }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index cb9bbc844d..700c1e76b8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -682,6 +682,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>              return;
>          }
>  
> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
> +            error_setg(errp, "cluster-id is not supported");
> +            return;
> +        }
> +
>          if (props->has_socket_id && !slot->props.has_socket_id) {
>              error_setg(errp, "socket-id is not supported");
>              return;
> @@ -701,6 +706,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                  continue;
>          }
>  
> +        if (props->has_cluster_id &&
> +            props->cluster_id != slot->props.cluster_id) {
> +                continue;
> +        }
> +
>          if (props->has_die_id && props->die_id != slot->props.die_id) {
>                  continue;
>          }
> @@ -995,6 +1005,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>          }
>          g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>      }
> +    if (cpu->props.has_cluster_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
> +    }
>      if (cpu->props.has_core_id) {
>          if (s->len) {
>              g_string_append_printf(s, ", ");
> diff --git a/qapi/machine.json b/qapi/machine.json
> index d25a481ce4..4c417e32a5 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
>  # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
> +# @core-id: core number within cluster the CPU belongs to
>  # @thread-id: thread number within core the CPU belongs to
>  #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>  #       but management should be prepared to pass through other
>  #       properties with device_add command to allow for future
>  #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>    'data': { '*node-id': 'int',
>              '*socket-id': 'int',
>              '*die-id': 'int',
> +            '*cluster-id': 'int',
>              '*core-id': 'int',
>              '*thread-id': 'int'
>    }

