Received: by 10.182.158.201 with SMTP id ww9csp537102obb;
        Fri, 20 Nov 2015 07:11:56 -0800 (PST)
X-Received: by 10.25.39.19 with SMTP id n19mr5049483lfn.156.1448032316386;
        Fri, 20 Nov 2015 07:11:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si5416lfx.24.2015.11.20.07.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 07:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:47978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZznLu-0006z2-O2
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 10:11:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZznL9-00067r-KC
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZznL5-0005Vu-E7
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:11:07 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:38669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZznL5-0005Vk-58
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:11:03 -0500
Received: by wmec201 with SMTP id c201so24950294wme.1
	for <qemu-devel@nongnu.org>; Fri, 20 Nov 2015 07:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=P0O9Ee2s02VbOr2XDbEJdFRX895yvDMAElzaUHhF6lw=;
	b=pWF2QjRrf6DnVHzbWpgMr+q58KSZV5PsjZ7+zRWHeBXfFlE7muXUqNxuQaT3a/eNGB
	BO91ZzLmduN5gO/xtvpn9GFJ/jam0BBGVcpwzpZWK62iABblYDvirhAgCdGPMbCoKgdr
	HD5YrYYGN75DvZ++SLjatqlHMX3iIkd+tyY6Fx1UTlDNjJQAusi5gJ5Ndyp7COx+EUfO
	E0ms/7tu5I/gRooopKbjvp1ZkELoeaGQo1ZzB/hlfpQAUDssfZ6ZbeRYGHgxJ2RwR299
	xQ/L12wp/GLHdwUHIoCL21rRuf+yLXHHSS3i8M6PIgTF6c/qE0R8vNTt4VJniwkO2ikU
	t+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=P0O9Ee2s02VbOr2XDbEJdFRX895yvDMAElzaUHhF6lw=;
	b=h1YjBMoGDCtv5C38DEpmSe5izJ/IjaG97pmo5dcMD2w+ppPBHyR60z1GNaQOnTda7n
	5UeeLuUq+aDPrsEnRhR0am06AE7ChiFbILKacm45FQ5+LIkJbnoCj4ul5iNCnS6ZE8Uc
	5+FHvZIyAIJJ1jinNQoV6NvOIty7Fba1qqrxotdE0pLS68JWIK0Dg89r3j8wAAVzxH23
	JNs/zfF1LBjrZjpWLpl+5QbMZriczvzFMKHFAZ421vo2WWFngrti6y0K6RpdQQ767K9+
	E40ditn+OlrOqYzTmj9Sz+3E8oAwiciS2EVJOxXEAMsETHeu6Z3xlSDOCpQWDUE2ecyQ
	3b9A==
X-Gm-Message-State: ALoCoQlNMGi3uRY89unzvBk1+MCIks+lkwyUrLETNgVbGPpr1lBf17+U+boRwE7XDfZt97pJGbAy
X-Received: by 10.28.172.129 with SMTP id v123mr2958107wme.47.1448032262238;
	Fri, 20 Nov 2015 07:11:02 -0800 (PST)
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	w141sm3099641wmw.24.2015.11.20.07.11.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 07:11:01 -0800 (PST)
To: Alex Williamson <alex.williamson@redhat.com>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447976660.4697.210.camel@redhat.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <564F3800.1090507@linaro.org>
Date: Fri, 20 Nov 2015 16:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447976660.4697.210.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22f
Cc: b.reynal@virtualopensystems.com, peter.maydell@linaro.org,
	eric.auger@st.com, patches@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, thomas.lendacky@amd.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 0/6] AMD XGBE KVM platform passthrough
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bwtRfuHOdpTj

Hi Alex,
On 11/20/2015 12:44 AM, Alex Williamson wrote:
> On Thu, 2015-11-19 at 15:22 +0000, Eric Auger wrote:
>> I am resending this RFC from Oct 12, after kernel 4.4-rc1 and
>> QEMU 2.5-rc1, hoping things have calmed down a little bit.
>>
>> This RFC allows to set up AMD XGBE passthrough. This was tested on AMD
>> Seattle.
>>
>> The first upstreamed device supporting KVM platform passthrough was the
>> Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
>> much more complex device tree node. Generating the device tree node for
>> the guest is the challenging and controversary part of this series.
>>
>> - First There are 2 device tree node formats:
>> one where XGBE and PHY are described in separate nodes and another one
>> that combines both description in a single node (only supported by 4.2
>> onwards kernels). Only the combined description is supported for passthrough,
>> meaning the host must be >= 4.2 and must feature a device tree with a combined
>> description. The guest will also be exposed with a combined description,
>> meaning only >= 4.2 guest are supported. It is not planned to support
>> separate node representation since assignment of the PHY is less
>> straigtforward.
>>
>> - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
>> The code checks those clocks are fixed to make sure they cannot be
>> switched off at some point after the native driver gets unbound.
>>
>> - there are many property values to populate on guest side. Most of them
>> cannot be hardcoded. That series proposes a way to parse the host device
>> tree blob and retrieve host values to feed guest representation. Current
>> approach relies on dtc binary availability plus libfdt usage.
>> Other alternatives were discussed in:
>> http://www.spinics.net/lists/kvm-arm/msg16648.html.
>>
>> - Currently host booted with ACPI is not supported.
> 
> I won't pretend to know all the politics in the ARM space, but doesn't
> this last bullet sort of imply that this is dead-on-arrival code?  Maybe
> not in the embedded space, but certainly in the server space, I thought
> ACPI was declared the winner.  Thanks,

When the code was written, no ACPI description was available yet
including IOMMU. Now I think there is a specification that would enable
the description of the system (IORT/DSDT tables) and I will investigate
whether we have one ready for the HW I am using and mainlined.

Nethertheless we had a discussion end of Sept with Marc Zyngier,
Christoffer, Will Deacon and other people working in the ARM ecosystem
and we decided starting with FDT host description was a reasonable
choice at this moment. To be fully honest Peter also thought we should
consider the ACPI case from day 0. But I think nobody -AFAIK - has an
ideal solution about how to address ACPI/DT in a unified way and people
seem to be against introducing IOCTL API.

Among solutions I foresee the 1st one below was considered the simplest
and chosen:
1) rely on external applications to decode/parse dt/ACPI table
2) build a unified fs representation for dt/ACPI
3) create unified IOCTL API to retrieve dt/ACPI info (attempted by VOSYS
but at VFIO level)

The idea of this series is
- to rely on external dtc binary to build the blob from
/sys/firmware/devicetree/base
- introduce some helpers using libfdt that manipulate the host dt blob
- use those helpers in sysbus-fdt.c to build the clock and xgbe nodes
for the guest

Assuming we have an ACPI description I guess we would/could use a
similar approach to parse/decode the ACPI table from QEMU (relying on
acpidump, acpixtract, iasl, ../.. combination). So the current proposal
brings a solution for embedded world and can be easily reused for other
devices. Next step is to propose a similar approach for ACPI. Now I
would like to make sure the open approach is accepted (with external
dependency on dtc binary as we would have ext dependency on ACPI utilities).

Best Regards

Eric


> 
> Alex
> 

