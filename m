Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2318658wrq;
        Thu, 7 Jun 2018 09:41:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKdTieH6fc0TxVJGRurHSwjXuN7xEE4cC3ZwU/++2iVPRGqJH/v9qKHGk+Y7qd6WDfN0F3q
X-Received: by 2002:ac8:1ca:: with SMTP id b10-v6mr2458758qtg.360.1528389718603;
        Thu, 07 Jun 2018 09:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528389718; cv=none;
        d=google.com; s=arc-20160816;
        b=IfsX2L2bO9w5zMkesIWf6lA4KVLP9/xbgON/yVLbQH8pDPmdT09z1yJ3AVZHv6u7eq
         zrFkXxqDPC5qBbmmlbNbc2Qrt46y+CuEf5vDW4HXpMLLhNqUTQ/2iCr0Wt64mCIfP2e7
         IPpaFrZtu43RfvatdO2QvB8GSlqx4FUEA9K1Nc9J7pItBU6fjCeIwpnEK9aEw+l4ppKf
         m8JtO38AEXsbL176kIRNjakSjSNiLDhko5Xrjz6FqCaaBA5y263KWfzjWBdwtPxqEsFa
         BY0TNL3g/veSwUEm0HtiXPqi+eJbo5Bg8PA0/eV4hG4NmhtriJGH3DEcIvUSor8fTD3M
         ybNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=xRqxA1CYGrdH5tFK0upPIdnPvlAu59RVvgPbm93angQ=;
        b=lJBoxA6OPB8rcC5mYeoq2BPytVPVdKeaIUHC8xxRt+lGuyeQDzTL0nlmM9CMrcmLbd
         xwveuPYNO72TqtUWUlErJSyR5Mk8IBlsKe9vCJk9CB2/Fw+RS+BV6jYCnY0QhQtqpM5T
         +wgjbozgbBzge8q6R1GLHu6YrAcZYlAKMNVTSebQvQdcOw5c0UBS5cfifDT8oene8Q3f
         XIOV38DMs2ejqsRkRqO3BZ+1ioUE1h82Ndz2L54GYwrSGFgKnRPYlXmmyaYFLm9/19g4
         ea+0JjMafAyvx0tfUeO9yukS2lm00pptSsGon+l4dr8Rkxcelpu2uvaGih/HyGGao2Dj
         sNpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4SSTYJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10-v6si10544200qvn.121.2018.06.07.09.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 09:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j4SSTYJZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQxz4-00034p-5I
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 12:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fQxyw-00034e-3W
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fQxyt-0005VS-IX
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:41:50 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:39815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fQxyt-0005UV-Bg
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:41:47 -0400
Received: by mail-pf0-x241.google.com with SMTP id r11-v6so5182794pfl.6
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xRqxA1CYGrdH5tFK0upPIdnPvlAu59RVvgPbm93angQ=;
	b=j4SSTYJZpIW1VUJnMk6q3d/C1JfwptzU0/tFEKJY5YJNbIQuJmmP2L/GAnclOIgDgM
	Jix2vQ6+wuyMjW7pmqbpNaBB2t7jd5zlxi7+1eDcA9XNyE3tJup26DxzXal65yNUYWLE
	Mf47iYVO3AgFMVE5rFINCEE7Tiyx6pAxwbgrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xRqxA1CYGrdH5tFK0upPIdnPvlAu59RVvgPbm93angQ=;
	b=H2LTwQ2h2Hgnjblc/TmCoGPquoB0152GrSj2hQomnw/C2DQJzxJ5nNuwQ1zU3pU73s
	pudseFYLTtFhvsAf/S2Ab/1UOh7KD+rXaKV2BCvpKM9c48/PSSpB27y8hL5eAZ9upVv8
	GYFnJrRGWCcbWJP8a7Pgzj2MvTNv+JpU2FIru0eAnd/9sHZqXZQBIYM3PkKl/KdYmzNn
	agBqg3Nv2Fez3tlG3zbcagGbPBpcREjs1ttW0V+DBo08tgYFV6Gcwkf9Cb/yoLdqDnN7
	P+vwWkIGnoQTmW27YTXKw/BtTVdAeCm/j1nOAS9xR/kbUmnB6WCFcAKjD0LACidG7WwF
	Cy3g==
X-Gm-Message-State: APt69E0b8CuVjI5Ux20Z+uPow1eaVmoW5O43QTiNolBnIn4VYYI8qy7f
	3WUQcEuYW5DbTUzbkFmitgQnh8p1cPg=
X-Received: by 2002:a65:4e8b:: with SMTP id
	b11-v6mr2150955pgs.71.1528389704824; 
	Thu, 07 Jun 2018 09:41:44 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	h84-v6sm59360892pfd.69.2018.06.07.09.41.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 09:41:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-19-richard.henderson@linaro.org>
	<CAFEAcA-ZOrn0dHX9qhrsMsBVPLTVJp_EMjQi4q4JfgTABPXkzg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9e54cee5-ed70-816d-244f-adb2330eb24b@linaro.org>
Date: Thu, 7 Jun 2018 09:41:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ZOrn0dHX9qhrsMsBVPLTVJp_EMjQi4q4JfgTABPXkzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v3b 18/18] target/arm: Implement SVE Floating
 Point Arithmetic - Unpredicated Group
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
X-TUID: 4S8MVZ8Iv9TB

On 06/07/2018 03:45 AM, Peter Maydell wrote:
> On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    | 14 ++++++++
>>  target/arm/helper.h        | 19 +++++++++++
>>  target/arm/translate-sve.c | 42 +++++++++++++++++++++++
>>  target/arm/vec_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
>>  target/arm/sve.decode      | 10 ++++++
>>  5 files changed, 154 insertions(+)
>>
> 
>> +DO_3OP(gvec_fadd_h, float16_add, float16)
>> +DO_3OP(gvec_fadd_s, float32_add, float32)
>> +DO_3OP(gvec_fadd_d, float64_add, float64)
>> +
>> +DO_3OP(gvec_fsub_h, float16_sub, float16)
>> +DO_3OP(gvec_fsub_s, float32_sub, float32)
>> +DO_3OP(gvec_fsub_d, float64_sub, float64)
>> +
>> +DO_3OP(gvec_fmul_h, float16_mul, float16)
>> +DO_3OP(gvec_fmul_s, float32_mul, float32)
>> +DO_3OP(gvec_fmul_d, float64_mul, float64)
>> +
>> +DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
>> +DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
>> +DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
>> +
>> +#ifdef TARGET_AARCH64
>> +
>> +DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
>> +DO_3OP(gvec_recps_s, helper_recpsf_f32, float32)
>> +DO_3OP(gvec_recps_d, helper_recpsf_f64, float64)
>> +
>> +DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
>> +DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
>> +DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
>> +
>> +#endif
>> +#undef DO_3OP
> 
> Why do only these ones need to be guarded by the TARGET_AARCH64 ifdef?

(1) The first ones can be used when re-implementing aa32 neon.  The last ones
are operations not present in aa32.  (2) The last ones are implemented using
helpers-a64.c.


r~
