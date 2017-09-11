Received: by 10.223.172.38 with SMTP id v35csp5908703wrc;
        Mon, 11 Sep 2017 11:20:12 -0700 (PDT)
X-Received: by 10.200.56.215 with SMTP id g23mr17073619qtc.238.1505154011927;
        Mon, 11 Sep 2017 11:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505154011; cv=none;
        d=google.com; s=arc-20160816;
        b=oSwRUo2EHAj+wN31Sgwl2hJeow/RPxY3hRLhN05h2bpw2Fa48IKuDI44VeUb9ycPie
         aZFNmeeJ4/wU2mDlQXa60eb91FtYrl4mUU1m3habAljwkFXoQDdSAG6FW5k0Bt0814G5
         jXRtIpPtWMNqNgzrwEiIptEjFIrrH3RSsMs26gOq7unmLZTsTgpam3zp3RPa6S3JhaTX
         AL70hDNizXM6QJb/MnMBzlfkrhgq9hRw6BSlRRZPQZ85E1PlPEjgWHylA5OvorUWqL2g
         Jbf5wTY1/RvPHbsXl/3W/DXZHBdR/E3Zbmd+Xmm7gip60slTbdAFnKJ0qQ55I62VUK/m
         lvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ZCvMbWhjWQnaPE+AtzVNYHx09AKXdDj5bSPf+1BQ2mA=;
        b=GCOCUO5WKTypvhMyAMQG6SjHzAQ3zEJI1qRM1Ljvu8ABns6mTKlL3SJ0xTxsHNU5aY
         PgqZHM02wNXoc2sc8Y94RDAz9QMJ3NAR9SNWSxIeJfdI+C7hkjqThl4SSM9P4cnk9pzj
         +phgiF/iS7TL5rOFbvhFT0FXcr62K2C0FFauvBUvzMyuhgWiOpP/CpBRegHt1LZPerqx
         7T3O6fhAlbveu1c5kKKoRBIerul1kSdebZ/f2NGFWvudfzrlumMLwdCXu1J9eywVoWlo
         Vxi7WS0aF5vYNL/JzKl5L+hWVvAZXhUptHTUqwzXvqVY+H5wGF0xz21pVCiUIxFE2sGV
         2sxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mIgrABy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j96si5006584qte.221.2017.09.11.11.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mIgrABy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drTJZ-0004dF-H7
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:20:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSm6-0004ce-1g
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:45:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSm5-00061r-2U
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:45:34 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSm4-00061V-Pt; Mon, 11 Sep 2017 13:45:33 -0400
Received: by mail-wm0-x242.google.com with SMTP id p17so7447396wmd.3;
	Mon, 11 Sep 2017 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZCvMbWhjWQnaPE+AtzVNYHx09AKXdDj5bSPf+1BQ2mA=;
	b=mIgrABy2thCYGCdhdr33IyRG23/QpVa8l/IVSM1ltZlRq9Cp4g+lYG//avOdFyZ4Wv
	8FiXuQ81/XeXg3/GCoXGD3mZpLjQaZnPkLswURN9bvLamYIpi+VBTa7RQQE3V2N5WRGd
	grLtf4hdma+7wFTzMN1HlupF9JXe894PZUs16ZSXh2IHV8yJsX6kuh2S94dU/+ta2TxZ
	FtOqIWsWXKQpGMUbumKBuyzdnxRbjVq5wgkPHW01/cSs/SU74DSUjcYIkHDYK/83dJ1f
	aOfh/L/1rnse10q/oLNzFcr4P87zCvj31D7uvw/YLaA4jYwR09WUHeT9CwKUtGSnFp9j
	RNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZCvMbWhjWQnaPE+AtzVNYHx09AKXdDj5bSPf+1BQ2mA=;
	b=CiF2UvQoFccr5jTFrzD02wjjMxuRZul/jJ0efSeevTOvjfaR3FijaCKNub9THv8x8t
	M5/zf37XB05vgSRdvE4JDT4ML0tM4JuwA9lHnm9uA9VhKchnt3dKz8eb/Ze0dF7013Z9
	EEUuM4O5rvgJNb6ToprR14X+IL+1LDml5DMc20LGls6Lxs/lUP9Zz16WaetFNpuf7Lkb
	3HHOzgkIMaL5eT+mExdKmoq3VXLUhtbu8yQ8JI15WvVQGNP/PaRmydwG/pLZwCv2m4uK
	hebyK/lf0vd5mVKtGxH9oAFA9jlHyAMkvKKFC57jl9x9cCq1I06hW6/cqVkgneKHXlvO
	LuXw==
X-Gm-Message-State: AHPjjUhlSsgCW1Cr02xDaynU44s0tbAFcOd3vPCVW2xySHq7Z4qJBf/6
	0cBEYe7KTmU/iQuohDe0XdSRJo0jvv4mNjarBumNJg==
