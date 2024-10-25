Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1085955njx;
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
X-Received: by 2002:adf:ee84:0:b0:37e:d6b9:a398 with SMTP id ffacd0b85a97d-3803abf53d2mr4265410f8f.9.1729865577089;
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865577; cv=none;
        d=google.com; s=arc-20240605;
        b=dMRBH8fRSyAqqVVNAXTT9VAn/Vngmx31Q3j5mHUhnj1wNpPHifR2KOU4gtxtGZue8Z
         sDuQ8cu4lmJD2j+ZH49oNqvRp+Fs/L4BgIB8CucyOIYOtBLDD8wJq6f9b0csP+wm1AVd
         MiptFOrBM3Rq45GTiNQjbhehIlQ9yuhFJ79CRnKQzsT0sovYL8Gt2pvQcKG6Vhvdhxhx
         H/BlPpVOEYdiGDjiFOfJU0EPeb6Ouip7Q8po+c8g3ywcQDmtCTujixKiiNsMKH+8X+qY
         9r0hZXO6F18azMkjS7cNEEQE75AyFVjZM2U0mZUOPLn+SOfvZCtXJKjD17dI4uN1Rg/c
         1qDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=FpcQQjq66hc60h15t5XebYBsiuHjNC9wWkvbtWI3lC4=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=eoOuROLLfNhlRu2Yz3hYMW2dpFI2mbCuZw3zqRLCx7hKFrIs9wTkJs58OkZaIxBpuO
         fkUlzpqr2NlZdBS0WeERnb0pMaWKFOrOqLpiZHmTihOOaW8KaCyWRQcYRrxYNw3S6SgN
         JuB7+SKp+bA/tXvBwZpMJ9Qqukn2qm2rVNLTRqm0Ey+D6ZIjwhyS/+gN++/AjKZKCoUj
         fY+w5Ahrj5ZhLZwNcIujGxopYnnlg0+zTk3TPS8Uy4CFqvaIWLAGMZa9vnuRK72ev8Ee
         ngARXgQbgKWQDEUFK5LUIbUdahzpAIucAB/1sPwK9slGMHvV8IZ99z22AD9gfUZCENWJ
         aX9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0UJeiVl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319366708bsor4297125e9.6.2024.10.25.07.12.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0UJeiVl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865576; x=1730470376; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpcQQjq66hc60h15t5XebYBsiuHjNC9wWkvbtWI3lC4=;
        b=U0UJeiVl3DQlRUTZfD6PZpeB0/2F7KyeHQPHHnG1R3B3fxPpViXvsvl+DCzKqyHcCF
         X99vfOLx2mZOe4p0AoQkMnmv0xQ819mcJbp44TPH73YREnC47CXLOBFkTiTk5y0umbgD
         cX7wsQdat6AMXlZAFrDWQXRcd9fuEvDGJ6vPebH5hLNsJRR0tEJ4tTc7CPVvw0CDXQGK
         wxiDkNlB/ciSVjc619tvsIFSfuVsNco2gIsO+kyHJg9TYFnw+ko6xkMEB7NQCV3ManFD
         5MJQQQyRtGNjAAckUGqitztQpCjr1T5yR1g8M7HJtDAMas5P5vauw7DAYj0kyblyJs9+
         bTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865576; x=1730470376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpcQQjq66hc60h15t5XebYBsiuHjNC9wWkvbtWI3lC4=;
        b=CxCP7SooLIE8i6rkKv5bhbnjonLlFD8G4thMzXkctwK/dDnAtQ7nFg8NFH0uFCO0y+
         PdqmOUU8D/m9E3NLEM0TxLPZzuimABohTegrxVe4tBdxOXuDYhbaHuahu5jIrh/YGzGR
         pjpgHxvwmmJ9e9DE7RLk7DMoQ2TIXSRrmUOo0Vkmy7By4eAppcQ1JEtHc32zuTpvOow3
         hhsGWCe11uV05gyWB5OZW8CISCxvSNFS+7g57o35d5j7hBQATslbIqVjsF6cMw1oSfst
         w9NjzWcUT3H9MLqtnOcgWPuPT79b8da6wwlNMZEbGZAMEYHJslV9bI0ezoqe1J3D7qYI
         li2A==
X-Gm-Message-State: AOJu0YyYyzl+vAe165thmpPKodkq2WguNypydeDXrQoV/qPSXim+LrtF
	fvTW8BWnJF4nVKps7EDaMBKxtO30rcn8SN8jwR64fNpf9xSSu/FfaA/NaB52yuOnmg==
X-Google-Smtp-Source: AGHT+IH7LJ/mqCUO19u/3mAYHeI4tLr5gb2ZtoYG2LWPCYbt06cffRXNGH3Nlz2ob5gZraHXDu5Eig==
X-Received: by 2002:a05:600c:35c3:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-4318b5a42edmr44666555e9.6.1729865576232;
        Fri, 25 Oct 2024 07:12:56 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:12:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 00/21] softfloat: Set 2-NaN propagation rule in float_status, not at compile time
Date: Fri, 25 Oct 2024 15:12:33 +0100
Message-Id: <20241025141254.2141506-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0XWo1beWVDNd

IEEE 758 does not define a fixed rule for which NaN to pick as the
result if both operands of a 2-operand operation are NaNs.  As a
result different architectures have ended up with different rules for
propagating NaNs.

