Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724029eji;
        Mon, 18 Dec 2023 03:37:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8ve5y1Hnyrn6yIuSUEZNi2aytFQpxQjSqRtkGhe5za5nw15AjfmEin4OewXmCIJDSxdaX
X-Received: by 2002:a25:cd88:0:b0:dbc:fcfc:2586 with SMTP id d130-20020a25cd88000000b00dbcfcfc2586mr1769199ybf.97.1702899422238;
        Mon, 18 Dec 2023 03:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899422; cv=none;
        d=google.com; s=arc-20160816;
        b=HgB8B5LLHbRMvx1xEsaSB1XV2PZKEfIxyevtv4DQ7S6n+rggLrTZuCna2h5hf1lDi8
         VBGgM9mYNzFl+LAVBcL9QO5WUnU4cVWYZNFYcakhdvotTyGAKL8TMm7x9lJjtSmu3U1W
         Sn08ETOePxMFPctHSjngsBmfs2xz9cIwpg3oF7MBEAtTs102/m/1la6vZaQn76RwL++4
         S1ABvE3+NIeC5ebFPgmYE6dbg5PePjuaGjrSNRYVMlIhTCvkz4rxVRmw5jhIEsqqV0mQ
         mOcosBbhGt901sP1GGnBmvQw5rKWHN0p6dFbHf/croIUalSD7TyNFXC5UECy2vQqDjoe
         0QWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vlcd/qbLbXETQ3/U+1GQumNLwA1HU2GT417Tgq9g9lY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=sljcmbstvKszEhXxEzSyCOm+1+ly9h8PwXopCOFQoElbN7njZZVCVC8ljnnAUU9wwb
         UxuWAr0b8IsX9TQCCgmGgLHoU1DWJIV/LqTJvmDwgfSjiOEm5hIzkeF5Zw0FknKfZIcI
         MmZEdE3gY2ps+bPX/14+Nor8QqYySN6hq9Ga5TTVTSzsoYaJ1HtZ3SMDfrg3ZHa9LMyL
         thyBBOsoE1Gp7X55azujfYOB7Ao/FSn/rDOHjezCiK6/chrNl7gn0mpCSVIMdVyUWzFQ
         0K56IQX2ITFLQ94B9V2fiZZEngQiRvUraoNy35kDBah/sfdF+O4jwuuV0je3KcWsj985
         rubw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bN9kbCaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ex26-20020a05622a519a00b004255a73888csi25852435qtb.104.2023.12.18.03.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:37:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bN9kbCaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBs8-0006eO-GS; Mon, 18 Dec 2023 06:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs5-0006aw-7V
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:17 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBrz-0003I5-UD
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33638e7f71aso1519368f8f.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899190; x=1703503990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vlcd/qbLbXETQ3/U+1GQumNLwA1HU2GT417Tgq9g9lY=;
 b=bN9kbCaa1/aBucwLBwkKJj439Dbgg1UeBBPnY19Gc/3QZfqOTDpOGStT60SOg6U9o0
 FHOtTt1doNghavW6KSpb+wTsnN+hcTY+C7IL2P9e24RfPzD+U8a22cGtR+hecz4oB+uq
 ny71nJXzQ64OmnfzgUMj1HsCIE9l7X84I0tBtWz4ZICga/ilXYoPHdHQS8PFkzntWDL6
 Z63Ui1fLjgUvHUOr5iztOb5HKS/0EIdlFhYGl4QEjwdGKTtmoU7hg3wWFHcOosk80lED
 B+rb1r44mbKTmeJuKb0cPTaMTzHsJYjXvyyThCf8XuIzQs1Hi073tXj0KbhnlZKvz2CC
 JaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899190; x=1703503990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlcd/qbLbXETQ3/U+1GQumNLwA1HU2GT417Tgq9g9lY=;
 b=O+9DPZd1VTOdTZ0k5tALTM7f9krzfq+5mr/M0EPSAbm2xycZ4PPc8NVj5T31PdxoFX
 kWSmSMdyLOisMmjvs89/JnWyIjp6tPiiso/U4khiPirPjtz6zO/XaHZQl3Chi6HgBOsg
 bw8tJZOdtV9L0WsI9EgT63fLP6GmZCkO4PVrP4N5c5xCvcP26XzAIFvBSk7RVZ8I+ipg
 AhBJ7bgMq9YLBE6TgCni+TIwHiEtQVjtrbUB8bKerZf8wrwB2Ct/ExvESEoe4hz7z+FB
 N/0+Qd1PgWFyAGM3ILo/u8c/UxkAyBJArp312tn0QNFXafQgn3SLZlCDxspjwA9kQqew
 XhcQ==
X-Gm-Message-State: AOJu0YyB8is9e6kB7wsJfjGM8n8vcF7zlYIG1aAOUpPyq/q0TwBPzAGJ
 J3cxU5S6MMiAGFv7OEUJ48c+TB/y9pnXH5Och0I=
X-Received: by 2002:adf:ee0e:0:b0:336:5b5e:b586 with SMTP id
 y14-20020adfee0e000000b003365b5eb586mr2292908wrn.28.1702899190540; 
 Mon, 18 Dec 2023 03:33:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/35] target/arm: Allow use of upper 32 bits of TBFLAG_A64
Date: Mon, 18 Dec 2023 11:32:38 +0000
Message-Id: <20231218113305.2511480-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h6HTcxpy6b0U

The TBFLAG_A64 TB flag bits go in flags2, which for AArch64 guests
we know is 64 bits. However at the moment we use FIELD_EX32() and
FIELD_DP32() to read and write these bits, which only works for
bits 0 to 31. Since we're about to add a flag that uses bit 32,
switch to FIELD_EX64() and FIELD_DP64() so that this will work.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 167b3759ac9..91157db85ae 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3240,12 +3240,14 @@ FIELD(TBFLAG_A64, NAA, 30, 1)
 FIELD(TBFLAG_A64, ATA0, 31, 1)
 
 /*
- * Helpers for using the above.
+ * Helpers for using the above. Note that only the A64 accessors use
+ * FIELD_DP64() and FIELD_EX64(), because in the other cases the flags
+ * word either is or might be 32 bits only.
  */
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
     (DST.flags = FIELD_DP32(DST.flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
-    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A64, WHICH, VAL))
+    (DST.flags2 = FIELD_DP64(DST.flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
     (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A32, WHICH, VAL))
 #define DP_TBFLAG_M32(DST, WHICH, VAL) \
@@ -3254,7 +3256,7 @@ FIELD(TBFLAG_A64, ATA0, 31, 1)
     (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_AM32, WHICH, VAL))
 
 #define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_ANY, WHICH)
-#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX64(IN.flags2, TBFLAG_A64, WHICH)
 #define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A32, WHICH)
 #define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_M32, WHICH)
 #define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags2, TBFLAG_AM32, WHICH)
-- 
2.34.1

