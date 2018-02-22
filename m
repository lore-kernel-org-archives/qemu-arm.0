Received: by 10.28.71.27 with SMTP id u27csp2338365wma;
        Thu, 22 Feb 2018 11:34:00 -0800 (PST)
X-Google-Smtp-Source: AH8x225R4jlZVDbAa6dVDNaeXG4x9XV91sjjTGrdNW1iERtOqWwFTKQWpevqKrNhCqKvAvLoo8ON
X-Received: by 2002:a25:b90f:: with SMTP id x15-v6mr3921748ybj.51.1519328040276;
        Thu, 22 Feb 2018 11:34:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519328040; cv=none;
        d=google.com; s=arc-20160816;
        b=RIHzPY+yE1mQsQIZimx7Xp3H8CtZP/UkRlUgOxXBPk5qHTrIJl58p7o1GoaF8wNXgl
         SaDvpbr7xfC1IMF6dge6rylJXHRaEj8ZLT34fW3lQY7fWOugqA/EcEQF2owDQ1OSbZU1
         oOjnYFwZSxewf7Ro6EE5fn4PE7bUTDJA0AGoThH93QNu7MA713J0AhsnNr7ZCCeFZEzo
         Q+O5MP9i8n79N29M30RwQI8c4VI5y+xfzW9NAcaL2yZQtcTJB27SC/kjn4UH12VPB2Sq
         GUbKE3/JyU5SEVZjMv6l62IGzrPAzx79156qqmap2NNCrunHw3j6PEiqrM/41YuFZS1l
         6VzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=FHIPsSaEbyYjb1tar2M1ERf8YRe5m2cAlcH/jKb0nmc=;
        b=lhlC2qdpCa/XUrGntmegRcHy4pRS/sMksG+Jb5F8AW+/ox5bIGoJKxUZClvm2HBSpY
         aJO8akJdFh8gNCTOmX3ZDQxas0Xgm0wgrWw2tYI2whGEpFVSepe/KyACW2hVOZznDx/l
         H39T+hoguW0vdp1PjNVMtYTwNMw1/BKXuYcnechvIuKCPbZrbC2btHJoxMAYfRNWQ9it
         o/QDpXCLzGRGADUyZC/MkPTB2QWgdV2WoAzIDL/kiqtHZrMiLuGLZ+2GB0cZnhPJYqqE
         wAL8NzM/x6BNf9sh8X+331bVR1fDzIiWS7LoIxlxIR6OCVOjUn7q2RSb5+n6k6rR0wMO
         uhSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FCks34Yw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x5-v6si124661ybk.167.2018.02.22.11.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:34:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FCks34Yw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eowcx-0000D7-Nw
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:33:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowb7-0007N0-Ou
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:32:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowb4-0001aC-DG
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:32:05 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:42105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eowb4-0001ZJ-7F
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:32:02 -0500
Received: by mail-pg0-x241.google.com with SMTP id y8so2386723pgr.9
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 11:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FHIPsSaEbyYjb1tar2M1ERf8YRe5m2cAlcH/jKb0nmc=;
	b=FCks34YwArIWelUIuI4E+2HhKK2LVTC/kiWhVmcvyyEQIPUcbKDCEUI7cIHtlVhNCw
	R/I7DebNOF3GQ9yUO0pKh18NHCQGni82SH3bmMA+SI1H83nn+FVGiwGBcQ8pkthPBUkD
	w1WFHH06DoMFOAvgP14q9cDvmkxo1b/cHNO8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FHIPsSaEbyYjb1tar2M1ERf8YRe5m2cAlcH/jKb0nmc=;
	b=tOUDoHr44Bt3mFm6eHcltJtTOBCRGljLpZwVnfkiTJwveVwQlHN08K7+LkjYGNhZhC
	IrawBADRyZORFgCgPGuMvE1FZ3Emep4UlGxjVXkewITe/Mj6CXlIN7q8G5mJg4RFd9O8
	SgH6OFwXVQ66zoK0vefvaiksejzNGmCRUyt1tMbX/npWKsLrgaxYJN2jjVUN29sLZHli
	sbnUWXTEgMZyTz6MH0jjMjmhN7ngdFG+XVH4HtXXAuPOiCLxTsHol/7rbHetW5Gt1e6Z
	G/5E2FuHuiUUkxbtdCuxpmhSExI6r5Z4gvBDvbtpV2UHbJoGoS+BQt1qVXiO1wrMoyro
	WPAg==
X-Gm-Message-State: APf1xPBXkvGj/9wVE5dQcwemZOsCLRC30hxuGPKeQXt/VFreNR6TWeAu
	84YGAURu5ogIe1R13u5yVh6Fi0nmmpg=
