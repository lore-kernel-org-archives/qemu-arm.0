Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2917938njb;
        Tue, 18 Mar 2025 06:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWBeJHUU0aGUhRtID2pII3IsI08XuT8Wz1ycF2cjRGqAudvx9yArbofp4ty5+EaQ/6DB0fmw6Xx4LFsA==@linaro.org
X-Google-Smtp-Source: AGHT+IE5EVWkAY88n5p2iYyAqVkxnm3pBgrSMAMifj8chn+zR/Ed0eylPoZQI/YS2odHP17Il1Ah
X-Received: by 2002:a05:6102:304c:b0:4c1:749b:2c27 with SMTP id ada2fe7eead31-4c38316daf5mr10150274137.14.1742303729038;
        Tue, 18 Mar 2025 06:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742303729; cv=none;
        d=google.com; s=arc-20240605;
        b=NoI65n+QQdKS0l3DE1sHDkGvJE8mVucE57fJEphE08Lfbf+KCX8qpchYN1yVCodXFM
         JLjldHz7hqsUImzcynXWdaEjymzUSQhxgpDmn6biJ0IxJxAJQuAM8seJafC/MjDWrAgv
         6zsS9H1df8EXfz6cjC8pSVdUvWmtAfjVOtpWd1SiK3QZj9TCldNAJskBHQmEsv8cnS/R
         D5CfFTL9QL6QB7JJ3jVRBsVuuwX34HMYAmPDlb9fRdSfhoAb08K+TmUH29DRwb/aL4fL
         Bv0IVGb9UuYA4Dtz+P7Jtclc1W1V1XPs9BLJhhyNZEKdgQpYqkSjqIC7wj9aRxoVsu25
         LhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oN7dAT9g7/fjnpZ+M8hoExjMTodoQm0LPLrEZ/BgbuM=;
        fh=TUT+2OkUhULaozVCCaThJugm8Q4ZyM3737XCW5Nc+Fg=;
        b=Hc2eLmb9Zr2a4p5YqGQ14hsLepdhs/ajKKLauvCUku4eI0BcFVB4HYtaQBdRafo4jG
         DagmynsTObmPmTptsWOXfYvBKemoKlXm5BmPSxCkgXgO1jvM6XfeK+Tg/vDLT33Bc4pv
         7eDniDbApTtzNCKbul/gC78V7UL5cwZCj1Nps2u0TE/pgvSvR9IQTWFKTIlx2H00tuOb
         HgvwakQjFxei3ItoPitzoQ5Wj3FAKeK9mzWNDI8vJzrgrWQqlSUiAKrjbTud90sw5HVL
         i61VkLgSreorD0GZ/ShzOeiaXImhhXKj0H6WHXBl7MmGifS0bVcJLQRH6cr++lefj/Jn
         fLQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Jn/s4hDt";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374ac9e27si3460766137.447.2025.03.18.06.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 06:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="Jn/s4hDt";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuWlh-0004o8-8j; Tue, 18 Mar 2025 09:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWiz-0002GK-99; Tue, 18 Mar 2025 09:11:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWit-0003n2-Uj; Tue, 18 Mar 2025 09:11:14 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac25520a289so979857566b.3; 
 Tue, 18 Mar 2025 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303470; x=1742908270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN7dAT9g7/fjnpZ+M8hoExjMTodoQm0LPLrEZ/BgbuM=;
 b=Jn/s4hDtZWndGif2mN8saYn51ToCIx10DQVmiqhasVlWbltrpBhkP9JS+QsAa76rwB
 pf/hNodQ63h876fmtGaJWuxWk+/EO0BNeeX+2ctyvlnEeytE7sTDgsg+bskg/PcToUnr
 H4S4LaCO2MCV1ztpS5sKals2ozadYfG3sZEAZmfUDt/IAOyYh9ABFt2u8szps5XD5xoF
 QytvdUL+NDOYxDHSvTxxkTY2zVFvtmFDLxu/K+Fer/DtVQU3cmQtpDO8jrgmP+Cbc2X+
 gpyTW2TZKtlpdnDhB5eS+I+daKlvQKFIHhMG0qr88eNTVGpRhp9YmQxc5hkAjjPo8Tyx
 yHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303470; x=1742908270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oN7dAT9g7/fjnpZ+M8hoExjMTodoQm0LPLrEZ/BgbuM=;
 b=GHCNkScFLEdhJnwxQ5i1bV9KCfWkwMtt6HgS5VvoQxbFMh2ZZTpb55zHKo2gHvXXwP
 d3qGUPqVU9r/ixDlalcesBskNtah/KLJsVvPMWGZ1KON/QoqyKm9ZTXUAuEVddc0n25w
 Zx/k27K+2I2brYRetVgadM0jVIHHwI2TRTzwzzJnMae4nva0Eod3lmp58iGiHNPKnn6d
 kTzxRA1OJfBdwlxNb100+VU2/RVfhGG5ADScYNqS7N9umAnihcYzqe0kiVSPEJ474EkW
 H6zUZ4rlZidTwtchjJreiqmROROVfFo+cfOCit3vKfk0eo+Xc1jQ4TuGSBc/dEw4euLs
 U29g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdOhmKmDezOVu9JdyTfcOjCkKV7BaNpy0Hg4hiu9JTNFQbkOPk6WjhJcs0Br6eTynjQhbxrPDuIA==@nongnu.org
X-Gm-Message-State: AOJu0YzGdEAzyUb1zrtcW9LxURhA/PZYnuZR/QA99GXamyRaTvwdOmxY
 51uU6EDZkfVJQPg4r/P+sUFhwP506Q9kK54xb4OYm4WVDacW7cJ0mX4KI1Vo
