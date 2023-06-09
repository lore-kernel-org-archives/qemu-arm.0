Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289377ejb;
        Fri, 9 Jun 2023 03:48:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eSmyIcYy6vVdoaTHr7R+qQN9TrahP8XsLo3DPUx7rr9PRbxL9YLReVvCS2FsfiDBbvvE+
X-Received: by 2002:ac8:5785:0:b0:3f4:427:dbb8 with SMTP id v5-20020ac85785000000b003f40427dbb8mr1089128qta.2.1686307719707;
        Fri, 09 Jun 2023 03:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307719; cv=none;
        d=google.com; s=arc-20160816;
        b=WR+b7zBRhGXyfQC7EeK1v1DgxoEWdOWfUfHwCiPnd3ly+ENJ3ePsqhallOMz9zv/Oc
         difFJTGtj+9LXWLLBSk/edkZ/ThrydoHaUlrmkdlIXjrhMkzaO+P3yQFv8ypXIywapO9
         btlKAjIH2+Q7BjPuZY96DcGQ/r+zkKZAMyB29/RUgaNw0wfe6uMen8H8UMR1XlHnNjEn
         FImTZUZUU1wKPcLbgGjE2/AleBrkG9zyNQgsxMnLYp0YcfXzMwkAhxqAquM91xVMQTc+
         OiLi98NRNk6lUMCBSmBYm2UpwrVFYlQdZ1905F46B3ihttPvB1zGjoBUGtOai/P8ZV9J
         xW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HJ5HI0lL3qjrViOVTfhSFThyUieC3Zv2QHm9pLeOb3Y=;
        b=A8loE1Q5LE/pxwsONKNkpfXpu0hohtQyz9rTCEkQgxGCds+z85AGSoeqEDT+22NBfF
         NPgfWaHKr/owo9BZKxLGWH6yiL9GArPuQtZvwtmWm0zWv6oi4uqwv8nvzsB6bRm8X6CB
         J5SdiO4fCGfTV9xJ6HKYz7IbbQcCdz0Ot1Hi8VcXANczWPzXa3hLWOTr2bgZ6iltvswS
         1PDRnTCUN8IiNXt0fylwlZ6vo/8ZfgvLlZ8u/XY7TIVn0rfJXL5m3Spl8kPRx7Ix11+t
         OjUEqmVaWA+Q/r799zWIGlBnQhoK/xz1t/Bv4D45KZPTgMG8tWVyAew4vod0Occr3FwP
         zg6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjcWwxj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05622a00d300b003f6b8dbb9aesi1869806qtw.395.2023.06.09.03.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjcWwxj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7ZeQ-0000jT-Cq; Fri, 09 Jun 2023 06:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZeP-0000iz-1w
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZeM-0001AG-SX
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30aef0499b6so1102698f8f.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307641; x=1688899641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HJ5HI0lL3qjrViOVTfhSFThyUieC3Zv2QHm9pLeOb3Y=;
 b=CjcWwxj7J3aWhPFCLcAWd8QwV2klkvtWSZ8RsuH/yZovIYJFZbwJLOk53n8o4Cfdq0
 HArgQBPMXM3YAb8fLAjxajKD7BBpu31FZtHxjD6iq+LjNpvOJhYMZIv9UOsm3UwA1Znf
 oSpMpU3jUIIbAdKKcOB1BHINd9bxEa9ctjqw5kMTbblMthu6vsnx33btjl8ikevyv2ca
 QcwA+r8JG2nOGoTkfqjK1AzfYRp0jvfMReeIIUGdsgO5217VTwyj/zlnsrXCJj0pp9P0
 Uyzn5MaDFzDSl2bO1yxf/8e8Bl725KORS9bvGCGW+bKMyCTOOKwmwBWoG6G+l+1iAqR9
 fZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307641; x=1688899641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJ5HI0lL3qjrViOVTfhSFThyUieC3Zv2QHm9pLeOb3Y=;
 b=cfnvu/D2SIebOXiSuxsjShgwNAyFdhUawLV4+klclLY6fv3g83XhsnbWGwHc0zE7IO
 gmSeUrBb0cxUwrxF1yodIZpBzlKIwexoyH4/EYwAI2bUfHCpdIbDODbvIB+13wU2viQ3
 KaRNqhUUwlcJT9tQmBDD/Fai/4ne3LR55ViygK5CLfXRT4QFmTWq/U6oyk78x3vKhkqO
 hw4wQOHh/dBxrCaTfrUBBRL0lH894p1ni8GAbk5CCzoSzx08zbJjb/e7qCqMBxepbUBG
 ibdS5F0uQohSxkyjyKBlfvMCHorupj4Ht3mfA0piCoU+gywMjt0oD0LerLMf4EYh2ZfX
 GRNg==
