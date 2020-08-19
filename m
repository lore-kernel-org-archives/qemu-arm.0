Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp349622lfy;
        Wed, 19 Aug 2020 04:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgcqktgZ7RHS2RUqVuL8d08PEXKJinOH2WDMQNALbdwvc3bTqpH4PLZJdmJZgXAIoj01fA
X-Received: by 2002:a25:7283:: with SMTP id n125mr31044897ybc.28.1597835213652;
        Wed, 19 Aug 2020 04:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597835213; cv=none;
        d=google.com; s=arc-20160816;
        b=EzyjcXkTJmCsmyDPu8zsFLwZr3Y+9FmRLlC9LF+0key0H2kGKdy1HT52928hyWPxSq
         TU9vKYc3TmnSkFeEWgQi+Q/8gPpgZMTrl7khAJHaZWhPoBccqEJfvJT90Gdtu1fJ/r7o
         VrWzWKhw5cFUK4N7G1R5Ldv8VYTLrlgo09e9oqfheRvu1RDd9lFX//1Gu9jPBCcOE5qT
         3ukVlzUIl4lR4SimlhBB0K/KalmNrrPK1u1KoeKBDlt7xosDVTVIJ+9N3wN/LkoVBIkl
         t9bgieUxM61mCq0aje7cSACNZqzH6d11gQzmvxnNeP6ZWBw9FKedy0W+x3JzfPfHg+Sy
         q90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=awSgDr+zzbPKf8mSaJKIeRgyTzSxIEzRCTWBG0eezQk=;
        b=JpZ883bAjsnlV1cAYo8kK+y2NZl7zxXSPycNQPBHeTSe+hcli8G3Tk299utS2bFjpG
         34yVKz4sPv07GgsP8b23nJFarSX6WSMOh1MVOP3e4FceSgisYWovEsMlbXZlkmR3RvPn
         BvR95JeF4I+LTWZ4BxyNqa4/5sY3yOpp/8S/hY8hX63IMTU2g1cPJo1FVs/ErV1XEzhk
         q6Xkc6kdQN2srU34r5Ov0OpYq5fFfgQ8WkhDwEDjdEav+V/FAni8E05O5icFxQHwTwXr
         ZPM3myz7JAxhaQMTx0e+f0eFqDHt/npBg3eA5/YMrSwPkjGCY/e8HUsCrAvD+JAaCR6n
         Z6Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ff4BKk+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si27206337ybo.46.2020.08.19.04.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 04:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ff4BKk+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Lvh-0001Y5-1Z
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 07:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8LvZ-0001XX-3h
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:06:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8LvX-0006aU-G9
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597835202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awSgDr+zzbPKf8mSaJKIeRgyTzSxIEzRCTWBG0eezQk=;
 b=ff4BKk+h2H4hZ+HW/sHDXSqBNSKvw5VYmZN4zydoR/sHLrNmX6JSIYqfwKVEAZt8FacFRp
 WofiZ4yD7vSaNWvWLzLMissAoL4S3vhXYS5bqyvG6VJuMhwInnORaC/vYFBOBfPvaVKxP0
 zkHswiOa+WWZdttaWARRl4ZDHpOw/Aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-GVdjY_SnPPOzUY5tzpXC0w-1; Wed, 19 Aug 2020 07:06:38 -0400
X-MC-Unique: GVdjY_SnPPOzUY5tzpXC0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD0881F02B;
 Wed, 19 Aug 2020 11:06:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80EDB7BE8F;
 Wed, 19 Aug 2020 11:06:30 +0000 (UTC)
Date: Wed, 19 Aug 2020 13:06:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH 01/11] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Message-ID: <20200819130628.2c2018db@redhat.com>
In-Reply-To: <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-2-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:57:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, pannengyuan@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7kzBNmYF83Wb

On Thu, 13 Aug 2020 15:37:02 +0800
Chen Qun <kuhn.chenqun@huawei.com> wrote:

> Clang static code analyzer show warning:
> hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
>     madt = acpi_data_push(table_data, sizeof *madt);
>     ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
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

