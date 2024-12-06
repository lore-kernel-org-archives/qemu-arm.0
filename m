Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp586200njb;
        Thu, 5 Dec 2024 19:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW18fz8bszmye9x+kaZN/rmy/WZznNZMTXw+gUa3XubWafmHMIqVArmZsFxB7yryt9MRmwmxNDH5N0BSg==@linaro.org
X-Google-Smtp-Source: AGHT+IFu7byaPmKUVIVgv9+IRmtA+ARVLxW3gDG+VsgWtZqv7axCb8d0r6wFJnbMvPJiZSa/zJWh
X-Received: by 2002:a05:622a:1356:b0:466:9018:c92f with SMTP id d75a77b69052e-46734c883bdmr31768051cf.4.1733454811161;
        Thu, 05 Dec 2024 19:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733454811; cv=none;
        d=google.com; s=arc-20240605;
        b=d8yhj7jKRDnLpFAHaMulT+QuL+NKdxOwBhKkBJtATVsUoQ0Wx2S2plkNK6mXWgXSI5
         mQQ+BXB9+xUn8W9bIjrhqVed3LpkpkjX1QnV1rVJeOwL2fwV3g5wmkLwQ5SzOViTuuor
         HzqPQn+d5BYgj7J/Whi1XnsAttmTLk0Q6ZVYNKgBTA0WGyjGa+0IQNOpb0tbUMXAYoPE
         Aj7GLFdlhFY7pHDOLxjiLvu7ynjvQvHroaZcuHLQmCSCxkTqiyA6XqCMHhvqsooNThs/
         3ryJCZZBPvmsRVkPQPAIhyGYBK8NJN+y95Hovktsl599ju1S0Bu/QLSaEXCXSgnlIFtw
         saww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PJL8iL6zdeS8QJ0iAJjdZjrJd7kU5aektfF01GYweFc=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gJiQZ9jsxLp3cZdlLqUz3Uj1YHArHY9QS62xKuS7psviTxs4PiZrxnoQQJwmr8K0nz
         dORo1wb38eEbO1Jne593+HmT/UPfkTzFm1fWhTOvI76+SPiPmzfP4FgEQdbMw7Z/9IEI
         Kt1RJ5AndG2M9W8SCOonwpxaEEPVpAgc2vytWUOVJ6SIVsqlOXZna2h8kFI10vN2dQHm
         Slrkob1GyHj5k9gQ4PYxy15P6b77Sq6mVGrOZjjTHb01VhZqyKMEHULHjOBJ7217WdOj
         /92AyNO7PhcsaA8GOKccIQdwbten9nzBcLjZy+7D0A5mh/VhycQjnwu7mHKKlWcILymz
         VahA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAhEFKm8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a51851si320027985a.136.2024.12.05.19.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SAhEFKm8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOlk-0006oI-0Z; Thu, 05 Dec 2024 22:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOli-0006ne-U3
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:38 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOle-0004R4-KQ
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:38 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-71d47201b3fso431837a34.2
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 19:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733454753; x=1734059553; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJL8iL6zdeS8QJ0iAJjdZjrJd7kU5aektfF01GYweFc=;
 b=SAhEFKm8g8VNC2gBo8tN+WLDqPVyyYR/jXQxc8L+wyDB87rQbYwdcNqTLdkeaLsteR
 F6XgDF4tPPbd7knQRZjUx3QjFdukfySK4ZD5oiSQVFtWmNNR11SGbFqCya3C39NwoB/0
 QR6LlyTI/XlhmwbasBU8rGCZpqt2z8tP7xR8ttVzMNYHE3C5o/8XgnofgsGKJbl1HgNB
 0lsOT4UgV2w4XT8qONgHRLbIIQAlgYutSLc93DHJlf3pdNcgU+Siw5Z9roB+DMKgwtWz
 c0zyVlm/E9PT7+BP8v/OoT77mr7aK0vKMHYsWq6jRWr+oEanUFUF4EQ/MXm0CRJsZEqv
 5QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454753; x=1734059553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PJL8iL6zdeS8QJ0iAJjdZjrJd7kU5aektfF01GYweFc=;
 b=N+gPfU+S0B/UK9MJq7YwJQJzU3vt1/fBbEezU1XIdRV5lrakz3wIE2Pw9y5PvoTjcr
 D8n7zVUao8xCN76FaWFcU4p0ZZZ0sJCtjVoeftwqQPFU2mYa0l/b6eYpBFG/bjNeNsGX
 X7K5/8Yq+HPCngYtQ+uWnlYI/h1AbsGK8rP63hvPt/S4bqiAXkLF1KjGr3xwp1GSgE+o
 3uVY3EHfmQwembTsyas+1utnjQJoQRTI5T5Tu51dA/ib/Jtc9aSE6geK3fAzO+WDaK4X
 dDagAho+jXKNssuxfaoFZqTfEDN0iLatwcpy4zrLpUzP6f8vQFElFve4vp7oCmhUHHpv
 MGXw==
