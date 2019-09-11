Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp826745wrp;
        Wed, 11 Sep 2019 05:57:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuJdGpCBcn+mhoydQIPgUa0enQFf7JMqQZnS+T+P6oT6CLMcWTgsboi/a8q3CWcg47Hrso
X-Received: by 2002:ac8:75c8:: with SMTP id z8mr34755627qtq.172.1568206651180;
        Wed, 11 Sep 2019 05:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568206651; cv=none;
        d=google.com; s=arc-20160816;
        b=DC1wfpR6WIqn63SM7gDFZvxVmEEer2cJzUldvT73mFrsUj5syS1q3dxUhnPajl9Ffa
         p7hnSX/F5Kgpk3ywY7YNnLJcmNNbghm1f8rvp2YT2G/fbFe+wkkElKW9TAnQ5yudPlTI
         sOHS4iVgIrxD0HFqiD1hxNitzbck1XDRyLUOt5Gxqf7hLjkK7wyvAfOiNWb8z6KfwP/g
         qhekPCbFuC5MTweF5o/lyA4oZihcKsfAtqu7jk1PuU9eQ/XqaQncTwuYP/YySro3aHQh
         ZaBeTykvALWBMZebuPasWok4x4MKBzEQHYAcKyPrTEWZq7Ly/9wzkz/g1ZVI2OKc07oI
         GnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOap77KTx0gqzhFspEa0CktrrJq9aiwd3k62uwt4J+4=;
        b=L/19aOkOua4ZHPeuSQPpfIoyVggfSFvW4rJUIOTDW94hWzTXpenPl0bejXTAqgUGkz
         uNLnte6tSVQOfApFrMzYKGj0B3Y8ZaQb9HRZCpdsg17HqQ5lTmY1xp1R6ywqxBFIYczc
         6P0CmL4BTkHEQ4CtTThOQP3pcuLnkz38E9puIHmmGpPBIfLO/5SYL0sHZH/HKF3WrKZt
         MNCUO9RLLyhjRKNfcSjcGSboN2gqQ9moobFo8QW4rnk+1295MzdLsWMsMBw6mSk6Z00T
         nsbI2RBEJWbOONpX4S6KCVVJ5OAcMx26sGey5QYRW8hyxebFxaAAqUkQISurb/eWDanZ
         5TLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OCCba/L0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si15066639qkg.200.2019.09.11.05.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 05:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OCCba/L0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i82Be-0008MF-GO
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 08:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i82BT-0008Lw-Ml
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i82BS-0004IY-Lk
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:57:19 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:40379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i82BS-0004Hl-GA
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:57:18 -0400
Received: by mail-ot1-x32b.google.com with SMTP id y39so22436925ota.7
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SOap77KTx0gqzhFspEa0CktrrJq9aiwd3k62uwt4J+4=;
 b=OCCba/L0ZL24T6dxZd5QSQX476rGVOL472UigXKLg9WVSZGRjTb27oeZTIszE3kdOP
 WSs5WZS5MpHyLuVwvwKA8D8XMw0xsAKBZoCNVBpQip5GtSaF0Q0nWYNw/h0JUwIs1sWh
 3liMa/1K+q80tnMVibP2/ehNTU/+4lGbl6v0IAhxBxLB2X8q3yWz7L22DDI8Kbezvunz
 evX61bMExRHbzXcbRTx7dnNdjbOVTnZHuirvjzhIuUyf6mFXhP3i1fyRPpLsgKK8+lBE
 83jMLX4yzbZPQNVUtmX8igKv1Vj66yMvRYYhPhH2vC/DrXTd5IQewIQNeBUiJIYwhAox
 MaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOap77KTx0gqzhFspEa0CktrrJq9aiwd3k62uwt4J+4=;
 b=tWMPoit9KbAWzrR+24YMwAqrLEsfuowTrKWnoNdrirptzpLcA0cm4dQ7y5jXS6wE7Q
 f8ZLwQgBOAZYh6Doy1us9jsF5rgQgylGV0F6MB9/1zq8EJUi8e+xRbElcZoKl81IrTIX
 f3rrzedQJtb6CNbyjDEKvogX5kb9AS6Zc7umBBcHrf75dPDhLBqauH/O8Rb8FyuzSXyt
 05u1LzRcasAVORutO26g4TG/l7oV8he1rfvwASZyt4qgiLZnO9771/UpcMHhTuKJKdkE
 fKuemg6axg53WWYqH6Uj53CPtkkzAlgLdSguRVIjPJicSN/dz7hfvFVj+j57/Gsohg/0
 Xv1w==
X-Gm-Message-State: APjAAAWMfB1bVoSdztQ/aC8kmjGc7nD8tGDUZzRJt/qzteluG6FO0n8h
 KeMWYzWfPBzobWRgG1oHftzoGRS3kYEUsr/ev/w8Kw==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr31673472oti.91.1568206637672; 
 Wed, 11 Sep 2019 05:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2019 13:57:06 +0100
Message-ID: <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 10/11] tests: add dummy ACPI
 tables for arm/virt board
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Pl81OTtOBbm

On Wed, 4 Sep 2019 at 09:58, Shameer Kolothum
<shameerali.kolothum.thodi@huawei.com> wrote:
>
> This patch is in preparation for adding numamem and memhp tests
> to arm/virt board so that 'make check' is happy. This may not
> be required once the scripts are run and new tables are
> generated with ".numamem" and ".memhp" extensions.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> I am not sure this is the right way to do this. But without this, when
> the numamem and memhp tests are added, you will get,
>
> Looking for expected file 'tests/data/acpi/virt/SRAT.numamem'
> Looking for expected file 'tests/data/acpi/virt/SRAT'
> **
> ERROR:tests/bios-tables-test.c:327:load_expected_aml: assertion failed: (exp_sdt.aml_file)
>
> ---
>  tests/data/acpi/virt/SLIT | Bin 0 -> 48 bytes
>  tests/data/acpi/virt/SRAT | Bin 0 -> 224 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 tests/data/acpi/virt/SLIT
>  create mode 100644 tests/data/acpi/virt/SRAT

Do the tests pass with this patch and without the
patch that adds the tests? (That is, can we keep the
two patches separate without breaking bisection, or
do we need to squash them together?)

I'll leave it to somebody who understands the ACPI
tests stuff to answer whether there's a better way to
do this.

thanks
-- PMM
