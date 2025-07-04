Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253762dyc;
        Fri, 4 Jul 2025 07:29:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVO3jlLxqKINy4EQMgp3efvr1OipYb4vYXorXx96dRenotrqxUyO2eYnXnqB08/nQWLQQ4et67RJ4dPuw==@linaro.org
X-Google-Smtp-Source: AGHT+IF78xUz8C5UKWKJuKyH9Bbe4RnTmVI8qtmp6ftpcPT/LtoYX6KWVEXvgLLka0FXAgHadxPe
X-Received: by 2002:a05:620a:4449:b0:7d4:5fae:ca17 with SMTP id af79cd13be357-7d5ddb5947cmr371546885a.22.1751639354862;
        Fri, 04 Jul 2025 07:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639354; cv=none;
        d=google.com; s=arc-20240605;
        b=fOPzLO8qkb89y0fjhe4cILXMeaZx++NRjSA/TuN9VzzKdN4Q+dOFXRb1pc2JN0FZv2
         3pdPNsHqFsgKEkiKbgVasqtz6eKc1Yth42rROafPPbxlHWJQQCjckQ5uPveoVCjPtWfI
         dqW2kKlCKXERLlggsam5V0Sx/xQnXCYES8wPAYKbt2iQ3GZfLpvqZmI/lp7HZqeAU9Y2
         qmdVpJYRpLbe3CS8NpGjzCzfnndOG4R/ctGqQbuaFhHOSq416vNdkO9OB5ZSurCmVm0b
         qZ8EoNgilPKAFPB09ZPz/d9D4idYvUFwWlwrMQp3o8H+HFRKLn0yP3ib+E2KRWcXHv3i
         bamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GH6Ad5BaJtxdBkiinUY7/X5vKVIV/ggzsySF13b5Img=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=NYXApZpjW87acjfttSrAIPiwbvyejbfqrvYceqHptgPDWbJmkCpsltwRia+2wbOUHW
         GTRwPEx9etbqhWU0Hkp8FtaqsJZyAJe6Dh75OdCwMbG5UmfeRZiPCdBJk9LJ9mZvr5Xw
         ZvkeklBMR00qeAGRwHs0ox0R5JY9P2ZWt6nr9Kl8FmhfTiPirGMzrHi7Zy9/NrboL1RH
         p3GzxgMaCQqygWUVMnTPPB+1GIdP9al2bSlQPzbui8cIL6o33HbM0yzNgCyiYtKtXBIi
         lvzncd7hZSxeHksr7sI2OeZjShbrlL7cANpKNptB6lJFLx6CU34qXsYUQArxc6ns7yGr
         UZNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzQHZiyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbe95e82si244144385a.194.2025.07.04.07.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzQHZiyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLZ-0003SV-9s; Fri, 04 Jul 2025 10:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIK-0005Gj-Op
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:43 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIH-0005kV-Ho
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:40 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-73a44512c8aso340561a34.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638896; x=1752243696; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH6Ad5BaJtxdBkiinUY7/X5vKVIV/ggzsySF13b5Img=;
 b=UzQHZiyHkxy4OhCPIdANQp4KSck4L3HWNMrE22kSyxhqPhsb65usz6yl35qy77Ivjn
 6AeVp/KpmHXnOLwR8ZfR7fuwbxH9JKM2AlBENUZnFqbSfjYCh/mj7iDiKs0WqfL2AXTL
 6l4NTXx7wRc1QH86mepDEqQQOd2CDBS8Nwr+FQ+VzC0pgq8f/wp+5wnDINpsu7ZE21x5
 fmIywxDG+y5scrhM1GL/By5dSrKQya/gkF6rd9PXxa608e+1Kk264Mr8qn4N0FqixqgS
 6MkbmQWg7JzvFP9K4hFx2NsXZqW8xdAdLTex/9GHmxBde205bvkE9V9ReAWn/XzkVo3L
 DjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638896; x=1752243696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GH6Ad5BaJtxdBkiinUY7/X5vKVIV/ggzsySF13b5Img=;
 b=PPP/7B2ZOkrg9gGqErsRmp1a4HSd/4UtSG87xRyz24QcCgRzjS19iBJusHbGjPTHRX
 IZJ07B+Y37f6lUPkyCN5ye6MKoKv6x5jIZAg3u9rpbpaTJSksT64Zc5Fv82HYz2ouZsK
 vqv4TIPzKOfip+s5w0GZ/mQ6Cs61W25uIVpcHYL9K2Q31HmQN2bMQq0jkgME3a8BAUIK
 qSHmOEMmXMxXxhxVWT6Z+5T6XpxTnfznF/oqtKN2+XDNaIoibmCZdjeETBAU6KRT49IG
 x75TtEMLg7c5sXePZK3CzanoU6G14BlmD7TRCw7mwcvT1dcF4H0NkzMZF/imboHGC+Wx
 yc6A==
X-Gm-Message-State: AOJu0Yx0bt4/4y30raYYEhFJLGRZLumuGIX9evuHfe8P7WZvUt72fAUj
 9uIQTBUYCmc+hWEWPl8JW1p/7vrgsN+oLzEbGYvzBgU9e2nb/wHhok2VmHQDuMhs+0LxquZWidc
 U5ZKf28A=
X-Gm-Gg: ASbGncuEx7tzKtwOhCRyUAFh0YUEIesyknTdfFX8Zud96ApwfwuvmgDp5vxXDLph2rY
 R8J7mouFJVs7gGJLZcAYTURV3m+zUgsiqmtwuWDMJ7P3eiktlDE4hug1Oa6HX54Iqbvnv1cPShA
 gZBUYaRvEiiIqus+0MmQkyv4+8f5KIXEXAzWiDqZ+gfMr3qMwimliqTJUy3p8N1PTf9QQ0YBSxA
 36uMStN6ZanWGDjoZ8CAR3sA3/MSwIIeoSb6cUnW+6/Ld6ip6IFlwy8ZgfwvU4KbEIL8jV2TKpp
 QAaqeve1HTBZoLXxZgVH3S8gB36kp3hRkNBLSqen7JESeETjnuv7NUSj3Ed77ClLEphILepHtwF
 C3nJGaXwuQsweIteOjmPhcLQeqdWMkuLKu7MHLocX37Z3YUAA
X-Received: by 2002:a05:6830:2c05:b0:731:cac7:364e with SMTP id
 46e09a7af769-73ca49fe83dmr1546684a34.22.1751638896224; 
 Fri, 04 Jul 2025 07:21:36 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 020/108] target/arm: Implement SME2 MOVT
Date: Fri,  4 Jul 2025 08:19:43 -0600
Message-ID: <20250704142112.1018902-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nQmGTGzrzY9p

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 13 +++++++++++++
 target/arm/tcg/sme.decode      |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9f25273992..797035e289 100644
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

