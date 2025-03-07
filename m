Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2398608njm;
        Fri, 7 Mar 2025 11:05:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjaunTc6twpJgEmQr3WPVJW68CC4dqbJKFtMbZ7g2EEPOeAM52s1EsD0w62OsTXGccMC+sG7Cv/N7kAA==@linaro.org
X-Google-Smtp-Source: AGHT+IGd/7XUdX02/i89VKXIo64QaZtx0880jligtLQiUM6XMH28ET1rwaMR3m61M3bvK3f9i8uo
X-Received: by 2002:a05:6102:2927:b0:4c1:a049:27c7 with SMTP id ada2fe7eead31-4c30a5ebd0bmr3395564137.13.1741374318956;
        Fri, 07 Mar 2025 11:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741374318; cv=none;
        d=google.com; s=arc-20240605;
        b=CQehVIXOaYcv0ocBcMvZeZf8Xwj+jPHAlhoMtdkT+YPcfEi/KZYD+nUB3Vpa4Z8c7b
         QBAwTz1NCj/dVY2TPlfXBjREXiMOsPc3FBC7AtG8tZZuhIgz63Zea23bij3fQrjRosmU
         MaUfH7Hb6q9J4ksB0GOlLiksIKArvZ+xtUHyNk75bA1oZ039TP0HWDC6/q40ZHKHEe5b
         acEvQqZj2WUNgohlsXSvcO0MFDv+eNgGCLyH1Ei0OGmjbem4pRx0d73nJvKBj0yTTQuH
         4UKBF8x2y6TsjjutgmeUjTmQ3/pUJZRbKd4fBr+GrBl1TOd0EgLJw4NIkCSAU9Cbd05O
         hsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z+zk524gYlZFNpfvm3PBpvMRD+qrtD7WnS20Nzkpdic=;
        fh=quVKJN+JogokNzsp4kwoA7mheGRSBID5PxcC4hooSO8=;
        b=dYnYSvEda+fwswTHuJAXBk6awA/9ZBZM90nCSB2YKEHUWBeMHwAGE0KM3vAWl5CAUN
         qwNRa1l3vXwiKLDfdCLhkBUIhqqhVp7cdE89iarU2q2cMTkQ4t4CrOnwmSLo3ZbuPf6H
         mz0zYiQrBKXT8XkEYlE7SlZxnPU6YNhPS45/Ls9l79Zk+aiFuPg526qOj2bcK2bGjGUv
         JMlV0ZPqQ2JeVCsrkRf6pstRBX5lyh8C3juYRY3gtyz7ZNbjEpKgUvpXobCMguML0yR9
         Ga7yj99Qq2N9Ke94pjXhrmksIGtq59kq9DeJeW4Yxh+fem5r1mZLYvv1vxk5ymrklSpD
         oCWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF65nn8q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbcc2f1dsi1062846137.381.2025.03.07.11.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 11:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iF65nn8q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqczr-0004CK-7A; Fri, 07 Mar 2025 14:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqczh-0003yE-Hy
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tqczc-0003hn-KE
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 14:04:23 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-224019ad9edso55535515ad.1
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 11:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741374257; x=1741979057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+zk524gYlZFNpfvm3PBpvMRD+qrtD7WnS20Nzkpdic=;
 b=iF65nn8qlykQ1ErcjKqIeV8dTlO+jAHhvE4dHd0cKKmiPRrwqEqPbf0ypTNNQPhZJI
 zaD2ESBq4j/UIZFt7sVfduzA5W+3pKZm2p2bKct7XP7VblDtIThuFR5+Mhik8VGnzhkQ
 CJNtDUW5jqOxBhUs/yUhYc46ZIxHEvpG9P/y1kUDVr+OpReee3TRMEQjpmhRoFH1iTuz
 jpw16yR3IE9e3P57JIQxfboDaY4smNQ+l7Zp7nduesZ6iEmI+oBJWH/zgC+lgQYD78Xl
 j9O8qagz+qC2rVCrnQ358Up2c4LMuJuMdG6hscn6GrFvz5oc09k1kYR5NWd6FkE8KEM4
 1igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741374257; x=1741979057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+zk524gYlZFNpfvm3PBpvMRD+qrtD7WnS20Nzkpdic=;
 b=Pj8M2122AYzcFeIOf6qR5v/BDk2+XIutDIYq0yxqcqnjaRQSgyKDqI/QlUKn5CG6CP
 Su5165o7uezuwTZSJEaf/YSzoDtTrDsb+sQud1VWLpqfudRhComsBdp4CAs0OWdXv3CJ
 M5/0wqwl/befkz9EBm8Fc3OyrGSIqvOfZYTLTsgDxqsr7KXVH1fqQE7FwquSC8egKx4N
 6UMgYDyIxV16VJyHpK6hLgdh0HqdgC7JXcRWsFAJcDNdVgqH2IKv6rvLIHFo25fM5dXm
 7q6JV6jOHGl3bBjUa6ynI26HkmjUPf6Bh8+9Fjav8HdRvSzY/qYay1eZT5zZjufiEvFx
 kQyA==
X-Gm-Message-State: AOJu0YyNh1JAg8pY2vXOE956nSxj5P89K1fbUNDc7XRy8yJ5V/fKR1oa
 rwbBbnts+vHcli/2/AWjcL4e6YvufHMxVON0DDAu2+50lhk2UJD6gLj3rt6ZQKVufIZNvJbhbF4
 e
