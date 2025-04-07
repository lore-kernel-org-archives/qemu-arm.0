Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6521520njd;
        Mon, 7 Apr 2025 10:08:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfEo+Z01jdOd8ugnGf9uKuvI3ODRXcoA80Q/WLVKTdTFpjyPfdF9pkfckKhdgJH5anOovBQG6vM0UlPA==@linaro.org
X-Google-Smtp-Source: AGHT+IHA9WIiLs9B3FV0fXXY+ySL/AQnj9d1KbrMle52Qh5g3zLgi9qVT7kcoztf2SHNdKZzZJXh
X-Received: by 2002:a05:6214:2583:b0:6d8:a8e1:b57b with SMTP id 6a1803df08f44-6f0b751b30amr194715996d6.36.1744045696124;
        Mon, 07 Apr 2025 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744045696; cv=none;
        d=google.com; s=arc-20240605;
        b=HRAARP5k97ijWIqXGkjFF/78sPwP+anSXMdRPqo/cUZyO/y2L8BwoV0YRy6tfcvZjD
         rMqjM5xSs/Nt9rl3UczScBrCTdDJcW1eI7tC26qkIEvGePOtwMXAyEHNv3yr8sbuHdfh
         Z8QX+2kXdR3lyiZR3X3n4M87nD3iL43wpOmiV3XAwyTgV9idjYgXzgs1JdToaCq6N7KX
         UHOs58q43e6RnF/1hjzIh2XzPvKq7ZOzuuso/nenVv6pxY4kUVPeGi/tlq0qg7n0lxH/
         66kRiHDdlpBAGD8p9xeBw08K7LQOdfCH/LMGrOKafpqtylMqGppYq5NP/Vh3Di0OQwdl
         J7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HYx00fL9p3RfzTeWpSCN7DRF/JOCgoJvvZoYrvR1YSI=;
        fh=o3icOkStNA8VqoQ8L7XAEzP0cYVT/oEe7MyJ1Qo3hXI=;
        b=Vk9yT4LCG8PZgxPqwEck5Qv70Mc/k7OmHVYo7W1vsTu4BoH7GxD5p3kbcPozktn4R1
         +Hxrjf40IBnBZGbECIjPDZWHCZOkBNSOCdFv9784Gec9lci2/ENLtoidIVrQnSJVT4Sk
         ewCGJFNNy09VS+F1NsNMA1wTWtmsyVwd6PmXjpu/eBEzZKlHPYx6TNtB+Msj7KGXQnEb
         CIWI+SL0jC+BNQED8z5Q7zLxaeRg3zGYauPcVOpIGBYyE4xhsar4cxalkGQtjSzVyaeb
         IZPNvcVCMT8pB5Sdyi7ceB21CazoIxdOLD0NBnDVSiyvuprTDnw5iPf9HbePQgd0oazQ
         MTJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KnYdi6Ez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f1244aasi88581546d6.298.2025.04.07.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 10:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KnYdi6Ez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u1px2-0006QV-0I; Mon, 07 Apr 2025 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1pwh-0006Ki-S2
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1pwf-0000eF-Ok
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744045655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYx00fL9p3RfzTeWpSCN7DRF/JOCgoJvvZoYrvR1YSI=;
 b=KnYdi6Ez/YBltRjoOkQgJTp1DdCuBlK1lwe4Y33M97F3yjf+tNajWFZB68NWjQb1pXMpp0
 he/c12TXLJfjTUZBKuPzqT0Pore39dVwYYOS75h1WbOlzG1lb82IRr4n1m6Fu4u8BVU+5+
 0VHZCquOJn7goYP0ofFmIRE1sXNsp2E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-hD-k4uQ0PBa5y1O9p3HMFg-1; Mon, 07 Apr 2025 13:07:33 -0400
