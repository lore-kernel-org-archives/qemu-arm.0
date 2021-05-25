Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4905261lfm;
        Tue, 25 May 2021 15:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykCry3iWF79by2+1mxi3sAY72Rwahy5L3G12CrsmlzgbDkbUfFbKJc/+LNeUooGHmVbxgv
X-Received: by 2002:a05:6e02:118b:: with SMTP id y11mr26456406ili.241.1621983526049;
        Tue, 25 May 2021 15:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983526; cv=none;
        d=google.com; s=arc-20160816;
        b=d2Xkt09tGD4thTNhMOkjd90wZilYrnD6hU/cNLlJhjq1sLdjvSe45i66Ra2Ar3h3pq
         08N36QNuMPmgUBeaPaMVCvMxM/mvD4muZsLIo46l5p/GnEUJzTpCc48tyM4x6rmn3A4r
         TexaUzRf7B6kpy0ni4GDGHZOOEG3m1K43jiXWTGLyipuCBXLuft25KRplQbMbIwN1Oxa
         F4ei/IsqS3Iv+nd7IbAPa259GPPE2BEokj/GvIftSTJ0yyvwjYRjv1j7NrAyMIycsLhO
         9z2SBbjqQhnL6S5m5rY4orTH0zq4RxOi6TBQ8ZnR07HBiFd0PRNpCxeNDJIrTZHHbxVi
         N1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3DHjpex0S8JDOy5JRC2IyqoQUwifwwct+C1bXOYlysc=;
        b=DovvmuUKhOasDUJ6PnMTHZ7Laelyce+wKSyb9Pa2tFouA5Xh2tFyX4WKtpoATR/pvg
         eiMVZXIHuV6htVSiib5TjPbsCoGk/hP4xT3RSCuCCkCUtb6ML8l1vayoBt+Z6g/MS2tm
         wt6moD+O5donLs2kc0ZYhzxSt4IwDJ/Dzpn1/+Lxqi1SimPbHtNWXcL70wtmQGitpAkD
         9u/rI5RIhwUInlhwYKfjAD9q7f4Q0i7o1h9fgaGZ+exQXyVUAeEx9V/vaX+eOdHR5J67
         YQv4/Do0AsFDa6C3VBzhR3vlcvl2YHe2fzubsI3K3ERbfHYPBdtypL03ECmbwGwF+QMv
         hqlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YRqj7oQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si10482832ilq.138.2021.05.25.15.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 15:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YRqj7oQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg0b-0002Wv-9Z
	for alex.bennee@linaro.org; Tue, 25 May 2021 18:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0H-0002VV-96
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:27 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004nO-9U
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f22so23011670pgb.9
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DHjpex0S8JDOy5JRC2IyqoQUwifwwct+C1bXOYlysc=;
 b=YRqj7oQr976igPnGuc3Oq96xQqHSLzZa2/oZHYTXCS0anSFH0z7AN/LOjxwPK19ax6
 N/xaTsSv1S2oHFUrgOn+t3lrMSk5B0UvJScywI0Vhm3g8ON2aXl3/RIgcZ+rkNSZce5Q
 zQ2fJyw0nZXTmLjpZX0FyL8vuuXFyRb4yZ4rt54OGnt2VTKoWpk8qFDNOcfpUQMd0pev
 WUi2aiERXYHOg9z0wZKV8afF3mgVrHuLdqgrCLo89Gt+apXXOxG9wONfbyAHqdS/+jTb
 d92j+tZ2spNs9uXofUmcmAYh1Jmnh4UFeuo/uTbDk91LUFSoZZIVu/LNActg4cxBtweU
 Qtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3DHjpex0S8JDOy5JRC2IyqoQUwifwwct+C1bXOYlysc=;
 b=Sl1W+SxxY4ohe2WEnwqLWk+/3LZ4+IQtMvfmgWU8mqRy58wStG8dehwqG7ZDqcRE8E
 3bm1pYdRuKvbdxS0Fkp8b5uIk5qohPsdDJ+EEB8bgtSzFp0lZRj/7v/RR37vgMgOlMEn
 YM6/Mn37LfSvnhfSilxr8aP6q3N2G990scZEAkq4/YXtShehpDv+DJvHFfQEt/kx6sKr
 3ZNi+ec93kZougwc9/4laom5KGZBzu3i/zmJQX+x0XLss9T5PHW4o+QGLrYZeBIoRbb5
 CPYpI7L250d+QLAHmE0brr0AH/TYUb5jkbZ3DXUb52J/7PdsM6XL3+faajep2LUKAk9K
 e8bQ==
X-Gm-Message-State: AOAM531JYExxY20/xeMtDRsseLO2lvUOg/sZ1KxXPyoqJdfd1pzIVEn8
 RbPuqdSE7UuFNpXKB5mbD9/Jxg==
X-Received: by 2002:a63:1161:: with SMTP id 33mr21376706pgr.270.1621983499843; 
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] target/arm: Unify unallocated path in disas_fp_1src
Date: Tue, 25 May 2021 15:58:07 -0700
Message-Id: <20210525225817.400336-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t4z9ebGNbAK0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ceac0ee2bd..510cb6ca5e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6494,8 +6494,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     if (mos) {
-        unallocated_encoding(s);
-        return;
+        goto do_unallocated;
     }
 
     switch (opcode) {
@@ -6504,8 +6503,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         /* FCVT between half, single and double precision */
         int dtype = extract32(opcode, 0, 2);
         if (type == 2 || dtype == type) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         if (!fp_access_check(s)) {
             return;
@@ -6517,8 +6515,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         /* fall through */
     case 0x0 ... 0x3:
@@ -6540,8 +6537,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             break;
         case 3:
             if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
+                goto do_unallocated;
             }
 
             if (!fp_access_check(s)) {
@@ -6550,11 +6546,12 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_half(s, opcode, rd, rn);
             break;
         default:
-            unallocated_encoding(s);
+            goto do_unallocated;
         }
         break;
 
     default:
+    do_unallocated:
         unallocated_encoding(s);
         break;
     }
-- 
2.25.1

