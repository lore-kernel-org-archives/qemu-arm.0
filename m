Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3183416wrs;
        Mon, 19 Aug 2019 14:56:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeVk0KG7WU2znk+T9twJgLej91FXI6gZaeR2D/TH0P1G5yHc6hzB20AZzeuYiIYfeK2HQC
X-Received: by 2002:ac8:7094:: with SMTP id y20mr23369684qto.140.1566251819854;
        Mon, 19 Aug 2019 14:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251819; cv=none;
        d=google.com; s=arc-20160816;
        b=XVmaxSW6I2aQ9K7sQYF4Agc3f7dvLxBm7BaHFf51Mj6kExuN8cpYYJiydG2ljC5NfI
         dyhlObhb6M/DKzPFusDW1g9IEat/3++OiaAdqQsH8z78T8KhHHgcagWhX3RXGqKhcZqW
         XT7B5M6HgY3Gl0lNz0I19FRM/9fJ9uzTt8X0qrIyMd6kcrtfV2QQbvMSsLcU3vcglTYW
         fTDMn5tGHsG6lsN0wgdwBjuLWV6kpl3vMbnhAoT/OIq3/K69UID56TuCFi4kqz2ks1qc
         f5RIxXZgD0HKi+iO4QnSeIHfOKOEoWqmqO/IOT6RwWLAd4+rrvHtmxOp2VDECjrx641l
         EKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=cT5iUCtc/TpahCb9mQHDGpDMCKYLz7wFvW1IJP8R1rM=;
        b=gZyFJ7ux8iNnGZbdlxgxeaT1VmmLmURY+nY+UguinUcdDNrfx0ONWAw96bcOIIqHC7
         ml1uea7gHgKCxuUyQb3r7L1HnlrmNS1d9Q228ZMRtP4GmeJnKLFwKPo6aosE4UxYh5WA
         yGlaSWC0DSwiLydpF4+LKb5NFGPLejhMkpK5+7wGxhqcI5nJfgzIetC3+VK5f5HjL49b
         3uCDQGn16DQeBW9rPx2lBQC3Sy+VRsWCV6dg4hSZtLsah8VMKXSaIL7H7Xy6oAJc19qT
         79tgNZABKLkX+AJxg23vjLdooc0VvsOYq+fOrKnckoAfRu8MxrztAObkY7CVnQSZiUmx
         1ULw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lt6jyPRX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si9960922qkb.322.2019.08.19.14.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lt6jyPRX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpe6-00087s-Ul
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMI-00023O-Tw
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMH-0006Mm-PH
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:34 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37828)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMH-0006Lm-HE
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:33 -0400
Received: by mail-pg1-x543.google.com with SMTP id d1so1933236pgp.4
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cT5iUCtc/TpahCb9mQHDGpDMCKYLz7wFvW1IJP8R1rM=;
 b=Lt6jyPRXPkhYjZoDRfVNn+cQMWd2wYuXE5YkYeaJGJs2Ch45FXr200uR+MKGQR7bob
 R8NDvUDCFDCznJ49LSZ2RMNuoO8t7fgNy2C1k8rQvCgXdcuhEVfnwO7PHucoKQEZgaum
 n4ZOX1dbw1td4u9DkI43VzPI6NWtAlta2Ozboa18zo/6h+F1Tv4Nc2NMxMcjOkjwZMMK
 mE/zKVVKx4Jrv8l0bnVEwGxDPKULjBtvWxAnT6cXtvK1XPLs5/GFODlhATZURdarx2Gs
 Dj93p7LFEYhaq4hyu8eHK8GOYc7odqX2gViuVp1+2dy/im8rcTEFefrM/GAh6X/rBbOv
 ubnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cT5iUCtc/TpahCb9mQHDGpDMCKYLz7wFvW1IJP8R1rM=;
 b=mPmIkNcBpge74rIYzCGy/X+s4aavjG9AG6KXXEIxIt47VclaRXQieMmOT3LznahmVa
 d4NEDJSxktM43LQ7oXHJGdz+MXUfMofkWPzHI8bTUOOBdMD1ZpMBuyncsQfpdKGTgD5e
 2L+z/Z4xYIvkCTo3h4y8R6XKdpnsxW2uHIcOc16EBafLv3pf6EbwPRCfnIrj/dwQ7Krf
 +mecA8vhVe9rDDtizjKXn3Rw0/qGrmgdNW94bDwq6Hcta+qTlukLsqB0QXHdhDz71EP1
 NHDimJ9AqdLGJYO3nElQ3fovGD1NjRj/t0M60Ju5CJWvqvJjy/lUhtYzmLU3wpntPNIB
 dGNA==
X-Gm-Message-State: APjAAAU6KIOPR1U7D6mneMsc6klvML1Qfi73qHCUN8psORNB4ySHIQ40
 yZWRc+28/o3BzoBrsGXtLMvxoduDy6k=
X-Received: by 2002:aa7:97aa:: with SMTP id d10mr26529772pfq.176.1566250712299; 
 Mon, 19 Aug 2019 14:38:32 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:15 -0700
Message-Id: <20190819213755.26175-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH v2 28/68] target/arm: Diagnose writeback
 register in list for LDM for v7
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
X-TUID: Vly/OUhBV60E

Prior to v7, for the A32 encoding, this operation wrote an UNKNOWN
value back to the base register.  Starting in v7 this is UNPREDICTABLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4451adbb97..29e2eae441 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9880,6 +9880,14 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
 {
+    /*
+     * Writeback register in register list is UNPREDICATABLE
+     * for ArchVersion() >= 7.  Prior to v7, A32 would write
+     * an UNKNOWN value to the base register.
+     */
+    if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
+        return false;
+    }
     return do_ldm(s, a);
 }
 
-- 
2.17.1

