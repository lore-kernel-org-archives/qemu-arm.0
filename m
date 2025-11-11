Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC167CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIlcl-0008Tc-GZ; Tue, 11 Nov 2025 05:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcO-0007lC-6B
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:56 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcH-0000I4-Ll
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:55 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b728a43e410so857907866b.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762856927; x=1763461727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ma7NM/EMUNjVg7q3k/Bpes+XFemvPD5AxIlXcPcgP2Y=;
 b=BMQlS3eGrjT4eJv8QTgjgm4N8uoSAoZ4TgP0qfAbv/VnVlCsRJ70mdM+Jt54h+vWWu
 DxmH1NxnM7pl5T00NMd4bwi1Y58s30WedoPU+yh1liAmQHPi7IaiQrbcwSOby2+dI57g
 wyTR/CCirc0FGRfbH8BEzNTh5ingMU+3Aj174eyVeX04wAPHgzj7I3oPRqh3R3iDbf5q
 1sEeA2fXN9SxVuOj2CDo+gk7aAIXeWYGdm+MeIEG1f9Zh25V/kF36rZhhhcvQm+C9Edj
 fViBYrcdA6nGji9Qb858XLAR8/teDdfxeJqBmYvYSpATHmK9MUrOg8unensn1hUFN7t+
 oD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762856927; x=1763461727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ma7NM/EMUNjVg7q3k/Bpes+XFemvPD5AxIlXcPcgP2Y=;
 b=vmD07wxMznTHkwf6e9H1y5VACYxOG0ARekiSxsrleGF2YWybdzvf2svvgLu5x+q9yZ
 BRM+/rprZ1LE5EA+2unaYh/Qf2oKBxZsxJ1IwxWPuUuyiJnWswhZZSzACZty0+iYY/zj
 Flnq39NY8ekU+2xUyPcIxHWE9tUb1s2+9gSSJ4G8qpL6uu2QG3ReRfv6l9ovPF5YwGRz
 WmU+qD4fXCBPxmxDqfUTgjH0Ol6Jfhuc0AKn4eNTtZLpw4eTLYi7Wt9slSgiUbGkAn9Z
 uZ88wUgx1R0N+X/mE47ZfWJglrYVuOcw/6b01w1ptB6SLUKKAbMGd6EzOlwL3d3fw08F
 Bs7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLIzO+lycMCg46/u47q1iphHsp3ydYPAadVT4Xvi6o4OT8XZISFGtlNZalKTtKgmIdTvdJat6RaQ==@nongnu.org
X-Gm-Message-State: AOJu0YzcSalaMxE+XATfY485+4f+Zxwa5nsdsbWuTEndE83yCS+sqmd9
 f62xzNW8epb3KaCUqtzRKOiBtd/gVJ6zlPzLJ5mEsg+c40AEVL2IAkOJ
X-Gm-Gg: ASbGncs+57qEwwRn9gJYG+hUGeCQkFRpoGtLTl5YbiTGFFvpzBGuJKl1siCOZGrNcwj
 r6hZGDn5csjKiRnOpQxKTdVCrlqlVThnDWxeKQHBcPKBqumH0YSZZph5j+gRGTSh66zvwenpuSi
 G+iEs1UwDllN1nmpxImNuhB7CqqeC2WI/oELlAczW5pch55tBNMVlQ09/rSbYHrObyKUULkDNLo
 mTSE+E58uBebsf1aDnjmajiq5DydFAz17OftntbEwjEfNzmgOseJgLUtsL0TMhokVapXdiiZ1/g
 g2ooXy669VTju6gaUWXrWKBO8LUo9sPCO+Ty4fcVm2mPJ6wDu6eGIDshOZCTpTmPOS4BvVykKCs
 XY4XoRXz062z8aZAaZOrHE73wwpuZIWM1uulnxmwKH3rSTvGVcWxqCd4mEiAab9OCDjl1MI3Nre
 aXt/hlFvgYq6gtRQkBoRU8Eg==
X-Google-Smtp-Source: AGHT+IG+7Go24+fJW3LJ9vVG3Gt+USa9fd+svrObP8SRVTu5gTVO0hL+MPzdSiNQmX0vn46emjNaow==
X-Received: by 2002:a17:906:d554:b0:b3d:73e1:d809 with SMTP id
 a640c23a62f3a-b72e05e7b30mr1405730066b.48.1762856927038; 
 Tue, 11 Nov 2025 02:28:47 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc12:ce00:ae91:a1ff:fe8b:15a7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbd1ecfsm1290619366b.10.2025.11.11.02.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:28:46 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v4 10/15] hw/misc/zynq_slcr: Add logic for DCI configuration
Date: Tue, 11 Nov 2025 11:28:31 +0100
Message-ID: <20251111102836.212535-11-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111102836.212535-1-corvin.koehne@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

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

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/misc/zynq_slcr.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index a766bab182..d7a2994f47 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -180,6 +180,12 @@ REG32(GPIOB_CFG_HSTL, 0xb14)
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
@@ -193,6 +199,8 @@ struct ZynqSLCRState {
 
     MemoryRegion iomem;
 
+    bool ddriob_dci_ctrl_reset_toggled;
+
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
 
     Clock *ps_clk;
@@ -331,6 +339,8 @@ static void zynq_slcr_reset_init(Object *obj, ResetType type)
 
     DB_PRINT("RESET\n");
 
+    s->ddriob_dci_ctrl_reset_toggled = false;
+
     s->regs[R_LOCKSTA] = 1;
     /* 0x100 - 0x11C */
     s->regs[R_ARM_PLL_CTRL]   = 0x0001A008;
@@ -418,6 +428,8 @@ static void zynq_slcr_reset_init(Object *obj, ResetType type)
     s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
                           = 0x00000e00;
     s->regs[R_DDRIOB + 12] = 0x00000021;
+
+    s->regs[R_DDRIOB_DCI_CTRL] = 0x00000020;
 }
 
 static void zynq_slcr_reset_hold(Object *obj, ResetType type)
@@ -554,6 +566,25 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
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
2.47.3


