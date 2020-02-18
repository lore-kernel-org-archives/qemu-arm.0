Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5597589lfp;
        Mon, 17 Feb 2020 17:20:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwg+6VvNfA3fqJ6YYMNyfqav2z33anns+uTkUURJ6DHlekCCxPqSyEjiuCQZr9hjj55xHki
X-Received: by 2002:aed:2510:: with SMTP id v16mr15647755qtc.306.1581988801682;
        Mon, 17 Feb 2020 17:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581988801; cv=none;
        d=google.com; s=arc-20160816;
        b=JZ6Rs7Ybd7FSbKpqsW7i3hHxZyCIkILo0c4GprjpyABNQ/pFqBnrDFr9ArbokjTAl0
         8oCN57/aY/R5znxvAJd/XcLQ4CA1YiSvW83/PyXpn+5vfvqZSgC1GwMHJrLNkTJTFIuC
         zhPvKgfZJzQP4/HrRUvkLgR3iS7sd94DdIWI/KXv0E5HqGUdijX7TfPkQghmjNb6Yy9g
         u7fXfPbTL86iFFd76HmeAvlIk6juz3bHgdzFFPDnfpoNFWSpcD/BdE7EX+JkWBC5bzpd
         GKempuMxW9nnd+aQcV3q/Zhl6QFjfl4AOtq9kEazuHGqMm+ON198NPN3qcblHJBv57KE
         mP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CYrO/D8KJAMhS037X/pkNXzB3gKmOBzMimqrdkjZz3w=;
        b=WBsoZ3dH1WolDJw2lc2VYlu8j2cftrpLgpW8H3W8ZOLy5jpssIre6ygj0t0CKSK/0Y
         /0+LI+EcGeiC1T0HdPIcEhVNE7m+52r8ZuUFQ1aKYLlBNiSLCtPv7ks7DB9SCQZho7C0
         tIW3igDa1PUlH0Kf9SsU4qyMvBT3Z+UVZUG4aZgY15JMHmeI5XP1FzZEp/A88XINRrOK
         Od5IrE04R7x/wIubXZFOjCqMEbbu8rshhQ8EhsNUNEc8vEJNxtsxwebvZNcgsXyrbEqt
         06nuKVfBokTGJO3GA7DpxlLxgPt2etsIaSoA0grZwXMQBp/OAt9Con7MdH2UhTdgntEi
         Sfhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERpKGZxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si1130223qkg.15.2020.02.17.17.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 17:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERpKGZxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3rYP-0005OB-4p
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 20:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3rYI-0005Nq-4a
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 20:19:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3rYG-0001Lf-PJ
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 20:19:53 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3rYG-0001L8-HE
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 20:19:52 -0500
Received: by mail-pl1-x641.google.com with SMTP id ay11so7412460plb.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 17:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CYrO/D8KJAMhS037X/pkNXzB3gKmOBzMimqrdkjZz3w=;
 b=ERpKGZxppnYAoUAa+BXKAjAw3S0VV2qQUztptRdeaQMMgxxJ3zfHQEE+F23eSk5yMI
 UAeTCl6BoPhJsquoAVU/AGK1XGXgRPThNIV7QUAew717ufOavwfTIWOAO81bj7+PJmjo
 7hQkfrCXQg/gdxhQY/7w21SzVOYBlrAcYvbIUJYoUnzQ+3z1TWxSvaCFEgZF3xuLkgBt
 GJUSdwtLzfLI+tpSVBWeI7202IuQuSLV8gIWvuwj28/7vsR9vT4A4aF6nz3jqJf0GEKm
 tN0IHrWFCfqmDgQY7q4kBvRVAsZshSHbmheTcx4DljZCrwDsNj6OPFZv4Zke7IAGHeaZ
 IJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CYrO/D8KJAMhS037X/pkNXzB3gKmOBzMimqrdkjZz3w=;
 b=ZQyKj/JIDxbcnrJDRkqJWas/7MAqmXOQH/xAdfa3HmVyBVEvJu+hJwioCn6EGdZ3z9
 JT0FUq2ViFHHYUPNtc9exX+d5De4OsIf6A1dHAVXYTDOVD1TtZdGJCp+6CRvm+AzTfAY
 zBkwQL6VV3Vx7KaU83YzmJJORtsADRaGOmwbCxHQYFk0QRCzqfR5p4wogV3M1GNTFXFB
 K04SKeu/U1haiMnJPu2+FxwgzsYZNHZyKEPjop4ya2ABalYrPsWHTp2fmsGReeLyn7KG
 0uuaXbztO93KGRqlRp+wFS59R5rjeOmvJuHYXorSRYdcI4EGal+Bjcv/rqa1v/5bWlCU
 uAwQ==
