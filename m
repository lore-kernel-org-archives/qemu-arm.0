Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780910lfa;
        Fri, 16 Oct 2020 11:42:10 -0700 (PDT)
X-Received: by 2002:a17:902:9a84:b029:d3:8b4f:50d5 with SMTP id w4-20020a1709029a84b02900d38b4f50d5mr5554682plp.48.1602873730564;
        Fri, 16 Oct 2020 11:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873730; cv=none;
        d=google.com; s=arc-20160816;
        b=rDNCpLO3f10jmGkG6UzazsnLvodJJgQ3djLy4AlhgkanetdejqGCWWxq++EpoJxfAU
         Qf3fk3n3LPPjLDQIsou1snSyEdcaHr4BoUbVRyO/6ZBxp3EdApGaM6nWqsJX9mUcWXzG
         VuXb+SQ5pA/4fg8mtbS50+oERaH2PVcnV6W6XlwN+UDgAQcEv7k8AxlAHO6DU9Tl4bKI
         l1t0+qKKH7g9f2Pt8RGnmYlO52k7HNfubVn+JZRytmqrrzqWvlDQitStgszL3CPzoN75
         e7dceF0CdCWvNjDo1PagtDDXs3dNvTmvkTpbOrbdybOUgMax6Ods4TQvb3OVK4i28a+x
         JE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=I0n3SezFuJzE05AkRQW/o6Jz2n22t2TpjyOtThyQzb4=;
        b=Z9t6arXoXc1/k6dYAw+GZlt+osZeqVR/WY3yXtREYMZG+vct4hxZ8rnUH9iGRl8S09
         xq/gvQMrFpp882yttbFRL3Z3efMOIqvPhsUReoI86ADOQXutdVBOqS/0+t8EaV4yKN8F
         1ZlvqXV0B0qqnUwSgD6Xry5CojU9VZ3T9uvHODrqHyrM7ggOS2nZwg0PxzqAhUFfyDs3
         02lg6eqHLlVnkRyaaNxYvE65JxJBX2U4K1TzR2Br3Md8iVpb85B0mr7Qsp4eQlWYvc6O
         3qyXnIacKGuefTQGNBqsV+WLEf/P0iMO8XJIX1GKp2XS+4tUh8KhqkxksKzTpNzLW5wW
         Jefg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iuy1AVBN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b2sor1551055pgl.39.2020.10.16.11.42.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iuy1AVBN;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0n3SezFuJzE05AkRQW/o6Jz2n22t2TpjyOtThyQzb4=;
        b=iuy1AVBNvqbPAtssMl2XSpXJJmGsZsvrDj50t+B8BVPDbhn7ojirv0cUjuZnoOIpkL
         DgZwUiHARdrv9AZQX8F5b5+OO0VPpVHTQ9JNTBMMyR9QpHR62+JP8G0Sn7fSV3ea6f2e
         +hI7439b59gwbmeEILgXbwIti72lkhMBnGltKyy8K9JY8UbrywOjrqL1d5PphKjc367y
         J2kBOHlkpGvMSeoBVEchzpULqgFScr2jYNa3iE9CrDo3uTVQdm7GDESkR7/wNl048fZm
         fI/PBhmxxiFOzgvTSExG/cdVX4wuNy+aRNUREOu9Es84Ccnkwt7qaz0FpCYDXEbdDGU/
         mvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0n3SezFuJzE05AkRQW/o6Jz2n22t2TpjyOtThyQzb4=;
        b=RGtvKDe+mJGyEURwwVhFpan5/DEXn031FxIAqUgHtWStYDE/rYygFYgGHPa/PB+tA+
         x7VEuVVRl58cFrq930pPkhqB5rSRA245EHvAHIyLxLeOsXQxVqrPE6xn9wi9KX2z1z6i
         90XEzMpKkTuJmcloL3Nmiqu+9J+W5TxAaFdOkAUoFbE46jdpmo/CVH9FZL9iQNqMcI/0
         C3ftQ/ctctpgmjV4OiGJXDvKfCyYOyHS7reFqsUTAhkStaAcH2yxHqwm/aOtmp48TCvg
         L0Dl0NOlhhQU7u+1DkvJxTRz0OuyiwjpqIEvP0es0DAo5V25n7s+z1ZcYF9Cx1a2C3Sz
         /e0Q==
X-Gm-Message-State: AOAM5323VWvnmAsAXAor8TmhQpm31Z3mGZ9k+AkxZjFo6FQkIInwXtxs
	6hTteJpZeuo7dKJbFiKBZWBm0brJ
X-Google-Smtp-Source: ABdhPJzIpFPgg5j6S3Obbh3WqLNDyBhiTBbeEYhFm73Qm2hlwrT64pTiPgqOpqxu+tx12g/LyTyUIg==
X-Received: by 2002:a63:5f97:: with SMTP id t145mr4358892pgb.115.1602873729909;
        Fri, 16 Oct 2020 11:42:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 00/12] linux-user: User support for AArch64 BTI
Date: Fri, 16 Oct 2020 11:41:55 -0700
Message-Id: <20201016184207.786698-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L8uyTTWE2Sim

The kernel abi for this was merged in v5.8, just as the qemu 5.1
merge window was closing, so this slipped to the next dev cycle.

Changes from v10:
  * Include Phil's plug of interp_name memory leak.
  * Convert error reporting to Error api.
  * Mirror the kernel's code structure for parsing notes
    (though Error means that it's not exactly the same).
  * Split aarch64 stuff from basic note parsing patch.

Changes from v9:
  * Split what is now patch 7 into 3 more (pmm).
  * All prerequisites are now upstream.


r~


Philippe Mathieu-Daudé (1):
  linux-user/elfload: Avoid leaking interp_name using GLib memory API

Richard Henderson (11):
  linux-user/aarch64: Reset btype for signals
  linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
  include/elf: Add defines related to GNU property notes for AArch64
  linux-user/elfload: Fix coding style in load_elf_image
  linux-user/elfload: Adjust iteration over phdr
  linux-user/elfload: Move PT_INTERP detection to first loop
  linux-user/elfload: Use Error for load_elf_image
  linux-user/elfload: Use Error for load_elf_interp
  linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0 notes
  linux-user/elfload: Parse GNU_PROPERTY_AARCH64_FEATURE_1_AND
  tests/tcg/aarch64: Add bti smoke tests

 include/elf.h                     |  22 ++
 include/exec/cpu-all.h            |   2 +
 linux-user/qemu.h                 |   4 +
 linux-user/syscall_defs.h         |   4 +
 target/arm/cpu.h                  |   5 +
 linux-user/aarch64/signal.c       |  10 +-
 linux-user/elfload.c              | 326 +++++++++++++++++++++++++-----
 linux-user/mmap.c                 |  16 ++
 target/arm/translate-a64.c        |   6 +-
 tests/tcg/aarch64/bti-1.c         |  62 ++++++
 tests/tcg/aarch64/bti-2.c         | 108 ++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   |  51 +++++
 tests/tcg/aarch64/Makefile.target |  10 +
 tests/tcg/configure.sh            |   4 +
 14 files changed, 569 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-2.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

-- 
2.25.1
