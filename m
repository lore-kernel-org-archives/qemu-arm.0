Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2229306njb;
        Mon, 10 Feb 2025 13:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVMT5pT+7HkgSi5Xovl72IRBpOmSWXYnx1ESZaEwLfOqn+TWYE5Ms1u7T0i5TUs2+DyLY4LVlPzD2rzg==@linaro.org
X-Google-Smtp-Source: AGHT+IGzf2ntUJmgqHgOABaCXMTvHWtHcmMuEOrWbf/RHPLL+oUzLNiD+Z2LvurRd6fzgMmfRYa0
X-Received: by 2002:a05:6214:240c:b0:6e1:9126:4d15 with SMTP id 6a1803df08f44-6e4455d4c92mr183685116d6.11.1739223019084;
        Mon, 10 Feb 2025 13:30:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223019; cv=none;
        d=google.com; s=arc-20240605;
        b=M2BQvUA2yoCxDCHjs4K05IYlslDUnNe5+hyUkVkRsgGgGoXnY86mlt6ihc8UNegkjQ
         q9qUCBY6S56/716eQWcJVTZ7pum2uyUmcIowNtl5rBQOh1OuZOLNj8zlzK1uTK1Pn1YU
         X31kY0AOVrg9SQXGwNps6h7mr3xJ0qHWUb3i/FQGURwdKreRXAAhDeYUkzd7u0ozmt5e
         3j1AwPPVPBgmr+BB1Baj+t3JtlE8WdYVi+9NXfwSy7XByEpk3WLHjTgfeW6ylE+UxLiU
         MKZ4YCXS2VvQ6k4zoEPMKX63KnTVRYymNUTfs4J+XaXh4/MIFJdzkabG3JRNjFeXYltA
         AJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=E11/JwIYJ2Y/faM5TyQQeEFRyrnATjEUmt+z2LzNUFo=;
        fh=6KsFQ31cfEzOs1rIpug8sRixICQ3h4nSt12vv652SpA=;
        b=bKFliAAq85ow4qHQAdghVDzvapXYk6oS9XgN5eVBBHnEoxwkcCVa8SGcZ5uftJl6ix
         /dQVsZByn53ccbfjxWVYmdB63tTlEV+Y6Yn1FNJ+ol1WbvOSRNDoz2VgTrYRwVRvE8ql
         1z7NcH01dvut8bQUsXtM64EBAXbcf+PkBR6Yd0ToG44PnOVGKUjYlLdA0ka+MQ1BHv1a
         2y2sjLY4Ff1ieaOXkr0FZxxICk2LeFpjMVbucdhBXfOwyWlbgGKkr/sKcnLJCGB/3D5p
         gv7XyHs1VKduwKPE5TmUcTRVSYXHmJT5rFNgep0zbRWKqeR7pn/3M5ZZAvqvHlROZTpk
         qB8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqgIKDCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43f760161si96946046d6.284.2025.02.10.13.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:30:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqgIKDCq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbLY-0003aC-H0; Mon, 10 Feb 2025 16:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLW-0003ZG-St
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:29:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLT-00027s-Tz
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:29:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so48379775e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222974; x=1739827774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E11/JwIYJ2Y/faM5TyQQeEFRyrnATjEUmt+z2LzNUFo=;
 b=ZqgIKDCqe75sh97vi6bERdmW29pgiuBnT3fOMOiAGOdHXrFDLa4aVcbCjwDDUKrhhd
 QU76vYU8xDbc9tddS0TyyGJq1eeT8dvDxg8QzLw3EUME/vi60XuVNA0Tb9aOTo6amQQe
 ENnDN6fcdRVsKSCAk25EEQva1+3LcfkOHvRQDtu0gEoNupoAxiD8Xi1YR1l285vP+xHX
 0nBLFqMks+Tqw7xU64zQFf+qjZ9novztLhnC/67HI4ElCNNbkmYbsV+Y2azknNKUZlJY
 NqOZtWc9x1N+YHLY5peuKPr+GvD/Y7Of/cLh7EcCqCQ5PX6ylqCMyUh7/IgQiOqOkUpL
 xUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222974; x=1739827774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E11/JwIYJ2Y/faM5TyQQeEFRyrnATjEUmt+z2LzNUFo=;
 b=slX2UUrHmN7MLQORdQzoQlXLhmASwt3QZq91bSoz1VN1LdKeWKhB+Dqp5dSx5/mgz8
 YovnVz8vqhN92OJcK36mQXJ3c4KM4aKE0mK/cPNJRCyt+msJzwjWS4l+D08P3i7wuAGH
 H8IXH0FH4rle1M+TwNRXM52GRNeDlcjZBDX0BBwtNOggkcsxrk6skwjxvBCVfi8iGI23
 Ka0cr5yERbVoQ3SRZpaVi3AQNKmhIjaHqoBVuCZ2lEPaxJ8Tt1lHN/iajYPhFXMmTV9Y
 n7dgANmEHy/UPpYZTIsd8l37HwxwmSQ6LJTz04FxTOqXtDqrBu5SBvXSKMBP6LtcqStp
 Ia/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6AiaBaN+0mVO8YtosHGB59zdzUIwWBvwPAkBeEkYAgTMTYdGSRgXAtSWmobpgbe2onbVUN3zJTA==@nongnu.org
