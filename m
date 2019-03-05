Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4517114wrx;
        Tue, 5 Mar 2019 00:58:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpAM5ZgNv+VcjWwE307vxgv7h8YIolJszneg3qUSE9KO0HmhNEYJurSbRPx+bKkE9Kh6Lw
X-Received: by 2002:a25:db8d:: with SMTP id g135mr1196170ybf.474.1551776333710;
        Tue, 05 Mar 2019 00:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551776333; cv=none;
        d=google.com; s=arc-20160816;
        b=ZsrrX01pjh9xw7xzLu10l3HssjGz1TpYeXBw9Yqa/mWkzxU4l5y7dlWNvEIU921v4z
         9UAq23z6UAE2302Lg5K6fX7nsHQkSQgxKCFY+r7kjbtxR/t1ryxDp8HT/vVg9/j42Pex
         JmTlpO3HLeKLGgVo+nvNDidWq1vE3CnRJ9l5amIyXBxWdWSE8tvrX16P8ZRhSlHqEGXl
         vBE85LTpKxdOI8WvdVsY1Lgjq4anF9YbzSvLbi09nok2WH8nCgB9G8K2noxNbowFgmJ9
         oKhoVvj1TfQYHZlkyk7791z6Kb9J3U4+Sj2B/yKW0FUCy+BVsgXfh9C+8mccQ0R6v0Bt
         6dtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=ULf+hmIUgioMW5HsrXHZO9c3FSjv9qBbNsulQXsOb1Y=;
        b=t45hhs9WOTAE3W81grARjyf493O5nnX/ByQP+AaCEkb3VrZlC7sa9PFoU+naPn4wBy
         oEefDOfExp+ZZpkX/FL/h1n5dL98eYl1H71OU6DjuDYXC0ifIT6vuuD5mv9rm1yKq4MV
         gj3fiSVeTdCKrCRQH1gxbkybUVdkzrPNU3Hvdkt3KYMdBuMFT+FYDySNA//FeL498OQe
         k9J/b63BCkPyhXB9hMOcCUnGt9Lqs8jmKugN4ljcJzpjN8sW4KgWK6DNHmd2yrF2y+j/
         h2Ix57cYVdfHnnnaNFO11Ej9UXYGvwLQis+KQ701dB5y/J7dqc2P9v2EC3WXiuiCJZWC
         1+DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si4699457ybp.426.2019.03.05.00.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 00:58:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:39817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h15uX-0002Kd-76
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 03:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h15uO-0002KX-Hr
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 03:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h15uM-0007b1-Hn
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 03:58:44 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2241 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h15uK-0007GI-GV; Tue, 05 Mar 2019 03:58:42 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 93DE1F9CED084EA86E9C;
	Tue,  5 Mar 2019 16:58:31 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Tue, 5 Mar 2019
	16:58:22 +0800
To: Igor Mammedov <imammedo@redhat.com>
References: <1551705934-28745-1-git-send-email-guoheyi@huawei.com>
	<20190304162711.105e09f2@redhat.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <8f872106-a268-5adb-8c54-f09c1f90f491@huawei.com>
Date: Tue, 5 Mar 2019 16:58:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190304162711.105e09f2@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/acpi: enable SHPC native hot plug
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jRYxNYUzjKOA



On 2019/3/4 23:27, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 21:25:34 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> After the introduction of generic PCIe root port and PCIe-PCI bridge,
>> we will also have SHPC controller on ARM, so just enalbe SHPC native
>> hot plug.
>>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 04b62c7..7849ec5 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>>       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>>       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
>> +
>> +    /*
>> +     * Allow OS control for all 5 features:
>> +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
>> +     */
>> +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
>>                                   aml_name("CTRL")));
> aml_store here is excessive, you can use shorter variant that x86 uses
>
>   aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
>
> the last argument of aml_and() is the target var where to store computation result

Indeed. I'm going to generate a separate patch to fix this first and then apply SHPC patch.

Thanks,
Heyi

>
>>   
>>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>
> .
>


