Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9728450lff;
        Fri, 17 Jan 2020 04:19:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkrwp0sjZauWFJIUgFdouh9jgf1liAbq1C9PcLanxkGQoMe+xI+bCORFrKAnRYlDYKEdRr
X-Received: by 2002:a05:6808:8cd:: with SMTP id k13mr3213186oij.4.1579263586649;
        Fri, 17 Jan 2020 04:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579263586; cv=none;
        d=google.com; s=arc-20160816;
        b=n4xVQcZSDEZsDYyPeO98n9Yj+P32phGGfVt/uxDgdOs9LLtJ37LnOpKHPqsssrBQi4
         2inObd5wTaQnIO+0ZSLwL3saan1wD3RC81gE5MbSxbJJBGAc56+dT6S6/BfBC91++vqt
         I1sT/8+oVIT5G/Ds/+4xmY5FDOtuBDWR6553Ne37gLFLaqdB65+qyx0qrfMPy/fFYeyt
         tJabxNqf3TwYIw9k3gqRULR00XwYFVvByyBwdCzDTRo6u1nEk0xfJlL8MYdJ9MCcGwrA
         d7Ds53UiSngHDR3ifF6f0ltNr2l57zNhWOtmBP2KgRFTEIF8WzRkHEd8M62G3CoKFKt0
         Y5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=pzvhp7Z+zyG59Ba3kmGkNgEyTIsCpnrdorbo2lBj3aU=;
        b=PUxIlOk0tddK7h5lokc+ec4Bz5ELDFGftJgXfkLQqUQ2iKQ9Cnp2Ncbxm8zO7bOZvo
         QfFNJ9spNBmxNWGBjbsVjbttzP5gLu7kugGSpExa69FgMsaUJnUcY66GYV/8OPtt8Jjj
         gsk726oBI4sawbMTWkGFeYGreiRbFpDGiLhDcyegUvA9QYxwxadaxYvpc9Vcr+aluAD3
         2gnnAWgmEEmy7YbQOHmpDivLIEGq3f1WytAR6SfECKDYYmxAweA+2hOmCcNJO77c6ScB
         MnhMUp4308YKwRlaxxQuut6vfGWVsujLTsTeqyNGq+5cZhk+Gt2wC9X995mIUFlgtPfW
         jUiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X25HwFsN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h5si12076789otn.280.2020.01.17.04.19.46;
        Fri, 17 Jan 2020 04:19:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X25HwFsN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgAQMTp (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 17 Jan 2020 07:19:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51532 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726951AbgAQMTm (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 17 Jan 2020 07:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579263581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pzvhp7Z+zyG59Ba3kmGkNgEyTIsCpnrdorbo2lBj3aU=;
        b=X25HwFsNVs6n/0x28GzFZVki8WoxYODuphdJY7vI7wuzW7zggMweUWQeSM/vfLbHNcAMw/
        sPMYklgJBp2yR5SmFIzoEz3V5iOhEy9g3IwGFZ7ou1RjJJKyr0blbmLilZfLCaxJnUG1fa
        9qSYoXg+Zqno2XcVUJ56tOTMhLHosEk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-RrjvU7JJN-mopPzVmRhhuA-1; Fri, 17 Jan 2020 07:19:39 -0500
X-MC-Unique: RrjvU7JJN-mopPzVmRhhuA-1
Received: by mail-qt1-f198.google.com with SMTP id x8so15782114qtq.14
        for <kvm@vger.kernel.org>; Fri, 17 Jan 2020 04:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pzvhp7Z+zyG59Ba3kmGkNgEyTIsCpnrdorbo2lBj3aU=;
        b=Ik1bWE/injCbYmPzTeDJYD73yf4w38NmmjINbhA3MP0voxVvptz+cAzsdExWaQAr4Q
         Pih7kBNzwqzVGfKfuRr6aTG1VozYXWFfv1CJt5XFMLejAfPJDyOrxqqyvkSa+SP8V2QD
         nQu4aLrp9OilhQxuRRPGoFrp6nns1Epe3CJXfAvE7lmo6FJbGKBUxrEeJZBFcJN0K0c4
         A2FQ2EvqbVvGsOOrK5nXYd7f2O1H+zlN7wpzZmDOLAuyMIsmt9K5Mxfcr1vm3HF5qian
         6882h51OMwLlN8rHIU8mts60OJ1IUjHJO+MEVGNOxno4qnbVNu7JEME0mXNCemvjTxVG
         IRug==
X-Gm-Message-State: APjAAAVTgu0UqYpNP8MNNx1EojCZNF4Zj4Yry5vFyt9in+RZJIi1oCli
        Wr+MWO9C9oObEB+tW9Th9KFgkC8Ze8cDO0WnQ3y68RHc4DwTnRKMfotQ8HG1T0gorjK67wSBMPt
        KIE1I5KanJu+G
X-Received: by 2002:ad4:4912:: with SMTP id bh18mr7562350qvb.50.1579263579522;
        Fri, 17 Jan 2020 04:19:39 -0800 (PST)
X-Received: by 2002:ad4:4912:: with SMTP id bh18mr7562319qvb.50.1579263579257;
        Fri, 17 Jan 2020 04:19:39 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
        by smtp.gmail.com with ESMTPSA id g16sm11686127qkk.61.2020.01.17.04.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 04:19:38 -0800 (PST)
Date:   Fri, 17 Jan 2020 07:19:31 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
        Dongjiu Geng <gengdongjiu@huawei.com>,
        Fam Zheng <fam@euphon.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        "xuwei (O)" <xuwei5@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
Message-ID: <20200117071928-mutt-send-email-mst@kernel.org>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-mLgD8rQ211ep44nd8oxTKSnxc7YmY+nPtADpKZk5asA@mail.gmail.com>
 <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
 <CAFEAcA_QO1t10EJySQ5tbOHNuXgzQnJrN28n7fmZt_7aP=hvzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_QO1t10EJySQ5tbOHNuXgzQnJrN28n7fmZt_7aP=hvzA@mail.gmail.com>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: IopiQldYBKAk

On Fri, Jan 17, 2020 at 11:09:07AM +0000, Peter Maydell wrote:
> On Fri, 17 Jan 2020 at 07:22, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > Hi Peter,
> >
> > On 1/16/20 5:46 PM, Peter Maydell wrote:
> > > On Wed, 8 Jan 2020 at 11:32, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> > >>
> > >> I and Xiang are willing to review the APEI-related patches and
> > >> volunteer as the reviewers for the HEST/GHES part.
> > >>
> > >> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> > >> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> > >> ---
> > >>   MAINTAINERS | 9 +++++++++
> > >>   1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/MAINTAINERS b/MAINTAINERS
> > >> index 387879a..5af70a5 100644
> > >> --- a/MAINTAINERS
> > >> +++ b/MAINTAINERS
> > >> @@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
> > >>   F: tests/acpi-utils.[hc]
> > >>   F: tests/data/acpi/
> > >>
> > >> +ACPI/HEST/GHES
> > >> +R: Dongjiu Geng <gengdongjiu@huawei.com>
> > >> +R: Xiang Zheng <zhengxiang9@huawei.com>
> > >> +L: qemu-arm@nongnu.org
> > >> +S: Maintained
> > >> +F: hw/acpi/ghes.c
> > >> +F: include/hw/acpi/ghes.h
> > >> +F: docs/specs/acpi_hest_ghes.rst
> > >> +
> > >>   ppc4xx
> > >>   M: David Gibson <david@gibson.dropbear.id.au>
> > >>   L: qemu-ppc@nongnu.org
> > >> --
> > >
> > > Michael, Igor: since this new MAINTAINERS section is
> > > moving files out of the 'ACPI/SMBIOS' section that you're
> > > currently responsible for, do you want to provide an
> > > acked-by: that you think this division of files makes sense?
> >
> > The files are not 'moved out', Michael and Igor are still the
> > maintainers of the supported ACPI/SMBIOS subsystem:
> 
> Does get_maintainer.pl print the answers for all matching
> sections, rather than just the most specific, then?
> 
> In any case, I'd still like an acked-by from them.
> 
> thanks
> -- PMM

Acked-by: Michael S. Tsirkin <mst@redhat.com>