X-Gm-Message-State: AOJu0Yz9zX8G/P8TlOviNzDGTLIQ6Xb3meE0s5LFdtbcL6T8Z+5hjkak
 SwTz0FiCDskVgCzdz3X6sDqja3Ih8+M5Igu8PdejgHbF7Z//fBd+tmbNnS8EGPI=
X-Gm-Gg: ASbGncuXvzppYqEsZxVz2/SN7+F6NqGbjI5p/hWMa87QuJzbylJSbuc6SRASE/oQN1m
 EJZUNsdFkE/muUm6b/4elHG8vE7MJzVhXsVOkUnbYoeeoxtDc6kZMeVveNYxfoidHCUQyYlw712
 qRl6oetXY6iveFb/kVVRER2L6swyb9WdmpICt3Dv4Mc1w/Y7sPD8qkUzTsjuEK1oljp2pc8rAx9
 +GPP5hvctJ2nnFehT3zSrxYnYEdAp232JsaCFIO24uE3S47Vh10YzQHpHrKNZKR3c+cKJmwv7AZ
 wO3xhqIDKrEw6mUlgJ/szUdMJH4k2PEeDhCB
X-Received: by 2002:a05:6830:915:b0:717:d2f8:6bb8 with SMTP id
 46e09a7af769-71dcf4d6a16mr751653a34.12.1733454753083; 
 Thu, 05 Dec 2024 19:12:33 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dc493b2dfsm596442a34.9.2024.12.05.19.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:12:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/9] target/arm: Convert helper-a64.c to fpst alias
Date: Thu,  5 Dec 2024 21:12:18 -0600
Message-ID: <20241206031224.78525-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206031224.78525-1-richard.henderson@linaro.org>
References: <20241206031224.78525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kbdgBfN4s+L8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h | 94 +++++++++++++++++------------------
 target/arm/tcg/helper-a64.c | 98 +++++++++++++------------------------
 2 files changed, 80 insertions(+), 112 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 3c0774139b..f1bac6688a 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -23,57 +23,57 @@ DEF_HELPER_2(msr_i_spsel, void, env, i32)
 DEF_HELPER_2(msr_i_daifset, void, env, i32)
 DEF_HELPER_2(msr_i_daifclear, void, env, i32)
 DEF_HELPER_1(msr_set_allint_el1, void, env)
-DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
-DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
-DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
-DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
-DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, ptr)
-DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, ptr)
+DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, fpst)
+DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, fpst)
+DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, fpst)
+DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, fpst)
+DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, fpst)
+DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, fpst)
 DEF_HELPER_FLAGS_4(simd_tblx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
-DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
-DEF_HELPER_FLAGS_3(recpsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
-DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
-DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
-DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
-DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
-DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
+DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
+DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
+DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, fpst)
+DEF_HELPER_FLAGS_3(neon_cge_f64, TCG_CALL_NO_RWG, i64, i64, i64, fpst)
+DEF_HELPER_FLAGS_3(neon_cgt_f64, TCG_CALL_NO_RWG, i64, i64, i64, fpst)
+DEF_HELPER_FLAGS_3(recpsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(recpsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
+DEF_HELPER_FLAGS_3(recpsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_f16, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_f32, TCG_CALL_NO_RWG, f32, f32, f32, fpst)
+DEF_HELPER_FLAGS_3(rsqrtsf_f64, TCG_CALL_NO_RWG, f64, f64, f64, fpst)
+DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, fpst)
+DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, fpst)
+DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, fpst)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_FLAGS_3(advsimd_minnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_addh, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_subh, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_mulh, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_divh, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, ptr)
-DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
-DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
-DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
-DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
-DEF_HELPER_3(advsimd_mulxh, f16, f16, f16, ptr)
-DEF_HELPER_4(advsimd_muladdh, f16, f16, f16, f16, ptr)
-DEF_HELPER_3(advsimd_add2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_sub2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_mul2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_div2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_max2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_min2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_maxnum2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_minnum2h, i32, i32, i32, ptr)
-DEF_HELPER_3(advsimd_mulx2h, i32, i32, i32, ptr)
-DEF_HELPER_4(advsimd_muladd2h, i32, i32, i32, i32, ptr)
-DEF_HELPER_2(advsimd_rinth_exact, f16, f16, ptr)
-DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
+DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_FLAGS_3(advsimd_minnumh, TCG_CALL_NO_RWG, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_addh, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_subh, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_mulh, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_divh, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, fpst)
+DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, fpst)
+DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, fpst)
+DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, fpst)
+DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, fpst)
+DEF_HELPER_3(advsimd_mulxh, f16, f16, f16, fpst)
+DEF_HELPER_4(advsimd_muladdh, f16, f16, f16, f16, fpst)
+DEF_HELPER_3(advsimd_add2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_sub2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_mul2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_div2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_max2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_min2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_maxnum2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_minnum2h, i32, i32, i32, fpst)
+DEF_HELPER_3(advsimd_mulx2h, i32, i32, i32, fpst)
+DEF_HELPER_4(advsimd_muladd2h, i32, i32, i32, i32, fpst)
+DEF_HELPER_2(advsimd_rinth_exact, f16, f16, fpst)
+DEF_HELPER_2(advsimd_rinth, f16, f16, fpst)
 
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 28de7468cd..1daf3f27c0 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -130,40 +130,38 @@ static inline uint32_t float_rel_to_flags(int res)
     return flags;
 }
 
-uint64_t HELPER(vfp_cmph_a64)(uint32_t x, uint32_t y, void *fp_status)
+uint64_t HELPER(vfp_cmph_a64)(uint32_t x, uint32_t y, float_status *fp_status)
 {
     return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmpeh_a64)(uint32_t x, uint32_t y, void *fp_status)
+uint64_t HELPER(vfp_cmpeh_a64)(uint32_t x, uint32_t y, float_status *fp_status)
 {
     return float_rel_to_flags(float16_compare(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, void *fp_status)
+uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, float_status *fp_status)
 {
     return float_rel_to_flags(float32_compare_quiet(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmpes_a64)(float32 x, float32 y, void *fp_status)
+uint64_t HELPER(vfp_cmpes_a64)(float32 x, float32 y, float_status *fp_status)
 {
     return float_rel_to_flags(float32_compare(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmpd_a64)(float64 x, float64 y, void *fp_status)
+uint64_t HELPER(vfp_cmpd_a64)(float64 x, float64 y, float_status *fp_status)
 {
     return float_rel_to_flags(float64_compare_quiet(x, y, fp_status));
 }
 
-uint64_t HELPER(vfp_cmped_a64)(float64 x, float64 y, void *fp_status)
+uint64_t HELPER(vfp_cmped_a64)(float64 x, float64 y, float_status *fp_status)
 {
     return float_rel_to_flags(float64_compare(x, y, fp_status));
 }
 
-float32 HELPER(vfp_mulxs)(float32 a, float32 b, void *fpstp)
+float32 HELPER(vfp_mulxs)(float32 a, float32 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float32_squash_input_denormal(a, fpst);
     b = float32_squash_input_denormal(b, fpst);
 
@@ -176,10 +174,8 @@ float32 HELPER(vfp_mulxs)(float32 a, float32 b, void *fpstp)
     return float32_mul(a, b, fpst);
 }
 
-float64 HELPER(vfp_mulxd)(float64 a, float64 b, void *fpstp)
+float64 HELPER(vfp_mulxd)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float64_squash_input_denormal(a, fpst);
     b = float64_squash_input_denormal(b, fpst);
 
@@ -193,21 +189,18 @@ float64 HELPER(vfp_mulxd)(float64 a, float64 b, void *fpstp)
 }
 
 /* 64bit/double versions of the neon float compare functions */
-uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
+uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float64_eq_quiet(a, b, fpst);
 }
 
-uint64_t HELPER(neon_cge_f64)(float64 a, float64 b, void *fpstp)
+uint64_t HELPER(neon_cge_f64)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float64_le(b, a, fpst);
 }
 
-uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
+uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float64_lt(b, a, fpst);
 }
 
@@ -216,10 +209,8 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
  * multiply-add-and-halve.
  */
 
-uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float16_squash_input_denormal(a, fpst);
     b = float16_squash_input_denormal(b, fpst);
 
@@ -231,10 +222,8 @@ uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, void *fpstp)
     return float16_muladd(a, b, float16_two, 0, fpst);
 }
 
