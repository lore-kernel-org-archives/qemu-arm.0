Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2955931ejb;
        Mon, 5 Jun 2023 10:57:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7HeOURWrBDSaAh+Vkx6CJkHZHJiDRhR1F4+1zDSmyR/6Nq7tyF1D89TFWk+BuNhJf4RPgi
X-Received: by 2002:a05:6214:238f:b0:628:731d:7abf with SMTP id fw15-20020a056214238f00b00628731d7abfmr7230704qvb.42.1685987845342;
        Mon, 05 Jun 2023 10:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685987845; cv=none;
        d=google.com; s=arc-20160816;
        b=ydvYbRbugvaja3eDy7kPZpKKOuuTXX+jEAe5vV+gFVxl0wwL/LPTYCwKmkUhotCFB4
         t2/jioX19pJI1O2AETTMlpilYTglyIGVjCu3wM33VurZ6JGbTxf+85odgsscw5H0FTdh
         X5QbyS/VfzuTyRUxDEjzrpb25jZCQuFmIH5gJSAL851W/ul1YF+/+9h/FB0bX2vuGYLR
         GCCcggB9lji/j2w9/XbAg0NrHgUZzLqO9sazu4Zs+96WIIHW5C1XouqoF7sLkYc45UBZ
         0DJARjVGlmHGEzkTDT8p36DAbl0uUW64V427zLftItwZUH4vH2I5qQfdbunjmcH6GftK
         T7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=z4iRS52vMXLw0AkceVZ45AaR9KR5nynhoiwOY8S0/1k=;
        b=mpeCg/cgeNvqvHUDOyUH9Z4lsaCTAe4I3Qci5tIqkKJ8ihS9m25Xcjjik7Wu8m7Keq
         9Q7APcJPDfIyuEz5uJyySQnSPL5h/16RvqaW6QWnC2ssS/5NLlIvgt8ooj3dD3YmPtfV
         gmax68te/L2FWqIxkTfjeq3fZXZaYSPs5ueayz+WrpGW/8uA5Byqi74z28LLhPQgbA9U
         hL10afySYRxCAq1pK71HsLZv0na/DGAggf254l76ePmvTM+Tpx8LLCcjHECucIAM+qAP
         pPmIcd9Ng+jtzbf+y4EZKL9bk83UmezD9mP3wPfQYc7A55yN8qyyhLeE0O2oHxa5OJ0z
         zLRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvUMPxDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm11-20020ad45ecb000000b00626218b016bsi5219726qvb.210.2023.06.05.10.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 10:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvUMPxDT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6ERw-00062U-Ll; Mon, 05 Jun 2023 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ERu-000614-MK
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:56:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6ERp-0001TW-Lz
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 13:56:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6a6b9c079so43495875e9.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685987810; x=1688579810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z4iRS52vMXLw0AkceVZ45AaR9KR5nynhoiwOY8S0/1k=;
 b=JvUMPxDTwBcxrKGK001Evohn4qO6qpLypYWZz8Aywkci621pdV3QGzrqVo8S/Qo1mY
 aL1fla10Uzt7HvSJyXlZ+Nk1OtpRughxGdiyfDMWBQc+TdninHFhPVcl9egPUh9cIgh6
 ZobXJk6pgBCy5pvyz+MeqX/CmoYd+7pIRW6Xz4tpIhhPT8+65rbMshyt2T+k7QbjEpmQ
 DVQQDRAh4avshR+HkT3AN6CQfHVJ6+gVhshV0HuknkZSYgzRYnlRmxhh6RdDWM+RS//l
 MbUi23/eUmLGgm4cWsRJINeB0U8oV7ahEkLIAgNDdx4JbboMb/bVoVqLtOhKp078Rf4L
 QMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685987810; x=1688579810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z4iRS52vMXLw0AkceVZ45AaR9KR5nynhoiwOY8S0/1k=;
 b=gQnWEe+UKYYUCMQLwyLaP2oAmjxt3/ypN3EkcMmHHp6rC8etPSPfXMYs6dLz31mz3C
 vt3760hm9sOXleW0d1ebS/0Bc6hPRur81oPP/XF4iCGGr7vTBJisZk7nSfCautJ+QqYc
 Uo88XCFEXix4zNyTMhs6EfCas5D3cnti8jmbgrMHeBP7epJxhcJwtqfMYj/12TqlANHG
 Vn//zhALBv22Gg5NCJTqEP6kzf4jTj/2aFe5Zx9nfK4syv5vlPxsJYMNK3rr2CD3uXha
 0gRSg+aEYBb0pVPRDKWeiQIeBvaB/iJwMERhb1QOPl5Gnyv52eIW/qw05yUmF/ePND8I
 A8GA==
X-Gm-Message-State: AC+VfDx6TDe7S5Nq01/MlhX7xDVtTBTaUK8tDApNaoc2dUJmuib8m18G
 uqxzfIMZCAvVExppB7ln301HCQ==
X-Received: by 2002:a05:600c:2206:b0:3f7:e800:abc8 with SMTP id
 z6-20020a05600c220600b003f7e800abc8mr771020wml.15.1685987810688; 
 Mon, 05 Jun 2023 10:56:50 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d6185000000b0030af05fce4dsm10424645wru.77.2023.06.05.10.56.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 10:56:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] bulk: Do not declare function prototypes using
 'extern' keyword
Date: Mon,  5 Jun 2023 19:56:42 +0200
Message-Id: <20230605175647.88395-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: lfBo2aorcpdR

Since v2:
- Do not change variable declarations in "block/dmg.h" (danpb)
- Rebased
- Added R-b from v1

v1:
- Remove the 'extern' keyword on function prototypes declared
  in header.
- Replace __attribute__((noreturn)) -> G_NORETURN
- Trivial cleanups to keep the previous commits generic.

Based-on: <20230605174146.87440-1-philmd@linaro.org>

Philippe Mathieu-Daudé (5):
  util/cacheflush: Use declarations from <OSCacheControl.h> on Darwin
  tcg/tcg-op-vec: Remove left over _link_error() definitions
  qemu/uri: Use QueryParams type definition
  bulk: Do not declare function prototypes using 'extern' keyword
  bulk: Replace __attribute__((noreturn)) -> G_NORETURN

 bsd-user/bsd-file.h            |  6 ++---
 crypto/hmacpriv.h              | 13 +++++------
 hw/xen/xen_pt.h                |  8 +++----
 include/crypto/secret_common.h | 14 +++++-------
 include/exec/page-vary.h       |  4 ++--
 include/hw/misc/aspeed_scu.h   |  2 +-
 include/hw/nvram/npcm7xx_otp.h |  4 ++--
 include/hw/qdev-core.h         |  4 ++--
 include/qemu/crc-ccitt.h       |  4 ++--
 include/qemu/osdep.h           |  4 ++--
 include/qemu/rcu.h             | 14 ++++++------
 include/qemu/sys_membarrier.h  |  4 ++--
 include/qemu/uri.h             |  6 ++---
 include/sysemu/accel-blocker.h | 14 ++++++------
 include/sysemu/os-win32.h      |  4 ++--
 include/user/safe-syscall.h    |  4 ++--
 target/i386/sev.h              |  6 ++---
 target/mips/cpu.h              |  4 ++--
 tcg/tcg-internal.h             |  4 ++--
 include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
 tcg/tcg-op-vec.c               | 11 ---------
 tests/migration/stress.c       |  2 +-
 util/cacheflush.c              |  4 ++--
 23 files changed, 82 insertions(+), 100 deletions(-)

-- 
2.38.1

