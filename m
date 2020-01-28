Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp683401lfp;
        Tue, 28 Jan 2020 08:29:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBfr8gxfkJKJMTR3lpjhZKfvIPl1rrQEm8c/knoHllmDIfN1OyH0WnZfdyE6pgCtKPZy8+
X-Received: by 2002:a0c:e4c1:: with SMTP id g1mr23396432qvm.45.1580228994001;
        Tue, 28 Jan 2020 08:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580228993; cv=none;
        d=google.com; s=arc-20160816;
        b=n6/uY58aFOvqohl4Ba0K4l+5N13k6UbME4clmaez4ZfCK2kCcjLmAYi8L9H+IrreC7
         jI4KyT1LGLB2FBkmIipYqqVOgcqcHzj5qYItxUsxDjC7Ft5OnhtWD7Je3v/LiVcOz/17
         U655wc9DFMK+eU1tNRsK0f8kqg7tYK0Ze7YvBludYaLI8ScBX4T68ovd1MTKB5o+vHG0
         IAOBGiibspTxlZ5iEEHA0zudEHJcmpaidp1CIKemGNyq1k+g4sB+JrmHvXrh13+xCrfj
         7OJiKBfCT0L/grtBey9E1lQnwAsMW36vDUKt8JesVXhDcji5RQLu6pK3yUTziYaAOcd/
         Oytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3BPjbUQr0PkniWzjK2e36N9k9NYI3RAspVa2CKg/NsI=;
        b=FG7kCLrxglNBbAp/BA/IdUMzu2aLpX9yXCJZR1WRLK/WwK7SND30ZLRojI0lG7teps
         rGhHBYbX9GRInOusaoE4l4rzNtyS1CmW6nomkBtR+yax0So7YkEef7ziqKpWEEZfTGpC
         1ghmobpjBf+vetdT0tE3rMPyigdktHZiPDNZLHxnZ6qyrpzMqbngJji0CgghjZBxs7wQ
         WrownZ5mDOmDH9SRWx6PAQRTgsA5hGkTJtIf9FB6SMhZfQix5P7Zmn5nwPMeb4cupHoe
         9LjrW99PZpxUTBLXcLRY8L2rfwEJ5BOYBP1rdNoVmrfY+vSQsDNRb59LlnVCxx+oPFvR
         vpvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=is03n94a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si12807451qkj.177.2020.01.28.08.29.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 08:29:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=is03n94a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwTkP-0008S5-Eb
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 11:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwTkA-0008O0-0v
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 11:29:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwTk9-0003v6-0o
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 11:29:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44576
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwTk8-0003uf-Sx
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 11:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580228976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BPjbUQr0PkniWzjK2e36N9k9NYI3RAspVa2CKg/NsI=;
 b=is03n94aNnkey/qboPAaym6BjJaSY+XH0JQqsO+keFFpAyC5T0LT099Cw9aTkF0bwqhKb0
 ujnkwUrBsIDnFtAYgyIXTCeTASX8fnmR7/tVUQIrfsU+j9puOGToogdJ8oAeGTC0HexUuh
 q56m+hG95xu7oGZmvrpsuQo31aJgyjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360--GBZOLopMhKHxYr9v-PLCA-1; Tue, 28 Jan 2020 11:29:34 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0702910BAD8F;
 Tue, 28 Jan 2020 16:29:33 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A534919C58;
 Tue, 28 Jan 2020 16:29:26 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6cdba6ae-928d-696b-19b2-f4f81f341f3a@redhat.com>
Date: Tue, 28 Jan 2020 17:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -GBZOLopMhKHxYr9v-PLCA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cIiI4BybQG8L

Hi Shameer,

On 1/17/20 6:45 PM, Shameer Kolothum wrote:
> Since we now have both pc-dimm and nvdimm support, update
> test_acpi_virt_tcg_memhp() to include those.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  tests/data/acpi/virt/NFIT.memhp | 0
>  tests/data/acpi/virt/SSDT.memhp | 0
Is it normal to have those 2 above void files? I lost track about the
process.
>  tests/qtest/bios-tables-test.c  | 9 +++++++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 tests/data/acpi/virt/NFIT.memhp
>  create mode 100644 tests/data/acpi/virt/SSDT.memhp
> 
> diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/virt/NFIT.memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f1ac2d7e96..695d2e7fac 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -913,12 +913,17 @@ static void test_acpi_virt_tcg_memhp(void)
>      };
>  
>      data.variant = ".memhp";
> -    test_acpi_one(" -cpu cortex-a57"
> +    test_acpi_one(" -machine nvdimm=on"
nit: maybe keep the same order as before ...
> +                  " -cpu cortex-a57"
>                    " -m 256M,slots=3,maxmem=1G"
and simply add ,nvdimm=on to above line.
>                    " -object memory-backend-ram,id=ram0,size=128M"
>                    " -object memory-backend-ram,id=ram1,size=128M"
>                    " -numa node,memdev=ram0 -numa node,memdev=ram1"
> -                  " -numa dist,src=0,dst=1,val=21",
> +                  " -numa dist,src=0,dst=1,val=21"
> +                  " -object memory-backend-ram,id=ram2,size=128M"
> +                  " -object memory-backend-ram,id=nvm0,size=128M"
> +                  " -device pc-dimm,id=dimm0,memdev=ram2,node=0"
> +                  " -device nvdimm,id=dimm1,memdev=nvm0,node=1",
>                    &data);
>  
>      free_test_data(&data);
> 
Thanks

Eric

