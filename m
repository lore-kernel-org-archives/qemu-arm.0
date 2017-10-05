Received: by 10.223.197.9 with SMTP id q9csp857841wrf;
        Thu, 5 Oct 2017 11:57:15 -0700 (PDT)
X-Received: by 10.55.124.71 with SMTP id x68mr28792605qkc.10.1507229834934;
        Thu, 05 Oct 2017 11:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507229834; cv=none;
        d=google.com; s=arc-20160816;
        b=OhLsDZ12jQ1mpwyZfMlbEgmpWZGcu3i7aJ5dQ+bXQxZ243+lWYsA6TbitqWr2/qfCz
         +nnGqq60/CB9Au3Jxdha3s3y2Mmwi1WUJhK/O2IDCCvv1wgbAtP3HuEkbViABzjvcYhU
         gZiDp/VM4VcPvzEs9HQNeAU+cTQjVdQV2kpRAz65DbnSDeKgW//kKH59TsI0/daNZjtb
         jYk97ExF/xTxJqSswMTxUBu37Veg5vSyc2XnXI7hB5Slg1TbfLhH/gIFZHs9CEjwkmkJ
         48i7MxLcGcI3tQGgNCMNy0CCnQNeYFP7FZ/J3t5W2gy261LwNMvVA28ZtCDQdbvQyDxi
         aYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tdCHoxfI67I5+7Zgmrpx4IodMKUBY05vefaUyWuEYtE=;
        b=pJ0VnZSOdYQSDNIYe415VshAKXhFf79gG2tvkn+EV073V1wXNqslroSXQPeWOjqJjA
         su8VX6IMz52WNUDrP/0H7TenSd9GPqgRk1U8puLlpUhqa+72qcLQViy6ot8jtYm+5d2+
         wzPd3eLViqxLiTy9xDOVD1YA0Y2cPbsp8JfvnPBcuSSRgWXj2MAjKiZdm3wXXhzuWuJp
         tqxmNKud3ldgRsDkBpcKOMWJC53TpwjAguu9gLj2CqnuSJvjRjqw7br8NaICQcnyzSY0
         3Jd9rIYa5PI2AHlJlkIaoqc9mcw4thblC/HaMpg5h7OlrinrjfNjJNrIXjpIkSdhzdXw
         25Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cqq9zSXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64si2902642qtd.418.2017.10.05.11.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cqq9zSXF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BKc-0004Ng-GI
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:57:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0BJg-0003n6-Iy
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0BJf-0004m1-ML
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:56:16 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:50753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0BJf-0004kr-G1
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:56:15 -0400
Received: by mail-wm0-x22c.google.com with SMTP id u138so3766497wmu.5
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tdCHoxfI67I5+7Zgmrpx4IodMKUBY05vefaUyWuEYtE=;
	b=Cqq9zSXFA59J0GGrvrGHqDQRykprnYzCs89VhVjWR1vQ8ADc9Yd7LUOCbUlra461lY
	l+uvaIjhEUoWgKAhxvoyoq+hF+288SjtX1N39IBm0lPWedQN73m0NohhHs5Sj1QzfEu+
	B9N/wrH8AOjhEuB9Asia2Zjx3Dto6ZN/+8xa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tdCHoxfI67I5+7Zgmrpx4IodMKUBY05vefaUyWuEYtE=;
	b=WaJM4pVqLO2kL3bNckAJcFM5RqxvHegSNPaajpmoyjPNVrGvioMAQoP60SRvIcBNdW
	mxMS29gfm4W9nHiaEE+j/mclUP7ddfhsyAL0lwj1EQ0EXtAya/wnnBcSVZx4vQqNjlOt
	Wserc2DpgUXLWhMacm0bvevMpq4uGqZ26XWYc84ot2gsc7HN1roSvQmSDV3rlXlsg28c
	SmbWGhASNhgayVX8K7z+iigVl7i4ilnFjoDBs3NUnyfoKzzSXxEghLWUf6QvcBfBw11C
	leraYvfsDgVwOYmqs1zM8I/4aPsRAKrc73ikG9QerLObJrWMGVQMb4AEMQUhoreN8S5d
	NkOg==
X-Gm-Message-State: AMCzsaVp8j+/P1CLhp4r1HNXrwk+N+O90Re90JAmWjKjyybvEmWikF3N
	8jyvWTHrTQGT0ZfRMI08RWISdOX4sqXs0I98Rnr/Kg==
X-Google-Smtp-Source: AOwi7QBgaNjO1zGwnJjqNnXQlKQsPDQ/KhdZFezt1WpYrsFW0KV6L9YunCuKGHj0Eztx+jmlwcViUkAmauO0rLX4+2I=
X-Received: by 10.28.236.203 with SMTP id h72mr63495wmi.147.1507229774012;
	Thu, 05 Oct 2017 11:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Thu, 5 Oct 2017 11:55:53 -0700 (PDT)
In-Reply-To: <cd16f792-28a0-95b8-6a68-73f1427e6d38@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
	<cd16f792-28a0-95b8-6a68-73f1427e6d38@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Oct 2017 19:55:53 +0100
Message-ID: <CAFEAcA8y8f27o=c_Cpox8KZWGZshER5PrztorPZUf+RFnAHrAg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/20] target/arm: Implement SG
 instruction
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
X-TUID: 79ydwsMw+S3X

On 5 October 2017 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/22/2017 11:00 AM, Peter Maydell wrote:
>> Implement the SG instruction, which we emulate 'by hand' in the
>> exception handling code path.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/helper.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 124 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index b1ecb66..8df819d 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -41,6 +41,10 @@ typedef struct V8M_SAttributes {
>>      bool irvalid;
>>  } V8M_SAttributes;
>>
>> +static void v8m_security_lookup(CPUARMState *env, uint32_t address,
>> +                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
>> +                                V8M_SAttributes *sattrs);
>> +
>>  /* Definitions for the PMCCNTR and PMCR registers */
>>  #define PMCRD   0x8
>>  #define PMCRC   0x4
>> @@ -6724,6 +6728,123 @@ static void arm_log_exception(int idx)
>>      }
>>  }
>>
>> +static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, uint16_t *insn)
>> +{
>
> This function doesn't take an address ...
>
>> +    if (get_phys_addr(env, env->regs[15], MMU_INST_FETCH, mmu_idx,
>> +                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {
>
> ... reading it directly from r15 ...
>
>> +    if (insn != 0xe97f) {
>> +        /* Not an SG instruction first half (we choose the IMPDEF
>> +         * early-SG-check option).
>> +         */
>> +        goto gen_invep;
>> +    }
>> +
>> +    if (!v7m_read_half_insn(cpu, mmu_idx, &insn)) {
>> +        return false;
>> +    }
>> +
>> +    if (insn != 0xe97f) {
>> +        /* Not an SG instruction second half */
>> +        goto gen_invep;
>> +    }
>
> ... but somehow expects to get two different values read from the same address?
>
> Certainly you'd get the wrong exception frame if you incremented r15 in between.

Oops. I missed this in my testing because it happens that the
two halves of an SG instruction are the same value :-)

thanks
-- PMM
