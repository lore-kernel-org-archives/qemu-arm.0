Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9839606A321
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Nov 2026 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=MTNPgQHu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQsW0-0003i9-Cq; Tue, 10 Nov 2026 15:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xQqKO-0004Ki-UV
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 13:12:21 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xQqKJ-0001BY-Bu
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 13:12:14 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-717080a2d50so1654015eaf.0
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1794334329; x=1794939129; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2lz6ftAxs01+ACSsm7X1ZjSLeJAPTBgkfGH2sQxS7JU=;
 b=MTNPgQHuW+AoPs2+N7wi6yAb6ttgMX0+GDulCCMGeAomaP7OrRyWw2gLhIVD2Gn0l3
 oDiS4XAerDZ8NhJFRkR4SAqa+5ufwkYOthP2zCxSYBhTu8vwNP/RcGLFrNFqV1pYN/nC
 zpEIx/uEmW/bUKA3iXD1T9gdcjgUBFY51FS4TGJkqaAXZecGXgjpMurOiqAH3q7fO15x
 wuHigiT/vUo0/wPUzV1HtMysMczZFBlOs+KZhgg0pxWCJBO/HexJb+MbnvbVBuE3Vaxl
 Z+MHvMOpSOUBOVd4g3hnveNJ7EFf1FJ6HqR80bN7pnnM7KZVki5TeyUbGtQSAIZlxtYz
 WJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794334329; x=1794939129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2lz6ftAxs01+ACSsm7X1ZjSLeJAPTBgkfGH2sQxS7JU=;
 b=j/zLKMc+toqurU80fWIPr1D/AZ9byw28saUD/c66TkHl9xMyWtSwf8CZIXvMI/vIRP
 LtrJc+Jg6QRHG5YakWwxozmBtOgztHopfLToWjQb/lq9bWx8TzlsVQrXTO7ylxuFaVpP
 mj84oVFN5EjOhhNd6PHvn4yKyZiQZceV0TW4BQ5qmwu1iC8KBstWaaMAQbXn/D2WIVz2
 kHb2sCE5n8+Dm7heLQdTNv6IG9vCg/IaDdKReuIZX0dqQGZ2JLbs/0Uyt5X3Omun6is0
 iOpGhx+h9RZK/SWjPZDu2Ri5p6BX4r2K7s/KcvPTFn2jO4dyucF9pmtoOU0gFVhX+QW9
 74rg==
X-Forwarded-Encrypted: i=1;
 AL+hErHeDfOc4SqNHrkW3s48p+1HHcOC52N+BLIGgReb7OcpQv1kGJmBNcfQ1wUHNYPpD+Udn4q+Mfadjw==@nongnu.org
X-Gm-Message-State: APuU4Z9ZcJKe1D9mgzywrBAU2c8mvMmnezJzm8EF5yoVNcb2mrw5+A3P
 fe1vygY5WdDfLLXrirUh0pnTd9XkmKfr41aR2bf1TRLRwmJa8eUkdljDzIKFrdRfcX4=
X-Gm-Gg: AYBFou1vTiQ9jrZ39zL+zfLusPgFCknbO5t1fhtUAa1ikOUPzYiTY6rFRgzM1tRAYkW
 RvpDua6/XPtD/MjoJ53dUxJ5WEZ9XFeWZfpM6vJi2NxosB/8VbafgclzwJG94OLcXeMBxx2VHKN
 KwHe6clt8VLXIbih/8P1+RW0qBW/JPCHZhNXGNPYh6erfI5hCnwfXJHLUFLyjW/aJQ9yEK24oml
 W3mZbpodSwvMIP2d4gwzW8gD35UdD2U5/9bUNUcqQTMd8fuI38J4nGWHpz7DtkJIqfx+WHB5phQ
 tEwVCUZg8QQ7rJBT2YEdk+1eUB8anqPJt67wCP9Ynle7DNMJgHWBjzkz3q7cXhilatSmxnGg/0J
 Nqc9l42zIjn6JafGI9XoSM7I78+BcfGywa6AsyBqBujETYHYgEyWK1e0uDhESxoFRn3fe3d5PeP
 AJ7mNfvUd+jvIbjjfiZbmXRudYQbEDid/dRe+SWbLO5i1fWU5vOgweAdklWyQf7ShB6VtJcWiRY
 V6DbDFxwgCsV+4xvdSXh+zNvSCxpzV4mAOna0/8ZHdOWBTlHSGWf5gFTs4dg6Gboi2bXkBUfULH
 vw43QwldD60QE9IteP8U+6xjOWQrMu6ksY1qgQgj+ctHUVZ8B5OUHV5ZBjh+Afx3hdyVxmFZGHn
 dKrc=
