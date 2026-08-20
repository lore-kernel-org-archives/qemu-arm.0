Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6333CC5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 12:50:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx2CF-0004po-CL; Thu, 20 Aug 2026 08:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wx2CD-0004oz-Uf
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 08:48:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wafgo01@gmail.com>) id 1wx2CB-0001XW-L0
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 08:48:37 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-69c600f76ccso3523680a12.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787230114; x=1787834914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Idw9rgWpS0z04uaIxLKCNV6ZlQedqrM2GGXm8qrK/To=;
 b=oDObeVSwIBUqLBPliwG7b26ypfMWbSb+KbTNjnmS/KJP+IZv1tqXbSqE6nnZcuprjF
 zbK1IGC2YatSTgGpT6EEH1QahYwam26GjyqtmqMVz83vR8dfG7s48nqcbyEF/ZFXFfsK
 urhFiCv2850Y3VB86ipGlI4Po7y9nznIflwlye5vZ3fPQT8zA+8GCE1M5WZeqxSPUD2s
 xj0e/LI5vx3oUS/5I4teYmtGSbgVhfXRKKR8GwdTbrE/AYpdHQRfSHowNOkGnsd5n6Fs
 BUYIIbPk2z9MalNhRkyfHeuh5Er/ljPvmmrViUyZnzetEJJXWelbHJme1rbDF7Zp7r37
 2Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787230114; x=1787834914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Idw9rgWpS0z04uaIxLKCNV6ZlQedqrM2GGXm8qrK/To=;
 b=cmF4jjyYP6AKNGekuW2aKD18BfSEd6SWPLeywudRPHUiJQQV580xETUoHmueR0b7t/
 YTta0tDKWYA0WPCNl/Gs5e5iJ5u5bCivmmyS7Hw3fN0scnjOwzuSDDcAMqucU2YubG6v
 nsgx+bfLX0jL+GAUOaSb3w8i5zA3wyUqXP4Uzap9yJccwTgts07VvqXPykv5ZzKCDam7
 Lj06XMvnDW1T9J6M3DPONpyQWKzeIEdsR3v1FwFNLh9njMCaJVjrrZPx/Bm4kEFBhL3k
 27EUzDtF12hik9QsuE6FyDjNIGjQwT/ssgM+Tu0YUy58ZYrYsdfzz4mxZzeU5MF0dCvW
 64oQ==
X-Gm-Message-State: AFuF++kZIGRTjMZ4Q6SMu31tI7sTpoDEmVpnBptjZhLDSz/6Jwma10p0
 Bv0TonSxHqqQ8kONB6XcnBMm2Ino2yNbBPi/DnuJKrNLjFOZhOJouTXN
X-Gm-Gg: AR+sD12KU3cuGtX4dfmu9GCQcRiMjlXIITjSzGl4nGURDqU4BQMykWRC/cFBPjAYg6O
 w9w0ou4f7rs15fQ4Z+g/DLmfztih7PDfLdiHKKt5lF0SvWKr8vP4/hgDZ5jfmu/DO750LeHdTe5
 kET/PKjtxW4reyKA0pVIJ9phHleSaeotTt5u8B0Gvi0cgBTaaTv4suIdsHYSEiIVXwT5UR8bC2Q
 NEGIiDOYvN+kDAbid2r68LFdgqvzhyfqE9LPrgvcPCQHBjJwBfx8ko4RhYkq4RJfjpw5+/UzzU+
 UPkjByOka4M8Mo5nkmprwUxCt7VMxGub5hAl1sVPFpA6Vf7/rgCcYULnwiuYtRoxIcmrjE+wDEA
 h/cq36Vn2fCmQX/SJzbj53EqKnYjr22SkrT2Wmi4pDrO1KE4DO8q5Q9aFMI4/wO36J0Js17rZzf
 Ne46cugkiXz9tU+jlMm7s23xUjVQFMke3IWkAQjcji2VUIAvtAOHXwuw23v9BS68q9fe1Oajmh0
 K8oMDD9KeE=
X-Received: by 2002:a05:6402:2b96:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a4032ed4f4mr8765309a12.11.1787230113991; 
 Thu, 20 Aug 2026 05:48:33 -0700 (PDT)
