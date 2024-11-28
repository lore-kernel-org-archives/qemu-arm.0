Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413001njb;
        Thu, 28 Nov 2024 02:43:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWax6LbscmW4jSZmIHABG3L4aDpOYn5SgS1E4fByLYYWZoEPT9ytn6F1y6s5JnURd9Sja1wYlB6ckq2eg==@linaro.org
X-Received: by 2002:a05:600c:1d0f:b0:434:9fc8:63a7 with SMTP id 5b1f17b1804b1-434afb9539dmr23235265e9.1.1732790593394;
        Thu, 28 Nov 2024 02:43:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790593; cv=none;
        d=google.com; s=arc-20240605;
        b=F44FfLiZhNx+4AAl7Cg9CFPwAhW5SmR8ibvf8IgDHg8txuasXzILqtJXzw2gKm7/c/
         lW1hhK1iasgKCvVljP3drzRMnFcM3dxyLqSSUxlSG7nwnsthy9Iw14BVNHrW22thHQny
         A0xYcqo2wzmhZEloz1G04GHArD8oO+MdVN3SoXivbmgDvZT8VuskjagdH46Xpukwik8Q
         MTEHYz93CXO4BMn22OowjpZZ66RzUXtm558wMInPIaUdhwS0DpY0dEZF7PEuWH+dE+Y7
         8SEtAxsJ9L35IPu+x2nm/KkbM3W0lGdXi1AOadqqWyVhaXh6RD2h9XNxScnpuCAuLEwf
         Jr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=oYk4E/ewRoQTnBgSxniNQvwpaGZ6rvHTwiB73W6YXQM=;
        fh=/7LY3hRmTtlyp74vkvl7E3+hqsvZhAg0IoojsCcN6L4=;
        b=UAKhrpJ1diod7S7dfYHviysIr7465uurhHwemqx8gPDjmiV9zZMP1UF5pNZYskL1Uf
         xQ+pyhHyWNzO5GOfZTZA/f1dU6BFEIMO1DHNtW7aUvtjiPxpXZav+BKyYvPt/hJVFsAb
         9sYByhmZnuSpiEM54znvpfC02svEMmlQ4ZIjBA3vRP2zbeXs8GEXEppRvVptM4NX0Et4
         y54sC8tMGgQDnMXMiZNO2j1nHba/G2DD8Y0ICz2cqt0wapM2GErugKNM4uweEn714OQi
         UZuwe7JwNp4yolt1d1rpNarkZ7cz3TCBJ0/IJYMo9/2HK4uvZgi44VZnk4ueRrzdQLL8
         qAhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJGg+5tI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434aa75ca74sor9481905e9.1.2024.11.28.02.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJGg+5tI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790593; x=1733395393; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oYk4E/ewRoQTnBgSxniNQvwpaGZ6rvHTwiB73W6YXQM=;
        b=sJGg+5tISz7QfrC6oyDNNPLgm+OGJN7takRbi18aVdznQLqoBaKt59YNb+j+sAr8qN
         937S9l/pqlGn2cxfKQdHFC+AYpm7pBwlCERV5W95UbMGroEzIIcNighCyPGgU8a9SQYm
         hmhGJz5IZin+rWePXEAtIacJp2MSU6wGPD3BdBY1IXbM/ulA32dnJXfEh+bdTO9f46ra
         9taKGXHDW3J0CFyYvXHW0fFQrCH69Eg4CKiMJqvcS3ItZF7hmdG00D4JHm4w/T5Cavli
         jp/vnIYsqkGZxKTtI1oplUkTW9wuWZ4gZ8wMvZpXSEsZZiWUUN6H7uMhuyiCn6Dni5Ql
         5JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790593; x=1733395393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYk4E/ewRoQTnBgSxniNQvwpaGZ6rvHTwiB73W6YXQM=;
        b=mPuDZuMoBUpPNzMaeU6XCG+0K5hKMmHZa7XnxrS7jnwDC3YzWpG0+xoOfamW1+cEo3
         zL+jUmP9YkX1tMThBaoONBc2S/KIbYacegHT07gfnCp+n1m+EZsebgoanohqCauy9QQz
         TzVF/7U41T0NRTw/dgaOHwd7FUWXbmcU73W5HDOBFkEPRNZ3lXoxJur3hUxj3BFW4IC7
         PtH4GI1hiKFnpAfQ5mtc1zQTekiqgC2CJUQVTAqnmxn1IUsgO4EaSgXnw7gE0cSmVSU/
         DGOq0sZtnUj1CPIre7HfA7W2fWDHBnvbkJ50kQGBkHj8M+95v2IKrq8TUvjcyMAF930l
         N5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvuMvKMg+71Rl0EBSWfDslFlQqy/xNTuwcgIMB2yALYR1LlwLzracm/dbTZWb4GQUT4aqUVxRqNg85Xg==@linaro.org
