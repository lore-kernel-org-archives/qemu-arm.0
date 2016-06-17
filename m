Received: by 10.25.21.96 with SMTP id l93csp186884lfi;
        Fri, 17 Jun 2016 03:14:26 -0700 (PDT)
X-Received: by 10.200.34.206 with SMTP id g14mr1267495qta.56.1466158466858;
        Fri, 17 Jun 2016 03:14:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k94si30827443qte.26.2016.06.17.03.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDqnC-0003Kf-7o
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDqn8-0003Ik-QB
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDqn6-0007LI-Pk
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:14:21 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bDqn6-0007L3-L8; Fri, 17 Jun 2016 06:14:20 -0400
Received: by mail-oi0-x241.google.com with SMTP id u201so12790840oie.2;
	Fri, 17 Jun 2016 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KES4NHaGYexj9S661au65S+fSklF376vPC0F8b3K1kk=;
	b=ecaGIdVCrIoeU/E7nkG3tTE2o87kV5bdTvgDHQK8JrkX0I0ZHSwuB6tX1is4PXLLxK
	FNzu6bRtcYc2tnYrpj9JFDPlC525GftvuCczAZj24kw8ClqNlxGOGUfMGAqdqaQSVfYB
	irUvVZOvrlhsKlWA5E7ENEaVWxvYjQaqkGJV3mn5jrBKZZ8fRCtuxRRceZmmbvptj1bL
	MMUqpVSGUdqJwX/kx+8Yht8yaDZOXV3nMIxegJ2ltw54uheDkFPPFoOd10buHN3K3eWD
	QGcYy2tzpYCletE+Zi0NjTDJ7e42gokBTYAFetaj/mP0JMTUE80imCWAvfxGRkb389Ot
	53eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KES4NHaGYexj9S661au65S+fSklF376vPC0F8b3K1kk=;
	b=GA9GK/o3JY8lXoNwOCDuVsCXWj2yDtQ3hXXnw0JdUQ9jqfuN7u8y6tm0mTekPZqBo1
	PdYT9VpGBIV8QoZi2r9TCzfR8VXBOSMZFKwgzTp9VpP6lcuoiEzc/uwlpB7A0QQXMQ0A
	EsNt/RsnpLCRqg2EVajYC1We4KCdqnQVEQszycPRov/07BsPzfbiSNrbRFBWOBLH8uJi
	ONrKEPOcxl8pBvYqqLJjfnd4P8Nhkg+Yjj5BDXRDFvP/79UmPAP7/GVsDL/JP5rKpPD+
	wFQoQfZsgF86Jr89qm8eirZpAa7ffhvHf06xOUqFDQ0UxIGoEvo+GONMEtK5dS6jE5lH
	5JZQ==
X-Gm-Message-State: ALyK8tKjlqQqUFGVHm/oGiUOJ/gvZinbsAddGRgzj2Jhf+OSmj8HvZ7fM6pn5l5UuprFSRt8KodqoAOX5lJDkA==
X-Received: by 10.202.84.138 with SMTP id i132mr589518oib.75.1466158459800;
	Fri, 17 Jun 2016 03:14:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Fri, 17 Jun 2016 03:14:19 -0700 (PDT)
In-Reply-To: <fe539d79-cac4-27e3-589f-66290ae8f243@redhat.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
	<fe539d79-cac4-27e3-589f-66290ae8f243@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 17 Jun 2016 15:44:19 +0530
Message-ID: <CALicx6svRE+cjeehkftpudox8=bvTqvPFyAx=whOhAFb4+WSWg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/4] exec.c: Remove static allocation
 of sub_section of sub_page
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
	Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OPJTYRCj+6OG

Hi Paolo,

On Mon, Jun 13, 2016 at 3:22 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 13/06/2016 11:08, vijayak@caviumnetworks.com wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>>
>> Allocate sub_section dynamically. Remove dependency
>> on TARGET_PAGE_SIZE to make run-time page size detection
>> for arm platforms.
>>
>> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
>> ---
>>  exec.c |    5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/exec.c b/exec.c
>> index a9d465b..e803a41 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -154,7 +154,7 @@ typedef struct subpage_t {
>>      MemoryRegion iomem;
>>      AddressSpace *as;
>>      hwaddr base;
>> -    uint16_t sub_section[TARGET_PAGE_SIZE];
>> +    uint16_t *sub_section;
>
> Please make this a flexible array member instead, so that you can avoid
> the extra pointer dereference.

What do you mean by flexible array member?. please give more info.
