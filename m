Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1540835lfg;
        Fri, 2 Apr 2021 09:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+g8uKVUj+d1kv0tcxy+m7GJ3Fwk8zukGSeGPJHL291xLEsOkHY6S4rJoCV8jZQBmB6C4I
X-Received: by 2002:a05:6e02:1cad:: with SMTP id x13mr12088018ill.144.1617380336055;
        Fri, 02 Apr 2021 09:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617380336; cv=none;
        d=google.com; s=arc-20160816;
        b=jVtBPIllNfEyPdDt7zKghUs+oimKX9T7stpF+1SfnO505U1voB76ftxTm4aPD8SfV4
         1hjw6xGX4kAfcQpSSWgW5BaaGljowYN9Ocx2E0C2WEUyiD4++IUezByXFUcQ5poVA5h4
         LPfOe3kwupbKseeNjs+BPxbeDT1BF3Fhu4a9UJDzhzHBGddbq6c97f6Y9G/pObhvpjuA
         3KSRJ87ahqHFhGUt1GLbHiaLASXoZmn5N4YxRjmE6md1zxwsuXz95J21tFLW+RY4JFOe
         zh14rqwzzZKrMoPKGMq1NmJOXrJKXkEuG9SPUDqFNMVyfW7JroC6iQ/L9uGQOdU3mELc
         YMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=RhHqeyidCB+9/uyN78QecO6UZ1exOGFoiaz07QlfopQ=;
        b=z2r5Vj0CBKyzP4PiVauMxXH2lTJ9xio00k5rI/pECvt9/ATLKkWvQbzwXJA9iLb0XD
         rNIs4mQsCCDBZhs92oXFUC70zoX+yg7RHnk8RsS4owmec0d7N9xkL6srC6A3dIA5o751
         sxUits1ospo8rpL2ruucfM66ZlXMiTyG8xJSPAFHFPmUObhATaxUrMh/0kXC3q6PzL8P
         Fy1K02WzTAA+JOjLJh8w37YzFYdVBftaLHmZgg9UhIE5aMF1tkERyYIYc2nj7fuH4GuL
         aFFdOiU0u2IMPf8td31AyCbqyfBGWFqcSIkXLNMjx3vRcSXgsfV4hBal/z5CqxznZsvw
         doEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkZCKP+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n29si8212326ioz.104.2021.04.02.09.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 09:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QkZCKP+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSMVb-0000w0-7r
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 12:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVP-0000uP-Hm
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 12:18:43 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVM-000359-Cm
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 12:18:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id h20so2723628plr.4
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhHqeyidCB+9/uyN78QecO6UZ1exOGFoiaz07QlfopQ=;
 b=QkZCKP+k2IrB/f8r4ebE4hAAOiTl0bbs1komSIkEebZKiL13cgMo46b5tls1Tnw5Ht
 a9lViBULc9+pHNRjxzqlNFxyLrwydS+iMfEbjRsaaFolz3vzRk8ux22xH65FzAUeCU/R
 fhPZGZBKRK93GOfRWyUqE/UhvOS3DAyCinFDz8Wqe+/l1WAMrbNvCxVDQDhoCVUSnPmT
 RhUjp2GoAgVsbxK99YkO1dPolapct8j2quRm9Q78HbHsnG4wCOtI64jvPmKv4FsPfL/Y
 C6me8slgLSU9XRhkO7cJh1Vri3vv5p7PiMhTlp5fR9pyXOjpL6gfuHi0CNv5L1Vp0+hM
 3Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhHqeyidCB+9/uyN78QecO6UZ1exOGFoiaz07QlfopQ=;
 b=rTGrIA+9ujlxIK6xNieMNnVlTs5e+zCpcJeVCStFAIZj2kiJdDACicRr6ZXzV0+Q0y
 +EADwr/Bu+ySIwPDIyPNTxGXBZZ2BX+JzIVwY7DCv/Jq43v6xMPlDrU1TbfPM4qd5pFs
 7RocrMf6BoduBU6QQyiyGzmP6EKvv0jI5LoqaQ58G87auw+OMW5T1VX1nEr0ENz3qwoJ
 bN97ED7sHLz9DlacxOriCGy+BWm/sDN6VED2PiCamArWSQQMrhB6a1RhG61WZ6Rxb/Oj
 SnQMKrX1HUeRVWxyEYXEvB3mA8WSt6teU1P3pEihl+TaoEfe9oLej3L1ORDYAa40JROS
 xLeg==
X-Gm-Message-State: AOAM5329RulP1MNUpmjFy4V/7AgtYGnu3CBQ/gen8frj4QYWmkHo/5qm
 aIXF7r1J5ZHYEY4491/sOOf8sw==
X-Received: by 2002:a17:90a:5587:: with SMTP id
 c7mr14008245pji.5.1617380317698; 
 Fri, 02 Apr 2021 09:18:37 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id m7sm8821761pjc.54.2021.04.02.09.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 09:18:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm mte fixes
Date: Fri,  2 Apr 2021 09:18:32 -0700
Message-Id: <20210402161835.286665-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: yhNul+cy50jL

In addition to re-instating the "is tag checking enabled" test
in gen_mte_checkN, add a fix for a second bug in mprotect.

I have verified that the 5.10 kernel, running in system mode,
allows setting PROT_MTE with mprotect.


r~


Supercedes: 20210402053728.265173-1-richard.henderson@linaro.org
("target/arm: Fix unaligned mte checks")


Richard Henderson (3):
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks
  accel/tcg: Preserve PAGE_ANON when changing page permissions

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  13 +--
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 171 ++++++++++++------------------
 target/arm/sve_helper.c           |  96 ++++++-----------
 target/arm/translate-a64.c        |  31 +++---
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/mte-6.c         |  43 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 12 files changed, 222 insertions(+), 204 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1

