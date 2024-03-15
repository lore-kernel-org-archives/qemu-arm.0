Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp988791eju;
        Fri, 15 Mar 2024 06:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGG5JELSFhixyKcbgwBxnUxeu1NEqPsTISDk6yiqB5imea1n1wqOstYWuNChErknOTRQiR56lE03CTGjM82Jy5wzr5YefE
X-Received: by 2002:a19:8c57:0:b0:513:226c:651d with SMTP id i23-20020a198c57000000b00513226c651dmr2558459lfj.2.1710508155178;
        Fri, 15 Mar 2024 06:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508155; cv=none;
        d=google.com; s=arc-20160816;
        b=eogyuQK30EVaoaxQT+MAbAua5m1jn9dBV2Arw/9+q9oPzJgO+S8H7/zCLLLwV4VCh5
         N6ux9N/HKWKlS9QL9/BgkCrl/Eb7TY+GFL87vuo8+dJVWv6qmgpYKqmkBdYIW7OCHZSJ
         TQO51ASCqYd2v4BG87FGu/yAM9Z9iJNbTzFtWYFScho3n/NyFH+Vhw0NKzsbQeHPW7xC
         dU1YQAv+v05n7TWnFPP3RcjuQkN6ld5+VVvJJl0vr7wXQBuywzDJF3ccJHI6Q85kLWLg
         7jRqZcTJeJxHclKwt8VjrrzY2JcZVBhZGmJwlQd5FnuERc41LdAHrJWMxy5F+YQnC3hD
         C28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=7a422lMoFqhS7qWnbusg1+rx0QiF01UmLh0mI1ZQEY0=;
        fh=h/cs0EwCloDhZKdklh+9danKuLxjP+kB8c6a7wEisMc=;
        b=wFDmZyekt/XRGv9Q6PXdqqUlM55Fo3jqvoyKQHj0iB5e5YaZ9X/xGP32z87WNoNtbt
         fg7AEELPiRImPTp301giZq3CC7uiKzpbw34Kz6k0H+UR6Lh80s8aDzizMQo3dH20iWfS
         gSlyjh8V2Vx0/W7DRBS7364YNC1VH6UW9PGLnLxtxlQaFmbHbnRPJriAbLA5xWUI3dVB
         KRqA+tNYuM8dYxiEqiL7IkYjElq5pNYMG9T1aJH8OhaG9xWjw1sC0P+OUHzc6R5/GtRo
         NrkIC+XF+csOmg9kxI3HZi6/++Q0d/z4H+/+ZwimNuCm8FnOJ1eARzS9YPZPb5t4lz4M
         6I5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FdKtPWYX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g21-20020a19ee15000000b005135bbccdfcsor1186143lfb.29.2024.03.15.06.09.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FdKtPWYX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508155; x=1711112955; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7a422lMoFqhS7qWnbusg1+rx0QiF01UmLh0mI1ZQEY0=;
        b=FdKtPWYXovN0gddEFvmOtB28DYaQgwZFP5dmpyyfP7CGzmkU8Mamm1SieeogLFnzF7
         ZPptsItXEdN8R8XqZAHFi5nbE9LlkMaEKrik0pJmvC3kYQ8q+sfZLv3Rn66X80JOfKjX
         T6f2SLtT0cgtlrmi02U5Xkq3EQuFEdp/KTsh6CEuUgCyASb5aj+JIxSW7BzG7yKBEglX
         Tw4YzZRQGcWCyGmBj+X3weNEcqXolATkxN6weGD4c1YWmjrZ8KfjIoarH+AiBaEOeXot
         7487G+YYBBOPoxC8Dop3S1JRhKzDF9TJEu/Sr0nvhIrmHFxXZW/B1agc/QVbujakKsCu
         1ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508155; x=1711112955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7a422lMoFqhS7qWnbusg1+rx0QiF01UmLh0mI1ZQEY0=;
        b=wuQ41O7tY246Ocq5xRXODt+hmqRlhSWApLH02VqaLpK0RJFlugP4+x6vWWbSpZL/CK
         JCQSxxhxzdy0Cm39obVMBCkD+6R37Sr0gkgsWSynDkATGU+LXKWYncr/51Nok4sHLsvo
         Zx7ljRAgwR3Cm5IpUnl+ZxTkQRHZWb0Y+WpFBDSeQxVsm3QZ4nmkRgfghN+emZDXZBf5
         xJ7WJr7gl/WdFdoKYjQO284klRelXKfBkD0SSPMHdbXEed6nSjwQzVIfcSLAeBNjhO+C
         aQMZRU9vSbt4L6cbI45SpBmQhRXWtbcFZooUFs7p4bWLrWEyTZF1apB6+aYEjrSzJMhg
         ByFw==
X-Forwarded-Encrypted: i=1; AJvYcCWqOQeYysybQsMd5RvE+V+JzhrJmF2c0Gsx4KqEcnt2Cw3bG07JgKltK5ezH2IjdIeQhdPJ78Er1SAo+id16NInkAHFAytE
X-Gm-Message-State: AOJu0YyTFlDKLAd41JCVQUi5nTlKx/rw+ztHC9tyBcm2EphVA3RPLBdX
	eQrX5qekN7gu6QVFwRUxMoCveqpa/QY7ti3kk7JK7tnsYqWOwYJF5fAAzaXTsNePA/nVHBigZAw
	9eEI=
