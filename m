Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3731236wru;
        Tue, 2 Jul 2019 05:06:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPaxXZ67/CS/2z4s86IfLqueb76OqkywCk+LQgCtXG96hNaaQt9xxpblnT3+lk1Yb62Q+M
X-Received: by 2002:a50:86ea:: with SMTP id 39mr34760132edu.184.1562069165647;
        Tue, 02 Jul 2019 05:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562069165; cv=none;
        d=google.com; s=arc-20160816;
        b=WA+AUUQzCYBFaiWXj/HWNx2lk0qSAJsibEEM1OvKipzbHRo8r8MACLzqWcrFfR6wp7
         v1dnZf4XC+sPFBBJ0+arNFh76ZcpSPPga3i2vKalla0eVR1SqCyc7y6C5xtUMrA/CXmg
         a48ZI4+KzdTNXPQKGf03l+NSvFbZ5xOmXwq/lM10t/OkY1V94dOiPPsCtufp/XcD6rxr
         aJ+jn6aBLRjy3epfeotYctcXSwOGS4tri0Us+tBYy2LRrcmt3P0Hi1rYMgqSMksQGRpL
         R87WAr+FThQDWmis0WXS6luBi/eq1QCn84gP8RJehM7hI2pHjkBIkj/C9iYVz4dVq5VF
         ehtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=1D4ai0AsXGmUei5GaLNRztGQYB0Ew0wukdxafK9XTqI=;
        b=eYgRnbJG7B+buKTSyuufmBqHbJf9MvSXR8gR0MOMuiYB0Fuhxlxi1O+6SAwsgH5ls/
         Sfc158xg3Fj2nQdTymUwLwx7fFAYiRCYgjjhwLSy3y+eCkr+2C1k1to+dKRVvMgpdHOr
         1QPh0suZ+I5qVUPXpPDO+e2kLldimkQ9VvSQ3IOr/n5OZnHSBRcd20sjCUTWBWjj4eL9
         2FXRUjfIDOuREQ/u5wUXqz7KSXswUG/eH6dxwE+ouQ1g1paDCliKtok2ds8j4VCst/n1
         PNg8iXuRzfrQ1BrkKdFDRpDLbP6SKluxqUng2KA9DvfmXrBwWwJ/PVyUIPD+vgj+RmyO
         FYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j30si13660427eda.52.2019.07.02.05.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 05:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiHXw-0003VT-Ov
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 08:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38239)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hiHTQ-0008Tm-D4
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 08:01:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hiHTN-0005rP-Nk
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 08:01:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hiHT9-0005Mb-PM; Tue, 02 Jul 2019 08:01:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A0A9B81106;
 Tue,  2 Jul 2019 12:00:52 +0000 (UTC)
Received: from [10.36.116.95] (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CAC118A49;
 Tue,  2 Jul 2019 12:00:41 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
 <20190702130703.0e74cbe6@redhat.com>
 <CAFEAcA8PDNTQXD3cD3XG9wkc_QOLXUcw62-8AUjSC0g7qjti7g@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0bcc011c-17ff-8bfd-1f0e-65c303272664@redhat.com>
Date: Tue, 2 Jul 2019 14:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PDNTQXD3cD3XG9wkc_QOLXUcw62-8AUjSC0g7qjti7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 02 Jul 2019 12:01:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 0/8] ARM virt: ACPI memory hotplug
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Linuxarm <linuxarm@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Xu Wei <xuwei5@hisilicon.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpiGWFcRo+f0

Hi Peter,

On 7/2/19 1:46 PM, Peter Maydell wrote:
> On Tue, 2 Jul 2019 at 12:07, Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> On Tue, 25 Jun 2019 13:14:13 +0100
>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>
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
>> There are several things I'd fix/amend but it's nothing that couldn't
>> be done on top as bugfixes (I'll comment later on specific issues).
>>
>> However as a whole from ACPI and memory hotplug POV series looks more
>> or less ready for merging.
>>
>> I've asked Eric to test migration (I'm quite not sure about that part),
>> (CCed David)so on condition it works:
>>
>>   Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> If we want to get this into 4.1 I'll need somebody to do a respin
> with all the relevant fixes pretty soon (ie within a day or two,
> and that is pushing it because really it's missed the freeze
> deadline already). It might be easier just to let it go into 4.2
> instead...

OK so after those late attempts to get it in, I agree with you. If it
missed the deadline already then let's stick to the process and try to
get this just after 4.1.

I have just checked migration and it fails between a qemu 4.1 and qemu
4.0 with

"qemu-system-aarch64: Unknown savevm section or instance 'acpi-ged' 0.
Make sure that your current VM setup matches your saved VM setup,
including any hotplugged devices
qemu-system-aarch64: load of migration failed: Invalid argument"

so we would need to have a no_acpi_dev class field to avoid using the
GED device < 4.1 I think.

+ troubles with the DSDT ref files / bios-tables-test.c to be fixed.

Thanks

Eric
> 
> thanks
> -- PMM
> 
