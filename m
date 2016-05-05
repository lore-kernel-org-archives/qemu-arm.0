Received: by 10.25.208.137 with SMTP id h131csp471967lfg;
        Wed, 4 May 2016 18:53:36 -0700 (PDT)
X-Received: by 10.28.29.195 with SMTP id d186mr545914wmd.27.1462413216202;
        Wed, 04 May 2016 18:53:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id lz8si8449318wjb.35.2016.05.04.18.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 18:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay8Tf-0002jz-3f
	for alex.bennee@linaro.org; Wed, 04 May 2016 21:53:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay8TW-0002Vn-Lj
	for qemu-arm@nongnu.org; Wed, 04 May 2016 21:53:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay8TL-0005wb-4W
	for qemu-arm@nongnu.org; Wed, 04 May 2016 21:53:05 -0400
Received: from m12-15.163.com ([220.181.12.15]:49110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay8TJ-0005Yt-1q; Wed, 04 May 2016 21:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=25G9b
	5zQfNyNdK/ncou2dOULCr3iFWxHgJzUIumbf9o=; b=Ta4UhcYk/MvhOrS+wIbHW
	qkDyEC5nF+I/keb6+tQACoLH11CBxHtbWGw0xHltUzYxd12BZMP8e9q6OXTaXb8V
	th/ynJSzrT4bTjNDvTD1/klq1CpiJkZpQb75J6XxBHwcjaVfVgqW86WTESQeh6Y1
	Wv5NnIYrx2Ny6nASMF3lV0=
Received: from [192.168.11.80] (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowADH0og5pypXf34vAg--.57688S2;
	Thu, 05 May 2016 09:51:54 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <572AA717.3090704@163.com>
Date: Thu, 5 May 2016 09:51:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ohPD0pwkZYfE8RmDjpu15vUeYNo+wn4PFo2f4ZEq3Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADH0og5pypXf34vAg--.57688S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW3CFWxWw1xAw4xAr1rCrg_yoWfWrgE9F
	W8Crs2gr47ZanxKFs3ZF45XryIv3y8Wr15G34vvryYqryrXr1YvFs3Kwn09w4xCws2yFZI
	9r1kJw4qy3sIvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnm-e5UUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hpgxlUL+otqVAAAs-
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
X-TUID: eZLZxcZiqc46



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
Yes, there is a mistake, i will resend soon.

