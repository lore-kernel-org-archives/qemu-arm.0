Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1164305wrs;
        Wed, 28 Aug 2019 12:19:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMvZGxTNBoxlNtj7LYxTsOPDvwW/Vlo1hHbUGjEcNiCNcWfnFRAijPujlYCZyC7a2aNKUw
X-Received: by 2002:a37:5347:: with SMTP id h68mr5646111qkb.236.1567019999650;
        Wed, 28 Aug 2019 12:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019999; cv=none;
        d=google.com; s=arc-20160816;
        b=ppwzj5Q44qqPeEDWIVE9KZljXTgKgadK9pifnooBf4Gj5hfLR4/YNCiDEW4d2BWgac
         Xf1EdU6NjT/y3d5R2dKTZvOpZqo7eqDUeyf66bhU0141sBGa0uIQEBnQcRXaX5IVd0Zk
         1gaeW59Bi2rneqPs9yfT4IwhkF2XizNPtconKtpFs1z9bz8a+eROg7o8fW5RKPdSLhER
         86RDwws18dozFC2HpR8zHs3PFBJjDc+k212sECrihy3/6XGy/f6fZ7ehhKuyOhCSCrUb
         TzPt/Hw9NxIPm6mFub3ft9caNbcKXV66VrZJEftI9rYvxpo6lkylUnGZKzB82Ll4c7o6
         pOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IYp58wrZObrPG3dx71Rbw+Ikj8Xd6H3z4vbXYSZpilA=;
        b=MZDsQNJjq6m1fE7CxSjXXlHk6YrgbgT37KiXrzoucd8mfSuaom/n6GleUfplnJLDbE
         A2QBXIELzk/6jTsl/qK1mXIkUA9hhK5dFXvV8U6SYU4GKvsOd8NpbsJh8vgX9hUCQg0X
         dJYO/XJrrJ0SZbd86dkUBaoVL9r+1KLlQUpVNhrv8AfnY55aB4QCKRzpZsuTxBWMSOf4
         w6lDCdVioIwwSL/Skw00QxqW5YlIZAjQMNZu6QE3fwnxj+8siTHUOtKfysCBbGcyQ23G
         JQbw61G+Yypmq33ceqw+DhBsUTJsb3bi+yjFWk8BNsqcRtj+MMQyytImQ5pJ9kePEIdJ
         /ExQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3kWkSXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si49937qta.167.2019.08.28.12.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3kWkSXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33U5-00008J-27
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GH-0003h3-DF
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GF-0000G3-4Q
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:41 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GE-0000FH-Lu
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:38 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so202977pgp.12
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IYp58wrZObrPG3dx71Rbw+Ikj8Xd6H3z4vbXYSZpilA=;
 b=E3kWkSXHIQ/XjfMSnhIfEhiX4W8kQE5YpFMq/uOWP5nU8c6ytbUscbra9APHSn2nMM
 5oLCsWXFYFCW4l+wsq1vzNOqA7VdoSvev7pCz7sjlDM0vqAszelyKafxbxmvRp9/4x30
 N0xr7O87SsQLYH1NQNfahHKSjtpSWzk2uoTEo8eBorChnLSKB6j35IajaqDa2xe9apqi
 bjzBihao9dWc8DmqFZVTMMXciUoXkloy71ydfg/06kldWxXt3d2WW+S5WsrFZhUWkVil
 cpPVZ3RVKSsxzRfJJKT7nUdvAQVjwHpEih+ruIZm+cKcBM+NKCYY1d0XetpG0xN+bpYf
 qeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IYp58wrZObrPG3dx71Rbw+Ikj8Xd6H3z4vbXYSZpilA=;
 b=BjBfhU1VivnKPcEhwMrLrVT6hbUgARDRD1/uDy7qve6yZrbMf7wpg4P7b2gHxZ7XZP
 SPnNplTchY5igO2RpGSPaIpEHSfjU0SA0qo2tC8h1cbhg0mJLoiIHem+cDQzKCv6s+TE
 Tw5bpTJPfb1f1J1ZKkN+s4LXPnwIpYVNTX7TEo2jNItQjvOWMzRW6m37V83FDLrYkHjK
 dk3Q360Lv4BqJha7nPlfSwb5JXiwpld4avirbLXo0P9LtGYFofIExhHyp1COIqBzBTnR
 Cnk4+/4wtGG6bykAsGApksGnEd3t9A1AN08qc88k/HRNN5xGVA91/ACync8g8lTTqypa
 js8g==
X-Gm-Message-State: APjAAAUCOCYkC687TCXk6d8Z2nnezr67bgt8bYP3KYhFDiuOrF129s8L
 SaVS/T8mdKTItSlJmbQYFRTLqw==
X-Received: by 2002:a17:90a:9dca:: with SMTP id
 x10mr5887840pjv.100.1567019137672; 
 Wed, 28 Aug 2019 12:05:37 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:16 -0700
Message-Id: <20190828190456.30315-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v3 29/69] target/arm: Diagnose writeback register
 in list for LDM for v7
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
X-TUID: yra90DWZXVPg

Prior to v7, for the A32 encoding, this operation wrote an UNKNOWN
value back to the base register.  Starting in v7 this is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3a96866531..529660eb35 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9964,6 +9964,15 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
 {
+    /*
+     * Writeback register in register list is UNPREDICTABLE
+     * for ArchVersion() >= 7.  Prior to v7, A32 would write
+     * an UNKNOWN value to the base register.
+     */
+    if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
+        unallocated_encoding(s);
+        return true;
+    }
     return do_ldm(s, a);
 }
 
-- 
2.17.1