X-Received: by 2002:a05:6820:628:b0:715:1e5a:dc95 with SMTP id
 006d021491bc7-7189e63d743mr1693528eaf.0.1794334329314; 
 Tue, 10 Nov 2026 10:12:09 -0800 (PST)
Received: from [10.200.24.109] ([12.55.13.134])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-718aa034ad2sm2063514eaf.13.2026.11.10.10.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 10:12:08 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 10 Nov 2026 12:11:48 -0600
Subject: [PATCH 1/2] test/qtest/aspeed_smc-test: Send write enable before
 each page program command
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-m25p80_write_enable_fix-v1-1-3a2abc0072b0@oss.tenstorrent.com>
References: <20261110-m25p80_write_enable_fix-v1-0-3a2abc0072b0@oss.tenstorrent.com>
In-Reply-To: <20261110-m25p80_write_enable_fix-v1-0-3a2abc0072b0@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Nov 2026 15:32:21 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M25P80 specification [1] dictates that a write enable (WREN) must
be sent before a page program (PP), and that the write enable latch
(WEL) is reset at some point before the PP command has finished.

The current tests that make use of page program send WREN only once at
the beginning, before issuing multiple PP commands. The m25p80
implementation in QEMU doesn't deassert WEL at the end of each PP
operation (so this isn't an issue currently), but real hardware would
unset WEL at the end of the first PP command the second PP command would
fail. Update the tests to send WREN before each PP command.

The current m25p80 model does not reset the WEL at the end of each PP
command. This is a bug, and a subsequent commit will fix this.

[1] https://www.alldatasheet.com/datasheet-pdf/download/22807/STMICROELECTRONICS/M25P80.html

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 tests/qtest/aspeed-smc-utils.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/aspeed-smc-utils.c b/tests/qtest/aspeed-smc-utils.c
index 146332240d..85e883d0b8 100644
--- a/tests/qtest/aspeed-smc-utils.c
+++ b/tests/qtest/aspeed-smc-utils.c
@@ -218,12 +218,23 @@ static void read_page_mem(const AspeedSMCTestData *data, uint32_t addr,
 typedef void (*read_page_mem_fn)(const AspeedSMCTestData *data,
                                  uint32_t addr, uint32_t *page);
 
+static void flash_write_enable(const AspeedSMCTestData *data)
+{
+    spi_ctrl_start_user(data);
+    flash_writeb(data, 0, WREN);
+    spi_ctrl_stop_user(data);
+}
+
 static void write_page_mem(const AspeedSMCTestData *data, uint32_t addr,
                            uint32_t write_value)
 {
-    spi_ctrl_setmode(data, CTRL_WRITEMODE, PP);
-
     for (int i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        /* Send write enable before each Page Program */
+        flash_write_enable(data);
+
+        /* move out USER mode to use direct writes to the AHB bus */
+        spi_ctrl_setmode(data, CTRL_WRITEMODE, PP);
+
         flash_writel(data, addr + i * 4, write_value);
     }
 }
@@ -468,10 +479,13 @@ void aspeed_smc_test_write_page_mem(const void *data)
     flash_writeb(test_data, 0, WREN);
     spi_ctrl_stop_user(test_data);
 
-    /* move out USER mode to use direct writes to the AHB bus */
-    spi_ctrl_setmode(test_data, CTRL_WRITEMODE, PP);
-
     for (i = 0; i < FLASH_PAGE_SIZE / 4; i++) {
+        /* Send write enable before each Page Program */
+        flash_write_enable(test_data);
+
+        /* move out USER mode to use direct writes to the AHB bus */
+        spi_ctrl_setmode(test_data, CTRL_WRITEMODE, PP);
+
         flash_writel(test_data, my_page_addr + i * 4,
                make_be32(my_page_addr + i * 4));
     }

-- 
2.43.0


