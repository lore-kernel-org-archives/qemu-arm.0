Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1780365njb;
        Thu, 6 Feb 2025 12:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3qCgZkfgELdupPjqSAFF42M0T7aZILR/jF96SpXnPafT7oaM3lPORoMKQZBI89ang7BYGZFiUKax05A==@linaro.org
X-Google-Smtp-Source: AGHT+IF5PkLjAo6wx4qdf+x7GZymuHUMiz/Tla1w/cBmIuStYErZ7VzhGLNXEwlmYrMtm2U1V2xC
X-Received: by 2002:a67:f882:0:b0:4af:fc7d:b74a with SMTP id ada2fe7eead31-4ba71f566bfmr2564580137.2.1738872169876;
        Thu, 06 Feb 2025 12:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872169; cv=none;
        d=google.com; s=arc-20240605;
        b=W9CtGkwSGxlTvjSOjcT0vNS6MopvpcjKseZXeeasbGXA92LunXQDm7ZgxXOa18yNb8
         AJQdOZzu1OSPXO75c+If72mW4+ewM8fRhVf2zbwn1CHk2S6qmEFMXMLXPFft+UUBqFKW
         ZWJ9wDzbJhKXcAhmpeUJ3HXSVWXvytmcyK31hvGbEMfoWwaG/Y6YV1VKqPU0ZckVh1VY
         qGoayUQPtWlhg4/OA+IziXqh6tlvc7FInUfmXcRzwgdsFvAHVbeojGxIt99EKkL0yO5T
         svGNfChstX85wBjHDA149Jh2DmdqkLhqSBqUC4/Uj+ARQpIeJulDGJ/+idwjl5HDs93p
         xldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tyvKoN2K28yYY2BAVom/mjyQ4IAay4Sv47eAXtGmzGo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=DitElAyRM4xXoWvSUkfl5h0o37MsfrQS7vgfIW2yc4ZtvcaNzXIfg+O1LSlKwUdAZ5
         p1pe4AJb7YurbHHKujzNU5NMsnXnMWPELDA82+eqf6YjofSym1GD2A7ZGrbMUMf5Ul6x
         YKS3G2g+R2TiuFL6fniFB/0AWs1dyCqJWFJ0Ltq6zEwhJPCHGTszDxn3mumXCk3I+PrW
         FTFPne1xK2/rEklI9vSK4F+0NKgUxghEu+/xP2TD+2Bww7B3t1g791jvF5xPndevgrKv
         QnhAj5tOgFTCZhILB1DHvkrwnf6dRLimP8enJpsl+cpHNbmNrPXfJxTJOfT4eV0VESrM
         YcPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SNUaFVP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba7765d594si411845137.139.2025.02.06.12.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:02:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SNUaFVP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80W-0007QP-Qg; Thu, 06 Feb 2025 14:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80C-0007DK-2z
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:32 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80A-0000Vv-Fo
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:31 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21f0bc811dbso36349485ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871849; x=1739476649; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tyvKoN2K28yYY2BAVom/mjyQ4IAay4Sv47eAXtGmzGo=;
 b=SNUaFVP18IgfcP4te5wCMAoMXCXJAhWoXsYHorJlG9i4WpMS9eGa3LE47Z2mWfIzYI
 mLlREqyLFMjJJpCZwUrqbbkIJFMDuKrbHSFYxp3SzECI+1UP5b+n6rnCtIyPQpw+q048
 36fE8UfZYdMpiUxaorD0U6djFSV/+aKz3h8Xm2iAbsfUJ3giXDWH4o2G1FCtiCwtjHwG
 g+9KsD3q1WQAtjlQUackkBr00s4SpKJJ9aPCqCt/oPQk3gGA8aNZ0f7boZW6DrvwLrhD
 kXQKXu+wokIgxXXMtUV8T0hj+MNJoaRUiJEgZO6j5bP2j8zzWp9h/UZb6Dgla+yQIdhN
 whVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871849; x=1739476649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tyvKoN2K28yYY2BAVom/mjyQ4IAay4Sv47eAXtGmzGo=;
 b=gl65ICUeoruCMvL+JL/l4Sw3jqwPeb53r5MNijFuAaMKllF7U19ne3Z5HpUJ/yNcod
 3DHx26lcF/QOBmKtIla0o2neepa0DCOoJNdgFq0dxI04DiFY5aM6MwJ74cw7d0Ylq4N+
 nM4BJ28QbsYfR+Z3Rt1v6wtnDVUyBVB/pAVv8S2nm5GZn5/qoKCkDYTAIMma5Diob3Ri
 UpF0Xc7ALDMGj7twMlScZkAag7MBxZbl7JGdcKbtKmbWhpvLUIzXKE2VEsusAEMGu67M
 RPGf1eF41XiBtCG+0S/pCgyMgnaSLZSCzz5aIeCPrdcClKL40YLF+0jyJDphmeF+qDpe
 cDUg==