QEMU currently hardcodes the NaN propagation logic into the binary,
because pickNaN() has an ifdef ladder for different targets.  We want
to make the propagation rule instead be selectable at runtime,
because:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting the guest
   select a NaN propagation rule at runtime
 * x86 specifies different propagation rules for x87 FPU ops and for
   SSE ops, and specifying the rule in the float_status would let us
   emulate this, instead of wrongly using the x87 rules everywhere
 * xtensa allows selection of NaN propagation rule at runtime;
   currently we implement this with the use_first_nan flag which
   is only used by xtensa; providing a general facility will let us
   remove this limited-purpose handling
                                                           
This series switches pickNaN away from the ifdef ladder. Instead
targets must always set a 2-NaN propagation rule via the new
set_float_2nan_prop_rule(), unless they are using default_nan_mode.
Patch 1 implements this in core softfloat (with a transitional
fallback to "use the old ifdef ladder logic" if the target doesn't
specify the propagation rule). Then subsequent patches convert
all the targets to set the rule explicitly. The final patch then
removes the remnants of the transitional logic.

I have included a couple of minor fixes for sparc, xtensa, m68k.
This is intended as a no-behaviour-change patchset, so although there
are a few places where I have noticed that the current behaviour
is not correct I have left these as TODO comments. A summary of
those TODOs and other oddities I have noticed but not tried to
tackle is:

 * hppa really ought to implement a CPU reset method
 * alpha also doesn't implement CPU reset
 * ppc sets tininess_before_rounding on fp_status but not on
   vec_status, so its behaviour there will vary between
   guest instructions; unclear to me if this is intended
 * x86 should set the float_2nan_prop_ab rule on env->sse_status
   (and maybe env->mmx_status, though 3DNow! insns don't handle
   NaNs in a documented way anyway)
 * alpha never had a case in the ifdef ladder so it uses the
   x87 propagation rule. It ought to use float_2nan_prop_ba.
 * openrisc didn't have an ifdef and also uses the x87 rule;
   this is probably wrong but I couldn't find anything documenting
   what it actually does
 * rx didn't have an ifdef and also uses the x87 rule;
   again, probably wrong

The next stage after this patchset, obviously, is to do the
same thing with pickNaNMulAdd(). That is a little trickier
because currently we ask it to do two things:
 * handle the "infinity * zero + NaN" corner case
 * pick a NaN when more than one operand is a NaN
My intention is to separate these out so that targets specify
both separately. This gives more orthogonality (e.g. Arm,
MIPS with !snan_bit_is_one and loongarch64 all have the same
"prefer SNaN over QNaN, prefer C over A over B" NaN selection
logic but they have different ideas about the infzero case).

(Once pickNaNMulAdd() is converted we will be able to remove
the current xtensa-specific use_first_nan flag.)

thanks
-- PMM

Peter Maydell (21):
  softfloat: Allow 2-operand NaN propagation rule to be set at runtime
  tests/fp: Explicitly set 2-NaN propagation rule
  target/arm: Explicitly set 2-NaN propagation rule
  target/mips: Explicitly set 2-NaN propagation rule
  target/loongarch: Explicitly set 2-NaN propagation rule
  target/hppa: Explicitly set 2-NaN propagation rule
  target/s390x: Explicitly set 2-NaN propagation rule
  target/ppc: Explicitly set 2-NaN propagation rule
  target/m68k: Explicitly set 2-NaN propagation rule
  target/m68k: Initialize float_status fields in gdb set/get functions
  target/sparc: Move cpu_put_fsr(env, 0) call to reset
  target/sparc: Explicitly set 2-NaN propagation rule
  target/xtensa: Factor out calls to set_use_first_nan()
  target/xtensa: Explicitly set 2-NaN propagation rule
  target/i386: Set 2-NaN propagation rule explicitly
  target/alpha: Explicitly set 2-NaN propagation rule
  target/microblaze: Move setting of float rounding mode to reset
  target/microblaze: Explicitly set 2-NaN propagation rule
  target/openrisc: Explicitly set 2-NaN propagation rule
  target/rx: Explicitly set 2-NaN propagation rule
  softfloat: Remove fallback rule from pickNaN()

 include/fpu/softfloat-helpers.h   |  11 +++
 include/fpu/softfloat-types.h     |  38 ++++++++
 target/i386/cpu.h                 |   3 +
 target/mips/fpu_helper.h          |  22 +++++
 target/xtensa/cpu.h               |   6 ++
 linux-user/arm/nwfpe/fpa11.c      |  18 ++++
 target/alpha/cpu.c                |  11 +++
 target/arm/cpu.c                  |  25 +++--
 target/hppa/fpu_helper.c          |   6 ++
 target/i386/cpu.c                 |   4 +
 target/i386/tcg/fpu_helper.c      |  40 ++++++++
 target/loongarch/tcg/fpu_helper.c |   1 +
 target/m68k/cpu.c                 |  16 +++
 target/m68k/fpu_helper.c          |   1 +
 target/m68k/helper.c              |   4 +-
 target/microblaze/cpu.c           |  10 +-
 target/mips/cpu.c                 |   2 +-
 target/mips/msa.c                 |  17 ++++
 target/openrisc/cpu.c             |   6 ++
 target/ppc/cpu_init.c             |   8 ++
 target/rx/cpu.c                   |   7 ++
 target/s390x/cpu.c                |   1 +
 target/sparc/cpu.c                |  10 +-
 target/sparc/fop_helper.c         |  10 +-
 target/xtensa/cpu.c               |   2 +-
 target/xtensa/fpu_helper.c        |  35 ++++---
 tests/fp/fp-bench.c               |   2 +
 tests/fp/fp-test-log2.c           |   1 +
 tests/fp/fp-test.c                |   2 +
 fpu/softfloat-specialize.c.inc    | 156 +++++++++++-------------------
 30 files changed, 346 insertions(+), 129 deletions(-)

-- 
2.34.1
