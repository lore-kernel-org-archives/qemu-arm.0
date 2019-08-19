Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3186270wrs;
        Mon, 19 Aug 2019 15:00:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyUzp69OmUjKpONwuQK22TOP4QqhFnN0PtqmYu/EhhBddHdotZ4Jq6BOMlHdny1HgZppNu
X-Received: by 2002:ac8:3364:: with SMTP id u33mr23518000qta.115.1566252056051;
        Mon, 19 Aug 2019 15:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252056; cv=none;
        d=google.com; s=arc-20160816;
        b=SzFQ1NZcuXCPRTm1effo/Q3JOPWmrwn7KihA55UVyGYeJWFhPL+dsNUdViQYnVBTJe
         hxPK6qc3KOACU83+KvtpAWZM9c726OreKxCUz0Sj4ycIhlvf/wKMKxTdH+daNnMTtT91
         3JgAya//yxeWxtyCwbLsBXS2K7WOKL+WKN1yNi/NabrLK/aDgimkz4i0bVqEMcMBIii5
         zIjBYUVr26nuWqBBWklzmNWK321+72eFJth4XMOG9F7nWi9dydUwXRtVmf7ZOVwsBwpJ
         dVjnT3cuB2H9l0VEghqU5qzqIRojvk3/2eYgykGKY9BlvMQwV+u62t3JpuJqy//Ptvq1
         vFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VR7o5gOGgy8kJ+DLCf8SWN2RwI2Evgg2aslGYIJEmas=;
        b=GamvDhaopJq/poBRmVEGORbaWL44eRaWYO03TAUas7ykWaDe1MY0I+Ip1ObVxVQtW5
         +9OqI/2rESUbmCZmoJTJg/3JAF2sFr/tD/9bASr5MntwX6dAm/alHoqW4pCt0PWgtTGP
         57XsXZsILPfNQ5g03i3Y+6bicRFvaihXgXpfwgOhAJexZ5wkGoPZiw2AsezUii1qRH//
         O4aYHMev8edQkaBc6lOwmMQh/WeOggqgUHkJxjgicy9C/7JQgldgo2BDea8aQra/l5Fo
         c0kxDAzdyVQMZW1R5KbX4qzbLUmF4X1Fzc1g1vp/ndyjcpIb0DAYmVhLpp/kr2ARzCpt
         RGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zoOabdEN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si8777768qkn.6.2019.08.19.15.00.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zoOabdEN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzphu-0005Od-TS
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpML-00027e-Ck
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMK-0006OX-9B
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:37 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39689)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMK-0006O6-3P
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:38:36 -0400
Received: by mail-pg1-x544.google.com with SMTP id u17so1931162pgi.6
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VR7o5gOGgy8kJ+DLCf8SWN2RwI2Evgg2aslGYIJEmas=;
 b=zoOabdENlkr74t3j2JqIBVCkTd4o5R1yV3FaVqj5B+UUBq08a51joHpguxhx3XF+d2
 uBn4pMJaw5sK0ld89+p3X06rkGQ2pUrygIPunWnxj7mSIgIMahct+/XPHgxe9i3V1D+u
 pFx0Gca3QVBQkZK7uitn5/pRClrgpFmdle/DvR4zwFHn53DQsxus+sV+IEO6lZpceCMS
 ubgUKj0xmSISIyzONFPSr2QToSLL0+TlZcu1WBsBqGzMb0M/EAAEb/tE3kYldi6BY0/b
 gHrMkjyyPMMcpTwOPmr+Sw0asz2ufxhq31Ss5fHXT2Opmzl6ebP3NajTzTfPMpCChHTm
 s1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VR7o5gOGgy8kJ+DLCf8SWN2RwI2Evgg2aslGYIJEmas=;
 b=W9W4/gxRPJEI4cL2FJIi82H0b9htGs4Zu4xRuXgPMh3m8g191U7uSQ9ODiZTwqgxXy
 9espYPq6c8kMtzaQLGF6o+oaq0Io5Xkdae/LDzTbFo+jnHjtXi3ZYOGT3vnxEJqeQwp+
 wvXaL64vlxJzeMlOxy3hTsk8Cic74dVPMyuV9ZD2p6+HykBnfYQ4SyIqbisPYP4Q0GeZ
 um6mmxUz2A/J16/vEvcPs7j9GQjP/pv7NXRZgjMJTS+tockbUk9G2zGo+0t2+FNuD/4y
 FZCrZ6Wofo0qtAyK1/j9CM5WQTQHc8v1DsR1Xz+Hap9mYCbqSv0Wd/nekVm74a0o8p0Z
 ElVg==
X-Gm-Message-State: APjAAAWx6eyBRPkvDuFE/I7aU3LiCs422+VVwOG2lUs5lsBiaodng6YS
 HiJQp/sGerku3uZvLU3MbWWa//AN9tA=
X-Received: by 2002:a17:90a:d592:: with SMTP id
 v18mr22935517pju.135.1566250714831; 
 Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:17 -0700
Message-Id: <20190819213755.26175-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v2 30/68] target/arm: Diagnose base == pc for
 LDM/STM
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
X-TUID: K6HATxrNTyA9

We have been using store_reg and not store_reg_for_load when writing
back a loaded value into the base register.  At first glance this is
incorrect when base == pc, however that case is UNPREDICTABLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1792bb7abd..09636aab4e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9752,6 +9752,10 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
     if (n < min_n) {
         return false;
     }
+    /* Using PC as the base register is UNPREDICTABLE.  */
+    if (a->rn == 15) {
+        return false;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9828,6 +9832,10 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     if (n < min_n) {
         return false;
     }
+    /* Using PC as the base register is UNPREDICTABLE.  */
+    if (a->rn == 15) {
+        return false;
+    }
 
     addr = op_addr_block_pre(s, a, n);
     mem_idx = get_mem_index(s);
@@ -9864,6 +9872,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
     op_addr_block_post(s, a, addr, n);
 
     if (loaded_base) {
+        /* Note that we reject base == pc above.  */
         store_reg(s, a->rn, loaded_var);
     }
 
-- 
2.17.1

