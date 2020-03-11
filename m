Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp860698lfc;
        Wed, 11 Mar 2020 07:50:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt2ZQVW4SB/Y1CPcwzI5TrbGcXCDRkiOWh/zFwgQ/7RJ9URtE+x6vCDk4TCyQqzrQSZGg+X
X-Received: by 2002:a4a:dd03:: with SMTP id m3mr543205oou.25.1583938230379;
        Wed, 11 Mar 2020 07:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583938230; cv=none;
        d=google.com; s=arc-20160816;
        b=P1a20kMaga8+95sx2ew1wYvukcePPVR1/bxzkF9zenKYL/xJuclzfwK8MQDWoFIUo+
         JHV1XzMJdmLcx6/DWkU/xzsDl0koPhZE5J0X0AwkNCqbZQKES5/nPkTq0M8m2HYBCIXZ
         HeG8ymE/FrS0JXuHy0mDjBH8Yyi13ltIPSIfhjXUlr/bGFNV/BYmGfcM6DKJAro0HH3o
         5CuHo2cKejfgovwVqJwDUgeZDEwYRj7vRnp8qpIohxdNEQA9L23ASF03j11txYJNMGzW
         MTsBqrZkFX9gtIXIEWiD4flUboIERUz0CI+v/Ap/FmjcpIT9zAatnZyjt+7d544eVLaj
         WHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=jsKkDSgyQz2pLGCyrcLc9VQw/vTQBxdYWH0tEharUX4=;
        b=MUdGPkDSZu36PRkGWoD5504dUpqrslbMbK43vb41a4p3qAdHXtymasx19xZRzGmu86
         MK50f5RNh9yIhf4tpTUgp3/mhZzVZi99Oo7gaeBcnTtJVQkrlptfVSnlMqh3dH2GBmwI
         uiMxKC+aNjGz+LN6utSslsy1k4XqgCPm1b5DRWkm4YyZOslSwE4lDYZYVIQvVGWGrpbw
         UL4l7P96qYz/9XpX42BAPNXUEhOPD9jnz4BQGGqD2n8X0EWPYQzNNl5z+NL43IR6ELhD
         uDMozf/dyqsCDXXhl9BXFE+vmYmE+7UgwqYKIOjIwzjyTb8z6NgjGISRZQTn2K+N3zcU
         X0gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3efE2dm;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t8si467920otl.19.2020.03.11.07.50.30;
        Wed, 11 Mar 2020 07:50:30 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G3efE2dm;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgCKOu3 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 11 Mar 2020 10:50:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47725 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729798AbgCKOu3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 11 Mar 2020 10:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583938226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jsKkDSgyQz2pLGCyrcLc9VQw/vTQBxdYWH0tEharUX4=;
        b=G3efE2dmXcOUlX8/ZvZxPswKlp0jNh0p26wpS1rriz70rtsRyqTk6v9Y4muAfUBr98jnhc
        noE3K3VdjyDZIhCa3W1hAk+XE7cpvqFRP6Ji/nUdZDu4Aa15fZMJhpvQW9vlieGChBYAzU
        K939hwIOsA9IT1Rdq/bZejpWacKBw80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-5QHxOei5MXatAU_1bhWitw-1; Wed, 11 Mar 2020 10:50:24 -0400
X-MC-Unique: 5QHxOei5MXatAU_1bhWitw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D458017DF;
        Wed, 11 Mar 2020 14:50:23 +0000 (UTC)
Received: from [10.36.118.12] (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B24C10013A1;
        Wed, 11 Mar 2020 14:50:18 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v6 06/13] arm/arm64: ITS: Introspection
 tests
To:     Andrew Jones <drjones@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
References: <20200311135117.9366-1-eric.auger@redhat.com>
 <20200311135117.9366-7-eric.auger@redhat.com>
 <20200311143331.yesdkxuobng3qzuu@kamzik.brq.redhat.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <94f73aef-9898-d551-f440-5dff2c3d2a63@redhat.com>
Date:   Wed, 11 Mar 2020 15:50:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200311143331.yesdkxuobng3qzuu@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xiu8/ErsPFAY

