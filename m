Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1387367lfi;
        Mon, 23 Mar 2020 05:24:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs0CpnqnOHGJSk3xWypWILxwoRMarMmr+3k/Ub7yqWcfHr0iSgSsM4bmbWEKNkGCA9y8f/o
X-Received: by 2002:ac8:138c:: with SMTP id h12mr8331475qtj.210.1584966289911;
        Mon, 23 Mar 2020 05:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584966289; cv=none;
        d=google.com; s=arc-20160816;
        b=mN2+GwyqolKWUzVIskJMSKSWI/Dj1jWDIZuc8+J86JVvPb/KgJxcvCJlee/9YE+BTC
         AEn1juKtK7cBxzcFANyXF7lrkcq0n2JCIc0hDJEYwpXk+H55dPnZ5+byDA2k8J8QkDw0
         s87rh/RVdo2tmhLGOLm0FKMIXSlAJvDoVDs/VEQVx5FWdG0XlV3eBiRA/SZlQJkUEos8
         H12t9vOfixYVjHzjBN0IHJ4ZUypIlp4sHmmYELdKUsCkCah9eKlXlOujR6KT1hffvwj4
         Aqjmw/BYKK3+2FhddgxkinSyEoi0pu12xb8ZUEYCMQZ5Tyqlg7VIMLOlRRBBXj2tZL61
         qkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=nDf/vEngzybWz4ot9gQJs4GKlGqS4n9YX81k//UFJBM=;
        b=tyJqx2TSUifdjml8ZEkmJDp0N143U5wTqWuE/kW95j+UiLQJNWEYdIa2BR5/1S5aqE
         FqwMXwdZR0zPgyrx0qfJMIr5ZSCFw8nFxJgJAPg9oE7V6Gg9M1awKLnIJ1h2nSH0RPDZ
         txAdF1qwV9aKMY8XQ46TSsBfxyKsa47OEZV4Vj6hN8Uzzsn4k84w/Ud8HfPL6XQTfAi1
         V/s2NbXPdymzU3OkpzCkbKOk/Jt0hghNqPpilZ3fBXZSNWMrXC2j5fzJS4+SQlhzPJRC
         z3ILn69esyYSA8Kij+rnZmIFfAX5L7zuUlsMFbx9kfZoFeBZgLg1q3hrpYRfTvlaGZ5C
         Lraw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7siMTQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188si8202938qkb.310.2020.03.23.05.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 05:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7siMTQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGM8P-0007rv-Bt
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 08:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGM7K-0005s9-B8
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGM7J-0006Aa-6l
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:23:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:52075)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGM7I-0006A7-Fl
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584966220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDf/vEngzybWz4ot9gQJs4GKlGqS4n9YX81k//UFJBM=;
 b=M7siMTQOQAvia9io4kEBvxdOIRF65RRu/otgnqOfsQf+HCyDhMYwY6m8udHOgeAsnajbI0
 zgZaPXsBpF5eVIoOnEWNrMfx6TwziSXTgWse902kUa1ObsKVVhfS/yNAOy+YGtpyOlUUg8
 89uloapwNOhFA7MxbPruU3GkA7mtPvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-ElVLvD9sPlqtVFVND3ttIA-1; Mon, 23 Mar 2020 08:23:38 -0400
X-MC-Unique: ElVLvD9sPlqtVFVND3ttIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9ACF801E53;
 Mon, 23 Mar 2020 12:23:36 +0000 (UTC)
Received: from localhost (unknown [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 577A59B92D;
 Mon, 23 Mar 2020 12:23:24 +0000 (UTC)
Date: Mon, 23 Mar 2020 13:23:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 01/10] acpi: Use macro for table-loader file name
Message-ID: <20200323132322.1339fb96@redhat.com>
In-Reply-To: <20200311172014.33052-2-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, mst@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wef17zVecjNn

On Wed, 11 Mar 2020 17:20:05 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Use macro for "etc/table-loader" and move it to the header
> file similar to ACPI_BUILD_TABLE_FILE/ACPI_BUILD_RSDP_FILE etc.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c    | 2 +-
>  hw/i386/acpi-build.c        | 2 +-
>  include/hw/acpi/aml-build.h | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index fb4b166f82..c13710b727 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -929,7 +929,7 @@ void virt_acpi_setup(VirtMachineState *vms)
>  
>      build_state->linker_mr =
>          acpi_add_rom_blob(virt_acpi_build_update, build_state,
> -                          tables.linker->cmd_blob, "etc/table-loader", 0);
> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
>  
>      fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
>                      acpi_data_len(tables.tcpalog));
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 9a19c14e66..80f05d728d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -3043,7 +3043,7 @@ void acpi_setup(void)
>  
>      build_state->linker_mr =
>          acpi_add_rom_blob(acpi_build_update, build_state,
> -                          tables.linker->cmd_blob, "etc/table-loader", 0);
> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
>  
>      fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                      tables.tcpalog->data, acpi_data_len(tables.tcpalog));
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index de4a406568..0f4ed53d7f 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -13,6 +13,7 @@
>  #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
>  #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
>  #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
> +#define ACPI_BUILD_LOADER_FILE "etc/table-loader"
>  
>  #define AML_NOTIFY_METHOD "NTFY"
>  

