Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp6881105wrr;
        Fri, 15 Nov 2019 06:32:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWXbpZQh7ski4sFjxvM+JgdNvxx+hKi6oeGbRjR3592C9+95ixWutFR35kWcKfND4wi3uy
X-Received: by 2002:a2e:22c4:: with SMTP id i187mr11937032lji.86.1573828377482;
        Fri, 15 Nov 2019 06:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573828377; cv=none;
        d=google.com; s=arc-20160816;
        b=OxFV7fxl20RYXu/mkshyCX0uE2joFfaBCrArX7Av4JS0k1PPCMQoN5KRioL+vykTyn
         9IWtc/CKOhe2HnPiOQHQiJCYchoqg2IvR5KcCKACKfbaDW/9E2/WFH7pDMTBSXTJHMpf
         a5wb2rFng9Mggra3gB/RpbP8JpXCdustO/1hbFVTK1nKnw4CL98+amzBsg88KagnE9me
         Vf0IiF0WSCl5BQIXJbnMeLOaaLWKR+cvvaioqJcYSX5CSAVGlF+FWcuHhC4wqhDzDbJh
         5yVMFF2o1EzfH6VknPgDV8QPaUfAe405zhv1cfspO2EdRaYZe4HgOtTfMFBCW4QDAAnT
         l3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=WleBtui7EMuJHqQMrk78FszDnqlT+ZVVQCjXi3zJU+s=;
        b=fO9pFSEKukn+u58n5DgxlSxAH+mj4QyOK6fNyJW9NFUZgarm//l43sr53IlQXmVD0m
         O1Z0WVY90U6Essq6VlHNYfqt7W0KwvZF+IALT1nERhLMUkxi6KtDaXyRFzNwcOuOo0kT
         E2sjUe/NZeM5p9NKfp+Ih/fAlnBJlniI0yw9DWbRzm9CtUMFvJtB+zFBNMGJnrbKNW1x
         dNyqI3KCRQ7ggeehY9KyYEmfIYtFxUvASPPcVZpseD2VhaQ9ItHuytxE1vaAE2tZ3iJx
         XFEhz0KiOX6RxwivyiBdp8Z50z/8B6taLT0ybrYImYEf4UcgDpKPezzgsivivHkqztct
         P3eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b28si7048152edn.230.2019.11.15.06.32.57;
        Fri, 15 Nov 2019 06:32:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfKOOcy convert rfc822-to-8bit (ORCPT
        <rfc822;daniel.diaz@linaro.org> + 4 others);
        Fri, 15 Nov 2019 09:32:54 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2103 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727427AbfKOOcx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 15 Nov 2019 09:32:53 -0500
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id EC45E68D6C269495430B;
        Fri, 15 Nov 2019 14:32:51 +0000 (GMT)
Received: from lhreml712-chm.china.huawei.com (10.201.108.63) by
 lhreml705-cah.china.huawei.com (10.201.108.46) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 15 Nov 2019 14:32:51 +0000
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 lhreml712-chm.china.huawei.com (10.201.108.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1713.5; Fri, 15 Nov 2019 14:32:50 +0000
Received: from dggeme755-chm.china.huawei.com ([10.7.64.71]) by
 dggeme755-chm.china.huawei.com ([10.7.64.71]) with mapi id 15.01.1713.004;
 Fri, 15 Nov 2019 22:32:47 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Igor Mammedov <imammedo@redhat.com>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>
CC:     "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "mst@redhat.com" <mst@redhat.com>,
        "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
        "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
        "lersek@redhat.com" <lersek@redhat.com>,
        "james.morse@arm.com" <james.morse@arm.com>,
        "mtosatti@redhat.com" <mtosatti@redhat.com>,
        "rth@twiddle.net" <rth@twiddle.net>,
        "ehabkost@redhat.com" <ehabkost@redhat.com>,
        "Jonathan Cameron" <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
        Linuxarm <linuxarm@huawei.com>,
        "Wanghaibin (D)" <wanghaibin.wang@huawei.com>
Subject: Re: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
Thread-Topic: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
Thread-Index: AdWbwWSZ/1gyxkpeREeYn2g+7NgH+g==
Date:   Fri, 15 Nov 2019 14:32:47 +0000
Message-ID: <19b1b4b9ceb24aad9f34ab4e58bccab3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.148.208.87]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qKCXNOVjBUEv

> > + */
> > +static void acpi_ghes_build_notify(GArray *table, const uint8_t type)
> 
> typically format should be build_WHAT(), so
>  build_ghes_hw_error_notification()
> 
> And I'd move this out into its own patch.
> this applies to other trivial in-depended sub-tables, that take all data needed to construct them from supplied arguments.

I very used your suggested method in previous series[1], but other maintainer suggested to move this function to this file, because he think only GHES used it

[1]:
https://patchwork.ozlabs.org/cover/1099428/

> 
> > +{
> > +        /* Type */
> > +        build_append_int_noprefix(table, type, 1);
> > +        /*
> > +         * Length:
> > +         * Total length of the structure in bytes
> > +         */
> > +        build_append_int_noprefix(table, 28, 1);
> > +        /* Configuration Write Enable */
> > +        build_append_int_noprefix(table, 0, 2);
> > +        /* Poll Interval */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Vector */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Switch To Polling Threshold Value */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Switch To Polling Threshold Window */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Error Threshold Value */
> > +        build_append_int_noprefix(table, 0, 4);
> > +        /* Error Threshold Window */
> > +        build_append_int_noprefix(table, 0, 4); }
> > +
> 
> /*
>   Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fwcfg blobs.
>   See docs/specs/acpi_hest_ghes.rst for blobs format */
> > +void acpi_ghes_build_error_table(GArray *hardware_errors, BIOSLinker
> > +*linker)
> build_ghes_error_table()
> 
> also I'd move this function into its own patch along with other related code that initializes and wires it into virt board.

I ever use your suggested method[1], but other maintainer, it seems Michael, suggested to move these functions to this file that used it, because he think only GHES used it.

[1]:
https://patchwork.ozlabs.org/patch/1099424/
https://patchwork.ozlabs.org/patch/1099425/
https://patchwork.ozlabs.org/patch/1099430/