Hi Drew,

On 3/11/20 3:33 PM, Andrew Jones wrote:
> On Wed, Mar 11, 2020 at 02:51:10PM +0100, Eric Auger wrote:
>> Detect the presence of an ITS as part of the GICv3 init
>> routine, initialize its base address and read few registers
>> the IIDR, the TYPER to store its dimensioning parameters.
>> Parse the BASER registers. As part of the init sequence we
>> also init all the requested tables.
>>
>> This is our first ITS test, belonging to a new "its" group.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v5 -> v6:
>> - fix some GENMASK_ULL and tabs
>>
>> v4 -> v5:
>> - Moved test_its_introspection() stub from
>>   lib/arm/asm/gic-v3-its.h back to arm/gic.c
>> - 32b its_init does report_abort()
>> - remove kerneldoc style comment
>> - remove alloc_lpi_tables from its_init()
>>
>> v3 -> v4:
>> - fixed some typos, refine trace msgs
>> - move its files to lib/arm64 instead of lib/arm
>> - create lib/arm/asm/gic-v3-its.h containing stubs
>> - rework gic_get_dt_bases
>> - rework baser parsing
>> - move table allocation to init routine
>> - use get_order()
>>
>> v2 -> v3:
>> - updated dates and changed author
>> - squash "arm/arm64: ITS: Test BASER" into this patch but
>>   removes setup_baser which will be introduced later.
>> - only compile on aarch64
>> - restrict the new test to aarch64
>>
>> v1 -> v2:
>> - clean GITS_TYPER macros and unused fields in typer struct
>> - remove memory attribute related macros
>> - remove everything related to memory attributes
>> - s/dev_baser/coll_baser/ in report_info
>> - add extra line
>> - removed index filed in its_baser
>> ---
>>  arm/Makefile.arm64         |  1 +
>>  arm/gic.c                  | 48 ++++++++++++++++++
>>  arm/unittests.cfg          |  7 +++
>>  lib/arm/asm/gic-v3-its.h   | 22 +++++++++
>>  lib/arm/gic.c              | 34 +++++++++++--
>>  lib/arm64/asm/gic-v3-its.h | 92 +++++++++++++++++++++++++++++++++++
>>  lib/arm64/gic-v3-its.c     | 99 ++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 298 insertions(+), 5 deletions(-)
>>  create mode 100644 lib/arm/asm/gic-v3-its.h
>>  create mode 100644 lib/arm64/asm/gic-v3-its.h
>>  create mode 100644 lib/arm64/gic-v3-its.c
>>
>> diff --git a/arm/Makefile.arm64 b/arm/Makefile.arm64
>> index 6d3dc2c..60182ae 100644
>> --- a/arm/Makefile.arm64
>> +++ b/arm/Makefile.arm64
>> @@ -19,6 +19,7 @@ endef
>>  cstart.o = $(TEST_DIR)/cstart64.o
>>  cflatobjs += lib/arm64/processor.o
>>  cflatobjs += lib/arm64/spinlock.o
>> +cflatobjs += lib/arm64/gic-v3-its.o
>>  
>>  OBJDIRS += lib/arm64
>>  
>> diff --git a/arm/gic.c b/arm/gic.c
>> index 2f904b0..649ed81 100644
>> --- a/arm/gic.c
>> +++ b/arm/gic.c
>> @@ -16,6 +16,7 @@
>>  #include <asm/processor.h>
>>  #include <asm/delay.h>
>>  #include <asm/gic.h>
>> +#include <asm/gic-v3-its.h>
>>  #include <asm/smp.h>
>>  #include <asm/barrier.h>
>>  #include <asm/io.h>
>> @@ -517,6 +518,49 @@ static void gic_test_mmio(void)
>>  		test_targets(nr_irqs);
>>  }
>>  
>> +#if defined(__arm__)
>> +
>> +static void test_its_introspection(void) {}
>> +
>> +#else /* __aarch64__ */
>> +
>> +static void test_its_introspection(void)
>> +{
>> +	struct its_baser *dev_baser = &its_data.device_baser;
>> +	struct its_baser *coll_baser = &its_data.coll_baser;
>> +	struct its_typer *typer = &its_data.typer;
>> +
>> +	if (!gicv3_its_base()) {
>> +		report_skip("No ITS, skip ...");
>> +		return;
>> +	}
>> +
>> +	/* IIDR */
>> +	report(test_readonly_32(gicv3_its_base() + GITS_IIDR, false),
>> +	       "GITS_IIDR is read-only"),
>> +
>> +	/* TYPER */
>> +	report(test_readonly_32(gicv3_its_base() + GITS_TYPER, false),
>> +	       "GITS_TYPER is read-only");
>> +
>> +	report(typer->phys_lpi, "ITS supports physical LPIs");
>> +	report_info("vLPI support: %s", typer->virt_lpi ? "yes" : "no");
>> +	report_info("ITT entry size = 0x%x", typer->ite_size);
>> +	report_info("Bit Count: EventID=%d DeviceId=%d CollId=%d",
>> +		    typer->eventid_bits, typer->deviceid_bits,
>> +		    typer->collid_bits);
>> +	report(typer->eventid_bits && typer->deviceid_bits &&
>> +	       typer->collid_bits, "ID spaces");
>> +	report_info("Target address format %s",
>> +			typer->pta ? "Redist base address" : "PE #");
>> +
>> +	report(dev_baser && coll_baser, "detect device and collection BASER");
>> +	report_info("device table entry_size = 0x%x", dev_baser->esz);
>> +	report_info("collection table entry_size = 0x%x", coll_baser->esz);
>> +}
>> +
>> +#endif
>> +
>>  int main(int argc, char **argv)
>>  {
>>  	if (!gic_init()) {
>> @@ -548,6 +592,10 @@ int main(int argc, char **argv)
>>  		report_prefix_push(argv[1]);
>>  		gic_test_mmio();
>>  		report_prefix_pop();
>> +	} else if (strcmp(argv[1], "its-introspection") == 0) {
>> +		report_prefix_push(argv[1]);
>> +		test_its_introspection();
>> +		report_prefix_pop();
>>  	} else {
>>  		report_abort("Unknown subtest '%s'", argv[1]);
>>  	}
>> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
>> index 017958d..23d378e 100644
>> --- a/arm/unittests.cfg
>> +++ b/arm/unittests.cfg
>> @@ -122,6 +122,13 @@ smp = $MAX_SMP
>>  extra_params = -machine gic-version=3 -append 'active'
>>  groups = gic
>>  
>> +[its-introspection]
>> +file = gic.flat
>> +smp = $MAX_SMP
>> +extra_params = -machine gic-version=3 -append 'its-introspection'
>> +groups = its
>> +arch = arm64
>> +
>>  # Test PSCI emulation
>>  [psci]
>>  file = psci.flat
>> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
>> new file mode 100644
>> index 0000000..2167099
>> --- /dev/null
>> +++ b/lib/arm/asm/gic-v3-its.h
>> @@ -0,0 +1,22 @@
>> +/*
>> + * ITS 32-bit stubs
>> + *
>> + * Copyright (C) 2020, Red Hat Inc, Eric Auger <eric.auger@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2.
>> + */
>> +
>> +#ifndef _ASMARM_GIC_V3_ITS_H_
>> +#define _ASMARM_GIC_V3_ITS_H_
>> +
>> +/* dummy its_data struct to allow gic_get_dt_bases() call */
>> +struct its_data {
>> +	void *base;
>> +};
>> +
>> +static inline void its_init(void)
>> +{
>> +	report_abort("not supported on 32-bit");
> 
> This is supposed to be an assert_msg() (no report_* functions in lib
> code), but it should never fire anyway, because the test code should
> just not call its_init() on 32-bit arm. I.e. the assert is there not
> to report to test runners what's going on, but to stop developers
> from calling it when they shouldn't.
> 
> I can fix stuff like this up myself on merge to arm/queue though.
OK. Let's see if someone has other comments. In the positive I will respin.

Thanks

Eric
> 
