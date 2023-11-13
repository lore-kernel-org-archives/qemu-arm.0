Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1407950ejc;
        Mon, 13 Nov 2023 07:21:18 -0800 (PST)
X-Received: by 2002:a17:906:66ca:b0:9ae:73ca:bbad with SMTP id k10-20020a17090666ca00b009ae73cabbadmr4784227ejp.43.1699888877930;
        Mon, 13 Nov 2023 07:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699888877; cv=none;
        d=google.com; s=arc-20160816;
        b=jzkd5olpnk/o4Wz5TdRsEqjWVH7nlB1TYzO4afu7dBbRxMcyEvxjg5aBhkyFBYWDZ/
         m7Qih+3zy6LEvSze1DtvXtNzmQb+LC59EZdmasGVqORzdc49n7rYwQQ/iy1vCuVYjTPx
         3h0K37D9NvtUXPa2KbmcbmK4ZWWBk08H+RNJvQWP2LV88B4+lrfNJUS/O4A8wx2PkFsw
         VeKc1fXR1sYZ9NHrA4Iz0vYtNwsmT6ulrfRZFfpe/X5BgzMV6G/xBmteWDHkGBWzwLhw
         wB/Zzm8eagKtaBNq7F+FWXn33E6VYMZPYI2wUv/b2pmTZVTyocTadMWuQv/yknGcEiXW
         MJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=wYPq4PnrkT6VT7CGpVPJFK/tNxRA7Q2Z3pzO9BbyyC0=;
        fh=E0jvqUTVnbyPitMGLtsCjS/srUbMS2WTNKk9XEDC2rY=;
        b=PQFEiAPmCBlbr+Sqags2fXXyhgDygbE6oHMEnCxRoKV8xXtV87N7ay6PsxDPxuv9yB
         2zw460aG5rJp0wONs1+mdifnId1trx36N24I2bEy7Lu6L/fmDu4Npj6oLS9wik9kOAzp
         kgx/EH34uzxz4DT8ECztIBKL8UB8KxeMamIkTTyr9gZkp3NgRcayOCDXfSQxIIeS5mMq
         GZyg5ZXJz/2T4lBnSLMhAH0Ugek3sOPrIFitXCDofZDwSUSZC9p8tCzTM4FhEEZEhKp0
         /tLMbfSP/7lTQ3xETLWS1WKcIaZTR/E7Behe8Dngc2KxpjwAEIX9q4UB0cj4EJkierxN
         XvwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pix8C1Bp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s16-20020a170906221000b009b2c44483desor1166237ejs.7.2023.11.13.07.21.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pix8C1Bp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888877; x=1700493677; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYPq4PnrkT6VT7CGpVPJFK/tNxRA7Q2Z3pzO9BbyyC0=;
        b=Pix8C1BphPB+Kq84EraWWRMrA0dMbrmpFpQHgqoo1sgU2rvc4sHwNmBOFzSM0fpvhp
         0iytcP1QyuqMDZAcFS77CbS8CHtvxaA1NVkI4dyoVdVg9IN5MZA56KXLqBvri75ich0z
         JXfNO/9ySukiWdPbTOd4rV3UlDJsg2ss+7WzUUpRyi/ojBPz67zrfUN7PV9zKFB8uJmi
         8+XPGKvuDh8Axeug/vFxUhAMBvFUAvrjMJB5l8MBzE4QeGwxdXmx693gfUh6U89oVOrX
         DRZjOKwOSfBCfh0xOHPlLjXS7G2lMGos/m/+/W1HGJ3cy4ehz6FEvImnhZkM2rfugX+c
         iGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888877; x=1700493677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYPq4PnrkT6VT7CGpVPJFK/tNxRA7Q2Z3pzO9BbyyC0=;
        b=IVmXS1+G1Sc/o/wxrgWDrTJ9fVu9c4xbwy+ieENRSj6qC+tQvyGbXdD7dEFM7IHjxz
         cOn3WgrjKVSNi/YXa+3rhElb6yuu1trm+cjezppF2TherfS43rszxX+KVsx/GXdpnR87
         OzlI9xlktXNU1lXPWPyQFSZoh2FkORfB2SBnrp4SNSlMgflePZf9D3Q/TtSjKt/76Ntc
         NL85DH+oaDTFpujIxopxjOhCsWAwLobZJvlnX8kf51oQ1luR3SQ2kvD4//I59J8HfExW
         PQ4OnPbqGTQHC2Y7Ju90gMtNeNwO7CqrmBm8OtcTUSTyKxaADNf203M9rj34mbPuXjtt
         d7uA==
