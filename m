Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1419337ejb;
        Wed, 19 Jun 2024 07:16:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3WGx+lQ5pgiHWwSgZn6d482IUrAVoHCrHQjyS3k3lGLo/BD+P2lq7UJuJtvKRnbCJETS7X1wDiqVxwmwQDxeGnbhxeIp4
X-Google-Smtp-Source: AGHT+IGEzjTSAAT29jzOqLyqf4RqMeZRs4hcdbueLSg2GFkTUlmNBrZ0BfNn5TupO8Vh/ha01g8t
X-Received: by 2002:ac8:5e0c:0:b0:440:572f:391c with SMTP id d75a77b69052e-444a79c2ea6mr26982071cf.24.1718806564669;
        Wed, 19 Jun 2024 07:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718806564; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJPGHHLSGddqggAocM7oqPfkU8tJ2UysYLN+XBhC0ZHAOfVBztdlVjwzOVh2gHWDs+
         EOA5f+4c0f1JtDQ1C1GDHlNZUu2YSyMFmQ9J+7pgLZLKH6t5riEBfShBkhXT61SdfLK+
         JXUky3htocdnP/OxEZgntF2o723Y/MNTnJWBWpd5R0UuswhHtsXwJvyECAMEYTNtAyUe
         N6iTCSTew3DcKDv5aGMxOwuIJ3Bh4ngUojR6mXPSoXKqWh/EdIj4pu/geBHW45UsX3ir
         9Pf+xYjNYKfzohdyP7fkBjEvm77P85kMvcY0nbniIVuZWDYmJcCOx2llA9n4d2XMyfNv
         NM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vMkg0L7ModefSYrrZeLbSqC61xXKlvilxyq3Scu0Bt4=;
        fh=s60YKBOorrsrOXcYWL+K6D42Inzhon4OO2KRSITquX4=;
        b=G+c/AJXomu0o6xuaYmyTuysFC+MNInUJjIo0HD4HtNdnShLxfhBRBGE4axxGWwu78l
         UZ89m2IVf5jv1kKkl2x8mheMYSlRHs2vdbVBnsgHWjl6MW1+23XmtCv/CEyCpTBnu8YY
         ShsH5T8k8EE1TGospqSPBRBsP8Pe7JvOF2f382TAfbYCGCMhV8DWgdx8oeI2eeUmQ69A
         HazlMqNx40kJu+WhDubZPxqFGe+mHzEJsWmjlK9+efsTLhbrrs1klPCGqaFUhW6IhdRX
         C3ya7NVwNIt+VEOCyr7kj4OMIbpUQ6ABNh3Q+Frxg5+jD7/XBCdKyy5Zhw74A3jNIL4a
         Iwfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFCcOVXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2ea8c4dsi146297291cf.374.2024.06.19.07.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 07:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFCcOVXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJw6F-0000jj-IT; Wed, 19 Jun 2024 10:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1sJw6D-0000hT-Lr
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 10:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1sJw6A-000890-I6
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 10:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718806541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vMkg0L7ModefSYrrZeLbSqC61xXKlvilxyq3Scu0Bt4=;
 b=fFCcOVXtb1v3Z7jIE3bCL10k8GV/mEUDmywHJsyV/+pb8lDEu+rbkDm1pZP3l40q78cVUp
 2YvSWZuhBClbLu4pr34LovwSacFLftxoWDfGvZpMI5n82a6POUurUD9ML9DhC0OoNeD/g5
 fly6Y4FrZ7U6s7wEpUqcqKcEze0h+4Y=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-RjgUjrw3NPirnPGEs8OJhg-1; Wed, 19 Jun 2024 10:15:40 -0400
X-MC-Unique: RjgUjrw3NPirnPGEs8OJhg-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6fc0266675dso6375827a34.2
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 07:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718806539; x=1719411339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vMkg0L7ModefSYrrZeLbSqC61xXKlvilxyq3Scu0Bt4=;
 b=hvB0kuQBPuVzSWIKKAt3V+ib/vH8sfrEGLqYVPxjjKP4NFuNJjqnlYu0UdeYtWjm3l
 vnxteQ3Hpe/vq7Gzl1yqzcB49gQOBSGcwCVu1+pKNjyva6zqlXCUpb8G9FatyBJ/qdDs
 EGVOSM7aur7aX3j50boElMPNU1nNg+vZkAQBgyNTcCeK/su3PFBx+a6ZoC6hxl5JjHI9
 cZ+np1Wj29FpJ5bB2s0ikNCQ6nbrbsOscyOtVMX7u+F23dCqnJHFcbQTQeNTgXWDhreb
 8E90FT+Wqe7kVOfwdQTDmdwcxqSIN17Q8MPBuL9NSniU6mYuQ69IaA0yVNAUuUMao8Mw
 IoIg==
