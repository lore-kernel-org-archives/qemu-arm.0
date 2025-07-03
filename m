Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp595141dyc;
        Thu, 3 Jul 2025 08:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBX89/Vstfquam6tsM3FwezBGGiizkeW27wAJS2rA7+S9FAE0XBJawJ/yTTnbY68cPK5onP3ObvQ2O4g==@linaro.org
X-Google-Smtp-Source: AGHT+IG3/WlXBE1DQdeDjsjxtH5h98pksPRHy5jbkRYmfx+LxuewpR2p3qDYoYUFMyVw4cw51an0
X-Received: by 2002:a05:600c:c48f:b0:448:e8c0:c778 with SMTP id 5b1f17b1804b1-454a370cd65mr69187115e9.22.1751554851630;
        Thu, 03 Jul 2025 08:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554851; cv=none;
        d=google.com; s=arc-20240605;
        b=HVBSB6R2hPe8OPGfKJ7vXI4X5tBgLdsMbEQD6RQM3iQI7IlMI6UiRgJpiA4MuCIuJv
         4EdMMgSXHxS3vSypxJe8xkQVSSRznxuvRG8o4jqMgqiD955VcM/ywqjBIOtsFpA21GPj
         tPaMEN+f6yIBuz8rQXMSPkCQj0SAdvY+uQE15BhIMgs2sVNVNB/TIcBUDVtKto8Oxmyd
         waOWqRzp5nbOjhJjqoqIiqNF71Zb5WuwDOPujjKDqgQXAxyhD6PrHaYFCgUMUQQDfwzt
         RkU2HV1zWwQdpv29Lt0UIkC9xjekNXg0vjBQAlDuww6XDLqx/l47K5WmM3o5egO9i7y3
         Pq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GjKalUHkcSEGgjVYtCtFZXHZ3EjBfG+ibM+BRZYo7H8=;
        fh=8HEq1yK6ejSQm8e2psK8LmrG39NPLro8j/DtTwEVOGs=;
        b=WHwsRPjoIgFvhoeNj0RpEI574RFTWgISQ23Uh4jyufN7FsNPaAnCNmccg/0TwWOKZ7
         ZBLOiM0DLMZlhcWL4Hd01ssaJ2TTQZWkPD8ZHmy6opjSbC/UWMObGzzWgK8pn0jR2hxF
         p1Yi4dW7GCsmIC7wO5T4ZnNaW9yu4SgmggQp69zIUqvuepg2o/gSQ2tnsqimF6H1u2im
         ubMUW58A90Lgy3zkIzramJ4qJt2QMkBcGcnHx6Dk6TqPXMblxMWdDInf7+TjjBcQu3IV
         dPfEEZvp5IsT2jD5FUCGLjZUiJM6P3thMg/LT03VV+RQly3cTG6QWjLITCpn/j2gQQSR
         BThg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cu5G0TE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3b46fe3b72asi21188f8f.1.2025.07.03.08.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 08:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cu5G0TE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXLQc-0006jY-CL; Thu, 03 Jul 2025 11:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uXLQM-0006cv-B6
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 11:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uXLQI-0000zu-KF
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 11:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751554823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjKalUHkcSEGgjVYtCtFZXHZ3EjBfG+ibM+BRZYo7H8=;
 b=Cu5G0TE6zJRPPQset8Su789Gy7jKZqdC4kdMO6htfnREujyAtzvXbL7423fDS1AYCHBAiO
 VQU2KeofqPfvsGLh2JCyq4+LMmIlx1SnwHeg3XQLgb3a8AoolTs6FTGKgCea/B2G9ETOUD
 1ZjPSWkNWolvwFsPEdt7n/FzprkxhvA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-QaLX6_1TOk-FPP8tMqZeBw-1; Thu, 03 Jul 2025 11:00:22 -0400
