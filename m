Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp242937wrx;
        Wed, 3 Apr 2019 06:29:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydCPcnX7epC5Scm9vQzEZ0QAQ+vlsvNG0hee0aLaBxBeJ9JyToWX0IeVgpZeRh2zCiuAzd
X-Received: by 2002:a25:c047:: with SMTP id c68mr824706ybf.409.1554298185545;
        Wed, 03 Apr 2019 06:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554298185; cv=none;
        d=google.com; s=arc-20160816;
        b=hCKnDt4qJcBY/Jr4XeeBR6QArkKmgFo5MpJ/bUC1OQM1j5A9EBmlWmryHlcnGtmeKB
         e67cPICQzNOl/643Bpq4c3TqWykRLVmuhbNTbfOJ7wRV2/bDImhJwurBpZt2WlTRjPqR
         W/HucJ6W4Yyi9DK4lt9AUw5kkQTFFb6ZDBNPaxKefbtd+9o78iRq9Xg6Kc4y1lx0cen7
         fwlPnEQW8reUJahe8McjhScM4aCpe+JJd7eKlgRkWBE/mtDnrz/ykBnmZJy6bm2VEO1S
         BGKzeXt8IMqcXPSbbQdT1/vvamUdQyuviLi+GkQpjzyb4mZ2diekkA3NR7N4XuMecA9N
         GdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=UcGH+4qtjByyC88vBMlm/9yg7soCLzcLJNbQW7ppKgg=;
        b=Ioe+XmG/jPL7c+jN8udD3MvpYuxfTfu3A4DIBoxuZGNlU6t/u0zQB9IANDlQL3ukje
         wBDj7s4rCUEC9eesRQbnNH/G/khLvLeQvZkF3JnbtV+wj3X2llET0vkTQU3LwYhXOnHa
         RKgil4stQkjLVl62OEJY5dD0/L8VtzpDzgj+FdD9V4eN4OkYR3WkBcKlVe2SyzLwqEAM
         bDmrCry0/Pk5EEYsxZol7DrDXRuwpiUfWGLFniyEb+OaNSxQCuV95lVwlMjTws+RLmwa
         r+wLp+oI11Uj0SJO44ZfYkzGKT2NlYZhWdVzP6oocTX1fSRAWhRclywWxiDvCfMeCDbL
         G+1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si9939449ywe.92.2019.04.03.06.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Apr 2019 06:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBfxZ-0003bz-1S
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 09:29:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBfxN-0003ap-5Y
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 09:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hBfxM-0003cw-5k
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 09:29:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hBfxL-0003cG-RE; Wed, 03 Apr 2019 09:29:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BC87C007340;
	Wed,  3 Apr 2019 13:29:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-127.rdu2.redhat.com
	[10.10.120.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EFC160BE0;
	Wed,  3 Apr 2019 13:29:24 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
	<459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
	<3de6adf3-30c7-5908-e153-2195bc6879c5@redhat.com>
	<9e939ea4-4be2-a165-dce4-47d8196020b0@redhat.com>
	<20190403114901.6e4ea653@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ebf745ce-f5bc-be0c-c0ce-3ce25bd7afa9@redhat.com>
Date: Wed, 3 Apr 2019 15:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 03 Apr 2019 13:29:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9jgu5bTJxgi

On 04/03/19 14:10, Shameerali Kolothum Thodi wrote:

>>>>> So, the condition for hiding the hotpluggable memory nodes in question
>>>>> from the DT is:
>>>>
>>>>>
>>>>>   (aarch64 && firmware_loaded && acpi_enabled)

>>> While UEFI has bindings for both 32-bit and 64-bit ARM, ACPI has a
>>> 64-bit-only binding for ARM. (And you can have UEFI without ACPI, but
>>> not the reverse, on ARM.) So if you run the 32-bit build of the
>>> ArmVirtQemu firmware, you get no ACPI at all; all you can rely on with
>>> the OS is the DT.
> 
> Just to confirm, does that mean with 32-bit build of the UEFI, the OS cannot
> boot with ACPI and uses DT only.

Indeed.

> So,
> 
> If ((aarch64 && firmware_loaded && acpi_enabled) {
>    Hide_hotpluggable_memory_nodes()
> } else {
>    Add_ hotpluggable_memory_nodes()
> }
> 
> should work for all cases?

Yes.

Here's what happens when any one of the subconditions evaluates to false:

- ARM32 has no ACPI bindings, so the guest kernel can only use DT.

- On AARCH64, if you don't "load the firmware" (= don't use UEFI), then
  there won't be an ACPI entry point for the OS to locate (the RSD PTR
  is defined by the ACPI spec in UEFI terms, for AARCH64). So the guest
  kernel can only use DT.

- When on AARCH64 and using UEFI, but asking QEMU not to generate ACPI
  content, the firmware will not install any ACPI tables, so the guest
  kernel can only use DT.

>>> This "bitness distinction" is implemented in the firmware already. If
>>> you hid the memory nodes from the DT under the condition
>>>
>>>   (!aarch64 && firmware_loaded && acpi_enabled)
>>>
>>> then the nodes would not be seen by the OS at all (because
>>> "acpi_enabled" is irrelevant for the 32-bit build of ArmVirtQemu, and
>>> all the OS can ever get is DT).
>>
>> It's getting tricky and I don't like a bit that we are trying to carter
>> 64 bit only UEFI build (or any other build) on QEMU side. Also Peter has
>> a valid about guessing on QEMU side (that's usually a source of problem
>> in the future).
> 
> If the above is correct(with 32-bit variant of UEFI, OS cannot have ACPI boot),
> then do we really have the issue of memory becoming non hot-un-unpluggable?
> May be I am missing something. 

I think Igor and Peter dislike adding complex logic to QEMU that
reflects the behavior of a specific firmware. AIUI their objection isn't
that it wouldn't work, but that it's not the right thing to do, from a
design perspective.

Thanks,
Laszlo
