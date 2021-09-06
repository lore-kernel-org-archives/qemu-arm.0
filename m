Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3754899lfb;
        Mon, 6 Sep 2021 05:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZSGeO2SjNhZDMpkWJzzkXk/OdixyNN7vv/YpT1slv7GPssp3JoiVI51j45Rqtuh572KIs
X-Received: by 2002:a02:9566:: with SMTP id y93mr10523633jah.55.1630932290627;
        Mon, 06 Sep 2021 05:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630932290; cv=none;
        d=google.com; s=arc-20160816;
        b=sPmxcAUMr+gU3Q1M+II1dpU3YOeEMVt7K0cN5IHf35G3E0VNgb+vTTLDc9CoW3Ghy2
         oLqLe4jIEP+BsTmKxgEw7jHjYRBFa7rJ1BEGdJg+lZmMgubi7xFM8J0h7MjSmAeB61It
         YdzOy4MjghY0PWW2GZiZz1VxTxHmlSxoqRjvDB2zkuvLg05BDUzohQuln3JEYflPkvXs
         puKqsAzdfMvKXp438I/mBnufrEbSlTNt0IUQyXQxm+xORCznKSdXsSn4m2y3wqOVYzQc
         nUVpaCXe6RKNQy6zchtajM22ijYpggtMf4mnAHxcj/d5CqeYiCWBO06x7PbFSQS9yQzL
         umEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2kp1G4/rKxz4m3INYgpqx8tfuyws4fSW1lqHamsfiRE=;
        b=sC+NMcZL7lhQJNKUzeMQ4YxZHaP3AqiLRLDFuP/HmL3iexF4rNGi1f+W2exzOKpQDu
         hKgi2yRPIcag+fQJVzvHVI3UYpMQjhcMSvjrVEvetQN1twgXQZzVo1l4M1JrPiDVdZ/w
         vNEMA/Li9kRb80laRoh7XEVqaTZjiu5RJkgEDUs69xXEYIsRKWzJACiNXg7K7KxoeXP+
         ztmquV1AJCa1S2ZXZ1bbn3Qtg8q6P3Le8COoAV1WfeyEH5P7jBeMtZ3QbT11z6YMfDrb
         buBAi4TvEQl1g/qmHTPDY+q7jy1N8d6CB9Ct9PeJ9+b7zNc2GT4vsywAYYEvB5uS9BU1
         5Mqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NSJZ5OS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si7363163jaa.128.2021.09.06.05.44.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 05:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NSJZ5OS/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNDzV-0002KI-UE
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 08:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDzC-0002G2-N3
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDyz-0001V6-6q
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 08:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630932254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kp1G4/rKxz4m3INYgpqx8tfuyws4fSW1lqHamsfiRE=;
 b=NSJZ5OS/UlvMCn/e5oOz0/sxl8haMUfk40QSkt2wEZ5YjIF8DOE4oO9599v8mwDaPUb/Rm
 hSg7/0OnvPqSiG+cmWd00Y4J4SiPdh6YLXzOyGX9ZZamlJjq+05Z8rluGo6fag4LCawgrQ
 Xt38pSWxwKZr4u9gMe+S7+NpOYbe27A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ZzGEUYCmNpyZrQSsytx37Q-1; Mon, 06 Sep 2021 08:44:12 -0400
X-MC-Unique: ZzGEUYCmNpyZrQSsytx37Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so3182542wmj.5
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 05:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2kp1G4/rKxz4m3INYgpqx8tfuyws4fSW1lqHamsfiRE=;
 b=hP1dYrJWvOJYEVn2HAX8SUOMmFxK2x6BW9Ed1/8rrol02M0WuXCH1oe3OaitSQiabE
 V9VFfJkTGNMYZASYO6/JGqQIQdMGa0oORd8Fmu154mfndWnRqqyriPWGqgcDOeGRGBev
 AfxrbTlTm0GXGH6IWi4uWkzZ6m4DHU1VZvnYlL8nxqL4/MqFkmkDyBUKSU2dzx6yMOyu
 ywd5nGPWuZsFMuHGBuPNABk4jwT02cfEWGHRPiuKHar5VpBchxwupmC1zvZkuARkxeEo
 VCRlqUTkDKEXf7vCl9Xgze78zPD7n61GYpH7crpWUBjfbyUCZxRC7zDNMgj4Zlly4j9j
 M3tA==