X-Gm-Message-State: AOJu0YyaXGY+NhGl6Hilz7AjNl2MuzHQk5EH0fQGdXqGa6/GrewRh03m
 dUp2GZqyrf1yVJtBJFw73SrxiiZeEEq3YJi/pnXRyv0D023bO3giHhfgIW0SOng=
X-Gm-Gg: ASbGncvSVskOzgjSXTTI6RW/RVbU1FwXCqL4MYpe4aPFWWtTlm4lV51C0juWLCLopyn
 KR/yR0wdN5ZBpNl7DIjw9kmQfE1H5Usk7haMBETkHyGZQ2xGJXoZtYM1hRvvRZQ1Opvd5nz0aqO
 Zy882eTsjXKblobPoTKxT1FOIPUY9wgRUmsS18Z+e/cV8SimxLeZSb9PbhbDJpdON7paL6JOPJt
 fOzbb3lEkFy09ULc80TCJj/CQGMGXKZIVsarKrd8RsgAB9UfZzLALBW4mw3qHkehtL9mtfIjrjC
 u28s4tsIDjso+CdVY8sHOP0FGPPqVqJpRH6C1BOh+sk+9Uht46Tavpdr2r7ajePVDg==
X-Received: by 2002:a05:600c:34ce:b0:439:3254:4bf1 with SMTP id
 5b1f17b1804b1-43932544f7cmr78777475e9.8.1739222973651; 
 Mon, 10 Feb 2025 13:29:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd530cce2sm7356427f8f.88.2025.02.10.13.29.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/10] disas: Have CPUClass::disas_set_info() callback set
 the endianness
Date: Mon, 10 Feb 2025 22:29:20 +0100
Message-ID: <20250210212931.62401-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: PTGmx/KlLyd9

Missing review: patch #3

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

 disas/disas-common.c    | 13 ++++---------
 target/alpha/cpu.c      |  1 +
 target/arm/cpu.c        | 10 +++-------
 target/avr/cpu.c        |  1 +
 target/hexagon/cpu.c    |  1 +
 target/hppa/cpu.c       |  1 +
 target/i386/cpu.c       |  1 +
 target/loongarch/cpu.c  |  1 +
 target/m68k/cpu.c       |  1 +
 target/microblaze/cpu.c |  1 +
 target/mips/cpu.c       |  3 +++
 target/openrisc/cpu.c   |  1 +
 target/ppc/cpu_init.c   |  2 ++
 target/riscv/cpu.c      |  9 +++++++++
 target/rx/cpu.c         |  1 +
 target/s390x/cpu.c      |  1 +
 target/sh4/cpu.c        |  5 +++++
 target/sparc/cpu.c      |  1 +
 target/tricore/cpu.c    |  6 ++++++
 target/xtensa/cpu.c     |  5 +++++
 20 files changed, 49 insertions(+), 16 deletions(-)

-- 
2.47.1

