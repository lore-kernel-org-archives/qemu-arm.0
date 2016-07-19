Received: by 10.25.21.156 with SMTP id 28csp1534287lfv;
        Tue, 19 Jul 2016 04:01:23 -0700 (PDT)
X-Received: by 10.37.11.88 with SMTP id 85mr13552353ybl.92.1468926083061;
        Tue, 19 Jul 2016 04:01:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u196si19243054qka.265.2016.07.19.04.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 04:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPSmA-0003yW-JK
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 07:01:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bPSm3-0003x3-57
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 07:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bPSm1-0001QC-UE
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 07:01:15 -0400
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:33408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bPSm1-0001Q4-PX; Tue, 19 Jul 2016 07:01:13 -0400
Received: by mail-oi0-x229.google.com with SMTP id j185so20089510oih.0;
	Tue, 19 Jul 2016 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zrVELMRbUxKhcgxeeVCLOqRlL4QVM5tIpyNDnts1Ew=;
	b=M6t1c9bGqLaViSdxj6J+kckXzO5fuZkwyrRwX59XzFgHMOeWD4pbhkZDcCnkoEo2mX
	1K9d9tObtEkJ3KwiKj4yIexg/DiQjX1glODmuvBYdyqKZ/rUT46n8yrV3GM80ZOFK3c0
	YACWVSEvgr4QU0foGq/sxRStLirbtW+NHPOYEJ9MNWjPLEYM8YFWhmUs1gtlkTRazc5K
	bYr36M1/amDoOfdyzpzkscIAf/Ty0SkSO01No4Rz9vZqzacmdXOZRPP2XsdD9y6L3ppS
	g5SXs0yVQQkZVVNX2d7HQhS1nfo2a9wByT1bbrXrZt29aE3chSjTrM8CQmb7EBa2cWBg
	4lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zrVELMRbUxKhcgxeeVCLOqRlL4QVM5tIpyNDnts1Ew=;
	b=eKt/R7L46k7bn8wtYuPJn/Z8geQKpes2BwBRXdWCpwTPkGVUIDcRJzLKY0mhIzp097
	UQlKg45r39fXSm9/mw+phq8zLT0GdMrzAji/Qjwn28Zv5W2YQF5dgnhnUp3zbFEV6mXy
	6C+XSdU9XyKSbMPEuNpSPPI2NSsGiIJ051P7FE+Sw/6ZguB1tp1n5AgAlGooHTXTs1ux
	S3Bss7oWgm8Vj9blcupV/WPg3976OHEQx8K3AEARh3ewRSfCYsOj4UMBDI8KLnQCsyUC
	oR+5uEl5jQhsGTrrs+vKNpJQLqUx9A4/duCMLW7VK98AYU3iFU+3fHMqiZBcn79YT4/E
	DOWA==
X-Gm-Message-State: ALyK8tKWrVZWcnWFQuZdBwKq/QhhAH0g2+NNGgkkwnOs0b8t461Knn4/Z3Izb+hNptvXcxbqxDqqqOS5SoDc3w==
X-Received: by 10.202.59.68 with SMTP id i65mr17149396oia.61.1468926072753;
	Tue, 19 Jul 2016 04:01:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.41.150 with HTTP; Tue, 19 Jul 2016 04:01:12 -0700 (PDT)
In-Reply-To: <CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
	<BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
	<CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 19 Jul 2016 16:31:12 +0530
Message-ID: <CALicx6tk2xkVf=Rz9KG-v-0xLb5=Tz1VidjuBDiqP0j-p+x=Pw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Subject: Re: [Qemu-arm] Fw:  [PATCH v2 0/6] Runtime pagesize computation
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
Cc: "prasun.kapoor" <prasun.kapoor@cavium.com>, patches@linaro.org,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDa2/HWka49S

Hi Peter,

  Any update on this patch set. Is it merged?

On Wed, Jun 29, 2016 at 12:30 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Wed, Jun 29, 2016 at 12:24 PM, Kumar, Vijaya <Vijaya.Kumar@cavium.com> wrote:
>>
>>
>>
>> ________________________________
>> From: Peter Maydell <peter.maydell@linaro.org>
>> Sent: Tuesday, June 28, 2016 1:46 PM
>> To: qemu-arm; QEMU Developers
>> Cc: Paolo Bonzini; Kumar, Vijaya; Patch Tracking
>> Subject: Re: [Qemu-arm] [PATCH v2 0/6] Runtime pagesize computation
>>
>> On 21 June 2016 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> This set of patches is a development based on the ones from Vijaya:
>>> the general idea is similar but I have tried to improve the interface
>>> for defining the page size a bit.  I've also tweaked patches 2 and 3
>>> to address code review comments.
>>
>>> NB: I have only very lightly tested these and haven't attempted
>>> to measure performance at all. There is an assert() in the
>>> definition of TARGET_PAGE_BITS which is good for making sure
>>> it isn't used before it's valid but not so good for speed.
>>
>> Vijaya, are you in a position to test this patchset for
>> performance? Presumably you have a test case benchmark you're
>> looking to improve here?
>
> I have tested the patches and the test case that I was trying was
> Live migration of Idle VM on arm64 platform.
> VM migrated is with 4 VCPUS and 8GB RAM running CentOS.
>
> With page bits 10 (1K), the live migration time is 5.8 sec
>
> capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
> zero-blocks: off compress: off events: off x-postcopy-ram: off
> Migration status: completed
> total time: 5857 milliseconds
> downtime: 102 milliseconds
> setup: 14 milliseconds
> transferred ram: 336081 kbytes
> throughput: 470.21 mbps
> remaining ram: 0 kbytes
> total ram: 8519872 kbytes
> duplicate: 8271539 pages
> skipped: 0 pages
> normal: 261340 pages
> normal bytes: 261340 kbytes
> dirty sync count: 3
>
> With page bits 12 (4K), live migration time is 2.9 sec
>
> capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
> zero-blocks: off compress: off events: off x-postcopy-ram: off
> Migration status: completed
> total time: 2974 milliseconds
> downtime: 76 milliseconds
> setup: 5 milliseconds
> transferred ram: 301327 kbytes
> throughput: 830.30 mbps
> remaining ram: 0 kbytes
> total ram: 8519872 kbytes
> duplicate: 2062398 pages
> skipped: 0 pages
> normal: 70662 pages
> normal bytes: 282648 kbytes
> dirty sync count: 3
>
> Regards
> Vijay
>>
>> thanks
>> -- PMM
