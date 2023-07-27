Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1243850ejb;
        Thu, 27 Jul 2023 05:19:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGIehL1pzjmRPuGAEpqeMMu39Lij7pv4Y4uwxc0LIbycFV9ghh941qsSAd2Hlt1f+Y3M4By
X-Received: by 2002:a05:622a:1302:b0:403:ff6d:1ec1 with SMTP id v2-20020a05622a130200b00403ff6d1ec1mr5987917qtk.48.1690460344304;
        Thu, 27 Jul 2023 05:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690460344; cv=none;
        d=google.com; s=arc-20160816;
        b=wDIRMy6XeolvESEj6/ilUPom+3DxS8PynI+NhEjySyXH7vRXXWei3h8Oop8PUFidBr
         qcy8ZxArZQrNa4xu6+653fxn6wfh2zmowZ+XM3DxcxG+hGlpZnPnl+TdjzdpehFjFAr+
         9TEOsjX+QBP+ijVjS4xHULOtBV1ANL1zs7MY4+ohiNfKfa0VU7/ffs3Vh+idPkcv54XL
         hQDi7O4J8fgJ1t0tXHkCtPZeXgSC7xtFJ0yPb6SqPRmitL8Z7krciar4rBveulfyEvzP
         edtXMeoQtP1ezvZesW2Q3jgmI8gWNmynajPl6jfjOjisIds9CsWXAXi80lW+9t3PTEX8
         7ZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=ppN+bgpvwcevxBHrqVvwwOOCna8g1cmyqgFyZkevYtg=;
        fh=Mzzz2ni5vP6alskqY7WSzZVGpkpjliVK9alKjrtsoe4=;
        b=eqhE5g20YmqJZ4cuTrZ+sfXnb+9FdptEXCAsK/v2hcRa7inQVbgBkPzgevIG546S1f
         EwV0QevaKVy/Jl4qyL2F++Ay3HPf2aBzBoau/+Utbe1ImPcS28vE90zkk0MbPZU6mWlR
         pz95gk6YNHj1HJafnrJg3isbDqI0ux33Tmv1q/dMTuAHxrIbo6DZyH3YxtEkUhepw3o+
         2JU3NOOJU9X+4YBlUtZ5li89CSPQr2C3/yjzUMRm3Nl5SBCxcqouKxYlnf7JPoauOjks
         oLNiAIN0yv0gXqXm5tkLgysz95cUPUp4kVJX8BJv8jNMd8u3hEV6TckWV/lNn+mi+Txu
         znBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hajwQ1AP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a010c00b00403dd3f7113si692701qtw.322.2023.07.27.05.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 05:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hajwQ1AP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOzjq-0004M2-Rj; Thu, 27 Jul 2023 08:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qOzjg-0004KQ-Qw
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 08:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qOzjf-0002QJ-8X
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 08:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690459490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppN+bgpvwcevxBHrqVvwwOOCna8g1cmyqgFyZkevYtg=;
 b=hajwQ1APsPzNMFx544BIWrZhHIup+p9BxN43WryubBj1KxO9EB5Sgf64GX2hONYSB7bh0F
 4XAXf3BM5NTZDAve5yir5F38DyPNW/LaWShW6U7PnMGEBMZwY8Y+cEYaYBuQSIZziBiGH5
 +YJexUJCtF22BYDSvkOTgRmM4G+LoAo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-bk4Blb06OXKSTSZhSvgkcA-1; Thu, 27 Jul 2023 08:04:49 -0400
