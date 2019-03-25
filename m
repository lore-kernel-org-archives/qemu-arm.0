Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3905273wrx;
        Mon, 25 Mar 2019 07:09:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSSS8doZTFS+p+MwFSxn/A5w0Wq+xlRtY/Woz0sHmoj6p2zEBVZqrnh1RmHG8neZkdbaZS
X-Received: by 2002:a81:3a57:: with SMTP id h84mr20558994ywa.284.1553522943164;
        Mon, 25 Mar 2019 07:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553522943; cv=none;
        d=google.com; s=arc-20160816;
        b=NJGROXOT87LnZCnT2k47ohbIKfRCZ01j8nPSsLQ9UAyj8xcKOXCoYDMDP0IbXG1IKf
         5XwxnESpukm7LR0oIOUo6ExdBqOpTbU1mKvkWmIG9SrDoNlKyiS+3WfLv2ppzfTk9WxQ
         CX1oQiDLfJWfE6aLwNTdMgfZDxsTYDJgylwKDt0pyh0GLOJy18IlrhoArSIMVCc4Xbb2
         AL55BDbRE/vKY6s8KfeaY60VWJQ0ryVgb0QwiZm1PBULfYLsC4UJlR2LBcdWAELrcG1F
         94XRdLg1FMrtyLP/Cu285xNI3nA8gzSXaaG70vqc3Wq3hI/GoNPuoZ7VoORkCvjFQ/uC
         A0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=xoPB6reVlEiQ7m1rcJOyiXiPhgO3VGLJ+KFXPvFACkQ=;
        b=WQUHB7NrccE2i2YW+ipH7cNBxlvbpi6nezRBk+XGjl3xQXhiVVwhGmxVjpBmf26WY5
         0XPqytqYfTitK6TljqhB7MrJKsVRHhW4AdI+n8vTYvaYWsycBX4GOzn1agF+CrV05oGa
         0pB5oa1uc13aYYFZDfaFTqLndoMSyglQFdFd54bxx+0/ZpKiwxSLltVq/zDHgy0wvr7N
         30rNWoICr+NlhVuQ9tuSTxHKxbxDIy0in227DokkqOlT05ePQavda5h+8s802ipr1N/U
         okzfDja0YxKgzURJ9Vf0tzdtQh32F8p875HwMKGXcPmJNFiiEUJkOgMA+KHJAwfkL/lO
         UTbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i75si9326800ybg.342.2019.03.25.07.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 07:09:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8QHe-0006GO-Lc
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 10:09:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1h8QCZ-0002hb-Uv
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 10:03:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1h8QCW-0005nX-Mj
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 10:03:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:46908 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1h8QCW-0005mt-A1; Mon, 25 Mar 2019 10:03:44 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id CC49FB4FD67F49CCCFB4;
	Mon, 25 Mar 2019 22:03:39 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.32) by DGGEMS403-HUB.china.huawei.com
	(10.3.19.203) with Microsoft SMTP Server id 14.3.408.0; Mon, 25 Mar 2019
	22:03:30 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
From: Zheng Xiang <zhengxiang9@huawei.com>
Message-ID: <19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
Date: Mon, 25 Mar 2019 22:03:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
	Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-arm] [RFC PATCH] hw/arm/virt: use variable size of flash
 device to save memory
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vsvA8n042yJ8

Hi Peter,

Thanks for your reply!

On 2019/3/25 21:11, Peter Maydell wrote:
> On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
>> using persistent UEFI variables on QEMU. Actually we only use a very
>> small part of the memory while the rest significant large part of
>> memory is wasted.
>>
>> This patch creates and maps a variable size of flash device instead of
>> a mandatory 64MB one to save memory.
>>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>
>> This patch might be insufficient since it also needs to modify the flash size
>> in ACPI and DTB.
>>
>> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
>> in size when using -pflash.
> 
> I don't think we should do this. The board should in general
> create the same hardware visible to the guest, not change
> it based on subtle things like the size of the image files.
> 
> The reason why the flash images must be 64MB in size
> when using -pflash is that they are the backing store
> for a writable device. Suppose you have 1MB of data in your
> backing image that you pass to QEMU and then the guest writes
> to the last block of the flash device. The new data
> written by the guest to the end of the device has to be
> stored somewhere, so the file has to be large enough
> to cover the whole of the flash area.
> 

Is there any way to support config or limit the size that both
guest and QEMU are visible?

The original QEMU_EFI.fd has only 2M, but we need to stuff it
to 64M with 62M unused data. It will consume a large amount of
memory when running multiple VM simultaneously.


-- 

Thanks,
Xiang


