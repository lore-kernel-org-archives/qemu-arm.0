Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3577705lfc;
        Mon, 31 Aug 2020 03:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkJOWwo2N/KOeGIiaLn3DD0fYw7uX3h3umcpuev4cH89J18ryXZcOW7BMesWTsz94nXig9
X-Received: by 2002:a25:ad4e:: with SMTP id l14mr1310267ybe.322.1598870818920;
        Mon, 31 Aug 2020 03:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598870818; cv=none;
        d=google.com; s=arc-20160816;
        b=qrF6q62nX5Uq/6fua/f596mGRDpr6MO1DYWultirloosrCF2E+6ddLUzL/mJRJSNSm
         ySNLUG/l7sHArx4TKO3HhNHk86fdnzdiD+oM9aOxlY8JTLkBBd4cLS9oi1g1dnRqt0Ju
         AKUE7mQPoQRpoZK+57p8XRlIbPVj2uiX199XhDqWuKyVwQBzZtaxVj3Wx7AhMt6UT7TM
         A8lLSm5TLOWop8v4F+tUQ1D/b0pR6eNfzXLkkaJftXkx0d05dAypI6Pw47q5KblMxFAX
         fp/nFmFiV//oAYYNhSaIu6ZRcpXyeQFkZ7ennF0fwTbytGgYml8+ItevSIvPx/WHxwxx
         QVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WggWi+voPbZe+Rd1hOnadW9OVt+clz+6b359Lf5wcUA=;
        b=tOOMqhsRBl7/Yvq41bX3HFwNtaGzxh2tQDHM7WqZxo2c5JJhNi7FFuB3wvDrPLR9ki
         srGjDsWw12ZJ7xt5y0Q9RZu7lReodzkJRPVpoPkKnxfiGyHUicn+F9d9dQJXbPGAlEt0
         mMTWaAuXQUOAamIo3VrslnEmEBbWYF6ed+FXUGpkQlK3maUoHUkU63VOSCLhE3LE+Et2
         wg5ab0CVWkAyB1ofEeHiMsJH3CjmFHlWLaua7Hh2c58yzMzzirkzYAgvcMk0owHN9pOH
         +HDm17QENjEJa5TTXDAWmKbm9E3nVDR7W5LxAf3QTuiniqiCT1YHz3E+9nqiN/zjwYFT
         fEKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ds5ZJDU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x194si6000645ybg.155.2020.08.31.03.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 03:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ds5ZJDU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kChL0-00034a-Ag
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChKn-00033z-UK
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 06:46:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30272
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kChKk-0006D4-D9
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 06:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598870800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WggWi+voPbZe+Rd1hOnadW9OVt+clz+6b359Lf5wcUA=;
 b=ds5ZJDU+9RZKtjLd13iXCz6lIfnaPRiGlaw6RynzNIgBob1eUeQxehgtV5VwJi2g2buPaq
 bXAsnFucBPk8oJwezEucU2oLMv1+lvnc6ga4gmilkskkUQ9/FnMVe/VVluYCWccqsLcr2l
 qlWoQuCyvmVUQgvV9V5h6bfvvSF3TvA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-3U3tsTdJOoelQ4ee9aAJAw-1; Mon, 31 Aug 2020 06:46:38 -0400
X-MC-Unique: 3U3tsTdJOoelQ4ee9aAJAw-1
Received: by mail-wr1-f69.google.com with SMTP id g3so3059371wrx.1
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2020 03:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WggWi+voPbZe+Rd1hOnadW9OVt+clz+6b359Lf5wcUA=;
 b=pb4pPvTwkVjEbvfPvSGYqyrdYJmKhWzWeaXG3+wtNO0uRP+cb3M4YWtudpgwGgEjr/
 D3N18PEbk4D9BcWqEyS8w2EN48FTIJWmLSdSY5JE1NbtTrYgt7U4RBrKk/mFyeP7J6Pl
 Idg+MiUwVtePvYRm77pRJDxPUXZS69ej1KLMFkg6wj19zqvoqgCjUhLMLsXQbZKC7E2c
 7kqOoSN7pNqcxmx+Cs4vCphqhTcmsUm1ig9G300DDE0DKoqLE344/UatjhTUtBv6tGDu
 +vFy3lOxn+08p6FyTXnVDSVzUsTiQQbFpODaZd48jTvgwkYu8jXH0mo2gFlaDU1CTt8j
 T9Qg==
X-Gm-Message-State: AOAM531VJA1OfZWP1E5oWJHQbk/qiZCH4LRhI8nCModWSqSrmIgABu7d
 8deAvxiPPiyjmB8YwssBTixwSpPgLuhKATLyck+GHnn/0Gl8QPwM5d6P9Eu1F0emLpqRlw5Mnla
 w+fJTncvqGe/4
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr1095687wrv.185.1598870797155; 
 Mon, 31 Aug 2020 03:46:37 -0700 (PDT)
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr1095658wrv.185.1598870796956; 
 Mon, 31 Aug 2020 03:46:36 -0700 (PDT)
Received: from redhat.com (bzq-109-66-64-75.red.bezeqint.net. [109.66.64.75])
 by smtp.gmail.com with ESMTPSA id
 q8sm11607586wrx.79.2020.08.31.03.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 03:46:36 -0700 (PDT)
Date: Mon, 31 Aug 2020 06:46:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH 01/11] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Message-ID: <20200831064614-mutt-send-email-mst@kernel.org>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:13:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, pannengyuan@huawei.com, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: azeRmjX2oFEF

On Thu, Aug 13, 2020 at 03:37:02PM +0800, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
>     madt = acpi_data_push(table_data, sizeof *madt);
>     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge through the trivial tree.

> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 91f0df7b13..f830f9b779 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -633,12 +633,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int madt_start = table_data->len;
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> -    AcpiMultipleApicTable *madt;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
>      int i;
>  
> -    madt = acpi_data_push(table_data, sizeof *madt);
> +    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
>  
>      gicd = acpi_data_push(table_data, sizeof *gicd);
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
> -- 
> 2.23.0

