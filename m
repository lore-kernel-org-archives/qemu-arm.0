Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D2DCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 12:52:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0g0x-0000Pg-PM; Mon, 22 Sep 2025 08:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0g0w-0000Ol-8B
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 08:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0g0s-0008OW-O4
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 08:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758545485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wEU8MrtyJBFH7wtLYz6lKHBkb4dkvaBABmEVzel40tw=;
 b=Ott40u/cPYuHxseivVT+xu/UB+dccNvMOG9MVM+b+M5nfCTYCnlyTjgqVmbmBAOF8Dl14H
 54BZDI55vKU5cAG8CwHnsUIebBs8/Y2jAYyne1S10WKUWXp1GRdmx405OGE1Beg5HAx7uH
 DtTUAXMT61h6LQMNJkldlYdl6FI7+VQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-e56pVt03OVCv80STQoT-nQ-1; Mon, 22 Sep 2025 08:51:23 -0400
X-MC-Unique: e56pVt03OVCv80STQoT-nQ-1
X-Mimecast-MFC-AGG-ID: e56pVt03OVCv80STQoT-nQ_1758545482
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ed9557f976so4006896f8f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 05:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758545482; x=1759150282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wEU8MrtyJBFH7wtLYz6lKHBkb4dkvaBABmEVzel40tw=;
 b=qsl8edDulLzb2tAg2PZxV8MpzwiXgMQf6cqpK8Pkmeu+krLI1f8bjIisHJNcX/CJF6
 M1s6AGmv3gcZJ8YfmQWq3mOiRf5rVm0dxeAmwsRCqwKcTiSWjAo6zfLzcaEMWYcAsQsI
 hQakuxZpx2cUlb6PPbOCZGkNmJtb1JAX6hFpAqdVMX+G+5CeBoJ/Gg1Csl6qHtXjkxzB
 J9QdaDyVlL9Htf2UNr/ZLU2tHySFL7zgJ86jTjSCVSxXe57da43Hi5Z9inwd8awaLO1f
 rZVYZjk3Mn/WpFLYTGkfE7t9dxQMCFfuCI6Ak1EfS1C5v0wskVdUxP6gAchpbP3RO2ur
 Cuyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxl6kCATBDdeIzAHCiXBX1HJWIwSYCAT5aFIt+32uCrL6A/4V4kuwmja8JUhlEtMpMk6U8jEYAFA==@nongnu.org
X-Gm-Message-State: AOJu0YydYKrcYv3RlMQbNMQ8tdzCqE2Cv0P/dBpv9k8mY+PlCJsPs5UU
 sUTgCn3wrnHE5b3qYvCxN3eV7vyy9k8gToIO9znek0NLNEoaIc537IbAH0BMD5BqqZwWXzcPsiC
 57dynmLrdGIBZGckEfDbOCM/u6k+xM3n3R/YBL96jx5HvXbSfQPSt8g==
X-Gm-Gg: ASbGncsqsEH+mkudOcKrI6GHAk0G5S/cl/DEj5Rxa36mxdsMRe9W8Nnydp+j8oIx8Vj
 Vvmy5UXJehCqHi61CtSscdSJOA+9RK9DALyAUctRyjM911tDfGq5MG9Fh0c/lJmXikn6SDpW1Xw
 3WJvfD2RkCf004bmONEimvITgjyYwPWWGTgUH3gO57Kqti4tVWjR9rKzscUkKN0sTDIJD6OvrfU
 6NpK9GOT9LYCXp47bAQHEyMT6/j31TdYHZoERdlxhByotkpTlOzZeaS4wd+UHUDrDcZmyluuIK3
 i6mntP15nu3LuCK88+kA9CzHlTazcz0MHJI=
X-Received: by 2002:a05:6000:1ac9:b0:3ee:1578:3181 with SMTP id
 ffacd0b85a97d-3ee87aca8edmr8850942f8f.49.1758545482495; 
 Mon, 22 Sep 2025 05:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBnJyKfbsGoT60gmGSw8lHVDLSbpKp/h3+mebPlmhY5lsdty8PTSlmG0n1AgxTfhHPmUKyNA==
X-Received: by 2002:a05:6000:1ac9:b0:3ee:1578:3181 with SMTP id
 ffacd0b85a97d-3ee87aca8edmr8850919f8f.49.1758545482036; 
 Mon, 22 Sep 2025 05:51:22 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:f900:52ee:df2b:4811:77e0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3f0e28c83d6sm14362825f8f.56.2025.09.22.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 05:51:21 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:51:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: Re: [PATCH v11 16/17] docs: hest: add new "etc/acpi_table_hest_addr"
 and update workflow
Message-ID: <20250922084913-mutt-send-email-mst@kernel.org>
References: <cover.1757084668.git.mchehab+huawei@kernel.org>
 <ca6ec605d255385430a923f9bf8dced717173690.1757084668.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ca6ec605d255385430a923f9bf8dced717173690.1757084668.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UTSrpX5A5FdwoDW2HQU4VWspxsZ0XNNAucwU4PXu1-A_1758545482
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Sep 05, 2025 at 05:09:23PM +0200, Mauro Carvalho Chehab wrote:
> While the HEST layout didn't change, there are some internal
> changes related to how offsets are calculated and how memory error
> events are triggered.
> 
> Update specs to reflect such changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index c3e9f8d9a702..3d1b85d74b70 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -89,12 +89,21 @@ Design Details
>      addresses in the "error_block_address" fields with a pointer to the
>      respective "Error Status Data Block" in the "etc/hardware_errors" blob.
>  
> -(8) QEMU defines a third and write-only fw_cfg blob which is called
> -    "etc/hardware_errors_addr". Through that blob, the firmware can send back
> -    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
> -    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
> -    for the firmware. The firmware will write back the start address of
> -    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
> +(8) QEMU defines a third and write-only fw_cfg blob to store the location
> +    where the error block offsets, read ack registers and CPER records are
> +    stored.
> +
> +    Up to QEMU 9.2, the location was at "etc/hardware_errors_addr", and
> +    contains a GPA for the beginning of "etc/hardware_errors".
> +
> +    Newer versions place the location at "etc/acpi_table_hest_addr",
> +    pointing to the GPA of the HEST table.
> +
> +    Using above mentioned 'fw_cfg' files, the firmware can send back the
> +    guest-side allocation addresses to QEMU. They contain a 8-byte entry.
> +    QEMU generates a single WRITE_POINTER command for the firmware. The
> +    firmware will write back the start address of either "etc/hardware_errors"
> +    or HEST table at the corresponding fw_cfg file.
>  
>  (9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
>      "Error Status Data Block", guest memory, and then injects platform specific
> @@ -105,8 +114,5 @@ Design Details
>       kernel, on receiving notification, guest APEI driver could read the CPER error
>       and take appropriate action.
>  
> -(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
> -     find out "Error Status Data Block" entry corresponding to error source. So supported
> -     source_id values should be assigned here and not be changed afterwards to make sure
> -     that guest will write error into expected "Error Status Data Block" even if guest was
> -     migrated to a newer QEMU.
> +(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,

reports

> +     when a SIGBUS event is triggered.
> -- 
> 2.51.0


