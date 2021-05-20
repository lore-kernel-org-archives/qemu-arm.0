Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp151604lfm;
        Thu, 20 May 2021 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUCge5IerihGbM/BrPKEsaisvLMhIUj4OJvw3Oj2z/Yn/ef3lQk+fgqWMXRm+Cp3Al8RuA
X-Received: by 2002:a6b:f815:: with SMTP id o21mr4821060ioh.0.1621516162221;
        Thu, 20 May 2021 06:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621516162; cv=none;
        d=google.com; s=arc-20160816;
        b=dWMwN0EuS3TfpuXYkwQV+95wbn6+xlUXSZfCnRUTBrzYMqlYwH8yCpTvuHCBjzupAw
         zjxUSRJMu6rqMN+9Tv270vrGRoNWfNbwhToYJKSrT5KhPWp4FWCPqUOxFwPFzHJHrZSH
         anSW8dZb2lr54DcofgOfuyHYWHc4jMoOQ34rAPVtZibfxnRSx679svH+VYzRI4Azu5rd
         VLAmL4nBk5RCAhwqvFrcuLP/iem4uWhX4NkvDoSrxeQlPKiz/PvqYApAztpjJh3tuZit
         BDD7AuJopXv9OzF4U9WNavr3bwrCYzBsjWnJIWI/0LD6kcIMKECzUg3bIpZ2cW10rUez
         /XUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7gjzzaVXa0Sy8IMXM97M+gM0f0kAcQs0lDAVE2RbtsU=;
        b=HH1Rmiy/2bPKYhx6YOQBUc+FYuQsHXydcHJBsOoOeNMlHd1VdBI1TT8bGc6i4qz15C
         NAUse83AH+RWjRE8L0CSfdy/zpEVw8HWj2ekUnN4ddB2uiO16y7ThcBtwMpu+6IEC+jW
         jYbuXzSxvv4vxLsBwJ63jiju6KNrYmdlkCxhQGQ188Mrnrm/HFL32VrHGVsoJng8yn9w
         rQguP/GmzZcI4Xz1BknC5yvXiZpakGmJIF28LQw3kgDSQFEjNU4W1LngOkZ3ETlpFM+b
         Awlb90lmNtlq+Qwo3IRNcAxCkVpu8wcg8rU2eUZNa7aeBgmyiWncmFs3ROgIT1RU4bGf
         2kBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iy2l+jH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si2220655iov.63.2021.05.20.06.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 06:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iy2l+jH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljiQT-0007gz-Db
	for alex.bennee@linaro.org; Thu, 20 May 2021 09:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiQK-0007e4-1u
 for qemu-arm@nongnu.org; Thu, 20 May 2021 09:09:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljiQI-0001cn-8l
 for qemu-arm@nongnu.org; Thu, 20 May 2021 09:09:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id 62so8127356wmb.3
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 06:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7gjzzaVXa0Sy8IMXM97M+gM0f0kAcQs0lDAVE2RbtsU=;
 b=Iy2l+jH13H23q1stoAEo+wEqU4UKP+VtGOPCGoCP39WK4THr1fTKMF4EOetjla12kH
 pFnqIYo5Xq/Y+2oJd0AhmpFL1ZJgtlztcLGomR8EPIoWZjIJkIzZ/orbaoKyeOcV4pq3
 2Paamwj029N8S8WhGlqm2jS6THaFPSFSrZgZrae6CxNl9lXTfLx97Do/nw07hLqRJQB+
 6tnFbT2G0dwEFs5UXfevp1PM6NEnPPHv9/W3NsKG09tSDOwsx8Uv6i24Y/DfvnNt7mWU
 zOVCfbQSRcfi6CDVeSJbQVxT/ZaJ14/2alh/B4o0PAqB7OFVOMwlF31ZTXTfaQIJVB4C
 Z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7gjzzaVXa0Sy8IMXM97M+gM0f0kAcQs0lDAVE2RbtsU=;
 b=jVdU7yXBu+yrKezlSBUgTtsRpQR6fzc0JAEsjQGtbWOezx/TyURXAyoL//eqoSIKdA
 L5Jv0UnZ9wZ2i2mGNFk7/rzbWqaNx+e2dFQy4GUTrw1XPQI9Y2RhK93DmfUH13y5nvj7
 YHYql2qpGZkFHh4uJcE/WJhdmmOdL0J3KiQGLak5dcU5D8JnF/CBaYh8g/zg2b/4kag4
 rF6LAlEYUpTt2+j3zLQUi8xMz6aJX17FHE9YkCIb8OweOkVa7EO8zxf3YNX385UwJNI/
 9EnqyYdQjtwjvcEEKa4r79fKCq+5BcKyHWq2XDMQg617moetjyGYqKI+pyBrV1D7DMJT
 72tw==
X-Gm-Message-State: AOAM533xx3JZl2o7Mh90dvQXomKjtZ/qgY+xl/owRU1xZwN9W4+xf6iH
 TFdJ4mUDZOwROtMYIYJQ4WBN2+d4HvGljqVn
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr3604376wmq.138.1621516148684; 
 Thu, 20 May 2021 06:09:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g10sm3351951wrq.12.2021.05.20.06.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 06:09:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Use correct SP in M-profile exception return
Date: Thu, 20 May 2021 14:09:05 +0100
Message-Id: <20210520130905.2049-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTrIN9aP3E6u

When an M-profile CPU is restoring registers from the stack on
exception return, the stack pointer to use is determined based on
bits in the magic exception return type value.  We were not getting
this logic entirely correct.

Whether we use one of the Secure stack pointers or one of the
Non-Secure stack pointers depends on the EXCRET.S bit.  However,
whether we use the MSP or the PSP then depends on the SPSEL bit in
either the CONTROL_S or CONTROL_NS register.  We were incorrectly
selecting MSP vs PSP based on the EXCRET.SPSEL bit.

(In the pseudocode this is in the PopStack() function, which calls
LookUpSp_with_security_mode() which in turn looks at the relevant
CONTROL.SPSEL bit.)

The buggy behaviour wasn't noticeable in most cases, because we write
EXCRET.SPSEL to the CONTROL.SPSEL bit for the S/NS register selected
by EXCRET.ES, so we only do the wrong thing when EXCRET.S and
EXCRET.ES are different.  This will happen when secure code takes a
secure exception, which then tail-chains to a non-secure exception
which finally returns to the original secure code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This was noticed by the Arm TF-M folks, who have a pending change
to their code which will run into the situation we mishandle.
---
 target/arm/m_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index d63ae465e1e..eda74e55450 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1597,10 +1597,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * We use this limited C variable scope so we don't accidentally
          * use 'frame_sp_p' after we do something that makes it invalid.
          */
+        bool spsel = env->v7m.control[return_to_secure] & R_V7M_CONTROL_SPSEL_MASK;
         uint32_t *frame_sp_p = get_v7m_sp_ptr(env,
                                               return_to_secure,
                                               !return_to_handler,
-                                              return_to_sp_process);
+                                              spsel);
         uint32_t frameptr = *frame_sp_p;
         bool pop_ok = true;
         ARMMMUIdx mmu_idx;
-- 
2.20.1

