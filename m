Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117962njb;
        Tue, 9 Jul 2024 20:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjrAhAp1p50b/l3oT26QWc2ZhEGmk4Tnz1qGjhR0ZVA078bTgWrxkYOzafjjrGAorAYVoNn0cInjMR1CD5Vz+9MhHPh6Tx
X-Google-Smtp-Source: AGHT+IEvg7a9st5eJPsqUeR1zaY6Pl5Khrmb75eqCeISd9Yu63QqWFwuaRyj8XL050R7WGUUOl+2
X-Received: by 2002:a05:6214:21a9:b0:6b2:b054:c64a with SMTP id 6a1803df08f44-6b61bc7f13emr57028546d6.1.1720582221613;
        Tue, 09 Jul 2024 20:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582221; cv=none;
        d=google.com; s=arc-20160816;
        b=NPA2ND0gkoEny8rkfzrGYoyTx/Ui1v8pghHfSIxVizobYjLChaxrvC/AdYedgUfELt
         Cfqf95dvqEmH1ChLecV/ClOEoEmD4Zlw4lGnVDWutK203HX3KaeefdeGKDKqwt6XB25B
         ToNQuvS7AYfAWv2mXoIPUlSr0/5sTrVmlFInZ9OA+UCSTSNEjZariErkUy6xBTc+Dn4E
         xPXNMqikfecd3bJ9xNwYsruM2iqidQKT4byQ/HvmE/UGitvxOD8ngZs+QMdPrmWtbFY8
         puTz0LvV2fidtc9M1YtzGIhVKxr4BFanfCxvIJPBoh5wgaDkYwqB6+dU9xfNAFLgsX64
         IbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9235SwuPYciaNgHcgxJSqCnrZAaLdfCzJnWaiSnsh94=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=H/QdvdHIei9W21IlTrUN3klDHLcpX7+tBfD998ONmS8MZ8Q7FL8W2SDWTLOa2cpnqu
         q/33NQJGpowd4Bi8Wx9rCkjZtbCNCNcvuLGhpYyK/tRUkWQmkHbu0WL5D3ACIPVp32zm
         /wk6bqVbg3FAQndg9yhTJB4pPZZ80ge3AI9WTHiAvj/puy3r4wyXYDv95C5QkpNMUm+m
         2RNOKycyGSyAvThubBdK0lCVaizxqClC9NIfhGVPgpNvMWEuUJX+XHDOUNS3rvrswEuh
         B01wDjBmvu8iGogTSfHrjZ7mLYo2Ed263vSlRjzzVypC/tyYb2Jqz3FPA7HwudMfil/T
         rnlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWdcLaCz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bade9e2si37902916d6.500.2024.07.09.20.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWdcLaCz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRO0e-0001HP-JT; Tue, 09 Jul 2024 23:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0c-00019S-Jz
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:47 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0M-0003ox-Lv
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:46 -0400
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3811d62a668so21952625ab.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582108; x=1721186908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9235SwuPYciaNgHcgxJSqCnrZAaLdfCzJnWaiSnsh94=;
 b=rWdcLaCzYHfCuM9S3ZmqerFqaLOjyp/8lAWKqBwrDI6bVok5aPrIw9L0gY6G9FhTvW
 dFwtul5yQRz0vy2/qODHI21XuramSUJrj8vFOjRPtGkCbSr85G07IwZjrGtrqqUJAey1
 0xHlya1ZxceIWchxZdjk0oqUQo4OSV4jGXPJ1bqIPXIOuwg0zDGHxOp9v1hRVcsrHOHD
 Og+OdCR+K+SSj4qfgmXF5YKfDH7MnXfntt8UKAAK9VjtJospAcrkZ1JEXerlTZMZxIL+
 4Z4jIiKWBIHjoumlqaue5Hb5PUVuc7PZoc8fnANrQD3Ub/6djBuY40+i6Stgx49ZoHDz
 IZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582108; x=1721186908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9235SwuPYciaNgHcgxJSqCnrZAaLdfCzJnWaiSnsh94=;
 b=U+Fym31OY62tzkUIfpaDDc6+au+Ev2htiYlBlmIrqPtPKDGtgABxMGJxQwEOePaHK3
 YlXLaGlx264O0T8KmQM+ngfbcfyCwwDlATBzTFgQOHjWYvRQtjYWGkupn+lB7OzJrlZ9
 5AWm812GUJ1J27ENtCdS5MdmB7xrLU0bV10ZJDT3ghYZTQnYDPC0wFXAU2VWMuLHSPNl
 AT1YWFndv0KWPdEeFf5HK8Ehn9voq+nrotbKEKhiJbbo9IvybX4g7jmXIo9h8iDC4tfL
 PfpA0MMf3XzkWN+5ACuo78DFTJKbs0Z0gb0C7Qxa9RJQXAzRE5K9Fl6ynTW+1HlbcfsH
 ZvSw==
