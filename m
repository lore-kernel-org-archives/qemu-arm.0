Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1642992lfg;
        Tue, 25 Feb 2020 04:51:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzmjXwIe1CKctNet4+rxAwB4pmYjTPoU6Ke0bvoNUejpp1v00DoK/pV0F8wEdKBNRYSOb5
X-Received: by 2002:a05:6808:350:: with SMTP id j16mr3273879oie.168.1582635086938;
        Tue, 25 Feb 2020 04:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582635086; cv=none;
        d=google.com; s=arc-20160816;
        b=x38AwSYx2Xn0sdTkSoZI+jwI2Wmw54jigGMbnz+ZNTDtjviZBS/Eiv9kgj81yR2CYz
         VXkqy2DV6R6jqM1/N8lSX23M8DzakgEFzIgYscH89H3BRV/28V7/a4CnKtUCmj/KUEQu
         rJWhefUBLtvqlm7WVdNn7BjT982+4d0tzb7RIqNR2YU3CAgpgPtmOoLK5KlfYNKyq9Gb
         avvcG6u9VwvuWJOEtItnRqUVdT3biHZY+T2/YWfX9EoPZIzYel+hLZy/82pnONxypDiJ
         OKBxp866XBmHwK9RiCBS3Cfg5vEhMvjgUvCqzRylAZFIh9F1cCUiJxTuzCJ33p2IndWH
         xQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:content-transfer-encoding
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=eqzC0H9sS8FfyF7GdtmtkF2TmVzcWuD3eC5qrWxeJ4I=;
        b=iCA4a2Aj3by0a7PzO+6LHpgWdD/7oG+K51tAAsF3/7E5CxUzZtbfkH8rKJ4/zlJ7TQ
         Xu48vD1hnRmbHwGja6vo5EeG5GQfgj39fZBqNQtJ1ifENHakXrwNGBrmbqjF6xNt2ARG
         mMoGBJ8E5zrPAoIMbjUF6E8De5NhwpZ/v/+PLvMcf+5m4EksGhm5LEZcQJ1AWClmGP2E
         RHF4S86va646sdp8rBUg25qb+sUYVo4KthAIebWWLX5lbIBg1WUuzO23aQbF6wAM4/g6
         6C6XSBqyqQO4T+f+X4tUQPEpJkwvMOotsTfJXLbhStkdXg5VPUh9ZzmuaT9CtjlH1gnn
         zEaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z26si8141815oti.215.2020.02.25.04.51.26;
        Tue, 25 Feb 2020 04:51:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgBYMv0 convert rfc822-to-8bit (ORCPT
        <rfc822;naresh.kamboju@linaro.org> + 5 others);
        Tue, 25 Feb 2020 07:51:26 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2461 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729525AbgBYMvZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Feb 2020 07:51:25 -0500
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id 6BD4368E743091D9D629;
        Tue, 25 Feb 2020 12:51:22 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 25 Feb 2020 12:51:21 +0000
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1713.5; Tue, 25 Feb 2020 12:51:20 +0000
Received: from dggeme755-chm.china.huawei.com ([10.7.64.71]) by
 dggeme755-chm.china.huawei.com ([10.7.64.71]) with mapi id 15.01.1713.004;
 Tue, 25 Feb 2020 20:51:18 +0800
From:   gengdongjiu <gengdongjiu@huawei.com>
To:     Igor Mammedov <imammedo@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        "Fam Zheng" <fam@euphon.net>, Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>
Subject: Re: [PATCH v24 02/10] hw/arm/virt: Introduce a RAS machine option
Thread-Topic: [PATCH v24 02/10] hw/arm/virt: Introduce a RAS machine option
Thread-Index: AdXr2h074nYmm7QuZEuiffKA50KyvQ==
Date:   Tue, 25 Feb 2020 12:51:18 +0000
Message-ID: <e1177221d01442c29b03f551a625a7d2@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.185.193]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /EbD/w0yOtpy

> 
> On Tue, 25 Feb 2020 08:54:07 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Tue, 25 Feb 2020 at 08:34, Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Mon, 17 Feb 2020 21:12:40 +0800
> > > Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> > >
> > > > RAS Virtualization feature is not supported now, so add a RAS
> > > > machine
> > >
> > > > option and disable it by default.
> > >              ^^^^
> > >
> > > this doesn't match the patch.
> >
> > Hmm? It seems right to me -- the patch adds a machine option and makes
> > it disabled-by-default, doesn't it?
> 
> Right, I misread 'and' as 'to' somehow.
> My apologies

Thanks Peter and Igor's clarification.

> 
> >
> > thanks
> > -- PMM
> >
