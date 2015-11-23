Received: by 10.182.158.201 with SMTP id ww9csp1568945obb;
        Mon, 23 Nov 2015 10:55:03 -0800 (PST)
X-Received: by 10.31.34.196 with SMTP id i187mr20430354vki.2.1448304903930;
        Mon, 23 Nov 2015 10:55:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197si13927322vke.92.2015.11.23.10.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2015 10:55:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a0wGV-0003Sg-CN
	for alex.bennee@linaro.org; Mon, 23 Nov 2015 13:55:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a0wGT-0003SW-G4
	for qemu-arm@nongnu.org; Mon, 23 Nov 2015 13:55:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a0wGP-0002Lj-Ek
	for qemu-arm@nongnu.org; Mon, 23 Nov 2015 13:55:01 -0500
Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229]:32997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a0wGP-0002LV-1E; Mon, 23 Nov 2015 13:54:57 -0500
Received: by lfaz4 with SMTP id z4so115570551lfa.0;
	Mon, 23 Nov 2015 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=fufmP+s6v+/a8Pm0H37/sFvvwFGMysSCrg0gC0QYy4I=;
	b=aio+0Ho0U0Mm5sxx/xHaMm658UKGu/KU14ALVYgvaAU8lpR3//hzumOxE5Z4PpHO3n
	0v3MuaIu6l2rDYgcztKR8Z9uaWd058rgcWWJAX8wK5UY+QeysC7dxy2Ss0rQPmnGbwcK
	Cdv9+rYxs9cWTxD5wfVFkznoavjRthahVZ0BQkWODXiTRyVM4C7/z5dvJs4ELJHg16rp
	rlCR2UV+uS0JDklUm9MLT98mYMFSzJlNcdlnnTQpEsMDtQ85Yof2S5fLXUGPzmBQ6fvl
	vWvonClOFD/tt/QERcPdf2CAubPMpZVfru5nWG+GwTIZeLdVB2hlej+MbiWfZoCXJKQv
	sn0w==
X-Received: by 10.25.17.66 with SMTP id g63mr9449717lfi.110.1448304896191;
	Mon, 23 Nov 2015 10:54:56 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	rb3sm1209110lbb.18.2015.11.23.10.54.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 10:54:55 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8Xvw+Q4PjOrhswT__M4a-Aj2uPpEcsZqpNbSAoKmTBmQ@mail.gmail.com>
	<56535E25.90305@gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <565360FD.6010301@gmail.com>
Date: Mon, 23 Nov 2015 21:54:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56535E25.90305@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::229
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm/translate-a64.c: Correct
 unallocated checks for ldst_excl
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
X-TUID: Agwy99+ayp/8

On 23.11.2015 21:42, Sergey Fedorov wrote:
> On 23.11.2015 19:49, Peter Maydell wrote:
>> Ping? I forgot to mark this for-2.5, and given how long the bug's
>> been hanging around there's not much urgency to fixing it, but
>> we might as well put the fix into 2.5 if it gets reviewed.
>>
> Hi, Peter. I'm going to review this carefully in a few days :)
> For now, I see that the comment for this function should be updated to
> match new code.
>

However, I've just checked the logic of the patch was correct. Just the
comment needs to be adjusted.

Best regards,
Sergey

>> On 16 November 2015 at 18:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The checks for the unallocated encodings in the ldst_excl group
>>> (exclusives and load-acquire/store-release) were not correct. This
>>> error meant that in turn we ended up with code attempting to handle
>>> the non-existent case of "non-exclusive load-acquire/store-release
>>> pair". Delete that broken and now unreachable code.
>>>
>>> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The easiest way to validate that we have the unallocated
>>> conditions correct now is to look at C4.4.6 "load/store exclusive"
>>> in the v8 ARM ARM rev A.h: our three conditions correspond
>>> to the three "unallocated" rows in the decode table.
>>>
>>> PS: Laurent originally reported this way back in 2014:
>>> http://lists.gnu.org/archive/html/qemu-devel/2014-10/msg01255.html
>>>
>>>  target-arm/translate-a64.c | 12 ++----------
>>>  1 file changed, 2 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>>> index fe485a4..890ace4 100644
>>> --- a/target-arm/translate-a64.c
>>> +++ b/target-arm/translate-a64.c
>>> @@ -1833,7 +1833,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>>>      int size = extract32(insn, 30, 2);
>>>      TCGv_i64 tcg_addr;
>>>
>>> -    if ((!is_excl && !is_lasr) ||
>>> +    if ((!is_excl && !is_pair && !is_lasr) ||
>>> +        (!is_excl && is_pair) ||
>>>          (is_pair && size < 2)) {
>>>          unallocated_encoding(s);
>>>          return;
>>> @@ -1862,15 +1863,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>>>          } else {
>>>              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
>>>          }
>>> -        if (is_pair) {
>>> -            TCGv_i64 tcg_rt2 = cpu_reg(s, rt);
>>> -            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
>>> -            if (is_store) {
>>> -                do_gpr_st(s, tcg_rt2, tcg_addr, size);
>>> -            } else {
>>> -                do_gpr_ld(s, tcg_rt2, tcg_addr, size, false, false);
>>> -            }
>>> -        }
>>>      }
>>>  }
>>>
>>> --
>>> 1.9.1
>>>

