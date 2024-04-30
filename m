Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2977778ejb;
        Tue, 30 Apr 2024 07:01:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgcTNfUHFMxvVRkrQm3J0K5KT7ATBmX5iEQE0bmwHJSVj9XeentDUV+1zR4RYZzxwGHyEiCBPpgjlU3STdhVe+/3hiY5KD
X-Google-Smtp-Source: AGHT+IFIVxTGatj1XLZqQ52D53DdlINZI98feUUP4K6Q1e7+6QOVxVO/P/mHfsBtLt0NhHnfZ4BB
X-Received: by 2002:a05:6102:2442:b0:47b:add2:8a74 with SMTP id g2-20020a056102244200b0047badd28a74mr15026220vss.14.1714485686224;
        Tue, 30 Apr 2024 07:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485686; cv=none;
        d=google.com; s=arc-20160816;
        b=GCav/da5yhk74xDUK09nriVMzfbLjAkhZ0Q5fy+htrb8e58bUWQMZ5c/Sm4jX15Zb+
         NJKdURVa9vTzonExkyBJKF73qX6tLHpOVN8cZvq3CxQOUZ6UnMmtyO3a7m7VlkcvblBs
         Bm2Lqi3hKqibDWaPZxY3aEigek24nVF8DBgopqCJ6jZG6cPvZ6qL3Zsg4q0KYE8QKb+R
         5chyYY9mCP39v4DSzs4SaMfZaT3J9UM46d81UKTHd1nRi1ECeTpcpZ13q2DIviO99xr+
         ++9dGF1YjZs/sB55lW4hNbGTJLtvHhleVcmVHBAUpECdf4Bq233H67v/JaJ2uFYIPVAk
         4nPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4wO2taePM39TZMTxZs3nc+Rdb9ASnlYWd4vuIaOr/ws=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=yjpYC+r3OAGpUbHjUKBMn+KpWBbcFnO2WjMfqW4ksI09Y23YGyJM6Ix/2kNFnrlCXO
         mp/tHfwv2nkDEodWBUFgoOZVvBzai2A7DkddUvkzgLFcGpXFHNcrlgIn5t4FOrunJ3hT
         hUs5r35iU4xyFGZQ/20sUjFVaf2QMpngh2Fby1w1NAsyq1sWCgsoXND+YEDjrr+9Ehz3
         y1vbefRHzy2STrhfTM7nt5nYhaXDbnQ7vDeDRdqlFiVRb30Y7ra/msaRObX0G8Z2Kn/9
         8EHaPpdl4jIJ0NT3KEbA4l/Z+IPR4ORQ/WLz7GFGgCpmzor/hzxm0QhQ2sIHDiN3Y5DD
         tXSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBlcm1Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a67fc4d000000b0047c32edbe87si989635vsq.784.2024.04.30.07.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uBlcm1Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1o2J-0002Wo-7k; Tue, 30 Apr 2024 10:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2D-0002VV-Cn
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:00:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2B-0002sy-JB
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:00:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34c8f393195so2632298f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714485637; x=1715090437; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=4wO2taePM39TZMTxZs3nc+Rdb9ASnlYWd4vuIaOr/ws=;
 b=uBlcm1Xo68uho6bR3Ork6iV6Mv9wT9B3QX7VB5xYqrTPvV5RZSnr8nc5mrV75cKo4W
 3NUBTe8lh1+Aebzh14sVCulvldS1W2lhAAUGjWQLqLjjLUidG8YDhWDHSgYiFvGsfqHA
 iHtz+kKbSE6c7EvMk+HetRfPFTaLMJ9J+f6LdfkWp+C/I3Ozhdbui6KprbA2/ebEbB/8
 lQvl3dKTHUk3nJpWicHkWvrZJYQvQB82iyROc2SeT/ZLb+nvaKRTGbzv8U8F37wKOGMx
 iWGoXEs0f05m6L82x/NC3QiAAtdoUlxO5qeKXTghZZ+/aOUzZ3KiCH7ZsXSzhPbca+4+
 T79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714485637; x=1715090437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4wO2taePM39TZMTxZs3nc+Rdb9ASnlYWd4vuIaOr/ws=;
 b=rulhxEhjfLTjuOP8321U6psGyminMRYMWikbkGHcUjEdCzBH4k/DHyV3G+nXl9Zz+R
 Gv/CVGKQzsKJSdojtpSo1W8LU8C/AiNYL1tgW2UWuh7DHf0I9+YGYUV1th+qUwhS1GrQ
 os0tMfzNCgICExhlgtKEghmTh6Ym4ZVhoAfaqdmjgAWVF0LMrKgX8TOWUc5vOIghnZXO
 c/mBYAimcMTEyAag/EfJ1xwoTKPTrPvYNe41vC8HQ3aVAyYVcYGb3D09r9IJ/7JWLdrA
 CZL4KitTlEuylJbaTtoXKg/bBPH4EXcDacRIc0HNjrVMco0prFPDbWA24i7x4sk1eMLc
 PKGA==
X-Gm-Message-State: AOJu0Ywgq/xBxHkDgNnfpCL2/w0uKrP17OK6qg2AkoLyNWnV26SGx9D0
 vTm4QZfbs73AsQv6H1JKIM9w04j2FZ8r2TT9zFia17a06+sUfFUzT091/8Rz0D2IAv36JdjThic
 n
X-Received: by 2002:adf:f906:0:b0:34c:4b26:cf7f with SMTP id
 b6-20020adff906000000b0034c4b26cf7fmr10152242wrr.67.1714485637220; 
 Tue, 30 Apr 2024 07:00:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0041bfa349cadsm11062705wmo.16.2024.04.30.07.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:00:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Implement FEAT_WFxT
Date: Tue, 30 Apr 2024 15:00:33 +0100
Message-Id: <20240430140035.3889879-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sge5kfhH3Dmg

FEAT_WFxT introduces new instructions WFIT and WFET, which are like
the existing WFI and WFE but allow the guest to pass a timeout value
in a register.  The instructions will wait for an interrupt/event as
usual, but will also stop waiting when the value of CNTVCT_EL0 is
greater than or equal to the specified timeout value.

This series implements this and enables it for '-cpu max'.
Patch 1 is a tweak to the TCGCPUOps::cpu_exec_halt method
so that we can use it in patch 2 for "do some work when we
are going to leave the halt state".

thanks
-- PMM

Peter Maydell (2):
  accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool for whether to
    halt
  target/arm: Implement FEAT WFxT and enable for '-cpu max'

 docs/system/arm/emulation.rst       |  1 +
 include/hw/core/tcg-cpu-ops.h       | 11 ++++--
 target/arm/cpu-features.h           |  5 +++
 target/arm/cpu.h                    |  3 ++
 target/arm/helper.h                 |  1 +
 target/arm/internals.h              |  8 +++++
 target/i386/tcg/helper-tcg.h        |  2 +-
 target/arm/tcg/a64.decode           |  4 +++
 accel/tcg/cpu-exec.c                |  7 ++--
 target/arm/cpu.c                    | 38 ++++++++++++++++++++
 target/arm/helper.c                 |  4 +--
 target/arm/machine.c                | 20 +++++++++++
 target/arm/tcg/cpu64.c              |  1 +
 target/arm/tcg/op_helper.c          | 54 +++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c      | 41 ++++++++++++++++++++++
 target/i386/tcg/sysemu/seg_helper.c |  3 +-
 16 files changed, 195 insertions(+), 8 deletions(-)

-- 
2.34.1

