Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5368173wrp;
        Tue, 17 Sep 2019 08:11:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAIsJtIfVxBK9QDhDwQhgixmO7XNnpiHDwLb24xlGfrixqNNGtb4EIqLQIRdS6gVSKfXUZ
X-Received: by 2002:a05:6214:12f1:: with SMTP id w17mr3369233qvv.108.1568733112043;
        Tue, 17 Sep 2019 08:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568733112; cv=none;
        d=google.com; s=arc-20160816;
        b=jgw4i3iSLVqwGTfLVOLwojdAruqyaG2PnlJCxuI5EmuXKPFNFt7JhYXTWmXBFDzCTC
         DRkhhdOi0Lg+fVyQJkyWXKRCXYNifHb/64Agj7SWBZM7wfTb1VPY9rafeYGvq+3bxmUm
         ogX5XHWODb01zKyOi77ALY2O+3SvauweSnsQMxWte22c7TiGj3oUjOKduwAIRkaTeNLw
         y0TL3gaqCFKomc2gbR3prkLZDNZKVXx1jMKeT3mdMQDSnNiQw95plhsOZCUVKDlvcCYt
         BZZydlGGNBcvKvefYwY3cPTwBzcMXGWGU6eAiRajjMpBmzhoBP269Iz0YqGOps5ryxWj
         nrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=IG7CfctVDXfGwR9kbPlgS5F237tLtpXXVxR0qikO/9A=;
        b=vSgkvmq7ML015DuFELqgmHtCd/EpFHcVlSlpkxivqoaYJuvxinLub9nuyE960M8uJZ
         Xuwx8uwFKtA242Q08fCpjCeTpTX3pXr9tz3xHc9jcJiPvdTBYQogJUZLNZUHfvXpTDrB
         vR17f9Ax0IU0fLDHJLaGfd7DhrgkPikEN2Dir9DvTuiPMeluqlAbGMx5ucU8rKrBp2mM
         6W731XFxLpuDv1SkdJ6/3ru7BlXCVvNlsnU/sHDtTX1u7xnBACm/iTKEJp0wiRD+Gt5m
         MKKpu2pck0FduXOqeLjx72UNORkXFVw24rCPw/9Mv606v9OAJY9rO+ZEB3vNr8rb0ANp
         yURg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a66si1694108qkd.192.2019.09.17.08.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 08:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAF8x-0003Aa-CW
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 11:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iAF8c-00033b-6V
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:11:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iAF8a-0000Yk-Us
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:11:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iAF8a-0000YG-Mg
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:11:28 -0400
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E73963D94D
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 15:11:27 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id k68so4539059qkb.19
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 08:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IG7CfctVDXfGwR9kbPlgS5F237tLtpXXVxR0qikO/9A=;
 b=WeLObZ+V4DcpijwAr8hzO1iDEoqR8KlIaZftMLwXlPoj82pQF6JN3oxyNyjJCg7kkE
 BoluIjeYkD2Ak1spoQLTJGArLMl6gLrD6hVGMDmk20PwCa0BNE5IULaPz2P8RVS9PvLQ
 cm0zyHVHf2oaOcG/ImObxysf12F1XuCxz8/hcBh6MbPZGVIlcnKNIWH/FkDY6FfonjFr
 3DAhfTvZqdx0tZ9h0e6byO5CqrAP4al4ox46WpcSRzaPHukivLZ9fEnSVsijEhvkp4eR
 FD5z7cZhTWIABbm2N/k5YH3z9ocGuyFW2gkACOJZXcss934INRP2YsJpwhVfJFIMDvVZ
 UYSg==
X-Gm-Message-State: APjAAAXfvc7AjdSZ0gUsMUbm4eddGMZtsDmmREF1lo/It4OtMr3BYzAk
 oq8hrMMAKsu6Af+lf5r8uaw6PARYEAgmHpJlFkMJTBv7pHum02Rb0kgz1eushoWjU30Yh/eQenE
 KSM9TFJMpH/Vx
X-Received: by 2002:aed:2902:: with SMTP id s2mr2825640qtd.205.1568733087288; 
 Tue, 17 Sep 2019 08:11:27 -0700 (PDT)
X-Received: by 2002:aed:2902:: with SMTP id s2mr2825621qtd.205.1568733087111; 
 Tue, 17 Sep 2019 08:11:27 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id j7sm1561893qtc.73.2019.09.17.08.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 08:11:26 -0700 (PDT)
Date: Tue, 17 Sep 2019 11:11:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190917111100-mutt-send-email-mst@kernel.org>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
 <20190911155015.3627b072@redhat.com>
 <20190911095332-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911095332-mutt-send-email-mst@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v10 10/11] tests: add
 dummy ACPI tables for arm/virt board
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Eric Auger <eric.auger@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GhRJpbs7Vyck

On Wed, Sep 11, 2019 at 09:55:34AM -0400, Michael S. Tsirkin wrote:
> On Wed, Sep 11, 2019 at 03:50:15PM +0200, Igor Mammedov wrote:
> > On Wed, 11 Sep 2019 13:57:06 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> > 
> > > On Wed, 4 Sep 2019 at 09:58, Shameer Kolothum
> > > <shameerali.kolothum.thodi@huawei.com> wrote:
> > > >
> > > > This patch is in preparation for adding numamem and memhp tests
> > > > to arm/virt board so that 'make check' is happy. This may not
> > > > be required once the scripts are run and new tables are
> > > > generated with ".numamem" and ".memhp" extensions.
> > > >
> > > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > > ---
> > > > I am not sure this is the right way to do this. But without this, when
> > > > the numamem and memhp tests are added, you will get,
> > > >
> > > > Looking for expected file 'tests/data/acpi/virt/SRAT.numamem'
> > > > Looking for expected file 'tests/data/acpi/virt/SRAT'
> > > > **
> > > > ERROR:tests/bios-tables-test.c:327:load_expected_aml: assertion failed: (exp_sdt.aml_file)
> > > >
> > > > ---
> > > >  tests/data/acpi/virt/SLIT | Bin 0 -> 48 bytes
> > > >  tests/data/acpi/virt/SRAT | Bin 0 -> 224 bytes
> > > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > > >  create mode 100644 tests/data/acpi/virt/SLIT
> > > >  create mode 100644 tests/data/acpi/virt/SRAT  
> > > 
> > > Do the tests pass with this patch and without the
> > > patch that adds the tests? (That is, can we keep the
> > > two patches separate without breaking bisection, or
> > > do we need to squash them together?)
> > > 
> > > I'll leave it to somebody who understands the ACPI
> > > tests stuff to answer whether there's a better way to
> > I'd squash this patch into 11/11 test case,
> 
> 
> Pls don't - the way to add this is to add the files in question to
> tests/bios-tables-test-allowed-diff.h.
> 
> Maintainer will create a separate commit updating
> the binaries and removing them from the whitelist.
> 
> This way things like rebase work seemlessly.


OK?

Can you post v11 like this? I'll ack then.

> 
> > CCing Michael (since he's the one who applies ACPI patches)
> > 
> > > do this.
> > > 
> > > thanks
> > > -- PMM
> > > 
