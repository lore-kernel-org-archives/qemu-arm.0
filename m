Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B2E7316D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:35:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu47-0006nv-9G; Mon, 02 Feb 2026 08:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu45-0006mq-QP
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:05 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu44-0002e2-9m
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so35912205e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039243; x=1770644043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIgmMwISMpLwftLkUcpbNnEzoo+JvfxNkgOo0yRxeX4=;
 b=lXpg8KM8Bx7RtfenJXyoi9yChhYy2Z5dwLg8sW/zPbUTzqEzLZCjQ3YodYEshRocbS
 1bAJxvnfs8Mjp8DQjuVmf+iCmh1CsMYDlb8/xHadxOB72H8xtbWoE3TRS8kau2tC7B/9
 piNXGH+8Dy20pa7lb5aqd4rJ/G9bJii1JkCB7PzmTxOhPygRSPMYGf86gB1hEcQAUu/6
 d+Qc6ii5uEjL+tMKbcfn2NmnF9EMQjnz0VL/Z+eWswSSOho3qvWVBb5gOO8e/y4TOuNw
 Vr566jtzCKfEI85CB2yTBDR06FahtDdAcdwZYM6fFgSZ9/Sasm9WlrOXV283VITvD2kp
 0mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039243; x=1770644043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aIgmMwISMpLwftLkUcpbNnEzoo+JvfxNkgOo0yRxeX4=;
 b=h446yTgGaJzK/PNCPJ13rJTzyX+nwg/dcECpoHcYi6F6Y/anBi0bdprYk9nD8M5qF7
 9UDhNy0cOdmkqhrFpnUSRI7n9F3nui1aTlhsQTWBXgH7ol2nhHKbYJGNXY6OKyarhjAo
 RKw5db5HIoIMTwfEeiA8h/k96PFvYbNeERRqPyHq7dGj/D2kM8JiOC97Dea2zHKnJKPt
 fh4x7C3qLmbeyi4w4e22nQK/JWRO0DvufglL98PyhP+Jp8Gsuvd9HZXdnDHtUUrYZddc
 knc/1WEe6PsFCTSNV2eMYNnf2CsWKOxXgF1P/agTBZgcY4qj1I1i0UNSQ3IDucDWUCi0
 2AZA==
X-Gm-Message-State: AOJu0YwwJTvcsJuFlx4s6NsG41MPL6A892QKhH3VZAqC2heTnk2115sS
 4vb+a7/TZwB3xQmpWUtPmjEx1hXVwKoulqPvLehylv0NS5F7i12/GgP6HQFJfnpFOIdlHjY7TDv
 Rdavs
X-Gm-Gg: AZuq6aI6wuQhoJPwkhuG0p0owbnL2axBt6xKUAZ08nHy39rV6iFZEXZeF29X3bLVgGe
 6IG13GMWyXKr+8+v4WBJpOg20PYDqh1EaNgcqEazeYRz8WM9LMkaJGsc60NwLuKIVYHUCj7O0EN
 8IMW8Zal2P7YsI/QVMAUN6mx5LX8ep35OygHFRM9kkdKG/avpQO3TwOczMcmwx9B/mYxTbrUWYg
 n5zbQKM+cT0vnNHdiBks1nXM9thaMUrnH+E4TjjvRBlaOi/VWutAV1GdUJfTGuWYyTx66wRMHf3
 0M2WuIgQ5Bp0EhePkr/+qSnFsAlg3mtnotfS4HqktJ7IVBapyaubsSYd9dINGyitOlDGpC5LIFQ
 t4nERH8Cav9qWD6jeFjVxww3vY9/6Tf7AlImQ+Q3HysYl6uBft7zLuueTiFHLgH0W7XgeCvnbxT
 lkyEhQOpl8Z4Ca52eZQrQeEef0YB4NJg==
X-Received: by 2002:a05:600c:4e87:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-482db4655c1mr146429415e9.13.1770039242878; 
 Mon, 02 Feb 2026 05:34:02 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:34:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 06/15] target/arm: Handle SME-only CPUs in
 sve_vqm1_for_el_sm()
Date: Mon,  2 Feb 2026 13:33:44 +0000
Message-ID: <20260202133353.2231685-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

In sve_vqm1_for_el_sm(), we implicitly assume that the CPU has SVE:
if called with sm == false for non-streaming mode, we try to return a
vector length from svq_vq.  This hits the "assert(sm)" at the bettom
of the function in an SME-only CPU where sve_vq.map is zero.

Add code to handle the "SME-only CPU not in streaming mode" case: we
report an effective VL of 128 bits, which is what the architecture
rule R_KXKNK says should be used when SVE instructions are disabled
or trapped but floating point instructions are enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e7aa5ec2f2..e4a6ff17b1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4766,7 +4766,7 @@ int sme_exception_el(CPUARMState *env, int el)
 }
 
 /*
- * Given that SVE is enabled, return the vector length for EL.
+ * Given that SVE or SME is enabled, return the vector length for EL.
  */
 uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
 {
@@ -4778,6 +4778,12 @@ uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
     if (sm) {
         cr = env->vfp.smcr_el;
         map = cpu->sme_vq.map;
+    } else if (map == 0) {
+        /*
+         * SME-only CPU not in streaming mode: effective VL
+         * is 128 bits, per R_KXKNK.
+         */
+        return 0;
     }
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-- 
2.43.0


