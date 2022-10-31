Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1046593ejc;
        Mon, 31 Oct 2022 07:59:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67rDmjX9W7BN8/QYD0ccVYOCnSzd7eBl5pX7RVzetFlDJ2Mg1PTpC6cK4HFzgXiz7GGxhF
X-Received: by 2002:ac8:5d8d:0:b0:3a4:e2af:8cd4 with SMTP id d13-20020ac85d8d000000b003a4e2af8cd4mr11161655qtx.385.1667228353757;
        Mon, 31 Oct 2022 07:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667228353; cv=none;
        d=google.com; s=arc-20160816;
        b=T+er2f3bxr2nwS+qke39qEt5QDgrSam6PGK/c+DJsKvoWsv5shWuzwITL1FLAvcShf
         YP1twdbzm8xTjakCrKk4olZUj/y+h+31e0M8RQPDzaJ7njQo34CKgHcFgj4anSNIDYkJ
         nndiTvLeLh6AJNvYp1y/5CORV8OqVwUDGaM9veFl1qvlg3C9hiLtJdS9El+I9+B9tGEW
         C/7ih2GSPS+94xYYd6E6wSOsxWGSqZ6I8AnLrpoij3kYBUUwLmYXM7PiuXhAEJjW/5oc
         U6FDvtlCrasSSvJM8Rd6juc+3vMIdNLRTaE1g7DpitfwhjmADJVUkcMDHG9g6a+7n2rn
         zGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XhCtG3JD2F4enAXnCHNZ3+cysXr2BmwWx8WFDVqPfBU=;
        b=yMA/R8mbFgAqnhaL6jIFWFXA2kOtP/SR2WVtIiqZPnoef6J74zD0pCGXULWmFsrOKp
         4aQ8Dl9ihrncTk/NVVWrNmbe+hl4LGjJn4bmphDFfKrRScWvr5jwRqaH4ApSImTLBlDl
         +1mrsIUmbEP5G0f2IWclRHNd+0IfrjKsAyeJrhd0ROyUst/dBuE8KOUjueJ5ehowicTG
         ZKee/kWMcib2XmF8ZydutP6HNtSqDXBEu0UrmWve6xaGED4nwAGuAaWw0WovM53D5YeQ
         hF7qVMGVKdtpj//KZJcizMi3OS4XpPww0eXMY4JndNYi4q89CfWwpDTjFm4TVpShVlPN
         8XXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/Jdva5e";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fx15-20020a05622a4acf00b0039a7aeffd1asi4166212qtb.284.2022.10.31.07.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 07:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="d/Jdva5e";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opWFk-0003YR-Vf; Mon, 31 Oct 2022 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWFi-0003Xu-Pb
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 10:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opWFg-0006ML-Ua
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 10:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667228338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XhCtG3JD2F4enAXnCHNZ3+cysXr2BmwWx8WFDVqPfBU=;
 b=d/Jdva5eMIgQQhOxFAtlqRTOjVyCiXe4oSZrfWiKHNDZIthLnSjnv7wPVSGVb9/0GvyzZc
 Yc7DAmsSYfBAMl+UsVKS8kfuf0r22hyDdn9/rq1B9u1MRn2+wNwIvKRvxMhu2Eh0Adaokv
 MSgUYDEkYYr/5ALYVSgWlejZCz+3ZVc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-8uEB5StmOMyt5mJK8QHtCg-1; Mon, 31 Oct 2022 10:58:58 -0400
X-MC-Unique: 8uEB5StmOMyt5mJK8QHtCg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so3160805wra.22
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 07:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XhCtG3JD2F4enAXnCHNZ3+cysXr2BmwWx8WFDVqPfBU=;
 b=P8WsgjeGyf78kzpxLYSi/qZaN5rRzyWo3tByl0vkHPORGOlnPDGNzZtu266tUjOAMh
 ZfHDt9awXgKoQfiACOzug8DUUovZSJxVpVXflglSGhPWmZTSioeTEx72v4GJ/4jqdcDt
 qV6GHnvzklgk53TA+QMK+evIsZ0wuIQ/dJ3edTiQy9aJKOfgXAFINg2WMaUd+tb7Dh0T
 iU+7pE/ZHXWBVrVv1B5busMGW6rHcfzkbJRGf24PBmPgvdaoAGYZuAbYu+BzizDes99r
 /CsOZyYdobQFxzHYsHXCcHACRfXGImaYV1eR6Ogd2/Ls3F2dWfQAu904EfHagn2nsW+n
 KIeg==
