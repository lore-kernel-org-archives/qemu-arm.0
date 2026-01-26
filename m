Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A99C88E58
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:20:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkGtF-0005CK-U3; Mon, 26 Jan 2026 02:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfw-00035q-E1
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:24 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGfl-0004Pt-7N
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:11 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-81e9d0cd082so3369919b3a.0
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411146; x=1770015946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XETmM2o4EihK8AYeDPsdnFJxfC4XHKe6S6lQlmdsixE=;
 b=eYHahDfWFF4r920hK66ZPecCEIXyRcDI5s1whq8qu54ogaLduvag3CjyQVEjBipGoE
 vv8ZmNSh8AA6Bo1HYvjg67r+eAKrp3YxS9TavRgA+myrVwo7tL8lY5F7mBBOojD8Z6zM
 kSJUZREkqquwEvbcGm4PwShfuCzLfCW1nGO8aNuFSn8NCO2jz5EtyuMVbW8gl+4SxPYy
 ZcuGQ/vHhQrm6zsbEdd21riRKwqMIIFtQFRA6yk/cSG4tmYUYVsUCLBkQ1fD/b6B1R4F
 ub8E0RkjS2+PhTrnsEtsHBHyu/4IIQlL36MF8ZlHTIqtbSmpNS/qFZVfW/Cqt67ej5RJ
 imGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411146; x=1770015946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XETmM2o4EihK8AYeDPsdnFJxfC4XHKe6S6lQlmdsixE=;
 b=UHrxC+5RK7I1amLpnUzg/pCni6g2WXzvTDdGjecPLJ+rO2Ic6WLkYGSPqPn2KvB5dI
 79z47NFY43frL/tiYaZAUiPp/jqc0STLiUukB/ZiQBSwsVkuQXxTTBzFjJ1dnvqd1mKY
 IBii7Uw/snEipdFk7f0bDlPpZ3InaqiMXhb37PSucRbbT2rxCI1F+A+UcGIHWXPPjRcT
 iBrKZFYMoGR4J0ZXU6d7uTRDLobIw+3RfcBV6gObtTqd4AIXtq5euIQQ+7Se7DQ8s/Iu
 JScP02jJJHvwDje49nUMHQ+gaOxm/c6Ai0FGXmFZNw/pTcFuyOPJWXNjp5CL/LxyloiB
 yOog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbhChFdVyaMcVz7k1RwjBiUxiUAax2ID5veADncv/tJypDi42NDUeD8398wlcLQ8glYjoiXhgOWA==@nongnu.org
X-Gm-Message-State: AOJu0YzIG6vwb2VO88r2zKHXxkhxjLtBjPWiJ+UdNLiXMrw2ocqolKWm
 aM9PspyfJkaE+tszWI/zrFSXwbZCOpsNqWWhNAmpQtH53QHcr56NOcMx
X-Gm-Gg: AZuq6aKbXji4GWp9BfY8r3Wm1chvl9lkSkqwrVSS2WckGNwENXuqaXl6Hz8kYm5DQb6
 p+3xjiEEyy6csiPyYFRKFfsgHYVRNSQYxgyv15n0pp+CVd953Hg8WQQjT+J/knmYUXPvCNz8enI
 Yl0sJW/JXV91hJkoCrl0cZcZvUbJtcoDTRKZTHQq2+D2G4dFiBY2WA75ntBQ9REMadQwAYrgucA
 1AaG4OkLLj9ABQbeWzTjeMkwmc5riny8mnQERtec6/n0jqmbRj9nRa8msIPMXR7k3C3i+mNmao3
 zhJcbnEdO70rUKOYBW1//4NhMyISn5L+bypqZIEQ69grOg6ctiudqOT5sH7KbU6iFOF5c4djc6L
 Lkgkgus+IkTqL3+UwUk3fhe5ZiZxHfrEpgmnKHRuyTi/hr3WybsMMM3NCuOPmOuQwXH4ptPW0W1
 h2MtW8trX4FP/KcdtP1CsDqhkSGaABG9YWs1XrqQRNIA==
X-Received: by 2002:aa7:9067:0:b0:823:d04:dee1 with SMTP id
 d2e1a72fcca58-823412a2f70mr3586480b3a.32.1769411146200; 
 Sun, 25 Jan 2026 23:05:46 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:05:45 -0800 (PST)
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
Subject: [PATCH v4 22/33] tcg/wasm64: Add initialization of fundamental
 registers
Date: Mon, 26 Jan 2026 07:03:35 +0000
Message-ID: <abadf9d96d33b10b17748f4ac3b8e43ad0607583.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This commit adds initialization of TCG_AREG0 and TCG_REG_CALL_STACK at the
beginning of each TB. The CPUArchState struct and the stack array are passed
from the caller via the WasmContext structure. The BLOCK_IDX variable is
initialized to 0 as TB execution begins at the first block.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm64.h                | 10 ++++++++++
 tcg/wasm64/tcg-target.c.inc | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tcg/wasm64.h b/tcg/wasm64.h
index a3631b34a8..f2b67c1099 100644
--- a/tcg/wasm64.h
+++ b/tcg/wasm64.h
@@ -20,6 +20,16 @@ struct WasmContext {
      * Buffer to store 128bit return value on call.
      */
     void *buf128;
+
+    /*
+     * Pointer to the CPUArchState struct.
+     */
+    CPUArchState *env;
+
+    /*
+     * Pointer to a stack array.
+     */
+    uint64_t *stack;
 };
 
 #endif
diff --git a/tcg/wasm64/tcg-target.c.inc b/tcg/wasm64/tcg-target.c.inc
index bab69b00ca..f5d4cb4139 100644
--- a/tcg/wasm64/tcg-target.c.inc
+++ b/tcg/wasm64/tcg-target.c.inc
@@ -2081,11 +2081,30 @@ static void tcg_out_set_carry(TCGContext *s)
 
 static void tcg_out_tb_start(TCGContext *s)
 {
+    intptr_t ofs;
+
     init_sub_buf();
     init_blocks();
     init_label_info();
     init_helpers();
 
+    /* Initialize fundamental registers */
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, REG_IDX(TCG_AREG0));
+    tcg_wasm_out_op(s, OPC_I64_EQZ);
+    tcg_wasm_out_op_block(s, OPC_IF, BLOCK_NORET);
+
+    ofs = tcg_wasm_out_get_ctx(s, CTX_OFFSET(env));
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, ofs);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(TCG_AREG0));
+
+    ofs = tcg_wasm_out_get_ctx(s, CTX_OFFSET(stack));
+    tcg_wasm_out_op_ldst(s, OPC_I64_LOAD, 0, ofs);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, REG_IDX(TCG_REG_CALL_STACK));
+    tcg_wasm_out_op(s, OPC_END);
+
+    tcg_wasm_out_op_const(s, OPC_I64_CONST, 0);
+    tcg_wasm_out_op_idx(s, OPC_GLOBAL_SET, BLOCK_IDX);
+
     tcg_wasm_out_op_block(s, OPC_LOOP, BLOCK_NORET);
     tcg_wasm_out_op_idx(s, OPC_GLOBAL_GET, BLOCK_IDX);
     tcg_wasm_out_op(s, OPC_I64_EQZ);
-- 
2.43.0


