Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3620158lfq;
        Tue, 12 Jan 2021 06:59:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyR8EqKy7spOolHGUuvQjjeg+FbNOIjEqWBh2QhFQjOsC3PM+WZ30/SqkV7RgvF9z79Ocio
X-Received: by 2002:a25:ca4f:: with SMTP id a76mr7306213ybg.140.1610463580924;
        Tue, 12 Jan 2021 06:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610463580; cv=none;
        d=google.com; s=arc-20160816;
        b=Z65qxMHdZVjDPmjOuSkTNtD8bVB6jlhL9NyCxN9x1/Oly05moVm7J1o9SIpb9qrOHd
         bbKfD5LZRh6xhm9ZerdAJQe4Lp2pOIBy8lzr5b6xi1cA66AY/BAQLsjrBer2u+R9FIbf
         6F37ObwbPA+bmeNgU99MzjR3nhIVA+vEav709tmQVapo8D/zmMj4oJ+k/vDvA2lGLW1a
         V3jiLm76y5jNex40wjc0K83ZmeLS+bjey9vh/vTe1c3nUDz/oyOVuFc8EXN9JQmPJyG3
         ql6hkJXhkJ5UKo986r/0w9WHV+i5/lZi+WPu7OeDLX2KM456x+xA6uc/jTQNGc+U5uvW
         VN4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dUq4A654ZKmWVdTONfz5D26WNlkMJCt4bN5UkLrjKbg=;
        b=DoGa19sAT29HOECYOZRXRBWPnlBlpbDpDe2VXPa0tpDHDtJElHyQS5X5rX9msmB3U/
         8tbCfxa5rl3rPTPEMhgJem48n4TiYyU8JRawGjaRSA5hNoNJFVd0mr9IOxD0vBDn8IBC
         4WPUaqXKXbX2Wu25QIHcS5lhDP5j1YX6AVIWPRy9oiN015C0Kluv7JTO8EbPVBkOMaXZ
         +513FSJVRAezSt1aMst7gXKnX2YCdCeVCg0jv9MYxfR77EKleQQYNsHBW/4EVNO53pOx
         k1/yvX+pMjYr7IeMhiv+QNy7eQnuquq+SzlZUHoF0rBC2U5vyxZDf1Vvu33ozA2zV5Cp
         MTsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jSkw+6YE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si2684994ybk.129.2021.01.12.06.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 06:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jSkw+6YE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzL91-0003Mt-Pg
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 09:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5P-00088i-21; Tue, 12 Jan 2021 09:55:55 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5N-0004nn-Hg; Tue, 12 Jan 2021 09:55:54 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so1606163pgx.7;
 Tue, 12 Jan 2021 06:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUq4A654ZKmWVdTONfz5D26WNlkMJCt4bN5UkLrjKbg=;
 b=jSkw+6YEVqEEyeQ0O3nuUZ9msOUgFm3uzG1/Toks1srZfR2JWS8nJtKkekVfx1ypa1
 ume9rwehUhm+WVDcUS49xti1N7yFAkDXPVpRSnHEA8KdPZsWzQejwujF3XuiQYxcWJQN
 Gil0Cv0KP+OG3O8OFJsA374WKvuFB2PQWTmeevfnJlSGr/4MwkongIKHbF13Jog5m9yn
 vazZIYNCeVvtdXN2jJl7/7JlGf9gPpogIb4x0WwSeVqJ/zlvd0rsTTzOE1yuPQPR88vm
 xkPdVQ/qP4l6natwU/zzPM4g2YXi4tOo+5Xg6w4mU1t5KuvVQnYTrq/SKGSdDgSSRriI
 nT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUq4A654ZKmWVdTONfz5D26WNlkMJCt4bN5UkLrjKbg=;
 b=ryHbSwhExyBsyqG8BCSwv32sy825R7o1vJRyFijRgM+yZHZiGeAfdT98DyfCIhoR9l
 oG2Ae/Gck0qvXcmasRoFSsqcWKMeLrWbNAunRRY5U/JRKC7YEdIUx9rUv+t8tuaR0js9
 s+qV1qFy4tJuZnX1pj4ch6f+vDo9oGbWLnGlOR7Ntga8ThpQgtm7t5MU7VH1Yb4TbJad
 CIea9KiI0yca82X+R1b9qsftyOxSOoLn+OYvYBu7dKFJMXY3hfrER3OEE5z2OMFX8TEb
 y1ahSP76nc+G4OzIlwfiEQJtRd4aEqvEq6wJTCzYEXRFdokKJO/TScXKiPJj735GcfHr
 HqdA==
X-Gm-Message-State: AOAM531bXMhYVWcxkDDAZVxGKgKNxTfcBEC8PctDPF5Bi9NWDuacz8ma
 A+AGWJntfBOq2O72iZ+HPm4=
X-Received: by 2002:aa7:947c:0:b029:1a5:dece:c07f with SMTP id
 t28-20020aa7947c0000b02901a5decec07fmr4843278pfq.47.1610463351971; 
 Tue, 12 Jan 2021 06:55:51 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:51 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Tue, 12 Jan 2021 22:55:24 +0800
Message-Id: <20210112145526.31095-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145526.31095-1-bmeng.cn@gmail.com>
References: <20210112145526.31095-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bu0r3R2qLlYH

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v5:
- round up the burst length to be multiple of 8

Changes in v4:
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 880939f595..b7456de065 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,20 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+        burst = ROUND_UP(burst, 8);
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length rounded up to %d; this may not work.\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.25.1

