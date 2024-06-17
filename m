Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp145289ejb;
        Mon, 17 Jun 2024 03:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh0ydbnUzIsKwDOlVHNGjmtSf6fxgnv5jcbfY1gVPg85gRUYJpyqbscG3ikNclzJP6SNxY/vFldNOjo2gWTAhUonbyvbFZ
X-Google-Smtp-Source: AGHT+IHets6vg/JprPDVSZHJYxf1u9tEKVgqhdviTkMPHjlBZ8FuKjHwGLsQqg/FIxFRqBJHlCz4
X-Received: by 2002:a25:b125:0:b0:dfd:cc57:e043 with SMTP id 3f1490d57ef6-dff15350847mr8869140276.6.1718620937557;
        Mon, 17 Jun 2024 03:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718620937; cv=none;
        d=google.com; s=arc-20160816;
        b=HfaCRG+tYwnDPVb/bbpcwoM5h9I5uxn/1Rqwg//maw1RByyt/djffueA3e9V6RFw69
         Kz9pIoSqJgQF+jHKrI0crBRuzYJSv0ZprbVq11bWoCBBiIzqQXz2fWrK3JYdFM8cfRFo
         mvr7OtZ2LOWZMpwIRN8VdrjfeZUx8ehP+IN8SKnfAcH+hVgI2rYbHBVsrAajchnxQpAe
         AHm1n7vpq0dO0rtDpFG+A2yyE8VhUz7qY8qfMEPlyxQM+C/mklHHztqHDE4ypKf75lI9
         xPZPu1/hn5HUxpuP7b61bOMbDkRQU/KYtytbLY5WmXFIegn8NKPRqGjKbN7dNPzoUpmb
         9biQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Cam83kMeg7LJA9PMFUt3qYhC86g+Z5t8VkWEJcETwtY=;
        fh=Bu7Q1hQyI0WO5HcCTxvx5BusT0t548fwR6foG0gEijA=;
        b=TUI04GhKwrl0B0v50lxs9pgSPe4vqWKML1zvJMyZzRS92ECzzSv9FmaWsQX+3adO/p
         yOtf1Aj0bQbtLE0VLVmyED3wPPPJ0t3fuoEztWkWag+8c4f2i7Lkn1RfC8rfT4y5Bqsd
         N8rSwLQ4GBF3Re0EuiYDn0R/HvJAN0FRtEa8KKsQy9iMN1Awm2Hv6cM56Yi3v6lA7ebC
         Dp0/mYTXmSIABfKKzLN3kkxdnJExgObsPKLHoRiv2YkWQKRd+krTRB0pj7A65kO4/eex
         eu61jCMxby99y814vgxU/TRZmwEB8/+p9gZqLdFi4ij+pC8PiIsZbhs41GkbtgsBTja0
         xHcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9tgS+t3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b8b279si95163366d6.586.2024.06.17.03.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2024 03:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9tgS+t3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJ9oL-0000yz-NF; Mon, 17 Jun 2024 06:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJ9oL-0000yj-0I
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 06:42:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJ9oJ-0003Hf-Fv
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 06:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718620922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cam83kMeg7LJA9PMFUt3qYhC86g+Z5t8VkWEJcETwtY=;
 b=I9tgS+t3HzqXvDXhiLqAPXro29PowaZHlrV52kkZuNWajjLU7hTPvUrOgNoCnJqwqBffo9
 MYGyjFGhKyX5p3JCc2SiQq0gxzZABgcj2cjAgBWCGauE7vGeHTc+wf/OVkCmJvBFLiTcBM
 QjvRjgAZrsmbI8kNzIrPCO1Bhmkjj58=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-lbBjvDvLPYe37q0sIjsbcA-1; Mon, 17 Jun 2024 06:42:00 -0400
