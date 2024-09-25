Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp356028njb;
        Wed, 25 Sep 2024 07:15:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxjwzKCCj6b5YizSnAixjl/kxrSe6cviN4ns4japeivRuH+aSxtY2oyM6Lhumn7yl5UxAJ3uLc0tA/Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IFXrxcw5aw0G1pfckzkRKERsMydvjHgCr2F9iEdivSw0BQS3QawRLxcjj+gBxV9BZ0Iyy0O
X-Received: by 2002:a05:6102:2ac1:b0:49c:9bd:2ca4 with SMTP id ada2fe7eead31-4a15ddb3eacmr2952369137.27.1727273746047;
        Wed, 25 Sep 2024 07:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273746; cv=none;
        d=google.com; s=arc-20240605;
        b=CZahI9dYMzLUJOEd4WfLoY0rE6F67hKFLJPTwPxPBuiqvwWyPeYGEKZ3clk24WzpdB
         fgDwuxyg8f+QziAbYFAdaIBtFfSuseEtLwK/Nnv6gHePJJbdYIloi7AmUtHq+aLAq35r
         5+6Up0LIIs0UdX4JbwTvZ0xjrvNb7usxLKr0BnT/zlaProSj+NmY6Zs298K2UPXmrf5m
         2qKVKqv0rr6RZen30fL5JFyrpYx2jOhLRIT9Zyswcu2mwJXUeQqXYJc7mjMfTAdhA0tr
         efMgwAgmh55PXZHUXAexyiJ362OZj6V5Yp5v1dt9Jh5YDHI9KoX7o66M/5fcTzPHtp9X
         /NZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=4x6tSW1oqYbKPAlzF4w//tCdI78qNJ+7JPsVJdY8Y8U=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=MsvDIApSURayXF6ozMBJq96aV3l7oHzvPrLJoW+W+GYoCq+QCh+hCPGNafE9aFL7bF
         nfzSsnzHbzDSeWA86tGKAbQZpHa6slz63UbyWDM1QIcbIidqLxizTcVESErZoqDP46sC
         zvMTnB0IVt89UVLX7PT0Os/Llt6jxtxE4+ffBBx0elCmredhVcekInBpkHQmWUCN3pso
         Aneigk2S+oC7Omtk7Irkz8fvQdQ98TlVJYfJJNx5DhhZaqhWi3P1XVGKoYqeouke8S34
         J3axar31yFRLn6fgKEplDxlT3cUtu2ZbZmabQBp+6U8pce3H999/WQDtM4RvgXCto7PM
         JOAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a15186c2d1si1238739137.384.2024.09.25.07.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stSnR-000125-HF; Wed, 25 Sep 2024 10:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSnO-0000zr-7O; Wed, 25 Sep 2024 10:15:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSnL-0001cq-Nx; Wed, 25 Sep 2024 10:15:09 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJYR2JCyz6D91w;
 Wed, 25 Sep 2024 22:11:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 48ABC140736;
 Wed, 25 Sep 2024 22:15:05 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:15:04 +0200
Date: Wed, 25 Sep 2024 15:15:03 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Message-ID: <20240925151503.00000b1d@Huawei.com>
In-Reply-To: <58444cff65cc5b9164f47db4685910a2602b7d13.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <58444cff65cc5b9164f47db4685910a2602b7d13.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.828,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rb9RuU7Zi4FJ

On Wed, 25 Sep 2024 06:04:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The first argument is source ID and not notification type.
Maybe call out that the header already differs from the two
implementations in naming this parameter. This just corrects
that.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> ---
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/hw/acpi/ghes.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 20016c226d1f..50e3a25ea384 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
> +int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present

