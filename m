Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp753197lfa;
        Thu, 29 Oct 2020 10:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6zbLZV8xie21HSB9I8RopIpxdfzwHCR5KKwvGVjx0IRXofI54ZY5j8eO2hY7xv4c8sRq3
X-Received: by 2002:a5b:745:: with SMTP id s5mr7373807ybq.255.1603992429761;
        Thu, 29 Oct 2020 10:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603992429; cv=none;
        d=google.com; s=arc-20160816;
        b=oK1JO+mNkZTwFNDF17QxLrbMgRyhjnPX5apwDvNsGeAfJN5i6q7TZ5kZ6TROGIrlCd
         ANUnhZSxP0kLslEqnwyg3CoSVuHa9BJrOgu+XuTiLADOtWxzOZAQXVjD+SWG3mOwrnny
         QL/XwMBkTCCSFhvFzKxvnKtyQYBQ4/Bb+j1iUyHGIm89n6dYYWs/MYbrgD7tVVmdDmN8
         rGJx8PnfJvh8j8YuE06ee4IMc1iFIJXTcnFhgx+pG3cpwvO5N26hklgoHbUO9YX0w14Z
         lcOaJnb+/dvoXNXCWI0iyo7tWs4yMVaeJPGqzq9RGufytW/77EU21RwCddc8w1+01Ln8
         8FbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fnYVt2setGyWxiaPMsYzFsGQyPu5EKDhKniCXrM+s+s=;
        b=GvlUuLxRhcvJlADWEo1hekdAwhM2c9VxtRF3zTuhFlSAjdzvToIWUFiIM6wDi7nvKZ
         Nwc8nJ0g9CZPW2WwzFsLEK++jifZoVdl2DPIY+XpRHooOdJmMdrIFSdxwNfy5b3peg/P
         Ju4XsMP53iEpGtmmeA4QGabTXA1kJHaZtZEtbEvVdjhJazSe4JbQlRzFJUurPL9+YQJH
         NIhg5Ggvcb3Py+IZysveL60tyhxU8fn2aP33rO9zso0ZnKFN2H2VNcAQKuSCfkm7FnW6
         Lw/P5iIj63Gj7NLf6FXdA0+k3ImvKaB6VVvfIqikG96pQsa1iX+W/uLFk0GtFD2nyfXt
         A8nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dHRnwCaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f202si3078333yba.131.2020.10.29.10.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 10:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dHRnwCaj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYBhd-0003ft-51
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 13:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBfm-0002Cf-35
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 13:25:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBfj-0004HE-5g
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 13:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603992310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fnYVt2setGyWxiaPMsYzFsGQyPu5EKDhKniCXrM+s+s=;
 b=dHRnwCajkMvXO+gwRK03ZbPB3i/Va86kh11lzlDzLt/13iiKQrNtIGb8kxT3km8bsoWp7H
 ZAh5QIJyWUVwutFtJy5owC9ikccBekUWdqt+sCX1eX0CdcqxlRnw03B8ugGZTI4XzwIRvq
 3dfR1jq4vXHXIIKFXLsflwxA8jJE6k0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-jk-mnvn8Pbq7MjhfYFuvYA-1; Thu, 29 Oct 2020 13:25:06 -0400
X-MC-Unique: jk-mnvn8Pbq7MjhfYFuvYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27511921FA4;
 Thu, 29 Oct 2020 17:25:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A84D5DA2A;
 Thu, 29 Oct 2020 17:25:01 +0000 (UTC)
Date: Thu, 29 Oct 2020 18:24:58 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v2 08/13] hw/acpi/aml-build: add processor hierarchy
 node structure
Message-ID: <20201029172458.kgeab6rkjrb6wtyw@kamzik.brq.redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-9-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201020131440.1090-9-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-TUID: t+5PsD13pBxu

On Tue, Oct 20, 2020 at 09:14:35PM +0800, Ying Fang wrote:
> Add the processor hierarchy node structures to build ACPI information
> for CPU topology. Three helpers are introduced:
> 
> (1) build_socket_hierarchy for socket description structure
> (2) build_processor_hierarchy for processor description structure
> (3) build_smt_hierarchy for thread (logic processor) description structure

I see now the reason to introduce three functions is because the last
patch adds different private resources. You should point that plan out
in this commit message.

Thanks,
drew

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

