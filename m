Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1021571ejb;
        Tue, 18 Jun 2024 13:04:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2jtN9EwOrrPOuOUJXzZG1hBXOlQSieL3vLu7eNVjq/GQOYjGWp5xUw5DeQWMY6lQEG+hEc5+r0NpAqMUnGh1cC1vPOJYr
X-Google-Smtp-Source: AGHT+IE3APHcFsHb+n2VlioFltzibXlI8fOMRL5GWj++jc5UTB+2MdjtW/O6trGMarN8QGsIHPMg
X-Received: by 2002:a05:6e02:1a42:b0:375:8b0e:4437 with SMTP id e9e14a558f8ab-3761d6bf69fmr7930665ab.15.1718741043209;
        Tue, 18 Jun 2024 13:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718741043; cv=none;
        d=google.com; s=arc-20160816;
        b=T+i/M/TTgdm8o/POnOqL95e3gkhE5hktXXLht9M8NpGY2+XJRUAzI9PB3AUC+ImZmU
         I6ypbZ19AluOHKflfg1TZWmotgxRrjMdaPJiiEe1D2JnO0TMkLf0LoNLiGNFmaX/zVFF
         kLlmYDw+ZXx5GxC2ijv/dvajFIAqTwdxz5JRf0O8GnKGYmV5AKPWpW1x/4If0YTR8+5X
         HN/dlTjBIx+ZNGLYzqoXWl1ruZ2W0HH3U3uwQjE2gPdhTMmNvbuJ9ZUiBLSQtei+0XWk
         bOMJ8sLLs8fOMyxiwmAzO3m/JzmUzSLBl9ao50luARjXmwKLpwK6iDoBzu0PVXfK//cS
         YBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ntQqLuzVO4EclV6IBzgVZIjRXGnEvOv5jbVydOcu+J0=;
        fh=Mo7nOnuIkb7qXJ5YqDFYWK0o4aU/9Eeb/dj4LQOToNU=;
        b=uAXQ3F2cKNx9JgBHqK/ziv6mvAbrCOZSNujLNcN3UAGGmnIsc83Pq9Qhzsa83c1Hco
         nJ/g5MR6QJbEwJXUUV7JI51YVlJIAxSSSXM3HVnYuRI3QRQrvd2G6Bza/koJPh+HJztj
         YedxVjxRoZ7KQ3p0C/V1SY2Qb+qF4dor8IgoFjLo7/6vIwAEu6Cbx4aYWTlQyvMOxJXy
         HrqU3LPUs4g1VEiRwTVhtc/QYfJWA29HriD5zOIN3T0+G39mIXo92DBqM9K2DSu8zZQT
         wCm3ho1iwS0+NZczgMOvjMm/ihwFeACRa5DyHw3Z4SaZVnHKMZ0vzUJGoq7nkcr4oI3k
         b8tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ev3yKmos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab8ff998si1294416285a.312.2024.06.18.13.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 13:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ev3yKmos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJf3S-0006Yu-QC; Tue, 18 Jun 2024 16:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJf3R-0006XO-4B
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 16:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJf3P-0007eK-7f
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 16:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718741022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntQqLuzVO4EclV6IBzgVZIjRXGnEvOv5jbVydOcu+J0=;
 b=ev3yKmosePlLnjVIDkcCYDcuYyBxW+oSgQzc8EcsuBP+fkXl54hwb7IGfWm4FnHHcfcEvu
 Xm+tYG8lKGdZLW9eGeJbDyYgFqlVuAW/SQmL5VzhTh52f/L+iqrgzaRV9Fxnhvuq/WwMhW
 YL/RTWJb5vhJlXsPhLuoOoFfXrABLg4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-frnInHGwNmq8wNyZLoCbfQ-1; Tue, 18 Jun 2024 16:03:40 -0400
