Received: by 10.28.91.67 with SMTP id p64csp2055697wmb;
        Thu, 1 Mar 2018 08:56:40 -0800 (PST)
X-Google-Smtp-Source: AG47ELvexRrcLNvsSSa4RQaHN8nwD3OkAcxLLY8u28NOegqKyW65YOPlMZJgWUXPEz9H/MjSampI
X-Received: by 10.129.136.194 with SMTP id y185mr1720283ywf.202.1519923400259;
        Thu, 01 Mar 2018 08:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519923400; cv=none;
        d=google.com; s=arc-20160816;
        b=YS/JrUATcz/NmhN7/ssq1WmHC1dzxaLskBC3W7J0++1zzTysqrPyTQ0sKvl662D8Db
         QPJQX4ESztAPXy2lfXGJauEaWCVaQwftQWXweEjYEUKGdcawIeiqnzS1wZ+JKLifSrv+
         5rGWCKura5eojPryhGC5wBxvmgrTrlcK/NT8R7phknjHy6EpaFdmxb63AMyCFQEUUJA+
         hhShJdK/JR8moz18NG6ibmvIhXSRvGdTGUCsJo7W0mXoNS2U83X7sLbnGPMj69upRxhK
         4yo94TNWO4XrlBCCTlVPorm26tjj27kc+cYOjqzBcKQpf3fdDDAxkXZt1lr6n2V/dei2
         spdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=GJz2m8Lzvv4F5K3twiMjTQDVhvMAyq/kSr2htVwsBXc=;
        b=ketN2QkLO1QVoh33y1SIvfLp2PsNoqWvIl9cTz2VgwchQ0a7RA+Z1DHjOnpEHwSwH1
         KQWlBjReY0dAq0Qf8kTT4hw8lcS80sHi4yUEzUjZfuwuiynwUVyQBm2+4yXu7Tq0YL2z
         Ao/NlLDGu/emHyAU8KtHZZNvAZzFtq5BT7QWWknOcYX5RfSXLMBALDxkYpLdwl28fxa8
         w42b8usvKa5tRH7lMmOpdfgKr7h/8ASNdjLT/xpxGWm6DLQ1YiMl+0BNs3b+OohMlNle
         VvawINTkAI95wcWIMVq3IZnuYh2Ktm8+RhVpHFkfCjGuTCb+kI9AzH00not4IderxRdo
         BicA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dxk0q6bD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1-v6si723852ybk.721.2018.03.01.08.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dxk0q6bD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erRVX-0006YS-K5
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:56:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erRMo-0007WT-E6
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erRMk-00027G-CC
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:47:38 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1erRMk-00026f-5P; Thu, 01 Mar 2018 11:47:34 -0500
Received: by mail-wm0-x243.google.com with SMTP id 188so13374553wme.1;
	Thu, 01 Mar 2018 08:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GJz2m8Lzvv4F5K3twiMjTQDVhvMAyq/kSr2htVwsBXc=;
	b=Dxk0q6bDO99UC3qvgb9UeLt74R8FS12IFRYh9gAyfOR6R8H8L5x33P+wO1AmZ6/kgF
	nKJaTpp6HHK/U4H0+sK/v0cmFxtSf4BaoB42OkaLA3R5xx7e489WwRyvLwstn3XW+IX8
	pZz4qvpFH2H/SxJtcoj/T4u2YPO8C2D8VZ9nLLpOsFet7g3pmzs5KxMzxye5hdERj7vL
	7qnKTAxBBe7YaAGm5oXh2me/1ax5FbMsGQPx/Urde+NtYnFkA+g1uX8R98b9m0+iKhmI
	Q0MPM10CqZW8GrPhpSIfZcnYbztRmLUsZUWd8aM9y/0v6LWhcxE9ezUTswLGuXla69Tb
	nYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=GJz2m8Lzvv4F5K3twiMjTQDVhvMAyq/kSr2htVwsBXc=;
	b=aGTxEjcTbzjnpPZA2sgH5Yl5AbiQvft/+FugymoFd/DPdfh2QYidugkICpmhu2XtU1
	dXycht2kBwCGmXFQsJfjuUQt/AfOWQcADN49tXRuIMexRWGU3JA7pinN+PUmnfogDY6x
	6MjG00hgU7Nyble4WfaQguIwnVcj91ISUSpKFC783AtCL+e5fOUxZlkR48hAEIxZ9h3m
	H1rmFXJCRHedtJCPOpbt7uc9HZM99Cfstu4sTGEAANIxD7MK3RXfJBLPeHdlt4EnrAoX
	bvBaDO7voLVd52o5flSTaOK5mvcIOWBVqO196H7iY4z+uACCQOpqqiMcRXpbwq1/D46Y
	e5ag==