X-Gm-Gg: ASbGnctJGC9KQOeuomf/d+4tOWmS+PILdHgLb6ySQPM3eYeaIUR9pxruSe4sebySqQg
 hq1PIS2+DBtVdvKjqFsV2wfj3G2LOaK6tQ9jwrwNmelW0x01P9n0iQDAuzEiHO8iODvYgBzXSzv
 RPUN7g3FoL+Wn1/D61kkBkAQ7Xe3yXCchGqi+WQr29uzrR8+HoOHOoQIPs9P/AG2K+yLjEkGHh2
 3MTf1ciOW1je4elj1w+Zga63nSzMincp5FhT7q66qlHhDFbZmRGRfkvhrLGG9QlemZSBsG1MvfZ
 UjEWFMLkDAuRwvNkjRbmNgOCXNjM1SK1horaK37Gx6aGeOGlNpEX0fqtsJOAiPAWx+dM1lMWm5d
 A
X-Received: by 2002:a17:903:22c8:b0:224:256e:5e3f with SMTP id
 d9443c01a7336-22428993846mr74979675ad.25.1741374257197; 
 Fri, 07 Mar 2025 11:04:17 -0800 (PST)
Received: from stoup.. (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410a91c5bsm33686335ad.186.2025.03.07.11.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:04:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 1/2] target/arm: Make DisasContext.{fp,
 sve}_access_checked tristate
Date: Fri,  7 Mar 2025 11:04:14 -0800
Message-ID: <20250307190415.982049-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307190415.982049-1-richard.henderson@linaro.org>
References: <20250307190415.982049-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wxENehl8qW6j

The check for fp_excp_el in assert_fp_access_checked is
incorrect.  For SME, with StreamingMode enabled, the access
is really against the streaming mode vectors, and access
to the normal fp registers is allowed to be disabled.
C.f. sme_enabled_check.

Convert sve_access_checked to match, even though we don't
currently check the exception state.

Cc: qemu-stable@nongnu.org
Fixes: 3d74825f4d6 ("target/arm: Add SME enablement checks")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.h |  2 +-
 target/arm/tcg/translate.h     | 10 +++++++---
 target/arm/tcg/translate-a64.c | 17 +++++++++--------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 7d3b59ccd9..b2420f59eb 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -65,7 +65,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 static inline void assert_fp_access_checked(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
-    if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
+    if (unlikely(s->fp_access_checked <= 0)) {
         fprintf(stderr, "target-arm: FP access check missing for "
                 "instruction 0x%08x\n", s->insn);
         abort();
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index f8dc2f0d4b..53e485d28a 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -92,15 +92,19 @@ typedef struct DisasContext {
     bool aarch64;
     bool thumb;
     bool lse2;
-    /* Because unallocated encodings generate different exception syndrome
+    /*
+     * Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
      * To help in catching bugs where the access check was forgotten in some
      * code path, we set this flag when the access check is done, and assert
      * that it is set at the point where we actually touch the FP regs.
+     *   0: not checked,
+     *   1: checked, access ok
+     *  -1: checked, access denied
      */
-    bool fp_access_checked;
-    bool sve_access_checked;
+    int8_t fp_access_checked;
+    int8_t sve_access_checked;
     /* ARMv8 single-step state (this is distinct from the QEMU gdbstub
      * single-step support).
      */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8bef391bb0..48e0ac75b1 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1381,14 +1381,14 @@ static bool fp_access_check_only(DisasContext *s)
 {
     if (s->fp_excp_el) {
         assert(!s->fp_access_checked);
-        s->fp_access_checked = true;
+        s->fp_access_checked = -1;
 
         gen_exception_insn_el(s, 0, EXCP_UDEF,
                               syn_fp_access_trap(1, 0xe, false, 0),
                               s->fp_excp_el);
         return false;
     }
-    s->fp_access_checked = true;
+    s->fp_access_checked = 1;
     return true;
 }
 
@@ -1465,13 +1465,13 @@ bool sve_access_check(DisasContext *s)
                               syn_sve_access_trap(), s->sve_excp_el);
         goto fail_exit;
     }
-    s->sve_access_checked = true;
+    s->sve_access_checked = 1;
     return fp_access_check(s);
 
  fail_exit:
     /* Assert that we only raise one exception per instruction. */
     assert(!s->sve_access_checked);
-    s->sve_access_checked = true;
+    s->sve_access_checked = -1;
     return false;
 }
 
@@ -1500,8 +1500,9 @@ bool sme_enabled_check(DisasContext *s)
      * sme_excp_el by itself for cpregs access checks.
      */
     if (!s->fp_excp_el || s->sme_excp_el < s->fp_excp_el) {
-        s->fp_access_checked = true;
-        return sme_access_check(s);
+        bool ret = sme_access_check(s);
+        s->fp_access_checked = (ret ? 1 : -1);
+        return ret;
     }
     return fp_access_check_only(s);
 }
@@ -10257,8 +10258,8 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     s->insn = insn;
     s->base.pc_next = pc + 4;
 
-    s->fp_access_checked = false;
-    s->sve_access_checked = false;
+    s->fp_access_checked = 0;
+    s->sve_access_checked = 0;
 
     if (s->pstate_il) {
         /*
-- 
2.43.0

