Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp633089ejx;
        Tue, 22 Aug 2023 04:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3blPtPMeiAf7qMKUG/Y+Wg96WTXfedB5ZjKuevHoap5pHkTdNjyk+7P1rw33gQ0Jd44VJ
X-Received: by 2002:a05:6808:151e:b0:3a5:a884:eceb with SMTP id u30-20020a056808151e00b003a5a884ecebmr10030656oiw.57.1692702189916;
        Tue, 22 Aug 2023 04:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702189; cv=none;
        d=google.com; s=arc-20160816;
        b=t9lxrX+HRlldiwRFll+n2F4XDtMQyUVGWjVoplrLJYgyOFL1lHkeJ2hbSbcR9bo0EV
         uc8UA+ZGuykPtbYLXbrcZfsM1YVHvcWHhZGvbkMcSFgMK7fmy5zRpxtQangVFXSJsRQO
         U4IDn1SVLX778ryGXR8iuu68W/gXxnjgpSfdca1A3KVqyZwkJo4tn2K5QtLXwulORM9a
         CSTs5VR5HrR4YTfPA5zi9cJkbmwhUPOv2PLfuEU2cQW+JYgu3jlR3i1kSIMC6xteILVO
         dfFXkrTWz/QLpFqIGYi8pJ1v9LVj5xEc4SLdX6eccY3ba9mdPVQYTtS4+E/HwQN8Xmxi
         f0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=INGQw2gZIfMCcsQ3FRMd0eCw/OR0PNFJSBfJGOnsR8g=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=VipnE5NiDWoYr2x0zPXh9+K8AFilwX2i+ZGBdQJxzY+8sl41Ca7TF+rXcJOVdZZvTH
         KRHr1U/iB4ewrciWDlTlKDVrnXYKYXUFDxMBX/oLdwAN89fnn9BAtDbAMC4RgmGWNJsv
         TypK+mPy3dxqVEYNT9jvmvMJCrT00BJl7MI8RAj9FYbKY7H5K7yuy7P8CPQDt+nEN4Hz
         /E9pPi1daNxiN4yJc2sUFDJEc0iBxbXCSUX5i1bXcSZpMxeuXd6vrGS+6d7/6YGOg/3s
         H1/rN7TPEUwX818v9t+v0Q1QELbPGzTdjlmbHg2mzpjBM4A+HECgXIRjk8HyjpXPIDiP
         Po1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNFIBzf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a0c8bc2000000b0063d76521e94si1077402qvc.351.2023.08.22.04.03.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:03:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNFIBzf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP9h-0006Qr-7n; Tue, 22 Aug 2023 07:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP96-0006D1-Ep
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP8o-0003Gq-IX
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:01:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fee51329feso17747425e9.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702101; x=1693306901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=INGQw2gZIfMCcsQ3FRMd0eCw/OR0PNFJSBfJGOnsR8g=;
 b=jNFIBzf1c7wg+qjAxvGMDjsDm1G6q0SQSGIBC+vnsOIIITeV40Vu21S/TlouBPiMnT
 fv249pSK0msRdnsJ0zTzx+iZYAXz6HaBFTEWeidOJFE90mqBEkjJ80Z+ElQaB4+8P0IF
 kvzefs4P7cmFc3lUiNfHMg8oS5ea2kyQSVEKO4LqD6NUhyPjNJeqS1LCl/UBZSqGErwa
 gdB+o3cq4jVUHGG986E+qwy01dwuKc5igLaVhiFp3yOj/bDDyNqwTATzrrvWhLzDfxs4
 CuQ1P0If+ig1r/SqUpZc3cpmU1gL6DE9FSB4GiVPYXXoTSc9pew8uMY6OhjX5aKqkV3D
 KcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702101; x=1693306901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INGQw2gZIfMCcsQ3FRMd0eCw/OR0PNFJSBfJGOnsR8g=;
 b=Fz0uDxz6GTJ3aYm8srqDVGBQ5CR76PlBQREOWAuVmjZsiJ1TfVu/MFe3K3Tic2ZnlB
 bAm8D5sEXzW0z8MZslJvLL1SO7e2HmJS0O0Wx0PNlD768++lHeuB63+zZQ/DpLq0OP7W
 1I7MnMNi2D5jgKxFpdtcF22grrkxljpcXn7+C4IYv3x6PUweuPgwSSmOQJP0BLTH77wg
 rU5Jj3NnyBxrcNberSux5VHZelpjEQPcLwOIdqIE9KaXEYyXR7FIm91+AVVRJJobnixs
 FjHdlMyYkf3Fbtgf9yIeIb0uBsFAcrSvdUQV4su+p1uiztOThIygmju1qGQGZdBn0qeF
 eKMw==
X-Gm-Message-State: AOJu0YxPaAaH6mAItg06Sdggcgpi9wOoKZ4hVl8CiAaRtYYC8TvoszWP
 XJ5yZUpEF4IEiDzm6UFPMW4Njw==
X-Received: by 2002:a05:600c:1da1:b0:3fe:3389:122f with SMTP id
 p33-20020a05600c1da100b003fe3389122fmr6632341wms.1.1692702101072; 
 Tue, 22 Aug 2023 04:01:41 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a7bc3c8000000b003fd2e898aa3sm653051wmj.0.2023.08.22.04.01.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:01:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 1/6] target/arm: Use hswap_i32() in VREV/SMLAD opcodes
Date: Tue, 22 Aug 2023 13:01:24 +0200
Message-ID: <20230822110129.41022-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: hYF/N86AQ6mS

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it instead of open-coding
it as gen_swap_half().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate-a32.h  | 6 ------
 target/arm/tcg/translate-neon.c | 4 ++--
 target/arm/tcg/translate.c      | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a32.h b/target/arm/tcg/translate-a32.h
index 48a15379d2..0c8f408eea 100644
--- a/target/arm/tcg/translate-a32.h
+++ b/target/arm/tcg/translate-a32.h
@@ -158,10 +158,4 @@ DO_GEN_ST(32, MO_UL)
 /* Set NZCV flags from the high 4 bits of var.  */
 #define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
 
-/* Swap low and high halfwords.  */
-static inline void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
-{
-    tcg_gen_rotri_i32(dest, var, 16);
-}
-
 #endif
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 8de4ceb203..0e59b03ff9 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -2906,7 +2906,7 @@ static bool trans_VREV64(DisasContext *s, arg_VREV64 *a)
                 tcg_gen_bswap32_i32(tmp[half], tmp[half]);
                 break;
             case 1:
-                gen_swap_half(tmp[half], tmp[half]);
+                tcg_gen_hswap_i32(tmp[half], tmp[half]);
                 break;
             case 2:
                 break;
@@ -3516,7 +3516,7 @@ static bool trans_VREV32(DisasContext *s, arg_2misc *a)
 {
     static NeonGenOneOpFn * const fn[] = {
         tcg_gen_bswap32_i32,
-        gen_swap_half,
+        tcg_gen_hswap_i32,
         NULL,
         NULL,
     };
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 1a6938d1b3..39a42611c6 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -7612,7 +7612,7 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (m_swap) {
-        gen_swap_half(t2, t2);
+        tcg_gen_hswap_i32(t2, t2);
     }
     gen_smul_dual(t1, t2);
 
@@ -7700,7 +7700,7 @@ static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (m_swap) {
-        gen_swap_half(t2, t2);
+        tcg_gen_hswap_i32(t2, t2);
     }
     gen_smul_dual(t1, t2);
 
-- 
2.41.0