X-Gm-Message-State: AOJu0YwCQPb6f5M7DCFNYC561vvkXl7rP8EDl1tGitCPZ14FB36Ha6pw
 CpCJ+QliYiXiSsoSYBCNCqrt2gMZZpWT2ZZNB0O6OImLVVfvMZH50KmddPboFdVH8JjiiZo8Ice
 c
X-Gm-Gg: ASbGnctjkDbq2DpGIiDfhzTT5OLmqF8REUND0+KpgKzHgxWiKl/uwBZQweomP5X22E6
 dOjqL4NgQF65WjF6hzB3WvtwN8GRD85ha7lI5L7DOw8Xo3Gg57bjJvJAFLZPeQwBRrHKKO+Yiq8
 KC7fSA1j5cg3UwgcMIrMN5stfOHjomw8TsPbZljiKOxExXbcYzJV4uIJVomuBtUNPipG9S8VGZQ
 peUIgvbebsnWzKbXBoWttB7SnKNoYRp3c/dHxYLU2PeAzr/M7b/CD8LwpmiWmWv1uK80QemPpXz
 zHcF36DhD3y4RFoqpvjlSc8C/5WmMeem49V2Wc7LrxXN3BY=
X-Received: by 2002:a05:6a00:2345:b0:728:f21b:ce4c with SMTP id
 d2e1a72fcca58-7305e3e0accmr440742b3a.5.1738871849178; 
 Thu, 06 Feb 2025 11:57:29 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/61] target/arm: Implement SME2 MOVT
Date: Thu,  6 Feb 2025 11:56:31 -0800
Message-ID: <20250206195715.2150758-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: 4Cqh3JMX95zL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 13 +++++++++++++
 target/arm/tcg/sme.decode      |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 8b0a33e2ae..13314c5cd7 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -210,6 +210,19 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
     return true;
 }
 
+static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
+                    void (*func)(TCGv_i64, TCGv_ptr, tcg_target_long))
+{
+    if (sme2_zt0_enabled_check(s)) {
+        func(cpu_reg(s, a->rt), tcg_env,
+             offsetof(CPUARMState, za_state.zt0) + a->off * 8);
+    }
+    return true;
+}
+
+TRANS_FEAT(MOVT_rzt, aa64_sme2, do_movt, a, tcg_gen_ld_i64)
+TRANS_FEAT(MOVT_ztr, aa64_sme2, do_movt, a, tcg_gen_st_i64)
+
 static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 {
     typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i32);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index cef49c3b29..83ca6a9104 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -39,6 +39,11 @@ MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
 MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
                 &mova to_vec=1 rs=%mova_rs esz=4
 
+### SME Move into/from ZT0
+
+MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
+MOVT_ztr        1100 0000 0100 1110 0 off:3 00 11111 rt:5
+
 ### SME Memory
 
 &ldst           esz rs pg rn rm za_imm v:bool st:bool
-- 
2.43.0