X-Gm-Message-State: AOAM533Rabfa5PayWNcjapXX5PJsAMWefzN1eAewDD6Fbl/GUWiqiNKd
 nSHUclTRzG1C5bays3KzwTVtJIhOiWjTv45Iy8hB5mj5Cm7ao0MgbwzG7UqtqSiXt5AW96MMerg
 Jt+J2EzGmvql3WOAFL5Oq+qdOyp/1r7Dh4YEwdcAGCRuIs8eiEONYMHqzszluyWP2Itg=
X-Received: by 2002:a05:600c:2d89:: with SMTP id
 i9mr11536708wmg.10.1630932250136; 
 Mon, 06 Sep 2021 05:44:10 -0700 (PDT)
X-Received: by 2002:a05:600c:2d89:: with SMTP id
 i9mr11536678wmg.10.1630932249881; 
 Mon, 06 Sep 2021 05:44:09 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f20sm7083328wmb.32.2021.09.06.05.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:44:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] acpi: Add VIOT structure definitions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <535cdf06-d933-aa9f-8a01-3230b1836ab7@redhat.com>
Date: Mon, 6 Sep 2021 14:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-2-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TiUxl3M5aEsu

Hi Jean,

On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> The ACPI Virtual I/O Translation table (VIOT) table describes I/O
> topology for paravirtual devices. At the moment it describes the
> relation between virtio-iommu devices and their endpoints. Add the
> structure definitions for VIOT.

I don't think those additions are needed anymore. Looking at Igor's
conversions in  [PATCH v2 00/35] acpi: refactor error prone
build_header() and packed structures usage in ACPI tables you will see
he removes them and hardcode the sizes/offsets in
hw/arm/virt-acpu-build.c and removes the associated structs. Even the
enum values are not used anymore which is arguable but this seems to be
the default style now. Anyway there are some structs like AcpiViotMmio
which are not used in this series. Thanks Eric
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> Following the latest spec draft, and related acpica change
> https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
> https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd
> ---
>  include/hw/acpi/acpi-defs.h | 60 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index cf9f44299c..adbf7d7b77 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -618,4 +618,64 @@ struct AcpiIortRC {
>  } QEMU_PACKED;
>  typedef struct AcpiIortRC AcpiIortRC;
>  
> +/*
> + * Virtual I/O Translation Table
> + */
> +struct AcpiViot {
> +    ACPI_TABLE_HEADER_DEF
> +    uint16_t node_count;
> +    uint16_t node_offset;
> +    uint8_t reserved[8];
> +} QEMU_PACKED;
> +typedef struct AcpiViot AcpiViot;
> +
> +#define ACPI_VIOT_NODE_HEADER_DEF   /* Fields common to all nodes */ \
> +    uint8_t type;          \
> +    uint8_t reserved;      \
> +    uint16_t length;
> +
> +/* Values for node Type above */
> +enum {
> +    ACPI_VIOT_NODE_PCI_RANGE = 0x01,
> +    ACPI_VIOT_NODE_MMIO = 0x02,
> +    ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI = 0x03,
> +    ACPI_VIOT_NODE_VIRTIO_IOMMU_MMIO = 0x04,
> +};
> +
> +struct AcpiViotPciRange {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint32_t endpoint_start;
> +    uint16_t segment_start;
> +    uint16_t segment_end;
> +    uint16_t bdf_start;
> +    uint16_t bdf_end;
> +    uint16_t output_node;
> +    uint8_t reserved1[6];
> +} QEMU_PACKED;
> +typedef struct AcpiViotPciRange AcpiViotPciRange;
> +
> +struct AcpiViotMmio {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint32_t endpoint;
> +    uint64_t base_address;
> +    uint16_t output_node;
> +    uint8_t reserved1[6];
> +} QEMU_PACKED;
> +typedef struct AcpiViotMmio AcpiViotMmio;
> +
> +struct AcpiViotVirtioIommuPci {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint16_t segment;
> +    uint16_t bdf;
> +    uint8_t reserved1[8];
> +} QEMU_PACKED;
> +typedef struct AcpiViotVirtioIommuPci AcpiViotVirtioIommuPci;
> +
> +struct AcpiViotVirtioIommuMmio {
> +    ACPI_VIOT_NODE_HEADER_DEF
> +    uint8_t reserved1[4];
> +    uint64_t base_address;
> +} QEMU_PACKED;
> +typedef struct AcpiViotVirtioIommuMmio AcpiViotVirtioIommuMmio;
> +
>  #endif

