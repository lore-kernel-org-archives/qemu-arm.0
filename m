Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp710976lfc;
        Fri, 23 Jul 2021 09:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYW1Jvxl8DQwFgSFdf82t9HvNlc4AyNODTF+Fd1USps2uGczlTK3+AP7tfY1vP0ZK7dW7F
X-Received: by 2002:a25:30c2:: with SMTP id w185mr7362706ybw.321.1627057346258;
        Fri, 23 Jul 2021 09:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057346; cv=none;
        d=google.com; s=arc-20160816;
        b=KlNI5CSBH2ubdibEIr2pMqSrw/wYXEB0koWtADfbq64F6zvg/iEtVACufxfcLFTzEa
         /MUQLG+ngln6cl33wJHBU9ejoHUF7oEoMbLgrFRIZwYxqojLMCSrXQ/apjfVHBgK0KZa
         aFd59uEp8dU8p7cR0Oi9soCC1OHz/Cv+xCbf1LG0zjY+yR+Qrf+u8PpVpg+MKiFo7bim
         vFd4YQH4h4cK/Ht2eeEH2H9QNmVcDSrf9eqqK/ruHw4cTg/LwykCZO6V06FpN1UdpHhF
         6PlEQxidSE7OWl6wwTRxwzhONRe68bkM6lp0jaaLxGF+J1gyAmpDXTskl2vJjvUT+6qY
         IrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pC3higFKBpWHoN/o0EaoEZiCD97XB+WWIsCQWkN89RI=;
        b=PTaXELXRWxihZVoktWmbLfxi+4zEen1Rl7G3mMFkBjTd2u9XA6Gk/tXOMFyNbUjO6q
         0/sjo2nRrLUphqKu0BhJelQw6MLcTpS/JT3EYmMc5HVNA8eiWW7pKU9aDcVI0GBqGCkq
         hL/U1BPtuaf2vw618gJ9ecQ3G6UDhS87DTC7A7pgws2pXPDQ9DGmJzwjZZ9yHDNTx9/4
         Zt7bATbGJqFuvU7PhjAhV9t3KtRgTznEZ4ecENXQsyybWB/3YVabGg1D5iVJ5GE9qkYE
         SFPUnoWZnsPIXIsidyaVqBDrCTnLkdPxmMuG90MradeY3aszflbPh+TlZyWL+jy2rElh
         5tiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYzIkFHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l70si1453067ybf.198.2021.07.23.09.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYzIkFHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6xwN-0008TG-CA
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvs-0008OR-6F
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvq-0000kC-5R
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id z8so2956752wru.7
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3higFKBpWHoN/o0EaoEZiCD97XB+WWIsCQWkN89RI=;
 b=sYzIkFHiFA0k+1SCYscQ3bpka5ogoD4koPYecSEvQCgUwpGLmQ3vGlCS7RJYUlX2u1
 r+CkC9S2T8x6+BlB16AzLVFBoYILzf31zeoHdxC1cQyOef7nlT6IR++8zojq2efjO798
 0+LOqfNgE/yIJqBADQz9bWujb9aNZK4OuOvU+tu7MP+tqzVSDPpuMKj0tiV6LsL6X0V1
 pQA0dTm7Zcin6du9vEA2tn/0cxoA6NrWWUkHlQShYqjoklC/1CLfNN6pUWXJuFms/zew
 Rc0gkIrR8Ejg8Q0UjLa/qshYfGA+3ImaZXowyubpXt2hzS2m9zQJ98ieUi/i8MKWkacE
 kaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pC3higFKBpWHoN/o0EaoEZiCD97XB+WWIsCQWkN89RI=;
 b=ZP9lOI7BV/w3Ty8n7kFV75Jx6dWvdYiGwkFrJ8Q1vTOx7KR7GoicR2eQd61GIVQBLW
 P+WPhOkMNfc45hsayzq4CoaENpKF8d/JrbmZHuCOo4eA28tCOq7RTAaNozgoHDv/gu0Y
 Zq3R9yjp4RPg5qXjJjvDFTRhB1uhX05mM3EMiWPN1wgy1oLOqs4yCutpWzb+WWfJZEmR
 N77x70nXw5NRExGCfXxyWQxIRpIcRmzlQDk1RdgbrI1/bINfUuOZUqCba8NyKSvFcgQl
 DUk0CsonPOEaREfSkr+Bhe/YhSHYll2XC1pVY0o6nI/OpAczD8Vr9yN4npSy3KCmZadg
 vraQ==
X-Gm-Message-State: AOAM532P7b8Tnicv1OKVhH6ueZ02GPtNZXx6Amk7Gz8NtalL85o2gmbB
 TMLxPSWDkLJXMW4EPuckOTJN1qyctPlkPg==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr6375067wrw.30.1627057308726;
 Fri, 23 Jul 2021 09:21:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/6] arm: Fix a handful of M-profile bugs
Date: Fri, 23 Jul 2021 17:21:40 +0100
Message-Id: <20210723162146.5167-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qxKRC+8oqRsp

This patchset fixes a handful of minor M-profile bugs:
 * The low 2 bits of SP should not be writeable (they are always 0)
 * Missing 'return' statements for some "tail chain to another
   exception after detecting an error during exception return" cases
 * Alignment faults were being incorrectly reported to the guest
   as MMU faults
 * ISCR.ISRPENDING wasn't being set if there was a pending
   but non-enabled interrupt
 * ISCR.VECTPENDING is 9 bits, not 8
 * ISCR.VECTPENDING was missing the new-for-v8.1M behaviour where
   it hides the identity of a pending Secure exception from a
   NonSecure read of the register

Nothing here is very critical, but they might as well go into
6.1 because they are bugfixes.

thanks
-- PMM

Peter Maydell (6):
  target/arm: Enforce that M-profile SP low 2 bits are always zero
  target/arm: Add missing 'return's after calling v7m_exception_taken()
  target/arm: Report M-profile alignment faults correctly to the guest
  hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pending
    interrupts
  hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
  hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions from NS

 hw/intc/armv7m_nvic.c  | 40 ++++++++++++++++++++++++++++------------
 target/arm/gdbstub.c   |  4 ++++
 target/arm/m_helper.c  | 24 ++++++++++++++++++------
 target/arm/translate.c |  3 +++
 4 files changed, 53 insertions(+), 18 deletions(-)

-- 
2.20.1