-float32 HELPER(recpsf_f32)(float32 a, float32 b, void *fpstp)
+float32 HELPER(recpsf_f32)(float32 a, float32 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float32_squash_input_denormal(a, fpst);
     b = float32_squash_input_denormal(b, fpst);
 
@@ -246,10 +235,8 @@ float32 HELPER(recpsf_f32)(float32 a, float32 b, void *fpstp)
     return float32_muladd(a, b, float32_two, 0, fpst);
 }
 
-float64 HELPER(recpsf_f64)(float64 a, float64 b, void *fpstp)
+float64 HELPER(recpsf_f64)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float64_squash_input_denormal(a, fpst);
     b = float64_squash_input_denormal(b, fpst);
 
@@ -261,10 +248,8 @@ float64 HELPER(recpsf_f64)(float64 a, float64 b, void *fpstp)
     return float64_muladd(a, b, float64_two, 0, fpst);
 }
 
-uint32_t HELPER(rsqrtsf_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(rsqrtsf_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float16_squash_input_denormal(a, fpst);
     b = float16_squash_input_denormal(b, fpst);
 
@@ -276,10 +261,8 @@ uint32_t HELPER(rsqrtsf_f16)(uint32_t a, uint32_t b, void *fpstp)
     return float16_muladd(a, b, float16_three, float_muladd_halve_result, fpst);
 }
 
-float32 HELPER(rsqrtsf_f32)(float32 a, float32 b, void *fpstp)
+float32 HELPER(rsqrtsf_f32)(float32 a, float32 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float32_squash_input_denormal(a, fpst);
     b = float32_squash_input_denormal(b, fpst);
 
@@ -291,10 +274,8 @@ float32 HELPER(rsqrtsf_f32)(float32 a, float32 b, void *fpstp)
     return float32_muladd(a, b, float32_three, float_muladd_halve_result, fpst);
 }
 
-float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, void *fpstp)
+float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float64_squash_input_denormal(a, fpst);
     b = float64_squash_input_denormal(b, fpst);
 
@@ -307,9 +288,8 @@ float64 HELPER(rsqrtsf_f64)(float64 a, float64 b, void *fpstp)
 }
 
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
-uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
+uint32_t HELPER(frecpx_f16)(uint32_t a, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     uint16_t val16, sbit;
     int16_t exp;
 
@@ -340,9 +320,8 @@ uint32_t HELPER(frecpx_f16)(uint32_t a, void *fpstp)
     }
 }
 
-float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
+float32 HELPER(frecpx_f32)(float32 a, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     uint32_t val32, sbit;
     int32_t exp;
 
@@ -373,9 +352,8 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
     }
 }
 
