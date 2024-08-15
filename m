Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819551njf;
        Thu, 15 Aug 2024 04:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj71jLUrWPBBxODsJ4Q11GsG2msDWs0PFnxPa0IOutTW4Aat/uVK8XTyLNTQNf4t6etjYazIcAI+ctVQ==@linaro.org
X-Received: by 2002:a17:907:7f13:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a837cce9ab7mr242128066b.22.1723722162982;
        Thu, 15 Aug 2024 04:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722162; cv=none;
        d=google.com; s=arc-20160816;
        b=aW65+ENavuAXb64iAw/iCsKwtpX78I+m1QvDHlhw5T2CeJERRvtzaXazioKhncuMiV
         Vph83KX/X9Dhib6ir41sagAPE4jmtCoRymLjZoZIpMGYQi46c8VvXnPrEyIT4t7HKGxJ
         LF1MW9kvroTw+lHXIK5g9E3Aqbuy986/7dnvmaAz77LoG+oa5ot+F/r8qh/DkLrPEg5O
         G+8nNCIqH2LA87xv1KRhQrvtWg+AmQJJ0elfruP21w91PX4oaTAXvJWPVYVYOu3JLP75
         YmNj/VPKIz8k5ICcPudodJtr8Kog2Vksn4WNmVycuV9R9nIRXSRqmGvhQPPhJBoVVnlI
         c71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:dkim-signature;
        bh=Tlsu0qGMv6O7En1OrJqhhlVtFK2e6Mp/EHWWu8yMIlU=;
        fh=oVVvbF9wjB3ArWYE9g/30U7NUdl3OMoZuhc12ttxqBQ=;
        b=BSW4dbL1jwGDmf9e99eyBFtiaxQ/X+sQ0jh/EUK1mJKRMYwAfv4vaKtTk10NOCZrBr
         s/YXtDj8csj4YQrc3nIrHPY5kQq+AJqke8/v+lrUdMZDOz5v/JnpgAYMBqL+/wwrH8uu
         Uuu56rx4bWayOVIHIxS/q23soQ4GIqt0DSkIxoh2HRFHY3tvhbYLfn4PAJwI30XT6K5D
         E6dmWALwVtQrESeoRWu3+5TxmsDX9jc1JPo5ScvUWHK+iKqgTj3POjcMZTMph5yDiBDm
         ubMq0ljXWOJRSB2cFhlGD6FrwFA034hwCSasFf8x/2FDa1G/FsV3/VvhroLsMmESP9VH
         8pKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+d6kkVh;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a836a8bdd6asor131936466b.7.2024.08.15.04.42.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+d6kkVh;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722162; x=1724326962; darn=linaro.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlsu0qGMv6O7En1OrJqhhlVtFK2e6Mp/EHWWu8yMIlU=;
        b=u+d6kkVh9IDhDtts8sH3fiwHLJxl3R54TGWVxiQgJFW95H6OE4xNsOiHzjwQfx8yTR
         MrMsDzr9XWMPalgwgTQgAArn7KY1gvpLAjGJXamH1GquWvEmafgZQk/XjghZwGK/+7Xe
         sD2aTfHxwz50OCWscg0DbLKZ37TB/xF68H7lJ75JkFoCw304GRW0K/9bQ82DS5AyOT1X
         Nuf0aICPudxbdA9Bk34K0oVZZ5Qem9QnQSHlgc2289kc/K2b2p657FH0Qdypx0WUvYgb
         IXeKPCm+oB4DR2ikQVwte0BtT/NERsOFnOoIixVqUQ/lqk+ywjKtF5Q0tpvR+KL0aAqt
         Ac2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722162; x=1724326962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tlsu0qGMv6O7En1OrJqhhlVtFK2e6Mp/EHWWu8yMIlU=;
        b=MLS6VGMozFh9DhoMb7UZK0LPcQUJbocFfuzhd+psyw0YSCmMrRcMShiDj82/3H60p/
         un5VkRqcMSX8Ml9qWWCZdw57S32ZRwIqEFuy9Nt9xPCeX/cZEdJuOlHdSsZP5LsVDvDS
         cC5GmSd8Gi+5fKLx0SgbfrpQLjnps2LP1sEZat8GyLd0dVlPSDmzvhAkLdUtFtKh7hMj
         fSnmyDlKyLstCuprj06zmqO0U3XXrNZtwa76CDYoywBVMl1M4lPab0V1Ity7z9OVpeAf
         RsYmKUPrBbC+ElJf/Cxx86DSJW7diJcvkAMFRzDwhwzjTVDrFU8z4dGh2SFD7tuOyXn7
         5zdw==