X-Gm-Message-State: AOJu0YwYIssE3FQ8qpyVP7R6ExdK+hjUz5GCHeOyaw812nARZPlUHzHQ
 h23piftEDQgvO+aWMRYdFmrEIwqt6jDD/x7tWk4Bb81ZTrByt1tByeeLeBUN50d97z0nzsjG+T9
 qAME=
X-Received: by 2002:a05:6e02:1585:b0:374:9a3f:d197 with SMTP id
 e9e14a558f8ab-38a57fb18a1mr43418875ab.15.1720582108481; 
 Tue, 09 Jul 2024 20:28:28 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 13/13] target/riscv: Simplify probing in vext_ldff
Date: Tue,  9 Jul 2024 20:28:14 -0700
Message-ID: <20240710032814.104643-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x133.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: JFReB1EJxsXE

The current pairing of tlb_vaddr_to_host with extra is either
inefficient (user-only, with page_check_range) or incorrect
(system, with probe_pages).

For proper non-fault behaviour, use probe_access_flags with
its nonfault parameter set to true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1b4d5a8e37..4d72eb74d3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -474,7 +474,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
           vext_ldst_elem_fn *ldst_elem,
           uint32_t log2_esz, uintptr_t ra)
 {
-    void *host;
     uint32_t i, k, vl = 0;
     uint32_t nf = vext_nf(desc);
     uint32_t vm = vext_vm(desc);
@@ -493,27 +492,31 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         }
         addr = adjust_addr(env, base + i * (nf << log2_esz));
         if (i == 0) {
+            /* Allow fault on first element. */
             probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
         } else {
-            /* if it triggers an exception, no need to check watchpoint */
             remain = nf << log2_esz;
             while (remain > 0) {
+                void *host;
+                int flags;
+
                 offset = -(addr | TARGET_PAGE_MASK);
-                host = tlb_vaddr_to_host(env, addr, MMU_DATA_LOAD, mmu_index);
-                if (host) {
-#ifdef CONFIG_USER_ONLY
-                    if (!page_check_range(addr, offset, PAGE_READ)) {
-                        vl = i;
-                        goto ProbeSuccess;
-                    }
-#else
-                    probe_pages(env, addr, offset, ra, MMU_DATA_LOAD);
-#endif
-                } else {
+
+                /* Probe nonfault on subsequent elements. */
+                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
+                                           mmu_index, true, &host, 0);
+                if (flags) {
+                    /*
+                     * Stop any flag bit set:
+                     *   invalid (unmapped)
+                     *   mmio (transaction failed)
+                     *   watchpoint (debug)
+                     * In all cases, handle as the first load next time.
+                     */
                     vl = i;
-                    goto ProbeSuccess;
+                    break;
                 }
-                if (remain <=  offset) {
+                if (remain <= offset) {
                     break;
                 }
                 remain -= offset;
@@ -521,7 +524,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
             }
         }
     }
-ProbeSuccess:
     /* load bytes from guest memory */
     if (vl != 0) {
         env->vl = vl;
-- 
2.43.0

