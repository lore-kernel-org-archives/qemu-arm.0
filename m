Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3070240wru;
        Mon, 1 Jul 2019 14:17:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYovY+XUZqSbARlZ5FKG7g6swtNvXRHFgefapXgLIWVT2ZyzS+rMA54C7f/bn/YrcOBYQk
X-Received: by 2002:a17:906:474a:: with SMTP id j10mr25608721ejs.104.1562015834230;
        Mon, 01 Jul 2019 14:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562015834; cv=none;
        d=google.com; s=arc-20160816;
        b=Myc7x/EOPDHQLGw8HYRtcTQ9RdCjHShDP/6cNPW4AEsr2X5FZJXQj7mqFzEuQDMn+Q
         FTVFGCdfH85veKYsCmTVQLAPwSrz4q5afHeehq2RRfEnvDX4cDd8SxvoXeFH3MAFsscy
         YpJoIR6xsFPpwziji3OE8C/PNw6+wglgOXl+VvY0aO9mjSGbwLR+Oiq9Kl9iJQEAJmJE
         DvAsT/4JRvGQuDcMA9FmHLtmcHA+PewH0u1n9ijnryxjEYEvD2dNxjg294DcYkTaLVUS
         g419CtVDOv/eGkL6v/QSbN+p5BAw3qPKmsIKfmS0sUYIaiOUHRpqSJMxZmu21RW81OCA
         a9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=dslqChSdthHYW8DZvM7G/yoRfSJGhh80Umr5A0rkfzY=;
        b=cw1LE6CJbwsOrEj83lh9zxcuu2V2iq0yhQrzuoOlN0qYhGTtxcPaXWTTegRxo3FyZ5
         8QvrWBfcfHY5tR1aFDhpIa3Ip5lJmblln5G+3Qv+qUVd9vCFsPCEZQl3CCukWe/YRg0b
         5foS9ZiEfM0L5LqF3NVb3cBcYlhAlaOsRabLO5CzF1CgAqWa68cd5Ga53hf0wYHKMiTu
         O85nYKWlTEJgPPHkVesenMRSGwc05ZYC2v6jb3M6BvWt6p6RrTmOjN3SSLRfNJ3JDL6R
         2kikTE1AKbZZVsvo8vqWGTtEt9zOHPY9V5wi85EiWSHHRUBNWXRY87/O6DeuAPHKxHqJ
         XsAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si10358845edb.109.2019.07.01.14.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 14:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi2x6-0002br-0c
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 16:31:04 -0400
Received: from [2001:470:142:3::10] (port=54032 helo=eggs.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hi2wi-0002ZL-LD
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 16:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hi2wQ-0001y7-5M
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 16:30:32 -0400
Received: from [209.132.183.28] (port=40552 helo=mx1.redhat.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hi2wP-0001y0-St; Mon, 01 Jul 2019 16:30:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9CF37308622E;
 Mon,  1 Jul 2019 19:12:56 +0000 (UTC)
Received: from [10.36.116.95] (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 760EA5F90E;
 Mon,  1 Jul 2019 19:12:49 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA-w1AijFogZxX_9gz2+oDGH-=e2QAOdyCRdji_6k87d-A@mail.gmail.com>
 <41f46a4b-5796-169a-1193-996ac94022c4@redhat.com>
Message-ID: <453c5edf-0e42-4e07-9d17-7a69085aa231@redhat.com>
Date: Mon, 1 Jul 2019 21:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <41f46a4b-5796-169a-1193-996ac94022c4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 01 Jul 2019 19:13:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/8] ARM virt: ACPI memory
 hotplug support
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
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HVZAQXZVNPH3

Hi Peter,

On 7/1/19 5:55 PM, Auger Eric wrote:
> Hi Peter,
> 
> On 7/1/19 3:52 PM, Peter Maydell wrote:
>> On Tue, 25 Jun 2019 at 13:15, Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com> wrote:
>>>
>>> This series is an attempt to provide device memory hotplug support
>>> on ARM virt platform. This is based on Eric's recent works here[1]
>>> and carries some of the pc-dimm related patches dropped from his
>>> series.
>>>
>>> The kernel support for arm64 memory hot add was added recently by
>>> Robin and hence the guest kernel should be => 5.0-rc1.
>>>
>>> NVDIM support is not included currently as we still have an unresolved
>>> issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
>>> can be included, but not done for now, for keeping it simple.
>>>
>>> This makes use of GED device to sent hotplug ACPI events to the
>>> Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
>>> Sebastien to add the hardware-reduced support to Nemu using GED
>>> device[3]. (Please shout if I got the author/signed-off wrong for
>>> those patches or missed any names).
>>>
>>> This is sanity tested on a HiSilicon ARM64 platform and appreciate
>>> any further testing.
>>
>> Hi; this seems to fail 'make check' (on an x86 host):
>>
>> acpi-test: Warning! DSDT binary file mismatch. Actual
>> [aml:/tmp/aml-01P83Z], Expected [aml:tests/data/acpi/virt/DSDT].
>> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-4ZP83Z.dsl,
>> aml:/tmp/aml-01P83Z], Expected [asl:/tmp/asl-H7UE4Z.dsl,
>> aml:tests/data/acpi/virt/DSDT].
>> **
>> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
>> assertion failed: (all_tables_match)
> I fail to reproduce on my laptop:
> 
> make check-qtest-x86_64 executes
> 
>   TEST    check-qtest-x86_64: tests/bios-tables-test
> 
> and it does not seem to complain. But maybe I misunderstand the framework.
> 
> If I were able to reproduce I understand this is a matter to regenerate
> the files we compare with by using
> tests/data/acpi/rebuild-expected-aml.sh, right?

I reproduced the failure with a TCG aarch64 target on x86.
I sent a separate
"[PATCH] tests: Update DSDT ACPI table for arm/virt board with PCDIMM
related changes" patch that should fix the issue.

checkpatch complains with an "ERROR: Does not appear to be a
unified-diff format patch" but I checked similar patches like d2a1b1d602
("tests: update acpi expected files") produce the same so I hope it's fine.

Thanks

Eric

Thanks

Eric
> 
> Thanks
> 
> Eric
> 
> 
>> ERROR - Bail out!
>> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/bios-tables-test.c:434:test_acpi_asl:
>> assertion failed: (all_tables_match)
>> Aborted (core dumped)
>> /home/petmay01/linaro/qemu-from-laptop/qemu/tests/Makefile.include:894:
>> recipe for target 'check-qtest-aarch64' failed
>>
>> Is there a need to update the reference DSDT used by the test?
>>
>> thanks
>> -- PMM
>>
> 