X-MC-Unique: bk4Blb06OXKSTSZhSvgkcA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bb70a4b28so49468066b.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 05:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690459488; x=1691064288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppN+bgpvwcevxBHrqVvwwOOCna8g1cmyqgFyZkevYtg=;
 b=JbKJYhiKnLPyfwOTOULqIa+rdz2cTNsW+NM1Om2DxoZYJph0dAee33coUuRswRVuFW
 NqcKjWy/r4Q5ER1ibP6nbvBqUJzM1j7mUZmaV5rDLqX51ebGN/IqH/FRGoy3azN+jdja
 uSOqViZmKf2+X4hky1n9zwOeiN7HdL32yKPECcxV+7rtFgE3rkLFEq6qa2npiwaf0wse
 uq11QkhK2YIa9ZSI4v7jPbhAIB99w7tHDXAsUlwbUr4GD+mWP2OMfrXoKdj412z3xQ+N
 ysozA+aE7d1Ea+2ifqS79o6xwP/qeNUnMBPsoq37Q4P4uUlbIMY8CA5eLNBM1gECV0ku
 NHyA==
X-Gm-Message-State: ABy/qLZ+nzB/Dr5yW9ALGW3TwePo9P8G5m3rl2WSeI4jbSDJrh4tkmIq
 2f8/aIgCtt/1cjrjVZmfOWsYARkDd+ylix+egUmmp9ePO7QFanr7nNl1/Ne6JXhI5tVD6Z6DrzX
 WhoByfZylzohw
X-Received: by 2002:a17:907:75e3:b0:99b:d784:f8f8 with SMTP id
 jz3-20020a17090775e300b0099bd784f8f8mr1465534ejc.69.1690459488077; 
 Thu, 27 Jul 2023 05:04:48 -0700 (PDT)
X-Received: by 2002:a17:907:75e3:b0:99b:d784:f8f8 with SMTP id
 jz3-20020a17090775e300b0099bd784f8f8mr1465510ejc.69.1690459487745; 
 Thu, 27 Jul 2023 05:04:47 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 t10-20020a17090616ca00b0098d486d2bdfsm704106ejd.177.2023.07.27.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 05:04:47 -0700 (PDT)
Date: Thu, 27 Jul 2023 14:04:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 04/10] hw/riscv: virt: Add PCIe HIGHMEM in memmap
Message-ID: <20230727140446.14f4c9f0@imammedo.users.ipa.redhat.com>
In-Reply-To: <ZMJOB7qZGqzbvACZ@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-5-sunilvl@ventanamicro.com>
 <20230724173254.3423a204@imammedo.users.ipa.redhat.com>
 <ZMJOB7qZGqzbvACZ@sunil-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lBbTmmGTjUUO

On Thu, 27 Jul 2023 16:29:19 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> On Mon, Jul 24, 2023 at 05:32:54PM +0200, Igor Mammedov wrote:
> > On Wed, 12 Jul 2023 22:09:37 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> >   
> > > PCIe High MMIO base is actually dynamic and fixed at
> > > run time based on the RAM configured. Currently, this is
> > > not part of the memmap and kept in separate static variable
> > > in virt.c. However, ACPI code also needs this information
> > > to populate DSDT. So, once the base is discovered, merge
> > > this into the final memmap which can be used to create
> > > ACPI tables later.  
> > 
> > can ACPI code fetch virt_high_pcie_memmap at runtime from
> > host bridge (like we do in pc/q35)?
> >   
> Hi Igor,
> 
> Looking at the current design of virt machines (arm/loongarch/riscv),
> getting this directly from the memmap looks simpler. ARM ACPI also uses
> the memmap to get the pcie_high space. It appears to me we need some
> more infrastructure code if ACPI needs to fetch from host bridge. I am
> not sure why that would be beneficial.

Sure it's possible to directly hardcode access, but it becomes machine
specific and hard to generalize/reuse (defaults might belong to machine,
but ACPI shall pickup these from actual owner - hostbridge).

And no extra infrastructure is need, x86 manages to do that by
using properties on host bridge (one can pre-program values on host bridge
during it's creation, firmware can also change them later when initializing PCI).
Then DSDT generator picks up uptodate values from hostbridge
(which is actual owner of these values) via properties.
(basically copy pc/q35 approach). 

> 
> Thanks,
> Sunil
> 