X-Received: by 10.99.55.1 with SMTP id e1mr6487924pga.237.1519327920603;
	Thu, 22 Feb 2018 11:32:00 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	r62sm1889513pfi.52.2018.02.22.11.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 11:31:59 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-6-richard.henderson@linaro.org>
	<CAFEAcA9dA5rgqRGJV8rPrDGdzX5ZCKOpTMwDRMp_yu-sycyV+g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad61bcfb-152e-b383-5121-b42880f6426b@linaro.org>
Date: Thu, 22 Feb 2018 11:31:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dA5rgqRGJV8rPrDGdzX5ZCKOpTMwDRMp_yu-sycyV+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/67] target/arm: Implement
 SVE load vector/predicate
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u5HwCOXyUsYr

On 02/22/2018 10:20 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-sve.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/sve.decode      |  22 +++++++-
>>  2 files changed, 153 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
>> index 50cf2a1fdd..c0cccfda6f 100644
>> --- a/target/arm/translate-sve.c
>> +++ b/target/arm/translate-sve.c
>> @@ -46,6 +46,19 @@ typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
>>   * Implement all of the translator functions referenced by the decoder.
>>   */
>>
>> +/* Return the offset info CPUARMState of the predicate vector register Pn.
>> + * Note for this purpose, FFR is P16.  */
> 
> Missing newline before */.
> 
>> +/*
>> + *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
>> + */
>> +
>> +/* Subroutine loading a vector register at VOFS of LEN bytes.
>> + * The load should begin at the address Rn + IMM.
>> + */
>> +
>> +#if UINTPTR_MAX == UINT32_MAX
>> +# define ptr i32
>> +#else
>> +# define ptr i64
>> +#endif
> 
> I think that rather than doing this we should improve the
> provision that tcg/tcg-op.h has for *_ptr() wrappers, so
> from the target's point of view it has a proper tcg_const_local_ptr()
> and tcg_gen_brcondi_ptr(), same as for _i32, _i64 and _tl.
> 
>> +
>> +static void do_ldr(DisasContext *s, uint32_t vofs, uint32_t len,
>> +                   int rn, int imm)
>> +{
>> +    uint32_t len_align = QEMU_ALIGN_DOWN(len, 8);
>> +    uint32_t len_remain = len % 8;
>> +    uint32_t nparts = len / 8 + ctpop8(len_remain);
>> +    int midx = get_mem_index(s);
>> +    TCGv_i64 addr, t0, t1;
>> +
>> +    addr = tcg_temp_new_i64();
>> +    t0 = tcg_temp_new_i64();
>> +
>> +    /* Note that unpredicated load/store of vector/predicate registers
>> +     * are defined as a stream of bytes, which equates to little-endian
>> +     * operations on larger quantities.  There is no nice way to force
>> +     * a little-endian load for aarch64_be-linux-user out of line.
>> +     *
>> +     * Attempt to keep code expansion to a minimum by limiting the
>> +     * amount of unrolling done.
>> +     */
>> +    if (nparts <= 4) {
>> +        int i;
>> +
>> +        for (i = 0; i < len_align; i += 8) {
>> +            tcg_gen_addi_i64(addr, cpu_reg_sp(s, rn), imm + i);
>> +            tcg_gen_qemu_ld_i64(t0, addr, midx, MO_LEQ);
>> +            tcg_gen_st_i64(t0, cpu_env, vofs + i);
>> +        }
>> +    } else {
>> +        TCGLabel *loop = gen_new_label();
>> +        TCGv_ptr i = TCGV_NAT_TO_PTR(glue(tcg_const_local_, ptr)(0));
>> +        TCGv_ptr dest;
>> +
>> +        gen_set_label(loop);
>> +
>> +        /* Minimize the number of local temps that must be re-read from
>> +         * the stack each iteration.  Instead, re-compute values other
>> +         * than the loop counter.
>> +         */
>> +        dest = tcg_temp_new_ptr();
>> +        tcg_gen_addi_ptr(dest, i, imm);
>> +#if UINTPTR_MAX == UINT32_MAX
>> +        tcg_gen_extu_i32_i64(addr, TCGV_PTR_TO_NAT(dest));
>> +        tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, rn));
>> +#else
>> +        tcg_gen_add_i64(addr, TCGV_PTR_TO_NAT(dest), cpu_reg_sp(s, rn));
>> +#endif
> 
> Can we avoid the ifdef by creating a tcg_gen_ext_ptr_i64() (similar
> to but opposite in effect to the existing tcg_gen_ext_i32_ptr()) ?

Ok, I will improve tcg.h as necessary for better support of TCGv_ptr.

>> -@rd_rn_rm_e0   ........ ... rm:5  ... ...  rn:5 rd:5           &rrr_esz esz=0
>> +@rd_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5             &rrr_esz esz=0
> 
> This change looks like it should be squashed into a previous patch?

Ho hum, I thought I got all of these.  I'll take another look through.


r~
