Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3787389lff;
        Sun, 8 Dec 2019 18:07:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxO3l3CyKQY4t49TmJ2K35mkoK3W1suzmBPMS76zwU+0eyeDgYd03ugbXVLLBLj7BlJEzub
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr26122455qkn.254.1575857240871;
        Sun, 08 Dec 2019 18:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575857240; cv=none;
        d=google.com; s=arc-20160816;
        b=pgiEfyiuk3xzYSmLGyzZicwYBJhU2+oseOIUcQ71kqMyalxzKpzYK6TCIBU86nVFlL
         CxHLPK0u1Yi8JS6bBZdEPPV5+FLNlDlSzgGLcUD/V1CmXnVEV/WcGR/ZkTYEHq56FLJk
         vdcG4nD/f9c3dVUF7dbrgIDxzH49hQsPFAxCKBarZiVW9/E6CiCDGWzVzvAztTuG/7HX
         LnwMhyGrFD79NOijsHyk9KldfFKCnVlT1SknJ90axe6vRpFOsk/96nM8qY+Q+EQrSKv2
         oFMjTN6I0uuDD9iLtOqGTuzy1Wu6UyKgpz/VAXzSePff1jzZW1FFkn6nx5kMtvAXzT6n
         SOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=ncKCKT/EgooByQG4F9opUaVUSwSc64Yi0nha19EdKoM=;
        b=InOaLiAKRjaP9dJxnzVzRExKO6Rn2EbmpAMO/ezg9ZCFNV1fTt4qy15jvrmYd8v5tt
         TxX3EwNwsmVCS/4RxSoQ8L2oJmw5XUGblBpQlLyujf/lVeI5EyHHntXUrl5NdlAHkzQD
         43W6XSoqHuH4ufSznb5iPY6Ua/ZwSRJCZwKWOrsX6b8jnK9AI4Y4fC46OK6Nu7vnHYrS
         CbbzchFxdlXOqFSmrYTbnZ++F53FcVq4sNuRQXWB8FU2CbVsGPpYpEj1xLcGTu28WrYQ
         edc0lgO4SLmmwMSq7KGu3gSLrNBZ+/SgpYhJvlbwzYaZJO1z9nKZYUC0Pb9lZjb/p0eP
         1SeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si13336399qkg.56.2019.12.08.18.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 18:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ie8SG-0000G4-C8
	for alex.bennee@linaro.org; Sun, 08 Dec 2019 21:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ie8S4-0000Fs-QH
 for qemu-arm@nongnu.org; Sun, 08 Dec 2019 21:07:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ie8S3-0007ce-Mk
 for qemu-arm@nongnu.org; Sun, 08 Dec 2019 21:07:08 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:55542 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ie8S3-0007NS-9r; Sun, 08 Dec 2019 21:07:07 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EF74DCD4B669C687F342;
 Mon,  9 Dec 2019 10:06:59 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Mon, 9 Dec 2019
 10:06:51 +0800
Subject: Re: [Qemu-devel] [PATCH v5 0/2] arm/acpi: simplify aml code and
 enable SHPC
To: Peter Maydell <peter.maydell@linaro.org>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
 <20190312170859.73f0de9d@redhat.com>
 <ca5ccc80-663f-83e6-d9ce-4d5e3749988d@huawei.com>
 <CAFEAcA_v3bh+1h8+ti_t5Kkp1M9zhEmtsqSQzcHhAobr_+JxMQ@mail.gmail.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <9761915a-3ed1-7d91-60c3-bfdf703d22d5@huawei.com>
Date: Mon, 9 Dec 2019 10:06:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_v3bh+1h8+ti_t5Kkp1M9zhEmtsqSQzcHhAobr_+JxMQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ZfSF+oFCbDi


=E5=9C=A8 2019/12/6 21:50, Peter Maydell =E5=86=99=E9=81=93:
> On Sat, 30 Nov 2019 at 03:47, Guoheyi <guoheyi@huawei.com> wrote:
>> Hi Peter, Igor,
>>
>> I couldn't find these 2 patches in the latest tree. Could you help to
>> merge them?
> In future I recommend pinging unapplied patches with a shorter
> delay than nine months :-)

Tha's really a long time...


> In QEMU's process, unless somebody
> has specifically said they've picked up the patch, it still
> "belongs" to the submitter to chase if it hasn't been
> applied. In this case I simply didn't see Igor's request
> that I take it -- the chances of me actually reading any
> particular list email even if it's cc'd to me are not good.

One of the reasons that I didn't check it earlier is that we don't=20
really use PCI SHPC in our production version, for Linux ITS driver can=20
only allocate a fixed range of MSI interrupts for a PCI-bridge during=20
initialization, so a later plugged-in PCI device may not be able to get=20
enough MSI interrupts and then fall back to legacy INTx. However, I=20
think it is still better to let guest OS make the decision.

>
> I tried applying them to target-arm.next but unfortunately
> they break 'make check':
>
>    TEST    check-qtest-aarch64: tests/bios-tables-test
> acpi-test: Warning! DSDT binary file mismatch. Actual
> [aml:/tmp/aml-4IELC0], Expected [aml:tests/data/acpi/virt/DSDT].
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-AOELC0.dsl,
> aml:/tmp/aml-4IELC0], Expected [asl:/tmp/asl-XL7KC0.dsl,
> aml:tests/data/acpi/virt/DSDT].
> **
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-tes=
t.c:477:test_acpi_asl:
> assertion failed: (all_tables_match)
> ERROR - Bail out!
> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-tes=
t.c:477:test_acpi_asl:
> assertion failed: (all_tables_match)
> Aborted (core dumped)
> /home/petmay01/linaro/qemu-from-laptop/qemu/tests/Makefile.include:918:
> recipe for target 'check-qtest-aarch64' failed
>
> Could you fix and resubmit, please?

Sure.


Thanks,

Heyi

>
> thanks
> -- PMM
>
> .

