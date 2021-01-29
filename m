Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1128106lfo;
        Fri, 29 Jan 2021 05:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9rTGx8MW4YgR4kS73O+qn3MIDowA/N0MnXXgsHg2rlbpGSjhddpwCno8wr4YQvKQD34Bu
X-Received: by 2002:a25:d2d4:: with SMTP id j203mr5835555ybg.132.1611927103387;
        Fri, 29 Jan 2021 05:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611927103; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRKcxTruOThwhOw/c5UB4Nd9FG3QJ9tQPkDlxuuR4syLZugNGyGdo+y3JM5dAx1uQU
         XciXpKcZlwuqvC+lNVJ4lVUn7agj/6EI9ytGurVw0HCwg6ET5hMiQUqjPmOgWTEfqfD5
         rYID+rKaxwqk+fOmtDevtNI/evySd04a6m3+we5BwLTrVuiJF93RDxWwvmG2bJoAjYoF
         3qo3Z5t2fpVURILm7Vd3maOWPYIDAi0byg6EPsAkf0ObZVvBKPhiGmn9jGuwOz2N8k0Y
         CQkdIyhakFG0B17QpG//UOWgljcINCSyR8SXYEM4jnIM2ZTM+MqKSsBVeSJlCMY+KANE
         Apxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LFsuI0BABtR2qo+SroCf7kUB6qpaMqblWl0znWx3WO8=;
        b=RTnKltS9D7e+jeohIiD8U93FeZlRzc78kEYwI46larnYN3McRRU/aQRgOXA1kfyUj8
         TYKHu6leTYdlcuAbBugD9IVP8kK26x327yYQZLE+ELc7jNkAdXJC9oP4c5Uwel6XwOEo
         LfztK4/wpKQEM/F/NEbWYVgIHT8RWwSh5dn3ACQd+sulPUuBncN9POg2UsYCZr5umDeJ
         kHImF16QjcnYbGz5vYBnGTvfY1orgWQJd9mPgV5h5lRLIgiluE7L1JhIhnHPP9nbc5Yj
         xa64tyslkqKTzw52iL9wtwWcqCjdxD7IAxeIuNXngHGfqhtyeATlWOHqI9BMsE8rEwMz
         aihA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KlXJxjm7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b92si9260960ybi.434.2021.01.29.05.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:31:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KlXJxjm7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5TsE-0000Xc-NY
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tla-0004vE-92; Fri, 29 Jan 2021 08:24:50 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5TlY-0008EE-Jo; Fri, 29 Jan 2021 08:24:50 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o63so6649561pgo.6;
 Fri, 29 Jan 2021 05:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFsuI0BABtR2qo+SroCf7kUB6qpaMqblWl0znWx3WO8=;
 b=KlXJxjm7esUMyRKo6adtW3JPyDDQb0UuMcWWb/KUNRlRNzaxQ10p0IM+Y6MaBZNjrZ
 Ic3e5wmhGrLVSv5BOhDW9z68GTYz3Ttdf//JEZnqSBXjxaMvUIN0u95V0eEwL8N+zZ+e
 huVJWOosgVOqExr6rY7XNnYeu+9u5ogZ8vZWuJSiDX0XqPVsr8jgB3PCK7nGWbwOvxeB
 G6Gr20976+FLPBVDZnUcdw403nD3UNH+GJ6CiX7aRDphPkLbdd9lEhxRPMZl8zz+zhs3
 eYXxVMfEL0X77wgRT3xOu2e3/EwS4BJ6hTiT/kxZYwhuPoUO6UvaswDCNr8pysy5UsZh
 mkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFsuI0BABtR2qo+SroCf7kUB6qpaMqblWl0znWx3WO8=;
 b=GzMJtvrKCY/vcjs3kntBVUU4mbnfee1WQWv5sq0fIbL+g2SKJnhiyavBNz/GcAnk9v
 mViuL9syCkECo+kcM4vGf7Z06VpgScBo18O3X2EdI6YqQCvwjD0PineROfgiqY+8oD9C
 JeskOIp/oFlMWBT/5QBmu5FmxUFVRg9DoeoJJPOSbvTfAsVB7mV/hDG1NaLE5aTbWmrZ
 1WggfcCuTsLnC6E7EuhOWc+9ryW2UyTtCQoRYeoick+CvG4um3fMwzfeEp5Gq4q17yyM
 6lsD+aPo2aTpyiw0o6x4ibwCreYUJZ3Ktzcgtu2nseeBQyrZg9sPaNIqdiBKmSaCyHcN
 OG0Q==
X-Gm-Message-State: AOAM530mTvOoeAMJ2bdGMY92mzbSeeUdw4zkyqs04upXhZJzseFu6Eke
 5ngWVD5KXrpjWGBw54NpSgMjOy9NgwGV7Q==
X-Received: by 2002:aa7:99db:0:b029:1ba:5263:63c4 with SMTP id
 v27-20020aa799db0000b02901ba526363c4mr4272972pfi.53.1611926687117; 
 Fri, 29 Jan 2021 05:24:47 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:24:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 08/10] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Fri, 29 Jan 2021 21:23:21 +0800
Message-Id: <20210129132323.30946-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129132323.30946-1-bmeng.cn@gmail.com>
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uj+n5uyqZT1h

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v9:
- Do the LOG_UNIMP when the unsupported burst length value is written,
  rather than where it is used.
- Squash the 2 LOG_UNIMP warnings down into one line

Changes in v5:
- round up the burst length to be multiple of 8

Changes in v4:
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2fb65498c3..41fe199c9f 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,14 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        burst = ROUND_UP(burst, 8);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
@@ -328,6 +335,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     IMXSPIState *s = opaque;
     uint32_t index = offset >> 2;
     uint32_t change_mask;
+    uint32_t burst;
 
     if (index >=  ECSPI_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
@@ -380,6 +388,13 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
+        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+        if (burst % 8) {
+            qemu_log_mask(LOG_UNIMP,
+                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
+                          TYPE_IMX_SPI, __func__, burst);
+        }
+
         if (!imx_spi_is_enabled(s)) {
             /* device is disabled, so this is a soft reset */
             imx_spi_soft_reset(s);
-- 
2.25.1

