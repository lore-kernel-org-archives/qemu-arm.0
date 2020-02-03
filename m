Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3958318lfp;
        Mon, 3 Feb 2020 05:34:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkoCVEt2DJIkG73FNAPYwTjRiJzjs0p3wVZZuBPLY6z8WdrLK54dRXhU4CeH4v1smiq5vt
X-Received: by 2002:a37:7f03:: with SMTP id a3mr7305545qkd.422.1580736848443;
        Mon, 03 Feb 2020 05:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580736848; cv=none;
        d=google.com; s=arc-20160816;
        b=FrPW9tpftR90/J+M9os2NIcKIQVGbl1hkCA7JYiDzmS/3xt+jwBgq9qTtX0UL6fCCV
         CSJWl5rF1XSM3OCKMR5n7/71+06WlkHktWh4mMIxv7nKkm/lXd9+yGLw6V7dlZFLeZh/
         WmTuuNSEyh47ffme1dYJYYgZwr+LfT6BURM9m5LH0AuRWulSf70MlZcat/soDIODiMqa
         g01Orjsj5eGoH31+I+GkWvWWDahrl0r43V6qVguckHlbVB/3AnZ1XN/CsnCcFosr2hxK
         tJ4fy7G3YIAE/GWdMIYjhZHfGE2ffKA5NGOD0NSPwg7pdJI7PrFknIhJ/zZkhL1Z886m
         t/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=BnUU/r1K90FwH22DLLdtIiG9AxbTDisUvcolSb0RcJs=;
        b=rrKwKQ4FK5AVFqh0u5bTgeVFH9vO8hb8Z7fEDNK+vIhhlrY4RhgIAHHWdompWagUfw
         ef4bAiw4or4A9rdevqElNx8y7P+A0gaqsgyprzGioTeIm57HOaMxff2jrh5auDCuiAJB
         It2/iW2nMo/dB3d4Lou6Gi4+tePYbnWwtcQkM02/vldhn4citzX+ySDjLUVuoTQtGLG8
         1z4ja+EQr5QiabQsora1noiiuKnIbssnlP64CGDAGMGmcr4bylARoJPLqbKTXRsUHkH+
         pZh6IKT/T/15F5R48Z3ETNBQcYP0JjcE3Z+CLV4UU5vIU+pO78PzGaAOrWOMS9P+Slgv
         9lRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si11827163qkh.255.2020.02.03.05.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:34:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iybrb-0005BB-Th
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iybrM-00059a-Qz
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:33:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iybrL-0005BK-JG
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:33:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:34928 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iybrL-00053J-72; Mon, 03 Feb 2020 08:33:51 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CD3CB6D94AD4A54EF829;
 Mon,  3 Feb 2020 21:33:42 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.228) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 3 Feb 2020 21:33:35 +0800
Subject: Re: [PATCH v2 0/7] Some cleanup in arm/virt/acpi
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203014246-mutt-send-email-mst@kernel.org>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <455d16a4-e7b6-af9b-0b7e-43be70e22f7b@huawei.com>
Date: Mon, 3 Feb 2020 21:33:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200203014246-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="gbk"; format=flowed
X-Originating-IP: [10.173.221.228]
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
Cc: wanghaibin.wang@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: utRKFg6U8FDm


=D4=DA 2020/2/3 14:43, Michael S. Tsirkin =D0=B4=B5=C0:
> On Mon, Feb 03, 2020 at 08:14:58AM +0800, Heyi Guo wrote:
>> Remove conflict _ADR objects, and fix and refine PCI device definition=
 in
>> ACPI/DSDT.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-devel@nongnu.org
>
> Series
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> merge through ARM tree pls.

Thanks, Michael :)


Hi Peter,

Do I need to send v3 to update the commit message of patch 4/7 as=20
Michael suggested?

Thanks,

Heyi

>
>> v1 -> v2:
>> - flow the work flow in tests/qtest/bios-table-test.c to post ACPI rel=
ated
>>    patches.
>> - update commit messages for removing "RP0" and "_ADR".
>> - add 3 more cleanup patches.
>>
>> Heyi Guo (7):
>>    bios-tables-test: prepare to change ARM virt ACPI DSDT
>>    arm/virt/acpi: remove meaningless sub device "PR0" from PCI0
>>    arm/virt/acpi: remove _ADR from devices identified by _HID
>>    arm/acpi: fix PCI _PRT definition
>>    arm/acpi: fix duplicated _UID of PCI interrupt link devices
>>    arm/acpi: simplify the description of PCI _CRS
>>    virt/acpi: update golden masters for DSDT update
>>
>>   hw/arm/virt-acpi-build.c          |  25 ++++++-------------------
>>   tests/data/acpi/virt/DSDT         | Bin 18462 -> 5307 bytes
>>   tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 6644 bytes
>>   tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 5307 bytes
>>   4 files changed, 6 insertions(+), 19 deletions(-)
>>
>> --=20
>> 2.19.1
>

