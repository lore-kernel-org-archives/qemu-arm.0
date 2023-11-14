Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082295ejc;
        Tue, 14 Nov 2023 06:38:21 -0800 (PST)
X-Received: by 2002:ac2:57d4:0:b0:500:ac10:1641 with SMTP id k20-20020ac257d4000000b00500ac101641mr6933189lfo.46.1699972701135;
        Tue, 14 Nov 2023 06:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972701; cv=none;
        d=google.com; s=arc-20160816;
        b=hOEeVyNDGqMGJaoIkTewgQTD42rkFg7J9ZF63CpZLagMNytuSJe+wvU2fhhGDyz4K6
         t6qcpkKFYNA/vTriLRUtAU8Jo5FlX+F6YTriWzcVh3CdFbJ47Ce4jn1WIN7plBvrBb8Y
         yHNC+tb7ulm+elZaPJav5MP+MdS66Dk24gOFl9tNoJstuooOMelWQ6ZetOQkEHQLpAbK
         z1SYGkBf9WHLZseEABzk9VRTxadxAyVNkk+v/iGN3TNQ/Wy5idvqDRzZ5RX3JD+4WO5D
         azJWOlC+5Re9WitZhtclFJJ72HHr0RQTSUbOeXh8UyULPHw2MjhvnZrBWPNahaFJC04p
         +x0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=FMnSSW8jr/cJKCHmkfkuNGM9r6aQH+5mtjx4iGXWqMs=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=tgvxzvh/0/t8u9ATPtXGXxjux4WoC1OsZUQv4NnG91sb5F7jMVp+0g00NGORzdkTJ5
         RRCwBTgyzlr9MO/x0sxipO3pKQfIyv9/46gzl/lGFpkRQXe6NmV2jtkNOoKU6Fk2eRSb
         KxCCOjwI0pk5rICYV0ZCyhbL0KD4XjW2eWNrRWn6mDN+dam82OHHdxQ0Sn/oraZAdyFJ
         LjHDRtpxqfFcIT8e08MyEF6PWSmWYgGiZBcm7CR9RA/6m/IYTWeCYtPwatPFpvJSokao
         LeZyYO1Jntjm6p7/LYCdCEHZ4bjMtY/qRpvera4muLbdN0TJ8SBrZRpy+wnq/hfe+tkV
         O/bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXEZwyc4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d22-20020a50cd56000000b0053eec388ae4sor1744439edj.10.2023.11.14.06.38.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXEZwyc4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972701; x=1700577501; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMnSSW8jr/cJKCHmkfkuNGM9r6aQH+5mtjx4iGXWqMs=;
        b=kXEZwyc4NYr4IveFW6CbP3shXfPX3SRn+BKMHvbvr1F04+Jqa8IlYw4s3qYaqI97zO
         cQ0SlavdiHyF6TlLlyY6brANJvptu6BbMAoKM9B1EI6BN/zObpVLjXJUnM/IayZCg+yw
         zvo0vlw3j8UDXjgymGlFmDLaTD2Ck3kDioepFD2ZSD9k84l2L+vV6o/A8bUQwQivb4gl
         LWdN48U700jWm/v2f6QsR/wScNov3asg9ZjBsYn8s+PsJQb/WEnWLDtgOkr8ZpxwH8JV
         OkKh8pd3caIQP2GIZTzhPqBFjpjhmAubWjlP7nmistklMIHXcOQDsW4nXJI6TTx9STzK
         NQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972701; x=1700577501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMnSSW8jr/cJKCHmkfkuNGM9r6aQH+5mtjx4iGXWqMs=;
        b=th0lllr2l6zep2DbFcJaV8U/q1s8Wmnegh0GEU7Pl8pA9e8KODzP0dbTDC2nAkoVBG
         HNnSEtcPlaNaUUQRBFekVn1KbaZw8Yb5RAglT5P3wyAQdQMd0mK70I5kitOIn847VfgP
         6zflA+sOmSESDu53HICmn9gapI4X6t7ZO0rLosaSfYGYwuBIXv+tike5idh6LHCnjdY3
         YWzjEeWr0uRERZxWfaT3QVdt5Az2BFZIaKUzjJpA5WnXw+Q+CzH4jBY0cxeBiYSbZYDJ
         ZpBHtoInIQihE8SVo9jaTmPdqqRqpdew6AK1jR+nJH13KcvOhkQhD1N3xZTSIm3BVOea
         I9gg==
X-Gm-Message-State: AOJu0YxDFoTAHt1iD6wuUz02Ja5lmDRzbetQ1J7Qisg1oRV1ACgaxLgq
	VUKKxUOkE3V+Zdve3muLtZ63VrJw
