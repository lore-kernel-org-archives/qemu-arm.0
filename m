Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1375044ejb;
        Wed, 19 Jun 2024 05:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvtOIekBkh4iWZ5m+7SEv/bI3PjBuArLGdzHPZ3ifAA9WhNl2uiCmjFN0hk36ImHFKDozksXCE7qtoddRd1wR1j3YBJ9ap
X-Google-Smtp-Source: AGHT+IENOEgEYeBfbpiy770uwx6YDcmYdRGw6zbm38qQ04cl23ZVAAZpySN5Pgk8HX940L6o2Hq5
X-Received: by 2002:a05:620a:2945:b0:795:59ed:21e3 with SMTP id af79cd13be357-79ba76b2588mr904341985a.3.1718801993951;
        Wed, 19 Jun 2024 05:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718801993; cv=none;
        d=google.com; s=arc-20160816;
        b=B9fVCiw5BXrFMT3eU/n+Us+IALeBIrrgGZKzxAR+xp9wDdgzC2g967cCbSJSzlQXRw
         tA2Oa8NYTECMuT2dp7Vnh8Flh5VNuzgW3ALztctRG9Bb4hSgpFK8TFCANSNHrijYgmyD
         ocwGGiP0BmQhtIEsde/TBbx29TipKIgpQ/RW83CNBkafLXbB0vE/yDF4oHi1u/rAQWk6
         Aggm0QQQYPAx9lodoRpHoC38xCbtRnqvUP5f4xXwYksVWJv/VHWFg9T4QDc7j3T1G4Gs
         dmyL/jBos7SYPVP6ETN777HaN/Tzrpgn2sxyEvhrM/Yx3FZRwlMhYoUJ7mZBPhHtQBkJ
         paVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ndgKULfHbBt7KqzR0WHBvj2CUdfnVHZDXVN3f2R9o8I=;
        fh=pN07si8EITfC/ZQbz8RJmcb2IsEQFZRoFbroMewrkdE=;
        b=PIMEbPIl7P9SxFXUzrD5aBunzVjl1vj/1cq0TY06ERRmTwWWnTb05hLu3BxlttuicG
         56hjJnpJJZ3BYEf/iPkvtrqecWqEZUMtce1Uv+SXw/7Q2MaWI8ayIRqIGaeSunbJpI2V
         BlCBEHsKQpuD3WY5KsbTJ344owAusV+0rtWR/1GUmm6NY2mu5eC3E3fbWACt4s6jsF8j
         BqI1en70060cJWbhjMsKustK5PehjrsH2ckl3wT1CrvWw15DiIvRcYx0vJhlaBazVJHk
         WW2P5lX/O3pO5A3BP9C8HT5u9ADhvMRm7OsBeXA2KdCq6u2LyNjut5+VrG9Kg/TmDjaH
         Wy/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hQwjQeM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798aac9bd9fsi1439013185a.63.2024.06.19.05.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 05:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hQwjQeM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJuuf-0008OX-48; Wed, 19 Jun 2024 08:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1sJuud-0008Nj-KY
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1sJuuc-0001nT-0j
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718801980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndgKULfHbBt7KqzR0WHBvj2CUdfnVHZDXVN3f2R9o8I=;
 b=hQwjQeM+FCSqFfP5oJPz2KqgHKt+I8X4iOAK+9QYa6zgFT8l8SnLdn/Xgk60ars2uP4TM1
 iPCcJ5o9yfdK53lSV/GdncFo0UFeEo89XKlHaEcxQMT0AZedtdIaC79L7NJG/l6+EAgIqC
 q8GHSl7qrKN84zyASVGgzavQLEXypAA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-bfobxxpkM9eftP19SE_hYg-1; Wed, 19 Jun 2024 08:59:39 -0400
X-MC-Unique: bfobxxpkM9eftP19SE_hYg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-441034dce6bso16304161cf.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 05:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718801979; x=1719406779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndgKULfHbBt7KqzR0WHBvj2CUdfnVHZDXVN3f2R9o8I=;
 b=jp2WD5R+wBKOSTjQKmmKbuZe3QmrhS1eaPvtCYvRr+C9hIub03w+qbp1J5dGAU8xvQ
 9NAy6afCdK69KQectoGVfEmFcFycRnoiwCUPYLa/5uD/K9SGlMjYOZOv2uMog1IFmTD4
 LjsEj22atv6HsdSqDDHDUBVlsNGXNtMEcruZAzbZ7nX8GGCoQvWfy/8S7xYFc1tKJt1z
 LlInfEMe7FLtgBjdYWAnt/LWAW4sgTZwFcmzWPO+sqAUH3C5al5IF3kpcp421hTn4mQz
 ifYQtoPUB7c1YH6a0X7NCHxstxqQME7AmLgRaZAsAwdpQufm9iWhzhfEK4KMwFNVks6L
 exPg==
X-Gm-Message-State: AOJu0Yy23nQIOw4NpxnKq7DkVMfCDZZ02ZMjmeZFX6blMJU5STkkTt06
 rkjSYUN0hbztK20cvGbxBpzrirujii/Yaty1EmUPRJmocPYECrraRMvcT9uo8zpi3G8KTO+eiln
 c0t/Yf4f/UMx7MXnbQIVphDDq3KlxPpqFZP1gdzdyhDVQy5ad/A==
X-Received: by 2002:a05:622a:144e:b0:444:a0b9:2ca3 with SMTP id
 d75a77b69052e-444a0b97bccmr74751581cf.7.1718801978809; 
 Wed, 19 Jun 2024 05:59:38 -0700 (PDT)
X-Received: by 2002:a05:622a:144e:b0:444:a0b9:2ca3 with SMTP id
 d75a77b69052e-444a0b97bccmr74751361cf.7.1718801978482; 
 Wed, 19 Jun 2024 05:59:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f2ffb37bsm64689611cf.90.2024.06.19.05.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 05:59:38 -0700 (PDT)
Message-ID: <de7fd33e-b076-4743-80ae-99c146b42171@redhat.com>
Date: Wed, 19 Jun 2024 14:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Drop local iort_node_offset
To: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240619001708.926511-1-nicolinc@nvidia.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20240619001708.926511-1-nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fDvJJCqnndXh

Hi Nicolin,

On 6/19/24 02:17, Nicolin Chen wrote:
> Both the other two callers of build_iort_id_mapping() just directly pass
> in the IORT_NODE_OFFSET macro. Keeping a "const uint32_t" local variable
> storing the same value doesn't have any gain.
> 
> Simplify this by replacing the only place using this local variable with
> the macro directly.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt-acpi-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ee6f56b410..05af407bbd 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -277,7 +277,6 @@ static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i, nb_nodes, rc_mapping_count;
> -    const uint32_t iort_node_offset = IORT_NODE_OFFSET;
>      size_t node_size, smmu_offset = 0;
>      AcpiIortIdMapping *idmap;
>      uint32_t id = 0;
> @@ -423,7 +422,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>              /* output IORT node is the ITS group node (the first node) */
>              build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, iort_node_offset);
> +                                  range->id_count, IORT_NODE_OFFSET);
>          }
>      } else {
>          /* output IORT node is the ITS group node (the first node) */

