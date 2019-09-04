Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1151333wrp;
        Wed, 4 Sep 2019 13:13:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzKuC9M/WfDv+yZ45mjCndErM1icZXKuTSu4h/G1hQpYf7Ruv7ljwZGHrEKgxTNUVXF+/Xt
X-Received: by 2002:a37:9e05:: with SMTP id h5mr41468239qke.331.1567628026122;
        Wed, 04 Sep 2019 13:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628026; cv=none;
        d=google.com; s=arc-20160816;
        b=ZchgMgc32cUede0VD9tgSZThQQeLXKQL9YcJmWB0QSID0EWT+YEgu50EJD4ws4UQx9
         eZE+VV1qG3kmmFPtZU/yvxaReYalRNcHb/m5MplSo1i3ZTsXCgWUw+c5U1jk0L/4Xxgb
         enQe0pM/SdyXbh7MnJ0pqikfcKa+XruoKc6VVJPISuF8vEMnIkToQ0m0q9xJE/VD3hdd
         P3CfVYrHCL9JFLCfWKipcjFKJQSRe9/IHXRlJ1rhhPxGVP/tq8UmXSlbgsfPcjVWer4K
         jzeHDDJaM8fLlkQWIQ+EV+r/Fjl3YsoN639CQ8Mvjh5RbVDFrf8KkbToJMI3GeNeCbJA
         XtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NK+hQjn74sTmmQoYkWqtZ1EbyzqY+R+jJ+p0UyW4OS0=;
        b=EEAf+8KuKHpIkcZRvtEcnfynttEs7vgjOFT3Oa2Kr4/Ew6OyRddBS/vlsl9kcK1oLr
         QWoGftEBl3O8doS0CBqQazilMPJi1UOssx3Was7tv61+en6UrquJzhseZDMIC1KArPEk
         ziFmFhiY7P25zUNakBXZ6khpXZCWrTZxTofE7RfvqTPaGC/OwSMmYrzyurIQkOEN8PIU
         CHrPkZl7HTr3vybh+Dg5EOHrJc02hz4LMScqyiKQBw4+fx5HIynLXwErs/fUAag0ctey
         Ve88r5kVAOr68p3JsnznEpMU9PuXqYs1qKNwp8P/toIyNBq5avlnWptkT0A0ttBgSPjK
         FKYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fIYOgT14;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si9104834qtc.289.2019.09.04.13.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fIYOgT14;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bey-0007Ju-Qx
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0w-0005XO-2x
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0s-00039q-4l
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:21 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0r-00037J-MU
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:17 -0400
Received: by mail-pf1-x442.google.com with SMTP id h195so7362906pfe.5
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NK+hQjn74sTmmQoYkWqtZ1EbyzqY+R+jJ+p0UyW4OS0=;
 b=fIYOgT14ZAqAaSw448/XmZtYxW6nZHFwCUzpJYoRotX4XVCDuardpm99QiJcH9i6Ot
 FMH6y36BvG8K5t21zMeAjo1Dx4YcWMX1Aoc9s7hsy0aPTTWdcH+YPP+6T2D5sTlzbiKG
 +qF2AM73RHRWNnwqaLJAs7fyPmC0kvY0yPfKQfIN/rpjaCeN7Fl39P983ClaeyNec6lw
 ySAtuZTB5y+uggk4pzeoKvKEMYdu0iMoHM0rkYF65HZTQlepPJKFogkXAE2sksMt7tz/
 r7X8/Le47AsoJxMbDI4SuQpa81FRJp+ch3MptNea7Qvi5AWWgmLKig2loxdo2dEK6vVK
 th4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NK+hQjn74sTmmQoYkWqtZ1EbyzqY+R+jJ+p0UyW4OS0=;
 b=gEoTWJUGUAgpVDFPMT7QauGToBDRlTU/oXzNQ7+GggRQXeY3pwJbaRfB9IeGfcytYL
 OHINFi7GTp2HvNXyk1VoqLPNjAtE5rKulajpnEEUCApjcXaus95DPl/XNWSajZTLZvfQ
 Z9f9N3FlUuL9vreMKwcEptjmMNIc4rwNnK/p/AXcFQR/wdu/DxDXx9oSc4KH/6/KULmy
 zzKeaGTvOayVr2GupikD83jEff+YUTT0U6fiEVrsU9SJA4ZCwNlf7JW3XEYm/YwzQXD4
 GOsZEt5y4wB/zhoR6NbyaphYQcPq5CGiGt4bdg7OhQ689Z+5TLQms+SzIgtyUPZYA7Ws
 +wlw==
X-Gm-Message-State: APjAAAVkeNIpRQTNPshvLcUwEe3pfPO3CTHsqytUSLajCHd0J0ye8Hn2
 ZhP4/9sI+8ZX4k15qSl3idYqpbzFZOk=
X-Received: by 2002:aa7:8498:: with SMTP id u24mr48839331pfn.61.1567625536067; 
 Wed, 04 Sep 2019 12:32:16 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:49 -0700
Message-Id: <20190904193059.26202-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v4 59/69] target/arm: Convert T16, nop hints
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v6hLkh3Giwv4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c |  3 +--
 target/arm/t16.decode  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b70491d39e..69092c12c3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10891,8 +10891,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 
         case 15: /* IT, nop-hint.  */
             if ((insn & 0xf) == 0) {
-                gen_nop_hint(s, (insn >> 4) & 0xf);
-                break;
+                goto illegal_op; /* nop hint, in decodetree */
             }
             /*
              * IT (If-Then)
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 19a442b894..5829b9a58c 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&empty           !extern
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
@@ -204,3 +205,19 @@ SETEND          1011 0110 010 1 E:1 000         &setend
 REV             1011 1010 00 ... ...            @rdm
 REV16           1011 1010 01 ... ...            @rdm
 REVSH           1011 1010 11 ... ...            @rdm
+
+# Hints
+
+{
+  YIELD         1011 1111 0001 0000
+  WFE           1011 1111 0010 0000
+  WFI           1011 1111 0011 0000
+
+  # TODO: Implement SEV, SEVL; may help SMP performance.
+  # SEV         1011 1111 0100 0000
+  # SEVL        1011 1111 0101 0000
+
+  # The canonical nop has the second nibble as 0000, but the whole of the
+  # rest of the space is a reserved hint, behaves as nop.
+  NOP           1011 1111 ---- 0000
+}
-- 
2.17.1

