Received: by 10.25.134.130 with SMTP id i124csp2037194lfd;
        Mon, 11 Jan 2016 07:38:37 -0800 (PST)
X-Received: by 10.55.73.6 with SMTP id w6mr88458830qka.82.1452526717732;
        Mon, 11 Jan 2016 07:38:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c110si74367872qga.45.2016.01.11.07.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 07:38:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIeYH-0005Qc-9F
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 10:38:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aIeTm-0003pv-1q
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 10:33:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aIeTi-00062p-RI
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 10:33:57 -0500
Received: from mail-yk0-x22d.google.com ([2607:f8b0:4002:c07::22d]:36817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xumeng1901@gmail.com>) id 1aIeTi-00062i-N6
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 10:33:54 -0500
Received: by mail-yk0-x22d.google.com with SMTP id v14so341004330ykd.3
	for <qemu-arm@nongnu.org>; Mon, 11 Jan 2016 07:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=oSB4q5Zz2I84tMk8a/sGIUitB02tznPmFV5FvjYTjWY=;
	b=XSTJ7pL5KOcrALK5nbYkUfqm5CkDIbeyZzWWCqXrjJl3d7b9Y8nVZsgnEheSRcyICx
	4Nng2AksVejMZ4Xs9k5/sJysdeTQYw3nXGZxhJL51BeuPs2oOBlYT7jHvGEyNDRjex8t
	G4sUmVkpU6+TzYnE4MWtNI0hq8Hc7vFFVEaCjjRhAKOLPAj4QUTkHA8LteJlEYnCVLl/
	aZZWKiHZpCaqMHn1Geyio+OJEXO+VFCfJIX1Gj8M0A/oZSnB0Nevaga4aQoVhfr51Fdp
	i/ina/IQohWa9Gb1YcWE1hREabqata6Ouknuuu0brduVhWWA6Wpz5b5XvEIPuWYUiA9Y
	yDNQ==
X-Received: by 10.129.147.132 with SMTP id k126mr12667415ywg.206.1452526434206;
	Mon, 11 Jan 2016 07:33:54 -0800 (PST)
Received: from [143.215.130.72] (meng.gtisc.gatech.edu. [143.215.130.72])
	by smtp.googlemail.com with ESMTPSA id
	b131sm74415686ywc.50.2016.01.11.07.33.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 07:33:53 -0800 (PST)
To: Pavel Fedin <p.fedin@samsung.com>, qemu-arm@nongnu.org
References: <8536B0ED-6417-4F65-99F7-1D49F950E24B@gmail.com>
	<052c01d14c47$20860ca0$619225e0$@samsung.com>
From: Meng Xu <xumeng1901@gmail.com>
Message-ID: <5693CB61.4040502@gmail.com>
Date: Mon, 11 Jan 2016 10:33:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <052c01d14c47$20860ca0$619225e0$@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c07::22d
Subject: Re: [Qemu-arm] aarch64 ivshmem issues
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HIkUQY1IX0D3

Hi Pavel,

Thanks! That's right, ivshmem works just fine on ARM64 once I switch to 
the latest kernel and I can see the PCI bridge and devices now.

Thank you for the help,
Meng

On 01/11/2016 03:07 AM, Pavel Fedin wrote:
>   Hello!
>
>> I am using the ivshmem device to create shared memory between an x86_64 host and aarch64
>> guest. The guest has ubuntu server 14.04 installed with kernel version 3.13.0. I wrote a kernel
>> driver to drive the ivshmem device (as a pci driver) however, the driver was never registered:
>   There should be no problem with ivshmem itself on ARM64. Last year we did some tests with it, and it worked fine out of the box.
>   Since you are saying that "the driver was never registered", then, perhaps, something is wrong with your guest kernel config. For the start, check whether PCI subsystem and PCI generic host is enabled. Mainline kernels older than 4.3 do not support generic PCI host controller on ARM64, therefore you have no PCI bus. If your distro has older kernel, it is likely to suffer from this problem. Check 'lspci' output on your guest.
>
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
>
>

