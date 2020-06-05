Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2613315lfc;
        Fri, 5 Jun 2020 09:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHGusbbHQt0YK+CYl7SDg8LI8+7LoHDzgkzgBn8aHKw62cMCE1oWEH5kn9zhVn5H10Bhbu
X-Received: by 2002:a25:7c04:: with SMTP id x4mr17690687ybc.325.1591375156418;
        Fri, 05 Jun 2020 09:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591375156; cv=none;
        d=google.com; s=arc-20160816;
        b=UaCjOPurhF+m531IfiV7Ytuy/gdLQ5G8xAoNEWDNjTWpm1Xq4/RXUkw6CHEqWsYB2r
         nU4IewlGI7ek3yevrqmK0rzmUMOZLgQKVQkkymoD+3x1B2NxzZpq67Zp3/GRn//8zbOr
         N2ovyyupqEfAOzNfHYXXIm94HkMrSnl+RM8T1B+11OA1yM+dw3KMtHKZ5b2gESvZLSh4
         jVGGv+TIhKIJ8XE5gJK6xvxIFjyU4BPWBxbLXk5NfdtRXzNoGiDy8raxugSs2nvM5dhk
         ZRyFxSE33F7iqE8Zvqha4Jqt1D0AMbMLJ0u8BbMYz0qXxpkpiM/OGCZtMuutqgIrOYz1
         NksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=+gt5e/jKnuaiEPlAcdcDg4BPO4LxvBlmENX/ufsYGM4=;
        b=v8M+xl0IEaJoZ7AquE8MqcTPgQwN4wwgUFu4cXxfxCmxmTBJf/21NZNPbS49d5mkuD
         iUSQX8huigzoPtahpnLLdWif3pyYNN67lodfvcEnw0FIOo2ddpb29C5MMcZni+Uwql3c
         4FkLC8AZpFnoz7RU073bOapNFq8o7tuuV3KKakhtaqvH3QXYuWyUOVRu2UadilYRrnwV
         kcVwo3rJeBNtdMGtyhiZa2ITyosdA0SVeCEdasrXQGvNZbcb4cagRBumDH6RH0sv9sIF
         Omwkhd8MkPDAb9hni+sIgJAE2Q7bEUEetV1umRQ2P2EsmPxm9FU76S7hYT3dE7ON/yff
         LY0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si7005124ybe.237.2020.06.05.09.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 09:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhFND-00030m-No
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 12:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jhFMl-0002S1-8F; Fri, 05 Jun 2020 12:38:48 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2109 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jhFMj-0007ZT-SD; Fri, 05 Jun 2020 12:38:46 -0400
Received: from lhreml708-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id E3EF75D0DFEEB45A0F3C;
 Fri,  5 Jun 2020 17:38:37 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml708-chm.china.huawei.com (10.201.108.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 5 Jun 2020 17:38:37 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Fri, 5 Jun 2020 17:38:37 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: RE: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Topic: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Index: AdY3+/mIYt1+TQdDQmymnxAa7PkUWwBhkdKAAHDt5AAABBY/YA==
Date: Fri, 5 Jun 2020 16:38:37 +0000
Message-ID: <0c91f4bab5d24bb3a1e7ca36d1d57221@huawei.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <20200605173116.55419a1e@redhat.com>
In-Reply-To: <20200605173116.55419a1e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.76.63]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 12:38:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBqAYDUihxSn

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: Friday, June 5, 2020 4:31 PM
> To: Andrew Jones <drjones@redhat.com>
> Cc: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
> qemu-arm@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; mst@redhat=
.com
> Subject: Re: [Question] Regarding PMU initialization within the QEMU for =
ARM
> VCPUs
>=20
> On Wed, 3 Jun 2020 11:37:45 +0200
> Andrew Jones <drjones@redhat.com> wrote:
>=20
> > On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> > > Hello,
> > > I could see below within function fdt_add_pmu_nodes() part of
> > > hw/arm/virt.c during virt machine initialization time:
> ...
> >
> > > Q4. This function  fdt_* looks to be wrongly named. The info
> > >     being initialized here shall be used even when ACPI is
> > >     being used. Initialization part and FDT info looked
> > >     mixed up here if I am right?
> >
> > Agreed. The function has the wrong name. mach-virt has many functions t=
hat
> > mix the initialization and fdt building together, but those functions a=
re
> > named something like create_foo(). Patches welcome.
> that was where I gave up on cpu hotplug arm/virt the last time.

Were you releasing the ARM objects as well? Or are you referring to some
other problem?

> Ideally we should split out from create_foo() all firmware generation cod=
e
> (fdt) and move it to virt_machine_done time + make sure that it could be
> regenerated at reset time so guest would get updated FDT on reset.

Agreed, just like ACPI part. That would be more cleaner.=20

Thanks
Salil.