X-Google-Smtp-Source: AGHT+IGalhPiUDY/2vhmD3Lr4wAa0t8q7dAjDO0/CMsaGIPZeXHvHP6kcXfcCCLtVPKEbEl31jhTGg==
X-Received: by 2002:aa7:cf12:0:b0:526:9cfb:c12 with SMTP id a18-20020aa7cf12000000b005269cfb0c12mr6182599edy.38.1699972700668;
        Tue, 14 Nov 2023 06:38:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id r17-20020aa7da11000000b0054554a7bbedsm5137696eds.24.2023.11.14.06.38.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 00/19] hw/xen: Have most of Xen files become target-agnostic
Date: Tue, 14 Nov 2023 15:37:56 +0100
Message-ID: <20231114143816.71079-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: aN5CoSr+tTMI

Missing review: 4-10,13,16,18-19

Since v1:
- Rework handle_ioreq() patch (Richard)
- Call xen_enabled() and remove various stubs
- Use QEMU_ALIGNED() in xen_blkif header
- Rename ram_memory -> xen_memory
- Have files using Xen API also use its CPPFLAGS
- Add missing license
- Added Avocado tag
- Added R-b tags

Hi,

After discussing with Alex Bennée I realized most Xen code
should be target-agnostic. David Woodhouse confirmed that
last week, so I had a quick look and here is the result.

More work is required to be able to instanciate Xen HW in
an heterogeneous machine, but this doesn't make sense yet
until we can run multiple accelerators concurrently.

Tested running on x86_64/aarch64 Linux hosts:

  $ make check-avocado AVOCADO_TAGS='guest:xen'

Regards,

Phil.

Philippe Mathieu-Daudé (19):
  tests/avocado: Add 'guest:xen' tag to tests running Xen guest
  sysemu/xen: Forbid using Xen headers in user emulation
  sysemu/xen-mapcache: Check Xen availability with
    CONFIG_XEN_IS_POSSIBLE
  system/physmem: Do not include 'hw/xen/xen.h' but 'sysemu/xen.h'
  hw/display: Restrict xen_register_framebuffer() call to Xen
  hw/pci/msi: Restrict xen_is_pirq_msi() call to Xen
  hw/xen: Remove unnecessary xen_hvm_inject_msi() stub
  hw/xen: Remove unused Xen stubs
  hw/block/xen_blkif: Align structs with QEMU_ALIGNED() instead of
    #pragma
  hw/xen: Rename 'ram_memory' global variable as 'xen_memory'
  hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
  hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
  hw/xen: Remove use of 'target_ulong' in handle_ioreq()
  hw/xen: Use target-agnostic qemu_target_page_bits()
  hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
  hw/xen/xen_pt: Add missing license
  hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
  hw/i386/xen: Compile 'xen-hvm.c' with Xen CPPFLAGS
  hw/xen: Have most of Xen files become target-agnostic

 hw/block/xen_blkif.h            |  8 +++-----
 hw/xen/xen_pt.h                 | 24 ++++++++++--------------
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  9 +++++++--
 include/hw/xen/xen_igd.h        | 33 +++++++++++++++++++++++++++++++++
 include/sysemu/xen-mapcache.h   |  3 ++-
 include/sysemu/xen.h            |  8 ++++----
 accel/xen/xen-all.c             |  1 +
 hw/arm/xen_arm.c                | 12 ++++++------
 hw/display/vga.c                |  5 ++++-
 hw/i386/pc_piix.c               |  1 +
 hw/i386/xen/xen-hvm.c           | 18 +++++++++---------
 hw/pci/msi.c                    |  3 ++-
 hw/xen/xen-hvm-common.c         | 23 ++++++++++++-----------
 hw/xen/xen_pt.c                 |  3 ++-
 hw/xen/xen_pt_config_init.c     |  3 ++-
 hw/xen/xen_pt_graphics.c        |  3 ++-
 hw/xen/xen_pt_stub.c            |  2 +-
 stubs/xen-hw-stub.c             | 28 ----------------------------
 system/physmem.c                |  2 +-
 accel/xen/meson.build           |  2 +-
 hw/block/dataplane/meson.build  |  2 +-
 hw/i386/xen/meson.build         |  4 +++-
 hw/xen/meson.build              | 21 ++++++++++-----------
 tests/avocado/boot_xen.py       |  3 +++
 tests/avocado/kvm_xen_guest.py  |  1 +
 28 files changed, 121 insertions(+), 126 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen_igd.h

-- 
2.41.0
