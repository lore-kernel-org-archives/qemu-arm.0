Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A03D111A8
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 09:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ0MX-0000dO-S4; Mon, 01 Dec 2025 04:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0M8-0000ac-OW
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0M5-0007et-Gz
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 04:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764581880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DaEty387PH/ejKI8m8D9xKfy25pAxHPUdctNf1oV5uQ=;
 b=MTKgJYobI5/x7uhT+NokCrhSlD5BdGbfjYrCVm8UhfJ9iMaM9VtUd4BCPPStQDp5mAmTPm
 MXWKc28AotrjFEOtRzIQK6wdp/eer/eZgf5of65mqy/3dwrw1+9oWKrWeAksM5bMXHI9dr
 t+wroZhTiSiGLUb3GGgLrYE0WrzYAqE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-1oJBdUoTNAikeu6mLK4RuA-1; Mon, 01 Dec 2025 04:37:57 -0500
X-MC-Unique: 1oJBdUoTNAikeu6mLK4RuA-1
X-Mimecast-MFC-AGG-ID: 1oJBdUoTNAikeu6mLK4RuA_1764581876
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42b487cda00so2226519f8f.3
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 01:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764581876; x=1765186676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DaEty387PH/ejKI8m8D9xKfy25pAxHPUdctNf1oV5uQ=;
 b=eR5/xtH0fRcuGKa32S+hXs+LXhsQZ/6n7MryEYovL1yUwe50avvwTrBWWUTMFDadJr
 Ndui2zJTtBUczH26PJQByaOsX8MNaTA+N/KT2e4WSCTQs5v/nhL4iKgJ+BopuWIqK5cj
 jrzDPowQv4CjgGRGAQ6NOMTGW4Te5G9Ya+jEwl30Hpt61mnCiUXdr9nXXT1vvKeBAqp/
 ykl9S3D2C6B8Qc41ZLLrj3+il1nVeEqSH/Gc6/9pdp7EPDAh5Mzpw/ZOMPM8oxJPBErE
 1dQYkfpJpDhS4PkuZNTglV/B0VkQ12eKG0udkDRjTU2h2Sdhp7PxQXfBJhuTqYiBk/Ed
 zDgw==
X-Gm-Message-State: AOJu0YyOpRFy7I1fpaz951VdJ6nYLuuH50fjhOgxV222zCqTrH4Et7IM
 0coDs2gaRnsEIzvcJ1oGufv4OKTmRkk+uuZq62O0efZaTXw8Ntup5BHEbTUrDMByLfMXiqkFy5F
 2qZwTQqM5aT24sOB/icb6rk4D/rqkr4xvbkoiYA0oQ/01B4nffWZBzw==
X-Gm-Gg: ASbGncuZ+BONbXrK5moUuhXhHolpt/z2wZe1315dxjkVad+LRU5Nbb9tAkk12RAnlwx
 pkTiUlMlAulS2zE7tCdedOq/+2ND/h3w7ihipAB7FuWs9VHRByOFuN22Uxij3GhoR2ogklbFwF9
 mULoSZZTWWoouX6TUsTIT2zNeT8xilIdgXQqUf0384IFYuTBt9jm3px43x01l9LN92VpGPGVJfR
 Ie3Q6F+pOe2/0VHL/bzq9Bov8YF53HPBGrP+57B4BX4TUvaj4391Uw/eVMfoYPr5OoGW9HLhgtG
 Dpdy/LwBBAGxkeD8lF5EoViZ/Auw6/AvmeKf2kcvfdKu12SxGSuPGt4l8O26Wg4h+X5Jkg==
X-Received: by 2002:a05:600c:1c13:b0:471:786:94d3 with SMTP id
 5b1f17b1804b1-477c01b201fmr359198175e9.22.1764581876233; 
 Mon, 01 Dec 2025 01:37:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2dsjbP7qIEs0Mvap0gO4378zyZOjamu2Mt9MeM8OtAAirolTU8yo+0XKPhbmeONNYnOjZpA==
X-Received: by 2002:a05:600c:1c13:b0:471:786:94d3 with SMTP id
 5b1f17b1804b1-477c01b201fmr359197905e9.22.1764581875871; 
 Mon, 01 Dec 2025 01:37:55 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791163e3cbsm234661745e9.10.2025.12.01.01.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 01:37:55 -0800 (PST)
Date: Mon, 1 Dec 2025 10:37:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 2/5] acpi/ghes: Abort in acpi_ghes_memory_errors() if
 necessary
Message-ID: <20251201103754.770941aa@imammedo>
In-Reply-To: <20251127004435.2098335-3-gshan@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-3-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6qzNPiDmCKjM2trbuu8dzGBdyzNPW0uYkVAWOExh6qQ_1764581876
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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

On Thu, 27 Nov 2025 10:44:32 +1000
Gavin Shan <gshan@redhat.com> wrote:

> The function hw/acpi/ghes-stub.c::acpi_ghes_memory_errors() shouldn't
> be called by any one. Take g_assert_not_reached() as a clearer indication.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes-stub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index 40f660c246..b54f1b093c 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -14,7 +14,7 @@
>  int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>                              uint64_t physical_address)
>  {
> -    return -1;
> +    g_assert_not_reached();
>  }
>  
>  AcpiGhesState *acpi_ghes_get_state(void)


