Received: by 10.25.208.211 with SMTP id h202csp442113lfg;
        Sat, 27 Feb 2016 14:14:40 -0800 (PST)
X-Received: by 10.140.237.204 with SMTP id i195mr11204904qhc.55.1456611280285;
        Sat, 27 Feb 2016 14:14:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m81si19265844qhb.91.2016.02.27.14.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Feb 2016 14:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZn8J-00015T-OB
	for alex.bennee@linaro.org; Sat, 27 Feb 2016 17:14:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZn8G-00015N-Tg
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aZn8F-0006aH-UK
	for qemu-arm@nongnu.org; Sat, 27 Feb 2016 17:14:36 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aZn8F-0006aD-KK; Sat, 27 Feb 2016 17:14:35 -0500
Received: by mail-wm0-x235.google.com with SMTP id n186so1966592wmn.1;
	Sat, 27 Feb 2016 14:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WkAC5JcDS2PrcZEPy/bm4eTV2/79ObpZhHf+oi+bCSA=;
	b=OEr5d/LL2W5HiMLbSkZ8HjXSEKVPnkzuYjqxNCKyzXPiSni79JmEZgrrzUj3s2Mcku
	1YZShvEybtG4jfp34ibmlbnH7nA73znAgm1O0Q6jbO1/DXwbWQaE7fr6uFP1PkI1sCvd
	dip5Y3ql44sbJ9lUKBW/hXwqdqfEqjZaO1CpXkaqdX0/8DuptyDpvOPsYi/22pndlF1U
	COWeeRTWNgPtWfNXPRhwwtN5IU/4PFsPAjLLg6EXNcuHdHRV9XXXjkTssS6HRoiAbYUU
	aX8QKc3sM495oRvJ6eK90vutw36QUMnTywCd+0pbDtbJYD9QdT5HRGMwDo3wG5khbjTz
	ht+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WkAC5JcDS2PrcZEPy/bm4eTV2/79ObpZhHf+oi+bCSA=;
	b=SjZ6b+sOscJ9g2SqoLVPiY5GTLduficVhNNQEQF4OXR1o3NqNLuOwk+H6OXmnUmJr6
	/oJrBXiHuCVqT8NWygaaK4RgAOZyZVFLRuq3IIiTu3K3rEB0MKEHGFcfWt2IPYanN/xP
	O4+Us9tcTR9g+6zpxPE4RHhmiQrD+nE2ITqTUcupKoLjC6I0I/untSMnyjIm1cQpIcv5
	KBjuNfnb+d6Meq9V4XxOc1g48epvL45uGh24tfBYVwZBx1AtMpnrws3hhPBWICRiXO7+
	C/CXLeCJy19qd1fwdygl7qTYSCl8ku7l+79w5DC1tvN8dF9JCIWnjfXiV3PDvmFRPOOW
	tVZg==
X-Gm-Message-State: AD7BkJI6S1A2QQGVg59uvdGV04WjSK/rN71SMm20AiZ1zgNud+FuTUZV6iD85DiKWnI8VV4JAgjbHKU7OaFA+g==
MIME-Version: 1.0
X-Received: by 10.194.76.161 with SMTP id l1mr7695087wjw.108.1456611274992;
	Sat, 27 Feb 2016 14:14:34 -0800 (PST)
Received: by 10.28.31.12 with HTTP; Sat, 27 Feb 2016 14:14:34 -0800 (PST)
In-Reply-To: <CAFEAcA8StfpT8PSC7d-8Oh-Jqy3LHG=n1uoRExQvrOgaeE+=ZA@mail.gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<2e141a5f2a5c38936bdf1a06eaeb1a5595f0f833.1453100525.git.crosthwaite.peter@gmail.com>
	<CAFEAcA8StfpT8PSC7d-8Oh-Jqy3LHG=n1uoRExQvrOgaeE+=ZA@mail.gmail.com>
Date: Sat, 27 Feb 2016 14:14:34 -0800
Message-ID: <CAPokK=pvoda4Og1-9UB2g1Cen1PaSKA+2pH3gtpWgcmXH4aACg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 10/17] target-arm: implement setend
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
X-TUID: YGt5d3+XlrWN

On Tue, Jan 19, 2016 at 8:29 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 January 2016 at 07:12, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Since this is not a high-performance path, just use a helper to
>> flip the E bit and force a lookup in the hash table since the
>> flags have changed.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>>
>>  target-arm/helper.h    |  1 +
>>  target-arm/op_helper.c |  5 +++++
>>  target-arm/translate.c | 16 ++++++++--------
>>  3 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/target-arm/helper.h b/target-arm/helper.h
>> index c2a85c7..2315a9c 100644
>> --- a/target-arm/helper.h
>> +++ b/target-arm/helper.h
>> @@ -48,6 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
>>                     i32, i32, i32, i32)
>>  DEF_HELPER_2(exception_internal, void, env, i32)
>>  DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
>> +DEF_HELPER_1(setend, void, env)
>>  DEF_HELPER_1(wfi, void, env)
>>  DEF_HELPER_1(wfe, void, env)
>>  DEF_HELPER_1(yield, void, env)
>> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>> index e42d287..2a4bc67 100644
>> --- a/target-arm/op_helper.c
>> +++ b/target-arm/op_helper.c
>> @@ -295,6 +295,11 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
>>      return res;
>>  }
>>
>> +void HELPER(setend)(CPUARMState *env)
>> +{
>> +    env->uncached_cpsr ^= CPSR_E;
>> +}
>> +
>>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
>>   * The function returns the target EL (1-3) if the instruction is to be trapped;
>>   * otherwise it returns 0 indicating it is not trapped.
>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>> index cb925ef..192a5d6 100644
>> --- a/target-arm/translate.c
>> +++ b/target-arm/translate.c
>> @@ -7726,10 +7726,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>>          if ((insn & 0x0ffffdff) == 0x01010000) {
>>              ARCH(6);
>>              /* setend */
>> -            if (((insn >> 9) & 1) != s->bswap_code) {
>> -                /* Dynamic endianness switching not implemented. */
>> -                qemu_log_mask(LOG_UNIMP, "arm: unimplemented setend\n");
>> -                goto illegal_op;
>> +            if (((insn >> 9) & 1) != !!(s->mo_endianness == MO_BE)) {
>> +                gen_helper_setend(cpu_env);
>> +                gen_set_pc_im(s, s->pc);
>> +                s->is_jmp = DISAS_JUMP;
>
> Rather than manually calling set_pc_im and using DISAS_JUMP, better
> to use DISAS_UPDATE, which will do the gen_set_pc_im() call for you.
>
> (Ditto in the other hunk.)
>

Fixed.

Regards,
Peter

> thanks
> -- PMM