X-Gm-Message-State: AElRT7HCo0CiklyW+CmCzS59T5k2GeMdMBhSt7b1xK6eaIFEGy3AVMSD
	iw97cWL3GkuRKxrOys4B6ZdspHZN
X-Received: by 10.28.65.213 with SMTP id o204mr2572918wma.97.1519922852488;
	Thu, 01 Mar 2018 08:47:32 -0800 (PST)
Received: from [192.168.1.19] (LFbn-MON-1-648-178.w2-4.abo.wanadoo.fr.
	[2.4.22.178]) by smtp.gmail.com with ESMTPSA id
	h197sm4046783wmd.17.2018.03.01.08.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 08:47:31 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1519883168-22092-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9Q9+sK5S1BREuCAVp4J5tU_mexDZU9nBuett3W7bQp-Q@mail.gmail.com>
	<8459fa75-826e-b42b-a002-e45b309d9e4b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <182bb517-2fe2-f993-68bd-6b53d753738f@amsat.org>
Date: Thu, 1 Mar 2018 13:47:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8459fa75-826e-b42b-a002-e45b309d9e4b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm: Use more CONFIG
 switches to decide which object files should be linked
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQUlGZM/n6P+

Hi Thomas,

On 03/01/2018 11:13 AM, Thomas Huth wrote:
> On 01.03.2018 14:03, Peter Maydell wrote:
>> On 1 March 2018 at 05:46, Thomas Huth <thuth@redhat.com> wrote:
>>> A lot of ARM object files are linked into the executable unconditionally,
>>> even though we have corresponding CONFIG switches like CONFIG_PXA2XX or
>>> CONFIG_OMAP. We should make sure to use these switches in the Makefile so
>>> that the users can disable certain unwanted boards and devices more easily.
>>> Also introduce the new switch CONFIG_STRONGARM to be able to disable the
>>> "Collie" machine if it is not wanted.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  default-configs/arm-softmmu.mak |  2 ++
>>>  hw/arm/Makefile.objs            | 26 +++++++++++++++++---------
>>>  2 files changed, 19 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index ca34cf4..43f382a 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -133,3 +133,5 @@ CONFIG_GPIO_KEY=y
>>>  CONFIG_MSF2=y
>>>  CONFIG_FW_CFG_DMA=y
>>>  CONFIG_XILINX_AXI=y
>>> +
>>> +CONFIG_STRONGARM=y
>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>>> index 1c896ba..5e1e0a9 100644
>>> --- a/hw/arm/Makefile.objs
>>> +++ b/hw/arm/Makefile.objs
>>> @@ -1,15 +1,23 @@
>>> -obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
>>> -obj-$(CONFIG_DIGIC) += digic_boards.o
>>> -obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
>>> -obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
>>> -obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>>> +obj-y += boot.o virt.o sysbus-fdt.o
>>>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>>> -obj-y += netduino2.o
>>> -obj-y += sysbus-fdt.o
>>> +obj-$(CONFIG_ARM_V7M) += highbank.o netduino2.o vexpress.o
>>
>> This is definitely wrong -- highbank and vexpress are not V7M
>> platforms.
> 
> Ooops, sorry, seems like I mixed up V7M with v7-A :-(
> 
>> Netduino2 is a v7M platform, but I don't think we
>> should be making it conditional on ARM_V7M -- we have per-board
>> configs for other boards, so you'd have a CONFIG_NETDUINO2 here
>> if you wanted it.
> 
> OK, I think I'll simply introduce proper config switches for all three
> boards.
> 
>>> +obj-$(CONFIG_ASPEED_SOC) += integratorcp.o musicpal.o versatilepb.o
>>
>> This is wrong too -- none of these are aspeed-based devices.
> 
> *facepalm* ... looks like I grep'ed that wrong (I was searching for
> "arm926" IIRC) ... I'll add proper config switches for those boards, too.

I went on this path some time ago, but stopped it after hearing, while
distributor are interested in shorten the binary size (reduce code
coverage for security...), the upstream project prefer to always compile
most of his code (easier to test).

Except show few missing includes, this is true there is not big win
using those CONFIG selectors, since very few devices are not compiled
(all ARM cores are always compiled).

I pushed the WIP series in case you find it useful:
https://github.com/philmd/qemu/commits/armeb-softmmu-wip

Regards,

Phil.
