Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2997850wrs;
        Sun, 25 Aug 2019 10:28:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwB3zvucE9vPfhsPcg9LJfNhLx/Ks45Ospk+RpxQ9yCxX6YNuGJahdCvdLcTaWoKzMFsc/v
X-Received: by 2002:ad4:4373:: with SMTP id u19mr12524473qvt.202.1566754107735;
        Sun, 25 Aug 2019 10:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566754107; cv=none;
        d=google.com; s=arc-20160816;
        b=w42jQTDj70p+OA1cXh+yLIT35Z/Jy/6rDv5BCYlD/dpwxUBWKYf/PujFZjFM+cDdnf
         P02zghXG5Ul2OX9RUaOy6GO92LIWhZ5Jn0JrI4yn/ai4X9ticaCGtpMgEyBZStWR5p8W
         +JwTizfhatu7kvVr62CWFtzWmOSpFezU99E/o0MYDgRre00KUc1e+QvATsGZtCgtStcy
         p/TZUhbJTfmFqFWVyb9nEePQZwT4yEK94Yn27C1V2r6d5cINBbXvpocIUsp40c9UBCu0
         T/PiWRVaK1NPV1l4p8pQI+vGlwKq2dMwy58W87s3qyR3aX/0ztlV6GRtxKXYgGWZp9SG
         mfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=VV2xxxc22WiXjDePmylZfc03QMdFsnHN3+k11KLZ/pU=;
        b=LpuXuCC4qeUEuQG6d7X83H3RHLOP786YiYUw8na0e4APxvHD7DiBoqd8gYrbgdW99W
         4Ys4CuohjBYfSTrTkF9ics0Q6fFERdir8oFRouZpDxyDykPtH3pVlqjgkXhXlIrNy4o7
         XOlFWAUKCMkEkfZT7KdHYjm6bZk/Hm9j3rF/yZvhDSi2jXcNTae+L3bOGlZTHC3zvTKa
         BKl7GAlSdJIVg/2XvoiGNvIM9WMb704PaebQRPg6Rnl17HfJim3GxVWynXlPJOwNkutN
         9Ui9IHFhxzMHzIdjo80rlmARiuyYu2VricJbAoUxju82tvWEzKwG/R/v3b3QOvfDib4a
         CslQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="J/CMLLwt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si6335202qvf.166.2019.08.25.10.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 10:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="J/CMLLwt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1wJX-00021C-5D
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 13:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1wJN-000211-Pi
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1wJM-00073K-FE
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:28:17 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41599)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1wJM-000733-52
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 13:28:16 -0400
Received: by mail-pf1-x441.google.com with SMTP id 196so10048693pfz.8
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VV2xxxc22WiXjDePmylZfc03QMdFsnHN3+k11KLZ/pU=;
 b=J/CMLLwtjwteBboyx+qHoHdufC0jYcedk6WAElyAQgdcWRr9Oe9Oo0gA3L5AQfwNBN
 hdG71oLqbTcCDbV/AA5ceH2T1Pgt0K9wN0dPUJyEChMYPBH9YdnFgh/wIBfYIdJfatAO
 5nEuD+L98kj3SQohPeVS29PiUJaqa0cEOmKs7CtE0MXL2JBdtuGtS1BjfQtfhml4SIwp
 J4VsEg7xKzyvLjRaqIAKknYPA/JlHNpxWoWXnWBrrBr4Y8/dDAvnOL4HbQbTXSXZqVji
 ea5aT54892zqSKKoyVbrjDro1xR/RQ6rIkQdjQaFH1KjSHnMm2DAs2JOYz/30x9nOiQN
 u1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VV2xxxc22WiXjDePmylZfc03QMdFsnHN3+k11KLZ/pU=;
 b=pcHmL+sTSOpKAh8PI3zTsFWhrhRCvloMTk1NM4py0htT03LRHG1izg2QDZu8Boj+lC
 DoVhL+4Klk+AuJwZbtrBGO5xRxk/pQTZjx3zbgAhc7scCQVQjn6C1X1gggMZ4w5HzRvq
 9P/TESTl0lM8W7hBTkRH6h+2iOGm6EiJznUaXIl8YhFnT8U906r4E1RT9Tus9snYu01e
 uE0SEcLsB1ReAdS6ijV4sCxlhScUJ6VnSbXnwvM/bSLCLnbCayB+eAJ6/WMv0m1hqsMp
 uL1npFs9c34LLFOmYIvghBvGE1iMKhZ7oq1Bvdn0dVNy4O9U+qGvOycsUnSeiEupAc2S
 RGpw==
X-Gm-Message-State: APjAAAVUq0C5bElceqlkIEsrqH3W1DLausXftLjEcPFJqrz0StHnUrjK
 N1IHyg9EptTCJ03BIj7QZ6Qdnw==
X-Received: by 2002:a63:6146:: with SMTP id v67mr13456645pgb.271.1566754094749; 
 Sun, 25 Aug 2019 10:28:14 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h20sm10167110pfq.156.2019.08.25.10.28.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 10:28:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
Date: Sun, 25 Aug 2019 10:28:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 35/68] target/arm: Convert
 CPS (privileged)
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
X-TUID: uK2tdwoiV7KF

On 8/25/19 9:20 AM, Peter Maydell wrote:
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c       | 87 +++++++++++++++---------------------
>>  target/arm/a32-uncond.decode |  3 ++
>>  target/arm/t32.decode        |  3 ++
>>  3 files changed, 42 insertions(+), 51 deletions(-)
>> diff --git a/target/arm/t32.decode b/target/arm/t32.decode
>> index 18c268e712..354ad77fe6 100644
>> --- a/target/arm/t32.decode
>> +++ b/target/arm/t32.decode
>> @@ -44,6 +44,7 @@
>>  &bfi             !extern rd rn lsb msb
>>  &sat             !extern rd rn satimm imm sh
>>  &pkh             !extern rd rn rm imm tb
>> +&cps             !extern mode imod M A I F
>>
>>  # Data-processing (register)
>>
>> @@ -340,6 +341,8 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
>>      SMC          1111 0111 1111 imm:4 1000 0000 0000 0000     &i
>>      HVC          1111 0111 1110 ....  1000 .... .... ....     \
>>                   &i imm=%imm16_16_0
>> +    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
>> +                 &cps
> 
> In T32 the CPS insn overlaps with the hint space (hint insns have
> bits [10:8] all-zeroes, whereas all the valid CPS insns have either
> M set or one of the imod bits set) -- why doesn't it need to be
> in the same insn group as the hints? If we're going to put it
> separated in the .decode file from the insns it overlaps with
> I guess a comment to that effect would help so it doesn't get
> inadvertently reordered with them.

It is grouped.  It's not immediately visible in the patch because there are a
*lot* of insns that overlap with the hints and 3 lines of context are
insufficient to see that.

But the grouping is semi-visible in the indentation here.

> CPS shouldn't exist at all for M-profile, but the legacy decoder
> got this wrong too, so we should put that on the todo list for
> fixing later (along, maybe, with UNDEFing on some of the
> unpredictable combinations of M/imod/etc for A profile?).

Fixing m-profile is just as easy as as commenting.
I'll leave a TODO for the unpredictable combinations.


r~