X-Gm-Message-State: AOJu0YwhbyLZQRyIp+vj3/9+PGsEC6xCwoaUo4p+sNFlpmA7DJWOD/wC
	Cwz8jbrCIHG6kpeI0BfFUw4THzq7agVsvu69y89Z8gJOrrDm74ToDYRW14Dik4CVebCxLs88Z6g
	Ukho=
X-Gm-Gg: ASbGncsie+xkMGL0NWaD8RXr3teNhvwgFIg6AMlzb69Knj46a3wE/QbSeSO2b6g8z30
	RS+98cynmR7BIg9HeB+ve1J1qYsVZzlOGllf9q9McuPrIv70doCPY6m2fasIsxRAMPyuT67tzki
	ts867c+2gwyT19WYkN6vdN0hdwcZxwqIdR9CHv5EyMC05bb49cOBZtRLS0leMHMKh5g9PAvb1m9
	iyHt7zlFEwi83ZHaPvyuJ/LIy3vAPBhPLMZFFlt7KdhDayZ5AjtIho=
X-Google-Smtp-Source: AGHT+IFkuO7dI1m1sjtGwwDC6v8OH5tPS+P3BTWrlwOrTAYP6u2lYPXY+a46HLuX0BG285SHONUlDQ==
X-Received: by 2002:a05:600c:5123:b0:434:9dcb:2f84 with SMTP id 5b1f17b1804b1-434afb8decdmr22239075e9.2.1732790592652;
        Thu, 28 Nov 2024 02:43:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:12 -0800 (PST)
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
Subject: [PATCH for-10.0 00/25] fpu: Make pickNaNMulAdd behaviour runtime selected
Date: Thu, 28 Nov 2024 10:42:45 +0000
Message-Id: <20241128104310.3452934-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: busPNo4FmNBX

This patchset does the same thing we already did for pickNaN() to
pickNaNMulAdd() -- it replaces the compile-time ifdef ladder that
selected target-specific NaN propagation behaviour with checking some
runtime selectable settings in the float_status.  The motivation is:
 * this will let us have multiple targets in one QEMU binary
 * the Arm FEAT_AFP architectural feature includes letting
   the guest select a NaN propagation rule at runtime
                 
The current ifdef ladder merges two different kinds of
implementation-specific behaviour:
 * handling of the (inf * zero) + NaN special case
 * selection of a NaN to propagate when more than one input is a NaN

The refactoring splits these out into two different settings, because
what a target chose for one of them isn't correlated with its
choice on the other one.

Mostly this series is not intended to have any guest visible behaviour
changes. There is one exception: the "default implementation" at the
bottom of the old ifdef ladder did not raise Invalid for the (0 * inf)
+ NaN case. This is definitely not correct, and basically any targets
using that part of the ifdef ladder had a bug because they didn't
implement their actual correct behaviour. The architectures using the
default case are i386, hppa, sh4 and tricore, and they will now raise
the Invalid exception in this case. (I checked the architecture manuals
for those architectures and they all say it should raise Invalid.)
Fixing this bug in the first patch means we don't need to have runtime
selection of a behaviour that's not actually what these targets do.
(It also means we can reorder the code to avoid calling pickNaNMulAdd()
for any target which sets default_nan_mode, as we do for pickNaN().)

The rest of the patchset is structured like the pickNaN() refactoring
-- introduce the runtime selection field in the float_status word, but
leave the ifdef ladder in place as fallback, then convert each target
one at at time.  We do the info-zero-nan setting first, then the NaN
propagation order setting.

Finally, once we're done we can remove the use_first_nan field, which
was an Xtensa-specific way to select the NaN propagation rules at
runtime.

Tested with 'make check-functional' and 'make check-avocado'
and 'make check-tcg'.

thanks
-- PMM

Peter Maydell (25):
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

 include/fpu/softfloat-helpers.h   |  27 +++-
 include/fpu/softfloat-types.h     |  61 ++++++++-
 target/mips/fpu_helper.h          |  13 ++
 target/arm/cpu.c                  |   8 ++
 target/hppa/fpu_helper.c          |  10 ++
 target/i386/tcg/fpu_helper.c      |   9 ++
 target/loongarch/tcg/fpu_helper.c |   6 +
 target/mips/msa.c                 |   7 +
 target/ppc/cpu_init.c             |  15 +++
 target/s390x/cpu.c                |   3 +
 target/sparc/cpu.c                |   4 +
 target/xtensa/cpu.c               |   2 +
 target/xtensa/fpu_helper.c        |   3 +-
 tests/fp/fp-bench.c               |   6 +
 tests/fp/fp-test.c                |   6 +
 fpu/softfloat-parts.c.inc         |  19 ++-
 fpu/softfloat-specialize.c.inc    | 206 ++++++++----------------------
 17 files changed, 236 insertions(+), 169 deletions(-)

-- 
2.34.1