X-Gm-Message-State: ACrzQf2GnKtMIJZxQBmzrlQ+ewc/fzOLIKFGHy19a6TztEGPRw56aS3m
 qqCoRbAZpqvL45+m6irpdShxvZeXgtd6loa3fEliKQzxTE68HhkQBD+1da/U0N1W8L3Oai+tDmm
 cgah6Nt1ZhR+Z
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8462424wmq.84.1667228336693; 
 Mon, 31 Oct 2022 07:58:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8462406wmq.84.1667228336469; 
 Mon, 31 Oct 2022 07:58:56 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bn26-20020a056000061a00b0022cd0c8c696sm7323308wrb.103.2022.10.31.07.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 07:58:55 -0700 (PDT)
Date: Mon, 31 Oct 2022 10:58:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
 Hesham Almatary <hesham.almatary@huawei.com>, qemu-devel@nongnu.org,
 yangyicong@hisilicon.com, chenxiang66@hisilicon.com,
 linuxarm@huawei.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, eduardo@habkost.net, Brice.Goglin@inria.fr
Subject: Re: [PATCH v3 0/8] AArch64/HMAT support and tests
Message-ID: <20221031105832-mutt-send-email-mst@kernel.org>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
 <434bea8e-2945-12ee-0a46-0e316bfaade5@huawei.com>
 <20221031131717.00003cc4@Huawei.com>
MIME-Version: 1.0
In-Reply-To: <20221031131717.00003cc4@Huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: cjpAqzcqZyNJ

On Mon, Oct 31, 2022 at 01:17:17PM +0000, Jonathan Cameron wrote:
> On Fri, 28 Oct 2022 17:53:40 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
> > Hi Hesham,
> > 
> > On 2022/10/27 18:00, Hesham Almatary wrote:
> > > This patchset adds support for AArch64/HMAT including a test.
> > > It relies on other two patch sets from:
> > > 
> > > Brice Goglin: to support -numa without initiators on q35/x86.
> > >   https://lore.kernel.org/all/ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr/
> > > Xiang Chen: to enable/support HMAT on AArch64.
> > >   https://lore.kernel.org/all/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
> > > 
> > > I further add a test with ACPI/HMAT tables that uses the two
> > > patch sets.
> > >   
> > 
> > You seems to forget my tag :)
> > 
> > Anyway tested again for this series on master of commit 052924548886,
> > still works well and all tests passed for qemu-system-aarch64.
> > 
> > Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> Hi,
> 
> Michael, I think you said you'd pick this one up? (it hit during last freeze)
> Just want to confirm in case everyone was assuming this was someone else's problem ;)
> I want to add a bunch of stuff on top of this next cycle (Generic Ports in particular)
> so good to get this in place if we can.
> 
> Jonathan

Yes it's in my pull req isn't it?


> > 
> > > Changes from v2:
> > > - Rebased and fixed a merge conflict
> > > 
> > > Changes from v1:
> > > - Generate APIC and PPTT ACPI tables for AArch64/virt
> > > - Avoid using legacy syntax in numa/bios tests
> > > - Delete unchanged FACP tables
> > > 
> > > Brice Goglin (4):
> > >   hmat acpi: Don't require initiator value in -numa
> > >   tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
> > >   tests: acpi: q35: add test for hmat nodes without initiators
> > >   tests: acpi: q35: update expected blobs *.hmat-noinitiators
> > > expected HMAT:
> > > 
> > > Hesham Almatary (3):
> > >   tests: Add HMAT AArch64/virt empty table files
> > >   tests: acpi: aarch64/virt: add a test for hmat nodes with no
> > >     initiators
> > >   tests: virt: Update expected *.acpihmatvirt tables
> > > 
> > > Xiang Chen (1):
> > >   hw/arm/virt: Enable HMAT on arm virt machine
> > > 
> > >  hw/arm/Kconfig                                |   1 +
> > >  hw/arm/virt-acpi-build.c                      |   7 ++
> > >  hw/core/machine.c                             |   4 +-
> > >  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
> > >  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
> > >  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
> > >  tests/data/acpi/virt/APIC.acpihmatvirt        | Bin 0 -> 396 bytes
> > >  tests/data/acpi/virt/DSDT.acpihmatvirt        | Bin 0 -> 5282 bytes
> > >  tests/data/acpi/virt/HMAT.acpihmatvirt        | Bin 0 -> 288 bytes
> > >  tests/data/acpi/virt/PPTT.acpihmatvirt        | Bin 0 -> 196 bytes
> > >  tests/data/acpi/virt/SRAT.acpihmatvirt        | Bin 0 -> 240 bytes
> > >  tests/qtest/bios-tables-test.c                | 109
> > > ++++++++++++++++++ 13 files changed, 118 insertions(+), 3
> > > deletions(-) create mode 100644
> > > tests/data/acpi/q35/APIC.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/DSDT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/HMAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/q35/SRAT.acpihmat-noinitiator create mode 100644
> > > tests/data/acpi/virt/APIC.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/DSDT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/HMAT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/PPTT.acpihmatvirt create mode 100644
> > > tests/data/acpi/virt/SRAT.acpihmatvirt 

