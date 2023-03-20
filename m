Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2824811ejb;
        Mon, 20 Mar 2023 06:43:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/QWspuKdd8joZ2kkRgedgy63+pnsY8YZJ/QkOoAOEGyHqArSaOiuj5HIH7ggy2VQrphHaC
X-Received: by 2002:ad4:5ceb:0:b0:5b8:d384:1b1b with SMTP id iv11-20020ad45ceb000000b005b8d3841b1bmr24175574qvb.28.1679319814586;
        Mon, 20 Mar 2023 06:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679319814; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeRd5wr/JuaK53uVEnjn8uCka+jedD6bLbF+K1wXjA9gcROUyVrVUYwkeZdZ/0Gpm6
         Ha5b1z2GkbWmyqJcYIFVWB5uhdIF+f+GhSS3wobfaqZeFlQavKOSNqzHgf7CGJYgeH01
         4+8cYyFw2d79ype4yzfnIYEqhdjGhMb/ZgNDbQmHP+9kP7EVrhndfJgs4nEG6Q+azx6w
         823T+sJtdFgH1BQJaoLr0myzpUi/AnMNensRDbf9okXH9eKDQ5PuRHTyJ2di/0485/5u
         fitbjB9e3Se83mKsGxUFuW+O6NMdvFjOpWTHbrxVa68CoVCTpuhX8iVAp50zlI2cimHI
         ObBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=sILs22r46Wg0crNJ/Z4XykLGZPrHT32y697ld2keEmA=;
        b=gKN9BGHM6V/19NUIiIqaK1vnigPi4poGp0iHnhni20Hec6ySDYyJh4bznu9P4lAgXu
         JO8RABMPdb8856TpLqIFGooo9kYoK2ggk+oPLJNERgsvqCzH/k+R7LCn2rlZokKt2pDd
         fS1bBIUbJrhtfaQYBjw8SQp0TY6q0PM4MI7VUb0y8R9Otwj3jzgAYKt0YIDxc2BrfSDW
         nyiuKxhmqF2rSPxz9j9Brz+lJPwDLJcQH8SGBYlch0rYAfVbK/cGUnm3hGxoyQEQWvH4
         A9RjDEzDQURLsCGs9HWDSzkYksoUyXzGbkx0RUQuVEnsBIxFzL8HFe68h9ScpN0DwDCS
         tmtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tB6a5/jh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05620a0d8400b00720354ad796si6213231qkl.277.2023.03.20.06.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 06:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tB6a5/jh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peFmO-0006Uy-3K; Mon, 20 Mar 2023 09:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmN-0006UU-2V
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 09:42:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmJ-0001or-G2
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 09:42:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so2436508wmq.4
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sILs22r46Wg0crNJ/Z4XykLGZPrHT32y697ld2keEmA=;
 b=tB6a5/jheCoeECKQBBLeM/ZlgO+LRW4UR0mTDHwX5xGpRQZ3+b3f8iCKnZfJpW0YfF
 8DHS9AzxdKXiohRam78HCzfyCHi0NrOvN78Q4GD12XwrHh1fmDNUVlOQ5Xr/8S5KspND
 JGC5qDm4oEl86zZ7U9gSB1dzlhcXwcGNjaxpGd7RYK9lGOL+bFOBgys4lJJZYKFxABr7
 AoU/T5jANb+3Bz/tlUZ2vu2a/CFsSayE3WicsoRlz6R0MLcijDCLyw1tTTznx1/Xcx72
 6Wv8NGyx/MBKdI3XFumnz6H9HTNcliKXXEE4TECRAa8xwROhBmaiNBbIyojUKJdgwNwe
 Mu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sILs22r46Wg0crNJ/Z4XykLGZPrHT32y697ld2keEmA=;
 b=IfItDDi1i4GsIEdFX3xf23Ia75Z4808u+TQVlnqY1tigIwicbQRsPtVFlTPOJqHrh7
 5usMyyLDyv4qeyQSe1AY739sV8kuGd26Gizsx813ujgI1YiN5lzCWgqo3D10q2D+JgAp
 3Q+EyX+Y3wXVpLbTrgYn5HkjsdHjy9DsYEAh0kzv6FyZkdoJy2WhdZFAsWl/0Q2GQJh+
 qzqpj6N+jDQTQZ14EWuQJLr7JzZtC243RjyCj8UueSJWcZVgAWQvTBxvMJvIfpIcM7My
 /b1GwEQiADIFh0IOIAQvYL6Ykb+ycmDzWKRfGh5UJ9X7ZZRRox5S0h1uyfLsUfkLoHCv
 r21Q==
X-Gm-Message-State: AO0yUKV8y2GagBdI2LvcIQ+f+tZFklzdKT2tOVPFdEXHevtkmZstpWB1
 LmBINaom5Z6vgtQ+Em2s/hBq/g==
X-Received: by 2002:a05:600c:3492:b0:3ed:de03:7f0a with SMTP id
 a18-20020a05600c349200b003edde037f0amr3907492wmq.10.1679319741673; 
 Mon, 20 Mar 2023 06:42:21 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c025000b003ed1ff06faasm10524249wmj.19.2023.03.20.06.42.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.1 0/5] bulk: Do not declare function prototypes using
 'extern' keyword
Date: Mon, 20 Mar 2023 14:42:14 +0100
Message-Id: <20230320134219.22489-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Lo65TdKSZCCr

- Remove the 'extern' keyword on function prototypes declared
  in header.
- Replace __attribute__((noreturn)) -> G_NORETURN
- Trivial cleanups to keep the previous commits generic.

TODO: Add a rule in scripts/checkpatch.pl :)

Based-on: <20230320131426.16348-1-philmd@linaro.org>

Philippe Mathieu-Daudé (5):
  qemu/osdep.h: Do not declare function prototypes using extern keyword
  block/dmg: Remove duplicated prototype declarations
  qemu/uri: Use QueryParams type definition
  bulk: Do not declare function prototypes using extern keyword
  bulk: Replace __attribute__((noreturn)) -> G_NORETURN

 block/dmg.h                    |  8 +++----
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
 tests/tcg/minilib/minilib.h    |  2 +-
 include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
 block/dmg.c                    |  6 -----
 tests/migration/stress.c       |  2 +-
 roms/seabios                   |  2 +-
 25 files changed, 86 insertions(+), 99 deletions(-)

-- 
2.38.1