X-MC-Unique: lbBjvDvLPYe37q0sIjsbcA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35f218c9950so2208839f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2024 03:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718620919; x=1719225719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cam83kMeg7LJA9PMFUt3qYhC86g+Z5t8VkWEJcETwtY=;
 b=pUniPE3BKQDH2luSu7m6reljL+lRZ9mRU3d4Eo+BO99Z1LrkJ13JmtsEB/LLzYZxZF
 XNz5kAF9yXUqKaI8JPZPrliwx1LQxGHUXx1kBnKpf4pah8z6TPOPMHKPdYppFam6j6Bd
 r8Mnk5jMnUmOcXER5CFpY3N8Q+/BJoJ9uIRRrJVH7Z4IGUAQ3kA7DEZc/+qBIvSFmEcV
 9uCTloJQGLGG+cclqwfwlDTtEMWnA7+W5XO/hVcLT2vbaSL9BQBAG3osRjYPhanrZEPB
 axLAXTFqc8+TQcHrUmVOvCegzKLT2q8M73fAXrD+qQB/VA85JYv4MF0a/PxO5Pyuiarm
 lh7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcvv10QPto7M3t186ADJXOdEBLR+kC/6XT8WY2A94S2qbh+e8C3kg5HSrRkX4+hAJ8jzJsqTEcH8+YrNLhSKmpFYYc
X-Gm-Message-State: AOJu0YzI6tt5dS6SYRHay/klZFFpU2xRw7861P7YzS+VV1auD37vZHm/
 edA+lClXCUHJVx1ZGM72v1+J6rQt9yJaKCwDs0FWzeZIv+2zpaP1+FYDcPbmqSQJ/tXIk/dWWYO
 2L7K/IXqALudUBKM+1p7QLFuC5e7dO4oat9c2r3Za+9olCzLeiQ==
X-Received: by 2002:adf:e88b:0:b0:360:8f85:a5f1 with SMTP id
 ffacd0b85a97d-3608f85a70amr4118721f8f.5.1718620919040; 
 Mon, 17 Jun 2024 03:41:59 -0700 (PDT)
X-Received: by 2002:adf:e88b:0:b0:360:8f85:a5f1 with SMTP id
 ffacd0b85a97d-3608f85a70amr4118701f8f.5.1718620918529; 
 Mon, 17 Jun 2024 03:41:58 -0700 (PDT)
Received: from redhat.com ([2a06:c701:741d:ed00:9efe:886c:c2d8:ae8c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c790sm11599448f8f.38.2024.06.17.03.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 03:41:58 -0700 (PDT)
Date: Mon, 17 Jun 2024 06:41:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, wangxingang5@huawei.com,
 shannon.zhaosl@gmail.com, imammedo@redhat.com, anisinha@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix IORT id_count
Message-ID: <20240617063156-mutt-send-email-mst@kernel.org>
References: <20240613234802.828265-1-nicolinc@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240613234802.828265-1-nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2AbqFFy4gLla

On Thu, Jun 13, 2024 at 04:48:02PM -0700, Nicolin Chen wrote:
> The IORT doc defines "Number of IDs" ("id_count" in the virt-acpi-build)
> to be "the number of IDs in the range minus one". Otherwise, Linux kernel
> reports "conflicting mapping for input ID" FW_BUG at the overlapped ID.
> 
> Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  hw/arm/virt-acpi-build.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c3ccfef026..b9343dde0f 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -243,7 +243,8 @@ iort_host_bridges(Object *obj, void *opaque)
>  
>              AcpiIortIdMapping idmap = {
>                  .input_base = min_bus << 8,
> -                .id_count = (max_bus - min_bus + 1) << 8,
> +                /* id_count is the number of IDs in the range minus one */
> +                .id_count = ((max_bus - min_bus + 1) << 8) - 1,
>              };
>              g_array_append_val(idmap_blob, idmap);
>          }
> @@ -298,7 +299,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>  
>              if (next_range.input_base < idmap->input_base) {
> +                /* id_count is the number of IDs in the range minus one */
>                  next_range.id_count = idmap->input_base - next_range.input_base;
> +                next_range.id_count -= 1;

I would just add - 1 on the previous line, instead of making it
incorrect then correcting it.

>                  g_array_append_val(its_idmaps, next_range);
>              }


But the value is used later:

            next_range.input_base = idmap->input_base + idmap->id_count;

Wouldn't that make next_range incorrect?


I also note that

static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
                                  uint32_t id_count, uint32_t out_ref)
{
    /* Table 4 ID mapping format */
    build_append_int_noprefix(table_data, input_base, 4); /* Input base */
    build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
    build_append_int_noprefix(table_data, input_base, 4); /* Output base */
    build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
    /* Flags */
    build_append_int_noprefix(table_data, 0 /* Single mapping (disabled) */, 4);
}


That comment 
    /* Table 4 ID mapping format */

really should be before the function and it should mention the spec
it's from - specifically the earliest spec including the relevant table.





>  
> -- 
> 2.43.0

