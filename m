Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp613676lft;
        Mon, 20 Jun 2022 11:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1E6wOvelYcIsofCrT51w41xCdTXvfmDVhDzVgCA3q7dfOQEJPxPkCIqKq5BVVD0a5F4fX
X-Received: by 2002:ac8:5ccc:0:b0:305:cee:f488 with SMTP id s12-20020ac85ccc000000b003050ceef488mr20874384qta.341.1655749455010;
        Mon, 20 Jun 2022 11:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655749455; cv=none;
        d=google.com; s=arc-20160816;
        b=w1WggHXt9OOJn6T1D+wGhrHPFp6/xHwHDCeN8v3Pe8I8uR+JWp4qZArqoDtGO6KrSI
         ZUchu3TFqGywdbdpXu///sBVjMXz4fCaoOKY1Cnw+bYAhLVLGg5UDMtK25SPFLS6O+qc
         uzYMkokw35OzAiQK+0krIAR1zLZ7O0KME+OjgoSPuuq4ArFWta3aFzSLmEYUDitr96iJ
         4SSIL/8rUwpkxCWuFMlZUwKpn97xws6+9Ce6adgecGfWXhh4HbspJA8IpaZX8Yl9LGzW
         j3ZJxbr47+myXl33zMjoUWJzC48usfv3XXflWcoZpuVabjgmA/BPhQ8X2GZ5rF1iRwcM
         6m2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
        b=jGqyGpIYy3s9IUbc6ayv3jqPX5A7RqizZgKVF1PAR2z8bfFc4dpbF0oLFGLv4btalR
         tvv/eLIkjBlNHOWzlzAWt5XQzao4+NdZIFHMN2vg6oU8mUybbPlFAXjL+6XjZ4FG4Ja9
         ycnpJSWhjMJ/voGlD365ydyQiXZi8G09cWcEpwbHINxLzmoxqo9SY5EsP0B5h4DgV+Sf
         r4L17/O6FVsEHsS3bge/dcMLagxcI05v0rv/1hAA/RQezT2BJg7LZbkD6esfQ2CE7xKf
         DfiVu9ael9ZxJa8TPwuL8mFzYWI1h6tcWn9OCbuGJcIYT6O3BgNzkN5MupPE8uQJf3ZG
         MA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8I08ZmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u189-20020ae9d8c6000000b006a6c52e0432si7188477qkf.459.2022.06.20.11.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u8I08ZmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3M4M-00044x-Dx
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaE-0006Lq-Qv
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La9-0001OY-P5
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:06 -0400
Received: by mail-pl1-x632.google.com with SMTP id o18so3325702plg.2
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=u8I08ZmQHiN0abr2TODL9N9U0pf6Q2oWYJbMWtYzItBNAJu/qhEEKjsE9+kyJe0hqz
 y/0yfbSjzK86pcuXlV7O/dkC18oy6+vpfDYcQpzPeB706jwytkhjb3SY13PmGwAFlNob
 TNAdWK8zEZRUM+DHC5o9GEP4WSTlHXGF6vfgxoBT6r1+B0talnvYe7/EVaf1d/VgllHg
 BxiqXb1nTc/7tPnlG55ov1krcncxMsKr9JHcIe/Cv0zfJIE779yHVriiDBIuZdOSMyyc
 r4I7sABvRzFdeP0tbsSTXhuJXtqxDDitkBHLSnHdFfPxhNUDTqCKL4sItV5h0FI7jJim
 V1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVA+HWK843xLMqB7esE5JHN46OyQAAXOs3TeUqe1TX8=;
 b=j3rnPi3ui5Eu8zN26eyxRpXy7xvAARYHOzvqp0r32bLD0S7M1OutMPaYTMauei22z1
 2OdsI/YpjR2MLA0HJxkn2QD7mGMd4fUItzEIl/C0UuhHFwCXEKe7uXT7sO47U1nvjDSc
 8m6CAJ2bArBgQfljSQFpV302K+bKWrvwQ0QBa2uYc5u3he9gR97vMDJ87qoIClMxlgNp
 Hpf6Og1lCpYSIT6RhxU+gUmTF9iBZZFmbFKAPy/z4z63HzevJtKxiW4ExKro+5W58wDn
 Mk4jgNJOIxFYZG8CL8yQ+1yqrDH9tUHXM2jMfoVDMPdsPHLv+us0bWJsgrqDPn7lGtdJ
 H1SA==
X-Gm-Message-State: AJIora+lvL2iXrxI180DjFQvGZB4k29vs7BP82r+3LIOwr9iLzzp1vaV
 v29GL++3ub4sVKXUe2MXEDwroO1Uipc+Fg==
X-Received: by 2002:a17:902:d502:b0:16a:2cb3:74eb with SMTP id
 b2-20020a170902d50200b0016a2cb374ebmr3859406plg.160.1655747581040; 
 Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 28/51] target/arm: Implement SME LDR, STR
Date: Mon, 20 Jun 2022 10:52:12 -0700
Message-Id: <20220620175235.60881-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0cZb1/bHwGFv

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 978af74d1d..c3e544d69c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -220,3 +220,26 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, s->svl, a->rn, imm * s->svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1

