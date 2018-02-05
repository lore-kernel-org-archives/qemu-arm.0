Received: by 10.28.71.27 with SMTP id u27csp2341734wma;
        Mon, 5 Feb 2018 02:57:41 -0800 (PST)
X-Google-Smtp-Source: AH8x226NM/fVbw6mLyuMyrjWz6AIE3NTif9UG39DikrCnOluieX9OsfX1qjhabnYTboY8UtNynEU
X-Received: by 10.37.174.168 with SMTP id b40mr7358407ybj.482.1517828261328;
        Mon, 05 Feb 2018 02:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517828261; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZON5OWLOFsbFEKjtSATZWoa8dzuR6Y4Zc4H6I+ZhTKdnLnCyNlBSCpLjvV6QQNy2i
         xBZzo+q9VUIGaoI0YdJ0aFGn6kKUjfGZgDX4h4RcCNgZo1MOR6WWAfB8Uyhg5o3R1cYA
         iPAP4/iq8z9rLCX9dHLRhdhegDgHaK+h/BvLT1Q83ys+HwFo1MBBEf+4kW2C5fs6EvJQ
         myDs25q8N+2hs3x8dmFJo1wyT96yOTK9abE5gkaEXtBV+SN3OdgAgA4+dGYCLhWSOnVA
         qG60hpYrNqFEvj4Tqinuoh68DVAiC+YlAMvLCpTmIyj6/2S2bc1l43HcjLN4jk0yMeyR
         AvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=JsPsYzf57AcODZla2Csmi8XZ7K03BBxp9cWUuVZ8qAY=;
        b=lNWFPnoGLbWMCMUCkFpU9w70MbuA9lIeT1WbLPOe/3vKNYNL+MiydI4GvKhrYAGhoI
         zu4Z0fFrvqddXlHMVPXBJ/A0FxkU3sHK5uu/fimSftsrLUZaxMVhw24bECnvEHlKlXZW
         nGN9zqwnBkxFAvcbRd0sxHZlOEAGlc3J75Sb9D+uvzI+RvTWDDpcwVuVYoTTQGiI9oYA
         V7PYEB+8VA+pq5yJUnw5yv9HEvHmdiTRSDNkWsg8x5ucwdOuzOCHBoAdA2qFxZBBtcNQ
         FdB96nNBDK8zpQZPkPP+uAfwnYDzHcufOfq3hsWsebgrRlDuAXyXCsF9QJIi7t5NVAjm
         r53Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si857307ywd.25.2018.02.05.02.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieSy-00061l-JA
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:57:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSp-00061P-MK
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eieSo-0007AC-T7
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:57:31 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eieSo-00076t-Lt; Mon, 05 Feb 2018 05:57:30 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eieSf-0004EC-U0; Mon, 05 Feb 2018 10:57:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Feb 2018 10:57:12 +0000
Message-Id: <20180205105720.14620-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/8] v8m: minor missing regs and bugfixes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: no/eFPExGNKB

This patchset is the result of comparing the registers
listed in the v8M Arm ARM against what QEMU was implementing.
It adds a collection of generally unexciting missing registers
(most of which we can simply NOP or make reads-as-written).
There are also a couple of bug fixes in there, of which the
worst is the byte-to-interrupt-number conversions being
completely wrong in several places. I think we didn't notice
that before because if you only deal with the bottom 32
interrupts then they're all in the first register in the
enable/pend/etc banks...

These patches sit on top of the derived-exceptions patchset,
but any conflicts should be purely textual.

Based-on: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>

thanks
-- PMM

Peter Maydell (8):
  hw/intc/armv7m_nvic: Don't hardcode M profile ID registers in NVIC
  hw/intc/armv7m_nvic: Fix ICSR PENDNMISET/CLR handling
  hw/intc/armv7m_nvic: Implement M profile cache maintenance ops
  hw/intc/armv7m_nvic: Implement v8M CPPWR register
  hw/intc/armv7m_nvic: Implement cache ID registers
  hw/intc/armv7m_nvic: Implement SCR
  target/arm: Implement writing to CONTROL_NS for v8M
  hw/intc/armv7m_nvic: Fix byte-to-interrupt number conversions

 target/arm/cpu.h      | 16 +++++++++
 hw/intc/armv7m_nvic.c | 95 +++++++++++++++++++++++++++++++++++++--------------
 target/arm/cpu.c      | 28 +++++++++++++++
 target/arm/helper.c   | 10 ++++++
 target/arm/machine.c  | 48 ++++++++++++++++++++++++++
 5 files changed, 172 insertions(+), 25 deletions(-)

-- 
2.16.1

