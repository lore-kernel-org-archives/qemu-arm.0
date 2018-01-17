Received: by 10.28.173.206 with SMTP id w197csp5470939wme;
        Wed, 17 Jan 2018 08:34:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBou8zJm3GrvgWDTQFm39kxWYtBquP1PdOOYCsdzQGbvcOwFEbC0fz4XDm8tbFr/eDMICbgjt
X-Received: by 10.129.146.207 with SMTP id j198mr3110406ywg.372.1516206881652;
        Wed, 17 Jan 2018 08:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516206881; cv=none;
        d=google.com; s=arc-20160816;
        b=IdicLwkJKaMS+CuiGsIkRYYJwVY83/STwTb76F1DYFpPig0egoJeJBoR/IXklZOL8b
         aRyCfzfrOawWrxE+qdxJvUu9VM5c0GMo6SnherIJuzCRbin3bhTWnnImP2mwpGogshEf
         i7OQ7GTMKUfdIodubmxg66LSwP7mPMD1xip96npwEchmb8nJY63Ex5+v1cE3LmLdp6KJ
         gDHe5xDrbizaLJaNZMAsmuBYvtNmV30A5055P+nBGF0i0a531mwnnNlSCsVNmODr+SXv
         T4lhePIadtPZGE6oOHL0JPQAuepIR1Pec7VwnlPHCiXevEH+5R1p9Vu47QZsVqH35hTP
         3ozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X3+dsHLP+gkjMYHW4pbisXUH9RbP5CVPT8nr7nNtQCM=;
        b=CiJo5cg9A9vqgTqG/1dpEEsyaIChAip1QAQzSZLRF2JP29jyUN5l1u3O9u3ryfdgo6
         3MFZfFjhEk37zv7T+kZSGb2fT+vj4S+88pEV/RzJA5r+Y0CH4dWgM68O+E3Bv8brVTrl
         r414PzVKj9zq2lYGnHo22O6QixPvxROYA4pDmpCskwkupHYSGO1pQWikWn1qZFhaNX3/
         FnjpoelBOc4RJrhV2f6GBYkMN/KZ/GonJi3TsgRbo4RPqg/MjLJav6tMpr5ieaOLmcSP
         6hyzWB0Jqa5wDW2awze0yDccOra9NU5+JLPeiD4hBmR8bbDfQLkqUD+1SqJEdQsc0W9I
         zZjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si1217805ywg.506.2018.01.17.08.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 08:34:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebqfh-0006qU-2I
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 11:34:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1ebqM8-0005um-SP
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1ebqM5-0003Hd-Lp
	for qemu-devel@nongnu.org; Wed, 17 Jan 2018 11:14:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1ebqLw-0003Ec-9d; Wed, 17 Jan 2018 11:14:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BF4F776E6;
	Wed, 17 Jan 2018 16:14:10 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4478F80D83;
	Wed, 17 Jan 2018 16:13:04 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-10-andrew.smirnov@gmail.com>
	<CAFEAcA-hEgWp58nte89Vs6nZnp4wA6_f8-Vaovm2hiJe9SWwHQ@mail.gmail.com>
	<b9661e65-5fb2-46b5-b082-6e768afff7bc@zoho.com>
	<CAFEAcA8Ei8vgOspvy9hBbwQya+gjDq3V8o2NbV8cxvCsw6kycQ@mail.gmail.com>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <63726933-be7f-3dd7-9e14-fa02863cfb75@redhat.com>
Date: Wed, 17 Jan 2018 18:12:51 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Ei8vgOspvy9hBbwQya+gjDq3V8o2NbV8cxvCsw6kycQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 17 Jan 2018 16:14:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 09/14] pci: Add support for Designware
 IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7W9Omxw9V1u1

On 17/01/2018 17:35, Peter Maydell wrote:
> On 17 January 2018 at 15:23, Marcel Apfelbaum <marcel.apfelbaum@zoho.com> wrote:
>>
>> On 16/01/2018 16:34, Peter Maydell wrote:
>>> On 16 January 2018 at 01:37, Andrey Smirnov <andrew.smirnov@gmail.com>
>>> I'm not familiar enough with our PCI code to be able to review
>>> this, I'm afraid. MST and Marcel are our PCI subsystem maintainers --
>>> could one of you have a look at whether this seems to be a correct
>>> implementation of a pcie host controller ?
>>
>>
>> Sadly PCI Host bridges do not have a standard, each HW vendor
>> can do pretty much what they want.
>>
>> That being said, if Andrey can point me to the PCI spec for the Designware
>> PCI host bridge and what parts they implemented for it I can have a look,
>> sure.
> 
> I'm not so worried about whether it's implementing the spec for
> the hardware (I trust Andrey has done enough testing for that
> side of things), but whether the code seems to be structured
> the way we expect a QEMU pcie host controller to be structured,
> is using the right APIs, and so on.
> 

Got it, I'll review in a week.

Thanks,
Marcel

> thanks
> -- PMM
> 

