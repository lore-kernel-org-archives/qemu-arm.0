Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp49213lfm;
        Thu, 25 Jun 2020 20:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyCNugE4MI9lklXWWO9Omj4S4BGyj2bLFHh+1s40t33cOHtTvENQ2trvQl8SmAGsT1xiep
X-Received: by 2002:a25:fc26:: with SMTP id v38mr61516ybd.314.1593142500438;
        Thu, 25 Jun 2020 20:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142500; cv=none;
        d=google.com; s=arc-20160816;
        b=P/lYTNOPz3fXN2GEHQspopyih1vyTCpaaGnJ6BzrrIVxi78mhk/cjP2m95kaxTUohs
         Gs70Mh9JJqhkxFdgAyVdsAwBcDoz04grRSIN+Y2GQn6VqENclaAZ+qtELBP2pc9wnFQ+
         L/EZAGvsOTJYjMQvhqoEdrK8iGOyWRkqvrRGhKFyir5wH6dndc+9pzmFIHoq73h0i0yn
         /7Be4aCEyZyAuyvYShgiqLlFwIYjBGV/8nAkqWr9lic1PZPLQqLbKav5yz51cyWt9r8L
         GCOj090hgNsq0ngHPuAQPZbzg6b4+vfm80Rdui+NYLCg69n6f6VFaRutqgwdQj8ytj6C
         dS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qjCCkNm/WEF6pUjIrj3rNiuTiPovNxbXAxAumNuxRgg=;
        b=HsslQXPRbXUEPkpfl1W2lipwzaQWjWfrkaIUJVWmlSsM+O+aarsTSrrlgIc3yn8y61
         WffO66iBAUyo51uFiVXW2ekPlvxAPL4PCvSPgY/PCCYy6hhrOClbBfD9QVBdNO1qMCZ7
         KwkTzdOntB7noloEHmaJlW6Im7PWzQp6UduIfFLHiyrj5aLJ4llWplotEh7rewFbhzta
         KNV5jIIcYv+QQHWPYI51Bi4vdAGPDNTWOzPajPDUFsMIlwTocuogMbR9BW4vsqEm+4kC
         6VNWfVEd7sMDr1KBLhPR5KJoIaG5DeNFzIuh3e00ULZUGTr2jMwMmJ7RiK4zT/W6j62X
         DY1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sl0OPoAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y125si24010258yba.211.2020.06.25.20.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sl0OPoAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jof8l-0004wp-RC
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5q-0007xB-7a
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:31:58 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5o-0001lT-ES
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:31:57 -0400
Received: by mail-pj1-x1042.google.com with SMTP id d6so4363692pjs.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 20:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjCCkNm/WEF6pUjIrj3rNiuTiPovNxbXAxAumNuxRgg=;
 b=sl0OPoAPJZ32vi3cuqMGpLe0l1Db0N8wy2GmD3dvaF2SWhvYhBzVfmDl3Al3Of7q4V
 nx3iBeyV8jBaosfUhbyD/am/XYhiqYXyTUNoDHJwTZYiyQSi679GBK3tbaeYd6SD82LB
 +b9r9VpDHqggPa6hfwFO392CZMS6jfscKypQslKAxN4EK3ZnW8ibV8rUBB3Kw5zqMqGC
 N+6Z9fBbbwQc7yrQoC+8w6mN0T8IdOS0fAlN5dhKOUmGMaIUFKKU+iZI2wgisPO2qGkb
 2sKrLsd39OA4zzlBC3GYqWSXs661HYML0rbj05l0AvwsEAD7ReT4K7o5Nu2/OtJvut+Q
 SbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjCCkNm/WEF6pUjIrj3rNiuTiPovNxbXAxAumNuxRgg=;
 b=qvEKntHju0Q9aILb4OM0910O5t+0QwyoSQBfI96RwcWP5ZdSAXzHc6+6h3FpJSg650
 VMCcSOfQJBUw375ypUDQMymb3wBQwJKJzP4/gczYOiaRPdIeYA4XvGrZICvP1j+feSU9
 ATpWNPH//yLQfqn3fkNJztNZ/VltVXUqpGPVrNK/ZpkdPZ93WM1HYdg7rGF1QWLm9Muv
 q/u80H4bBuleMqOHexUbW/IUidQSVWErLtUswLZgmPjov+dA7cwjC4UKa0KT/+72muoL
 2R2tAyGYPDad3yUd1vejQM1e555RV6StqiHeEWGU81uGzIqPhqhKFUnBGh7TapGAE5ca
 WafQ==
X-Gm-Message-State: AOAM531d1dDS0SEZTQ50UEqUBgM9doHIQxTyH4ACxKVYXDjYjmBs3Ovn
 DCJM2fqntmP1W34jrXzTU6s2timwZI0=
X-Received: by 2002:a17:902:121:: with SMTP id 30mr903461plb.44.1593142314544; 
 Thu, 25 Jun 2020 20:31:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/46] target/arm: Add DISAS_UPDATE_NOCHAIN
Date: Thu, 25 Jun 2020 20:31:04 -0700
Message-Id: <20200626033144.790098-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5EgHpatGbvb7

Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
but does not exit back to the main loop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 ++
 target/arm/translate-a64.c | 3 +++
 target/arm/translate.c     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d5edef2943..6dfe24cedc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -173,6 +173,8 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
+/* CPU state was modified dynamically; no need to exit, but do not chain. */
+#define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e4795ae100..027be7d8c2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14298,6 +14298,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_a64_set_pc_im(dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 146ff5ddc2..c39a929b93 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8874,6 +8874,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
+        case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -8897,6 +8898,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_set_pc_im(dc, dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-- 
2.25.1

