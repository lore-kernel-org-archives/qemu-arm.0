Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1287868lfj;
        Thu, 5 May 2022 11:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHPuyv/ifQv1xvpS1MVRiNy3TzhZYU7Z8o+y69cAhBC7xDs6jc10qQse1TkMV5ACUN1ZhE
X-Received: by 2002:a05:6214:268d:b0:45a:9606:b8d2 with SMTP id gm13-20020a056214268d00b0045a9606b8d2mr15437688qvb.122.1651776845149;
        Thu, 05 May 2022 11:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651776845; cv=none;
        d=google.com; s=arc-20160816;
        b=w8uoe3CVn+rZqjWZYnycOakHiiqXwNXkVwWwsd7aq6ERb+WiMGu73Uu1YD4X4A+KnR
         DY6K/+lMKvkBQcyBMIMn1+kyuNH/vFIt8QP8Fdfn1YzGWbH73Uh0vbpT4Kvd5J7X9bIP
         CqhUOXigd+9prLJ4dxU5+gpB5scgGGK9jnxQ28IHhyEbTojay0c2jJ3Vq20Cgx4P6981
         U6xU0h7Ti4jCWLtwN7PUQh4O/Nwfnz8W7VW5ZZ3W4n4IBVx3ljd6X4j1ZAGVCZb/E+rk
         5rdQfVBeazxkqYKE6PkHNUvnNQC1c+RjgYhGYMOaor/O5nxEcFU1DC3YJYWkJiOyhg3w
         JBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BuN1/EkWnUbBt19DDokANHZeP/nibOZEcRUeiluYd6M=;
        b=rByWDl1LwmiPGq8DEiH3Mr0nOHAXsrNSNZMNkQ9Fs3bbOMz+nXPj+b/Ka4Y6lyQ2ce
         vsRNX/z1tnxSNF3ktwN3WspNbmrWowkH3yjeFr+7tXUetpy9dJGaKc3ypZY+ma82CieA
         U7Fd72T/pCG9cyilTXh0WoxB71UFCYLr780Ex6SyuSMQMOMz2t/c68HZ+VT/8ToGDray
         SJQoDLzyxyUiTeLqpynhJXOjTe+nbfjvKBZa/RUmTPwWHywsG+euGzgvLgHGa45ZFD57
         dFIbqFDbTtxTuJYxdtLSlR8lzsZL+vKsskqQsjW+pXIe91RFIFMQ8x8g2RxzZig/fIfc
         0SoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKJF0NIM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05620a444a00b0069f61d81c12si1638223qkp.346.2022.05.05.11.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 11:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKJF0NIM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgc0-0006UM-Ke
	for alex.bennee@linaro.org; Thu, 05 May 2022 14:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0002O5-Ch
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:21 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:47060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYE-0004Lf-2K
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:11 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 f2-20020a4a8f42000000b0035e74942d42so864212ool.13
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BuN1/EkWnUbBt19DDokANHZeP/nibOZEcRUeiluYd6M=;
 b=vKJF0NIMtHf683eDQCWvqhbBPNKoPR4hO/JlX9BNjbI2Vfox0C6lzZuhvw7pzQMsye
 btwDIdT4FuQeOyK97F8Fm3CVYjJrDDuVzO62KR0y8XQY+lb9nZrKYjvOF8fvNYx+ta43
 Hd/64UvNAfuH/jdzCxNeShN3DDEApFaqr/xjaQJ3Ni8VTWDQmcckCnzp33/K/i08XO4q
 hCGLMdCJqF9fMOVCi73uE4A+VMz/ND3VGWl6XGHtZeUDoVvddlY++KnfIt5lxx5Lct2P
 3mWeexPk8+74qxLzaUbrC62uVQAwHeQEOMs+uFZPGqB/9nj+km9k+7ehGvZExzRmVSar
 M2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BuN1/EkWnUbBt19DDokANHZeP/nibOZEcRUeiluYd6M=;
 b=mi1B+X69qbOscFRKHtEWj6/W2T3LCDo4l31uGZ6FMG5MeZi9DmMZSH9bHTak4AtMT/
 4WVVKxjjUPERsqV/7jIlBymLzbfvp19juveexK0r5vEENkX71EHvVw8WPRLXdWfzM1u8
 frPiJcukkKHncEWNFqPh3GlP5elbrxXVNtMWH29UV9xzLpCwPcGpzxJywuVIMc4xWUZU
 CR2NXwNc07OVs0tBNHI/HtnI2ruvOh5QitMscWva33YA7drp8ZcUk61MmJA30AMaayKy
 y4YgYJTy2iIubMzSGfHQP242RfrYOOlYYO43mCW51+pqdLO2l94Ch7ZGMDYUIZ16NvCm
 A0Hw==
X-Gm-Message-State: AOAM5320PJP/kC2epOQSp/8+8o0Xdvb+0T0Sk6CWsmPvADwDexOh8N3B
 keMSRNmWehjDRqEFU0azmwL0TM5bOS29DA==
X-Received: by 2002:a4a:b48d:0:b0:338:da9e:87b5 with SMTP id
 b13-20020a4ab48d000000b00338da9e87b5mr9883130ooo.59.1651776608850; 
 Thu, 05 May 2022 11:50:08 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/24] target/arm: Cleanups, new features, new cpus
Date: Thu,  5 May 2022 13:49:42 -0500
Message-Id: <20220505185006.200555-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sf9gRmDjLRAa

Changes for v4:
  * Rebase on master, where the second third is upstream.
  * Add ARM_CP_EL3_NO_EL2_C_NZ flag, and use that in the
    two cpregs called out by rule RJFFP that become constant
    but not zero.
  * Set SCTLR_EL1.TSCXT for user-only.

Patches lacking review:
  01-target-arm-Handle-cpreg-registration-for-missing-.patch
  02-target-arm-Drop-EL3-no-EL2-fallbacks.patch
  20-target-arm-Enable-FEAT_CSV2_2-for-cpu-max.patch


r~


Richard Henderson (24):
  target/arm: Handle cpreg registration for missing EL
  target/arm: Drop EL3 no EL2 fallbacks
  target/arm: Merge zcr reginfo
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out aa32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 target/arm/cpregs.h           |  11 +
 target/arm/cpu.h              |  23 ++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 +
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 target/arm/cpu.c              |  66 +++-
 target/arm/cpu64.c            | 353 +++++++++++---------
 target/arm/cpu_tcg.c          | 227 +++++++++----
 target/arm/helper.c           | 600 ++++++++++++++++++++--------------
 target/arm/op_helper.c        |  43 +++
 target/arm/translate-a64.c    |  18 +
 target/arm/translate.c        |  23 ++
 18 files changed, 949 insertions(+), 487 deletions(-)

-- 
2.34.1

