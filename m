Received: by 10.25.21.96 with SMTP id l93csp378404lfi;
        Thu, 16 Jun 2016 08:43:05 -0700 (PDT)
X-Received: by 10.55.119.66 with SMTP id s63mr5773391qkc.169.1466091785024;
        Thu, 16 Jun 2016 08:43:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 40si23383381qgf.121.2016.06.16.08.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 08:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDZRg-0001xY-CI
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 11:43:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYJj-0004L3-EJ
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 10:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYJc-0006Hs-8t
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 10:30:46 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYJc-0006HI-4N
	for qemu-devel@nongnu.org; Thu, 16 Jun 2016 10:30:40 -0400
Received: by mail-vk0-x22d.google.com with SMTP id d185so75767510vkg.0
	for <qemu-devel@nongnu.org>; Thu, 16 Jun 2016 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v44FwpjFs515VWzRpP46XQTcbjL7IpT7Nu/bvNEiDx4=;
	b=T6WB3mOcYZXIai3hlCLBfnSOJGKdFNCcbj8v32FwHr/HuLRy0JOiqyD3bXdCnv/IkB
	LOVc8oWS4tIEQDwQCzku8cK8T2cIbmJCjSEFPlen12S0o/B9o/uzQInG1NgKWz5M5tBM
	J3iE9MQW0dF/67RcHOsiy+UFqY6b4t2HT0OgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v44FwpjFs515VWzRpP46XQTcbjL7IpT7Nu/bvNEiDx4=;
	b=LZ00AQcMxhfKIGxuQ2BIkE7eXMz53YFBURMQHhhZ99EuAOvCkG+UL0QdrxL7EwmYzO
	UYOYlE4U0ntObj5/PwuS6ubbYt4xvC1HC7nw7ODCIPKtFIAaojJJJnSuHpoAuRDfSanZ
	6rv4Mdzj9kvUsQmOEGqlUepM7ZhlJ6NE416WlZYUIIwfittdZ0NoQDSS1JCR2ru6Hw0K
	h15U4aU1MIxeUq5NbfKuCPvu+IHavCsbd/LjDDBppbMVI1fFprIwZ7oqBgNG0UBGLDrD
	OswtbfdutZv9OAnqEHgBNlzqI856beqlYMBp+rvF85y9E85+kfja1juFTRBy7fIR3xiX
	anIQ==
X-Gm-Message-State: ALyK8tI1LmjjZd3C2jXheOGOyZo+o4aIYo4oeS68GUEVxL/HfPVKPAvLuDdtelyjsanN+R7z1bGnegfoFZMUXzYD
X-Received: by 10.176.0.238 with SMTP id 101mr1902602uaj.107.1466087439619;
	Thu, 16 Jun 2016 07:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 16 Jun 2016 07:30:20 -0700 (PDT)
In-Reply-To: <20160615085200.hcqq3nkzug5eicus@hawk.localdomain>
References: <1465960955-17388-1-git-send-email-zhaoshenglong@huawei.com>
	<20160615085200.hcqq3nkzug5eicus@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jun 2016 15:30:20 +0100
Message-ID: <CAFEAcA-wv7ccid5D6CxyRUSC1hg8TGXYrP0gRZOPR8AuUyi-9A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH] ACPI: ARM: Present GIC version in MADT
 table
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3wDR2sotOY/f

On 15 June 2016 at 09:52, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jun 15, 2016 at 11:22:35AM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> In ACPI 5.1 Errata, it adds GIC version in GIC distributor structure.
>> This is useful for guest kernel to identify which version GIC hardware
>> is. Update GIC distributor structure and present GIC version in MADT
>> table.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

>
> AFAICT, Linux is actually fine with version=0 (as before this patch).
> One way or another it has already determined that the gic is either v3
> or v4, and then just proceeds. That said, it does seem like the right
> thing to do to set it
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Applied to target-arm.next, thanks.

-- PMM
