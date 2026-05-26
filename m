Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC084CD5BD1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyYW-00024v-0e; Tue, 26 May 2026 16:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyY4-0001KC-Na
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyY1-0007VP-Tn
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso6493300f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827922; x=1780432722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q+taEkHZb9CxjnQO4BHePIfbY9jY0z9KjY9u+7Jb3eA=;
 b=ELKphlNou1BLMs3+0kFxjjGppFQAJKVaxN+CTPYTcL84DqXpf817pCBG0d2lXJTQNw
 0UozA34kzDYiczIEHq3e4k8E9r7gjDMFhR2QaTWo6gf+WW0z0Sy6HK04aZodF78FPRzQ
 MtS1m+GS+gfSZBB84WZn1wY65A1W/zxXUiEBrq//9H9NeSbL0uOWcJbrsd6ktJrnSvnk
 AfAHlhuKLYtYNuWL9upUrDlnOO5c3bikMF2I/nM2sQgdbFcczGrOgABA9rw8+1cikOGl
 6lM/ubsrnvsNg4vgu0erUqBKwdnrm1Htl4QTVuUsnLlFSZu55pe6cSss0VDANBu4TnD9
 3kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827922; x=1780432722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q+taEkHZb9CxjnQO4BHePIfbY9jY0z9KjY9u+7Jb3eA=;
 b=maSNzrb+R9KpFMmAuAVZYE6/fFJrGPXiYVRQC7yJFQzRjUJ+gZwIkmVXYsCUJvFtiw
 Q4XFIjPbsAcigUkEAk6aFwD5HnBImohpwOpi3ZCH8LmgPp1X33ynH7XQYtdefVG0e3tL
 ThxXTZz7znaZNYrSF5B3ypKez0c+/A/JVyU38tEXvCEQKIqz1wbauekV2VM2WLW0Jn/d
 1iSNcwJDxlXMdGnPew+42zoK3PIx8F04XzXEfP44PjgzfCC2F3KBgdkh1kQJT6mkFlmo
 fvr32/46hX4mEL9TVJStODlN/wBfn3U6jgp0r7XYtVgnmXpOjh2atEPPetywDIqUmkgJ
 Suyw==
X-Gm-Message-State: AOJu0YwsaoXZrm5Y2cilfehsfC/Njmwj/0VxfskNfPUN6Hwi0cmkAbxq
 jubC2sX8whrm3ZCebOALOGOSUV/k2CUMjVVxnbStyLSTMWmkV4eRTcXxojyg4kDXoKtJsfctUbN
 vXppuhYWOXQ==
X-Gm-Gg: Acq92OEaX1cyvMVPxaKTz4HjHLJYm6UBPYvEly4lOmOLzM0D1gRgua5qPeErc/TTyBa
 NdZ3WFbqEKy2/E8L7tr4w0qbwGZ448jdH50HU2PHGCV0rltpPXRt6JPzCPwnuZSMfI29gZJKI7v
 Hd7AzOk2wcdr7LUK1qWP1qd0383MQKuiRJ8B2U6nvfVWYpsh4otxWMW85fQBITv80O/d/qq3p1c
 YjS6sFHkaZEx8XZw2Pmfh7KeZN/WEtkFRAfAHBUjEmLWrDDLEiEtQvhf+Rwphj7stlA6RMu/hWu
 /5HxqKmyzfTPG4PDj+aLK2nwz9G28tBCzwBOmTonQuTCvH2WsLTsYAwLDmwpG1fB2OhL7/bH+Cx
 AzsyPsXcHa6ea0IwLjUj8c3KDwS4+w50E8F7wc3dj0xsrOmjmsFwAs+zm40keQfLBIU82gJgJCx
 P4dgefBgwt1BtM4dFF6mjjgE8+UGrKvQYzzjfdpdFSbCpGN5paooP8l30=
X-Received: by 2002:a05:6000:4b04:b0:45e:9420:ed16 with SMTP id
 ffacd0b85a97d-45eb38b0045mr34673111f8f.10.1779827922259; 
 Tue, 26 May 2026 13:38:42 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb558a47sm749866f8f.15.2026.05.26.13.38.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:38:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 11/17] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
Date: Tue, 26 May 2026 22:37:16 +0200
Message-ID: <20260526203722.79463-12-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

32-bit ARM max CPU is a 'Cortex-A57 advertising none of the AArch64
features'. Keep it as close as possible as the A57, by implementing
the debug ID registers, following the changes in aarch64_a57_initfn
added by commits 48eb3ae64b3 ("target-arm: Adjust debug ID registers
per-CPU") and 09754ca867f ("target/arm: Implement AArch32 DBGDEVID,
DBGDEVID1, DBGDEVID2").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index cf643ce43b1..2e8afc28602 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -755,6 +755,9 @@ static void arm_max_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00011142);
     SET_IDREG(isar, ID_ISAR5, 0x00011121);
     SET_IDREG(isar, ID_ISAR6, 0);
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-- 
2.53.0


