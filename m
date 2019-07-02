Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3679170wru;
        Tue, 2 Jul 2019 04:08:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdTs0YYi/fIcAWEEyb0x+KAhgLmNhiuYeSSTtCIrQQIAD0JOaTmRCXjcA+aVAbqJeQsNJn
X-Received: by 2002:a50:89a6:: with SMTP id g35mr36049788edg.145.1562065684489;
        Tue, 02 Jul 2019 04:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065684; cv=none;
        d=google.com; s=arc-20160816;
        b=LyLlLbBBrO8/STdwMDKJ9MWPrMotXnboLeIrK/XSaOv7lblSnou+Yo6kqM9eruv3Bn
         y3gZ00xlSaGh5MFjJKLDZacWHx7VOWLOPPjs9mlRLBAbqiFNNQ0aERLfuznJmZxdF0Ol
         +xYjVnPc28gH3uQmKfKbcbxwVETgAUBFIOp1m+/je4h1o99HOuFeO+9z6AnebMpzLEGQ
         YBjA7mDUcarmLqcEJmaQA7CKdGLvE/beVANmIfXqwvXVfQAytJf62AhU3MfXDmC7qTrI
         vmublCazZkiVGtDVqnLnN5tBZgPB2yiohYGZvVV6i7CCpyaRCdRTkWnFkaG5ewHBEApr
         jEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=bGW0NqDdK77+E8nBEtyiFo5ta8c+z9u23r4b3FL7lNU=;
        b=a1kQWzah/UzoiNVcLvuvzwplh9bmtBYHwUul4y0f8eAa00Awt/VPJzuDa5TrjY5CQD
         F5Z+CaREomhEwx6KNx3i2IrBcERl9RPMBQB3k6xt8Rzrp4O6gfKzGBKFQb3zbWhfyjYI
         9+5yeOQtJIs/5ru5cCEnJsj85rHOLEQybj/u6dFW0b+V/xQootNXE9nyol6ipyPwxwVW
         UYVt6V7ng4s9hXVpHDTlnXoRjS1W/Vknf15CRA6ASULnRTR9uwI/C6Cnp++/+rgh8MSD
         VugscHbYOm3XZEPK15ecS8LCRq8+cJc8nf7pw4jdUgEG2v2KNUXoSgWFa+/RkSGqAMq8
         LCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si9597978edd.390.2019.07.02.04.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 04:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiGdn-00074d-JP
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 07:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52893)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hiGVl-00028b-Ii
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hiGVk-0001AW-Gg
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 06:59:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1hiGVi-0000qk-2N; Tue, 02 Jul 2019 06:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CFA683092663;
 Tue,  2 Jul 2019 10:59:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56FA51972C;
 Tue,  2 Jul 2019 10:59:27 +0000 (UTC)
Date: Tue, 2 Jul 2019 12:59:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190702125922.7e19d736@redhat.com>
In-Reply-To: <20190701190819.25388-1-eric.auger@redhat.com>
References: <20190701190819.25388-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 02 Jul 2019 10:59:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] tests: Update DSDT ACPI table for arm/virt
 board with PCDIMM related changes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dW3vw9H9xZif

On Mon,  1 Jul 2019 21:08:19 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> PCDIMM hotplug addition updated the DSDT. Update the reference table.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
checked ASL after applying it.
Modulo minor issue with generated ASL (reference to non existing method when running without memory hotplug enabled) which lax linux AML interpreter happily ignores if method is not actually accessed.
(could be fixed later on top of Shameer's series as trivial bugfix)

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fdf7ffa442afec3c5c28 100644
> GIT binary patch
> delta 172
> zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=eSSi^^mWRZt~=a(Tfjuig$N)iRXy-
> z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
> zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
> Ni>WOjJjjWw0RY`tDw+TQ  
> 
> delta 134
> zcmdlxfpN_QMlP3Nmk=Ef1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
> zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=c$sh-0Ff)LR
> Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q
> 

