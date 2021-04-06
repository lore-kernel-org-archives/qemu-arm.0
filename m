Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1687425lfr;
        Tue, 6 Apr 2021 10:42:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTbdH4VtlmYfJ1AkuJI6kF9cuhdeuc4EYh534F5fgSX4MJWqT9W7dxUswjlPWnl+FmKheu
X-Received: by 2002:a05:6638:210d:: with SMTP id n13mr29756050jaj.100.1617730921033;
        Tue, 06 Apr 2021 10:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617730921; cv=none;
        d=google.com; s=arc-20160816;
        b=AMJsfGgOzrqeX0p2AxEcS76Y/N0Pm8r4Hj3ysnlpxisLPoT7nLQs+GigOt1xlImvWQ
         wxAcknS4WROtbTfc7oMwOOu3WQqWRq+nvh3LIndZsVyCYChR9rfHZdqOmF+nZDU7lNrh
         SPbeVajyWO2CMfxtsst4p/cbF/2gmNb7PtxbYZitymFAGNpzwDMNFsKg9jgeUa1OjtJj
         8dRbShFc3r4G9tksopxvutZTuhbSW6xQPHi4m8JIbIq2S24JMAqE+f/Z2Cq9Smuo61EJ
         ZIotpdrXgMTVLO8FUly7Xj4kunDk2YI2Db03xtYEypTF8n9NCKbZAtQzv2XNSa7pFqDB
         lYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=sKk73qUHSFNSDZq2+y4JQIWdiK15wkPN1fPW2vJPnP0=;
        b=EExRVWztlbFpd4Hj5bWNO4kukiNWI6IRqb68Vi+ZYmrU2TdfM/1FU6C71jI8zP+Gj9
         GD2nrRy/HjZfYR5PUSUDSQUTSQGNnHdZSTfLH19Er1e3YwOuNhu1riMoYkmvR5QnlBt5
         a+GTrGQvvTOIk1gejVQMlyj+T0qGwXmQkTTM2PfqAJqF8Nn47Dxof6GoCZC9EFLTp2pq
         VhW7THxnDoqh2OMx/AL6bYcoNZ9Rg4Pl3NmryEkJ6lbD2YYEc01n5RoCt6SRtTzIdoNs
         uo2K5c7eiHLoSxrwmJ7gTo1I0uutSVQrPTGZ7X9B81c9rahdYQ74A7SWr/us5VNsTXqf
         kSoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsQVOWdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si9283484ila.10.2021.04.06.10.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsQVOWdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTpiC-0003J6-6l
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgt-0001b4-2t
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:39 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgo-0006Ha-WB
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 13:40:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id v10so10939915pfn.5
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKk73qUHSFNSDZq2+y4JQIWdiK15wkPN1fPW2vJPnP0=;
 b=HsQVOWdwW1HuzpU7ldowYPinKfP+e6RBzG8OIcrmL0TJ9er3r/AAxGGC1aXRnJWOxu
 NU7BucZj7d3KQOxw0IJqZ2uGhE1G2coYTKcuRxoGE2rfrZGrhscS1Z87NFozqyOCB7E4
 m/IbIM232ltno2dESrRdJ4DV9s36zvzpf4n0i3M8yVdTeZw38tQDMd31I9yZ9h1mXdCp
 XAOpuznHkR0fQ+OuUMA/WpPj1gR1f5GiV0aWcdEI49CQBbMjMQGCQZa+buyNY7sx7L0S
 odvMmTI5dtrEspiLfg2JSicH4ENcdNngWNj8H5q7awrwGR8kmlj1VLflDZXItVkpNx1x
 s05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sKk73qUHSFNSDZq2+y4JQIWdiK15wkPN1fPW2vJPnP0=;
 b=NhmM8gjBynfuVw/Zo2PTwf7qRU6KNkcZrUSquMLyaXzm81vTXJ5mJdrEo3iMrDgOCZ
 gfPvrfHLIqWZ3mbjBpm6KQoBOqqsdeQfSsSrTs0FD61jZmmJ6altUgJIVmDWXZESdnsU
 cW5fdg4hyhdzAK3y6Waknk3ddpRUvuyIosU0X5LXAHKrSmf2xJ7k5cGUcbOX8DdgFN8Q
 HUNaOv1SB3ED1vXy+VxQZCr1O4iV/AJMUAvjPfWr5yA9hmK3PGHIK8Ax7bEE3g/pIRME
 YOenCoHzFcA5JjKR6LfkPDrQqrIltq63HSosjhw7cdS7CQ2qg/2mCPMQypXsXPhD1Rjv
 idyw==
X-Gm-Message-State: AOAM531mJErOGVl5CnCwsl54KRsayKe4f5VR06gDSbyNaivfaYc2r5na
 7DX+s7mKZJZSqcsisif9tBWtUw==
X-Received: by 2002:a63:c90c:: with SMTP id o12mr28539223pgg.210.1617730833352; 
 Tue, 06 Apr 2021 10:40:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] target/arm mte fixes
Date: Tue,  6 Apr 2021 10:40:19 -0700
Message-Id: <20210406174031.64299-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+ZGxzSa3yRs

Changes for v4:
  * Fix tag count computation error in mte_checkN, which when used
    by mte_check1 in patch 5, caused all sorts of KASAN failures.
  * Fix PAGE_ANON / PAGE_TARGET_1 overlap.


r~


Richard Henderson (12):
  accel/tcg: Preserve PAGE_ANON when changing page permissions
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN
  exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1

 include/exec/cpu-all.h            |   4 +-
 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  11 +-
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 185 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++----------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 +++++++
 tests/tcg/aarch64/mte-6.c         |  43 +++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 13 files changed, 227 insertions(+), 210 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1