X-Gm-Message-State: AC+VfDzZW3KvKjd6RNnscoBkH7geBCbFereOECcFZwjqv8vJ+rEHf9+7
 IqHIqM2qpZz5cgEewSuK7yBWrg==
X-Received: by 2002:a5d:4bd0:0:b0:30a:eeee:2fba with SMTP id
 l16-20020a5d4bd0000000b0030aeeee2fbamr558252wrt.34.1686307641228; 
 Fri, 09 Jun 2023 03:47:21 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 k10-20020adff5ca000000b003077a19cf75sm4108102wrp.60.2023.06.09.03.47.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:47:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/22] target/arm/tcg: Remove inclusions of
 'exec/helper-[proto/gen].h'
Date: Fri,  9 Jun 2023 12:46:55 +0200
Message-Id: <20230609104717.95555-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TcwfrCL6lmKN

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

Philippe Mathieu-Daudé (22):
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
  target/arm/tcg: Define SME set_svcr() helper in common 'helper.h'
  target/arm/tcg: Reduce 'helper-sme.h.inc' inclusion
  target/arm/tcg: Reduce 'helper-a64.h.inc' inclusion
  target/arm/tcg: Remove inclusions of 'exec/helper-[proto/gen].h'
  tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc

 target/arm/tcg/translate.h                    |   11 +-
 .../tcg/{helper-a64.h => helper-a64.h.inc}    |    0
 target/arm/tcg/helper-iwmmxt.h.inc            |  114 ++
 .../tcg/{helper-mve.h => helper-mve.h.inc}    |    0
 target/arm/tcg/helper-neon.h.inc              |  205 +++
 .../tcg/{helper-sme.h => helper-sme.h.inc}    |    2 -
 .../tcg/{helper-sve.h => helper-sve.h.inc}    |   46 +
 target/arm/tcg/helper-vfp.h.inc               |  136 ++
 target/arm/{helper.h => tcg/helper.h.inc}     |  488 +-----
 accel/tcg/cpu-exec.c                          |    2 +-
 plugins/core.c                                |    1 -
 target/arm/debug_helper.c                     |    7 +-
 target/arm/helper.c                           |    7 +-
 target/arm/tcg/cpu32.c                        |    4 +-
 target/arm/tcg/crypto_helper.c                |    6 +-
 target/arm/tcg/helper-a64.c                   |   11 +-
 target/arm/tcg/hflags.c                       |    6 +-
 target/arm/tcg/iwmmxt_helper.c                |    6 +-
 target/arm/tcg/m_helper.c                     |   12 +-
 target/arm/tcg/mte_helper.c                   |    5 +-
 target/arm/tcg/mve_helper.c                   |   16 +-
 target/arm/tcg/neon_helper.c                  |   28 +-
 target/arm/tcg/op_helper.c                    |   28 +-
 target/arm/tcg/pauth_helper.c                 |    5 +-
 target/arm/tcg/psci.c                         |    6 +-
 target/arm/tcg/sme_helper.c                   |   11 +-
 target/arm/tcg/sve_helper.c                   |   20 +-
 target/arm/tcg/tlb_helper.c                   |    5 +-
 target/arm/tcg/translate-a64.c                |   16 +
 target/arm/tcg/translate-iwmmxt.c             | 1340 +++++++++++++++++
 target/arm/tcg/translate-mve.c                |    6 +
 target/arm/tcg/translate-neon.c               |   11 +
 target/arm/tcg/translate-sme.c                |   16 +
 target/arm/tcg/translate-sve.c                |    5 +
 target/arm/tcg/translate-vfp.c                |    6 +
 target/arm/tcg/translate.c                    | 1274 +---------------
 target/arm/tcg/vec_helper.c                   |   26 +-
 target/arm/vfp_helper.c                       |   11 +-
 tests/tcg/aarch64/bti-1.c                     |    2 +-
 tests/tcg/aarch64/bti-3.c                     |    2 +-
 .../aarch64/{bti-crt.inc.c => bti-crt.c.inc}  |    0
 target/arm/tcg/meson.build                    |    1 +
 42 files changed, 2100 insertions(+), 1804 deletions(-)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 create mode 100644 target/arm/tcg/helper-iwmmxt.h.inc
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 create mode 100644 target/arm/tcg/helper-neon.h.inc
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (99%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (98%)
 create mode 100644 target/arm/tcg/helper-vfp.h.inc
 rename target/arm/{helper.h => tcg/helper.h.inc} (56%)
 create mode 100644 target/arm/tcg/translate-iwmmxt.c
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

-- 
2.38.1

