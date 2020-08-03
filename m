Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp6440913lfy;
        Mon, 3 Aug 2020 15:44:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwhQ9pxKqYRyDo7i/8b7icgfi4mSvMZxdtner1Sb7AE6zRuvGRnxNlPC9OF80vPd5bM/Zw
X-Received: by 2002:a25:ba90:: with SMTP id s16mr29381366ybg.206.1596494644155;
        Mon, 03 Aug 2020 15:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596494644; cv=none;
        d=google.com; s=arc-20160816;
        b=jQ6OmBwQON4yUWWTctF0yiF1RkgiQOI5yLf84ndIe9qICGatExNzVL+COBazUG/9Sq
         3MNycj8tsC7v7HpY0/qwhh0iNIzNSZZCeshN///QZKc3Mvl7lTKfVybRcMulL5+l1oSl
         myZBFI0+Y3eMNgWe23dtAzDZcmCATSPoz6kd2p6pQHS3njGjF7KddfZEdW7GaMJLjEdU
         9o2bc8p0czIlHrAySyzr+Zeo9fojos1OO7SLO9SBSqD+8qWwcaSSbkXdK4+is/7mGUMV
         J5n9VZzmWD0QH+e7yMzOeuSx/klQpOzRZrnCCff89WmnsWvL9ssgA7MvdujfoWjJt6cZ
         6Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=B4m3PxqDTvPw7tm6WU6OvMjg7gp8LiTODdOlcgxss48=;
        b=jWIBgnNH34PtrCjOqVrlGameIDPn9+yCGyRuQ5U3l0LmgBDks/JN44EGgHHKc12BE1
         l7HbfS3oNQQl+p8T8cFwTMi691vkZJpVjv3KLMAhH4dRTV3w3TSeN96v5EBXNfl9WS9g
         UW7bo9iAxpE+/Z26p1V5Rxbq6fhDZtLmOqA6SMHdVHTX9DNci0xkrazuWbsH918jCSCw
         RO1yOlYVLuiHBLuvHDQijNk8nFqp7xCINrgz4OJAiGdkaF0OVqG+3/fBJgmrOIf/qfzW
         jHnYiGyezPWrk69/cWK6WYOMeeyZo/WUsrFolAQAS/d8L0qzrKTaBoH4lUUlNPuPPfVN
         fvjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fPxfARKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si14822797ybs.337.2020.08.03.15.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 15:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fPxfARKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2jBb-0003CI-Ja
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 18:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PI8oXwMKCPssffjrrjoh.frpthpx-dupqrqjqx.ruj@flex--pcc.bounces.google.com>)
 id 1k2ivR-0007pF-L6
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 18:27:21 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PI8oXwMKCPssffjrrjoh.frpthpx-dupqrqjqx.ruj@flex--pcc.bounces.google.com>)
 id 1k2ivH-0000v7-3E
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 18:27:21 -0400
Received: by mail-yb1-xb49.google.com with SMTP id v65so2706421ybv.9
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=B4m3PxqDTvPw7tm6WU6OvMjg7gp8LiTODdOlcgxss48=;
 b=fPxfARKZV++9IqcKNXysaShvxSS1YSg6hH+9Nkfj5sFkvVJy+YAMMQQEO7SmaDpJrB
 arcF/nrHiRaXugSz2v9e4gMr7lwiEI8LTLmJviUpNyffE+xbgVyCuAuXw7uFvmZlhkP5
 OtlwjXvTjZ0Ejt1n4F5IN8NwzEK/D+4gCobmnzyr6ay9QxBDJ1eLqIQYMpWfnlZNTWvM
 8+A2WBgCp5AVDEdebSzwQfevN8BLwvLHw3PYTFR0lzS6TFDaxT5JO4X06YXOjmXPprV1
 isO2tbCA04ajWvKOgZi9jTy9e6Dvegxd8gxk/Y2nWP3M5uS8RItwCP5uhZimOYKD2DN1
 e2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=B4m3PxqDTvPw7tm6WU6OvMjg7gp8LiTODdOlcgxss48=;
 b=lVqUHNX5eNRi1vvreb/zdxSL0wZ3RVpRQdjTWysPs9Du4qlCgqojo9XK/pbEsYgrh0
 Rh9M1C/oy+D67YtsviMBkbqNH161JFEprNhRuTpEhf4SMakIE7C3gbe9E7Pl6FDcoAuo
 HDlVa7hj5scXH3X6cKtJgMRvEa6RRXJtWAwUzs11koinRJ2BZtcqVchBXwTv45RyKCB2
 H29FMoV41DeVRPD39kbVqLTQ9wbfBbPEe++K6oejOrw4rdqp275/ZurOD5mKoAc9XcoA
 FnVsoMpY5LKwm3sRUuQshWuLj/ogqwMubcL1SZ+WHcXnhrBKPiF8MAnRBrSqf4BT05CP
 mBEg==
X-Gm-Message-State: AOAM530J2ST2Ne02C7yHtiavVIHmVyn6OWyFKoEFluQ97wjYwVXjSUvg
 riGaj5MXvRVOXTgeadlT6Pk7VTU=
X-Received: by 2002:a25:bfcc:: with SMTP id q12mr26869346ybm.166.1596493628017; 
 Mon, 03 Aug 2020 15:27:08 -0700 (PDT)
Date: Mon,  3 Aug 2020 15:26:56 -0700
Message-Id: <20200803222656.63936-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH] target/arm: Fix decode of {LD,ST}RA[AB] instructions
From: Peter Collingbourne <pcc@google.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3PI8oXwMKCPssffjrrjoh.frpthpx-dupqrqjqx.ruj@flex--pcc.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Aug 2020 18:43:54 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zu27YLCHWiUE

These instructions use zero as the discriminator, not SP.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 target/arm/translate-a64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c0764957c..c996ca1393 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3429,9 +3429,11 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     if (s->pauth_active) {
         if (use_key_a) {
-            gen_helper_autda(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
+            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
+                             new_tmp_a64_zero(s));
         } else {
-            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
+            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
+                             new_tmp_a64_zero(s));
         }
     }
 
-- 
2.28.0.163.g6104cc2f0b6-goog

