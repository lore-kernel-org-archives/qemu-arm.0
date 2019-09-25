Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp933074wrp;
        Wed, 25 Sep 2019 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5njIn8iBNPH3cIEk2mE4xoqGVd4bS0dxrkihyvwCkS+MyCJai00XOzjv3TU+k2cYpgMHd
X-Received: by 2002:a17:906:3543:: with SMTP id s3mr4626488eja.240.1569424967720;
        Wed, 25 Sep 2019 08:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569424967; cv=none;
        d=google.com; s=arc-20160816;
        b=qFDafJIZ+FrJAz9PGQFBMqT/PrTVqTLS/37L5bACjCuEVA/9cTH92olOH7dLo5Qy1h
         tfagWeEU/XvNd1YsiWAapVz6YEAe3tUT9pX20jPNgH2wntq4exWRN7I62KBynHd9EUEP
         8BF3UwCpSmNSERVR7LsuE1+owtEBsWFQMpSaphxY4E9baaUayxNBLmcnL2Z9/bC7B5Yh
         H3SGSDxLkDUlgCjLAiC6w+2YhDS+trt9IxH3eUV51p/FRC1p5vbTZDVJ5xET/hPM4v02
         L7ci7d2sgJfsZikVeoNBAzJsnQmoWp96ebxzgxMYLZJd9R1xqGPU5ZWAD0pEltNyN+Ye
         ab+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=EOBXYN+RkxpEmroU2MbaQs49/WNoB2p47NQwW8ItuVk=;
        b=PvP+vbLQNtQF3KL+HC71emdr7ZpzX+QbDuO6LICymOHMEvGm/PAM87lNEOVVUL9iQ1
         07QOKZEPVRbMg4tHfZlR00jmMpA8LIYD2JvC3zoO0EJyD0I0Zbij2MNoMh5QsP+gVNyB
         EnOraD3m/LnmD2XDcCVPSH9Iqg57ICsUElJUB3uPb9XE4jiIKgVGcDCd8rAA+2cbeFzb
         lsAuLjTA1VXlO7e6yszQISgwttYD3jNJv/7nGaQg9ZUYhQJAq3EKH+DrbPD+Oo7rsVlr
         9ZGbiIcrXP9P1BdjYY2a4Te7o4HeHLA3jfmo9HR22HCRTmQgsh0NRAxhhaWDgAMhCAOa
         6FCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si2936256ejh.263.2019.09.25.08.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD97t-00045y-RW
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iD8x9-0002PF-TN
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iD8x7-0007b2-Tp
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:11:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iD8x7-0007ao-Bk; Wed, 25 Sep 2019 11:11:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 830A0C059B6F;
 Wed, 25 Sep 2019 15:11:36 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A4961001956;
 Wed, 25 Sep 2019 15:11:28 +0000 (UTC)
Date: Wed, 25 Sep 2019 17:11:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH-for-4.2 v11 10/11] tests: Update ACPI tables list for
 upcoming arm/virt tests
Message-ID: <20190925171126.6cd6b7e5@Igors-MacBook-Pro>
In-Reply-To: <20190918130633.4872-11-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190918130633.4872-11-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 25 Sep 2019 15:11:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XEuF32lDLKC+

On Wed, 18 Sep 2019 14:06:32 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This is in preparation to add numamem and memhp tests to
> arm/virt platform. The bios-tables-test-allowed-diff.h
> is updated with a list of expected ACPI tables that needs to be
> present in tests/data/acpi/virt folder.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v10 --> v11
> 
> As per Michael's suggestion updated bios-tables-test-allowed-diff.h
> instead of adding expected files directly.
> ---
>  tests/bios-tables-test-allowed-diff.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test-allowed-diff.h
> index 7b4adbc822..3776dd2f3d 100644
> --- a/tests/bios-tables-test-allowed-diff.h
> +++ b/tests/bios-tables-test-allowed-diff.h
> @@ -1,2 +1,17 @@
>  /* List of comma-separated changed AML files to ignore */
>  "tests/data/acpi/virt/DSDT",
> +"tests/data/acpi/virt/APIC.memhp",
> +"tests/data/acpi/virt/APIC.numamem",
> +"tests/data/acpi/virt/DSDT.memhp",
> +"tests/data/acpi/virt/DSDT.numamem",
> +"tests/data/acpi/virt/FACP.memhp",
> +"tests/data/acpi/virt/FACP.numamem",
> +"tests/data/acpi/virt/GTDT.memhp",
> +"tests/data/acpi/virt/GTDT.numamem",
> +"tests/data/acpi/virt/MCFG.memhp",
> +"tests/data/acpi/virt/MCFG.numamem",
> +"tests/data/acpi/virt/SLIT.memhp",
> +"tests/data/acpi/virt/SPCR.memhp",
> +"tests/data/acpi/virt/SPCR.numamem",
> +"tests/data/acpi/virt/SRAT.memhp",
> +"tests/data/acpi/virt/SRAT.numamem",

