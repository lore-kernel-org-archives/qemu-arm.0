Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236CBF588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:18:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rw-0008Hf-6V; Tue, 21 Apr 2026 01:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RB-0007xW-1j
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3R4-0006Lt-6P
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:15 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3614826eca4so3242022a91.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748446; x=1777353246; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KcGt5HtaQY1O1QBUWApZ7ywTFf0PmVn1ovydl4Xl+Uc=;
 b=Q1JM7JEBNH5qKYqgy1ttgEXEcYMFkhnKK5iPNm8rYr+HU7WSlJ2/EsV91AMhlP+5IT
 xg7PIt+t10N0MUvFhooq+NFxTVJlYcnGEThYYh0LzHJOa2DLFb0xJILSrxtf/4y2UcUU
 v7Sg/Wg9Vd5WP9UE4yXmcwWm/+DJxGceE9vFE8gAsNxymNxNYDjXMVZRu87EEeSu3UPF
 aBbB/8MMqOYP0g7gJNFyMuMEXwiJp3qwKcUW7pYRgj0Yq6+TnietHOC3/g4zsrYIHeWS
 yiNtI6F2sO1lml4hO+kE+OoAajcOZLI4itinbBjAUcbdsw1dl9jZCVbA2UNCTrP+CpQJ
 1D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748446; x=1777353246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KcGt5HtaQY1O1QBUWApZ7ywTFf0PmVn1ovydl4Xl+Uc=;
 b=M8DTnTl0ndfuilDSbzWK9lIORRIhqYN3Y5qSfR4trzMnuZMdrobbCV7aSa3vPmyNJ7
 NN0x3A+OEbh4YydobSpSgnRznVVY4fXhCsyhfgDK5q/G+xyqcthyG4+hFnn+/KJ1KI0E
 HccilIP2UD+fD0ZMzEN20Tx1XAZfhXxMsaT1AvUfx2/B8AFRRecJ6+vpr/OxC9ilO/Wx
 ntiuJhki0iHY9sd/0+DP5mSUJnlYOu5n1Pj88oIJg1ny/g5ayb5uxgl3AC5RhCtFiwXz
 rNFBzFkDEZeDtqkwxVduVtTAD/tCKvb+PAFh2MMozzcZ80xMAZjHr32eOyhdF9oW7UpU
 iDfw==
X-Gm-Message-State: AOJu0Yx59EnZ1wr9LDL5DVz+igiatjHxslqFzIxuzRPCU+5dntpftzWT
 sphgdNmNg7UNZjpyE7IkUi9z5DZe7XkRFJ7T5qMQlRLc7OT16vSnNdgobhMDSlNzlcViWu88zip
 R8IK3iPk=
X-Gm-Gg: AeBDievQaDWigLT3ncSeZaUxEdxLXOPRPQiozO9ct3UmX4/+e6NrBvmBAErvepK2Mcw
 Ndj8pOe0qw+g0uG1M8o2HCB/Dq5yFnvDV0Wiw9WIiIhiS9eQEbzDAHVxBkE5dZ97KNghfWE8fx2
 xjPCy6PLJq0iBRjBrU2UWhZHfItsoUF7rzMBPy24e9UIj8dSqgrnZLquI5rRFsgY5aK1l9asl8r
 nudaPODwWiFt8hNtfnn3c7hNMUjh3EWKRKbTlf6L1ozc2dYQ+BJ9whJ6CQ4npkUi+vArF1zLmGO
 H3wZfd3aml1Fq+OKcxO95Fed8FKlp+at6an065XlJ6r2FaX8zzPh/7sXAVIE2WaxBZK81pAvis4
 80Y5i19jjzx79WxfqDzXKRsToE1MYIN7OTLF19fqYCsxxozOczCKd97iI3R+075qouGy+ss/b1v
 9aYd+dzfwMs/bOs2oEU3oVsOcYoLYw5GWuT+vbvvk6
X-Received: by 2002:a17:90b:5490:b0:35e:594a:5b6b with SMTP id
 98e67ed59e1d1-361404992a1mr19270972a91.24.1776748446385; 
 Mon, 20 Apr 2026 22:14:06 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/37] target/arm: Update SCR bits for Arm ARM M.a.a
Date: Tue, 21 Apr 2026 15:13:15 +1000
Message-ID: <20260421051346.41106-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20..6ec3845edf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1794,6 +1794,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_AIEN              (1ULL << 46)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
+#define SCR_ENFPM             (1ULL << 50)
+#define SCR_TMEA              (1ULL << 51)
+#define SCR_TWERR             (1ULL << 52)
+#define SCR_PFAREN            (1ULL << 53)
+#define SCR_SRMASKEN          (1ULL << 54)
+#define SCR_ENIDCP128         (1ULL << 55)
+#define SCR_DSE               (1ULL << 57)
+#define SCR_ENDSE             (1ULL << 58)
+#define SCR_FGTEN2            (1ULL << 59)
+#define SCR_HDBSSEN           (1ULL << 60)
+#define SCR_HACEBSEN          (1ULL << 61)
 #define SCR_NSE               (1ULL << 62)
 
 /* GCSCR_ELx fields */
-- 
2.43.0