X-MC-Unique: hD-k4uQ0PBa5y1O9p3HMFg-1
X-Mimecast-MFC-AGG-ID: hD-k4uQ0PBa5y1O9p3HMFg_1744045652
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d01024089so39144815e9.1
 for <qemu-arm@nongnu.org>; Mon, 07 Apr 2025 10:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744045652; x=1744650452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYx00fL9p3RfzTeWpSCN7DRF/JOCgoJvvZoYrvR1YSI=;
 b=ulhwnrqsknaXM5oLAu9YGpN+hCrvhh7Q4G/eCq2hlx7c7VL3PjEyi7KO3+od/diBAE
 LZBZ6rSQXNz2CHriu6z0xRUgyQaiHgAWUosC4mODSqpDMCGgjbfvpOkg2oFivXzjxjL7
 lH9iU+6iCsEe3BN6v/i4Igu3ur7EeoLBQSXaKLV6erL6/35JVFOVVR0zOYOJ3H3CeXWe
 WpyBT8a6SzHw7FRPgBLFWwzYfZgltcoS7zCYm/nUz1ueoJ013Ez8izCObChFnBSLS5bi
 jTj+RDq1pZeRH1co+q5Y21iP40FV60faybcuFPjzQ49bKydpgE/dbEEmEH6hGgT7rdA3
 LsoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2tfcafqTeQtPURMuFKcWdOCZISgaIY89bApFnBDAdQRuznLmITlec0756xEWHht/jfMdP4KcLHw==@nongnu.org
X-Gm-Message-State: AOJu0Yw/s/hK12DWgPma7X+CmVLDWnKoVxhAl97ASCJSmIFWWGyEehhi
 SWwsu6BwUjI4VPfzTJ3krgC+SclfUUoOgQCy5s77X48GAM1nLSSTDk115ddflaOpk++Fuz2VE8w
 BWalgle0XIeeEpAy2IIGb8BNmqlpCliWmM2OwPfn51JH2jVtvJQ==
X-Gm-Gg: ASbGncsqo2ooJ2Ug9fEWaXzS5ebMmPmP6FOZVcq8iVMI6a16rBBMVWGzmmAendIl3G0
 Ef62nsq3joNy660eqz1KahszNJjvfkCGtzmHSB1BwYwopLSwM2xl648LAwObjoZS3ZqDvqG3wws
 6aWCmJqfQf5/6zkGTydD8NQooe2JlYG1AvrRPJwkXjg+lhG/1imEZizCfcvsZFxU11rgnCrBddF
 deiEgr36Y8U7+qktaBZ6MepzuOnXD11Qm+zRDi7Ib20qeolIXaFAgbhcwOkCoYdQFv0XdkTB1z5
 T3l4qHFTiaA9XTj//JE/jd/K4DRkCNiodO5Ki5gAiFsSTKit52wxnvl8rxuhyIs=
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id
 5b1f17b1804b1-43ecf89dd3emr136726255e9.12.1744045652470; 
 Mon, 07 Apr 2025 10:07:32 -0700 (PDT)
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id
 5b1f17b1804b1-43ecf89dd3emr136725765e9.12.1744045652047; 
 Mon, 07 Apr 2025 10:07:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34a8d67sm136321765e9.12.2025.04.07.10.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:07:31 -0700 (PDT)
Message-ID: <a66d6212-55bf-4d34-8e98-0e0df1a96da0@redhat.com>
Date: Mon, 7 Apr 2025 19:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] target/arm/tcg: increase cache level for cpu=max
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: mst@redhat.com, zhao1.liu@intel.com, dapeng1.mi@linux.intel.com,
 armbru@redhat.com, farman@linux.ibm.com, peter.maydell@linaro.org,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mtosatti@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, jonathan.cameron@huawei.com,
 jiangkunkun@huawei.com, yangyicong@hisilicon.com, linuxarm@huawei.com
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
 <20250310162337.844-2-alireza.sanaee@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250310162337.844-2-alireza.sanaee@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Puo9vAnruzKxa9Yg0lS0pOiXoFQxJ0f041UJmomhSM_1744045652
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.32,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cYIBgo6Zf+Kg

Hi Ali,

On 3/10/25 5:23 PM, Alireza Sanaee via wrote:
> This patch addresses cache description in the `aarch64_max_tcg_initfn`
> function for cpu=max. It introduces three layers of caches and modifies
> the cache description registers accordingly.
>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  target/arm/tcg/cpu64.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 29ab0ac79da9..1405506594c2 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
>      uint64_t t;
>      uint32_t u;
>  
> +    /*
> +     * Expanded cache set
> +     */
> +    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
 /* 4 4 3 in 3 bit fields */ was not obvious to me at the first reading.
I guess it means unified for L2 and L3 (0x4) and separate I&D for L1
> +    /* 64KB L1 dcache */
> +    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    /* 64KB L1 icache */
> +    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    /* 1MB L2 unified cache */
> +    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    /* 2MB L3 unified cache */
> +    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
> +
Out of curiosity how did you come up with those values? Is it an
arvbitrary choice?

Thanks

Eric
>      /*
>       * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
>       * to because we started with aarch64_a57_initfn(). A 'max' CPU might

