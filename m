Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1608535njm;
        Thu, 6 Mar 2025 08:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUO1gBtiOloT/GEYe5wd7MD2skj5gSDP8C1Su2PgKDsac6VQFzVYGzXg47XXs5KZPiYBKDJ4UIWrTGSGg==@linaro.org
X-Google-Smtp-Source: AGHT+IF75Qu8YskO6UQqyeyQaaHISqB132uzujkV0naFcpOFm3KGoNJEiUa/rhxgYO9Y3TCLy+3b
X-Received: by 2002:a05:622a:1446:b0:474:efcd:535 with SMTP id d75a77b69052e-4750b43c17amr120979941cf.16.1741279206622;
        Thu, 06 Mar 2025 08:40:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279206; cv=none;
        d=google.com; s=arc-20240605;
        b=HiShCP0TEb/hpQFnvLaeIv1Jl7g/MecfFakcsU0fS4Bt5f5GvyABTsApo+r2UeN5Jc
         wQ+eOjKxyIAZptCOR+u5LTfqUKDRj1CsZDdYF4oLBikegSg4udFAENByhgI7xPcgUAg8
         EakTjMd1ebupadu7hFLwt7JL3GikE3n9U+vE6uSdNBV6af5FUTnpnsGFOhuoBUZW0T+z
         rYA98MyyLCucNeZ2l54ZrsJ5alNQb3DuHtjYGliGXN7xQS9y4eDSc6DEZVp70cw/BtJO
         6VQBTsNdKdK61npsL+xBb5NIaOCnDzcxCIvDshxT+1JY/Pd12CHHfDBsgd0fA40DFw8a
         eJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Y3lF4QXwAXqr0/RhGUX/8f5AxZ/nEi7UOp1O/QtSQMQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=fK6G/GpS+WDNCGM9R7uG0vKp54NZWFRw65r7ZpJBx/9SzFECduKMQZ8MTEZZ8RFO9V
         GpxjYD4/5cE3rtA4+njDspCzxC0EVgfZa2EfP532MS7AdhdU6XtIa5ozCU5seu3lG8Fj
         GvvhCga6MvswARcxQOfmym3Zw+t0QCi5wDBv2HY/V1XCheYvB36iF5xT8P4krsdgl3DZ
         m7RwQtbOP1zOB7LIS9wP556CLmovR4fU9phV2t7n9AbGAdlSZskBNniK7oKaqNZB4eba
         gFuNw6n9daHMlAVrTxtw2QVdb0oXBZvD9YaOqgXkH3uAWK53cj1SMGCXJ1JKSoseJP+p
         Bp0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkG2lSrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d97f8b4si14257341cf.51.2025.03.06.08.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:40:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkG2lSrn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEG4-0006p7-6f; Thu, 06 Mar 2025 11:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFw-0006kd-Ck
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEFu-0004W0-JJ
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:39:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43bc0b8520cso5965355e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279168; x=1741883968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3lF4QXwAXqr0/RhGUX/8f5AxZ/nEi7UOp1O/QtSQMQ=;
 b=IkG2lSrn9+bexSIoM48UUDiGUqb2oPo/muMlPRR5D6ReQVkxuEXdjRq4BzR3kcNAEH
 CLks8jhEglv+10P011jijeHHu0p8JU7QkzgR8GR2lE17qGM9+jfcE2TO/6yNaBWeYlzc
 0bgjC/qB2BlKYtst/C71dFV7FmFWTsgKigb11ASJ0YcjlYo1zz3zBKkPE1x+LPEqiGPF
 A3Xbha+HuAgJv4luO9Ol3QmxzOvboEyOdWc8qPJQZMkqetBul9MfTqOXgEDRNpwpgizw
 dVr4EuPUB4t2tVjPWUVsOPgVeRZj+qN6QEv9aXdxuThpnM83R9/8oqsLLlHupZ6ib+Tu
 HWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279168; x=1741883968;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3lF4QXwAXqr0/RhGUX/8f5AxZ/nEi7UOp1O/QtSQMQ=;
 b=KcnlcyelERhwDzdqQEvno5O0rmaDVVBpFLOhICS/DsMks29YTBY4GC2WxFlocu5hVl
 qFQsSolzptEYq4TsGDqlArrARL88FEB5QxtYyQXRONjFs8g6motJy0XMIvTyBOgzSlJ8
 L8mDLaPI9Zx51GXwYuNWdxE3NhMp+iyUhn2z5SK4fvF0hpaa4XWeYVqEvXZimu5R17Ug
 fJkWgR1c+r6FWWYyomN3vqHlRmlgMFpApZNvoFw5p8+Bc/vxTinANn6f1isinPcL3WT3
 e2HjzS7gdv8CjIeKyDsJ6q2CrkIG4nWkFfy1gDIgUeEz6bv2RlmbTkmYsR2yJKxktSvS
 2jAw==
