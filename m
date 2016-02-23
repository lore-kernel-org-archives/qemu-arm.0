Received: by 10.25.208.211 with SMTP id h202csp1536141lfg;
        Mon, 22 Feb 2016 21:13:57 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr39232175qkb.85.1456204437499;
        Mon, 22 Feb 2016 21:13:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si32542881qkb.94.2016.02.22.21.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 21:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:53931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY5IK-0003Km-Aq
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 00:13:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aY5II-0003Kg-Th
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 00:13:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aY5ID-0007nB-Tw
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 00:13:54 -0500
Received: from m12-12.163.com ([220.181.12.12]:60368)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aY5ID-0007mb-Ed; Tue, 23 Feb 2016 00:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=+WDBe
	kM/Eqyc1WPqaWuRF+zkKSIU/5DCpp8n+z/op8Y=; b=UacSF9rj7C69LN+A7qqDj
	SKcm+guh+hHtQZu/nj9Mi0T0RXnRj7Yv99UZQwkwTwAormqD2C22+vDb3A1gkMvs
	Do7g0XaPcOQ6VgjVBY23fKdUEu+qTAHQ12jBC3SMvChDHcboTGcJCaeT6lmNQCLd
	bNc5EzLV0H1l5+pSUcIgpE=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowACXR9Nc6stWJzXQBw--.12997S2;
	Tue, 23 Feb 2016 13:13:01 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56CBEA1C.4060900@163.com>
Date: Tue, 23 Feb 2016 13:11:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACXR9Nc6stWJzXQBw--.12997S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18JF48tr13JF13AF43Wrg_yoW8AF18pF
	98G3WxCr4qqwn7ur4I9rW8Za9YkF4DGry29ryUK34ayF15trn8tFyvyay7X393G34S9w47
	Za1jy3sxC3yUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jduc_UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMx0YxlXletKIxwAAsn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
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
X-TUID: PAGrwSVXUnQ+


在 2016年02月22日 19:03, Peter Maydell 写道:
> On 22 February 2016 at 10:28, hitmoon <zxq_yx_007@163.com> wrote:
>> 在 2016年02月22日 17:24, Peter Maydell 写道:
>>> Just noticed this won't work as it is -- the vmstate
>>> struct is for the M48t59State*, but the ISA and
>>> Sysbus wrappers have their own structs which are
>>> what the dc->vmsd will be wanting to operate on.
>>> You'd need extra VMState structs I think and
>>> somebody who knows migration better than me to say
>>> whether that is a migration compat break.
>> It seems that the old code also use the same vmstate structure. Maybe it's a
>> common structure which will not be used at the same time.
> The old code passes vmstate_register() a pointer to the
> M48t59State, and so the offsets in the vmstate line up correctly
> with the fields it wants to access. If you use dc->vmsd then the
> pointer that is (implicitly) used is the pointer to the device
> structure itself, which is not the same address as the
> M48t59State embedded inside that struct.
>
> You'd basically need to have extra VMState structures for the
> devices themselves which just said "inside this M48txxISAState
> is an M48t59State", and "inside this M48txxSysBusState is a
> M48t59State" and referred to the existing vmstate for the
> M48t59State.
>
> thanks
> -- PMM

I add a new  structure for m48t59_isa as follows:

static const VMStateDescription vmstate_m48t59_isa = {
     .name = "m48t59-isa",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(state.lock, M48txxISAState),
         VMSTATE_UINT16(state.addr, M48txxISAState),
         VMSTATE_VBUFFER_UINT32(state.buffer, M48txxISAState, 0, NULL, 
0, state.size),
         VMSTATE_END_OF_LIST()
     }
};

is this correct?

