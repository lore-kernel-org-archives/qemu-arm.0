Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2250846njb;
        Mon, 10 Feb 2025 14:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1r/2IaGuoI6FEAzbc4Jtr71UxH4GTeylh6t43hn28tFvi06MkfjX1xnAeLpvSkchhjRN8K17MF6vrEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHaVuwrT14uqGPhw2TtE8q+KXPMI3DceRFIav8S7VUVgaZ2zxWewhG6iS8qj9CGN5hp7hTL
X-Received: by 2002:a05:620a:1a93:b0:7b6:e98e:ad15 with SMTP id af79cd13be357-7c047bc7441mr2273154785a.34.1739225943165;
        Mon, 10 Feb 2025 14:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225943; cv=none;
        d=google.com; s=arc-20240605;
        b=MToLI7IguWfZkv0n4WWqU1G8453Ta88UeBB5oAs26oTuoEx6rIPktGaFYTMxAYsXL/
         tAg1Q1jkNhgOjJPVFwJEZZVp9PGyCZbjE75s8mo+btfjILzoPtkb9MiMBbT5jLQLOJUQ
         YJNoGB4ZHPU4aU/Aaw6FulZhDObDrbku+IOeigqG1Qw2KyP191hKkQZDWSj/wIcSNTPG
         0ojJBbvDlvlBdTGa9U462O4hMNxpt8i/Ok8Blnrmsv0yQyPbbwooS6Vhb0QzU1PeYv8r
         oydlHJzn3ngS7Th+k1PvPUtwReQrrEKyfK6ERhuh8DczuzavTQ2WuUJ9LRqOvN6/ycyO
         oR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0thBB/BPiPRDLTLYTupIBEhCPKjwL8ikHw/PhDfF75E=;
        fh=gTloOz3hcaaNOIl6Yk1/UbfPcJyg7bUZlwmawbBQn5U=;
        b=BeE8ZJ8YVchPWMDeBYP9YfPqnVZI6EYU7FrbT1S6GZHUH8zvCRjOC2lLme95a8PnBb
         aMLyu4X7peYpAKkpJhx0x7bW7ma5h+QGFYfoMrgBSEEyYo/k5DeTIZpBe6XRQJTGC8+y
         qmA7HTzPqf1b/70G9/WK+xdcBryM5AAYD7m4WNA/BkWL8kXAxNiCLEVWUByfeqfaDsXO
         51EgZjCe7cevwGi8RxXwNGIds7w65jbLQtSlga1OVPWBAXw83XDUka58oW45i7dz+xqY
         j+y5USsIUkjn0q5Qi+AJ6295TszuRoJ67DHmq1Q5AZVU77ihgoov71jhIOKI8ytqgUrB
         P+hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+Cj3AYb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c060f022dfsi216910385a.236.2025.02.10.14.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w+Cj3AYb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thc7A-0001jM-B9; Mon, 10 Feb 2025 17:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc6x-0001ci-Bh
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 17:18:39 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc6t-0002lI-Oy
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 17:18:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38dd935a267so1675021f8f.1
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 14:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225913; x=1739830713; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0thBB/BPiPRDLTLYTupIBEhCPKjwL8ikHw/PhDfF75E=;
 b=w+Cj3AYb8fnKPZ/0rM7cjfzUB7GS+bdo9+pRTXARY+uXTUHYGORUySZiBhCd+NaY+r
 m6g86m6OfA8rh5ogKz4I2HJ9VVvGZyZok7zWmKFQ+YQ1S/evE9BEVyhkFItFtYgkQQ39
 iY0PoraIACRHasaIbdiV6H16Uvdtt4r6qFEZIhh9t5y7LbUMNumwnslilRnr+T+gbt/L
 Uf/v88T7ecWWHXdXRt+NVONAOeo/u94U5AE1/GpeNuUOo7ZjaN6CFynvJy00Yt2+1uwz
 QZHG0C2uZUwM9PRqEDL+ZGBvlhx3tRldCkCu3rg/IIsd+VPdc7dl6olf/8Q0JbDQ0EWv
 5XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225913; x=1739830713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0thBB/BPiPRDLTLYTupIBEhCPKjwL8ikHw/PhDfF75E=;
 b=U8byOpLs1Se+HvTLH8g2CFFkT/8q30rQh/jXv1oiVi40nvNQwZoEI4aDPtLRci29rR
 CWL+Qx2DvMKEvmYyaipKWjQ8RdpOAT+xF2ZnbxEuH9l4JWkICAyszMFS8TJNUCzN/Z9L
 HkItliwiV3pny0+Gop9fiGqEF4z/9MhvJIwIJX9GQXRqdjkFLeRGQcEW4QT1htbNhQIY
 hZ8Cguo5jy955+T+b2gcBwuVLTf405cZ/fbjc46GXsrRxL3H1YYdxVu1cXwd6nKLWj4D
 05nD1JrheVL9thmdBWAGDdUcF4C9+5sucNiYfeCMJT0WIhQ1gaCYnDn00zDL/oJJMzNG
 H52A==
