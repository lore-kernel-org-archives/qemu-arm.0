Received: by 10.25.208.211 with SMTP id h202csp1634115lfg;
        Tue, 23 Feb 2016 02:04:29 -0800 (PST)
X-Received: by 10.55.200.215 with SMTP id t84mr24830475qkl.55.1456221869064;
        Tue, 23 Feb 2016 02:04:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 47si22306858qga.86.2016.02.23.02.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 02:04:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:55610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9pU-0008Dq-Ju
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 05:04:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aY9pR-0008DX-VN
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aY9pO-0005Nc-JY
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:04:25 -0500
Received: from m12-18.163.com ([220.181.12.18]:60126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aY9pN-0005Mq-Hs; Tue, 23 Feb 2016 05:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=NFXa1
	oYaDza8uwi3I+3oZTBVB+83W+9ecgnwb4we3qA=; b=PMepWTPLHv7wfKsh9MaUY
	/tmM0H1EV8n1pgL4K7IH8tl30V/Sgrua5Gz/QrhQg8Ua33GAmrVfAZ1YRSo4f8Op
	bHMnJs7pih1FFiE3J2Q55gfUSxepy+Xd0njTQKFfQUXBdvJVtZwgwZ8XHcasf6ug
	09pdwvTXEiq9HiPB6Xy8cw=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEDpqEJeLsxWCAdNAA--.16483S2;
	Tue, 23 Feb 2016 18:03:11 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
	<56CBEA1C.4060900@163.com>
	<CAFEAcA86KRN5eS4p6frpP5XnxUE69nXB3aQ6=W3zKE+j1RV8nA@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56CC2E1E.2050705@163.com>
Date: Tue, 23 Feb 2016 18:02:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA86KRN5eS4p6frpP5XnxUE69nXB3aQ6=W3zKE+j1RV8nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowEDpqEJeLsxWCAdNAA--.16483S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW5GFWxGr1xWrW5AryrZwb_yoWkuFc_Z3
	yxAr18X34UJa13GFs3Ww429395J3WkXFn8Wr1jqFnrAr9rXw1UGa9rKr1Fka4F9FZ3KF12
	kr4IqrWUWr9rujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeqXdUUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEh8YxlZXwOLUCQAAst
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: P6LOpkzTLmMv



在 2016年02月23日 17:04, Peter Maydell 写道:
> On 23 February 2016 at 05:11, hitmoon <zxq_yx_007@163.com> wrote:
>> 在 2016年02月22日 19:03, Peter Maydell 写道:
>>> You'd basically need to have extra VMState structures for the
>>> devices themselves which just said "inside this M48txxISAState
>>> is an M48t59State", and "inside this M48txxSysBusState is a
>>> M48t59State" and referred to the existing vmstate for the
>>> M48t59State.
>> I add a new  structure for m48t59_isa as follows:
>>
>> static const VMStateDescription vmstate_m48t59_isa = {
>>      .name = "m48t59-isa",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT8(state.lock, M48txxISAState),
>>          VMSTATE_UINT16(state.addr, M48txxISAState),
>>          VMSTATE_VBUFFER_UINT32(state.buffer, M48txxISAState, 0, NULL, 0,
>> state.size),
>>          VMSTATE_END_OF_LIST()
>>      }
>> };
>>
>> is this correct?
> No. I said you needed to have a vmstate struct that said
> "inside this M48txxISAState is a M48t59State", and your
> suggested struct is not doing that.
>
> thanks
> -- PMM
I still can NOT understand your intention properly. Can you explain more 
clearly?