X-Forwarded-Encrypted: i=1; AJvYcCUYiFMQSbAXgwNrJ5g8sx124zsmTJbkT/sehr3DrQuJyxSRewvGWnObcf6JGCcXUvgEIki8xOjb7fw4bQ==@linaro.org
X-Gm-Message-State: AOJu0YwnvHem4PyUWMqa34yytOVmAQL77yUtxBYb+xp+bEZy5ocOp8eE
	La2nAbVeiZE1h36+mi9dDAN1U+bVKEreV+FJFmYSaUB9N3b+meil/LIGakamJmLERw==
X-Google-Smtp-Source: AGHT+IEk/cY7R5Lr/KG3AXzDZAwWIKdTwoc+NpYQzxYPRvSU/CaldEeLz4uQDse3/4eAggmaYMZGbA==
X-Received: by 2002:a17:907:9803:b0:a80:f67f:771b with SMTP id a640c23a62f3a-a837cbcce2fmr233224166b.2.1723722162225;
        Thu, 15 Aug 2024 04:42:42 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:41 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v7 0/7] Add Rust build support, ARM PL011 device impl
Date: Thu, 15 Aug 2024 14:42:17 +0300
Message-Id: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJnpvWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0MT3aLS4hLdghwDQ0PdMnMloLKCotS0zAqwEdGxtbUAylIqiFIAAAA
 =
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Junjie Mao <junjie.mao@intel.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, 
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6866;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=8Ad7RZkkTNKg+j+NV/utO/cwg7A7+51TNpgYAnr4D5A=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW10NmUxWkFQL20yRHd0WVk4V3A2U3drUVI0ClFJRTJIeklOODYyc095UHBH
 NG1KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJRQUt
 DUkIzS2Nkd2YzNEowTFRZRC80d0I3UkhubUNXTFFCelJXWUovS0dLSlFHaXZTSUNSSDJ6TlF2Rw
 ptR2l4bHkyWWJtL25Jc05uNmdOdk51QUxFZ2N1ZURUSFd6VHN0Y29qTjdXUkxEdVUwSTdtMElnZ
 W1ESlFXc05ECjRoZE45bCsxdk02QmRBQlVSVG1MdThyVEovdjRzNmpyeDRHaVVPSWJwWTc5S1lh
 b1pSUzVGaUppcmQxcUFQUjAKdjFibUZxdjZ0WjRlY2xpTWdoMys2bkpwWkVvMXV0eHBkWEJtMTZ
 FRFIzaHhmSDJEc1cweXdPZ0pCbmVQT2FyaQpkQUY5QlVzY2VoRzBaQkhSY3JOSFpPMFB1ejJEWW
 RwNVRrVS9zOFpoWklZeWtzYTEweEU2cnBsanplenZ6Y1U2CnIwdmk1Uy94MG1rZFNNMHEzczkyS
 HZNdzNnV1VWNXljRzZQZDZ0ZXVKbWNZKzJzWkR5TkdRQXBuM094QVUwTzcKVzlJV01SaDJHWGNW
 L1d4MXpPck83NkpsbFIxcWtzbk5sR3BOTkk2cHd3YmVpZm5GcUVJazNtZjdCSVZBWkxqLwp1a1h
 rV1ZkUW16eXJzcjhZbkRkUUpsMUVqQXljSE9BejVVZDBHY1NoUjFVczArK3FNYXBSOFB6Q2p6Wl
 ZvakpOClJHV2FQMDd0VEZZcHFEcHVnNmpCL3FRSVVvZ1ltT09La29zeGQzd0MxQnNsanpHUDM4c
 ldOeEw2RWZObEd1blkKWDVhRkFSbERYak5wRDVDNWRrT2orU3NCMzc4UnpNWk9VNFNGZkhobVVG
 aVo1b1ExS1BZOENmV2NZSkszYSsyZApLdkxtK3ROc2VNUXZhZ0hUc0tPTkwwUGxvT09UYitoMmk
 xelFzTE1ma2JxdDYzbU5ycHc1VkFhb05aNG0zUUpCCkNrVDVKQT09Cj04Qm1DCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: /6q2Z72TeDbq

