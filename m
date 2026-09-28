Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BBEC98328
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:26:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3o6-0003S5-PN; Mon, 28 Sep 2026 01:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3o3-0003P6-W2
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:40 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3o1-0007o1-Au
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:21:39 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd025d07so2145296c88.2
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572895; x=1791177695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=73rQMz/FeeOV5ziS5/l0PWsSUPqi0F5RY6316YoaJz4=;
 b=XTRyUEZtJkkFGHJJWQxBZCEPMBo9W9naAdkz4onDQoaQkGPO7Yvf9XdOXCUHMx23f6
 hB53moVK1gZM2pj/QzUg8AbtZgfYSvKa3bi71BvqB2wJwKFbCrvLEFIZ5rXdJGfZZ24f
 i/EP9IKMUagKvO98DnTt+EmTxSNmVInB4dQJDJtA+i2kTa5YjVWcZP8CJFoLd2tgHOzs
 AJbTwH2N8MRkOByUdjhOxU6z1mnaE0b/DS1q9/A2Q7qFO2h8avuhj2YBab9t3SzYJxtG
 j19/OxK49KlDPSKPZBisZjCsslmO19a9shwjGBCZW/rcbPXDADgZ/cjSPNtg3UhLPdkL
 WgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572895; x=1791177695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=73rQMz/FeeOV5ziS5/l0PWsSUPqi0F5RY6316YoaJz4=;
 b=XPpGzTiVx0RkWiJZlJVXjVuUrwTpn0IqmpP3xkxwOBdJ9fcxiFdAYBsL0IA3++ZAFt
 oOxKGjpyK5emUR0j06/okF+uL4pUkBkrgBx0iql7//qDRcoZEVTyvPFe3jj7Dl25Vf4Q
 dtnp+RwcagXnYrKbDgV3NOpe5XLanCWN+55HcbpoTB+dJw8Ht+KBgTNlf4kQb6W8+x7d
 dPKlp8rjJhkHuU0cnX9CWBduzVHNr4jadmGjnul3rgjKgnR6UYzFtbuP1/2JAZUolnB3
 7gE1yvnDSjjhKBwBz+20+DCTJ/KcKb1QZFaL28kCr20Q44JmETuDUSSX/KB19Ddjub+1
 gVTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4uygYCopSp61y946A61odTTHby0vsHubBcuUhgsASKkTp2/R7sTL3dVXsn5kI2pBSrUdr9D8QfQ==@nongnu.org
X-Gm-Message-State: AFuF++mP8D2v/6lAU+b4SMShGn1f5NVZXdjr+Eb7CHnHt9zhiC7TlEuZ
 55xnbaW2dj/Y0W3z79WmnvMjD4HZOSNaQ0q6ItItP077JiYhAJkPOR+U
X-Gm-Gg: AYBFou0rA5vXENoIt3IQFLSL7K8WXDdM+0kG9Fxax5Wo1jLRXsf02ui8wYnbChYuEZW
 NYIjcIwlAk93QcdBmCwJDKAszRfN8GmchVNNjxsbGdk7L90TgLyUbacXCLHIFE2p/236i+typt/
 JCmtWm9122Rc6IcHDO/mIf4UHJp8ZydIdBiAwmQFm4kojf8s+lWiBf4NB9/0CRELGqLIupG+9br
 uVLGhTGjuceSx8Jr62bitbo12OCImvNaoSJ2VYdxjT/LA+btcSmssh1gZ2ID8UoJFTD8DwkaPq0
 fivmdX4nPoPiKBDXlOH0+WJM3ZnLpYTMvreZynSljX7wgdPxRc4Nld8tpCAD3q8pCCfHsPiim+x
 DD2sDY+8+c8dkp7BqHYsjrB9P8DO/NjNuBbYeow9woXBVshzjJEfcCxojenxsfKTNPCyU8FeJKW
 H5+vLgvsWhEv0QPXV94T6nq/B6lv28obeg8bE+rF6WS3BQtG0e/Dry5L9RzQKTDzXpKpZQwrEk4
 FG4jA/4SeqRJ3y6Hrpdxq9omaBicTQ=
X-Received: by 2002:a05:7022:f515:b0:143:26cf:8615 with SMTP id
 a92af1059eb24-146cfec8423mr8557002c88.25.1790572894929; 
 Sun, 27 Sep 2026 22:21:34 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:34 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 04/24] target/rx: name guest trap numbers RX_EXCP_*
Date: Mon, 28 Sep 2026 13:20:30 +0800
Message-ID: <20260928052051.251-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
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

Add RX_EXCP_* in cpu.h for the guest trap numbers stored in
cs->exception_index.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/rx/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 64ba48a7329..521e494172e 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -71,6 +71,16 @@ enum {
     NUM_REGS = 16,
 };
 
+/* Guest trap numbers. */
+enum {
+    RX_EXCP_PRIVILEGE_VIOLATION = 20,
+    RX_EXCP_ACCESS = 21,
+    RX_EXCP_ILLEGAL_INSTRUCTION = 23,
+    RX_EXCP_FPU = 25,
+    RX_EXCP_NMI = 30,
+    RX_EXCP_INT = 0x100,
+};
+
 typedef struct CPUArchState {
     /* CPU registers */
     uint32_t regs[NUM_REGS];    /* general registers */
-- 
2.52.0.windows.1


