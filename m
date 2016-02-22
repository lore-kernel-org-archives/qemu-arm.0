Received: by 10.25.208.211 with SMTP id h202csp1080790lfg;
        Mon, 22 Feb 2016 01:23:04 -0800 (PST)
X-Received: by 10.140.232.15 with SMTP id d15mr35391062qhc.87.1456132984268;
        Mon, 22 Feb 2016 01:23:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76si9851468qki.38.2016.02.22.01.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 01:23:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:47960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXmhr-000587-EK
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 04:23:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXmhp-00057e-IK
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 04:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXmhk-0007Tx-Im
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 04:23:01 -0500
Received: from m12-12.163.com ([220.181.12.12]:53836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXmhk-0007S2-5W; Mon, 22 Feb 2016 04:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=TbOLp
	P8tAVPfvVUUtqNTyvi108MK4u5BXrD/UOMTe+U=; b=YdzkKyvRAs80aH3Io4fVa
	sxRe3Acn/hYNqs5HM4Rbl20Brn6QuvflPtsBluKakP3dM8X1YlJLxP8fVcgnP/Rt
	rCOIwc3YLwbzBfnoi9sTzwk8sU/kaXmIJUUf7x5l53qlLW7nx3rUF+xtCpDIox1k
	qDoh7PadrOw5UZ1iWfx6F8=
Received: from [192.168.31.184] (unknown [101.254.142.162])
	by smtp8 (Coremail) with SMTP id DMCowADnSPAX08pWSXWQBw--.8720S2;
	Mon, 22 Feb 2016 17:21:29 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
	<1456110933-5457-10-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-iTcWTX5eVpe9NWb5MqYVcxUajRCnzQVFY=raBq-an4w@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56CAD2D7.2000009@163.com>
Date: Mon, 22 Feb 2016 17:20:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iTcWTX5eVpe9NWb5MqYVcxUajRCnzQVFY=raBq-an4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowADnSPAX08pWSXWQBw--.8720S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4Utw4ktFy5uFyktw48tFb_yoW3trX_uF
	yxAas3Jr1qgFykKF98Ar4fZry0kFWkXrsxXFZFqrWDJ3WfJr98uw4DGrWUAr1rCw4xCFy8
	GrnYqryfCw1akjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnAOz7UUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEhoXxlZXwM++TQAAsk
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Maksim Kozlov <m.kozlov@samsung.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 9/9] hw/timer: QOM'ify tusb6010
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
X-TUID: i0XcLksvDqjn


在 2016年02月22日 17:18, Peter Maydell 写道:
> On 22 February 2016 at 03:15, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> Move majority of old SysBus init's work the into instance_init.
>>
>> Note:
>> musb_init must be called in SysBus's init, otherwise it will
>> break "make check" with error message as follows:
>>
>> qom/object.c:1576:object_get_canonical_path_component: assertion failed: (obj->parent != NULL)
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> ---
>>   hw/timer/tusb6010.c | 23 ++++++++++++++++-------
>>   1 file changed, 16 insertions(+), 7 deletions(-)
> Devices should either be instance_init + realize, or
> sysbus-init. This patch would make this device be a mix
> of both. You should just drop this patch until musb has
> been properly QOMified.
>
> thanks
> -- PMM
Ok.

