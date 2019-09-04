Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1113418wrp;
        Wed, 4 Sep 2019 12:31:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVajaDnxb75oGPLtubh0sJ5hY0VwBzrTaHQ4rhojCfIoT74QIQ09C/yEma4Z+M2t/ni1wT
X-Received: by 2002:ac8:19c7:: with SMTP id s7mr30925597qtk.392.1567625486029;
        Wed, 04 Sep 2019 12:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567625486; cv=none;
        d=google.com; s=arc-20160816;
        b=WFMWkEgcYY3scNTOz8PM2RLz5MC2A+xhcY2084AHXxHvk0OWiwuEurjwZiEftJajMn
         hfWR6tB7cQypVSE+vsTXy+jge8D2URVVjsOIpIgQmC3kcruKt/FdFr9qKzPGfMFCEuC+
         30NNgQfbZqy91nVampkoCmzhFd9EDB+XW4eU7PmklmHN9BnP+xnm96f0lIfrSO6k7Sn/
         EXI/Rr1QYxUjFQjgrmjjEIfm9ZdcMGpNLiyAAxKjWqpZvSts3ox1rFZgc/pvXPNouMqe
         +SoUbGprfK22acedhmKiPT4qXXkjm6sIDV06uIk+2NwkMXnJITNP0kuK9ZAa247uIZL1
         0M5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=FjDIKcJDagE4KvmbL7+MpEBImmBNGJkd778M5x6AXXs=;
        b=fWIKXu4ty9uv46A8/1M+ZhBMVD7olCxlXHeGxkcufn6bMA3dENz9Y2jEztDfKveqMX
         zegDBd58p6GPDTMyCJupXNnaxZ4r+quEflaOvQy1u65IiEw7y/E9x4L+1lOUhC8OjNJr
         rQLf+HVEwUvOsyetLhXwfE5nO2PnPuOXDE2OiUtDDzFfVhNwTJbBoXbzB+/RMP2Rdpns
         vLeoCG9iC+6z3R4veMnnnWsJD8MVlNxL0jmnA3U5wtPngh2zqhHeS0B+kCgxfunb7p+d
         QJq68zWXB87uOC8a7TDx9Sa2arRefQ70Q8WbbQ6RbPHKlarHCLIA8f8dhKtfNN5zsLqa
         p42Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UGBjdgwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si9893754qtj.165.2019.09.04.12.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UGBjdgwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b00-00044K-45
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azh-00042A-6p
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azg-00021J-0x
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:05 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azf-00020Z-RW
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:03 -0400
Received: by mail-pg1-x541.google.com with SMTP id n190so11794580pgn.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FjDIKcJDagE4KvmbL7+MpEBImmBNGJkd778M5x6AXXs=;
 b=UGBjdgwLFxZQx/7pCfVP8X7GevREYhNUXRnu5/WhhS3Dsv/v5o4cV4hg2C57d8LLK9
 WemmVHXsSrwYfz6RZq7JkIWRNh3EoG3qdTis/hP4Euey8urPGn/7fbFaVddiXPvnPg6y
 qbavQnIApVlH1A50cgjvtr+dylOE/8x5OT75eidBdTUvDZWws17i1u1+pGhTYL37dA5A
 tHIMgUkSojAZiWhT0nxdlCTksQfTRzyjmgNl0vOzHvxaMnCuFz1KpctmTxqc3vRloKhD
 KCYQYEvtIoLk8YxGujIxkmEKE7zjDmhUZUhZ7FeEIlbAMBC9mQuPUxbOiiz2cPzfoo/M
 qweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FjDIKcJDagE4KvmbL7+MpEBImmBNGJkd778M5x6AXXs=;
 b=aP40SMT4G4OQfJV72k0JJV68kznWq1DC8TfM/06vWsyi3WRehMo98V51T3uLx3mYgY
 /ZiMUQeJnLzRsuO56nYh6yKXKFOzyDzQ3RbF38UwBq0JTE3CCuXIExd+q2xMELUKdBiQ
 EKN97hgSEy7ChdrMC0reJ1U33IB7qXNkHgLOEMRcPTd2deg9qSE+qsQCwakC/sHJx4Fu
 sMFMZEBlU/FB1z2LZxbjloM6hDAqtsI9U9YDGxyG73NeLntql2NfbPWjlfs0kTp+2jTZ
 yfBh/vlCvmIhMr3jllGW0bc6Jqld5ANvJuZanSzT1T/T9WxdThlXYYC1gDrBf+B1sZhh
 B6ew==
X-Gm-Message-State: APjAAAUdL5qzkperbSh9fVnv/4wlJcKHJpCIe3/RC21IHeP/4HzOf2Si
 Ue4up2DK0//JhaHiIwEItJgZKw==
X-Received: by 2002:aa7:9508:: with SMTP id b8mr31570203pfp.36.1567625462903; 
 Wed, 04 Sep 2019 12:31:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:29:51 -0700
Message-Id: <20190904193059.26202-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v4 01/69] target/arm: Use store_reg_from_load in
 thumb2 code
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
X-TUID: 8K9d6I3YfNOj

This function already includes the test for an interworking write
to PC from a load.  Change the T32 LDM implementation to match the
A32 LDM implementation.

For LDM, the reordering of the tests does not change valid
behaviour because the only case that differs is has rn == 15,
which is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b0d32ff8c9..a39f792463 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9742,13 +9742,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
                         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        if (i == 15) {
-                            gen_bx_excret(s, tmp);
-                        } else if (i == rn) {
+                        if (i == rn) {
                             loaded_var = tmp;
                             loaded_base = 1;
                         } else {
-                            store_reg(s, i, tmp);
+                            store_reg_from_load(s, i, tmp);
                         }
                     } else {
                         /* Store.  */
@@ -10889,11 +10887,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_temp_free_i32(addr);
                 goto illegal_op;
             }
-            if (rs == 15) {
-                gen_bx_excret(s, tmp);
-            } else {
-                store_reg(s, rs, tmp);
-            }
+            store_reg_from_load(s, rs, tmp);
         } else {
             /* Store.  */
             tmp = load_reg(s, rs);
-- 
2.17.1