X-Gm-Gg: ASbGncuBJpwFZZ3PpRraMTF7KF9wSQanfmtlj1qrRhQaMg5WqCnwtxiyp0lOHDB6dF3
 77BkpiEbs4V7LcaGroX8D6Z7MwOmHi7HfeaFIKIf7hBvyEHOFxBkLQJAImGfMvsLceIU8CtpoCD
 fiSx8vG3U6VASQL+UElXvnObec15uDm/xfn0ft22IH8dsDIiY80N1CwWCuAVX9KKH6uybCyQm2l
 JGJpxAWcoOT3mBY8N6kjwz6ChQiLtUz7bgG0fL+l9dcexn3fmAEE4bi9uUOAcHI2m26ltw1WjRT
 mi9qCJ4Llfnq5EcQ0/Ox9P3jN3F/RNkOoTX/93Gc6rVU1Iq+W59rJ77J1QDjHdmtjaE=
X-Received: by 2002:a17:906:c10d:b0:ac2:cae8:e153 with SMTP id
 a640c23a62f3a-ac3301dd86bmr1955854366b.4.1742303457867; 
 Tue, 18 Mar 2025 06:10:57 -0700 (PDT)
Received: from corvink-nb.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f3101sm850678066b.69.2025.03.18.06.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:10:57 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>, YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH 10/21] hw/misc/zynq_slcr: Add logic for DCI configuration
Date: Tue, 18 Mar 2025 14:08:01 +0100
Message-ID: <20250318130817.119636-11-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318130817.119636-1-corvin.koehne@gmail.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /WIig+WX5bJm

From: YannickV <Y.Vossen@beckhoff.com>

The registers for the digitally controlled impedance (DCI) clock are
part of the system level control registers (SLCR). The DONE bit in
the status register indicates a successfull DCI calibration. An
description of the calibration process can be found here:
https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/DDR-IOB-Impedance-Calibration

The DCI control register and status register have been added. As soon
as the ENABLE and RESET bit are set, the RESET bit has also been toggled
to 0 before and the UPDATE_CONTROL is not set, the DONE bit in the status
register is set. If these bits change the DONE bit is reset. Note that the
option bits are not taken into consideration.

Signed-off-by: Yannick Voßen <y.vossen@beckhoff.com>
---
 hw/misc/zynq_slcr.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 9b3220f354..10ef8ecee8 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -181,6 +181,12 @@ REG32(GPIOB_CFG_HSTL, 0xb14)
 REG32(GPIOB_DRVR_BIAS_CTRL, 0xb18)
 
 REG32(DDRIOB, 0xb40)
+REG32(DDRIOB_DCI_CTRL, 0xb70)
+    FIELD(DDRIOB_DCI_CTRL, RESET, 0, 1)
+    FIELD(DDRIOB_DCI_CTRL, ENABLE, 1, 1)
+    FIELD(DDRIOB_DCI_CTRL, UPDATE_CONTROL, 20, 1)
+REG32(DDRIOB_DCI_STATUS, 0xb74)
+    FIELD(DDRIOB_DCI_STATUS, DONE, 13, 1)
 #define DDRIOB_LENGTH 14
 
 #define ZYNQ_SLCR_MMIO_SIZE     0x1000
@@ -194,6 +200,8 @@ struct ZynqSLCRState {
 
     MemoryRegion iomem;
 
+    bool ddriob_dci_ctrl_reset_toggled;
+
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
 
     Clock *ps_clk;
@@ -332,6 +340,8 @@ static void zynq_slcr_reset_init(Object *obj, ResetType type)
 
     DB_PRINT("RESET\n");
 
+    s->ddriob_dci_ctrl_reset_toggled = false;
+
     s->regs[R_LOCKSTA] = 1;
     /* 0x100 - 0x11C */
     s->regs[R_ARM_PLL_CTRL]   = 0x0001A008;
@@ -419,6 +429,8 @@ static void zynq_slcr_reset_init(Object *obj, ResetType type)
     s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
                           = 0x00000e00;
     s->regs[R_DDRIOB + 12] = 0x00000021;
+
+    s->regs[R_DDRIOB_DCI_CTRL] = 0x00000020;
 }
 
 static void zynq_slcr_reset_hold(Object *obj, ResetType type)
@@ -555,6 +567,25 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
                 (int)offset, (unsigned)val & 0xFFFF);
         }
         return;
+
+    case R_DDRIOB_DCI_CTRL:
+        if (!FIELD_EX32(val, DDRIOB_DCI_CTRL, RESET) && 
+            FIELD_EX32(s->regs[R_DDRIOB_DCI_CTRL], DDRIOB_DCI_CTRL, RESET)) {
+
+            s->ddriob_dci_ctrl_reset_toggled = true;
+            DB_PRINT("DDRIOB DCI CTRL RESET was toggled\n");
+        }
+
+        if (FIELD_EX32(val, DDRIOB_DCI_CTRL, ENABLE) &&
+            FIELD_EX32(val, DDRIOB_DCI_CTRL, RESET) &&
+            !FIELD_EX32(val, DDRIOB_DCI_CTRL, UPDATE_CONTROL) &&
+            s->ddriob_dci_ctrl_reset_toggled) {
+
+            s->regs[R_DDRIOB_DCI_STATUS] |= R_DDRIOB_DCI_STATUS_DONE_MASK;
+        } else {
+            s->regs[R_DDRIOB_DCI_STATUS] &= ~R_DDRIOB_DCI_STATUS_DONE_MASK;
+        }
+        break;
     }
 
     if (s->regs[R_LOCKSTA]) {
-- 
2.49.0

