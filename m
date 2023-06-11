Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1370334ejb;
        Sun, 11 Jun 2023 01:58:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vUgl4muSXJ/SJ5dmAWOXUqZT+1p694/WJRwklfiKysmCXTl9Cihcq62PfRHjyT9YCnwYG
X-Received: by 2002:a05:622a:24c:b0:3ef:3808:dea0 with SMTP id c12-20020a05622a024c00b003ef3808dea0mr8212078qtx.0.1686473936853;
        Sun, 11 Jun 2023 01:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686473936; cv=none;
        d=google.com; s=arc-20160816;
        b=odYPRlQBIDfHbh+Dc+i7A4433nhkQ6+/eMVgkt8mTOxp6SXen16nZdDNrZK1M3qDwg
         R3Ou0yzP9jwfE+Batw9vgVVTnfaWmLIUuNTCZ7Zz7Yxsw4WYDpyt9ILLurRD/IGzDFTD
         9Chx7H5QJleGn9PzUZmOpZTFNjbahcMpEJYb5nRpKjQsulspsPT7XaCJdntDdiJPHxtn
         mYhH1oEAY7mS9rwNSbjdIc8RShrHfAHYDVZ2611uRyWWqZdUh78uTIrlTDKUGHRYAu+r
         i+Zagf0M0ZH00eRsxobul6K7r+kz8s981Le23S7A8Q8DQAJtNOY/dYq5W/RWAEK2fI2W
         39UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=t0NdcEUrbCPnpVDr1IxBm04NJqSbsxwlcbwIYAJr9rc=;
        b=QjGSz11G1ZjTRpHzA0+3zsEFQH6hnvwPGxjiE+VXmy+5TbvvJzMQoFh7QefQI9bVy1
         Dm9bM8CnERG5s3g/FNqdS9EDp1SZCkjHmRlanYSWVyawksFyE4JOzvRkxvhHRQMbg9uR
         3RK63FzE0PoDJI/GS3fctvfWRiKzs0dawXS+PGgmeMvY3q9oC3SZQtvQY1oLLA6KDeUZ
         6dxrrRtHU58Byg0JKEyO6yz1x6978lAldEQKxOhNFjGbzDPjiyW+rNlKxWxcItcMrjWo
         IxMcTuVGNeZOpdOW/4jP1J61KxWEOkFIFCrm4QhoNhXXXRLX6i5tm1yUS5MdkZGw2Vts
         Oukw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=on3FdXsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ac87dcd000000b003e4e9ddc6f9si4466750qte.118.2023.06.11.01.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 01:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=on3FdXsl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8GuT-0000vl-Uk; Sun, 11 Jun 2023 04:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GuS-0000v0-7z
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:58:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GuQ-0003WC-3x
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:58:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30e53cacc10so1966005f8f.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473928; x=1689065928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0NdcEUrbCPnpVDr1IxBm04NJqSbsxwlcbwIYAJr9rc=;
 b=on3FdXsl5dhsFFVczV/rqMkXbSgfQII83oFFUY5IwPa6xMltx7VlG00QMhPttGwvCk
 xoLHKEhs8lvQUq2UCqncxCLf9Arbbc6ga9C8QT+ZpFfIbzKlvhYQfeUId1ZB2+Ma5OLW
 3uvGJFqiPIQTB0vmzkSMcl6+PTG+ieijHPeLsFbhk6z+i64voCxTtbpbwXqfoW9uZgZg
 kRALVtmWTzZNxqxe4NvR/Ts1SVRJKpi+mLcifJSCTkzHmyXh1xyXIh30oLbL4Wbd/7TM
 WZaokynOr5HYadrj9VB5OxWQtxcHWjOFFn3EIVpIOT0CtgKRuII2u+r6Z4Ez6/n/SlpV
 QEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473928; x=1689065928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t0NdcEUrbCPnpVDr1IxBm04NJqSbsxwlcbwIYAJr9rc=;
 b=L03fYsEghWgqA4ZoFaJ4Z4dmkU9a3Rbt2vnTsBPeSnC/dHCOSDFcek3Y1T++KK2qSK
 YJfoK7sbRCGyynfb7m8F75EkmGQ30TubifUZIvawrNOcaTm3JDRxwzpeYHfRDfR5/nXT
 2DQGzvBpo78qO/Kg/8zBWHDCpTwTc6oJ/UPECERwD2eRuNOMEkAEiQmPrzTUSDE/H0ME
 Mk6kNYt9tFWkP+s7Wpq/oev+Dnjb5c86priYaV649GJZyK0R9Wc5rr+wx7Rx31aGSFdw
 upLjLGEYlOOpXs8gAJJ+ul8o3/r3PwNdT1hFDDSZALR3dvlRln+YjamChAymF8IFWlp8
 knKQ==