X-Gm-Message-State: AOJu0Yw/c/lr0AcZ0omlKaX/zHYfyoLjLaeWSsIDI+zFG67lvuEntVJo
 Ogtlzi29Jlh39+Y/wqUNnENalt8Yh0TZcFmCHy7nsDIFVlCPFoyzDolx49CcGf640W4nHCuL8PM
 ZaS8=
X-Gm-Gg: ASbGnctIjdA6kcCSCxxoXtN1M/2YuTiNQl9uamyPFI4vbm8YKOM8m3BP6D4kUajDsrs
 jLc07yzGMqGh4pj+A/nIdtw9sZnH46r50S/7YPgPuQa/cILzwoj1Gkb/7GjpHbTxIULROt2Ix4A
 EcCxH65jGGWWWjpsR0s4wZTarw4XImDwq4GJOiuWX30S1Mt49U9Mxx9KcLOJczLgl06Drg4Z+1y
 OocBdykUctyfNW4Aw7rNONfmvDVtC2+HW0xosGezgYpYuRbsgRPg2lQ4VMqSIOElnkE2EOK/Ycb
 W5B1NmjZZWgvuE2gVGB6pdTmcNLOaWepSgUfky9EriOwIx/9ue5eQdt9RAsSyxOh3Q==
X-Received: by 2002:a05:6000:1788:b0:38d:dee1:e2c5 with SMTP id
 ffacd0b85a97d-38ddee1e8a3mr5021790f8f.1.1739225913001; 
 Mon, 10 Feb 2025 14:18:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc73c2e00sm11358278f8f.57.2025.02.10.14.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/10] disas: Have CPUClass::disas_set_info() callback set
 the endianness
Date: Mon, 10 Feb 2025 23:18:20 +0100
Message-ID: <20250210221830.69129-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A88sQM5ampFA

Since v2:
- Addressed Richard comments, tricore not disingenuously modified.

Since v1:
- Addressed Thomas & Richard comments

Targets are aware of their endianness. No need for a global
target_words_bigendian() call in disas/ where we call the
CPUClass::disas_set_info() handler which already update
disassemble_info fields. Specify the target endianness in
each CPUClass handler.

Philippe Mathieu-Daudé (10):
  target: Set disassemble_info::endian value for little-endian targets
  target: Set disassemble_info::endian value for big-endian targets
  target/arm: Set disassemble_info::endian value in disas_set_info()
  target/microblaze: Set disassemble_info::endian value in
    disas_set_info
  target/mips: Set disassemble_info::endian value in disas_set_info()
  target/ppc: Set disassemble_info::endian value in disas_set_info()
  target/riscv: Set disassemble_info::endian value in disas_set_info()
  target/sh4: Set disassemble_info::endian value in disas_set_info()
  target/xtensa: Set disassemble_info::endian value in disas_set_info()
  disas: Remove target_words_bigendian() call in
    initialize_debug_target()

 disas/disas-common.c    |  8 ++------
 target/alpha/cpu.c      |  1 +
 target/arm/cpu.c        | 10 +++-------
 target/avr/cpu.c        |  1 +
 target/hexagon/cpu.c    |  1 +
 target/hppa/cpu.c       |  1 +
 target/i386/cpu.c       |  1 +
 target/loongarch/cpu.c  |  1 +
 target/m68k/cpu.c       |  1 +
 target/microblaze/cpu.c |  2 ++
 target/mips/cpu.c       | 10 +++++-----
 target/openrisc/cpu.c   |  1 +
 target/ppc/cpu_init.c   |  2 ++
 target/riscv/cpu.c      |  9 +++++++++
 target/rx/cpu.c         |  1 +
 target/s390x/cpu.c      |  1 +
 target/sh4/cpu.c        |  2 ++
 target/sparc/cpu.c      |  1 +
 target/xtensa/cpu.c     |  2 ++
 19 files changed, 38 insertions(+), 18 deletions(-)

-- 
2.47.1