X-Google-Smtp-Source: AOwi7QCxYjHjiBY861Choau9QY5cIAnFnCBLlYawTSezhpHkF78bRa6SO49/R7dhMjY+mImJyWV483R39rY7Jpm6f3U=
X-Received: by 10.28.135.209 with SMTP id j200mr1422180wmd.40.1505151931652;
	Mon, 11 Sep 2017 10:45:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:45:01 -0700 (PDT)
In-Reply-To: <eece5841-17c1-a469-81e5-c65a518eca94@amsat.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
	<eece5841-17c1-a469-81e5-c65a518eca94@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:45:01 -0700
Message-ID: <CAKmqyKMgcmvZVYvfQJT9wv_pMr8MW9fU8jiuYk_FkKxbFt+rRg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/7] target/arm: Rename 'type'
 to 'excret' in do_v7m_exception_exit()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mhc/mgyi1Bsy

On Mon, Sep 11, 2017 at 8:03 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 09/11/2017 10:52 AM, Peter Maydell wrote:
>>
>> In the v7M and v8M ARM ARM, the magic exception return values are
>> referred to as EXC_RETURN values, and in QEMU we use V7M_EXCRET_*
>> constants to define bits within them. Rename the 'type' variable
>> which holds the exception return value in do_v7m_exception_exit()
>> to excret, making it clearer that it does hold an EXC_RETURN value.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>
>
>> ---
>>   target/arm/helper.c | 23 ++++++++++++-----------
>>   1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index a502e4e..4f41841 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -6212,7 +6212,7 @@ static void v7m_push_stack(ARMCPU *cpu)
>>   static void do_v7m_exception_exit(ARMCPU *cpu)
>>   {
>>       CPUARMState *env =3D &cpu->env;
>> -    uint32_t type;
>> +    uint32_t excret;
>>       uint32_t xpsr;
>>       bool ufault =3D false;
>>       bool return_to_sp_process =3D false;
>> @@ -6233,18 +6233,19 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>>        * the target value up between env->regs[15] and env->thumb in
>>        * gen_bx(). Reconstitute it.
>>        */
>> -    type =3D env->regs[15];
>> +    excret =3D env->regs[15];
>>       if (env->thumb) {
>> -        type |=3D 1;
>> +        excret |=3D 1;
>>       }
>>         qemu_log_mask(CPU_LOG_INT, "Exception return: magic PC %" PRIx32
>>                     " previous exception %d\n",
>> -                  type, env->v7m.exception);
>> +                  excret, env->v7m.exception);
>>   -    if ((type & R_V7M_EXCRET_RES1_MASK) !=3D R_V7M_EXCRET_RES1_MASK) =
{
>> +    if ((excret & R_V7M_EXCRET_RES1_MASK) !=3D R_V7M_EXCRET_RES1_MASK) =
{
>>           qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in
>> exception "
>> -                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n"=
,
>> type);
>> +                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n"=
,
>> +                      excret);
>>       }
>>         if (env->v7m.exception !=3D ARMV7M_EXCP_NMI) {
>> @@ -6255,7 +6256,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>>            * which security state's faultmask to clear. (v8M ARM ARM
>> R_KBNF.)
>>            */
>>           if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>> -            int es =3D type & R_V7M_EXCRET_ES_MASK;
>> +            int es =3D excret & R_V7M_EXCRET_ES_MASK;
>>               if (armv7m_nvic_raw_execution_priority(env->nvic) >=3D 0) =
{
>>                   env->v7m.faultmask[es] =3D 0;
>>               }
>> @@ -6283,7 +6284,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>>           g_assert_not_reached();
>>       }
>>   -    switch (type & 0xf) {
>> +    switch (excret & 0xf) {
>>       case 1: /* Return to Handler */
>>           return_to_handler =3D true;
>>           break;
>> @@ -6306,7 +6307,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>>            */
>>           env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
>>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>> -        v7m_exception_taken(cpu, type);
>> +        v7m_exception_taken(cpu, excret);
>>           qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
>>                         "stackframe: failed exception return integrity
>> check\n");
>>           return;
>> @@ -6341,14 +6342,14 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>>         /* The restored xPSR exception field will be zero if we're
>>        * resuming in Thread mode. If that doesn't match what the
>> -     * exception return type specified then this is a UsageFault.
>> +     * exception return excret specified then this is a UsageFault.
>>        */
>>       if (return_to_handler !=3D arm_v7m_is_handler_mode(env)) {
>>           /* Take an INVPC UsageFault by pushing the stack again. */
>>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>>           env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
>>           v7m_push_stack(cpu);
>> -        v7m_exception_taken(cpu, type);
>> +        v7m_exception_taken(cpu, excret);
>>           qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new
>> stackframe: "
>>                         "failed exception return integrity check\n");
>>           return;
>>
>