X-Gm-Message-State: AC+VfDw+SUh5we+ObNonWMIETxkuZCMb0UYzaaZZRqm4Vkms5PatqtZg
 U013rdWWER1PwC2IhWzn7U0MvQ==
X-Received: by 2002:adf:e8c3:0:b0:30a:efb0:ce5c with SMTP id
 k3-20020adfe8c3000000b0030aefb0ce5cmr2143123wrn.45.1686473927971; 
 Sun, 11 Jun 2023 01:58:47 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 e8-20020adff348000000b00304adbeeabbsm9113851wrp.99.2023.06.11.01.58.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:58:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/26] target/arm/tcg: Remove inclusions of
 'exec/helper-[proto/gen].h'
Date: Sun, 11 Jun 2023 10:58:20 +0200
Message-Id: <20230611085846.21415-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WgrE29knOHfm

Since v1:
- Addressed rth's review comments (unnecessary helper-gen)
- Added R-b
- Extract M-profile helpers
- Fixed licence in new files

Hi,

This series tries to do what Richard suggested in [*]:

  Targets that have a tcg/ subdir should have helper.h.inc
  moved into there.  At the end, include/exec/helper-gen.h
  and include/exec/helper-proto.h become unused and go away.

but only for the ARM target, to first see if this is heading
in the correct direction.

Instead of having TCG generated helpers included by all
translate/helper units, they are reduced to the few places
really needing them. I expect the build step to be slighly
improved, since the compiler doesn't have to compile and
track unused helpers definitions.

[*] https://lore.kernel.org/qemu-devel/cad000d7-f408-9337-9328-ccb262c5fcc7@linaro.org/

