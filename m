Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB69D111A8
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 09:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ0Gr-0006w8-1L; Mon, 01 Dec 2025 04:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0GS-0006pE-7G
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:32:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0GQ-0006q4-Pb
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764581529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggam1p3bDbUrKkAlbW0ViRxlboz+mv+LhL9b/kQ64jc=;
 b=IWSMtX0mPZBjXpZ0Bk0yEpZ1U58hjAsn/KP1bSNUOVAqfPw2yNMj/09YlyPW3nfP3p9eTS
 zZRWzuJD60WRoMzPSDaEbCgN5L230EX3BorV0AOXswsX2CaPpGyfdqa2Cxs46KA6ybM97t
 16V1YmZyacrgC0MECfMFTXjjFRe+fMY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-pQIJoZ4cOUWGQUST23xpyQ-1; Mon, 01 Dec 2025 04:32:07 -0500
X-MC-Unique: pQIJoZ4cOUWGQUST23xpyQ-1
X-Mimecast-MFC-AGG-ID: pQIJoZ4cOUWGQUST23xpyQ_1764581526
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b2ffbba05so2068832f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 01:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764581526; x=1765186326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ggam1p3bDbUrKkAlbW0ViRxlboz+mv+LhL9b/kQ64jc=;
 b=dy/vywWxukXfbfFXvLsaMobi1S0myXVQkd363+RIXosXVsm+1wNo3wegYCXeguhXPd
 2Va793XLUTyW3HMPc1eUHDBpKasY5kv3FgRCpNyPHy9up9W2ndNWdOQD/zNnC4byE0Gr
 X5SwdozNfg0HN0Plen4f61P0xHB1+jt/SLUTOE8aMy70BK6WcxXocDn2u+QaBDpfKwgF
 SZD+jfZE4xNo/ZWMnKvTTaROrLDCEyCZaQ74nxZqwIod+BqDUXB8+pF0g4xytFStFmJ0
 Y7fDvimqXPPGg2veEKjS6AEodg7dywvPZnivEkd6iXPlegHTVM9Nl6McofY4UrQl4euT
 /kCw==
X-Gm-Message-State: AOJu0Yx9VjWjDKFrfP7BymYdPM4Pyvf473NXLK6vAqTuEHSaPlmd5jbe
 ayOM4KCdLXlSL7o/hn98guNxONqTfXNrsJGf5+O0UXxRHO5JHsoEUq/ZOuKs0pwV3OS4QonUT4Y
 S1hXI3JxAFWUqRmFgLW7pZk0q3DpK0s0FuTH99wLbtXDtgqs4ZQo3rBacb/Gkow==
X-Gm-Gg: ASbGncuZUzbhfYLeS7nGyoHLHVo/wL7bWqklWxqa4OzGbPT/vmvELiVU7uzCboz464N
 q/OCG+NowiS5xs29UPgQmRk0Fo1QLvNxhvGYQ6PDTxJrF+pl3qwmjC7cL0CYtvA5Kk9RVyB5K5J
 NjTxWSjUn+Sp+ayhU6rskr6XDJlJJNI9Ogmq2y6HX6QCp87Dzc78wXQ24wY811wxx5ymmJceYEH
 ARPYHXv8eHSemiuY8Dw1k75itWOQPt1EXlcsTlC+EYKGcs/rI3hs229rDp3kruGSTuybZlr8qde
 OPhPYV8Q/zbhudp0zI5z4DbXBLoHWENRD6VEmN0l/AX+S/DLR05HHt+7lREhEIfwvQXTPw==
X-Received: by 2002:a05:6000:2f81:b0:425:75c6:7125 with SMTP id
 ffacd0b85a97d-42e0f213a9cmr27425526f8f.16.1764581526322; 
 Mon, 01 Dec 2025 01:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEYHiRpHiZg0CsCP2pRSAbCbekFKXcvVHxZH2gOqrMZE1YiuAgh6kf+L6HoEpouqiPRNcnGA==
X-Received: by 2002:a05:6000:2f81:b0:425:75c6:7125 with SMTP id
 ffacd0b85a97d-42e0f213a9cmr27425473f8f.16.1764581525926; 
 Mon, 01 Dec 2025 01:32:05 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3041sm24106306f8f.6.2025.12.01.01.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 01:32:05 -0800 (PST)
Date: Mon, 1 Dec 2025 10:32:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/5] acpi/ghes: Automate data block cleanup in
 acpi_ghes_memory_errors()
Message-ID: <20251201103204.19ff614e@imammedo>
In-Reply-To: <20251127004435.2098335-2-gshan@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-2-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Eh5AHtceRI9VKVxY_75EriECtEbL9xqj2o7e_-G6s1c_1764581526
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 27 Nov 2025 10:44:31 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Use g_auto_ptr() to automate data block cleanup in the function so
> that it won't be a burden to us.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 06555905ce..6366c74248 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -565,9 +565,7 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>                    0xED, 0x7C, 0x83, 0xB1);
>      Error *errp = NULL;
>      int data_length;
> -    GArray *block;
> -
> -    block = g_array_new(false, true /* clear */, 1);
> +    g_autoptr(GArray) block = g_array_new(false, true /* clear */, 1);
>  
>      data_length = ACPI_GHES_DATA_LENGTH + ACPI_GHES_MEM_CPER_LENGTH;
>      /*
> @@ -585,8 +583,6 @@ int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>      /* Report the error */
>      ghes_record_cper_errors(ags, block->data, block->len, source_id, &errp);
>  
> -    g_array_free(block, true);
> -
>      if (errp) {
>          error_report_err(errp);
>          return -1;


