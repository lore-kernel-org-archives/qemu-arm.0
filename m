Received: by 10.28.71.27 with SMTP id u27csp3563462wma;
        Tue, 6 Feb 2018 01:46:04 -0800 (PST)
X-Google-Smtp-Source: AH8x224sMtdOQy16dCMESPdpUDmnB4fxaokBx74PVuIeFBEqv2dVAT8NQjq8+nzteVapBRG4iYcv
X-Received: by 10.129.41.79 with SMTP id p76mr967262ywp.181.1517910364668;
        Tue, 06 Feb 2018 01:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517910364; cv=none;
        d=google.com; s=arc-20160816;
        b=R9lW4jeVkFjaA4AltQh/WKx23cTQjfFEbL2Mo0fTNNJ+57iqEg+2CGbuy5zvNa/g5m
         TMc63s/6jR2T+Cr318IzlIN0SL4xdE4IUJp/+0AP8q1t1AD+0wcFqi1Idic7p9bQvIVc
         E0ZPhax5275N0+POi4O1rz0nSAQ2tlbdV7npCcnHH/FPgHq/FSLZcUuLcy9zwIeCfe6N
         IWuSr8teGhoiBxNp6g3p1BH8Sghc1NggQLRI7BP2WDlX/J/r4eShfUxqtNKH8JR1U6qB
         MSQfkfIo38TtZSPKQrlf/ote4SsCcDBpI5021ZGmZGgm9AHNwW+hP+0R2ISEATmXGFM+
         QJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=1fTkQ9C78gxJUX/Vh559zl+0tcMIT029/E19jmzVlSg=;
        b=phS0NQsuL/Y7twe24C94QSv42Ht3sKQqoIxOxa7MSNIUOJM6srSVGY+vP+1WkzgOd+
         kaKzvZwSq/9K4GrQVrzwHYx8Gej5Fh8VQWOnpzaipEWNEq3Vj9GJ1kdrMsxKMAwaw59Z
         KNCYTdlw1wDqZs38fgSltzR5T+bk9gq726xLGSdN2d/YZ5118+575q5nkFnXOm5mto9W
         qVoUZbbcS3rCoCSGSbZKisOq8rUAJp6qeyloAQ4zvlpAZmxazO0ASr6bRXJY1lN0XisD
         fA9SlRcqoAxEjievWjCwkvG6hO5oPIYTxoYXn+F8mcaCa+D3PqQo8bKy8zqTORBbNrSQ
         leKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkKrnoV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si1762213ybc.232.2018.02.06.01.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 01:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkKrnoV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eizpD-0007pi-Vo
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 04:46:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eizp3-0007p9-Bk
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:45:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eizp2-0008CI-3H
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:45:53 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:40142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eizp1-0008Bz-Uu
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:45:52 -0500
Received: by mail-oi0-x22f.google.com with SMTP id 8so878906oix.7
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 01:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1fTkQ9C78gxJUX/Vh559zl+0tcMIT029/E19jmzVlSg=;
	b=NkKrnoV4rZqxQdgT/o483nTYe+uR4VWC7lMygI/CCGV/w96AzfBwxILYqVl643QTN3
	t5/u6yzZkhrvGogWrYI1m/bVZks/7iKIbHneFDoyXA3gwWr8UFChx4lM94S45RYTZ3Pp
	TGYPQlAnRWB9sBWOBOPfICGBkyvMkc2b1KOQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1fTkQ9C78gxJUX/Vh559zl+0tcMIT029/E19jmzVlSg=;
	b=qOrlacqC7ufNQM8ACuwMp1WI+VMI5XFgrkfc9rrXIiaKuM8eUtfRBOFVO3u9ruv8rc
	vLpAqg9pHdkuZ6wzzfv2taYobuwAnMdXCZdDezSDIOapyFre3X0rItfUPS5WWKs8Sq0+
	3w67TXXlKd7E0Pg137F3pEFwf85UL4v3uOeIO+DeCl4moERCEXha93mQAqurCJtUx0W4
	f/stU6EBcnrRN2gIBMhrDjmy/ziu656Bc0S3aWMGqxYIDRUJw2/d8STN8f6RS/88GJjW
	PwuIEhlOYwj92uP0VKCjEUfC9PdhYYhWzr9C50aPMufBkps2lqxAjipOeC2IfApf0avQ
	HEgQ==
X-Gm-Message-State: APf1xPCYuik599UzJdWRqe2lmFmv+sjgurr4Av5lC1YVu8+p0Oj4jZEO
	ZbuYUORWrCK9SEUZX5LBRpXk8FPEqoPvs/FNlr8C/A==
X-Received: by 10.202.179.65 with SMTP id c62mr1022444oif.8.1517910351096;
	Tue, 06 Feb 2018 01:45:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 01:45:30 -0800 (PST)
