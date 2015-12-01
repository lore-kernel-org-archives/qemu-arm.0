Received: by 10.182.158.201 with SMTP id ww9csp2391884obb;
        Tue, 1 Dec 2015 07:25:29 -0800 (PST)
X-Received: by 10.140.249.131 with SMTP id u125mr41678356qhc.53.1448983529456;
        Tue, 01 Dec 2015 07:25:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w200si30342276qhb.78.2015.12.01.07.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 07:25:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:53228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3mo5-0001ve-3U
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 10:25:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a3mo2-0001tH-Fw
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 10:25:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a3mnz-0004xd-5T
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 10:25:26 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38082)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1a3mny-0004xI-VE
	for qemu-arm@nongnu.org; Tue, 01 Dec 2015 10:25:23 -0500
Received: by wmec201 with SMTP id c201so18510518wme.1
	for <qemu-arm@nongnu.org>; Tue, 01 Dec 2015 07:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=uMKqd9HO1wgx0xK5Ta9hpv99/FcY20N/iGq5TW4qSX4=;
	b=hpFrCQ8WsOJK9LrrrPszaDUGkajVDaBCwfL4W3EY5597uQgxuRMVlyd0wABIMxs0VH
	2gGJD5MXObFhkgHLIV2duvDY4X+Mqlc5T5KpCb2N6La37ErcuWbDiGKB+jR56wSKHqr8
	O0X1YdaOIYqVvykn9ItmKUNszRjQd9/oSPi1xpv0m5dK4Cf4oq/5fru0dhiyTH/LXxOI
	BIDHPhF9Wf8OA777hwBNSO22xwjYwz+0q351lXqqpKm0EGtMm1ddzvPDckrkZZqzqk/b
	FvCEgLLIhbqQ9u0elKv0E9qtU8iktos3ZZ/oxSkIdvHF82XsCMHSo/UU7tlK2txI8zVc
	AMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=uMKqd9HO1wgx0xK5Ta9hpv99/FcY20N/iGq5TW4qSX4=;
	b=iRDfL7RJEAuw6i+WXONlawOisMQorFyCx2pez4NP4j5EZCLw6gPqem9MCfoCU2lKpl
	T7Zb0JmyumJQWkqb73/DD3Ltd6tPP4MKuDi6Ii4cznFNhjsnA3dRDa/RA8ujUgrTlZoq
	/giLgSDTUUKQnbMHs7VVgKe5NeAZo3Ms1talxjqEkl0t6l1Au+qLaGXTB3pldrsIk6tu
	kmXS66Ty4brHzy6tqV/91Ld6z6dY0Ss/uo12yrEbMLYwOJKirUzSBHQakf4I8O7lqho5
	pUn9/NSL7qf+aAfk+iCt8O/j5gB+msI5JBF8b1Dyj8Tj9fLpj4dFTcgkMl5gjBrIPK5L
	wF2A==
X-Gm-Message-State: ALoCoQnQvc+WsQIuG/DeSvd6fGMxTs3/ey0LjM8R8RcvXJsS3GLXHf14hm1adC5/Ja+cBU87fZSe
X-Received: by 10.194.186.196 with SMTP id fm4mr91046786wjc.152.1448983521994; 
	Tue, 01 Dec 2015 07:25:21 -0800 (PST)
Received: from [10.13.19.134] ([88.150.142.50])
	by smtp.googlemail.com with ESMTPSA id
	jh4sm51870179wjb.33.2015.12.01.07.25.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 07:25:21 -0800 (PST)
Message-ID: <565DBBCE.6080705@linaro.org>
Date: Tue, 01 Dec 2015 23:25:02 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Pavel Fedin <p.fedin@samsung.com>, 
	'Peter Maydell' <peter.maydell@linaro.org>,
	'Igor Mammedov' <imammedo@redhat.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
	<20151201142146.2bcda69f@nial.brq.redhat.com>
	<CAFEAcA9Mkc31fkr1F-Q3_B4at0kHFZTG7fM3NfJ-FU0VqTbuxQ@mail.gmail.com>
	<01d201d12c47$5a77dd00$0f679700$@samsung.com>
In-Reply-To: <01d201d12c47$5a77dd00$0f679700$@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: 'G Gregory' <graeme.gregory@linaro.org>,
	"'Michael S. Tsirkin'" <mst@redhat.com>,
	"'Huangpeng \(Peter\)'" <peter.huangpeng@huawei.com>,
	'QEMU Developers' <qemu-devel@nongnu.org>,
	'qemu-arm' <qemu-arm@nongnu.org>, 'Shannon Zhao' <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO
	controller
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
X-TUID: QrlEqpxR6u+H



On 2015/12/1 22:48, Pavel Fedin wrote:
>   Hello!
>
>>>> ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
>>>> powerdown, hotplug evnets. Add a GPIO controller in machine virt,
>>> s/evnets/events/
>>>
>>>> to support powerdown, maybe can be used for cpu hotplug. And
>>>> here we use pl061.
>
>   Sorry for late jumping in, but this was the first message Cc'ed to me.
>   With these devices virt machine IMHO goes farther and farther away from its initial goal: be a minimalistic virtual box, which ensures maximum possible compatibility and portability.
>   virt machine already supports poweroff using PSCI interface. Why we need to add more hardware? Can't ACPI deal with PSCI?
Hi Pavel,

IIUC, the poweroff using PSCI interface is the guest *internal* 
poweroff, that is you type "poweroff" inside guest. But this patch set 
is going to introduce a way to support *external* poweroff, like the 
power button on our desktop. This is something like you push a button to 
shutdown the guest.

>   To tell the truth, i dislike ACPI + EFI thing at all. It looks like cramming PC-oriented firmware into architecture for which it was never meant to be written. Too much overcomplications, we drop already established things and reinvent a (triangular) wheel, but what's the purpose? Is it being done only because vendors want obscure proprietary firmware instead of old good u-boot?
>
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
>

-- 
Shannon