X-Gm-Message-State: AOJu0YyOLoMTqSfpWm5Owpr+fMGJTmz2DW37mnp0hJLkFeF9H5VM3SHh
 HL5FgKsutWZxD2Jd1slHZA5wB76V+Hob/L3xtvUavw7H1y3FaqABImVe29s2uK2Usjuf0rTnzQL
 j
X-Gm-Gg: ASbGncuS+oJidkkX68EAcuC295RivmFik9iJDFXjNaeU+MdODbzY5RP/sIlkcNRRA/D
 Sv2dO7U98+AFaWL9iHUQBnv6jdD9/+H1/kULw6Xi+2Oo9fjqw0SRz2mrx3q8dXBXA6R0cD3Huti
 OFZwlx998UOvE5wpk56w75hxEWts4WL02NUhlcDqNEceKb7E11TAK5cXP3qhLYbFafgsNCzWaYW
 iW5Jrguuf+5iCINR+csDk7V4RTQ2QFYz7WfRwZlksbESrTiMEfYy1ioXsZpxVErxQB905fskZ7/
 Z/oPcBrhqlVqYGa/pM+Hsok7S/tDJl9IgTkfk8lgNQxPzHtswPk=
X-Received: by 2002:a05:600c:474c:b0:439:9b19:9e2d with SMTP id
 5b1f17b1804b1-43c601e1393mr1627435e9.16.1741279167524; 
 Thu, 06 Mar 2025 08:39:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd94913fsm23999905e9.37.2025.03.06.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:39:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: From ce9a42483c23c32cee233f648101a160b6604b45 Mon Sep 17 00:00:00 2001
Date: Thu,  6 Mar 2025 16:39:14 +0000
Message-ID: <20250306163925.2940297-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 5FuGHj6ptkhB

Newer Arm CPUs need not implement AArch32 at all exception levels
(and Armv9 forbids implementing AArch32 at any EL except EL0).
All our current CPU models implement both AArch32 and AArch64
at every exception levels, so we currently get away with failing
to enforce that the guest isn't trying to do an exception return
to AArch32 when the target EL doesn't support AArch32.

This patchset adds the missing checks:
 * SCR_EL3.RW has an effective value of 1 if EL2 is AArch64-only
 * HCR_EL2.RW is RAO/WI if EL1 is AArch64-only
 * return to AArch32 when no EL supports AArch32 is an illegal
   exception return

To do this it needs to start off with some cleanup. This is
because we need to add a cpu_isar_feature() check to
arm_el_is_aa64(), but we don't want to include cpu-features.h
in cpu.h. arm_el_is_aa64() is really an internal part of the
CPU implementation, so we can move it to internals.h; this
means also moving some other functions in cpu.h that are
defined as inline functions and which call arm_el_is_aa64().
Removing some unused macros from linux-user allows us to
avoid having linux-user include internals.h.

(No doubt there are other functions that could be moved out
of cpu.h, but I stuck to only the ones that I actually needed
to move.)

thanks
-- PMM

Peter Maydell (10):
  target/arm: Move A32_BANKED_REG_{GET,SET} macros to cpregs.h
  target/arm: Un-inline access_secure_reg()
  linux-user/aarch64: Remove unused get/put_user macros
  linux-user/arm: Remove unused get_put_user macros
  target/arm: Move arm_cpu_data_is_big_endian() etc to internals.h
  target/arm: Move arm_current_el() and arm_el_is_aa64() to internals.h
  target/arm: SCR_EL3.RW should be treated as 1 if EL2 doesn't support
    AArch32
  target/arm: HCR_EL2.RW should be RAO/WI if EL1 doesn't support AArch32
  target/arm: Add cpu local variable to exception_return helper
  target/arm: Forbid return to AArch32 when CPU is AArch64-only

 target/arm/cpregs.h           |  28 +++++++
 target/arm/cpu.h              | 153 +---------------------------------
 target/arm/internals.h        | 133 +++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_cpuif.c     |   1 +
 linux-user/aarch64/cpu_loop.c |  48 -----------
 linux-user/arm/cpu_loop.c     |  43 +---------
 target/arm/arch_dump.c        |   1 +
 target/arm/helper.c           |  16 +++-
 target/arm/tcg/helper-a64.c   |  12 ++-
 target/arm/tcg/hflags.c       |   9 ++
 10 files changed, 202 insertions(+), 242 deletions(-)

-- 
2.43.0