Changes
=======

- Incorporated changes by Paolo Bonzini and Junjie Mao as a result of
  discussion on the previous patch series version
- Included two squash patches from
  <20240814090820.1251026-1-junjie.mao@intel.com>
  Junjie Mao (2):
    meson: subprojects: Specify Rust edition by rust_std=20XX
    rust: Specify Rust edition by rust_std=20XX

Outstanding issues
==================

Outstanding issues that are not blocking for merge are:

- Cross-compilation for aarch64 is not possible out-of-the-box because of this bug:
  <https://github.com/rust-lang/rust/issues/125619> in llvm which when
  fixed, must be ported to upstream rust's llvm fork. Since the problem
  is an extraneous symbol we could strip it with objcopy -N|--strip-symbol
- Adding more than one Rust device ends up with duplicate symbols from
  rust std library because we are linking as whole archives because...
  constructors are stripped by the linker otherwise :( It can be worked
  around if a single Rust library is built with all the devices as
  dependencies which is then linked to qemu. The fix is a small change
  which I will add either in a next version or when a new Rust device is
  added.

Previous version was: <rust-pl011-rfc-v6.git.manos.pitsidianakis@linaro.org>

---
Hello everyone,

This series adds:

- build system support for the Rust compiler
- a small Rust library, qemu-api, which includes bindings to QEMU's C
  interface generated with bindgen
- a proof of concept ARM PL011 device implementation in Rust, chosen for
  its low complexity. The device is used in the arm virt machine if qemu
  is compiled with rust enabled (./configure --enable-rust [...])

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

---
Manos Pitsidianakis (5):
      build-sys: Add rust feature option
      rust: add bindgen step as a meson dependency
      .gitattributes: add Rust diff and merge attributes
      rust: add crate to expose bindings and interfaces
      rust: add PL011 device model

Paolo Bonzini (2):
      Require meson version 1.5.0
      configure, meson: detect Rust toolchain

 MAINTAINERS                                        |  20 +
 configure                                          |  50 +-
 meson.build                                        |  77 ++-
 rust/wrapper.h                                     |  39 ++
 .gitattributes                                     |   3 +
 Kconfig                                            |   1 +
 Kconfig.host                                       |   3 +
 hw/arm/Kconfig                                     |  33 +-
 meson_options.txt                                  |   3 +
 python/scripts/vendor.py                           |   4 +-
 python/wheels/meson-1.2.3-py3-none-any.whl         | Bin 964928 -> 0 bytes
 python/wheels/meson-1.5.0-py3-none-any.whl         | Bin 0 -> 959846 bytes
 pythondeps.toml                                    |   2 +-
 rust/.gitignore                                    |   3 +
 rust/Kconfig                                       |   1 +
 rust/hw/Kconfig                                    |   2 +
 rust/hw/char/Kconfig                               |   3 +
 rust/hw/char/meson.build                           |   1 +
 rust/hw/char/pl011/.gitignore                      |   2 +
 rust/hw/char/pl011/Cargo.lock                      | 125 +++++
 rust/hw/char/pl011/Cargo.toml                      |  26 +
 rust/hw/char/pl011/README.md                       |  31 ++
 rust/hw/char/pl011/meson.build                     |  21 +
 rust/hw/char/pl011/rustfmt.toml                    |   1 +
 rust/hw/char/pl011/src/definitions.rs              |  26 +
 rust/hw/char/pl011/src/device.rs                   | 586 +++++++++++++++++++++
 rust/hw/char/pl011/src/device_class.rs             |  58 ++
 rust/hw/char/pl011/src/lib.rs                      | 584 ++++++++++++++++++++
 rust/hw/char/pl011/src/memory_ops.rs               |  56 ++
 rust/hw/meson.build                                |   1 +
 rust/meson.build                                   |  11 +
 rust/qemu-api/.gitignore                           |   2 +
 rust/qemu-api/Cargo.lock                           |   7 +
 rust/qemu-api/Cargo.toml                           |  23 +
 rust/qemu-api/README.md                            |  17 +
 rust/qemu-api/build.rs                             |  13 +
 rust/qemu-api/meson.build                          |  17 +
 rust/qemu-api/rustfmt.toml                         |   1 +
 rust/qemu-api/src/bindings.rs                      |   7 +
 rust/qemu-api/src/definitions.rs                   | 108 ++++
 rust/qemu-api/src/device_class.rs                  | 128 +++++
 rust/qemu-api/src/lib.rs                           | 100 ++++
 rust/qemu-api/src/tests.rs                         |  48 ++
 rust/rustfmt.toml                                  |   7 +
 scripts/archive-source.sh                          |   5 +-
 scripts/make-release                               |   5 +-
 scripts/meson-buildoptions.sh                      |   3 +
 scripts/rustc_args.py                              |  84 +++
 subprojects/.gitignore                             |  11 +
 subprojects/arbitrary-int-1-rs.wrap                |   7 +
 subprojects/bilge-0.2-rs.wrap                      |   7 +
 subprojects/bilge-impl-0.2-rs.wrap                 |   7 +
 subprojects/either-1-rs.wrap                       |   7 +
 subprojects/itertools-0.11-rs.wrap                 |   7 +
 .../packagefiles/arbitrary-int-1-rs/meson.build    |  19 +
 subprojects/packagefiles/bilge-0.2-rs/meson.build  |  29 +
 .../packagefiles/bilge-impl-0.2-rs/meson.build     |  45 ++
 subprojects/packagefiles/either-1-rs/meson.build   |  24 +
 .../packagefiles/itertools-0.11-rs/meson.build     |  30 ++
 .../packagefiles/proc-macro-error-1-rs/meson.build |  40 ++
 .../proc-macro-error-attr-1-rs/meson.build         |  32 ++
 .../packagefiles/proc-macro2-1-rs/meson.build      |  31 ++
 subprojects/packagefiles/quote-1-rs/meson.build    |  29 +
 subprojects/packagefiles/syn-2-rs/meson.build      |  40 ++
 .../packagefiles/unicode-ident-1-rs/meson.build    |  20 +
 subprojects/proc-macro-error-1-rs.wrap             |   7 +
 subprojects/proc-macro-error-attr-1-rs.wrap        |   7 +
 subprojects/proc-macro2-1-rs.wrap                  |   7 +
 subprojects/quote-1-rs.wrap                        |   7 +
 subprojects/syn-2-rs.wrap                          |   7 +
 subprojects/unicode-ident-1-rs.wrap                |   7 +
 tests/lcitool/mappings.yml                         |   2 +-
 72 files changed, 2756 insertions(+), 21 deletions(-)
---
base-commit: a733f37aef3b7d1d33bfe2716af88cdfd67ba64e
change-id: 20240814-rust-pl011-v7

Best regards,
--
γαῖα πυρί μιχθήτω
