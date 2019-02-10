Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1067913wrq;
        Sat, 9 Feb 2019 17:20:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia0PhD/Kvy4joQna1ShaGEnOZdBTmqmaiHE8EkzKzL9tA0KWMzRqmQSjI0qvkZVB78mJPEO
X-Received: by 2002:a5d:430f:: with SMTP id h15mr5053284wrq.202.1549761639220;
        Sat, 09 Feb 2019 17:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549761639; cv=none;
        d=google.com; s=arc-20160816;
        b=srLT8EUR43XSS4FvYEupMJpeeImq48V0uZ1TBcwPNrKd5PIxgOncYUib7K8Tc0BsSw
         P4aq2+dXKT2ecVEcahhbqmdH7TiFErJ0KHFEME5+ImduuIxXr3wksctHFY8L9t0Z512I
         v/PH9jMrLMetC2ysy92TTBvVPOYSR9/EhrzXcetuB+2q60ywBZoX9cjGGuXZsmed/A0n
         RjsrIYExvZO3f29BGqTsBl8fcs+b6hsE5zgyDU/mfWE/1uyLGMGOMIM8+IbYfpofkDkP
         j57dCOtq24r0kJfItnjMKvYQnP9H6286qHr5/G4tOcLaXkrYmViLvufI23ulcD+bh/Rd
         //Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=r5I0LCYnSdlZCLHUix4mWa0Hs1l3uNrtKtMpOkmYfL0=;
        b=OkD27jvRRTrM3VXReoNqKcqFh+jXX4AYVg4KCFRJgM+wYLI9bvI1F1pX7XL3nNHaWF
         OWiZnuuZIKKYF34mtLAmKQqeu5WdZOe79w7TK/bwADAkN2zTpTkgimQ8q0WVViGjZ+gm
         F/+o5iYW6Ku+4r+ThI/Gs9NuN/N0iRJocrtJwFqvtj5anWrjFdWTaAVptnP1vdQaoxsH
         cQ94y1a2IjRlhee7C7i+KcrNNH6oH1YXg8NrCa/o7RdkSYiMiUIjQ2S1DqZOVjUy4n7x
         ZaH+0RVsgCzlz1LmpjAICMutz8bp/3vDo6kmP+O2GGRCzv/3aL/ItW5/UdxeyDfSYqNE
         1NkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERVAQYOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si5870433wmg.90.2019.02.09.17.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 17:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERVAQYOr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsdnS-0006Se-8a
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 20:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsdnI-0006Q7-VH
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 20:20:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsdnH-0004dH-01
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 20:20:28 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gsdnF-0004cR-Ux
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 20:20:26 -0500
Received: by mail-pf1-x443.google.com with SMTP id f132so3497691pfa.6
	for <qemu-arm@nongnu.org>; Sat, 09 Feb 2019 17:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=r5I0LCYnSdlZCLHUix4mWa0Hs1l3uNrtKtMpOkmYfL0=;
	b=ERVAQYOrwW1ht+Ee192+kJ92SdqIOxPBh/Nrtl0BwoZ3JTtEJi2mfDJjFFcWUuExIY
	C0FSON9ebJAzIke1L8x4pbVDM6j6UkGECupsRZZ3ciEVbR8EPUGf5V5+iOD8v7uZyG5n
	VKoe0ULDp+pZLIHW+yyEy94f6/BU/NUcX3WzQjY4f4DnmHKdsY5EuANKipqFGgsJanVf
	33nko61aAZYy7wOgQeHMKcJc2JZq7sUjr0vkN+3eoTSzGU8hBt+QvueK9PgHlf7Daqye
	fxZMNatYZUbQw6SvGTd2nm2m4192/gdJh2zzL3tnM+aqC1fVdtB3QCEBc+MM8Aenwcth
	nQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=r5I0LCYnSdlZCLHUix4mWa0Hs1l3uNrtKtMpOkmYfL0=;
	b=k/8STSonB0N+cpdRX8kAyv/Pi2UeKIKx3jPe/tKfwms41jJWm317E51NgG0o25rBhg
	/12IrmWY3Vv+/AzKnSgVeCrjHvsVzCsEVDBxDJCdV6Yo3vvTHSsDf1BrrPbt/DcG6+jR
	QU7ErYHHyygZIZuMu9y1Hwcfl/HYQhJFJIfEYus2zoBxS3ABUD27vvziAq6X1WjmIKSl
	5WfjFgWgvzvAebH2JxbLkh6442eLcafwnNvjdc2Q2AaYKrvgg0NV36lFNqxW5eCmKU6z
	5XseLSr8CeQpv8j/RWl8p3qcz1PUqV3ClYvlkX56nldzHs02p3ETZ+nQzRDc04sK7M5Q
	oG2g==
X-Gm-Message-State: AHQUAuYOx17k79lJU8TtgubjvD+SfMEraF8TOcpB/Au/caxHTSRqT1Tf
	PV7/avDuLN8SX77Z1CrZSnV9A+VauUM=
X-Received: by 2002:a63:105a:: with SMTP id 26mr6530753pgq.184.1549761624161; 
	Sat, 09 Feb 2019 17:20:24 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id p7sm8763252pfa.22.2019.02.09.17.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 17:20:23 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-4-richard.henderson@linaro.org>
	<CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <252331dd-aea1-03ac-daa8-d37e2076a08c@linaro.org>
Date: Sat, 9 Feb 2019 17:20:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [PATCH 03/17] target/arm: Add MTE system registers
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
X-TUID: 2we5QnWJ+pOm

On 2/5/19 11:27 AM, Peter Maydell wrote:
>> +#ifdef TARGET_AARCH64
>> +        uint64_t tfsr_el[4]; /* tfsrel0_el1 is index 0.  */
>> +        uint64_t gcr_el1;
>> +        uint64_t rgsr_el1;
>> +#endif
> 
> Are we going to add more fields inside this #ifdef or is it only
> saving 12 words?

Just the 12 words here.  We've got plenty of other ifdefs though...

>> +/* Set bits within PSTATE.  */
>> +static inline void set_pstate_bits(uint32_t bits)
>> +{
>> +    TCGv_i32 p = tcg_temp_new_i32();
>> +
>> +    tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
>> +    tcg_gen_ori_i32(p, p, bits);
>> +    tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
>> +    tcg_temp_free_i32(p);
> 
> Maybe assert() that all the bits in the input are in the
> set that we actually store in env->pstate, to catch attempts
> to set NZCV, nRW, etc this way ?

I suppose.  There's the clear_pstate_bits just below, which has a couple of users.

>> +      .type = ARM_CP_NO_RAW,
>> +      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
>> +    REGINFO_SENTINEL
> 
> Missing GMID_EL1 ?

Err..  that's not in 00eac5, at least.

>> +    case 0x1c: /* TCO */
>> +        if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
>> +            goto do_unallocated;
>> +        }
>> +        if (crm & 1) {
>> +            set_pstate_bits(PSTATE_TCO);
>> +        } else {
>> +            clear_pstate_bits(PSTATE_TCO);
>> +        }
>> +        break;
> 
> Don't we need to break the TB here or something to pick up
> the new value of TCO when we generate code for a following
> load or store?

Yep.  It's included in the (quite complex) MTE_ACTIVE.


r~