X-Gm-Message-State: APjAAAX5VTS2WYdxq/WGYrv0nEQs0lvTOOWvH0etdhRvj3B1iuy3Szeq
 yTm0XUwsn1h1waaBlOkhUjTsT2a0bU4=
X-Received: by 2002:a17:90a:3603:: with SMTP id
 s3mr2110194pjb.61.1581988790963; 
 Mon, 17 Feb 2020 17:19:50 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 13sm2144217pgo.13.2020.02.17.17.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 17:19:50 -0800 (PST)
Subject: Re: [PATCH v5 16/22] target/arm: Implement data cache set allocation
 tags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-17-richard.henderson@linaro.org>
 <CAFEAcA_K4wreQRXxEdDB4M-NCBC3NmGTyT0aEZxfAwBbSp23Rg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf8350c-9f98-6c97-9260-aaf3fda792e8@linaro.org>
Date: Mon, 17 Feb 2020 17:19:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_K4wreQRXxEdDB4M-NCBC3NmGTyT0aEZxfAwBbSp23Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v4cefj3qd8/N

On 12/5/19 10:17 AM, Peter Maydell wrote:
> On Fri, 11 Oct 2019 at 14:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This is DC GVA and DC GZVA.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Use allocation_tag_mem + memset.
>> v3: Require pre-cleaned addresses.
>> ---
> 
>> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
>> index f1315bae37..e8d8a6bedb 100644
>> --- a/target/arm/mte_helper.c
>> +++ b/target/arm/mte_helper.c
>> @@ -510,3 +510,31 @@ void HELPER(stzgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
>>          }
>>      }
>>  }
>> +
>> +void HELPER(dc_gva)(CPUARMState *env, uint64_t ptr)
>> +{
>> +    ARMCPU *cpu = env_archcpu(env);
>> +    size_t blocklen = 4 << cpu->dcz_blocksize;
>> +    int el;
>> +    uint64_t sctlr;
>> +    uint8_t *mem;
>> +    int rtag;
>> +
>> +    ptr = QEMU_ALIGN_DOWN(ptr, blocklen);
>> +
>> +    /* Trap if accessing an invalid page.  */
>> +    mem = allocation_tag_mem(env, ptr, true, GETPC());
>> +
>> +    /* No action if page does not support tags, or if access is disabled.  */
>> +    el = arm_current_el(env);
>> +    sctlr = arm_sctlr(env, el);
>> +    if (!mem || !allocation_tag_access_enabled(env, el, sctlr)) {
>> +        return;
>> +    }
>> +
>> +    rtag = allocation_tag_from_addr(ptr);
>> +    rtag |= rtag << 4;
>> +
>> +    assert(QEMU_IS_ALIGNED(blocklen, 2 * TAG_GRANULE));
> 
> Could we assert this on CPU init rather than in this helper?
> That way if anybody tries to create a CPU whose dcz_blocksize
> doesn't work with the TAG_GRANULE they'll realize immediately
> rather than only if they happen to run a guest workload that
> use DC GVA or DC GZVA.

Sure.  I've moved it to realize.

> I also had to think a bit to work out which way round this
> assert is checking: it's testing that the ZVA block length
> (usually 64 bytes) is a multiple of (twice the TAG_GRANULE),
> which is to say a multiple of 32. Given that the blocksize
> is stored as a log2 value, this can only fail for blocksizes
> 16, 8, 4, 2 or 1, which are all fairly unlikely.

Indeed.

>> +    case ARM_CP_DC_GVA:
>> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
>> +        gen_helper_dc_gva(cpu_env, tcg_rt);
>> +        return;
>> +    case ARM_CP_DC_GZVA:
>> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
>> +        gen_helper_dc_zva(cpu_env, tcg_rt);
>> +        gen_helper_dc_gva(cpu_env, tcg_rt);
> 
> I think this means that if there's a watchpoint set on the memory
> partway through the block we're zeroing then we'll take the
> watchpoint with some of the memory zeroed but without the
> corresponding tags having been updated. But that's probably OK
> (at any rate I wouldn't worry about it for now...)

The relatively new probe_{access,write} functions take care of watchpoints.  On
the next round I'll have another look at what may or may not be missing to use
that here.  It's something that I've been thinking about to get right for SVE
as well.


r~
