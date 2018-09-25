Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp720481wrt;
        Tue, 25 Sep 2018 07:08:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60sJWSJFv7SG5REA4MBIB8/CkceV/I3QKDWl+88Bb04en1LexAN2DAoZP0Tsd8+lbs07eh7
X-Received: by 2002:a37:c24c:: with SMTP id j12-v6mr842952qkm.14.1537884515212;
        Tue, 25 Sep 2018 07:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537884515; cv=none;
        d=google.com; s=arc-20160816;
        b=0Nl8BsoiKaSl54ukQq/o1iLyxAKyWnwVGhbOKTf4K2YDwkz4BgaIfhdeE4S4nGY9Y/
         pbx0L/WC/uPH9EZHGoeFeVyX4I/+LZytxxoE7aufLKHB0WxmgSNLu7xplIQgdYITZ9RA
         uxky9naBOmnMAj6rAMN4IAerPTmUef08iJCyZq8E6+2wdKwJYii8f6bsuNfHPSL69Twq
         FLEE4MptLbzfF+kz7knmrkL8qWuARMfdzK8vHFn4cg7nyq7WH+W+IRiQlqf3eVLtCQDa
         W0cBGtaCmCUhnYz7ntAhlCXwIezWbFF3xx0U1keX9wIjse6I9Tii6ADjVQZCn4ZqbJ77
         8P4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=vVKRcjoToIJHyoN5hATCsts4MJUqaZDzaQDwfTGV1Q8=;
        b=c7sE47PipqV0lD6vB3e5COCVJuPZFEf6+AQ4zaKW8NrdfvI46nWCia1gwWVmwYsbJS
         aDXmNYq54yijk0DZ1c5dqYLLIBJ5knQRUyJWfWhRGBXaVPRdTYvmcStxBxHLg1+L1xve
         zfURdiNlGo/OWIOOJoyC1c/wB7UtGRTh/kxAF2kH8D9M8r1xiFeTyEV/yJTRjzZjammn
         NnrJScbePeCvr9nKA7SFoAG/+Yen+mgK4wtqdfenjLB26aaDU42xwciNfZJKQaLuUOYA
         ne161SYhNc2WO0Ff7av+iCLk75whon6zj/h03uvsNN+W2AheCqdQGxt7cO1skQrXR/hv
         A9Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si634812qvs.188.2018.09.25.07.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4o0w-0004dr-9o
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:08:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4nkf-0005iR-Mn
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 09:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g4nkb-0007id-Lb
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 09:51:45 -0400
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:35067)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g4nkb-0007bS-DW
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 09:51:41 -0400
Received: from player688.ha.ovh.net (unknown [10.109.143.220])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 8728F2CCC7
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 15:51:34 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n0.emea.ibm.com
	[195.212.29.162]) (Authenticated sender: postmaster@kaod.org)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 562C3200B8;
	Tue, 25 Sep 2018 15:51:23 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-7-clg@kaod.org>
	<CAFEAcA_z5qYObmkHoRTUzLTYD_ihom5gXtGgjhsD4mPsDb9GmA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce0706a2-9ffa-553b-a3b8-d4c9f9df5956@kaod.org>
Date: Tue, 25 Sep 2018 15:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_z5qYObmkHoRTUzLTYD_ihom5gXtGgjhsD4mPsDb9GmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4424223684927327172
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtuddghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.78
Subject: Re: [Qemu-arm] [PATCH v2 06/11] aspeed/smc: fix default read value
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xzklp62H0VQ+

On 9/25/18 2:24 PM, Peter Maydell wrote:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> 0xFFFFFFFF should be returned for non implemented registers.
>>
>> Also,
>=20
> Use of "Also" in a commit message often indicates that it
> would be better to split the commit. The two changes here
> don't seem to me to have much to do with each other.

They do in the symptom which is to expose the correct register
values. But I won't argue and next version will introduce two=20
patches :)

Thanks,

C.

>> the model should expose one control register per possible CS
>> even if there is no flash device attached. When testing the validity
>> of the register number in the read operation, replace 's->num_cs' by
>> 'ctrl->max_slaves' which represents the maximum number of flash
>> devices a controller can handle.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 1270842dcf0c..6045ca11b969 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -665,12 +665,12 @@ static uint64_t aspeed_smc_read(void *opaque, hw=
addr addr, unsigned int size)
>>          addr =3D=3D s->r_ce_ctrl ||
>>          addr =3D=3D R_INTR_CTRL ||
>>          (addr >=3D R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_s=
laves) ||
>> -        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs)) {
>> +        (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_sla=
ves)) {
>=20
> The commit message mentions changing the upper bound on the
> address check here and also the unimplemented-register return
> value, but this change also seems to be changing the lower bound
> in the check ?
>=20
>>          return s->regs[addr];
>>      } else {
>>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PR=
Ix "\n",
>>                        __func__, addr);
>> -        return 0;
>> +        return -1;
>>      }
>=20
> thanks
> -- PMM
>=20

