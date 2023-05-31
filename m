Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2778433ejb;
        Wed, 31 May 2023 04:22:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Bcml8i9jf6U6KJvSkzvM4mKKRKUBhyQhB/glFnC1xA0ubI+aOTKVIKaF/hWJji4YcuCOb
X-Received: by 2002:a05:6830:12cc:b0:6af:9558:ed63 with SMTP id a12-20020a05683012cc00b006af9558ed63mr1387902otq.25.1685532165734;
        Wed, 31 May 2023 04:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685532165; cv=none;
        d=google.com; s=arc-20160816;
        b=Fq+FQdK3rMh0xWteDcjSg6iw29UlJKgvkfCIHM/SyruEF4GKjpXdj86qTbAlrHJFEy
         j54VVwIGpLbSvnB/bL6CEsPhaS6snxd0ALSS9k2X5080nwy4heQT61IBgO8HLfo2qLcC
         SnQi3X68EblFTNN5VbRUx37jcGtFuL6cgsAFkn5FJvp9jNIT2zHK1J8jRf+7uuVsZVg6
         5gxcCNlf+BuJVKGsbz4n+mxjZWN7OYW7vWKQj8p41KPJjvBMYe2aWdEmBirXSwwrVQ3r
         30NfX/qmo4sHBFu2zHtSbpjJ6TXzXL3AFk6DZRKv2FL4CPpqbkGkdxxBXLPdWcDUM6Jx
         WIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=1rHh9acbNqVgAmFblU1cbtepynAr7rT9TDbw4gRZhI8=;
        b=alg5nbf0VV4q6ySY3sML4LvcjCbxZ6VvR5eiIiT+1czQhz0ld0FsTWwoF770ttWBkF
         Os6qwROcCRsrpRDskfH3JwSlFSmWvaCensqMtGaWwM2pFZmnPzom+hAA9/5XeL97XTva
         hsuQ6QsEBZqFEU+X0n80polHZPSC2FjdmIlVoAOgR1TzsgJkvKxJLReDtkJicQBHPnnq
         mFVV/iNh6WfGVtHy0aN/a4/tSEDwksbPi4qNaQjVXMT0GG0qdyjATw/TQCLToEVyLBhT
         XIQT/z5XuYtt9gUfJsatMsSyjxMrHyR7Gu66ws7QDlxns0+ghbgtEQCN2xkMZc9q8ptA
         4/0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=f65hAQ5I;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id d16-20020a9d72d0000000b006af8879cafesi531880otk.41.2023.05.31.04.22.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 May 2023 04:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=f65hAQ5I;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C625628FE;
	Wed, 31 May 2023 11:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CA2C4339B;
	Wed, 31 May 2023 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685532164;
	bh=z5SffpKIWfX1XJolbtBvJVAkGB89HsC1bTP1NQPmykU=;
	h=From:To:Cc:Subject:Date:From;
	b=f65hAQ5IVRLC+zaA++OMCn7KICRcG/A+GGk9nFp5PpgapGdiXL0OhlyTHBlG2mXiD
	 lyOgo26ubEpyDQPV7pOb7bMUUAx1fNjRFSypouXfLJYkPIhUyY+Qzscg+W8dkYhPwi
	 li7jGpiflAmrUsjfenDtzzE7irDrS7t5hRBD2qu1dU2m0UESa5gRe7aCqAyHrlDSrI
	 c4nyItodyJQJ4V7c0Pld15rHEZGCmHBJWo6X+yV9O4/qXH9io6Il3jKQMzO3Yn+Ywv
	 2dY4cDCILmRmSasZL3KTaZ93QzDMJSJvDuZ+0o15qswckqx925FibXgSWIVMNYLWyb
	 IO6rwR+pzF7xQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/2] Implement AES on ARM using x86 instructions and vv
Date: Wed, 31 May 2023 13:22:37 +0200
Message-Id: <20230531112239.3164777-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=ardb@kernel.org; h=from:subject; bh=z5SffpKIWfX1XJolbtBvJVAkGB89HsC1bTP1NQPmykU=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaVc96dKZ+KcKZ7BvMnHBf7v3Ov90Zntg7xSR6GtUu4n5 WdVBhs6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETsahn+h196XHI/JrYsxSZ9 csq+xQzh9dPfZjB1Wzjuqz7rVNb9kOF/nGx1ReZCCYeiyfrHdK7favv+aYvBufn6szOVv7vMOOX ODAA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yppXLPx6kV0n

Use the host native instructions to implement the AES instructions
exposed by the emulated target. The mapping is not 1:1, so it requires a
bit of fiddling to get the right result.

This is still RFC material - the current approach feels too ad-hoc, but
given the non-1:1 correspondence, doing a proper abstraction is rather
difficult.

Changes since v1/RFC:
- add second patch to implement x86 AES instructions on ARM hosts - this
  helps illustrate what an abstraction should cover.
- use cpuinfo framework to detect host support for AES instructions.
- implement ARM aesimc using x86 aesimc directly

Patch #1 produces a 1.5-2x speedup in tests using the Linux kernel's
tcrypt benchmark (mode=500)

Patch #2 produces a 2-3x speedup. The discrepancy is most likely due to
the fact that ARM uses two instructions to implement a single AES round,
whereas x86 only uses one.

Note that using the ARM intrinsics is fiddly with Clang, as it does not
declare the prototypes unless some builtin CPP macro (__ARM_FEATURE_AES)
is defined, which will be set by the compiler based on the command line
arch/cpu options. However, setting this globally for a compilation unit
is dubious, given that we test cpuinfo for AES support, and only emit
the instructions conditionally. So I used inline asm() instead.

As for the design of an abstraction: I imagine we could introduce a
host/aes.h API that implements some building blocks that the TCG helper
implementation could use.

Quoting from my reply to Richard:

Using the primitive operations defined in the AES paper, we basically
perform the following transformation for n rounds of AES (for n in {10,
12, 14})

for (n-1 rounds) {
  AddRoundKey
  ShiftRows
  SubBytes
  MixColumns
}
AddRoundKey
ShiftRows
SubBytes
AddRoundKey

AddRoundKey is just XOR, but it is incorporated into the instructions
that combine a couple of these steps.

So on x86, we have

aesenc:
  ShiftRows
  SubBytes
  MixColumns
  AddRoundKey

aesenclast:
  ShiftRows
  SubBytes
  AddRoundKey

and on ARM we have

aese:
  AddRoundKey
  ShiftRows
  SubBytes

aesmc:
  MixColumns

So a generic routine that does only ShiftRows+SubBytes could be backed by
x86's aesenclast and ARM's aese, using a NULL round key argument in each
case. Then, it would be up to the TCG helper code for either ARM or x86
to incorporate those routines in the right way.

I suppose it really depends on whether there is a third host
architecture that could make use of this, and how its AES instructions
map onto the primitive AES ops above.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>

Ard Biesheuvel (2):
  target/arm: use x86 intrinsics to implement AES instructions
  target/i386: Implement AES instructions using AArch64 counterparts

 host/include/aarch64/host/cpuinfo.h |  1 +
 host/include/i386/host/cpuinfo.h    |  1 +
 target/arm/tcg/crypto_helper.c      | 37 ++++++++++-
 target/i386/ops_sse.h               | 69 ++++++++++++++++++++
 util/cpuinfo-aarch64.c              |  1 +
 util/cpuinfo-i386.c                 |  1 +
 6 files changed, 107 insertions(+), 3 deletions(-)

-- 
2.39.2
