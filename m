Received: by 10.28.4.212 with SMTP id 203csp2891362wme;
        Mon, 16 Apr 2018 10:18:32 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48pptx4UAxXOsiFM/xBJy5+OH81Bq4sx3aXzPOeXf4X8O2gJt9t6pCwpxLXDt9fRCQkJwoV
X-Received: by 2002:a25:1146:: with SMTP id 67-v6mr11621078ybr.294.1523899112540;
        Mon, 16 Apr 2018 10:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523899112; cv=none;
        d=google.com; s=arc-20160816;
        b=w1fb5IGAxvmi097ypiJ+CEalqnDEXVqlOkMxZOBS1mc7gzrpuujycQ1IdtP5rqphCp
         UcFOxvwMnFe4hGHoEDm13mXkhGEgz9g08UV2MMIwk2ckHfbWu7TZr+1POyrBKGK/jw9W
         jB1eM0b+3CHtGU15Li8v1dSOIgbW2QriP6RTDxpnzDyc2Rm4Q0pCtTSgBCg4hSf6twMk
         JIie9/NeIgn/8XaQY6fj3Z/nNSwpANDBDBi9s+SrtjGWae7in3iYc0Dv7eoZ+8x9A8P0
         fZMdaF57bMOAQ3Htp4afLTaM0lVBs/RiQw/IyBRM6+u8JxA7ryUt/Hz+f06fDrLQXNjM
         /IbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xigXdTAK9xOdL7PL45rGoOOvCIe7uMA/YN1Ooqff9p4=;
        b=BK5eFPsiKxKV2ze5gg81GIAzGhfE/ZkLguyQMpuYEhxCRpVY/vxXUslixuWutP537C
         l3QbFKfNaev8E3sLcsBcQITrcJiFFuKdMrrcppqVgfAnYJnBPVf5U3xELwrJEEzo5+XB
         RU2dOtVfdib9rw4c3R3luC3m0nHXKx5wUyKNPHOdR/gxgfzCyUh+yXUuBkVnCvVzAOMo
         m72Y+ESAiz05dcQ9PZ2cZXpJ6OLRj8IB4XQOCJ1ZcsZPtKMA1Csl+TNWwFHcGcycqfQI
         v5eCbkkl6Sypi2t3eQfDR43yHjvs/jHAnrAOFPmq1kTm3HlpDKec5Qv4kO2/D3CBNsO9
         49kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lzgm2ik3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si3453509qkd.101.2018.04.16.10.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 10:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lzgm2ik3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f87lv-00071s-TJ
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 13:18:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87ld-0006zG-Nx
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f87lc-0001ga-Nr
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:18:13 -0400
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:45205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f87lc-0001gA-I1
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:18:12 -0400
Received: by mail-oi0-x232.google.com with SMTP id j10-v6so1141518oii.12
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xigXdTAK9xOdL7PL45rGoOOvCIe7uMA/YN1Ooqff9p4=;
	b=Lzgm2ik3YHZExnWk8AUA32rzrt21RRovv6Q4jv2tbknbAAoX0Zm3sOPOLCoLkn35Ce
	XppisQhp2Ej0W9w2aNUiPOAUNHxAxQcOofyQspz3/nMk7e3wJofzUZiX4RYHBZ+2kd5B
	7+HHcecaSThHQhvVX2L50zIVRXfq9uo8KIAuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xigXdTAK9xOdL7PL45rGoOOvCIe7uMA/YN1Ooqff9p4=;
	b=rftlRMic+SgPZHP7VGwQ7iSqtAuyDIQfIEyAHHy6qRRypvFM7KL9FvbZcspi9t6iOn
	pOxaZD8S/gI1t5Fg1iRocnxXHZFmiKbOtVeyHQv9Gn13KuY3CgQmkz/20rDUnKndwUj9
	f6KYsU00d7WgoQKqVqVWzrWJ7W76BSTQklC+6wRgSXDx1Vye3jv8FVdF37Xs+ZeoKGjx
	o9LGEuG+TR23ZaSnvAHYXYPIdwq5EFhj5LSPxGmZTDBBhCFggTeJBx6Gop/YKS8UxrbE
	xGaOXoHxn2OTHEROP3U9Zk+TxJLBKSiZATfIzNq0F4imbxE3v8Ad/7o8SQhkHKbpWI6t
	lSLQ==
X-Gm-Message-State: ALQs6tBccUBZHB8/0KblV3FIz6K8bapmHK7RxOIeKiAp67pUoCokFh6T
	XLyHhUwGjScoi1o53uYiS6PFlPaaT8Ii1HHTYOsdzXMQ
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr14488461oig.164.1523899091854; 
	Mon, 16 Apr 2018 10:18:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 10:17:51
	-0700 (PDT)
In-Reply-To: <CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-4-git-send-email-imammedo@redhat.com>
	<CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 18:17:51 +0100
Message-ID: <CAFEAcA_nM4VanwwPKB3bpL6=wvk=u-bh1b+O3ahNFMpRnchcsg@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::232
Subject: Re: [Qemu-arm] [PATCH for-2.13 3/4] arm: always start from
 first_cpu when registering loader cpu reset callback
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bvny5L/q4AMY

On 12 April 2018 at 19:29, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
>> if arm_load_kernel() were passed non first_cpu, QEMU would end up
>> with partially set do_cpu_reset() callback leaving some CPUs without it.
>>
>> Make sure that do_cpu_reset() is registered for all CPUs by enumerating
>> CPUs from first_cpu.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>>  hw/arm/boot.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 2f464ca..2591fee 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>>       * actually loading a kernel, the handler is also responsible for
>>       * arranging that we start it correctly.
>>       */
>> -    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
>> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
>>          qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
>>      }
>>  }
>
> Definitely a bug fix, so:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I think though that in at least some cases we'll still mishandle
> being passed anything other than first_cpu as the CPU pointer,
> because in do_cpu_reset() we do some checks for "do this if
> cs == first_cpu", on the assumption that first_cpu is the
> primary CPU that we're booting. We should instead I suppose
> be checking against the CPU pointer we're given as the
> arm_load_kernel() argument (which I think do_cpu_reset() can
> get at via info->load_kernel_notifier.cpu).
>
> We should probably analyse which boards actually pass anything
> other than first_cpu -- I suspect it will end up just being
> the xilinx board which has both A and R profile cores...

I did the check, and in fact all of our boards always pass the
first CPU as the boot CPU. Xilinx comes the closest, in that
the SoC object has a boot-cpu property to pick a boot CPU, but
since none of our boards set that it defaults to the first CPU.

Since this patch isn't very related to the rest of the series
I've just applied it to target-arm.next ready for 2.13 (with
a note in the commit message that in practice it isn't a behaviour
change). Let me know if that's awkward for you and you'd prefer
to keep it in this series, in which case I'll drop it.

thanks
-- PMM