X-MC-Unique: QaLX6_1TOk-FPP8tMqZeBw-1
X-Mimecast-MFC-AGG-ID: QaLX6_1TOk-FPP8tMqZeBw_1751554820
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4fac7fa27so2125678f8f.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751554820; x=1752159620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GjKalUHkcSEGgjVYtCtFZXHZ3EjBfG+ibM+BRZYo7H8=;
 b=vffIRS1go80HHAoxzQMqX3NyoJKYG7IhNINizaOZri3PwAct4pHE4Tp4QD+sIgaPR/
 +X4SHQAzYfryVaCMsbRg53DRj32LQod2HfU9zofULCxKfdXSe44JQC0C0JEON8iHClLK
 FDTJcIDBR8v8DAVxJOG0rFnibr5KGWMXK1F44KqVgOWw4sxAALg3TDppGrSxVMeIrXIj
 zT2BK2tEZBTZdXegd4AW9/M/SOM1xL/TrJMJMWAX79cla97MABiF1V9eJMP4o9hrcTIc
 ya7m1LwGMNTfpxbcZoBjW3gJGwsT6uuQOWYwziHKZ/3gdAga67uLFdXFAkJhFjZCDDwp
 Gehw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgqOoOJ3npfp8PiCSPVo6J+TONrHSMiEt6WQA5LS18Mov0+IqrGVblq98yOQvvL9bw/CJmdSCRlQ==@nongnu.org
X-Gm-Message-State: AOJu0Yym65BDEX6db1UEL9ox6t5SWqWceshViSmxyseiD6EtlovpHDl9
 AiWFa0EervT69ioPFDzrEnjovFAZiVcq7UT36FlLwXGg8WYFxMYnwBtlLDMUFL7iP5qDyOBzjOH
 Hrw92M6EQyEW4v6L/eI3RDj1HQ4VnlAzgsNCuks8boiYj6iBzfB7wXA==
X-Gm-Gg: ASbGncsTNi8VNYr2CAs8IUwtimg3/XUwD9Fu1CcDvk4tM4VgmNMwbLD7z4ut6UjiDZD
 A2+cQ/DEa1NPFn+8sBbESytIWSS1twMqJzWbyLW+n3o5WQF1myEEK/TGhsovyCQ5IXiFy00qQv4
 iYpUZ0FSuFo8MtQLeIbJP3PnKVcLTzbpS/v0ZWT2IQynT94ywJcRhpZClyVwgNZoOcjg9o3FB83
 QILC++uIVIIHryIEHJaivBi4i3NsITp5o05dTOuymFcKWSuLNGrpuk2LblJKs5CJU4kDdI7s+/z
 mwAKpY34JA6cnZyFVZIU0FGx5z0kTmq2WAsZl8CPMn6ZGSSdijioGoq4oyiD/RlCRluQcA==
X-Received: by 2002:a5d:64e2:0:b0:3a4:fefb:c8d3 with SMTP id
 ffacd0b85a97d-3b20101681emr5752262f8f.40.1751554820034; 
 Thu, 03 Jul 2025 08:00:20 -0700 (PDT)
X-Received: by 2002:a5d:64e2:0:b0:3a4:fefb:c8d3 with SMTP id
 ffacd0b85a97d-3b20101681emr5752228f8f.40.1751554819597; 
 Thu, 03 Jul 2025 08:00:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a997af9esm28852685e9.14.2025.07.03.08.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 08:00:18 -0700 (PDT)
Message-ID: <6b53bfc3-4ff9-4aca-af90-664cd2e959df@redhat.com>
Date: Thu, 3 Jul 2025 17:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] hw/arm/virt-acpi-build: Don't create ITS id
 mappings by default
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
 <20250703084643.85740-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250703084643.85740-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UQgE5wskLvPaDBguglKEycZiB3p7Lc-JL__7_m28xg0_1751554820
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h65byspScJId

Hi Shameer,

On 7/3/25 10:46 AM, Shameer Kolothum wrote:
> Commit d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables
> when its=off") moved ITS group node generation under the its=on condition.
> However, it still creates rc_its_idmaps unconditionally, which results in
> duplicate ID mappings in the IORT table.
>
> Fixes:d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off")
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt-acpi-build.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cd90c47976..724fad5ffa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -329,12 +329,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(rc_smmu_idmaps, iort_idmap_compare);
>  
> -        /*
> -         * Knowing the ID ranges from the RC to the SMMU, it's possible to
> -         * determine the ID ranges from RC that are directed to the ITS.
> -         */
> -        create_rc_its_idmaps(rc_its_idmaps, rc_smmu_idmaps);
> -
>          nb_nodes = 2; /* RC and SMMUv3 */
>          rc_mapping_count = rc_smmu_idmaps->len;
>  

