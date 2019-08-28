Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1216486wrs;
        Wed, 28 Aug 2019 13:10:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0nuw0GkqPyypiLimLqPc8F85eRM41ixm9drvec8BpAA40e27KiwpXaqshe0gkwbpLIg9L
X-Received: by 2002:ac8:f43:: with SMTP id l3mr6255012qtk.278.1567023020170;
        Wed, 28 Aug 2019 13:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567023020; cv=none;
        d=google.com; s=arc-20160816;
        b=M0bYYVIIs0F9YR0vF8FL/2S5EcC87ztqV9K9Jg7nh8sOoJ93wx/QRkQf3FEoMb+go3
         Cy5WyzPSYpXkq8Rkk1bWsYFuBzlaUxw6LpATkSvfQsX43Z8NZmrKx2ad7r/LXWYhz3k3
         X429YlqE55MLk9prmbx7amso/huPx+VWYCByFiOApSVzqDGZ2lSXWpyYNdbauv7/KaaR
         zpVo12ATzmElWyEwl4xAvgiqDC3ucOStiPXwDWOIA74vCqqyN/ISiZAlwcnsLrU9MMdL
         u+tg1C7iOBmvRHFEh1tBv+bQYML1p1AuC+iVxR0qsQFFqfOn9b1W22aihaRTg3+wJAPX
         tNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AjmucdomfKxGM6hnf1R57zZqrIKHMIhApG2eFqmaHBc=;
        b=yDBJ5gKWZsCiihsRdYvC1MpI2LsohMxsQYSwbooH/p15/vWWyVJ9yLeB+3UKAEhF3K
         bzHxL3qZyYuyzvVXMBSWK4+20sjMxWBYmPp9HZ3OEpUFkEwFvzXObQGJU2IGEZZgXbQT
         G9gztIDzdMaYiHHlL+9p5JCaniZxOYePskbGQNPv1l3cbhj7QT3EprCVG4E3fYt3uO83
         X41Y1KlU7B2eXpehl5TlGWLsXJsBf5SoJ254c+j4WhqUKK5pRbDO7udetwQwQYegju9L
         xMlTU43G3dqed8URGjZ9PrtSk0hTqNNJ1SYSP+0Yv78kKIfU0pbOiQuogcTNPpewny5b
         koJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hD/ClnCC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si157289qta.357.2019.08.28.13.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hD/ClnCC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34Go-0001yB-GX
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H5-00046G-6Q
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H1-0000pY-5l
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:29 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33H0-0000oG-Pn
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:26 -0400
Received: by mail-pf1-x441.google.com with SMTP id w2so400541pfi.3
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AjmucdomfKxGM6hnf1R57zZqrIKHMIhApG2eFqmaHBc=;
 b=hD/ClnCCAfC+KrJCN3zA1EKEPJN/d9DDbG8Bp84tKpcHJTnJsIwyao2XyYMTIg2y/3
 evkaafRRRCoL/ipAI5gLnCAtGxPunDFIBR8dxFDtIYT0a+oLEZWYKJTLWnPNhMlDutH7
 /JAo2o7sdp9qddEo6PuDZX2+SPpubW7pIHPY/4TRhfO9LiVCkMyukUxiOpXAXxa1P0xi
 FgpkGIAV8m+XYbnDxSY2dUVVygxGsBedLTerZkSZEMwTtYpPVEc1GEJ/CpLkl17ZLj3Y
 pz9PA+IJ3RPv/3yyhaAEzk0LFE8L1GJGPWEcNQ6kdG5vQGeI9oZaY0cuJ6kaRUud2PVQ
 FWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AjmucdomfKxGM6hnf1R57zZqrIKHMIhApG2eFqmaHBc=;
 b=Y0fWqPkmo+/c2bzGSvKTT0S8Z48xlaaG/wqxylv3M2GqU5ySJyzyto/LQXogr/0YAf
 XgGm2IpyHX/SPX2rwg90kWCD5Q4dVF0fVUPj5s+kzZIb1gkq3BUo63UWN6Mp0MmZHWL7
 S7owDsX3i/2jtzPvDo1YnxHjczzwHulFTVLoBmrUAEZi+ozuedQIv312qcp/ZuUya245
 KJoIQXbOsLtPxrV6nI8ED8zwwPISuWLXpb3FtJuCEHZOrm7+HacDMBbXTeCWhW3qG9oS
 MWs8kpbVq4hi5T891TvV9NIyktRg4cEYKqsrbdkOEzYJUH7mjBp5ERqNowWJkkx+in4c
 qBiA==
X-Gm-Message-State: APjAAAW7L8rSwPqcnwV9LDDJAEdjZU9vcSblPebF3eLqD46f62dNx2ok
 sSSWqmAKMUzKR++wm8tpVDBk+xAo0M4=
X-Received: by 2002:a17:90a:b395:: with SMTP id
 e21mr5788048pjr.76.1567019185680; 
 Wed, 28 Aug 2019 12:06:25 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:55 -0700
Message-Id: <20190828190456.30315-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 68/69] target/arm: Clean up disas_thumb_insn
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qlkZBRQccAqz

Now that everything is converted, remove the rest of
the legacy decode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 424a8354c1..5a9a6d3a1e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10747,32 +10747,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    if (disas_t16(s, insn)) {
-        return;
+    if (!disas_t16(s, insn)) {
+        unallocated_encoding(s);
     }
-    /* fall back to legacy decoder */
-
-    switch (insn >> 12) {
-    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
-    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
-    case 5: /* load/store register offset, in decodetree */
-    case 6: /* load/store word immediate offset, in decodetree */
-    case 7: /* load/store byte immediate offset, in decodetree */
-    case 8: /* load/store halfword immediate offset, in decodetree */
-    case 9: /* load/store from stack, in decodetree */
-    case 10: /* add PC/SP (immediate), in decodetree */
-    case 11: /* misc, in decodetree */
-    case 12: /* load/store multiple, in decodetree */
-    case 13: /* conditional branch or swi, in decodetree */
-    case 14:
-    case 15:
-        /* branches, in decodetree */
-        goto illegal_op;
-    }
-    return;
-illegal_op:
-    unallocated_encoding(s);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
-- 
2.17.1

