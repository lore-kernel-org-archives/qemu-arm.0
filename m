Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1254630wrg;
        Thu, 16 May 2019 17:34:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhxgQJ8RAXIPUZdt/xpKzBjVQU9exv66m8y6w2r3AaWrlKmX6IZGY8hDhoo/pHbC9nwHiD
X-Received: by 2002:a50:9016:: with SMTP id b22mr51870279eda.99.1558053257311;
        Thu, 16 May 2019 17:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558053257; cv=none;
        d=google.com; s=arc-20160816;
        b=MPCnTvlQCIw6YuS6xSRjun3C3XrG7iEmuhRZqMqLfMwKVcO2Cb604U6aAk8H/69GO9
         H1v4n+Sw2s7mTUb+m6E2GvWKfeOTjXFJCvkqzUkZ2OLHxmkEc8XqLKr15VQf54RZYgxz
         nFuJDQsDzGLrPbuaflLKkR/cggHCUpZMMdeUiopTOHA5OzalgjSKp2MDLqNMYSmTpbbj
         ci6iY2xuoFWzn1o6zBfUa9/xrCt3tYnBY2LyJOX8zAkeKqOsQDpe9j0ubfT4t+05S80y
         0AdpIHr1NhqrEA7q/xgyUREXn3Ao8orLT7u3avBdqG6hQkuhG0CJflis5jRZ8lYnyV+O
         D9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=UsRI0WNG5VNmcbp9kkr0k0BAFyeo0CyIkOowiSq78W4=;
        b=kd7uA8aFsef0bQRSpcrb6MgZ5C+9XlRvW+yuKFSbZORzDQEa/N+F0usM4//GnDrm/R
         KMc+S1MjvlUKZTJln3clQMGacnAxEkNRc1IdqQopNZqOYHljm8GTquex/FHVYEwaDYXk
         ZqwP9mqQygTbAqUFHjdRhuuxZQupwBvjo4rgtAqc+Gc5EGi8tMYkdfERaLMRgwq0FSTw
         OJUmuB7KJW0y/BaFIoy47fHZYHWwsVF3X7wI4IIgjJB7K5vbu9NZWXhdNdyCHlScQK/b
         3sMcgS8Pg76YZsLSmSQgXZvrjgvF8fNxQx32nNS70H4Knp5V2E9fQbpsQLixrLcYw+aW
         iSVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a47si5422315edd.409.2019.05.16.17.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 17:34:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:38892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRQpE-0001d3-CG
	for alex.bennee@linaro.org; Thu, 16 May 2019 20:34:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRQp0-0001am-6w
	for qemu-arm@nongnu.org; Thu, 16 May 2019 20:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRQoy-0004RI-Al
	for qemu-arm@nongnu.org; Thu, 16 May 2019 20:34:01 -0400
Received: from mga18.intel.com ([134.134.136.126]:62764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hRQox-0004Oh-76; Thu, 16 May 2019 20:34:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 17:33:57 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2019 17:33:55 -0700
Date: Fri, 17 May 2019 08:33:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190517003323.GA30229@richard>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
	<20190419003053.8260-6-richardw.yang@linux.intel.com>
	<911eb251-8525-0efb-089b-d3feec5c68d1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <911eb251-8525-0efb-089b-d3feec5c68d1@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-arm] [PATCH v4 5/6] hw/acpi: Consolidate build_mcfg to
 pci.c
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org,
	Thomas Huth <thuth@redhat.com>, mst@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhV0zM7S+tnL

On Thu, May 16, 2019 at 08:35:43PM +0200, Philippe Mathieu-Daudé wrote:
>On 4/19/19 2:30 AM, Wei Yang wrote:
>> Now we have two identical build_mcfg functions.
>> 
>> Consolidate them in acpi/pci.c.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> 
>> ---
>> v3:
>>   * adjust changelog based on Igor's suggestion
>> ---
>>  default-configs/arm-softmmu.mak  |  1 +
>>  default-configs/i386-softmmu.mak |  1 +
>>  hw/acpi/Kconfig                  |  4 +++
>>  hw/acpi/Makefile.objs            |  1 +
>>  hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
>>  hw/arm/virt-acpi-build.c         | 17 ------------
>>  hw/i386/acpi-build.c             | 18 +------------
>>  include/hw/acpi/pci.h            |  1 +
>>  8 files changed, 55 insertions(+), 34 deletions(-)
>>  create mode 100644 hw/acpi/pci.c
>> 
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>> index 613d19a06d..8f2796e195 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -144,6 +144,7 @@ CONFIG_XIO3130=y
>>  CONFIG_IOH3420=y
>>  CONFIG_I82801B11=y
>>  CONFIG_ACPI=y
>> +CONFIG_ACPI_PCI=y
>>  CONFIG_ARM_VIRT=y
>>  CONFIG_SMBIOS=y
>>  CONFIG_ASPEED_SOC=y
>> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
>> index ba3fb3ff50..cd5ea391e8 100644
>> --- a/default-configs/i386-softmmu.mak
>> +++ b/default-configs/i386-softmmu.mak
>> @@ -25,3 +25,4 @@
>>  CONFIG_ISAPC=y
>>  CONFIG_I440FX=y
>>  CONFIG_Q35=y
>> +CONFIG_ACPI_PCI=y
>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>> index eca3beed75..7265843cc3 100644
>> --- a/hw/acpi/Kconfig
>> +++ b/hw/acpi/Kconfig
>> @@ -23,6 +23,10 @@ config ACPI_NVDIMM
>>      bool
>>      depends on ACPI
>>  
>> +config ACPI_PCI
>> +    bool
>> +    depends on ACPI
>
>Shouldn't this be "depends on ACPI && PCI"?
>

I think you are right. Let me fix this.

Thanks

-- 
Wei Yang
Help you, Help me
