Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35237C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:11:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEyn-00084F-T6; Wed, 30 Jul 2025 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwZ-0001Ry-UV
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:40 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwV-0002cA-2K
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:39 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2406fe901c4so2613235ad.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913193; x=1754517993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbXLHmQQJw7qwZ2+SWP/dkFm2f03bsQgTb+axHNXMUo=;
 b=WpuCp3Bu/3UCu2OhC7k4PSr/y5dX2J5J22EvnPAFsD6GqYGRyZqxv8cB72Zxr+o8v/
 n2XLHKHg+6bvCPNgBhglKaPG+VgvOiR6BuR+xxcZLW/PemNxMqu44pyS08bFUAFaZqk9
 IK/7hT1jqljomWbLOVPxSCb5jlRvW/KzBrG3OCgBbax+6jja5PDa3sJsCwwrvASmxHSt
 QZiQtBuOylm7DUto0bSm+FdlMpp4lWx+YWXHOTamSerz6Z/MCa82awPEqzhQ/OeeROED
 SFuPkD6JQnWMksFaZ7yFTYJLGQdfndOj43Eob5Y4W1c7guReWtz9jPP80i0iUY/vfaFo
 j2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913193; x=1754517993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbXLHmQQJw7qwZ2+SWP/dkFm2f03bsQgTb+axHNXMUo=;
 b=G0/PhaaME16F2EMydsIWNbdVVNZCMA6p8nl9WrjY1dZ3QwRrlcZXc2hfVjhIfDlWqn
 2ciNf5GvAdyoWH9ofakgylgzHsQqjFp91kbLkLu2xi1jBFaP8Wy3IltGEBbRg4KV5PGC
 XNydnomVx4ztdjZTdnsyDteB9SivVZeombSKkx20W+U3ttou62q6j7oesrgH6KYcYbKl
 zNKYStOe7mfthuIS369aFPMvFaGHQZjY87H0u0P5mAhAkrrf4aT8Hkll/WijIw1MQRaE
 VdQQ3Fat0YsEGBpUIwZAibCnwSjXYa8MFuOAuq4HvrXmBLbzCoQ1ZIwLn0kaoMbrxL29
 PADw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmKUA+L4EAJfmay/sV6+jTgWVQEsVOEJuBJCMnx9cPP8GmmRYjSgDc9p6utxkppKU9K/2xcUUQTg==@nongnu.org
X-Gm-Message-State: AOJu0YxfoAqULq8GSMFahFYnkbtkyl4XuM5BDQ0Lhm3x8OGLK06rsgdv
 hMeMo85xo3wpFcWNQL5Uk2zm0qjaQ1IxORzL70IhoBOjO1fvwmjvuaq/0nLjKt6xpIY=
X-Gm-Gg: ASbGncvLQ7Cv7Xr9IizcFwQG5JefrUhxKS7dACLuBwD8QHMxAtfgEGpEn+Hlns/0eOT
 6piKylrxeTDoaxEGBwyPDuIBtJVu1a6zpfyj/A0HX7jjOlK3+SCKUNyGATk8DPYwcfG3I0bN8hg
 KtiAY0ArDtsomE+lRyjm8FUkmFlGgZIGvuBVWYU8Vs4EvRYZB4aVxcdnIl+D2AKp3y1cePOFmQe
 bdvOr1aWRW90bG1IJswCGE4lCr9hwWx83voLqEQWkBwQ+04HatWHH5xC3kT3kstI/BIOJAZEUKR
 kVLHYVhHS+dw+WOVF4StJQZ/CcTMYoOHVcd/OXAqGDi6XgA1bPhu1fYyF8F4yA8WU1j7Ail8UGQ
 N30Wsf/R77WSApcYgcePMce8IM8FsaecF
X-Google-Smtp-Source: AGHT+IFoSoMOGjYHJDomwFFMKzj9lJw/pOTfpuFSUBCXqJUVExdQ12FyK25uLANeWRnctQ19TynBfQ==
X-Received: by 2002:a17:903:19e5:b0:240:75dd:3a3 with SMTP id
 d9443c01a7336-24096b1bf27mr72747965ad.28.1753913193564; 
 Wed, 30 Jul 2025 15:06:33 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 06/10] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Wed, 30 Jul 2025 15:06:17 -0700
Message-ID: <20250730220621.1142496-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

No semantic change.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5a04ce55ca9..e5a665d604b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -787,7 +787,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


