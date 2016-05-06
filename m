Received: by 10.25.208.137 with SMTP id h131csp221042lfg;
        Fri, 6 May 2016 04:16:37 -0700 (PDT)
X-Received: by 10.194.168.194 with SMTP id zy2mr20562298wjb.143.1462533396998;
        Fri, 06 May 2016 04:16:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si17836898wjg.17.2016.05.06.04.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydk2-00086I-MA
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:16:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydjt-0007sn-Uq
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydje-0005nz-EN
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:16:04 -0400
Received: from m12-11.163.com ([220.181.12.11]:58918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aydjc-0005ho-JN; Fri, 06 May 2016 07:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=gbZ/G
	Z781REtxZwWr92Kcx/MiNSeZyDmCUtnIoGuCrU=; b=KhHT1GViAvupWYJUw5J5B
	cUI1zliQdfi49qTqeu7w4EFhx4DD7McwPnKcTpwgBKXyjFFFAuP4XN0OUOSfYzD8
	/Hzrri7R4gF0xaeNiUXW+2tPk1CSgwOCXT4LOYet7w+SWuHrH/O1+ZOHs3VvIYNF
	9cxZ1hVTGVUsg59bCswVkM=
Received: from [192.168.11.80] (unknown [118.187.28.42])
	by smtp7 (Coremail) with SMTP id C8CowAAnLCTGfCxXeXhCCw--.36883S2;
	Fri, 06 May 2016 19:15:19 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
	<1462532375-29264-3-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-rZL0S5kNFf0=--Xp2y9uJ8xPhGC4NmjRbuBkGs-8Y3A@mail.gmail.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <572C7CA6.5040700@163.com>
Date: Fri, 6 May 2016 19:14:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-rZL0S5kNFf0=--Xp2y9uJ8xPhGC4NmjRbuBkGs-8Y3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAAnLCTGfCxXeXhCCw--.36883S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr13KFW7CF47Aw48GFW3KFg_yoWfXrg_uF
	yvkayftr4xXFWxKF1rCF15u34jgayjvr43ZF4xtr15t345Jw1kXa1DKFsav340gFsrGFya
	kryDJrWfAw12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnivtPUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAhhxlUL8ReRjQAAsb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: Re: [Qemu-arm] [PATCH v2 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ACqTlWjKAt+j



在 2016年05月06日 19:05, Peter Maydell 写道:
> On 6 May 2016 at 11:59, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
>> * Drop the old SysBus init function and use instance_init
>> * Move graphic_console_init into realize stage
>>
>> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
>> ---
>>   hw/display/jazz_led.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
> I already reviewed this patch (and some others in this
> series). Please *don't* resend patches without including any
> Reviewed-by: tags you got for them, otherwise people won't
> know if they need to look at them again, and information
> about whether code has been reviewed gets lost.
> For more info, see:
> http://wiki.qemu.org/Contribute/SubmitAPatch#Proper_use_of_Reviewed-by:_tags_can_aid_review
>
> thanks
> -- PMM
Yes, I will.
Thank you peter ;-)

