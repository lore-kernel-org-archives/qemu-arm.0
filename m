Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFED3CCF9E3
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Nov 2025 14:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vISce-0005Rj-A4; Mon, 10 Nov 2025 09:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vISc1-0003l2-G3
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:11:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vISbz-0001GJ-8V
 for qemu-arm@nongnu.org; Mon, 10 Nov 2025 09:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762783872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnQX52BP8B72g2oD+fn3IJI+PJcrGdrAgHvNidLuJLw=;
 b=d4O35kmar0JILshxYmfIqNH5GMyzFOmec7yAS2/6PGvMXX/zFgyGRXnQ1AFKRThDScbgek
 v0ClvZadSpjUAxInDd20yK52Mn1HLcawgZeuGaU0UkCsCCy/R36rJ/sfIScJa7JSkss2HT
 FnWqb45kkOS+dIJm02rqDz4sIcdrCZE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-wCLy4s8GOk6GKPO_60glFw-1; Mon, 10 Nov 2025 09:11:11 -0500
X-MC-Unique: wCLy4s8GOk6GKPO_60glFw-1
X-Mimecast-MFC-AGG-ID: wCLy4s8GOk6GKPO_60glFw_1762783870
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47775585257so14026395e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Nov 2025 06:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762783870; x=1763388670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XnQX52BP8B72g2oD+fn3IJI+PJcrGdrAgHvNidLuJLw=;
 b=naJiGMXVSY00MG+G6HAHkYye/jdrYLOB5sC/sjdUbuCM8IuGhYcDrsWZA7sarzPiBZ
 Uux8NLxzCNc0w7IyjEs8OcHDX+5wDNiwlUXwy5EBneb9+Qa2jv5Z5y2r+FADU5xZV81s
 Pi58WcNfW3cpi5YigSnSiMG0wC8ehVPSF/M2EkLOWH3zDfblPdOLX1zuuHthps8i7IaA
 DNsZrNwG1gKKoVTMc9hfahjrRZPLOJ5ICvS6xn2RCfrwHILlXnzlffA1yaWdCUMULnwe
 i8RHa5YwIjG4sM3N+bXx9KuxiCCTdwVGplfFt5Gj5IAL05Nn60w2ik4U98L+AAhxQoQA
 aKeA==
X-Gm-Message-State: AOJu0YwJMsvjprP+5pltCpC+rFbihC5Jomca4yt8/fiD9dXQ0MjTPQyr
 MdsKQnhsG25HZVRxn7siPci/8hX0vvDGIU59e3/k2dS0swGbP6bb8d8wYsIlZBNYyrTotOjYQbI
 Dvsw6LL2s2V+jijB7sDByYCMJpv07QCuSL25PbvnQHUkcPsAll9gTXA==
X-Gm-Gg: ASbGncvnhRw7oY9ml1+W6VsQei7inCWrp9ls8KO/Hxnke1r+JkwYs8G5Lvrk1mPfIIZ
 B+YdSsooSTiAl8gWXVvuhcXePkJTIok2cgIVMwq4InuXFb7DQ2zfpaCt2XbIww+3SHkuLBogexu
 bF5lljYqEiCLd1oVnfdIK7YtYBLdt2G+6vY/sgYgSZ6oGIyw44x7RMr6WC3xl76ecADNS0hq2Wf
 H3ZpvQLKZFeD0ahyMkqs7leQaKz9nkufVK3tb4mAsiQHUHEIfa82Tq5TQPkHasLItitnnGG/3FJ
 OH8lm5Lz5Bl1Ad1TjFVufyFqzxlJw4XiBF/qoS2tJk4UJKwv/o3laz+pckFJNp32Ww==
X-Received: by 2002:a05:600c:8b38:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-4777328683bmr75804575e9.29.1762783870310; 
 Mon, 10 Nov 2025 06:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElH4nhY/Rx50t8QLNR1GZHppzeNkOW+S13MslhbVkcCzzyxeCoLZoKELddpekTL9SitEuLfQ==
X-Received: by 2002:a05:600c:8b38:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-4777328683bmr75804185e9.29.1762783869821; 
 Mon, 10 Nov 2025 06:11:09 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47761c2fe2asm266380765e9.5.2025.11.10.06.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 06:11:09 -0800 (PST)
Date: Mon, 10 Nov 2025 15:11:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 2/8] acpi/ghes: Increase GHES raw data maximal length
 to 4KiB
Message-ID: <20251110151107.5e825ea0@fedora>
In-Reply-To: <20251105114453.2164073-3-gshan@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: drqaEfksMiuoL5ZZ4hEcw_dDBqoraV99lV8mJpGOJmo_1762783870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed,  5 Nov 2025 21:44:47 +1000
Gavin Shan <gshan@redhat.com> wrote:

> The current GHES raw data maximal length isn't enough for 16 consecutive
> CPER errors, which will be sent to a guest with 4KiB page size on a
> erroneous 64KiB host page. Note those 16 CPER errors will be contained
> in one single error block, meaning all CPER errors should be identical
> in terms of type and severity and all of them should be delivered in
> one shot.
> 
> Increase GHES raw data maximal length from 1KiB to 4KiB so that the
> error block has enough storage space for 16 consecutive CPER errors.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  docs/specs/acpi_hest_ghes.rst | 2 +-
>  hw/acpi/ghes.c                | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index aaf7b1ad11..acf31d6eeb 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -68,7 +68,7 @@ Design Details
>      and N Read Ack Register entries. The size for each entry is 8-byte.
>      The Error Status Data Block table contains N Error Status Data Block
>      entries. The size for each entry is defined at the source code as
> -    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
> +    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 4096 bytes). The total size

is it safe to bump without compat glue?

consider VM migrated from old QEMU to new one,
it will have  etc/hardware_errors allocated with 1K GESB,
and more importantly error_block_addressN will have 1K offsets as well

however with ACPI_GHES_MAX_RAW_DATA_LENGTH all length checks will
let >1K blocks to be written into into 1K 'formated' etc/hardware_errors.

Thanks to previous refactoring we get all addresses right (1K version),
but if you write large GESB there it will either overlap with the next GESB
or a smaller GESB might overwrite tail of preceding large one.
And in works case it's OOB when writing large GESB in the last block.

Given we have to write GESB successfully or abort, there is no point
in adding compat knobs. But we still need to check if GEBS will fit into
whatever block size etc/hardware_errors inside guest RAM is laid out originally.

>      for the "etc/hardware_errors" fw_cfg blob is
>      (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
>      N is the number of the kinds of hardware error sources.
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 06555905ce..a9c08e73c0 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -33,7 +33,7 @@
>  #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>  
>  /* The max size in bytes for one error block */
> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
>  
>  /* Generic Hardware Error Source version 2 */
>  #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10