Philippe Mathieu-Daudé (26):
  plugins: Remove unused 'exec/helper-proto.h' header
  accel/tcg/cpu-exec: Use generic 'helper-proto-common.h' header
  target/arm/tcg: Remove CONFIG_TCG #ifdef'ry check
  target/arm/tcg: Rename helper template headers as '.h.inc'
  target/arm/tcg: Extract iwMMXt helpers from the generic 'helper.h'
  target/arm/tcg: Fix iwmmxt-related code style
  target/arm/tcg: Expose some iwmmxt methods in 'translate.h'
  target/arm/tcg: Extract iwmmxt code to translate-iwmmxt.c
  target/arm/tcg: Reduce 'helper-iwmmxt.h.inc' inclusion
  target/arm/tcg: Extract VFP definitions to 'helper-vfp.h.inc'
  target/arm/tcg: Reduce 'helper-vfp.h.inc' inclusion
  target/arm/tcg: Move neon_tbl() from op_helper.c to neon_helper.c
  target/arm/tcg: Extract NEON definitions to 'helper-neon.h.inc'
  target/arm/tcg: Reduce 'helper-neon.h.inc' inclusion
  target/arm/tcg: Extract SVE2 definitions to 'helper-sve.h.inc'
  target/arm/tcg: Reduce 'helper-sve.h.inc' inclusion
  target/arm/tcg: Reduce 'helper-mve.h.inc' inclusion
  target/arm/tcg: Reduce 'helper-sme.h.inc' inclusion
  target/arm/tcg: Reduce 'helper-a64.h.inc' inclusion
  target/arm/tcg: Move v8m_stackcheck() from op_helper.c to m_helper.c
  target/arm/tcg: Extract M-profile definitions to 'helper-m.h.inc'
  target/arm/tcg: Reduce 'helper-m.h.inc' inclusion
  target/arm/tcg: Inline 'exec/helper-gen.h'
  target/arm/tcg: Inline 'exec/helper-proto.h'
  target/arm/tcg: Rename 'helper.h' -> 'tcg/helper.h.inc'
  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc

 target/arm/tcg/translate.h                    |   10 +-
 .../tcg/{helper-a64.h => helper-a64.h.inc}    |    0
 target/arm/tcg/helper-iwmmxt.h.inc            |  103 ++
 target/arm/tcg/helper-m.h.inc                 |   23 +
 .../tcg/{helper-mve.h => helper-mve.h.inc}    |    0
 target/arm/tcg/helper-neon.h.inc              |  213 +++
 .../tcg/{helper-sme.h => helper-sme.h.inc}    |    0
 .../tcg/{helper-sve.h => helper-sve.h.inc}    |   46 +
 target/arm/tcg/helper-vfp.h.inc               |  163 ++
 target/arm/{helper.h => tcg/helper.h.inc}     |  524 -------
 accel/tcg/cpu-exec.c                          |    2 +-
 plugins/core.c                                |    1 -
 target/arm/debug_helper.c                     |    6 +-
 target/arm/helper.c                           |    7 +-
 target/arm/tcg/cpu32.c                        |    4 +-
 target/arm/tcg/crypto_helper.c                |    5 +-
 target/arm/tcg/helper-a64.c                   |    9 +-
 target/arm/tcg/hflags.c                       |    5 +-
 target/arm/tcg/iwmmxt_helper.c                |    5 +-
 target/arm/tcg/m_helper.c                     |   31 +-
 target/arm/tcg/mte_helper.c                   |    4 +-
 target/arm/tcg/mve_helper.c                   |    9 +-
 target/arm/tcg/neon_helper.c                  |   27 +-
 target/arm/tcg/op_helper.c                    |   43 +-
 target/arm/tcg/pauth_helper.c                 |    4 +-
 target/arm/tcg/psci.c                         |    5 +-
 target/arm/tcg/sme_helper.c                   |    5 +-
 target/arm/tcg/sve_helper.c                   |   12 +-
 target/arm/tcg/tlb_helper.c                   |    4 +-
 target/arm/tcg/translate-a64.c                |   18 +
 target/arm/tcg/translate-iwmmxt.c             | 1331 +++++++++++++++++
 target/arm/tcg/translate-m-nocp.c             |   11 +
 target/arm/tcg/translate-mve.c                |    6 +
 target/arm/tcg/translate-neon.c               |   10 +
 target/arm/tcg/translate-sme.c                |   14 +
 target/arm/tcg/translate-sve.c                |    5 +
 target/arm/tcg/translate-vfp.c                |   10 +
 target/arm/tcg/translate.c                    | 1278 +---------------
 target/arm/tcg/vec_helper.c                   |   21 +-
 target/arm/vfp_helper.c                       |    9 +-
 tests/tcg/aarch64/bti-1.c                     |    2 +-
 tests/tcg/aarch64/bti-3.c                     |    2 +-
 .../aarch64/{bti-crt.inc.c => bti-crt.c.inc}  |    0
 target/arm/tcg/meson.build                    |    1 +
 44 files changed, 2133 insertions(+), 1855 deletions(-)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 create mode 100644 target/arm/tcg/helper-iwmmxt.h.inc
 create mode 100644 target/arm/tcg/helper-m.h.inc
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 create mode 100644 target/arm/tcg/helper-neon.h.inc
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (98%)
 create mode 100644 target/arm/tcg/helper-vfp.h.inc
 rename target/arm/{helper.h => tcg/helper.h.inc} (53%)
 create mode 100644 target/arm/tcg/translate-iwmmxt.c
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

-- 
2.38.1