X-Gm-Message-State: AOJu0YxtGt59OxzBQx7lYHPSBGvtJ+CQiBqe35V71t7ScdbrqEzACMN6
	zN8OGQM4Q6tG/rVBZX45B8Pfrhgv
X-Google-Smtp-Source: AGHT+IF3A9n9kAcrQZnsw9wrjTnx3rsvapxiH3ZCQBhhtTiOatMf4sVc2qaWUo7af2ThaKbG2fzFSA==
X-Received: by 2002:a17:906:410e:b0:9bf:b022:dc7 with SMTP id j14-20020a170906410e00b009bfb0220dc7mr5409271ejk.48.1699888877542;
        Mon, 13 Nov 2023 07:21:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id o9-20020a1709062e8900b00985ed2f1584sm4168622eji.187.2023.11.13.07.21.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Nov 2023 07:21:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 00/10] hw/xen: Have most of Xen files become target-agnostic
Date: Mon, 13 Nov 2023 16:21:03 +0100
Message-ID: <20231113152114.47916-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: xrbfH27qeetM

Hi,

After discussing with Alex Bennée I realized most Xen code
should be target-agnostic. David Woodhouse confirmed that
last week, so I had a quick look and here is the result.

More work is required to be able to instanciate Xen HW in
an heterogeneous machine, but this doesn't make sense yet
until we can run multiple accelerators concurrently.

Only build-tested.

Regards,

Phil.

Philippe Mathieu-Daudé (10):
  sysemu/xen: Forbid using Xen headers in user emulation
  hw/xen/xen_arch_hvm: Rename prototypes using 'xen_arch_' prefix
  hw/xen: Merge 'hw/xen/arch_hvm.h' in 'hw/xen/xen-hvm-common.h'
  hw/xen: Factor xen_arch_align_ioreq_data() out of handle_ioreq()
  hw/xen: Use target-agnostic qemu_target_page_bits()
  hw/xen: Reduce inclusion of 'cpu.h' to target-specific sources
  sysemu/xen-mapcache: Check Xen availability with
    CONFIG_XEN_IS_POSSIBLE
  system/physmem: Only include 'hw/xen/xen.h' when Xen is available
  hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
  hw/xen: Have most of Xen files become target-agnostic

 hw/xen/xen_pt.h                 | 14 --------------
 include/hw/arm/xen_arch_hvm.h   |  9 ---------
 include/hw/i386/xen_arch_hvm.h  | 11 -----------
 include/hw/xen/arch_hvm.h       |  5 -----
 include/hw/xen/xen-hvm-common.h |  8 +++++++-
 include/hw/xen/xen_igd.h        | 23 +++++++++++++++++++++++
 include/sysemu/xen-mapcache.h   |  3 ++-
 include/sysemu/xen.h            |  8 ++++----
 accel/xen/xen-all.c             |  1 +
 hw/arm/xen_arm.c                | 14 +++++++++++---
 hw/i386/pc_piix.c               |  1 +
 hw/i386/xen/xen-hvm.c           | 16 ++++++++++++----
 hw/xen/xen-hvm-common.c         | 16 +++++++---------
 hw/xen/xen_pt.c                 |  3 ++-
 hw/xen/xen_pt_config_init.c     |  3 ++-
 hw/xen/xen_pt_graphics.c        |  3 ++-
 hw/xen/xen_pt_stub.c            |  2 +-
 system/physmem.c                |  5 ++++-
 accel/xen/meson.build           |  2 +-
 hw/block/dataplane/meson.build  |  2 +-
 hw/xen/meson.build              | 13 ++++---------
 21 files changed, 85 insertions(+), 77 deletions(-)
 delete mode 100644 include/hw/arm/xen_arch_hvm.h
 delete mode 100644 include/hw/i386/xen_arch_hvm.h
 delete mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen_igd.h

-- 
2.41.0
