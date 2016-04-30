Received: by 10.25.208.137 with SMTP id h131csp281470lfg;
        Sat, 30 Apr 2016 07:34:39 -0700 (PDT)
X-Received: by 10.140.228.68 with SMTP id y65mr24626123qhb.47.1462026879519;
        Sat, 30 Apr 2016 07:34:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si9898340qkc.8.2016.04.30.07.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Apr 2016 07:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1awVyQ-0001LQ-Tn
	for alex.bennee@linaro.org; Sat, 30 Apr 2016 10:34:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1awVxv-0000Kf-Jf
	for qemu-arm@nongnu.org; Sat, 30 Apr 2016 10:33:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1awVxj-0006ud-Vm
	for qemu-arm@nongnu.org; Sat, 30 Apr 2016 10:33:46 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:34564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1awVxi-0006nO-Mr
	for qemu-arm@nongnu.org; Sat, 30 Apr 2016 10:33:39 -0400
Received: by mail-pa0-x22d.google.com with SMTP id r5so57919486pag.1
	for <qemu-arm@nongnu.org>; Sat, 30 Apr 2016 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=tQpesT2lY1sgk8Q8SjnfquB3ty3F+NN+/YkRsXF1QPI=;
	b=ISsUFJd9Sn9Vq3FOOt/2mmNBjhPex3pD2f9aSWO+7hSk2UrB6DneFvOvbqMOxBty4/
	LqykszDs66zccYI0GDSa7sIGLgOL4Yc1j7n5z8kXh+NeV1Ty41vJn3gow0ypHZpTi3X4
	IlY/haYIVOlMc4S7oqXJ/421uGnZRWR6lSAkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=tQpesT2lY1sgk8Q8SjnfquB3ty3F+NN+/YkRsXF1QPI=;
	b=YAeu6J9UoqRbKzC8/nXa2qv8/x0TWgUuHQtEzgJhi8rukvXfe40ZrO/OaCl8c4pU8W
	Ef26g0Uc69WGKClNmts3YGmN7h+SZb4j6dw9UMRONJ4oVZ982gMlYBGVXb8y8Rw9sgLA
	pzvk3uMaXo/zFV7SUwAkzztr9KaRf/CBBI6I15k4wOjYucyvKaS9cl800DV4nEJf5/sw
	jUV4musx/OChoF6y9RtgJBiW7R49NB2WDYBqTvI7bFNAY7PICSTkbul8suGhRrfps4I0
	3M50tIQ/Uy/68y/0JeK225NOGpTF0U3w5A6KZxBEkCNG1lBWZekJ0lwsiac7D4ZL4SJN
	2p5w==
X-Gm-Message-State: AOPr4FVEAaHbaLfS1ADADsWGT8QKnk9GA728tqlih/V3XY4qw/h3Fepde9RASwO32M/Ecn/I
X-Received: by 10.66.136.41 with SMTP id px9mr37421104pab.80.1462026792875;
	Sat, 30 Apr 2016 07:33:12 -0700 (PDT)
Received: from [10.16.168.30] ([104.237.91.177])
	by smtp.gmail.com with ESMTPSA id
	e87sm31863306pfb.76.2016.04.30.07.33.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2016 07:33:11 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
References: <1461667229-9216-1-git-send-email-zhaoshenglong@huawei.com>
	<20160426112148.oyr4imw6ac2syxkv@hawk.localdomain>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <5724C217.5020305@linaro.org>
Date: Sat, 30 Apr 2016 22:32:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160426112148.oyr4imw6ac2syxkv@hawk.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 0/5] ARM: Add NUMA support
 for machine virt
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.daney@cavium.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l4LyYrU77kiU

On 2016年04月26日 19:21, Andrew Jones wrote:
> On Tue, Apr 26, 2016 at 06:40:24PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add NUMA support for machine virt. Tested successfully running a guest
>> > Linux kernel with the following patch applied:
>> > 
>> > - [PATCH v16 0/6] arm64, numa: Add numa support for arm64 platforms
>> > https://lkml.org/lkml/2016/4/8/571
>> > - [PATCH v5 00/14] ACPI NUMA support for ARM64
>> > https://lkml.org/lkml/2016/4/19/852
> This series looks good to me, but I guess we still need to wait
> for the DT spec[*] to be merged first. Hopefully that'll happen
> around the time that the 2.7 dev window opens.
> 
> Thanks,
> drew
> [*] https://lkml.org/lkml/2016/4/8/572
> 
Yes, and I see this patch has been queued by ARM64 Maintainer. So it's
very hopeful I think.

https://git.kernel.org/cgit/linux/kernel/git/arm64/linux.git/commit/?h=for-next/core&id=2bc4da1d2b4d828cb4e3a5593967556b1bd78898

Thanks,
-- 
Shannon