X-Gm-Message-State: AOJu0Yy32tTgwxLpr7DJRJLa+uAuDwWKX3Dd8LFl5BGiZbAooUVr5LJn
 IOFbUEnsKB4UV6S5OkCsjDZSOc/y0YdhP8/GmYB6F5O1sHsw7ZR1e3JNAlQoV73f1XTHE9eMdes
 AAUiNRDq809pUh+WJlbSXlJjOi0V0vGX84phybhCv4k9Kc+xq+w==
X-Received: by 2002:a9d:69c1:0:b0:6f9:eb37:b49a with SMTP id
 46e09a7af769-70076dfa554mr2668260a34.36.1718806539621; 
 Wed, 19 Jun 2024 07:15:39 -0700 (PDT)
X-Received: by 2002:a9d:69c1:0:b0:6f9:eb37:b49a with SMTP id
 46e09a7af769-70076dfa554mr2668234a34.36.1718806539159; 
 Wed, 19 Jun 2024 07:15:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5c466bfsm77026346d6.68.2024.06.19.07.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 07:15:38 -0700 (PDT)
Message-ID: <aa27c94c-099b-4383-a93f-30ffdf5cfd54@redhat.com>
Date: Wed, 19 Jun 2024 16:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt-acpi-build: Fix id_count in
 build_iort_id_mapping
To: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 wangxingang5@huawei.com, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240618211110.922809-1-nicolinc@nvidia.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20240618211110.922809-1-nicolinc@nvidia.com>
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
X-TUID: Z8mDDur/iSGc

Hi Nicolin,

On 6/18/24 23:11, Nicolin Chen wrote:
> It's observed that Linux kernel booting with the VM reports a "conflicting
> mapping for input ID" FW_BUG.
> 
> The IORT doc defines "Number of IDs" to be "the number of IDs in the range
> minus one", while virt-acpi-build.c simply stores the number of IDs in the
> id_count without the "minus one". Meanwhile, some of the callers pass in a
> 0xFFFF following the spec. So, this is a mismatch between the function and
> its callers.
> 
> Fix build_iort_id_mapping() by internally subtracting one from the pass-in
> @id_count. Accordingly make sure that all existing callers pass in a value
> without the "minus one", i.e. change all 0xFFFFs to 0x10000s.
> 
> Also, add a few lines of comments to highlight this change along with the
> referencing document for this build_iort_id_mapping().
> 
> Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
> Changelog
> v3:
>  * Added "-1" internally in build_iort_id_mapping() instead
>  * Added comments to highlight this and referencing doc
> v2:
>  https://lore.kernel.org/all/20240617223945.906996-1-nicolinc@nvidia.com/
>  * Moved "-1" to the same line of id_count calculation
>  * Added "+1" to the next_range.input_base calculation
> v1:
>  https://lore.kernel.org/all/20240613234802.828265-1-nicolinc@nvidia.com/
> 
>  hw/arm/virt-acpi-build.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c3ccfef026..ee6f56b410 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -209,12 +209,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
> +/*
> + * Input Output Remapping Table (IORT) -- Table 4 ID mapping format
> + * Conforms to "IO Remapping Table System Software on ARM Platforms",
> + * Document number: ARM DEN 0049E.b, Feb 2021
I would rather explain what the function does, ie append an ID mapping
entry as desribed in Tabble 4 ID Mapping format.

Also while at it you may use a more recent revision
There is DEN0049E_IO_Remapping_Table_E.f.pdf available

Besides:

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric



> + *
> + * Note that @id_count will be internally subtracted by one, following
> + * the IORT spec.
> + */
>  static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>                                    uint32_t id_count, uint32_t out_ref)
>  {
> -    /* Table 4 ID mapping format */
>      build_append_int_noprefix(table_data, input_base, 4); /* Input base */
> -    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
> +    /* Number of IDs - The number of IDs in the range minus one */
> +    build_append_int_noprefix(table_data, id_count - 1, 4);
>      build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>      build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
>      /* Flags */
> @@ -306,8 +314,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>  
>          /* Append the last RC -> ITS ID mapping */
> -        if (next_range.input_base < 0xFFFF) {
> -            next_range.id_count = 0xFFFF - next_range.input_base;
> +        if (next_range.input_base < 0x10000) {
> +            next_range.id_count = 0x10000 - next_range.input_base;
>              g_array_append_val(its_idmaps, next_range);
>          }
>  
> @@ -366,7 +374,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, 0, 4);
>  
>          /* output IORT node is the ITS group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
> +        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
>  
>      /* Table 17 Root Complex Node */
> @@ -419,7 +427,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
> +        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
>  
>      acpi_table_end(linker, &table);

