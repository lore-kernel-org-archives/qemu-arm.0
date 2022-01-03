Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10236885lfb;
        Mon, 3 Jan 2022 03:33:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzERe2264qPVYUEUqJic7lH1I0ig7eXK2gx8beXOpiU88jWvXhMREepvKqO3CsnOi7T1P3C
X-Received: by 2002:a05:6902:4c1:: with SMTP id v1mr41571942ybs.422.1641209598723;
        Mon, 03 Jan 2022 03:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641209598; cv=none;
        d=google.com; s=arc-20160816;
        b=usGiwphOgGJtcMOllgEgoLdxIkmRotBwFwWx38nD9HHme2n3o0zWKIM3yuSIWlg7Bh
         rS+UfCcRXowkhQnWNnj7cW8gXERuuEfmVvJsbh+YEaHX/y9wMqDtc+CLXUcgr2S7hed/
         IkPUsQ9BS8/kkL1o6SsDwiQjnwA60vZCNHm8pM07CDkB+ogNQ/3xhheXtjX8SFoy9Ims
         zQgiF/kFECC1ePc1scmS4edIW0IerOFZnoQw2RoIpmocPup//rQz4k8JMAnsO7c44cJs
         isryCtA8BstoWT/DiEUu9jst953l3Pq4U/gbNxZepgEthNTqxDSAsdeBSPWCu5EaTpjd
         M8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=7gRreOUXuatvIWZrNHVRFQOcfVSCQk25xee1VF+vJ04=;
        b=ieV0IWeHy3LFI0VYO1ZdhKgGvklQKv/O8PZDwH8iVbXsjZe/ddM8VgxG4LopO9mF9d
         GXi+yHW5N7FDRXrDdepkDWvUnkoaiyLKMcPdQNh+sooloYx6oMHNISfJkiGz3Bp6NDJH
         lDGRJKG51UW+jS/0dPb3GZnSdAo59gP9UqTkvW2U5BEPxuyEC5Od5dYBp0TdXDB1ST3q
         6znrQfpEd7w6sG7ULB7L6Jxb8c0VMz8GLC0TfC5CyaAznudTniXyKLvRQqjoIQTtuVRN
         uQP+FAsIvJk6t0BiEzZi41SRpLGfwjGo+yU44GfzHvTwLKgr5ZHg6y0WxHObwDXuV5Hf
         baAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hPGnsKhv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o127si17945346ybc.690.2022.01.03.03.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 03:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hPGnsKhv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4LaY-0006W1-4D
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 06:33:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4La0-0006SO-IP
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LZy-0003cG-U9
 for qemu-arm@nongnu.org; Mon, 03 Jan 2022 06:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7gRreOUXuatvIWZrNHVRFQOcfVSCQk25xee1VF+vJ04=;
 b=hPGnsKhvt26efI7JBxysdLPgqelwQvz1sE67F8DZiGqrOHOTizlCb7kM+oQJdO+NzgX/4m
 adoedOvM8kLkMxNyaoeBiwgOD4gYPt1aqgkV1YHB3RliKhR29vZJUtGR4tjjeTMVe+nQIl
 p4YtH1fm0X3pXPCXN1crzVi0MvZ2B68=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-22MopfivP2-lxO7DoZPEKw-1; Mon, 03 Jan 2022 06:32:41 -0500
X-MC-Unique: 22MopfivP2-lxO7DoZPEKw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a056402520700b003f841380832so22631276edd.5
 for <qemu-arm@nongnu.org>; Mon, 03 Jan 2022 03:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gRreOUXuatvIWZrNHVRFQOcfVSCQk25xee1VF+vJ04=;
 b=0vSLYhTTu6aFwKZLfo2LGflwKpxYhcjH8lRabgBRWy6rnGRSpAnCvUKQl8tHgLJKeo
 PVb1YgnSzzzMEbFy2qqP/J88oQBQwy7jzOrWvh5DFIgEnLrT8XfphZGPlHfZ7crLeLDC
 rZl5VtPHdoVb1hkHZstZlaq5RNCXLC/Yy94QmTK2tK5V9+Yx5Nm9n+FCjORKKLUuDEms
 XICBwUd8Wy9wKGpmJG7UCtPxcJRYCoNkMKPYVzCjecjrpWBgOH++DHf3iU1WKZB2tORE
 a50XOB/zeZp8UqliEs24gCJHjxTrM6UJpf/AOvm19u4eYC0+9BeELgxMsVwiohoUqVC0
 1X5A==
X-Gm-Message-State: AOAM530Es0WKCDsV0lExfo0wOGd6V7/vPx7//W/BilO2yynJ/lJpm4UE
 ntV6Tz/jkqBWgxInTes8eAFDQuJpTZkVwWYb1m8evNcH2ZlSc+0CrvaiWwP70bd4s3WJMJqBZh3
 6q0o4M48TMPcE
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr43492732edd.282.1641209560269; 
 Mon, 03 Jan 2022 03:32:40 -0800 (PST)
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr43492727edd.282.1641209560060; 
 Mon, 03 Jan 2022 03:32:40 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id m6sm13608221edc.36.2022.01.03.03.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:32:39 -0800 (PST)
Date: Mon, 3 Jan 2022 12:32:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 6/7] hw/arm/virt-acpi-build: Support cluster level in
 PPTT generation
Message-ID: <20220103113238.g3vk7nxmgefxe2gn@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
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
X-TUID: w2XJF9i0kPXG

On Mon, Jan 03, 2022 at 04:46:35PM +0800, Yanan Wang wrote:
> Support cluster level in generation of ACPI Processor Properties
> Topology Table (PPTT) for ARM virt machines.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ce7680393..5f91969688 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -840,6 +840,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              0, socket, NULL, 0);
>      }
>  
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int cluster;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> +            g_queue_push_tail(list,
> +                GUINT_TO_POINTER(table_data->len - pptt_start));
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (0 << 0), /* not a physical package */
> +                father_offset, cluster, NULL, 0);
> +        }
> +    }
> +
>      length = g_queue_get_length(list);
>      for (i = 0; i < length; i++) {
>          int core;
> -- 
> 2.27.0
>

Looks good except please do s/father_offset/parent_offset/ as I mentioned
in an earlier patch.

Reviewed-by: Andrew Jones <drjones@redhat.com>

