Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668C606A33C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Yh0mz9zV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVVv5-0003pe-As; Mon, 23 Nov 2026 10:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVrQ-0001Tl-Es
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:21:45 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVrN-0003do-D2
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:21:40 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-67db6d4054eso3784875d50.1
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795447296; x=1796052096; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zjDSjVSaQv5onZy9G9AdiSofPPT37pH5ZbfoqbnGSeA=;
 b=Yh0mz9zVshrxNnmSTfvp/ANND5sU2bgsACqGyHkzgWo4UuE62eGE1cQ7pjDocP8Atx
 yAdhV6CP9DHmEaCtT/612+tmjwJayYt05tK8K9l3HBeazZr0ACIwtZK8AjmOjF7+VRk5
 rRW4mv0e5jjwKBEPKKZubZ4Kt1w1NRVZ4c26IXSovBL2GzsCXVdCqbZr4bBt+5NsquvQ
 B2QwrZbnLZnH/ri0eI0KguiRi/nhe297Z/XqaenwszTllhn1OvKSeZKtbZojWXLBnbbR
 7oeQxXStduAHFNXU/vlLCnZgLn/mTJZZVHq9u4++BuVvupajG1GOibCth60zph/g4HNz
 d1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795447296; x=1796052096;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zjDSjVSaQv5onZy9G9AdiSofPPT37pH5ZbfoqbnGSeA=;
 b=aM/2gwtrd/9hlGFnd5dIyWVukt2zWzVK+WctTaG9DCi20n4i/gjyaoQ8n2Qysq3vRm
 nUqZHHSEjTvt8UfarR8D5wyK5AWi1weWnZAw+i/prmGxiINzCd2T1sHEFcjQkoIWeco9
 jdMVQBeP9aC747Rl7/dSOajaW9qKjP/cWAUK7ICkpW085aWVyAQBx8ym431yRhkBCwUU
 PlxQ9E6JLKs4pxw8yIWnP6hNI9fmuSw5XbclnDw+0j8yWkr8QBZQuCP8/KODPKfglHns
 1o/2HtW0KtZdAjmWsQv29Gzm3l277AISsB4SqgxEt85hyU4SqgVBCD3imHKr4J0GHPyP
 nt6g==
X-Forwarded-Encrypted: i=1;
 AL+hErG+y0XVfNOxN8av6amCXAZn/RokldnSHtYMF2WNAJtfomL881lVhyCJvDYMDEQ/VVGtqr/hw7zbsA==@nongnu.org
X-Gm-Message-State: APuU4Z/7LsaJX5/FD97mg2tbCBfe2ONKxFpdRsohdpHzu0aV3AwLRd+M
 YGau7Qi2zt1jty/ybe9AnJfFDrDt8RlbeYgm2DxRU91SWwON3Wg5hi5jLh3dtLoopGs=
X-Gm-Gg: AZFdTZd+5EYnCQDIe7gRcgFLq9L6inrpDbizB1ez7pI5oapTMDcheJQv02+GsN9oywq
 7PomXbOvVBQWjOGtBO9BkH0P5PjI7HlcPBVeq3WiwMoBcFE4YyZvp4NhloGdtw/MQvPbrnC2KE7
 ULNgHSUf9iEupSGPu1RXMfhXp60U5WxNHl6BE2OXeZVR2eebCN+DGc7VinA9Tq4fFykhI06bVxP
 lEnk5odR8UmPwFsf49zqzfcKyW3Qxm2NPT/S/6FP/diaD7QrQrb9nHrzjoW+YEe6kk+us+gzJiF
 P9un8lo2URRLimMHdn/RK3bEOBLOzMcU60TeN245J8Rno3Wojyqzf7Wk6n9iUxbGh4lvQ6TKYnt
 nh7KJe/fABKMMQiA+TTyQYROaCX0apPj0lMfJ+asYVS9F0Jr6l73UwdGhaAQCT0Fd+XWrqQ+aI0
 UzRzuS7W50FKY0aa0zETWUW2JLzgQ24W4Mos+eUseguI9gP0jDXsD/Y3Q62Oi/UZUu4omhK9s60
 9z9amZKtpiWYOIcmgAwlfgb2rk0xxenzgZGM0SxuoBKzq18eiR/VlnAfF2iDv5DBJp7X6po4AIp
 IVdatRULtLb+uCF1XnAm5qgtABFTXSnM69n89LGE38yAQQnH6Ba7D9crJob1H+LgA5gsWK2ExJg
 2XX1+yVa1
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67df4446b92mr2967874d50.78.1795447296128; 
 Mon, 23 Nov 2026 07:21:36 -0800 (PST)
Received: from [192.168.2.129] ([2600:1700:220:59e0:f880:d5ac:69f1:fb89])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67df3353258sm5747939d50.9.2026.11.23.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 07:21:35 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 09:21:17 -0600
Subject: [PATCH v2 2/2] m25p80: Clear write_enable after page program and
 flash erase operation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-m25p80_write_enable_fix-v2-2-0ac94f99e91f@oss.tenstorrent.com>
References: <20261123-m25p80_write_enable_fix-v2-0-0ac94f99e91f@oss.tenstorrent.com>
In-Reply-To: <20261123-m25p80_write_enable_fix-v2-0-0ac94f99e91f@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 qemu-stable@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
X-Mailer: b4 0.15.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NOR flash drivers in EDK2[1] and its forks[2] poll for write enable
(WEL) to be deasserted at the end of a SPI operation to indicate that
the operation has been completed. The m25p80 spec[3] indicates that real
hardware would desassert WEL at the end of page program and erase
operations.

The m25p80 model does not deassert WEL at the end of these operations.
Update the model to do so to match hardware behaviour.

[1] https://github.com/tianocore/edk2/blob/3c890c11dfdb5908dcbc84f977dddc6c6d43789f/MdeModulePkg/Bus/Spi/SpiNorFlashJedecSfdp/SpiNorFlash.c#L987
[2] https://github.com/spacemit-com/edk2-platforms/blob/0b8b7182d8a20a771b97a487d0e6f4ab89fb3492/Silicon/Spacemit/Drivers/Spi/SpiNorFlashDxe/SpiNorFlashDxe.c#L532
[3] https://www.alldatasheet.com/datasheet-pdf/download/22807/STMICROELECTRONICS/M25P80.html

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Cc: qemu-stable@nongnu.org
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 hw/block/m25p80.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 545e0b5728..cedfec67a2 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -650,6 +650,8 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
     }
     memset(s->storage + offset, 0xff, len);
     flash_sync_area(s, offset, len);
+
+    s->write_enable = false;
 }
 
 static inline void flash_sync_dirty(Flash *s, int64_t newpage)
@@ -1599,6 +1601,10 @@ static int m25p80_cs(SSIPeripheral *ss, bool select)
         if (s->state == STATE_COLLECTING_VAR_LEN_DATA) {
             complete_collecting_data(s);
         }
+        /* Deassert WEL at the end of a non-AAI page program */
+        if (s->state == STATE_PAGE_PROGRAM && !s->aai_enable) {
+            s->write_enable = false;
+        }
         s->len = 0;
         s->pos = 0;
         s->state = STATE_IDLE;

-- 
2.43.0


