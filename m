Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4656522lfb;
        Tue, 10 Nov 2020 07:02:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+gW1K+qAnwMLc+FP/HRHWok8GobqP1waPtVs5F4ytcVc0peV1uMW5/MDnI13Q7ODEQcbh
X-Received: by 2002:a5d:8987:: with SMTP id m7mr14330138iol.20.1605020544471;
        Tue, 10 Nov 2020 07:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605020544; cv=none;
        d=google.com; s=arc-20160816;
        b=LCDyfwpM2Jv026X17JrtE4OdfZQ8AT8b9VnV0D1eSWz+M9m/X9RlS1z+fmMyHXGvsQ
         ooNWpp7s+TxBHG3Fh8swarpE7tn6texn+98c1yiQpLTOisV5v3hkFhmxRUFvPQOtnexF
         Q00aeC8VYlYqzHC4uXWbnkqdzeryKaQ/uQQGTUZmd7GrbQEk0vjIKZ8bKxvvh5yjRSam
         l32M3ivL7FsF52Ww4OaTPIygWM5ZZOrklHhIHITuUHiWfSaVI6X7oj3zcGauiBXvHzIz
         ARbnyv84D/FrsZGlvoH8AFoDGxPvV0JVjXLCchSqASbinMs3GNhKzghJt7ZNDuc8F78M
         Ml3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LqejLAyov01H1x+PgUkQUuif5nZDpmbW7+uLz2z8bUc=;
        b=ON0xeNNNe1AsGfNjoxBkLex34IPX1Vta7Tn0AxlLlny3r/A4PYCoYr6GH5qVPCGVRb
         wtYdLpKMXxadjlX+yMW7XWjF2LbTZ5wVMLXyKGD0UbcrXEMX3EytcRq+r2P2DO6t6dWH
         LGFvv0oYle0LUK3Rhz6rvB6ZkOCxRRPk7StvrGbwkIV4gTp+Dz7qJrx8BRj69Twy7br5
         cyqY/OZPcY0rXSmw6MgxlCYSBDHLEnpP34c8kIhxVCkUMCr0Ryoto73ZIwWeLvdHm1Q4
         bh2/4ojyptY5og7Ej99dBuKM4UgptECSqtgP864CUE0sKX4W6jLFxFiwLNfFTgWXSN1P
         Bb8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0Iwj5Pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si695931jam.15.2020.11.10.07.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0Iwj5Pc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcVA7-00030k-Iv
	for alex.bennee@linaro.org; Tue, 10 Nov 2020 10:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8O-0002NL-Vz
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 10:00:38 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8I-0007KY-SA
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 10:00:36 -0500
Received: by mail-wr1-x441.google.com with SMTP id c17so12974343wrc.11
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2020 07:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqejLAyov01H1x+PgUkQUuif5nZDpmbW7+uLz2z8bUc=;
 b=E0Iwj5Pc7u4wPmKb7KFA/oUwdTnDKDFnamSWX3vErZJLNGIVu/1Su71j1xyn7kf86F
 mx2q8N6D7s+mGFF5WHb6AblkcWiamUS9zpn2r3nORVjnAsmhOpBHKeO1csB5BZ4y/q3o
 kZK4pXMfgSZZ5FgBlIIq9t7DqXBtYrlASd9cheI3BB4q1lsAKq5KAUifsq0BBh0Bm4N7
 m6mqoqc5UWhQmU3qeA4fHiqWQuY+oSXFDbJ7KeOzgpiTa72JlYL0brdtgkQF+cZ6ihOO
 9X4/7V5LsKx8cWR+xtdtfwNGYW8sF0BuvmQ+6rUcGs9CtcXN7aA+7VjfzigxwVkT/Z+8
 WvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqejLAyov01H1x+PgUkQUuif5nZDpmbW7+uLz2z8bUc=;
 b=N8/mt8qNnU/Tk+V1Hu1ogwJ5oXNeKgrxz4aUKc6MtvZuCAsnb/ybHhED3HL5Mho/hR
 mA5FBw1n0jx//3RCZro40Jv/rXuW7wrCfKomT3BiM/tU4pKDAzraYFUvLxfDgXKo2LpQ
 FQPimujaG4XGJRVnCyAnX3Z7Ny02aMUuau+X8BrO7YZgS7Rn5mJNopV/q2VdPLlFrTym
 r5/dCupSIq3asv1LI5GcqT6Ra6q6v137Q0UF/8FdON+goNf5xaiCpLLv+1VA9D1g7DQZ
 jM76VCE8YPxsbVS50trBQ3/u3lN4L4K1JN+xqedYHXximVh2AS9KQX1karp6jpEV9EJF
 S12A==
X-Gm-Message-State: AOAM530DoO8OrKaxYCQ9Cg4apyk/k+XS/+baCc7knDnWYvkaXMge2MiO
 vnGGqCCXharSNx7IzkLBWKbeL57qqtdbWw==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr26335132wrt.158.1605020426271; 
 Tue, 10 Nov 2020 07:00:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm3392493wma.25.2020.11.10.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:00:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2]  hw/misc/tmp105: Correct temperature limit check logic
Date: Tue, 10 Nov 2020 15:00:21 +0000
Message-Id: <20201110150023.25533-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: 0VA2stL4yWIu

This patchseries fixes bug https://bugs.launchpad.net/qemu/+bug/1734474
which is a regression between QEMU 1.3.0 and 1.4.0 of ability to boot a
guest image on the n800 machine.  The regression was introduced by
commit cb5ef3fa1871522a08, which fixed a logic error in the tmp105
device's handling of i2c writes.  That commit is correct, but it exposed
an underlying bug in the tmp105 implementation.  Previously, we
accidentallywrote 0 to the config register when this guest tried to
write 0x36, which meant (among other things) that we left the device
in "comparator mode" rather than putting it into "interrupt mode" as
the guest wanted, and it turns out that our interrupt-mode logic was
buggy, so we would signal an over-temperature interrupt immediately
and continuously, and the guest would hang.

Patch 1 fixes a silly omission where we weren't setting the
reset values for the T_high and T_low limit registers.
Patch 2 fixes the interrupt mode limit checks.

With these two the n9800 image linked to in the bug report can
boot properly again.

thanks
-- PMM

Peter Maydell (2):
  hw/misc/tmp105: reset the T_low and T_High registers
  tmp105: Correct handling of temperature limit checks

 hw/misc/tmp105.c | 73 ++++++++++++++++++++++++++++++++++++++++++------
 hw/misc/tmp105.h |  7 +++++
 2 files changed, 71 insertions(+), 9 deletions(-)

-- 
2.20.1

