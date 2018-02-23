Received: by 10.79.42.135 with SMTP id q129csp1042888ivq;
        Fri, 23 Feb 2018 10:58:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELv6tn44Taco0ZePcbw7E3BBmcSzjf4JD5HoVeYjacYlp2AFB9+nmOH+hXVIsArSs75MYnUk
X-Received: by 2002:a25:774d:: with SMTP id s74-v6mr1823296ybc.260.1519412336625;
        Fri, 23 Feb 2018 10:58:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519412336; cv=none;
        d=google.com; s=arc-20160816;
        b=pBKVonuDM6kqtbpGK7bnAfXQYe3/qSl2wdquM9CjmWmptbTF2aDaXg5cUbwxubMGpf
         tVvIfmeA7LfjbnAkMaxjagDaGEPezi/+HqGSUVVrpe4b1H0AqJpj17DMKwcxPxQuw49U
         dHnwd1HjTL4ECz953d2e5RFEUoVahNgrnu/BWIu06GS0vjRb5BkXyREK74W3WwDeuCzU
         97cgCu/0wLJwAHbiUG7oBXSfVZ7itAG0awuxkblnwXa1Bdd4NQ+QmmhjYOmqkvwDwceG
         nZproowqnx+Y7Q4elyunENd7NI1LH2DcLWs/FARCu7NJq48ooOTbM/VonzFwWTpsYPwF
         GXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=SQlFeuFkuVD0FsMaOtUTuDMoUciWzFvmiBJ1CoEK5xU=;
        b=kbdUDI9dsv1o2b+oxSSpnzNuwSGMTmTJ4cYU0b93Wee1p6t1J8LAHSUUvMqhMOOtHn
         ooEWHkzHSPAVQtC6YjdYdzAZ/vlAkqZsX2v7AkMV2WkTbWyYTfOhfxoPAjxnkyUR32uD
         NQAhOJv2cjl8eQXpFKiQjazUS2VOpe+pZmNr858y6ZXS64IZ9vGzherobP7J9XY0o0n9
         pXWZRp249lUGf1h/BqYxpHjb+OTuunIlAwy0q0hcOi32/99mlXwYSan4Mtuc9cg5A792
         1mk9Qm4XkJStIwzoTMsHxSCo3Zj/5RiVq+G63/Hv/PCOuf4EK1SZMWlwP/3cDAmt2JM+
         e37w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RuG/tmYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h19-v6si520379ybj.548.2018.02.23.10.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 10:58:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RuG/tmYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epIYa-000368-7v
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 13:58:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epIYS-00035u-Ir
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 13:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epIYP-0006GJ-MW
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 13:58:48 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:37372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epIYP-0006Fo-Gz
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 13:58:45 -0500
Received: by mail-pf0-x241.google.com with SMTP id s24so3881764pfm.4
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 10:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SQlFeuFkuVD0FsMaOtUTuDMoUciWzFvmiBJ1CoEK5xU=;
	b=RuG/tmYK4x6830yJItD71V5HGmlhvTA4K1QT+1ghJPc/WliiUPW7+dYQVuUv2aXnUw
	pbpmydbftfBzKxMrPCMq4w/Gf9NfjsODI4L6GwvvxYFWTC1OqhZ6eqj/xuN9TqBMTJhv
	1sd5C+ifHF1gtdQFXH4RxfV+1Fhk6dK/Q8U90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SQlFeuFkuVD0FsMaOtUTuDMoUciWzFvmiBJ1CoEK5xU=;
	b=o4JdyekGY7N/VtoRbfAn1cHZPDmLKPmaiy3iKSka/DiDOQiryIv4UmhocItJ91jkUB
	KzHBqDKC97Sl4MbudfJBTh2bAK197JLgv52fkJe90E+53micKVMHgqQl7Xx2eo6nGYz4
	VDeIz653kTFQrcHVRYXwiOi4Lug8hthSI7NSX9IRdZo694G+bXgSfvpyhmzUwlBZLfmQ
	G6Rm1bpRBlpVLhDxc2wjpT60p33N6cZLt2kqdaqKC2b5ZgWoE9I4Mt2KePClDosd33PQ
	24bCF9iOzQWoFwSfILinIABipsbqzj3VZrrZ5qqZH9IY6D8kBgYW/han/n6S2kCfo3vK
	hbVQ==
X-Gm-Message-State: APf1xPA85/CD0lenabvev5tx+wXENn26gojaDx3iYQ47Q7Vn5kwB/Jdc
	KziQKUQnbFTkRFNDOwnMexqOzIlGIRw=
X-Received: by 10.101.99.133 with SMTP id h5mr2099881pgv.381.1519412324102;
	Fri, 23 Feb 2018 10:58:44 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	s67sm6833469pfg.104.2018.02.23.10.58.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 10:58:43 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-28-richard.henderson@linaro.org>
	<CAFEAcA-TuO4F=QoU7WWVieX6OLDX2dEX-g-jz2Hjq4jGb3O9KA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1e6d8e5-4868-33b4-590f-39600467ceec@linaro.org>
Date: Fri, 23 Feb 2018 10:58:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-TuO4F=QoU7WWVieX6OLDX2dEX-g-jz2Hjq4jGb3O9KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 27/67] target/arm: Implement
 SVE Permute - Unpredicated Group
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
X-TUID: 99cnN8vScFsA

On 02/23/2018 06:34 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    |  23 +++++++++
>>  target/arm/translate-a64.h |  14 +++---
>>  target/arm/sve_helper.c    | 114 +++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/translate-sve.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/sve.decode      |  29 +++++++++++-
>>  5 files changed, 285 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
>> index e519aee314..328aa7fce1 100644
>> --- a/target/arm/translate-a64.h
>> +++ b/target/arm/translate-a64.h
>> @@ -66,18 +66,18 @@ static inline void assert_fp_access_checked(DisasContext *s)
>>  static inline int vec_reg_offset(DisasContext *s, int regno,
>>                                   int element, TCGMemOp size)
>>  {
>> -    int offs = 0;
>> +    int element_size = 1 << size;
>> +    int offs = element * element_size;
>>  #ifdef HOST_WORDS_BIGENDIAN
>>      /* This is complicated slightly because vfp.zregs[n].d[0] is
>>       * still the low half and vfp.zregs[n].d[1] the high half
>>       * of the 128 bit vector, even on big endian systems.
>> -     * Calculate the offset assuming a fully bigendian 128 bits,
>> -     * then XOR to account for the order of the two 64 bit halves.
>> +     * Calculate the offset assuming a fully little-endian 128 bits,
>> +     * then XOR to account for the order of the 64 bit units.
>>       */
>> -    offs += (16 - ((element + 1) * (1 << size)));
>> -    offs ^= 8;
>> -#else
>> -    offs += element * (1 << size);
>> +    if (element_size < 8) {
>> +        offs ^= 8 - element_size;
>> +    }
>>  #endif
>>      offs += offsetof(CPUARMState, vfp.zregs[regno]);
>>      assert_fp_access_checked(s);
> 
> This looks like it should have been in an earlier patch?

Hah!  For the first time, no.   But perhaps a separate patch.

What this does is allow proper computation with size > 3.  In particular, I
want to support size==4, aka a 128-bit element.  I think it's cleaner to extend
this function than expose some internals where otherwise needed.


r~
