Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp478704lfa;
        Wed, 2 Jun 2021 10:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMK+zIEwdGLWKegVxGFTXBK9/qusLQbw0de8CaJLfuPrTFKSYig/mEpQjTykomGSFU96Im
X-Received: by 2002:a05:6402:4406:: with SMTP id y6mr32035879eda.278.1622653715263;
        Wed, 02 Jun 2021 10:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622653715; cv=none;
        d=google.com; s=arc-20160816;
        b=QAPIstQaPFkPo637278U63FYuELd15em/93brgbq4vkYL72korQ0W818SHO8tQmegu
         3QHS1vQCZ/rXMKTtYS+BuKKZ3v76bmKzeM59Oq/OP3B56Qruf713XV1JBkAOf0f7aUlu
         HZ+eZC8LbheTRehqQa/WDo0gol0GTmVsUzatheExufBPo43GZqIbJCE2ElzSCuZiqeHM
         zvjOflFYBJoWSvAIcgGKesCm0cgQyNQi8uaV222rxzVCmpxvGfP5Y06cUPGbE2v+BY1C
         P/MA9TFb6fjThpG8fNYDGoVX2BbOICcQe9Q9vAUn1QeYD3vNAIHu1eRR2Ag5j4z/wyjs
         w5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u/ZsVviC897AX/fmYNgwrrdG9aX9qUp4BnyCpR7wyLc=;
        b=B9jjpqyHMyAydFCz/K0ySNyKZ2gjhjY8QBcVzXcQy+88zRzmX6gbCLkI7K3iNEee59
         3S1cvlWLq4c3qfvUkxdC3RTmePiSOA09l5FhHo14trWLp7m9S1NiNPbmauTWlVJf323J
         wHiFdNJGUJFL1wluChFbLJphiojLBta2VGoxieojRTgvMSJFCWAKbHjb7UUAX7qncgQo
         ezoGgDwsQ7lk2WBWoW4Xohq5Lqudr+XZwU3JgV/IYz2lucP/prDkP8fpfA8nv3cYYPPP
         4WcPTZ28vojYW6QrESU2uUzs4cgAcdpl5iDZt1zTEoIhLrTVplih/chUMDy09PGoubPI
         kxcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aWeF3ovz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si394450edi.195.2021.06.02.10.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 10:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aWeF3ovz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loUM6-0002tS-9e
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 13:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULl-00027P-14; Wed, 02 Jun 2021 13:08:13 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULj-0007Rf-F9; Wed, 02 Jun 2021 13:08:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id o5so3803900edc.5;
 Wed, 02 Jun 2021 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/ZsVviC897AX/fmYNgwrrdG9aX9qUp4BnyCpR7wyLc=;
 b=aWeF3ovzmPD/6fbybhIrVmLFMh9dE557t1aWIRfRYs4/OHWbZ4lodlX0zuH5klquh5
 DDIuwA4p3FnBbKYCpdbZdpVNHiuvtaFEXPuugdiyPDforDEcqGaQBUbSxplC2rthzt8p
 Tje+V2UgJdqdcN4dkZqLRr+zTAV1VXskoD+fbdeVbL4JGSiHo8Jp4F3jyBCQSyAAHImF
 d6+m1wUTP9xSOVZD+BnvvgSXvgDqrzEMI4+y7mOShYW1HUqAhAvZElT5wsREFKlO/a7v
 NEeaztSfDyj8SvXQvZseDz2eDoPge7vVp9XVxNFQuaGw/gOAlofNSmRFocGQ7VDmy/YV
 Wu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u/ZsVviC897AX/fmYNgwrrdG9aX9qUp4BnyCpR7wyLc=;
 b=pAKPwF16bTF/LDXoPEZ0xtqdUAyIZ2GuScxHwfjsNrejOw0lvIk+UUhr9yr7JQiQqB
 wq67lMRQVYazlPmnl+3Zyoj32vqyVozpibHdxx3ZygxATrUH7DKaQMOxODeCCOk9Xzad
 OBFl7vC50aBflGTFTN/jzfLEKHBQ1w71kYtekx8VZZRuONznMA6CwEeXHQZ6G3+OEivC
 J0dUbsk2TIodLadEBTMoT4dZgedHozlX/N4q9P/Ffa80od1ZyJ3wJXmGizdp9InYo4oy
 JQThlEIMVm0YoShHnGtLwuyRmbOBOGkX9pfC52ztu6zG/GczfVMPP49yqd61vqdd+v9z
 LXUA==
X-Gm-Message-State: AOAM532RMS7/xHoAtnQWcmt/1DSE8nwNbEDLsc9LJ2Xajgtz+5L3erPi
 bkeT7RryBfErXuk3N3FjRUwn67XACqhaTg==
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr2900858eds.95.1622653688588; 
 Wed, 02 Jun 2021 10:08:08 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bn7sm290410ejb.111.2021.06.02.10.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:08:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] misc: Fix "havn't" typo
Date: Wed,  2 Jun 2021 19:07:57 +0200
Message-Id: <20210602170759.2500248-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602170759.2500248-1-f4bug@amsat.org>
References: <20210602170759.2500248-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG target" <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cXsNoglAF/Dt

Fix havn't -> haven't typo.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/desc-msos.c         | 2 +-
 target/s390x/translate.c   | 6 ++++--
 tcg/tcg-op.c               | 2 +-
 tcg/arm/tcg-target.c.inc   | 6 ++++--
 tcg/sparc/tcg-target.c.inc | 6 ++++--
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 3a5ad7c8d0f..836e38c67e1 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -181,7 +181,7 @@ static int usb_desc_msos_prop(const USBDesc *desc, uint8_t *dest)
 
     if (desc->msos->Label) {
         /*
-         * Given as example in the specs.  Havn't figured yet where
+         * Given as example in the specs.  Haven't figured yet where
          * this label shows up in the windows gui.
          */
         length += usb_desc_msos_prop_str(dest+length, MSOS_REG_SZ,
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a6..f3124a52207 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6270,8 +6270,10 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
         abort();
     }
 
-    /* Validate that the "compressed" encoding we selected above is valid.
-       I.e. we havn't make two different original fields overlap.  */
+    /*
+     * Validate that the "compressed" encoding we selected above is valid.
+     * I.e. we haven't make two different original fields overlap.
+     */
     assert(((o->presentC >> f->indexC) & 1) == 0);
     o->presentC |= 1 << f->indexC;
     o->presentO |= 1 << f->indexO;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index dcc2ed0bbc8..869dc6cdd29 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2695,7 +2695,7 @@ void tcg_gen_goto_tb(unsigned idx)
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
-    /* Verify that we havn't seen this numbered exit before.  */
+    /* Verify that we haven't seen this numbered exit before.  */
     tcg_debug_assert((tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0);
     tcg_ctx->goto_tb_issue_mask |= 1 << idx;
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8457108a87a..751fcd96930 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2127,8 +2127,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #ifndef use_idiv_instructions
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 3d50f985c6c..520b91d8b10 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1689,8 +1689,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #ifndef use_vis3_instructions
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
-- 
2.26.3

