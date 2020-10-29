Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp724026lfa;
        Thu, 29 Oct 2020 09:52:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6C89U3YRLxviITJLsT94SVbuFs8jHaL3X/IKNTghMZGkS5P+T4xUXR3gjPGmYbvaofK33
X-Received: by 2002:a37:7104:: with SMTP id m4mr4585966qkc.252.1603990366487;
        Thu, 29 Oct 2020 09:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603990366; cv=none;
        d=google.com; s=arc-20160816;
        b=MYHzwkA7lndpk+UYqN5wsGy479MleIZawnlOJNdPal0XWIQZHROaZpZPZTFLSg2Ekh
         Ig9wfnAhdClft/btfuaT0U6tsJmuwcYrteZJfroUbr7khT35NJYRAykZG6l1SdM0Do9d
         Cy93r0EpteUw3+9ni4nf7qSHX8s7WJk9MVkU0/FspAQbM9Tz5ebSXS5HpXguo3TdW1rm
         60Ctn2s5Ez1c72Y7YFGXmMbWggb6CYiL8M/IVsYcgj8RZdiB91e9Rwwv3paDGx80gJMj
         y6vNH5KGyibXMvFrzy8vi48+NiwNDs6sZ0xavO7/BYS1kzP/CcQeGYjZoFytMs2GseMo
         k44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hID93V/U/yw5FBDzPM8aHmV8Mo1wPCuIlof4W0/fv+s=;
        b=qwFH3wp5LMk9gdYlmmevn1lfUAO8d6n4zUIytJ/Kyp3PcS5beZwnlYNZT+lAMSX5ha
         Gt5h/VW9QnoN19j/41njPJgPfYrYPSgmsEtfHF1jnmAAfFYb9oxDCHbrNEuf2nlccMp/
         5JVEwTmW6uzwZ01YencLIp/c33fJdeLyI9UL3Wvr4BeQX8f1sYZfty5nwHb5lQMlinmx
         Yt+NAbyFa9QfdzEIPje8ZQnVbxrkOjge79pctCoPnRBfvmY4PFrLeIx3dqCnODm+XoBB
         wvrH8Gzbz0UWPOB+54fux75I3m0r+h7mX7s7LU0r5bdQiGxfmc5Dxxq7W+SzrChPM/8E
         CUHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRkXV3lb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si1999415qki.75.2020.10.29.09.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 09:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bRkXV3lb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYBAL-000766-P9
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 12:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBAB-00075r-MR
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 12:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBA8-0008Rh-FK
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 12:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603990351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hID93V/U/yw5FBDzPM8aHmV8Mo1wPCuIlof4W0/fv+s=;
 b=bRkXV3lbatDs2XdDK/0oIia/n2Kdjz9wbNM1zQpuBvJqedfGf4k+dtB8wDWeUONIqGvs5i
 1JLK+Pp8XVNRnye9TgQNrbRoezcbkGbt11Rav8mpQfRkGtr0f6xKMb7HciRxkad277z89b
 icUI5Sf8i1Mg34VzGvs2DXqKLA/VPrA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-kIVGKaRAO3efoDYtjxEfdQ-1; Thu, 29 Oct 2020 12:52:29 -0400
X-MC-Unique: kIVGKaRAO3efoDYtjxEfdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D32196D592;
 Thu, 29 Oct 2020 16:52:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7281002397;
 Thu, 29 Oct 2020 16:52:24 +0000 (UTC)
Date: Thu, 29 Oct 2020 17:52:21 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v2 08/13] hw/acpi/aml-build: add processor hierarchy
 node structure
Message-ID: <20201029165221.agx27kp7dkihtq3m@kamzik.brq.redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-9-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201020131440.1090-9-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 Henglong Fan <fanhenglong@huawei.com>, alistair.francis@wdc.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90nWamx7Mg6V

On Tue, Oct 20, 2020 at 09:14:35PM +0800, Ying Fang wrote:
> Add the processor hierarchy node structures to build ACPI information
> for CPU topology. Three helpers are introduced:
> 
> (1) build_socket_hierarchy for socket description structure
> (2) build_processor_hierarchy for processor description structure
> (3) build_smt_hierarchy for thread (logic processor) description structure
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  7 +++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 3792ba96ce..da3b41b514 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1770,6 +1770,43 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
>                   table_data->len - slit_start, 1, NULL, NULL);
>  }
>  
> +/*
> + * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
> + */
> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, 0);          /* Type 0 - processor */
> +    build_append_byte(tbl, 20);         /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
> +    build_append_int_noprefix(tbl, 1, 4);  /* Flags: Physical package */
> +    build_append_int_noprefix(tbl, parent, 4);  /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> +}
> +
> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> +                               uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, 0);          /* Type 0 - processor */
> +    build_append_byte(tbl, 20);         /* Length, no private resources */
> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
> +}
> +
> +void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
> +{
> +    build_append_byte(tbl, 0);            /* Type 0 - processor */
> +    build_append_byte(tbl, 20);           /* Length, add private resources */
> +    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
> +    build_append_int_noprefix(tbl, 0x0e, 4);    /* Processor is a thread */
> +    build_append_int_noprefix(tbl, parent , 4); /* parent */
> +    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
> +    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index fe0055fffb..56474835a7 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -437,6 +437,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
>  
> +void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> +
> +void build_processor_hierarchy(GArray *tbl, uint32_t flags,
> +                               uint32_t parent, uint32_t id);
> +
> +void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> -- 
> 2.23.0
> 
>

I don't think we need three 99% identical functions that only differ by a
flags field, especially when one of the functions is the generic form that
takes flags as an argument. At the very least this should be

void build_processor_hierarchy(tbl, flags, parent id)
{
  ...
}

void build_socket_hierarchy(tbl, parent, id)
{
  build_processor_hierarchy(tbl, 1, parent, id);
}

void build_smt_hierarchy(tbl, parent, id)
{
  build_processor_hierarchy(tbl, 0xe, parent, id);
}

Thanks,
drew