X-Google-Smtp-Source: AGHT+IFQmUy/dU+fupT8cYu33ialfeNRqZs47n4Rfj0aky+gjH4INiHFbcsT6qE9d0RgV4ZxVkrSVw==
X-Received: by 2002:a05:6512:468:b0:512:e02f:9fa7 with SMTP id x8-20020a056512046800b00512e02f9fa7mr2636463lfd.1.1710508154576;
        Fri, 15 Mar 2024 06:09:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id gx27-20020a1709068a5b00b00a3d11feb32esm1690762ejc.186.2024.03.15.06.09.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 00/21] qapi: Make @query-cpu-definitions command target-agnostic
Date: Fri, 15 Mar 2024 14:08:48 +0100
Message-ID: <20240315130910.15750-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gfulmQ4vuKKz

Hi Alex, Markus,

Markus mentioned QAPI problems with the heterogeneous emulation
binary. My understanding is, while QAPI can use host-specific
conditional (OS, library available, configure option), it
shouldn't use target-specific ones.

This series is an example on how to remove target specific
bits from the @query-cpu-definitions command. Target specific
code is registered as CPUClass handlers, then a generic method
is used, iterating over all targets built in.

The first set of patches were already posted / reviewed last
year.

The PPC and S390X targets still need work (help welcomed),
however the code is useful enough to be tested and see if this
is a good approach.

The only drawback is a change in QAPI introspection, because
targets not implementing @query-cpu-definitions were returning
"CommandNotFound". My view is this was an incomplete
implementation, rather than a feature.

Regards,

Phil.

Philippe Mathieu-Daudé (21):
  target/i386: Declare CPU QOM types using DEFINE_TYPES() macro
  target/mips: Declare CPU QOM types using DEFINE_TYPES() macro
  target/ppc: Declare CPU QOM types using DEFINE_TYPES() macro
  target/sparc: Declare CPU QOM types using DEFINE_TYPES() macro
  cpus: Open code OBJECT_DECLARE_TYPE() in OBJECT_DECLARE_CPU_TYPE()
  target/i386: Make X86_CPU common to new I386_CPU / X86_64_CPU types
  target/mips: Make MIPS_CPU common to new MIPS32_CPU / MIPS64_CPU types
  target/sparc: Make SPARC_CPU common to new SPARC32_CPU/SPARC64_CPU
    types
  qapi: Merge machine-common.json with qapi/machine.json
  qapi: Make CpuModel* definitions target agnostic
  qapi: Make CpuDefinitionInfo target agnostic
  system: Introduce QemuArchBit enum
  system: Introduce cpu_typename_by_arch_bit()
  system: Introduce QMP generic_query_cpu_definitions()
  target/arm: Use QMP generic_query_cpu_definitions()
  target/loongarch: Use QMP generic_query_cpu_definitions()
  target/riscv: Use QMP generic_query_cpu_definitions()
  target/i386: Use QMP generic_query_cpu_definitions()
  target/ppc: Factor ppc_add_alias_definitions() out
  target/ppc: Use QMP generic_query_cpu_definitions()
  qapi: Make @query-cpu-definitions target-agnostic

 MAINTAINERS                           |   3 +-
 qapi/machine-common.json              |  21 ----
 qapi/machine-target.json              | 167 +-------------------------
 qapi/machine.json                     | 166 ++++++++++++++++++++++++-
 qapi/qapi-schema.json                 |   1 -
 include/hw/core/cpu.h                 |   7 +-
 include/hw/core/sysemu-cpu-ops.h      |  14 +++
 include/sysemu/arch_init.h            |  71 +++++++----
 target/i386/cpu-qom.h                 |  16 ++-
 target/mips/cpu-qom.h                 |  13 +-
 target/ppc/cpu-models.h               |   4 +
 target/riscv/cpu.h                    |   2 +
 target/s390x/cpu.h                    |   2 +-
 target/sparc/cpu-qom.h                |   9 +-
 system/cpu-qmp-cmds.c                 |  71 +++++++++++
 system/cpu-qom-helpers.c              |  58 +++++++++
 target/arm/arm-qmp-cmds.c             |  27 -----
 target/i386/cpu.c                     |  77 ++++++------
 target/loongarch/loongarch-qmp-cmds.c |  25 ----
 target/mips/cpu.c                     |  34 ++++--
 target/mips/sysemu/mips-qmp-cmds.c    |  31 -----
 target/ppc/cpu_init.c                 |  53 ++++----
 target/ppc/ppc-qmp-cmds.c             |  31 +----
 target/riscv/cpu.c                    |   1 +
 target/riscv/riscv-qmp-cmds.c         |  13 +-
 target/sparc/cpu.c                    |  35 ++++--
 tests/qtest/cpu-plug-test.c           |   2 +-
 qapi/meson.build                      |   1 -
 system/meson.build                    |   2 +
 29 files changed, 515 insertions(+), 442 deletions(-)
 delete mode 100644 qapi/machine-common.json
 create mode 100644 system/cpu-qmp-cmds.c
 create mode 100644 system/cpu-qom-helpers.c

-- 
2.41.0
