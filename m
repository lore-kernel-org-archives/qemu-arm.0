Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6669472lff;
        Wed, 15 Jan 2020 01:26:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdXdV1KxncZdD0U+mY/Rnr0BQezu2C7oUja1QL29M5o6SvKWuXIUG9l91oXiI0Pjv0EscI
X-Received: by 2002:ae9:efc5:: with SMTP id d188mr26329524qkg.178.1579080381926;
        Wed, 15 Jan 2020 01:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579080381; cv=none;
        d=google.com; s=arc-20160816;
        b=b1ib7w6nrh21gsq9RK1NA5qaw0fRqNq8Wnjnf4/AK8XTMiYvliReFIZZD3vmKw1yTy
         0yZAbTXgRXiclrIRLDbd1eTuBB0N9B7ylCe66dbQeYUcJHb778ltwXshk+tdD6bnJmPJ
         ZNGfNanZFgWAMm2X/eVcxhBfvpyy3KqvQ+cnFcZ1EtvG60s8UGeUpu7pehyxnbyHVPII
         fwU/2Bs13HgyF7s1K/xwqpbkWA2mTapkaFMtmH7oCN/vla/ofcUR7s/p2MSJwu+wbM3N
         rRQPO7GrUb4xwlb514MXYixPxcVEUIw7VrOitxKjiMN56c/rHmohUfntSr8afSzYEBzy
         ETsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=rZ61tswPR0e94vSbrrIsJYwcdGYHSuqvkgYiq3Wa9C0=;
        b=GDAmhTy/A3zeHBhxAa2ScgWRZn+v99KGtcFvrEasmpfHl5Po93tt27VrArlrI4zQU3
         viXGFHXs9cHqc1A30NPbPFjhADtmZSIbgOdcSm++cligYehdLIhO76iVAgtw6av8+nAS
         HrVfUNB7RyrlZDr2M5rzBfegQYRIELYPCsat3tHCeNPEx5DOcfmBnoz6tehFQh/AePbf
         UXkJj0ZSti36E+gxplm32dxqw5XUzli5XDs6w92Bg9BJmHajbyHfGgo9yUodApsUyMfu
         2qptSE5XAeJczOD63hFvPsM9Xj4JTWQ0O5GrI/riTSI71Os40TwAG0eEag4aps9J3PXG
         GSbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si9812556qvl.116.2020.01.15.01.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 01:26:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irewP-0006Fw-6T
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 04:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1irewE-00066V-U4
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 04:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1irewA-00038Q-QI
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 04:26:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:39768 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1irewA-00032s-1L; Wed, 15 Jan 2020 04:26:06 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3E092B4B3E2F8B50203F;
 Wed, 15 Jan 2020 17:26:00 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 15 Jan 2020
 17:25:51 +0800
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200105072504-mutt-send-email-mst@kernel.org>
 <CAFEAcA-sduqVO3rrG2V1VsysE2chgd0SnSySvEXFfue-aZN8dg@mail.gmail.com>
 <bbf347fe-c4a4-c5bb-19c2-3a18571b658f@huawei.com>
 <20200115011412-mutt-send-email-mst@kernel.org>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <7732900c-5490-6483-ca10-71c565e81945@huawei.com>
Date: Wed, 15 Jan 2020 17:25:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200115011412-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="gbk"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 Corey Minyard <cminyard@mvista.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ncKTrp7cS9K4


=D4=DA 2020/1/15 14:30, Michael S. Tsirkin =D0=B4=B5=C0:
> Problem is IASL disassembler still doesn't work on all hosts
> we want to support. And its output isn't really stable enough
> to act as a golden master.
>
> Until we have a better tool, I propose the contributor just follows all
> steps 1-6.  The reason they have been listed as maintainer action items
> is really just so that multiple patches affecting same ACPI table
> can be applied, with maintainer resolving conflicts himself.
> But this job can be pushed to contributors if as in the case of ARM
> maintainer isn't really interested in reading ACPI code anyway.
>
> So I propose the following patch - comments?
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-t=
est.c
> index f1ac2d7e96..3a6a3e7257 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -16,7 +16,10 @@
>    * 1. add empty files for new tables, if any, under tests/data/acpi
>    * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
>    * 3. commit the above *before* making changes that affect the tables
> - * Maintainer:
> + *
> + * Contributor or ACPI Maintainer (steps 4-7 need to be redone to reso=
lve conflicts
> + * in binary commit created in step 6):
> + *
>    * After 1-3 above tests will pass but ignore differences with the ex=
pected files.
>    * You will also notice that tests/bios-tables-test-allowed-diff.h li=
sts
>    * a bunch of files. This is your hint that you need to do the below:
> @@ -28,13 +31,17 @@
>    * output. If not - disassemble them yourself in any way you like.
>    * Look at the differences - make sure they make sense and match what=
 the
>    * changes you are merging are supposed to do.
> + * Save the changes, preferably in form of ASL diff for the the commit=
 log in
NIT: 2 "the" before commit log
> + * step 6.
>    *
>    * 5. From build directory, run:
>    *      $(SRC_PATH)/tests/data/acpi/rebuild-expected-aml.sh
> - * 6. Now commit any changes.
> - * 7. Before doing a pull request, make sure tests/bios-tables-test-al=
lowed-diff.h
> - *    is empty - this will ensure following changes to ACPI tables wil=
l
> - *    be noticed.
> + * 6. Now commit any changes to the expected binary, include diff from=
 step 4
> + *    in commit log.
> + * 7. Before sending patches to the list (Contributor)
> + *    or before doing a pull request (Maintainer), make sure
> + *    tests/bios-tables-test-allowed-diff.h is empty - this will ensur=
e
> + *    following changes to ACPI tables will be noticed.
>    */

For contributors doing the full work, does that mean the patchset sent=20
to the list contains the following parts?

1. patch 1: list changed files in tests/bios-tables-test-allowed-diff.h.

2. patches 2-n: real changes, may contain multiple patches.

3. patch n+1: update golden master binaries and empty=20
tests/bios-tables-test-allowed-diff.h

Thanks,

Heyi

>  =20
>   #include "qemu/osdep.h"
>
>
> .

