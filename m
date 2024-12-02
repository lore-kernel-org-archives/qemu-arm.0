Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801502njk;
        Mon, 2 Dec 2024 05:13:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOqiYBMtOfwRJIgaKi0krC+YqR9W35+fxz8btPE3NFotz6yWxj/+mYOQtwNXmAxAQz8qYYiAlKdCMj4A==@linaro.org
X-Received: by 2002:a5d:6d8a:0:b0:385:fa2e:a354 with SMTP id ffacd0b85a97d-385fa2ea5aemr443842f8f.47.1733145230441;
        Mon, 02 Dec 2024 05:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145230; cv=none;
        d=google.com; s=arc-20240605;
        b=bJUal4Ch4ambGF1StyU4mtdYRnBFiZyEEQ65BHq6mGZ+ybtxy+PBgerssmvoeUY6v/
         puUfTtamk397QcLAwxVr9krXwNVxmqbO5Y6bpgFXxWpHakqaLNHSimtitCYHfmlzHeS1
         1y9UbGzG/3BXBnhhuqykY4du+9dhDIZL0IktoTUhcDMBqr+u09YDdFNTeF7MI/cxMwF+
         iELXYCJ87mSExFeqm8dco4uoBe2yDuJ19546qLdST9GAGtDiocBJfboAVWTX/hxAfm4K
         h6TGAorbDphWa6lPa95cJamc2pJ1icfSjRbWmcPmRuXDo0Ymj7eeKFXVT6WwpygAacIq
         tnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=trg+V3VWcwq8s0j7XDrYNrEYigU3XoxkcN81p0HkxKU=;
        fh=eSdU1ZIzPzR5f2+nnp0xRL5IlC7LwnUbkOtAJloAzgQ=;
        b=g1GX+xEjjv3wEoRyEWr7bADod3ijeU6q41SWbTkszzqyNrH714IRDFykH7T+cCioI5
         zKnY+COFE6oRMjGXka1dO9SObVjuUp9l6Pa9g/YPFl0KMxT1MOxhRn2SgwC8RXwzI1N2
         /t43zy36rek2bZusXW6wHzsNd6X7Z9I5S6NHJ2OPNmj4Q4uuOmF4xa1gTVR9N77RqfD3
         eX7o5wOuEQuXXZ73OAx3CCL4ET0leMUdQ8sURtYDW5eJNWtnAc1bsxvpqiHWytZRXqDn
         lGrAEgTQsL0vI4NRHzGS1OdswlUQKQrHViobTqcjx1Eyh8J+7SSH+vGyMEWab/mpXKxv
         kKUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt0xAagj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b9d905a6sor19599235e9.4.2024.12.02.05.13.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bt0xAagj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145230; x=1733750030; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trg+V3VWcwq8s0j7XDrYNrEYigU3XoxkcN81p0HkxKU=;
        b=Bt0xAagjIC2saIe7Pb2bXbjOv9f7m0AjtyqDvns+99/cC/yFcPhzStjK4IQDEgaUhP
         uQkQQnPz+IDrFeox9kJ1o+GdEWtl1OiCzDIPQ+ltCdJbzzPDzmmNu9CvJAbMaAKhx2zg
         tnjh/xahdQ9iR1QS+5FPufs+y8biD/KHoFr/obbUzRblA+kCGZmyhOv8AIgJ/zUjbQox
         a/iacnrNNmf4k5XwJl39Eu/UOHk7deYegwyrGmRDvU1ACCVDyKepsVSIqHoSt9iszxFq
         uobf9ydKTaoZEIE4jnQ1LfCU3glYs+R2lGz9Jb0khRmv/YS7VAHrEd8wy6XO1dZnHhj4
         nUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145230; x=1733750030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trg+V3VWcwq8s0j7XDrYNrEYigU3XoxkcN81p0HkxKU=;
        b=PZW4iZUVC9OHBS7zGCHleh4QLH6iLe4wYfzpGpQG1R6wn5hdQT9cByZ+2QRpwe2yad
         J3k/49L/gjY1/GQ+q+T4vMNsQSz2MQ73eWB+iu7J+wtkzTbK9M+HTaSd/ijVepM8yzdb
         GiM/LuNvwJ9pBo863RBr52M03/iPZgNlfXle6wtz6dnjK1kDwWuAiCYa+/JfsNt2UFRC
         m5fTmgSa+JzLpEk+oODnck9qZkQ1YB8XlFRM2+IM6+imHUUVeXJLjoipg3qEtaUN+Yxa
         IhkjSskUoyKQjz8PMlzqE/BIK0YjiHA5XEcSAQTZKm54UbO6BuA2/GoQV8fVWzSJF+8G
         SGGw==
