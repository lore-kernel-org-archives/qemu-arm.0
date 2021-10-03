Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3027733lfp;
        Sun, 3 Oct 2021 07:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW2b0LaCHBxkP3g1VBVSc/CgCH/QHqEbsBapwKxdp0akP9wsM+4EIUSY0ImObX2KS63e7R
X-Received: by 2002:a05:6e02:156c:: with SMTP id k12mr6353178ilu.61.1633271969116;
        Sun, 03 Oct 2021 07:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633271969; cv=none;
        d=google.com; s=arc-20160816;
        b=YNWFF9f0cGUDTDEuSodED9man0vv4qAkYgYU+iUEfZDpwrftPSBB3gmw/o3Z8+Arfy
         30wLIpTsRfWzvAZW+sqBmJfEQS3NnlQFpnHAQ+LpbwNASwkCjcrU2BlM/w8lHsu5+sPR
         jtBEBr4ndmsx89JldCzAGWof+v8Ij7qvn8TfvonwulkWxl0TZ4xQIstd2+OwkF2o7hGj
         4L79fYslBDGweygBE/jBIbqwz8rNOeDpBUn1XoAoLB/Zw6hhDN442Dlc03MyizXLU5GP
         wkgU6XejzSsXOrwTP+nigIT8f6D3L9aawsWvoL7kr1lKZYyPZPtk3Xmvy+XbyN6JMOzq
         +DSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=soj3mlpq1XGVnYdRPbu8mTTZwhPlnAcdl32I7zHR/J4=;
        b=NASWCskFC9jFDY9262ogtHlD4MJoM1AUPIW9TOUVIIdNQUP3hVw7k9XK/qmfzKuTUI
         BiRdL7owv8Cj7kLpByM9rupJD8Z+ynlcItIshUr7OJFa1eCkm0+ZKLdsFuZphamfh4tf
         wF33NIY+DikT878hts338K2A9XaFOlsX7rB3IVEBDcXUP/FSJSDtzeCvKDh9aC3+x8Ip
         QhqRhcFeDCXMDRej4DkyhufOheTw8IspRcWnEdH9LYOQW8K3ZIF61YNQxy+7/8oK2GpI
         zJoI7456mR5IRDX9HxsgVSveZfMW+wd8l6iXBzqhY0Ca4I9vRvxtkjipm3GZvj91taWB
         mi2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eLydzjjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si9036265ilq.156.2021.10.03.07.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 07:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=eLydzjjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX2eG-00048h-EX
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 10:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e4-00043Y-AC; Sun, 03 Oct 2021 10:39:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e2-0006j2-Ui; Sun, 03 Oct 2021 10:39:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id j27so11272729wms.0;
 Sun, 03 Oct 2021 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soj3mlpq1XGVnYdRPbu8mTTZwhPlnAcdl32I7zHR/J4=;
 b=eLydzjjUSndvsp4Pc7Pg+frBLP8Hf1X3x16dY8TUxs7edOM64E4rPbU5EsNvajN5sG
 YY3jKswTGiYxc2CrZP3+o4DMfcX03XqSA/nzLlNQDI5KuA7N565qXPUYSecwenMr3LJ6
 RK3O0fMLN1/9Z+SKybuYgOHblrG/A8oPBoyNU2HJE7Ny2e5KDZRQZRyymkh3WF4xOCgX
 v48IVCsZU8GiUtaRrn0VM0WPc/rms5jdQGAaAn0yE204edwfQTZ5USRpN4Gfuo14PYVj
 cJEqWOs3yAEjuPfcWuZbOkruv2RfLPNVJyntk4oQbPmohf49Ts6CYn7R2lwXCD4Vf1Am
 Z83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=soj3mlpq1XGVnYdRPbu8mTTZwhPlnAcdl32I7zHR/J4=;
 b=IOyVkNBZ0e/rJyuuWRAi9YfOOq5kqDVp5xuZxD/eHzFN63Hh38V6T/aEIQT+eA606d
 bI8Abee0b85xk3hBn/tJq7oLFw3TC9WNxW1jhb6ZHjhpptiO3vwvrsInnekPWlHOGq4n
 +sr5h2nnlUQp/KEEOd7+Ut5KyMYeSi1i1Z/hWp9TR8whISdRrBa7F8V0WvLbnIwm0KSz
 vfm5M2lKaXq7wyudIyRDWERtbWnDxvLjvxR8OZ4tcY3/L0Zo4AEHEBF6COnAijSaGyyM
 JtoRN/9doB+Kvu+oDqvJ7m+x3baYJ3IIf7Ep2/vdOFSt6DIWrjaGUg5Uet9k98ElpjpX
 Txug==
X-Gm-Message-State: AOAM531sUMBueu5l1WluYNe+G7uck/fbwxNhXdwYVk5+m5kgaQzHjm72
 gfnD5yPFwN4C0vo8xPk2SI6MnwnPpRc=
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr13573772wmh.171.1633271953008; 
 Sun, 03 Oct 2021 07:39:13 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s13sm10472245wrv.97.2021.10.03.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:39:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Introduce store_cpu_field_constant() helper
Date: Sun,  3 Oct 2021 16:39:00 +0200
Message-Id: <20211003143901.3681356-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003143901.3681356-1-f4bug@amsat.org>
References: <20211003143901.3681356-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EJqeu6ApxnOl

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a32.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e8..b0abaac6f99 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,14 +61,19 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
+static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
 {
     tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
+    if (is_temp) {
+        tcg_temp_free_i32(var);
+    }
 }
 
 #define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
+    store_cpu_offset(var, offsetof(CPUARMState, name), true)
+
+#define store_cpu_field_constant(val, name) \
+    store_cpu_offset(tcg_const_i32(val), offsetof(CPUARMState, name), false)
 
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
-- 
2.31.1