-float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
+float64 HELPER(frecpx_f64)(float64 a, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     uint64_t val64, sbit;
     int64_t exp;
 
@@ -463,9 +441,8 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
 #define ADVSIMD_HELPER(name, suffix) HELPER(glue(glue(advsimd_, name), suffix))
 
 #define ADVSIMD_HALFOP(name) \
-uint32_t ADVSIMD_HELPER(name, h)(uint32_t a, uint32_t b, void *fpstp) \
+uint32_t ADVSIMD_HELPER(name, h)(uint32_t a, uint32_t b, float_status *fpst) \
 { \
-    float_status *fpst = fpstp; \
     return float16_ ## name(a, b, fpst);    \
 }
 
@@ -479,11 +456,11 @@ ADVSIMD_HALFOP(minnum)
 ADVSIMD_HALFOP(maxnum)
 
 #define ADVSIMD_TWOHALFOP(name)                                         \
-uint32_t ADVSIMD_HELPER(name, 2h)(uint32_t two_a, uint32_t two_b, void *fpstp) \
+uint32_t ADVSIMD_HELPER(name, 2h)(uint32_t two_a, uint32_t two_b,       \
+                                  float_status *fpst)                   \
 { \
     float16  a1, a2, b1, b2;                        \
     uint32_t r1, r2;                                \
-    float_status *fpst = fpstp;                     \
     a1 = extract32(two_a, 0, 16);                   \
     a2 = extract32(two_a, 16, 16);                  \
     b1 = extract32(two_b, 0, 16);                   \
@@ -503,10 +480,8 @@ ADVSIMD_TWOHALFOP(minnum)
 ADVSIMD_TWOHALFOP(maxnum)
 
 /* Data processing - scalar floating-point and advanced SIMD */
-static float16 float16_mulx(float16 a, float16 b, void *fpstp)
+static float16 float16_mulx(float16 a, float16 b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
-
     a = float16_squash_input_denormal(a, fpst);
     b = float16_squash_input_denormal(b, fpst);
 
@@ -524,16 +499,14 @@ ADVSIMD_TWOHALFOP(mulx)
 
 /* fused multiply-accumulate */
 uint32_t HELPER(advsimd_muladdh)(uint32_t a, uint32_t b, uint32_t c,
-                                 void *fpstp)
+                                 float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return float16_muladd(a, b, c, 0, fpst);
 }
 
 uint32_t HELPER(advsimd_muladd2h)(uint32_t two_a, uint32_t two_b,
-                                  uint32_t two_c, void *fpstp)
+                                  uint32_t two_c, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float16  a1, a2, b1, b2, c1, c2;
     uint32_t r1, r2;
     a1 = extract32(two_a, 0, 16);
@@ -555,31 +528,27 @@ uint32_t HELPER(advsimd_muladd2h)(uint32_t two_a, uint32_t two_b,
 
 #define ADVSIMD_CMPRES(test) (test) ? 0xffff : 0
 
-uint32_t HELPER(advsimd_ceq_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(advsimd_ceq_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     int compare = float16_compare_quiet(a, b, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_cge_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(advsimd_cge_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     int compare = float16_compare(a, b, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_greater ||
                           compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_cgt_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(advsimd_cgt_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     int compare = float16_compare(a, b, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_greater);
 }
 
-uint32_t HELPER(advsimd_acge_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(advsimd_acge_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float16 f0 = float16_abs(a);
     float16 f1 = float16_abs(b);
     int compare = float16_compare(f0, f1, fpst);
@@ -587,9 +556,8 @@ uint32_t HELPER(advsimd_acge_f16)(uint32_t a, uint32_t b, void *fpstp)
                           compare == float_relation_equal);
 }
 
-uint32_t HELPER(advsimd_acgt_f16)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(advsimd_acgt_f16)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float16 f0 = float16_abs(a);
     float16 f1 = float16_abs(b);
     int compare = float16_compare(f0, f1, fpst);
@@ -597,12 +565,12 @@ uint32_t HELPER(advsimd_acgt_f16)(uint32_t a, uint32_t b, void *fpstp)
 }
 
 /* round to integral */
-uint32_t HELPER(advsimd_rinth_exact)(uint32_t x, void *fp_status)
+uint32_t HELPER(advsimd_rinth_exact)(uint32_t x, float_status *fp_status)
 {
     return float16_round_to_int(x, fp_status);
 }
 
-uint32_t HELPER(advsimd_rinth)(uint32_t x, void *fp_status)
+uint32_t HELPER(advsimd_rinth)(uint32_t x, float_status *fp_status)
 {
     int old_flags = get_float_exception_flags(fp_status), new_flags;
     float16 ret;
-- 
2.43.0

