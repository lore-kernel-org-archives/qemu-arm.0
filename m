Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2342883wrd;
        Sun, 9 Sep 2018 23:25:28 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda0wUzcyT19f1w36508VhhmLurLg826fU3FZx6b6bgQ9aMNUWGqJv82DzIemX4ezSOUIevx
X-Received: by 2002:a37:7b01:: with SMTP id w1-v6mr13212492qkc.354.1536560728695;
        Sun, 09 Sep 2018 23:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536560728; cv=none;
        d=google.com; s=arc-20160816;
        b=YNtd0pct7JKsGl3KxSD68mcQc7iE3KpwXrRYIYp5J+7NsC5XaQmeHZPpi0wr7D7Of2
         JOJdFCbBODLdDrKEi2481L/mezDthDeqEWZy7+ZbItSd6aWBtJG9VJHazLR1PtLuYiDq
         Q6c8BySKTKxFFRr3B499s1IE71w8gJ6/9pGhDTk2vmIn/vFG6ka6QS6e4mGOXgh1ww0o
         E9bchGvrtCywYDsV7+Fm03qs1hIDlKetU2vYQRlTtk8FG9hwJferYz3Ct+6YdMdBfVSj
         B7FoOrJRPelhgc9QNfc/+khMrBYnx6dXTZIqaCYnbVt9qzTJjXuWZYYe0Ip436ncXnNr
         qHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ZzlpJAOGOV+pQQN0zne6VuX0xi6KdnOuHH8CDCP7zcc=;
        b=oNufaTkLTxHnlMa98A/FdaaVfYWL46OstwPTZMDYleS+PjzryuqXviFRCFT778YBM5
         oSsZbO/n+gw9ySMdYEWZjNaRYR+ksVgz90FGlWtu759fZlIQCLUJp9GtRS/UNSAR2pUe
         7qxlIMU0JFkg5z0NB9fj07wVm7WWGTqP48xmiHKQtrm0Q10O/FMoFyz6KpMrQNSHMd3m
         JneVMxeYnG1r+CBGM6WahdFkYVQt0vXKjDE10wgJ3ogFe4gCnj0gsU5c7A6OQkd2qs9k
         5gbCvD0lUaPNRXd57afQ2lPF5ixTVyi/YmbgNsd/2EN2ErDpQ0+VSdWQaH6tylEfMRX/
         D6Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e38-v6si612489qtb.7.2018.09.09.23.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Sep 2018 23:25:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fzFdY-0002Gy-6q
	for alex.bennee@linaro.org; Mon, 10 Sep 2018 02:25:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fzFdG-00029f-K5
	for qemu-arm@nongnu.org; Mon, 10 Sep 2018 02:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fzFZV-0006nF-Pq
	for qemu-arm@nongnu.org; Mon, 10 Sep 2018 02:21:21 -0400
Received: from 5.mo173.mail-out.ovh.net ([46.105.40.148]:45751)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fzFZS-0006kH-RQ
	for qemu-arm@nongnu.org; Mon, 10 Sep 2018 02:21:16 -0400
Received: from player796.ha.ovh.net (unknown [10.109.159.73])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 93C27D5264
	for <qemu-arm@nongnu.org>; Mon, 10 Sep 2018 08:21:03 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id DDC335C00A5;
	Mon, 10 Sep 2018 08:20:52 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-7-clg@kaod.org>
	<c9bc4c3d-c7cc-389c-12e7-3255383543c1@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e607ad6a-29bc-97d9-b224-f91bccb2dccd@kaod.org>
Date: Mon, 10 Sep 2018 08:20:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c9bc4c3d-c7cc-389c-12e7-3255383543c1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 958985248864046035
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrieelgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.148
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/11] aspeed/smc: fix default
 read value
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KzHmPBAIerEj

On 09/08/2018 01:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi C=C3=A9dric,
>=20
> On 8/31/18 7:38 AM, C=C3=A9dric Le Goater wrote:
>> 0xFFFFFFFF should be returned for non implemented registers.
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
>
> This change seems unrelated to this commit.

The controller should have one control register for each flash device
if there is no CS available.

The problem is that s->num_cs is a QEMU software concept representing=20
the number of flash devices handled by a board where as 'ctrl->max_slaves=
'=20
is a HW limit representing the maximum number of flash devices a=20
controller can handle.

Thanks,

C.
=20
>>          return s->regs[addr];
>>      } else {
>>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PR=
Ix "\n",
>>                        __func__, addr);
>> -        return 0;
>> +        return -1;
>>      }
>>  }
>> =20
>>

