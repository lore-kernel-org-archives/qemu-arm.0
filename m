Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1304653lfc;
        Wed, 20 Oct 2021 00:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqrF6X9y9mIHG/2Y9Cxn8ZWZV2e/5jtSG5h7dhNXRTwfpHjFQZTlJe6b4Zy0bMXPb/bIpM
X-Received: by 2002:a05:6808:21a7:: with SMTP id be39mr8443793oib.145.1634715913269;
        Wed, 20 Oct 2021 00:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634715913; cv=none;
        d=google.com; s=arc-20160816;
        b=FhnX9wT7Ex5wwhhVi0Yw0r5VAh6jKSqOODNjRo3GfGcdeX4IdPbjSvgPhZ3knN4faK
         Epg0itgFFCKjGZV/iVZdqAEVaTq6i83nv9XjlNRen7f8ZxySMmlWY9xDS2sEGvdyu6LI
         6qUYY3x0Tn95QUKbt2Oip/xMlItgG3N2q/zWslqAhfzvwLVLiVRxqBxDfgQfuyfrF8bP
         M3KPiWMoYvRHpid7bqMTns4C8XJ7mr1/l4FURPBEluaC7tylu8t3Qte72q3+yq6NM6Jo
         WXALhl46r8AbbXTPhLf7TzAYi+JS4uaV6KS8v9lvorVtrgiCcN1g8HrwvSiLWsIFTvxb
         k23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UbFCg8kkGOr0cKsapqjWeZSfvQtRiCpvw2BWqAiyLJM=;
        b=KtOhLFg9kR16AM5UeAsoj5PKXVgDn5W46f0ZPKlu+UpjJk0N0d/39PHvNdBWyUIDdz
         wjjtvfYruZFFZEW3qpfsq9BIdJ0T1FwY0MDilXT8U1tKXIrQL42yYzEz85NHNhLSUgNc
         bFo2K7vXQ2BJDw8p3+JOjaefsECGEigbxO0G6Ux1A7cFm8wfywc20llMO9m20oa6AeJo
         O7Ry5v1czPSccnJTJZ1/resWza9eSnWrXjMAnqu14XSGkIcIN+F+kr5PC5nZFCg4pYCD
         N86B15lDc2hwDFSzkPOVykb1MQYsGOWhCmDshDD8rp9sZo6L0TgNErxMUQaL1z6k4TMT
         ojEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YdLaMWOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si1589365oif.38.2021.10.20.00.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 00:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YdLaMWOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1md6Hg-0003B5-1I
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 03:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6GE-0002OD-BS
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 03:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6GA-0001aR-UR
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 03:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634715817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UbFCg8kkGOr0cKsapqjWeZSfvQtRiCpvw2BWqAiyLJM=;
 b=YdLaMWOK6dFGMxi1/Gx8mwL2i1SjoiladaTGSPcQuXCsFzU5P39ycetnBJbnTg7VEJueMZ
 uIiCxtblqkBTb0kIdvPpK/Lk1ic96jpBT7f/YScbSlrLxpJefajrXEPTrgn11qyv2pYULn
 VV5Ii0Kuq0ZPZob7l+Z4HYbYItAfY+I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-0zM6UuxeM7KVNOxE3ejr1w-1; Wed, 20 Oct 2021 03:43:35 -0400
X-MC-Unique: 0zM6UuxeM7KVNOxE3ejr1w-1
Received: by mail-wm1-f70.google.com with SMTP id
 p3-20020a05600c204300b0030daa138dfeso3719908wmg.9
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 00:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UbFCg8kkGOr0cKsapqjWeZSfvQtRiCpvw2BWqAiyLJM=;
 b=HS5Uji0+6ODNoTnxLvxLwNjlAxYRKwdT76yk26hfIpHUqc2Ryq6ztxGZbKfR5BlFLh
 QcfUeC5gvgE2APmByqq11SLgFb2enG010yuT9E2wf4X7GG8n6kEn36HhVnLb0lbrir5t
 W5x1S/NIdFvxIyDIE/BV1BTlNFY8s0+IKPV1aAqU44+9rwckbuXit4Xc/1HU8tB/GHb/
 /U+Xj7Ei+oZMpwD5+N6xSLj05IVfMhpDjbV/mlFp28dd/90/iJ3pnw5q1MCW1fuQ9enm
 n6WFtZ2CKwX04Z/c3BbLAQEcn8WYZ+iBN9FlEC05HVwmOjpmkW+NX0h30QB28n/+195V
 f+ig==
X-Gm-Message-State: AOAM5328tFCaNjN9LetFMxZVRW9kbY4HJqzO+q/qHV9KCpBVoFiQtxEi
 BAc/S8rchjjiDaLBT2qZFBpIRZdYrC2OB2h5n+uyjo4Qk5QWyWoQswPbyqWWfGT60PjcIpFrbb0
 N2zZ/lPXzGZ+j
X-Received: by 2002:a7b:c303:: with SMTP id k3mr11774934wmj.44.1634715814492; 
 Wed, 20 Oct 2021 00:43:34 -0700 (PDT)
X-Received: by 2002:a7b:c303:: with SMTP id k3mr11774910wmj.44.1634715814284; 
 Wed, 20 Oct 2021 00:43:34 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f3sm4117505wmb.12.2021.10.20.00.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 00:43:33 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] hw/acpi/aml-build: Add Processor hierarchy node
 structure
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-5-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <3089e3c8-0eb0-3360-357d-4ba82ede8952@redhat.com>
Date: Wed, 20 Oct 2021 09:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tndrsDWy0rH/

Hi

On 10/14/21 3:22 PM, Yanan Wang wrote:
> Add a generic API to build Processor hierarchy node structure (Type 0),
> which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.
> 
> This function will be used to build ACPI PPTT table for cpu topology.
> 
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  4 ++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 76af0ebaf9..b7b9db6888 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1964,6 +1964,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      acpi_table_end(linker, &table);
>  }
>  
> +/* ACPI 6.2: 5.2.29.1 Processor hierarchy node structure (Type 0) */
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
> +{
> +    int i;
> +
> +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
nit: I think Igor would generally prefer
build_append_byte(tbl, 0 /* processor structure */);  /* Type */
although it generates checkpatch warnings

> +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI Processor ID */
> +
> +    /* Number of private resources */
> +    build_append_int_noprefix(tbl, priv_num, 4);
> +
> +    /* Private resources[N] */
> +    if (priv_num > 0) {
> +        assert(priv_rsrc);
> +        for (i = 0; i < priv_num; i++) {
> +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
> +        }
> +    }
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 3cf6f2c1b9..2c457c8f17 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -489,6 +489,10 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> 
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric

