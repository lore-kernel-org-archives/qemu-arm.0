Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp895591wrp;
        Wed, 11 Sep 2019 06:55:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrAsa0UpDk1fdYs2+aX9UmnLGzMwZ6K1II+ttQzUO47fl2J+m6BCrx+a+UaU/kHNCthrbN
X-Received: by 2002:a37:6003:: with SMTP id u3mr36254467qkb.166.1568210155423;
        Wed, 11 Sep 2019 06:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568210155; cv=none;
        d=google.com; s=arc-20160816;
        b=JAi/KrMvBnCJz+zme3xSNCpzC4Xh0Lf48kacI0qFCjJJQdKngzo+7bvFPomHlp+qLU
         MiTZbTI/xCdLXKgoSecnj/uK1TW2Yq8WfX2WOaKcDEhuosCBP1GpiUvH9ozMmVXutCj6
         /DhsSArVegvJ19hSUpfwDeYSDM8aLtLPSTO0PYaxBrQlWNkA7DsVAdBa/IYhRO+KmMbm
         2+pfcLP7NldXzaOl9uDRtuXRBlrBUXPtTV9+kJPbvrO2dKf2s1k/d/anL4OrPfwnw8Kl
         RdT6e5d9I+qdSlErQKxXALiq97R6NKsClJnOrvrMyBBMLqu5iV7NElqQ5mTpE27NIcFz
         BbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3Ijcv5EhNvjHAfSR2M7jiVx2VbNGZCjsuNwNZLOSzlw=;
        b=mpjHah31Ur/TGXvY2eNhOgRCzQ/JPTn3A3pGwBy+t4dRmzPHapkdedCn46vMXRN6BU
         CIySVUo80MiKjhuWNOA0wn2FijeszENY8IW1CWXUN9+NzPhA2nWXm1pEGF1owOOn0ZjT
         1RUmri3fJ3oySwi9lzgTGf9nI8ANQ/B6fEdF7GlhM5gD9fHXDMScllaYk3Cu5mVuCupj
         AyIMsYQF71ITclG3IfhAQXWowMwJj/R+qGD+aP3dkLj5fpIQNAWBGnTS6HKi85A3Y3S5
         3I4T5yqCXk5/Mm2tnj6FGaCjHlf90WAtzVsnYlARGrckUmESjO8fO6A+R7YI5JYTJTsJ
         1C3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si13868693qtq.21.2019.09.11.06.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 06:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i836A-0001aP-NR
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 09:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1i8360-0001aC-3p
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1i835y-0004t0-Vu
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:55:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1749)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1i835y-0004sf-OK
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 09:55:42 -0400
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB31A3B738
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 13:55:41 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id c7so19636488qkc.2
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 06:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Ijcv5EhNvjHAfSR2M7jiVx2VbNGZCjsuNwNZLOSzlw=;
 b=r/q4120i789CEDj/4Yq+CPa3h1TeitR//saBpmZbAYUqEIYWKkHE7m4PRuLhNWUi1w
 arZswdm+97JEJfrpif53dhv/E+IGIOGUMI0KAfb4qilL0H53C7h30Rgg3oJPy/Sm7Ywm
 fXHBPBQzWYn3gSLTcuqqMKFwpIXcp+5eiiBZt93k45HN/eMLztY9+xL0/LgN9LkIaLh7
 KvQOKoKeT5uSu7TyybUVHUoqi78k5X5V85ASfxeAguEdPFfGDaos+onO4pZFomNwafUR
 6NSVQ00Az96Cnsj5HrnTzARN/x/QRxVZ1g/OqRMMiMzNvyZrwKhsqlWcfK+YDWLHAyDQ
 1+DA==
X-Gm-Message-State: APjAAAVGtzC1Eno7A1BUda7nQ2B7IBAL9OYeXMcENYt+Jwaakh9CBGU1
 BcaK2Ah7xDm8CqA5Zr/gOEhJpDnpdXHO7OMuIgsHTt2mdt4uqQppxcCBRdtbfoYSkcOJgpe1wLK
 Yo13lY2yTl5wy
X-Received: by 2002:ac8:7246:: with SMTP id l6mr35657876qtp.359.1568210141052; 
 Wed, 11 Sep 2019 06:55:41 -0700 (PDT)
X-Received: by 2002:ac8:7246:: with SMTP id l6mr35657854qtp.359.1568210140880; 
 Wed, 11 Sep 2019 06:55:40 -0700 (PDT)
Received: from redhat.com ([80.74.107.118])
 by smtp.gmail.com with ESMTPSA id u43sm7807044qte.19.2019.09.11.06.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 06:55:40 -0700 (PDT)
Date: Wed, 11 Sep 2019 09:55:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190911095332-mutt-send-email-mst@kernel.org>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
 <20190911155015.3627b072@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911155015.3627b072@redhat.com>
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
X-TUID: cQbns46psXbF

On Wed, Sep 11, 2019 at 03:50:15PM +0200, Igor Mammedov wrote:
> On Wed, 11 Sep 2019 13:57:06 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Wed, 4 Sep 2019 at 09:58, Shameer Kolothum
> > <shameerali.kolothum.thodi@huawei.com> wrote:
> > >
> > > This patch is in preparation for adding numamem and memhp tests
> > > to arm/virt board so that 'make check' is happy. This may not
> > > be required once the scripts are run and new tables are
> > > generated with ".numamem" and ".memhp" extensions.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > > I am not sure this is the right way to do this. But without this, when
> > > the numamem and memhp tests are added, you will get,
> > >
> > > Looking for expected file 'tests/data/acpi/virt/SRAT.numamem'
> > > Looking for expected file 'tests/data/acpi/virt/SRAT'
> > > **
> > > ERROR:tests/bios-tables-test.c:327:load_expected_aml: assertion failed: (exp_sdt.aml_file)
> > >
> > > ---
> > >  tests/data/acpi/virt/SLIT | Bin 0 -> 48 bytes
> > >  tests/data/acpi/virt/SRAT | Bin 0 -> 224 bytes
> > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > >  create mode 100644 tests/data/acpi/virt/SLIT
> > >  create mode 100644 tests/data/acpi/virt/SRAT  
> > 
> > Do the tests pass with this patch and without the
> > patch that adds the tests? (That is, can we keep the
> > two patches separate without breaking bisection, or
> > do we need to squash them together?)
> > 
> > I'll leave it to somebody who understands the ACPI
> > tests stuff to answer whether there's a better way to
> I'd squash this patch into 11/11 test case,


Pls don't - the way to add this is to add the files in question to
tests/bios-tables-test-allowed-diff.h.

Maintainer will create a separate commit updating
the binaries and removing them from the whitelist.

This way things like rebase work seemlessly.


> CCing Michael (since he's the one who applies ACPI patches)
> 
> > do this.
> > 
> > thanks
> > -- PMM
> > 
