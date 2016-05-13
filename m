Received: by 10.25.208.137 with SMTP id h131csp208787lfg;
        Fri, 13 May 2016 07:36:19 -0700 (PDT)
X-Received: by 10.141.5.197 with SMTP id h188mr16479591qhd.97.1463150179827;
        Fri, 13 May 2016 07:36:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i13si1698102qke.208.2016.05.13.07.36.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 07:36:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1ECR-0007mS-Df
	for alex.bennee@linaro.org; Fri, 13 May 2016 10:36:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1EC4-0007Ia-Fr
	for qemu-devel@nongnu.org; Fri, 13 May 2016 10:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1EBy-00037V-Nv
	for qemu-devel@nongnu.org; Fri, 13 May 2016 10:35:55 -0400
Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233]:36828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1b1EBy-000376-Cg
	for qemu-devel@nongnu.org; Fri, 13 May 2016 10:35:50 -0400
Received: by mail-ig0-x233.google.com with SMTP id qe5so9066242igc.1
	for <qemu-devel@nongnu.org>; Fri, 13 May 2016 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=StprF7+BbmKOAYBjHwE61WNmIcqBDA5taZQWeToAoa0=;
	b=eKA6NzhZiEkq24BelqMGb+N6LST8Tj6tzRI78FvruJfS4n93wsTsuTuycHsvjG1Ujf
	X21zyo1WVQhqy90unLDpxlIr9ABFDYe+wNHIRZV7LBHUHRYIfrtxJH7NAZv/1L9rSL7b
	JDFnwUQzlzgdN7INqDR4lD8+ukRe7Ir/OLuC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=StprF7+BbmKOAYBjHwE61WNmIcqBDA5taZQWeToAoa0=;
	b=hXjmqwKUZkRiqOCcTbSE1Yx74BRqsInfuBcOzZbniJ/bCvxU/GYlRL9eAUpL64oPd6
	E/+yjQgQTGdChjmNQdv/sMHNVvNMZ9qIKq5S+9zWMDurDeOyeCEVo5/58VoyO7SNLtCv
	bHS2Eef3GVWFtUOlXsd4/glIp6gWXTdQ5ve2n3YSFVcIBQr3WT6QH3A/TdW9TyAZQZ8Z
	G6CsL2tdwvI/BOTvPKhBoZB3Sw7hD9sDkHyexCMiACifPI7rLAwlkMadQy9HZRjP+IFv
	NoISoa6BuD53M5cCMiWJ6tg9W9jPMaMR37M1t+ZpMQTqKgBeZGiDobt4PxOUvIU5hDtw
	Fu6Q==
X-Gm-Message-State: AOPr4FWbAgnVKycUoYNMMCq1AKieBHk1JPMRIzL2/JtdGaosW44VeTjfB7h1rQnuatF4LDcE
X-Received: by 10.50.187.133 with SMTP id fs5mr948835igc.61.1463150148878;
	Fri, 13 May 2016 07:35:48 -0700 (PDT)
Received: from [10.13.4.150] ([167.160.116.21])
	by smtp.gmail.com with ESMTPSA id
	o21sm1049403itc.18.2016.05.13.07.35.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 07:35:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<5732D667.3040105@huawei.com>
	<CAFEAcA_ptjAd-hLUmfVr=47KD9w8-cyZJuWHgSvkwZKfgU+jaw@mail.gmail.com>
	<573493A7.3030604@linaro.org>
	<CAFEAcA8BeETRW_Rm5HwGX6_y6sBez86p5-WYUZoPdin54KoTxw@mail.gmail.com>
	<57349AC9.5070407@linaro.org>
	<CAFEAcA9xXO6GA3MkLEprWNSUW8ayWZkT4xcY01ek6zOvm0GP3A@mail.gmail.com>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <5735E63B.7060500@linaro.org>
Date: Fri, 13 May 2016 22:35:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9xXO6GA3MkLEprWNSUW8ayWZkT4xcY01ek6zOvm0GP3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::233
Subject: Re: [Qemu-devel] [PATCH 00/23] GICv3 emulation
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YxaKhhKhfkQK

On 2016年05月12日 23:22, Peter Maydell wrote:
> On 12 May 2016 at 16:01, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> On 2016年05月12日 22:35, Peter Maydell wrote:
>>> Can you put the Image file somewhere I can download it, please?
>> I just upload it to
>> http://people.linaro.org/~shannon.zhao/ACPI_ARM/Image
> 
> OK, I can reproduce with that, and I think I know what this is.
> If we boot a "-bios" image then we don't apply the QEMU workaround
> for booting buggy Linux images which puts all the interrupts into
> Group 1, and it looks like a no-TZ-support UEFI doesn't
> configure the interrupt groups either. So Linux ends up hanging
> because the interrupt is group 0 but group 0 is disabled.
> 
> If you apply this patch to your guest kernel you should find
> it boots OK I think:
> https://lkml.org/lkml/2016/5/10/297
> 
Yeah, it boots OK with this patch.

> (I'm not sure why the images I was running worked OK; I must
> have been testing with an image that had that bugfix in it,
> though I could have sworn I wasn't.)
> 
> I don't really want to apply the QEMU workaround when we're
> booting firmware images as well as raw kernels, but on the
> other hand via-UEFI is kind of supposed to be the normal way
> to boot in future. Perhaps we should drop the QEMU workaround
> altogether, putting everybody on the same playing field...
> 
Maybe and if people want to use old kernels, they could use the stable
kernel after the kernel patch applied.

Thanks,
-- 
Shannon
