Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1898862wro;
        Fri, 2 Nov 2018 02:56:51 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ffD4kOX8RBouFH9CBVfzHW6pRJtAJb6J8/9tPDzH4DUNo6G+MuuSBtKIYXQSlGgO6ofO7N
X-Received: by 2002:a37:310e:: with SMTP id x14mr10297008qkx.78.1541152611258;
        Fri, 02 Nov 2018 02:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541152611; cv=none;
        d=google.com; s=arc-20160816;
        b=BfQg9Qt5wpF03oPEcVZ7ACbTOODYis2tnixeHeu0UCDKry8fZNevQP41vNSwC2gqXV
         5IZx7QYZDVj/xP0M6W3vNhSuuEfP1a2a5NshMap7c7e1x3u/+HviiujrSesTxy7p1InY
         ADy/0pQblLweMFatmao18hEoMqFRE9tET9D5iRGdwEum4WIR0vizPkrHuPrHZ9ofalLN
         sMBhcxe1v1hT0kyNYn8jpXjQonrz5q7kLljT1wgNaz5jn3tb0Vcy1Z5EDzNFR/Q+vIvU
         7TjFyCo4oJIsKO41XHv33YmYuAC76Dwx0jqb0S5We55vpkkUUP/y1pNeloX8xt6bhGAt
         r3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=tz53fiQJjbITta1YxuTyWZOHHFagvRitEDvFDGDYtyI=;
        b=duFe985+5/lqsGKsFJ74mkeuupJ/ACsyn1qWvmAITQdIG34Vkr/yI5pMihXZnN6eJI
         Wt6fKQVusTAAY/U0K6dGDsFLqnjYICX7GI25BxQpS37mHXk3Nw+79Dqq9FEJ8TvjulTp
         OBunz9REBzafp2Z0nUKc9sUg7mA6tDDFx/rUIhw96EWuh89YbLu7zjdEOkfjaSF3M724
         wuT78m/+94JCl0t46K3fqGO/6gJTuZPbBec4C29ZATW09vqb0gNovyxRmQHbChGnPhvd
         LJdlPwPvxZmUWq1dFnAeDU4IRY2U9IYxNmmh2kdHcGiiMrAUsKAREpwmhvn7g2ZeB4Pb
         7QFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t78si1451371qkg.248.2018.11.02.02.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 02:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIWCA-0008J9-Pj
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 05:56:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIWBz-0008In-D5
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gIWBw-0006hx-OD
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:56:39 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gIWBv-0006dt-Pn
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 05:56:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id u1-v6so1364600wrn.0
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 02:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tz53fiQJjbITta1YxuTyWZOHHFagvRitEDvFDGDYtyI=;
	b=ZQNmB6C83eooG8BugD30Nmc1X69vML4g8JVmb6L2WuxPVFNzs5+KjtCeQjbYt591WB
	muqiiBEjblCBC7SLgUZ8JRdQUe3l8rd3OS7GYe9KYvNZybkEMvCNA8U+nSdgiy6ij5IH
	i55pjrqOc6T003IGk/wwWCuQjtaLVB1afoOBtl1TNuD1VJOpxl6Gz+hc/7aXhJF38akD
	EVQdDG5BqkHdacCEPok+mcgkkCtIhoWw2ymNsMo5nn6WMBCkz7L3tUFOZZrKUXxfkjaj
	GY/Qtpo0LX5MO1q6Zo62xUi93Zubg0NZcR6sPWykpiQxBTyqRg8QKjexTxVLi9/hrWTI
	CgBQ==
X-Gm-Message-State: AGRZ1gJ7T1vAKTsQR1Z48qCzkBgM5ARib6UI2DS2uqeuNrKRvKIGT/B3
	mJa/NOH9Iqx05OtcL1NDnrBACw==
X-Received: by 2002:adf:9501:: with SMTP id 1-v6mr9704993wrs.291.1541152581857;
	Fri, 02 Nov 2018 02:56:21 -0700 (PDT)
Received: from [10.101.1.81] ([176.12.107.132])
	by smtp.gmail.com with ESMTPSA id
	l67-v6sm59156781wma.20.2018.11.02.02.56.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 02:56:21 -0700 (PDT)
To: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org
References: <20181101102303.16439-1-sameo@linux.intel.com>
	<20181101102303.16439-4-sameo@linux.intel.com>
	<a7c05368-908e-0249-5702-63a844f9dc71@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a0f830b-e9a3-8cb4-12f5-d3fc234036cc@redhat.com>
Date: Fri, 2 Nov 2018 10:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a7c05368-908e-0249-5702-63a844f9dc71@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 03/23] hw: acpi: Export the
 RSDP build API
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IdUqHmRuhE3h

Hi,

On 2/11/18 10:20, Shannon Zhao wrote:
> Hi,
> 
> On 2018/11/1 18:22, Samuel Ortiz wrote:
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index f28a2faa53..0ed132b79b 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>>   }
>>   /* RSDP */
>> -static GArray *
>> +static void
>>   build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned 
>> xsdt_tbl_offset)
>>   {
>>       AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof 
>> *rsdp);
> 
> Why change this? It's not related to your patch purpose.

This patch updates include/hw/acpi/aml-build.h to export the 
build_rsdp() function.
Since this file includes this header, the orototype needs to match.

Regards,

Phil.

> 
> Thanks,
> Shannon
> 
