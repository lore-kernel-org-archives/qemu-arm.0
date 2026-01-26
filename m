Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC7AC88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGt3-0004lO-TQ; Mon, 26 Jan 2026 02:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeI-0002kP-8h
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:05:05 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGeE-000454-Vj
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:04:33 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82307c6902eso1814351b3a.3
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411066; x=1770015866; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXBe1C9rFr756wJ0chsOZMSPb6pQczF5N8rNcYW9UcE=;
 b=ACr9kHGodA8V2izDC5ZduCGynnnEsnfpGsFM9g/zYNSMfqnbw+ENsKhuJShI3nBdQt
 oGpcfYmDJQjP0+Z29JhfjmybUsc2HxhdrKGw0ndymNa+UzRgu81boGj05qbjzisDOUSI
 G76pp/35bSyelTmR8rG4AVH/iV+iTNKs1bOeMaW+A+vbOJgS1W7JbZ7zKyoCYIc2FluD
 ffz/+k8OxQa7sIgEld3iCqP+sxgq6Yon3CIZ5wmC6XcATlavQRutS579mT9NgNQbnpsd
 9FyzE1+IG2X7YtiUNXd3l3Gfa7a+LRa1OA1Tae+UQoPUO9FbwjXzdZwPOOaRqP8MmfLi
 c2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411066; x=1770015866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TXBe1C9rFr756wJ0chsOZMSPb6pQczF5N8rNcYW9UcE=;
 b=UHH56i691FgXMpEnE741j7axZoJv9eRpaQbVh+pdKg29ROpllk0AJ9NvjdP1lOGOvo
 U9cgFfbmIv7z1RXeyxiD/r8kJT6iyLULjCtvCaLdgqoKyQMPhakn22OcWYkzhVL2yBlL
 GF7hiT0zR19syQRfmmygvzAyGSckk2CxxfsM/W3SBqjgiBMVNh6TddGYuWDkTmN1dYi5
 sdHLePp41rValk8zu0a6oDHdy3I8mqSLneE7+fxZMyiqrINVUg4rxxIuBDMfNM7FxxSN
 r86ZHaO5tf+rjSGtMeQMz6WJ+s/VHrCm8lnnPncb5lK5KPT3B5lSefCl57RpVXDkC2et
 SYMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDmctDBQGHxnQ6blhUnP1ageAsF3bQqFGOgDhWr2RYly3KnStHrU3rjXmShPgDae9DMosp4YvFWg==@nongnu.org
X-Gm-Message-State: AOJu0YxNvIVMTA8JMtmFRQ5wIq/l5oMGTe13sRSxY0PyiBMUdxBiV8MC
 Fv6+WTKhwr9Qy+9qV92NDvAXZFFdEK8c/tBdOYixD/QKAMiXxaSQ+5YL
X-Gm-Gg: AZuq6aKuQSMF6Wmj4N6VqLORHqg1eK+2MfwpHxIkYpLOHjiOfq06Wfo6Cc8EBna7hdB
 MyGGUj1Qu2RTZa5tMXzRSHujzUnriWIxXZFoHPLT06P+ZgD7YY3t0ziux6FmnDUHlhCG71WhtSh
 9mmev9M3tFVjZOgtxp5VKXw18iYcgoljB6lvSM4NqDtxwN6uJJT1uJ2vR9dt7Lo2N2KKeZh88V6
 1Wcaw/07S4FSXJ2CcTALIL5tAtW76kXslUGEydaY7fNUi52yw3/h6t/zjZXY+WSuWnchIJHyBuc
 XhX1a62Xucc7Yi/okHaMW3+Wle0Gx9+OdL/lpFMEfibhJH6MKzJ+JHAu/IsmtLn4vYrHhcjOCi7
 Xw+rECkNFa6YQJNs5lBPsf+9JhslPz1nYb4aEEqcrrSQsRjfGSFvD2WhpkJyFWNbTSe5EVd74Xp
 Km5yx77xpMWEtLapVsBShkSqriDiYPiRyKcRfxb/No0w==
X-Received: by 2002:a05:6a00:1494:b0:821:7ee2:b692 with SMTP id
 d2e1a72fcca58-8234120a841mr3317785b3a.2.1769411065767; 
 Sun, 25 Jan 2026 23:04:25 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:04:25 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 04/33] tcg/wasm64: Add relocation callbacks
Date: Mon, 26 Jan 2026 07:03:17 +0000
Message-ID: <777003050525eac85580bd75bb5473777c278c87.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x431.google.com
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

Relocation callbacks are used for the TCI instructions to preserve the
original logic of the TCI backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64/tcg-target.c.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index 0b12c4ea03..4bcb594360 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -88,3 +88,24 @@ static bool tcg_target_const_match(int64_t val, int ct,
 {
     return ct & TCG_CT_CONST;
 }
+
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    memset(p, 0, sizeof(*p) * count);
+}
+
+static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
+{
+    intptr_t diff = value - (intptr_t)(code_ptr + 4);
+
+    tcg_debug_assert(addend == 0);
+    tcg_debug_assert(type == 20);
+
+    if (diff == sextract32(diff, 0, type)) {
+        tcg_patch32(code_ptr,
+                    deposit32(*(uint32_t *)code_ptr, 32 - type, type, diff));
+        return true;
+    }
+    return false;
+}
-- 
2.43.0