X-Forwarded-Encrypted: i=1; AJvYcCW7XpQn1hSLrIRk/2Xw7cLGpo9it2WA/2hPdDt4Yc/Oo03nPU+NZvGvcYODYIpvMDryoYf7nPC3aCIGrw==@linaro.org
X-Gm-Message-State: AOJu0YwHbgj61lE23QhVbEwv3V4MZ0RMSP+QSuV0twb4ivWMND10FJYC
	7CHIsdr6oBG3mmtKfr7Zn7wf0NN4uj5QVsiIVOaDpBo4h2D+ZT67o3fkIJBxqnA/Fg==
X-Gm-Gg: ASbGncvIrIFufX1cQ3lvARN4yNIPpio4mGhXy8dJ7RkOsKWDzbby+xgSGdCA+VTpAU8
	4os9ulomMinyfySudTI/YiTxrUdigNDayAL+/Nw7KwGpnlJnoEqaFhd6PdYvmrB0W7mDXXgFixE
	9qMu1V5cqpEE3vV1MSJ+lutxmKb9vhmvRoIv4fwCEVLxB+4ETPIpAl/c60MN5VxqXFydTSAj+/5
	GCwtibAnRas1OuHcSSv72mRfusPVv7n0zukJhTrKleouUnDlNCCM2A=
X-Google-Smtp-Source: AGHT+IEqP7xdq0N/i2H5UWnaEncid9vIzc7y7AmXLhiBnG6Jptxn2sm6stGTHvfu42++SJ7xqME78Q==
X-Received: by 2002:a05:600c:1d20:b0:434:9934:575 with SMTP id 5b1f17b1804b1-434a9dd035cmr231441105e9.16.1733145229761;
        Mon, 02 Dec 2024 05:13:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 00/54] fpu: Remove pickNaNMulAdd, default-NaN ifdefs
Date: Mon,  2 Dec 2024 13:12:53 +0000
Message-Id: <20241202131347.498124-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aILLv1bpvgNs

(Apologies for this patchset being both big and having a wide CC list;
the good news is that this is the last lot of fpu ifdef cleanup that
needs to touch all the targets.)

This patchset does the same thing we already did for pickNaN() to
pickNaNMulAdd() -- it replaces the compile-time ifdef ladder that
selected target-specific NaN propagation behaviour with checking some
runtime selectable settings in the float_status.  The motivation is:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting
   the guest select a NaN propagation rule at runtime
This is patches 1-26 (which were in the v1 of this series).

It then does a similar thing for making targets select the default
NaN value at runtime rather than relying on a compile-time ifdef.
This is patches 34-54, which are new in v2.

In between those two, patches 27-33 do some minor cleanup:
 * prefer to initialize scratch float_status structs from the target's
   env->fp_status rather than as all-zeroes, so that when we add
   new config fields to float_status we don't need to also remember
   to update half a dozen scratch float_status structs too.
   (Some still remain in target/riscv where plumbing in the env
   pointer through the macro magic seemed more effort than it was worth.)
 * remove an ifdef in floatx80_default_nan() by creating the NaN value
   from parts64_default_nan() in the same way we already do for
   the 128-bit NaN

This is intended to be a no-behaviour-change refactor, except for:
 * the arm linux-user nwfpe handling will change its floatx80
   default NaN value
 * hppa, i386, sh4, tricore now correctly raise Invalid for
   (0 * inf) + NaN

Changes v1->v2:
 * update comments on x86 to include the spec references rather
   than TODO notes to check the spec
 * fixed clash of float_infzeronan_none and float_infzeronan_dnan_never
   values
 * patches 14 and 27-54 are new
 * patch 15 is a rework of the old patch 14 to follow RTH's suggestion
   to make it data driven rather than a big switch statement

(The remaining ifdefs in fpu/ fall into two categories:
 * ones done purely for performance to skip a runtime check,
   which can be removed without any behaviour change, like the
   one in snan_bit_is_one()
 * various ones related to floatx80 behaviour, where currently we
   use ifdefs to select essentially i386 vs m68k handling
I'll probably come back and look at these when this series has
gone upstream.)

thanks
-- PMM

