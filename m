Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775265njk;
        Mon, 27 Jan 2025 15:28:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9JKSTNmN/39LhPKLcskCjKHh/H+ODsv3jxW3kVgkTs9dwLLg8KX7Svc2pZGAIZiPIkVvJM4CWD/ZIBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFHE0WQgSoM7dDPYeXHJITUiEg+yj1qiA/wRX+pImE8cmb3QYoXfwKxQX2kW3ThoIYIk4f3
X-Received: by 2002:a05:6214:5191:b0:6da:dc79:a3c3 with SMTP id 6a1803df08f44-6e1b2168e65mr667328726d6.5.1738020514027;
        Mon, 27 Jan 2025 15:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020514; cv=none;
        d=google.com; s=arc-20240605;
        b=TKDUp04ZaRRtIbeuxMCbHgq2VEsfOx3rj8ffxBgRYWMCW2Cj4t2k71D2n3l3Z4R9jy
         a8mTQxfX3GP1dLHlOTwlW3zDMikqrIHDSDCuHUMJCyoXXq44tS7ztU8SkrlkulEorUFJ
         9+lZnJcwEKQUdj2TMtlXJemy7bYqnm+9Xtepls7vmN6NvTkglNaVICmDhM6eul3o/QdN
         d4xoDET8GYLowoUgZ4jd5vV5+Hbkf6x3qwJzQ+cJwSiRzG0FnDPPYhfmI3uyysy+ujPq
         MEeZqCwZoRUwTNeuH/hwxAQwwYGX8tBT5rhfgC0fRQvjyAivZiqN0Lxc7gs/xDTEzjbD
         dYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N9C9MHfxTmFfsV2AIVVMljAT4X/LA6EAwI6JuJhSI5E=;
        fh=igfKki9zV5i/IfmDn/Sk23mhfaq7a0iqiBvPmqdBsis=;
        b=hFHg7MH0xbgrIwvIFBmTqRk5Lpm36gnDn4KE+RdJd4bEVeWAphWNGh94qaYvhYg2uI
         Ck7IfpAU+8ULxjPGf5zqqYgZMR+S//PqSS+K24taCdJ/uHOgglLJ7W7PLI94jcRFLstW
         p61w9U9Ky4T1IZfG0J4opbbWecgVdHFr5aaUxEgT/ZaGrX1rjOgPA69ugGigt6qozbKb
         Gi/glZZwtUSb8OFpH7cecfGLH3KK2YYsFjzwHYM+UzLcog2mS77nZdXcUVocB5Z1R7Gt
         akTNHHhs1zQPirsEGUyiB2kcnBQWxGTUmhNGqK4s9Xo6fsUmya9/auo8ThaUjfnrJQi2
         qgtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iubO/aNM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b82d26si117665521cf.337.2025.01.27.15.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iubO/aNM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcYUx-0006VU-Jc; Mon, 27 Jan 2025 18:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUo-0006Pl-QF
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 18:26:23 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUm-0005cO-1H
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 18:26:22 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so8527832a91.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020379; x=1738625179; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9C9MHfxTmFfsV2AIVVMljAT4X/LA6EAwI6JuJhSI5E=;
 b=iubO/aNMQtUHz0F35lKgY41nw1w3E8LIH37G6AGVfGnQ1tW3DRqmIMdJpFH3Yhye08
 H1JMteBjumh77v3y008ax6LfyKW0U6YRmlQf/lDyHiqGWSih8/gKEWb8V5ACKobIghFq
 Fw+Wj0jebGEU/+AcomWcaqTNMt+5EAe5Q/caY+XMUDDIbYJ86IQuAK09vUr1QDHdODxQ
 yGlQE7+vG4alL2VqQonXPv/7T8N7Xoq3HqcF7lRoS0NvHLPVEoqOoW7daf9BsumwFghh
 26sYW9rVInqiIy21KGA705rDm/2k6HJAD2MUcFsnrnid6EBlSl/rBeP1NNMmB8gu3jan
 HvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020379; x=1738625179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9C9MHfxTmFfsV2AIVVMljAT4X/LA6EAwI6JuJhSI5E=;
 b=pm/qf3+Uv80ds51GJrODM/gS8zMyuyb8iVp2dAWCxWd26ILD60aawCS0j6bNBrMeFg
 MLqap9VY880DegUhI9Uvn/9s8aQsxYttHTD8fHlXo+LMVADRl+mZB5We41nF28cegtyb
 fRqZTYgPobYjoVGHXC9S4wzYlgvGtAy081Wmn/9JFDlzlgjEish82SH6BfYZDR/+za2F
 dYjdBwmzTCV4eV3Ylfg0zuCLeV3YkNd6n+MxYxbVrgp1YrS7NW8W+JoOMbf1C2YcTFeB
 J2Gzmu/0DsT8e7kPBMy8Dn1Kzi7XDcBE/60V898nBBns/nFy1ql5FRKR2CNSOEf4cc4O
 Gl9Q==
