Received: by 10.25.208.137 with SMTP id h131csp493880lfg;
        Wed, 4 May 2016 20:14:02 -0700 (PDT)
X-Received: by 10.28.15.74 with SMTP id 71mr740476wmp.34.1462418042385;
        Wed, 04 May 2016 20:14:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j18si1042924wmd.71.2016.05.04.20.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9jV-00041b-58
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9jN-0003pG-92
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:13:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9jB-0004N3-Nq
	for qemu-arm@nongnu.org; Wed, 04 May 2016 23:13:31 -0400
Received: from m12-15.163.com ([220.181.12.15]:33961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9j9-0004Go-Vu; Wed, 04 May 2016 23:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=1bSPp
	pPqyEbOoAEypcMhS7U+eJECPUMfijhZ7t2Iw68=; b=EOySyfXl1Sw3LDYolxivT
	Hdwb3Fiamr+SwQaD469mH01R0CH092xIylw5FdmzPyf5MTiNgsf+4a1PeVFZmqDD
	r9bpfwJuaXLXBTniJF4yqkPINwxPFF3xxPDxm/hSqOV+OPmDrAI6zkh8tyRbrpgh
	IqUClS3qnmrF+tGLerkr5E=
Received: from [192.168.11.80] (unknown [118.187.28.42])
	by smtp11 (Coremail) with SMTP id D8CowADH0og3uipXnSE0Ag--.58515S2;
	Thu, 05 May 2016 11:12:55 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <572ABA15.2000204@163.com>
Date: Thu, 5 May 2016 11:12:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADH0og3uipXnSE0Ag--.58515S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW3CFWxWw1xAw4xAr1rCrg_yoWfCwbE9F
	W8Crs2grW7Zay3KFs7AF45XryIvay8Wr1rG34qvry5try5Xr1YvFWfKw1Y9w4UC392yFZ8
	ur1kJF4qv3sIvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeXtxPUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBBgxlUL8PlXdQABsS
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.15
Subject: Re: [Qemu-arm] [PATCH 0/5] QOM'ify hw/display devices
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle <michael@walle.cc>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7GCYxQVvXpGg



在 2016年05月04日 22:26, Peter Maydell 写道:
> On 24 March 2016 at 10:29, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> This patch set trys to QOM'ify hw/display files, see commit messages
>> for more details
>>
>> xiaoqiang zhao (5):
>>    hw/display: QOM'ify exynos4210_fimd.c
>>    hw/display: QOM'ify jazz_led.c
>>    hw/display: QOM'ify milkymist-tmu2.c
>>    hw/display: QOM'ify milkymist-vgafb.c
>>    hw/display: QOM'ify pl110.c
> Hi; I was going to review this series (apologies for taking so
> long!), but looking at my email archive and the patchwork server
> the patches in it seem a bit confused. I see seven patches, not five,
> with rather odd patch number indications:
>   1/5
>   2/5
>   3/6
>   4/5
>   5/6
>   5/5
>   6/6
>
> (and 5/5 and 6/6 seem to be the same). Could you resend the
> series with the correct patches in it, please?
>
> thanks
> -- PMM
I have resend patches, buf forget to cc to you, so I send you a separate 
copy.