In-Reply-To: <b1112be1-c1bf-ee94-f786-84f248e223c5@amsat.org>
References: <20180205105720.14620-1-peter.maydell@linaro.org>
	<20180205105720.14620-6-peter.maydell@linaro.org>
	<b1112be1-c1bf-ee94-f786-84f248e223c5@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 09:45:30 +0000
Message-ID: <CAFEAcA9=ty0TyC87=SYduk773iE_tnZ2tJkSq8-BC5cVtQwwdQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] [PATCH 5/8] hw/intc/armv7m_nvic: Implement cache ID
 registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TolF0GyMY7Ct

On 5 February 2018 at 23:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Peter,
>
> On 02/05/2018 07:57 AM, Peter Maydell wrote:
>> M profile cores have a similar setup for cache ID registers
>> to A profile:
>>  * Cache Level ID Register (CLIDR) is a fixed value
>>  * Cache Type Register (CTR) is a fixed value
>>  * Cache Size ID Registers (CCSIDR) are a bank of registers;
>>    which one you see is selected by the Cache Size Selection
>>    Register (CSSELR)
>>
>> The only difference is that they're in the NVIC memory mapped
>> register space rather than being coprocessor registers.
>> Implement the M profile view of them.
>>
>> Since neither Cortex-M3 nor Cortex-M4 implement caches,
>> we don't need to update their init functions and can leave
>> the ctr/clidr/ccsidr[] fields in their ARMCPU structs at zero.
>> Newer cores (like the Cortex-M33) will want to be able to
>> set these ID registers to non-zero values, though.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> The CSSELR/CCSIDR parts are a bit under-motivated, because
>> the Cortex-M33 doesn't implement caches either and so they
>> are RAZ/WI for that as well as M3/M4, though I'd written all
>> the code before I realized that. This will be helpful if
>> we ever need a Cortex-M7 model, though (which does have
>> a couple of CSSIDR array entries).
>
> I wonder if it is easier/faster to add a check for the "Instruction not
> Data" bit and the level value is not 7 (not permitted) or simple comments=
.
>
>> ---
>>  target/arm/cpu.h      |  9 +++++++++
>>  hw/intc/armv7m_nvic.c | 13 +++++++++++++
>>  target/arm/machine.c  | 36 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 58 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index f21f68ec4a..99c7cb996f 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -453,6 +453,7 @@ typedef struct CPUARMState {
>>          uint32_t faultmask[M_REG_NUM_BANKS];
>>          uint32_t aircr; /* only holds r/w state if security extn implem=
ented */
>>          uint32_t secure; /* Is CPU in Secure state? (not guest visible)=
 */
>> +        uint32_t csselr[M_REG_NUM_BANKS];
>>      } v7m;
>>
>>      /* Information associated with an exception about to be taken:
>> @@ -2443,6 +2444,14 @@ static inline int arm_debug_target_el(CPUARMState=
 *env)
>>      }
>>  }
>>
>> +static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
>> +{
>> +    /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
>> +     * CSSELR is RAZ/WI.
>> +     */
>> +    return (cpu->clidr & 0x001fffff) !=3D 0;
>> +}
>
> Suggestion to be consistent with other bitfields:
>
> /* V7M Cache Level ID (CLIDR) */
> FIELD(V7M_CLIDR, CTYPE, 0, 7 * 3)
>
> So we can use:
>
>     return (cpu->clidr & R_V7M_CLIDR_CTYPE_MASK) !=3D 0;
>
>> +
>>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>>  {
>>      if (arm_is_secure(env)) {
>> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
>> index eb49fd77c7..cc83c9e553 100644
>> --- a/hw/intc/armv7m_nvic.c
>> +++ b/hw/intc/armv7m_nvic.c
>> @@ -1025,6 +1025,14 @@ static uint32_t nvic_readl(NVICState *s, uint32_t=
 offset, MemTxAttrs attrs)
>>          return cpu->id_isar4;
>>      case 0xd74: /* ISAR5.  */
>>          return cpu->id_isar5;
>> +    case 0xd78: /* CLIDR */
>> +        return cpu->clidr;
>> +    case 0xd7c: /* CTR */
>> +        return cpu->ctr;
>> +    case 0xd80: /* CSSIDR */
>> +        return cpu->ccsidr[cpu->env.v7m.csselr[attrs.secure] & 0xf];
>
> /* V7M Cache Size Selection (CSSELR) */
> FIELD(V7M_CSSELR, LEVEL, 1, 3)

Yes, but the index into the csselr[] array is by both the level
field and the I/D bit: csselr[0] is L1 dcache, csselr[1] is
L1 icache, csselr[2] is L2 dcache, and so on.

I guess we could define some field constants.

thanks
-- PMM
