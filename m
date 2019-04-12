Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7860800wrx;
        Thu, 11 Apr 2019 18:54:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFQjPR8Vn/6euOSG1/CbNMC+eEnAnhaklKgV7wAKutOSSKhcEat6w/6iT2wUtO+erhzHHY
X-Received: by 2002:a7b:c14c:: with SMTP id z12mr8470780wmi.138.1555034057972;
        Thu, 11 Apr 2019 18:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555034057; cv=none;
        d=google.com; s=arc-20160816;
        b=glDc+7xP5PSMpb1oW+h2pZK8vf1QS+MMptLqaQwu0UjhiAW78TNGpZ7t8xMnPHGtde
         VRJOrcg/gz0z5VTvQmYKZoNtK9LWhg8IyKNYNBdv0hFLwgj8+XCaUkFmLqeSVpcLnelJ
         Ch8Hy1YdZnKfGC8iL8ByDSyb3gLVotKqzrYYKohtYqIxnm5Dnp6E8HOlMD681Jnfjy1I
         9gOE60vxAVpLLkNlUa0KmZRzZ13zYPEd1LGyf2FSoOyA2phSdWD0KZyQL5DTocQvOk49
         xhEeHzVODXyGcRe/5d2EXsrY7IzJ+AgssErCnyUC/Klr5ojd5WQUlbH1+TNImUwXiUyx
         72MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=mD7ceQ0yz0h1aa+Tu8PMS2NKL0tkaHm2R54JLjJb41k=;
        b=GtDoOvDXlRv90EhGm1HVBG1K8O0X6pW/zKrq31DXHwvYQZbElvA2dcbeNQsvVg3wrf
         9wvnMZLz74uVMTlVceBxJ9IJyKrZPmCQ2EyV5B8qdEW8SH7qT+ZeYnsYpIal+nLIShQ8
         CacXdvouHzWz+wEBEnBW7WzEpE7FTiTCFZpV5RXuSwUBPqo76ouQs76n5i4zrqtQNkoK
         dUVPt4HYMoHpJi+aAVA/3vvbhYORX9IKPDqFQt5umdU0YwA0gk6eeT4ZHSW2wSqxr+qC
         0TnytmfIPdH2+wckFkZNUoqqS1Gp0sAiL1w9x1vfKtn9kTL5etMxHgnIDXdEycu6UPaT
         gohg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si26083871wrp.368.2019.04.11.18.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 18:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hElOT-0001JM-1V
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 21:54:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hElOD-0001J5-4x
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 21:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hElOB-0004ss-PJ
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 21:54:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54764 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1hElOB-0004jC-Aq; Thu, 11 Apr 2019 21:53:59 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9FFD48AE2E9CB24F1990;
	Fri, 12 Apr 2019 09:53:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.32) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.408.0; Fri, 12 Apr 2019
	09:53:40 +0800
To: Kevin Wolf <kwolf@redhat.com>
References: <87imw5fv45.fsf@dusky.pond.sub.org>
	<abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com>
	<8736n9eb4s.fsf@dusky.pond.sub.org>
	<bf2decd3-b3cb-08eb-3449-b66f023b084a@huawei.com>
	<c57135ae-41a9-ed7b-976b-bf8fe43596a2@redhat.com>
	<b107e0c0-1c4c-3f0f-eb78-8929c315ce28@huawei.com>
	<a8144a1f-364e-cea5-b0a7-05342bdab936@redhat.com>
	<87bm1fiuo8.fsf@dusky.pond.sub.org>
	<20190409082852.GB6610@localhost.localdomain>
	<c03c51a7-1bb0-b05b-9027-2364ab00517c@huawei.com>
	<20190411122246.GB5694@linux.fritz.box>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <0c6c32b7-46f8-cf80-b7a6-1b48995b84e4@huawei.com>
Date: Fri, 12 Apr 2019 09:52:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
	Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20190411122246.GB5694@linux.fritz.box>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] hw/arm/virt: use variable
 size of flash device to save memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com,
	Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WvmRq2Go9kk9

On 2019/4/11 20:22, Kevin Wolf wrote:
> Okay, so your problem is that blk_pread() writes to the whole buffer,
> writing explicit zeroes for unallocated parts of the image, while you
> would like to leave those parts of the buffer untouched so that we don't
> actually allocate the memory, but can just use the shared zero page.
> 
> If you just want to read the non-zero parts of the image, that can be
> done by using a loop that calls bdrv_block_status() and only reads from
> the image if the BDRV_BLOCK_ZERO bit is clear.
> 
> Would this solve your problem?

Sounds good! What if guest tried to read/write the zero parts?

-- 

Thanks,
Xiang