Received: from DE-PF5B95TD.embedded.cmblu.dev ([87.129.199.250])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff1563c5sm2270449a12.14.2026.08.20.05.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 05:48:33 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Wadim Mueller <wafgo01@gmail.com>
Subject: [RFC PATCH v2 03/14] hw/sd/sdhci: complete non-interrupt ADMA
 descriptor chains in one pass
Date: Thu, 20 Aug 2026 14:48:03 +0200
Message-ID: <20260820124824.618671-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820124824.618671-1-wafgo01@gmail.com>
References: <20260820124824.618671-1-wafgo01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=wafgo01@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

sdhci_do_adma() returns to the main loop after every descriptor and relies
on a timer re-entry to pick up the next one. For a descriptor chain whose
entries do not request an interrupt this makes the transfer rate depend
from the virtual clock rather than on the guest's programming, which
significantly slows down large transfers and makes guest-visible timing
depend on host timer behaviour.

Keep processing the chain in the same invocation while no descriptor asks
for an interrupt and the transfer has not finished, and only fall back to
the deferred path when the guest actually requested a notification.

A qtest reproducer is added later in this series.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
This patch can be dropped once Bin Meng's SDHCI series
https://patchwork.ozlabs.org/project/qemu-devel/list/?series=515264
(which needs series=513930 applied first) is merged - it covers the
same AM64x failure, see
https://lore.kernel.org/qemu-devel/20260810124519.34501-1-wafgo01@gmail.com/
It is included here only so that the series works on actual master.

 hw/sd/sdhci-internal.h |  9 +++++++++
 hw/sd/sdhci.c          | 23 +++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 4aeed120bf..e6ce12617e 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -277,6 +277,15 @@ FIELD(SDHC_MAXCURR, V18_VDD2,         32, 8); /* since v4.20 */
 #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
 #define SDHC_TRANSFER_DELAY             100
 #define SDHC_ADMA_DESCS_PER_DELAY       5
+/*
+ * Upper bound on ADMA2 descriptors handled in a single sdhci_do_adma()
+ * call, as a safety valve against a malformed or circular descriptor
+ * list. A well-formed transfer terminates far below this via END or
+ * blkcnt == 0 (even a 4 GiB transfer built from 64 KiB TRAN descriptors
+ * is only ~64K descriptors); the bound merely guarantees the loop makes
+ * a decision instead of spinning forever.
+ */
+#define SDHC_ADMA_MAX_DESCRIPTORS       (1 << 20)
 #define SDHC_CMD_RESPONSE               (3 << 0)
 
 enum {
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e58a610397..9a5dd1d93f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -780,7 +780,6 @@ static void sdhci_do_adma(SDHCIState *s)
     const MemTxAttrs attrs = { .memory = true };
     ADMADescr dscr = {};
     MemTxResult res = MEMTX_ERROR;
-    int i;
 
     if (s->trnmod & SDHC_TRNS_BLK_CNT_EN && !s->blkcnt) {
         /* Stop Multiple Transfer */
@@ -788,7 +787,27 @@ static void sdhci_do_adma(SDHCIState *s)
         return;
     }
 
-    for (i = 0; i < SDHC_ADMA_DESCS_PER_DELAY; ++i) {
+    /*
+     * Process the descriptor chain to completion (END or blkcnt == 0),
+     * yielding to the guest only for a descriptor carrying the INT
+     * attribute (a DMA-boundary interrupt, handled at the end of the loop).
+     *
+     * Historically at most SDHC_ADMA_DESCS_PER_DELAY descriptors were
+     * handled per call before rescheduling SDHC_TRANSFER_DELAY ns later on
+     * QEMU_CLOCK_VIRTUAL. That pacing is only needed so a guest can observe
+     * the intermediate DMA-interrupt state; a bulk transfer that requests
+     * no interrupt does not need slicing, and throttling it across many
+     * virtual-clock round-trips can make it race a guest-side transfer
+     * timeout. Run such chains to completion in one call instead.
+     *
+     * SDHC_ADMA_MAX_DESCRIPTORS bounds the loop so a malformed or circular
+     * chain cannot spin here forever; on overflow, break to the reschedule
+     * path so the main loop stays responsive.
+     */
+    for (unsigned int adma_descs = 0; ; adma_descs++) {
+        if (adma_descs >= SDHC_ADMA_MAX_DESCRIPTORS) {
+            break;
+        }
         s->admaerr &= ~SDHC_ADMAERR_LENGTH_MISMATCH;
 
         get_adma_description(s, &dscr);
-- 
2.43.0