X-Gm-Message-State: AOJu0YxHPMBgUYjG+Hf1slKn4bFmkHx1cboXXSde104gRCJtYiWyEFWf
 BCxc0rgnuWrjjiDiPgDYsY4tjzh+e9JTE9Pz6J2x6R7GxenI4xNV0Gj+LLUJD3oq1WQvF8ONA57
 5
X-Gm-Gg: ASbGncsgp99s2NlpjnASUEkFouFi5xg2IqcHiqOB95vx5xyi5Iw9vCANCB5y/8Co0Iv
 OyweX8JCc1e8w4jVGpATdWq9FCZXdT+N3VQZ9in8lI1sOKfF53jABcumW60Qm7IicbtLhBnGJr+
 xaSBdNDruQpBcHkKsXucO9Mub0mz7Og5ZMsuMyGID7SP+3pU0zjC+BGYNoycC1w7wwGueibdq8x
 l8pqSuy6pRyZooumOWmeJuQFZVWHD8pL+WS3DJpQ0tktaZyWQ62K7HWPB50LlqS5TG193zfTUCX
 SQ8VyYPJNQUfRnNGm/J1nUf9zGcOL49F92zIOQU=
X-Received: by 2002:a17:90b:258c:b0:2ee:c9b6:c266 with SMTP id
 98e67ed59e1d1-2f782c71d97mr62404058a91.13.1738020378764; 
 Mon, 27 Jan 2025 15:26:18 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 16/22] target/arm: Simplify DO_VFP_cmp in vfp_helper.c
Date: Mon, 27 Jan 2025 15:25:58 -0800
Message-ID: <20250127232604.20386-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4UzoDAqK5X5G

Pass ARMFPStatusFlavour index instead of fp_status[FOO].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index a2775a2e8d..4e242275e7 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -487,16 +487,16 @@ static void softfloat_to_vfp_compare(CPUARMState *env, FloatRelation cmp)
 void VFP_HELPER(cmp, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env)  \
 { \
     softfloat_to_vfp_compare(env, \
-        FLOATTYPE ## _compare_quiet(a, b, &env->vfp.FPST)); \
+        FLOATTYPE ## _compare_quiet(a, b, &env->vfp.fp_status[FPST])); \
 } \
 void VFP_HELPER(cmpe, P)(ARGTYPE a, ARGTYPE b, CPUARMState *env) \
 { \
     softfloat_to_vfp_compare(env, \
-        FLOATTYPE ## _compare(a, b, &env->vfp.FPST)); \
+        FLOATTYPE ## _compare(a, b, &env->vfp.fp_status[FPST])); \
 }
-DO_VFP_cmp(h, float16, dh_ctype_f16, fp_status[FPST_A32_F16])
-DO_VFP_cmp(s, float32, float32, fp_status[FPST_A32])
-DO_VFP_cmp(d, float64, float64, fp_status[FPST_A32])
+DO_VFP_cmp(h, float16, dh_ctype_f16, FPST_A32_F16)
+DO_VFP_cmp(s, float32, float32, FPST_A32)
+DO_VFP_cmp(d, float64, float64, FPST_A32)
 #undef DO_VFP_cmp
 
 /* Integer to float and float to integer conversions */
-- 
2.43.0

