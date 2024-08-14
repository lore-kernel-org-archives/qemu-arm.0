Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp488231njf;
        Wed, 14 Aug 2024 06:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPsKR8orD44QMrJ4ORI5Rjo1oc7/nhn1NGhKkeaNJRwU/YD1Iv4ETE83LIRcruVnB9rzIAjrFJ4kDsv5BWag4UIrNGvIHT
X-Google-Smtp-Source: AGHT+IFYALuyTWsRGUgYSOKALGXC58n3GqpRAqgpZ5YnAJun7txuunEG0zMU3YvDG3FZh0GgrlJb
X-Received: by 2002:a05:622a:994:b0:453:5668:4453 with SMTP id d75a77b69052e-4535ba9b321mr26925021cf.11.1723643463643;
        Wed, 14 Aug 2024 06:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723643463; cv=none;
        d=google.com; s=arc-20160816;
        b=Av+uTKVt6lrvvLVLyxMf91eZtZnBiMFDXqLhj4Z/WSNEqmWtRNgYTGITsiMuckWiQx
         0fVbOgFX5Xo54Kz9IcV3sLuAFvWIZoUihjyXsWKWqQS5cLaKqIvEC0KOl/jJ0JOYgpCC
         DRuMJmQUNc/qsmyF+EFg9zFoosPkMsumN0M8AL3e6l9AwAqY6EUAi3zr30TZNKodufb7
         75dffwtZtIOIhzjtX7cLTmXdqr2fs6J8oeIXdO0UM1g/GWTYIQJxL/wWIzdKwvz9YYj3
         k3b6yxWb3WkFes/geN2MIuQJz0dOzPG9JmwPBM518lMdfqB+gnSSewYnfLs4VE3hO9mz
         JZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=QF3f/aHngNdvcVvRsumOtxtxMWVsvnYtKLnI2WuieA8=;
        fh=c5SdJPmuZjLqL/yVd759G8+oVgaaCcPKba91GgsaS4c=;
        b=euCMe+E5NEjmilJhfmztX8TW/9jar7r7O6dM89MD0nfMFjiDcVDIEHEWbUlg21GmKc
         9OpfFC2jUOfboO8w910Ejbx8u0aAYusuRKNFCiueNy6kciToie+INZckxsJzhM63QGAh
         YZKjzdMnBehjtLPZ5DRrL/zwsSWIfqVjHK1yR6a0qFm++ewUkM0uGPwZ5akDg5TNkb8U
         sEILBvSOyP6og8YXyTYGxzR1MbqGkIbPVrNk1ACfcE+Ii7QsvFz9OduZOQLCzSZJddWK
         Q8c6G6wXk4DorQNwXJPrDDkRQDCsAN7LzV5MtNd8Kk6jYB/V5rgZ1JAVuyt50YAUpnQT
         u7pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2aea70si108695171cf.677.2024.08.14.06.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2024 06:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1seEOs-0005q2-6f; Wed, 14 Aug 2024 09:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1seEOr-0005iN-2V; Wed, 14 Aug 2024 09:50:53 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1seEOo-0006GD-I6; Wed, 14 Aug 2024 09:50:52 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkV1Z3c6Fz67hQc;
 Wed, 14 Aug 2024 21:47:30 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id AE049140119;
 Wed, 14 Aug 2024 21:50:46 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 14:50:46 +0100
Date: Wed, 14 Aug 2024 14:50:44 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 03/10] acpi/ghes: Add support for GED error device
Message-ID: <20240814145044.00004d59@Huawei.com>
In-Reply-To: <f813113e8e7645c2fb654747ecd0726f330af29f.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
 <f813113e8e7645c2fb654747ecd0726f330af29f.1723591201.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DvCAHrXHBIJ1

On Wed, 14 Aug 2024 01:23:25 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> As a GED error device is now defined, add another type
> of notification.
> 
> Add error notification to GHES v2 using a GED error device GED
> triggered via interrupt.
> 
> [mchehab: do some cleanups at ACPI_HEST_SRC_ID_* checks and
>  rename HEST event to better identify GED interrupt OSPM]
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
One trivial thing inline (probably my mistake ;)

Jonathan

> ---
>  hw/acpi/ghes.c         | 12 +++++++++---
>  include/hw/acpi/ghes.h |  3 ++-
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 13b105c5d02d..280674452a60 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -34,8 +34,8 @@
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>  
> -/* Now only support ARMv8 SEA notification type error source */
> -#define ACPI_GHES_ERROR_SOURCE_COUNT        1
> +/* Support ARMv8 SEA notification type error source and GPIO interrupt. */
> +#define ACPI_GHES_ERROR_SOURCE_COUNT        2
>  
>  /* Generic Hardware Error Source version 2 */
>  #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
> @@ -290,6 +290,9 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>  {
>      uint64_t address_offset;
> +
> +    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
> +
>      /*
>       * Type:
>       * Generic Hardware Error Source version 2(GHESv2 - Type 10)
> @@ -327,6 +330,9 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>           */
>          build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
>          break;
> +    case ACPI_HEST_SRC_ID_GED:
> +        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
> +        break;
>      default:
>          error_report("Not support this error source");
>          abort();
> @@ -370,6 +376,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
> +    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_GED, linker);
>  
>      acpi_table_end(linker, &table);
>  }
> @@ -406,7 +413,6 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>      start_addr = le64_to_cpu(ags->ghes_addr_le);
>  
>      if (physical_address) {
> -

Clean this accidental change out.

>          if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
>              start_addr += source_id * sizeof(uint64_t);
>          }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index fb80897e7eac..419a97d5cbd9 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -59,9 +59,10 @@ enum AcpiGhesNotifyType {
>      ACPI_GHES_NOTIFY_RESERVED = 12
>  };
>  
> +/* Those are used as table indexes when building GHES tables */
>  enum {
>      ACPI_HEST_SRC_ID_SEA = 0,
> -    /* future ids go here */
> +    ACPI_HEST_SRC_ID_GED,
>      ACPI_HEST_SRC_ID_RESERVED,
>  };
>  

