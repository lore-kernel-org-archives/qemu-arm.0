Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4655530lfb;
        Tue, 10 Nov 2020 07:01:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs4fHsFo/Beo2SmekQ4nxROMC6EmIeKryCTo7h+9jBX1BBF/6NtRl2xuC9iSFKqAtk0LCe
X-Received: by 2002:a25:3603:: with SMTP id d3mr12250759yba.170.1605020491674;
        Tue, 10 Nov 2020 07:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605020491; cv=none;
        d=google.com; s=arc-20160816;
        b=Bc2YdnvAWEUodbs7rjG/DqXQE/q5GeCCZJhWloFEHFxVJ5ZRBOc1bfqlQvhe8VYgRl
         Tca62lj0kmtqdmxObvCUY7KEK4qGKRjQhrflANELbPOq7H6seAyz1o+8WihmzP8EFodI
         b0FYTQogKUgajQ3zVzLbpIaNOJ8V+t/FuX5lyyqxtKBt20rDMn5QsyYFvShqyo16FkmE
         jm+RkwNLCx6I/MTknImE024JsYvZA7c+rmB3/D81wMcJnhymgn6aa4UludYFQGkY32lf
         L67iprSnlSBm5XHF7bsFw0L+ZmCDmMPXFxceenVYhJOSJq1hvGNHsWaf7IbJtiKCq8dl
         //bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PzT+Q/TmIovSxDPhfcAm2zUohAaZWdsY+cDjFWvAtVo=;
        b=WNtWmXZgZflpcTLqQcU+YlmTMrKABmN6YuDreuuEHFa8lKTOhunkBcFZal9bPXbe5Y
         VcgmIbN9VqvuI3dSXWP/qfm206IwY64HVTNxLTSUmN78nnHZEllj/0SUsFM+lXldEA4R
         UVkOrtXcJlqqGwxvCVMcqJqjO/KWmWnUWP0PFue+kMC0rXYGKSkAWIR+TYMM9FmH4QPX
         5yyQqAw6TmxwhoyHIboGry0r8W4N10WHB57iR4X+eo235VNkKGwyPy+SXhgrz7wl+0Zm
         Jz8i4zkLInZdq5UDeiH5VkY9ZkXjQmkvLJ1PX/cZOP1RNXkTBgRfhrHcME5qJukmchxV
         fFqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y02zd7xt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q192si12630551ybg.34.2020.11.10.07.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:01:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y02zd7xt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcV9H-0002S1-0N
	for alex.bennee@linaro.org; Tue, 10 Nov 2020 10:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8P-0002NW-3n
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 10:00:38 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8I-0007MK-Qb
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 10:00:36 -0500
Received: by mail-wr1-x443.google.com with SMTP id p1so12962634wrf.12
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2020 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PzT+Q/TmIovSxDPhfcAm2zUohAaZWdsY+cDjFWvAtVo=;
 b=Y02zd7xt7BlRlU2cvgzFE0RD+ubHQQKG9RKwOM8q6Z5ijD2gyJWS1TPn2xCZfTI74Q
 qkeRhMXWi3zd14/gCwRzQw9xPpd+Xtn8sh//lI211F0oAmTZr1tRNwFCLEtYji2psCMD
 Gtw0Se0itM7va9NaSq3HJpLlK64u5tMo0ZmKes0061uRiCwkyN9T14ACmA6YaMpKiJ3O
 eoDgvumZipby6SQBu4aJULjQtsZQtEYnbI2zyXcO6dVFUXD0aKzuIzmHT5tepvZUT+EF
 JT3VRKmInS3fhQPJNHhgX7V60IzLUED/DW4PcY3NUTDKkgNfVC4i2kWq/2D+/U4AwyFO
 N/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzT+Q/TmIovSxDPhfcAm2zUohAaZWdsY+cDjFWvAtVo=;
 b=D4TJobUb0K3+FTpwEhqphNFRJ6EDKRtyJeFwVmX8anYU3awliSALXDhcvMQIrjJ20s
 dYXVI5v9hteVp+YVNE4llSjDhpQrRW6tXmm3J+7b5fdvjJxM5dchYI3ShDPywtJK+lNz
 vQ7FciVXt+0CjRMNY6ifrffpvTxHSpviXUsEiMxIjHFp84h0Uj287kKNHtDMOX0vEM+O
 b4936nQCezzNsxNg9xwMDg5j71CKwgl59bFn1IK545lVofYr+0+NLH0m5ByxriCVVJdT
 +SNel22SoJTBsj44fQKWh7aewUkyUADwknDP/wIaMMLWrb3sESx4bD+F3SY1yjYNQJmn
 qRJQ==
X-Gm-Message-State: AOAM531Gj+aCPbxyR5zEiOyGJ9boYcFHhSlDM1oRk88VbXrK+RhJusOe
 nqfN0QkzYgsCDz1jWe+HCXxm2OhBIlubZA==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr9733422wrq.210.1605020427547; 
 Tue, 10 Nov 2020 07:00:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm3392493wma.25.2020.11.10.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:00:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/misc/tmp105: reset the T_low and T_High registers
Date: Tue, 10 Nov 2020 15:00:22 +0000
Message-Id: <20201110150023.25533-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110150023.25533-1-peter.maydell@linaro.org>
References: <20201110150023.25533-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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
X-TUID: vfZScR5ROWUx

The TMP105 datasheet (https://www.ti.com/lit/gpn/tmp105) says that the
power-up reset values for the T_low and T_high registers are 80 degrees C
and 75 degrees C, which are 0x500 and 0x4B0 hex according to table 5.  These
values are then shifted right by four bits to give the register reset
values, since both registers store the 12 bits of temperature data in bits
[15..4] of a 16 bit register.

We were resetting these registers to zero, which is problematic for Linux
guests which enable the alert interrupt and then immediately take an
unexpected overtemperature alert because the current temperature is above
freezing...

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tmp105.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index b47120492a..0a4aad4854 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -225,6 +225,9 @@ static void tmp105_reset(I2CSlave *i2c)
     s->faults = tmp105_faultq[(s->config >> 3) & 3];
     s->alarm = 0;
 
+    s->limit[0] = 0x4b00; /* T_LOW, 75 degrees C */
+    s->limit[1] = 0x5000; /* T_HIGH, 80 degrees C */
+
     tmp105_interrupt_update(s);
 }
 
-- 
2.20.1

