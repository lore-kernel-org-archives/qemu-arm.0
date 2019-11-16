Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp76469wrr;
        Fri, 15 Nov 2019 16:59:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgGeaVwS0zQlEHP2+3y34dxubQDqp+CLDK+tp2dxTPwFVarhBBIFRMRLgurcxv7l5URnRC
X-Received: by 2002:a17:906:3450:: with SMTP id d16mr5313130ejb.216.1573865950823;
        Fri, 15 Nov 2019 16:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573865950; cv=none;
        d=google.com; s=arc-20160816;
        b=HSeS/hh4W5NGjKQ+qnzAfmryjqsGm2Yeh0o2Pt4MiY6pvOfZVsTTh2h0QvYzX1+b3T
         YPcIZRnC10dKVyb0/SUrBCbSSJVKLQu78fDRE1YjJzJfRnuQjUIE4iw7t+g1qD80LMge
         Qns+MxUIHm8TIrge9Fz7B9xCAedj1Ng7deCMszWj5L9W4l12nkKk/ExMvKtWWGQsTs9Q
         817JDsFh3uyOnQgrbjRbs3Q0w+njKLYIWeZuL4QR7t1t12CeKI3UTARDaaJiH/cVtHEp
         nQODxNImGx3T3lEXryfHnLKusgu3IGM3JGuyL8IR9nBmvwdR9ac2lHprz/u2aQCPPRvH
         lMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=4zI5bDBWf4ic551LyAUhbro9Zab3d6ITwzWyoOtF9D8=;
        b=X64RB0gwG0jyvKxp/k3phJqoJ196WAQ5jGSF3RHTiq4NYCuGWATMx9s1mn6fk0o2j1
         9lPfKLjoXP/418STkS3JUEvborSdKEU731Zeiu96EYCTYKyP10kcAi2nywzKBkNJRDC5
         l3B+zW7SqxckLhGGygCoNkFLgO8IaPgG8ybTirCOH2bJPbJAb1PwDVKALU3OIcuGPiSJ
         iyFpa/I9tJuTPq76XUf2Orl8D10meGgf9xpjmgD8brUgg6Eo+c1H2rbw+PhegMfyv83J
         SrHdzW2Yyrp/Mb1MMX9xCB3vy+6z9qPk7+dGQTRb+pynKotqqqxiKmyrDZZFnodj5eG8
         PSog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k20si6781957ejj.21.2019.11.15.16.59.10;
        Fri, 15 Nov 2019 16:59:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfKPA7E convert rfc822-to-8bit (ORCPT
        <rfc822;daniel.diaz@linaro.org> + 4 others);
        Fri, 15 Nov 2019 19:59:04 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2104 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727128AbfKPA7E (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 15 Nov 2019 19:59:04 -0500
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 2BCFE9E064E08B3D09D5;
        Sat, 16 Nov 2019 00:59:02 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml708-cah.china.huawei.com (10.201.108.49) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sat, 16 Nov 2019 00:59:01 +0000
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1713.5; Sat, 16 Nov 2019 00:59:00 +0000
Received: from dggeme755-chm.china.huawei.com ([10.7.64.71]) by
 dggeme755-chm.china.huawei.com ([10.7.64.71]) with mapi id 15.01.1713.004;
 Sat, 16 Nov 2019 08:58:58 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Igor Mammedov <imammedo@redhat.com>
CC:     "zhengxiang (A)" <zhengxiang9@huawei.com>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
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
Thread-Index: AdWbyMkE/1gyxkpeREeYn2g+7NgH+g==
Date:   Sat, 16 Nov 2019 00:58:58 +0000
Message-ID: <99a06454b0fa4eac9116af9ec978aaea@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.148.208.123]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WH9Fa3nzRR/j

> On Fri, 15 Nov 2019 14:32:47 +0000
> gengdongjiu <gengdongjiu@huawei.com> wrote:
> 
> > > > + */
> > > > +static void acpi_ghes_build_notify(GArray *table, const uint8_t
> > > > +type)
> > >
> > > typically format should be build_WHAT(), so
> > >  build_ghes_hw_error_notification()
> > >
> > > And I'd move this out into its own patch.
> > > this applies to other trivial in-depended sub-tables, that take all data needed to construct them from supplied arguments.
> >
> > I very used your suggested method in previous series[1], but other
> > maintainer suggested to move this function to this file, because he
> > think only GHES used it
> 
> Using this file is ok, what I've meant for you to split function from this patch into a separate smaller patch.
> 
> With the way code split now I have to review 2 big complex patches at the same which makes reviewing hard and I have a hard time
> convincing myself that code it correct.
> 
> Moving small self-contained chunks of code in to separate smaller patches makes review easier.

Ok, got it. Thanks very much for the explanations
