Received: by 10.28.4.212 with SMTP id 203csp2163769wme;
        Thu, 3 May 2018 10:32:53 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZptAyfGlrEJh8wiP12uYV9g/7LVdwuEAQDHFo5UeTm8qOPdsKd4TDVsPXIa+at4gsV1ix/X
X-Received: by 2002:ac8:2e04:: with SMTP id r4-v6mr20482883qta.266.1525368772977;
        Thu, 03 May 2018 10:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525368772; cv=none;
        d=google.com; s=arc-20160816;
        b=XhorxflY3IQyeIHLtrRLxIl3bjV9YHwIs4CdugoPFiAFbQXMfM/vptGxlReRtWMUFN
         gnc2oyHHiKRDtXovl3YHYQY5L1vpI28UB3o3eRvUAPDrgfOOFWo0h4o3Gk0w3jERAoqB
         pROlyjFVuz13tZiaxZ5NqFVIV4RV32RWRd6qvFgd/+2Iv/bxgIOTyrQAS+kHg0m/zHmZ
         RlJxT0JMD/IjgSrMV1yX9/kusjLs8lBuWf/44WfZIlu8LCJ+l4HDVeufPLdZac1gWAMl
         FsiSH6R4vcfXBTbLIaZ+1bGyE4HK4Mr4lk7k/4c2KFMpidHjhhFbiey2/TFVXpgzIpo2
         9Yhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=fK4ri2RC7QrOYGgbNEMVZHW4Ykb1cC3nZqrTUhKGduQ=;
        b=N1wthtM6kn433PDpLNWU8i1rGwdkB8xZT8SYyzHHxOT8ODbQrjsud7FiI8wD+tKFWT
         C2OPqsN/UpPBMklToEdfcT3tL5BXVVxlYxJPsRsfAjcmn6W2LLleCl6sHCMJ/KWUSlqf
         Y5zb12rlp9wLne6iF6p0Sr0iYeK7B24VYoKJAkJgefCBTdHVZnKjvrUbTXkB1SH9S9hh
         TC8Sa1BnzIX8ydul3L1caDCBWApF9FYvrTA2I19as0CJ6NO+j2xyYFJYZLVsGgdTgDJh
         Lwjcl3m7Jfd6u/8YwFHBdiwClypr6cE278hUApBCRJ6L8gbAFEQteKv3yjrrVc2kvHDG
         430g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kgZeGUUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y55-v6si6465617qtc.117.2018.05.03.10.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kgZeGUUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEI68-0008Dl-Fv
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEI5v-0008C0-UM
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEI5t-0002h7-5x
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:32:39 -0400
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:44657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEI5t-0002gq-11
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:32:37 -0400
Received: by mail-pf0-x22b.google.com with SMTP id q22so15265823pff.11
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fK4ri2RC7QrOYGgbNEMVZHW4Ykb1cC3nZqrTUhKGduQ=;
	b=kgZeGUUXI/yBsGjFZbUngtLDzYJ7KFccrcWkmQV7Un4wItWf6LCz+XyHzZ6mbIR1k2
	WivfY//Z+R1kG9F1laFCuUU/1yIaUVIK+cVv1ldUhHea59FpjxZ36jutM3cs1n79sbq0
	qdAB0XPvokwoJ6/l9pJ0as9C48Qub0eAWwJOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fK4ri2RC7QrOYGgbNEMVZHW4Ykb1cC3nZqrTUhKGduQ=;
	b=BGE8fQCfUvqIMim8yZkxLy3KgNhps0UZzye2rL6fjKo+uiiL8MDpJSBsAqPQtTGM71
	yNTmacfWZlr9aXPumO4nGHNkicScnloBnZMjqgrDpn/8AVqFiIK/EnV4Joj5U3Q2PW7a
	eIxMHOCtuDLmpU+I+6VLqLOYn74GtoRO77HCFuB1u5CFRsNH8Q+r9p6gTfe7lD/cRH0o
	90E3zO1p5yIYNKtYtcEDCNImb2iqVod3fXt1IRMOLKZMm0jUrHjhCELhjW0azj7wpYPI
	xGiDrBgt2GZAS3JladLekcBqyqFQ3dVVNA6FoMZobqyCWlk9MDqLHQT1SyWToAvxH33t
	4H2A==
X-Gm-Message-State: ALQs6tDjZBPYLVR83MHHilNN8FOj0NjP/eesKa5vB+oZ2i96tN0n2+QV
	aXM0LB3/6kA6g/mw9hrMHyBTR5aw9fs=
X-Received: by 2002:a17:902:8f97:: with SMTP id
	z23-v6mr1543264plo.329.1525368755502; 
	Thu, 03 May 2018 10:32:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r5-v6sm16258272pgp.81.2018.05.03.10.32.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 10:32:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-9-richard.henderson@linaro.org>
	<CAFEAcA_ZaP8Wxe3P+5SKpmQxzJqOEQxnKcdh7StGytOi9iR0yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cf54353-2e76-dcb0-04d7-b64c65d39b5f@linaro.org>
Date: Thu, 3 May 2018 10:32:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZaP8Wxe3P+5SKpmQxzJqOEQxnKcdh7StGytOi9iR0yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/9] target/arm: Implement CAS
 and CASP
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
X-TUID: DaWJIEwoVo06

On 05/03/2018 07:55 AM, Peter Maydell wrote:
>> +        /* If compare equal, write back new data, else write back old data.  */
>> +        tcg_gen_movcond_i64(TCG_COND_NE, c1, c2, zero, t1, d1);
>> +        tcg_gen_movcond_i64(TCG_COND_NE, c2, c2, zero, t2, d2);
>> +        tcg_gen_qemu_st_i64(c1, addr, memidx, MO_64 | s->be_data);
>> +        tcg_gen_qemu_st_i64(c2, a2, memidx, MO_64 | s->be_data);
> 
> I think this has the wrong behaviour if you do a CASP-with-mismatched-value
> to read-only memory -- architecturally this should fail the comparison
> and return the memory value in registers, it's not allowed to do a
> memory write and take a data abort because the memory isn't writable.

If this is true, then we cannot use the x86 cmpxchg insn in the parallel case
either.  We will also have already raised an exception for a non-writable page;
that happens generically within ATOMIC_MMU_LOOKUP.  It is also how we implement
non-parallel cmpxchg in tcg-op.c.

I guess I was trying to read in some wiggle room in the clearing of exclusive
monitors and such.

I really don't see another way.  What do you want to do?


r~