Peter Maydell (54):
  fpu: handle raising Invalid for infzero in pick_nan_muladd
  fpu: Check for default_nan_mode before calling pickNaNMulAdd
  softfloat: Allow runtime choice of inf * 0 + NaN result
  tests/fp: Explicitly set inf-zero-nan rule
  target/arm: Set FloatInfZeroNaNRule explicitly
  target/s390: Set FloatInfZeroNaNRule explicitly
  target/ppc: Set FloatInfZeroNaNRule explicitly
  target/mips: Set FloatInfZeroNaNRule explicitly
  target/sparc: Set FloatInfZeroNaNRule explicitly
  target/xtensa: Set FloatInfZeroNaNRule explicitly
  target/x86: Set FloatInfZeroNaNRule explicitly
  target/loongarch: Set FloatInfZeroNaNRule explicitly
  target/hppa: Set FloatInfZeroNaNRule explicitly
  softfloat: Pass have_snan to pickNaNMulAdd
  softfloat: Allow runtime choice of NaN propagation for muladd
  tests/fp: Explicitly set 3-NaN propagation rule
  target/arm: Set Float3NaNPropRule explicitly
  target/loongarch: Set Float3NaNPropRule explicitly
  target/ppc: Set Float3NaNPropRule explicitly
  target/s390x: Set Float3NaNPropRule explicitly
  target/sparc: Set Float3NaNPropRule explicitly
  target/mips: Set Float3NaNPropRule explicitly
  target/xtensa: Set Float3NaNPropRule explicitly
  target/i386: Set Float3NaNPropRule explicitly
  target/hppa: Set Float3NaNPropRule explicitly
  fpu: Remove use_first_nan field from float_status
  target/m68k: Don't pass NULL float_status to floatx80_default_nan()
  softfloat: Create floatx80 default NaN from parts64_default_nan
  target/loongarch: Use normal float_status in fclass_s and fclass_d
    helpers
  target/m68k: In frem helper, initialize local float_status from
    env->fp_status
  target/m68k: Init local float_status from env fp_status in gdb get/set
    reg
  target/sparc: Initialize local scratch float_status from
    env->fp_status
  target/ppc: Use env->fp_status in helper_compute_fprf functions
  fpu: Allow runtime choice of default NaN value
  tests/fp: Set default NaN pattern explicitly
  target/microblaze: Set default NaN pattern explicitly
  target/i386: Set default NaN pattern explicitly
  target/hppa: Set default NaN pattern explicitly
  target/alpha: Set default NaN pattern explicitly
  target/arm: Set default NaN pattern explicitly
  target/loongarch: Set default NaN pattern explicitly
  target/m68k: Set default NaN pattern explicitly
  target/mips: Set default NaN pattern explicitly
  target/openrisc: Set default NaN pattern explicitly
  target/ppc: Set default NaN pattern explicitly
  target/sh4: Set default NaN pattern explicitly
  target/rx: Set default NaN pattern explicitly
  target/s390x: Set default NaN pattern explicitly
  target/sparc: Set default NaN pattern explicitly
  target/xtensa: Set default NaN pattern explicitly
  target/hexagon: Set default NaN pattern explicitly
  target/riscv: Set default NaN pattern explicitly
  target/tricore: Set default NaN pattern explicitly
  fpu: Remove default handling for dnan_pattern

 include/fpu/softfloat-helpers.h   |  38 +++-
 include/fpu/softfloat-types.h     |  89 +++++++++-
 target/mips/fpu_helper.h          |  20 +++
 target/sparc/helper.h             |   4 +-
 linux-user/arm/nwfpe/fpa11.c      |   5 +
 target/alpha/cpu.c                |   2 +
 target/arm/cpu.c                  |  10 ++
 target/hexagon/cpu.c              |   2 +
 target/hppa/fpu_helper.c          |  12 ++
 target/i386/tcg/fpu_helper.c      |  12 ++
 target/loongarch/tcg/fpu_helper.c |  14 +-
 target/m68k/cpu.c                 |  14 +-
 target/m68k/fpu_helper.c          |   6 +-
 target/m68k/helper.c              |   6 +-
 target/microblaze/cpu.c           |   2 +
 target/mips/msa.c                 |  10 ++
 target/openrisc/cpu.c             |   2 +
 target/ppc/cpu_init.c             |  19 ++
 target/ppc/fpu_helper.c           |   3 +-
 target/riscv/cpu.c                |   2 +
 target/rx/cpu.c                   |   2 +
 target/s390x/cpu.c                |   5 +
 target/sh4/cpu.c                  |   2 +
 target/sparc/cpu.c                |   6 +
 target/sparc/fop_helper.c         |   8 +-
 target/sparc/translate.c          |   4 +-
 target/tricore/helper.c           |   2 +
 target/xtensa/cpu.c               |   4 +
 target/xtensa/fpu_helper.c        |   3 +-
 tests/fp/fp-bench.c               |   7 +
 tests/fp/fp-test-log2.c           |   1 +
 tests/fp/fp-test.c                |   7 +
 fpu/softfloat-parts.c.inc         |  22 ++-
 fpu/softfloat-specialize.c.inc    | 278 ++++++------------------------
 34 files changed, 357 insertions(+), 266 deletions(-)

-- 
2.34.1
