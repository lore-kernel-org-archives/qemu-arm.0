Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j123sm1132994wmg.38.2017.09.08.06.10.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Sep 2017 06:10:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B404E3E00FA;
	Fri,  8 Sep 2017 14:10:56 +0100 (BST)
References: <20170817230114.3655-1-richard.henderson@linaro.org> <20170817230114.3655-9-richard.henderson@linaro.org> <87377xijkt.fsf@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 8/8] tcg/i386: Add vector operations
In-reply-to: <87377xijkt.fsf@linaro.org>
Date: Fri, 08 Sep 2017 14:10:56 +0100
Message-ID: <871snhibdr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: VNfAO3TKf8jn


Alex Bennée <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
<snip>

Also this commit breaks RISU:

 qemu-aarch64 build/aarch64-linux-gnu/risu
    testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin \
    -t testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin.trace

Gives:

mismatch detail (master : apprentice):
  V29   : 000000000000000005388083c1444242 vs 00000000000000002a000e0416a30018

The insn is:

  37c:       6f56a29d        umull2  v29.4s, v20.8h, v6.h[1]

Which is odd because I didn't think we'd touched that.

You can find my bundle of testcases with trace files at:

  http://people.linaro.org/~alex.bennee/testcases/arm64.risu/aarch64-patterns-v8dot0.tar.xz

Which is used in our master RISU tracking job:

  https://validation.linaro.org/results/query/~alex.bennee/master-aarch64-risu-results

--
Alex Bennée