X-MC-Unique: frnInHGwNmq8wNyZLoCbfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42117a61bccso43339425e9.0
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 13:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718741019; x=1719345819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ntQqLuzVO4EclV6IBzgVZIjRXGnEvOv5jbVydOcu+J0=;
 b=BnIT6PBTOATRMqamDnN1SThyhbtIQ5dEFYVIybI/y/SKnyeKhJsVmXxMUBkYwDPag+
 llFYbqzRNPYBhcTv1iW2vYH8lxoRxi3wo6grQ6xU3lieUA1DomLcKASwaUPSGtz10ts7
 AJbhcClNs+nR/Sk9On4rrjpVXbTzm6/ckU7RydfkkpyI8l5QSw9YotXutfjztYMKW01Q
 Xnqt7H2xPpFFWg+AR+MAAdrzNRs37bScFruL/+TxFgc5SEh2VCESrfeWRJ3nym2pIzjW
 xWE7wXw9I/z+fW9pY2lnfH+EpDdL6AZnyD4yyYlYQZsx1CzdEoWmqrgqSGxadm1TmRE/
 pbLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+xTqvEgnWaH9LuIKQaDQ03k3LY8wih7UxGnk2Ub2di8yQmOmhtet3FzHNqTc3Pi7hyYklwhb/jxoeHIMMq82NH5HK
X-Gm-Message-State: AOJu0YyrSOdaclvqQPDsze8zFbrWQkCCYtboCn1JFQCi/vNoiLcKwKGT
 QtjJwmq61qum3LsrPzZaNA34KuEip9Zm3c6DswEX/MikCq7rGPJTw+eWRze1rkH6bXYtlC0w2Jx
 a6WsMPb/AgG6I12lux9jA15rOipv3k8Sw+Sh2NstE+Nl2H36gYg==
X-Received: by 2002:adf:ed87:0:b0:361:bcc5:2e26 with SMTP id
 ffacd0b85a97d-363175b9043mr376352f8f.19.1718741019471; 
 Tue, 18 Jun 2024 13:03:39 -0700 (PDT)
X-Received: by 2002:adf:ed87:0:b0:361:bcc5:2e26 with SMTP id
 ffacd0b85a97d-363175b9043mr376326f8f.19.1718741018771; 
 Tue, 18 Jun 2024 13:03:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36076515a80sm14838290f8f.76.2024.06.18.13.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 13:03:38 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:03:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, wangxingang5@huawei.com,
 shannon.zhaosl@gmail.com, imammedo@redhat.com, anisinha@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/arm/virt-acpi-build: Fix IORT id_count
Message-ID: <20240618155630-mutt-send-email-mst@kernel.org>
References: <20240617223945.906996-1-nicolinc@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240617223945.906996-1-nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
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
X-TUID: UeQXEzI/PXjX

On Mon, Jun 17, 2024 at 03:39:45PM -0700, Nicolin Chen wrote:
> The IORT doc defines "Number of IDs" ("id_count" in the virt-acpi-build)
> to be "the number of IDs in the range minus one". Otherwise, Linux kernel
> reports "conflicting mapping for input ID" FW_BUG at the overlapped ID.
> 
> Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
> Changelog
> v2:
>  * Moved "-1" to the same line of id_count calculation
>  * Added "+1" to the next_range.input_base calculation
> v1:
>  https://lore.kernel.org/all/20240613234802.828265-1-nicolinc@nvidia.com/
> 
>  hw/arm/virt-acpi-build.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c3ccfef026..631f2c6d04 100644
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
> @@ -298,11 +299,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>  
>              if (next_range.input_base < idmap->input_base) {
> -                next_range.id_count = idmap->input_base - next_range.input_base;
> +                /* id_count is the number of IDs in the range minus one */
> +                next_range.id_count = idmap->input_base -
> +                                      next_range.input_base - 1;
>                  g_array_append_val(its_idmaps, next_range);
>              }
>  
> -            next_range.input_base = idmap->input_base + idmap->id_count;
> +            next_range.input_base = idmap->input_base + idmap->id_count + 1;
>          }


All this has to be written in the way that actually refers to the
spec. id_count is nowhere in the spec and one has to know that
in the end this is used by build_iort_id_mapping to figure out
where this comes from. Not good.

I think the best way is to fix build_iort_id_mapping:
make it subtract 1 from id_count.

Then change text from "Number of IDs" to "Number of IDs - The number of IDs in the range minus one"

You should also add the reference to IO Remapping Table document
near build_iort_id_mapping, it is currently unclear which table this
refers to.

Of couse this means the only correct use has to be tweaked so the change
to build_iort_id_mapping does not break it: 0xFFFF -> 0x10000 - but
that's good for readability, anyway.


>          /* Append the last RC -> ITS ID mapping */
> -- 
> 2.43.0

