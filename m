Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4303452ejc;
        Sun, 26 Feb 2023 21:54:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9xKf6ZChe0vzRJB9HkkxbKQNly45HEPVSfwzeWQcRTJsVuFXo+khTudCap9b0e+cmb5ByR
X-Received: by 2002:ac8:7d83:0:b0:3b8:2175:fcff with SMTP id c3-20020ac87d83000000b003b82175fcffmr42848744qtd.31.1677477298121;
        Sun, 26 Feb 2023 21:54:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477298; cv=none;
        d=google.com; s=arc-20160816;
        b=Dtpg6PBqpR+EBM/xymTP1oQqM8hK4gMqHAOgrfdt/qMipiAiRQ+u5/txz4TXYVgl4o
         4dq5Nfkq2uajl1CZ9j0z9DVXs+KxhZIUobYXow7vFYB+sNry0kkQl6B9bBpkXQbTxory
         lE1828JcRGHIXPQZdi+/t05PqJulcrH+M+T7Wv7uBD2R5b62mDwz4DqH6LmbGJ+YMxp2
         T/FuM/9r7aNxPZKolBrDEkm9cSp/akoaWcgDkKVc96Uw7TKejuEdlutezLKkQO7vkE5z
         KnbaaZU3cBZcjxec5xfaAmXOtY4iQUwZeSKFLbr7Gli0MmNfT7F6qKvU2YGs1Sw1sMQN
         rxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
        b=HnSA7+A8tEz6/N+fSf2jLVJFVQ5uGv+K1T5//pcwjKzJPHhWoE0oonuJ/Tb8HJ4WX4
         ekO8Yt2/ghxx5egL9++34danHRh/K7P+q08b7vFmlvSmNA4YhQ4uY1UgH434zzBI6UEl
         41WTjTqWsuCq76yekef+dBNrMJklXx24XDWtfzP2ZK/vArfgQhpqIkrQfrl9+dBUAWvi
         Xej6apACwMQVduKkG1QPfasar0sejDfoYeAHT2sBpzvVY8nH6y0Ao+ufyyVJjegrxPR6
         4/24dzTKLERDnXTrZV2dwudwDieJ4Ex7c7IPvJ28VdDfGFUCZchCR818EP0rCjo24gxP
         cOlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XE96EhJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85753000000b003b69723b361si5440431qtx.773.2023.02.26.21.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:54:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XE96EhJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW6L-00052N-Em; Mon, 27 Feb 2023 00:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5W-00033y-4k
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5T-0000Lp-G8
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:30:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4369523pjg.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=XE96EhJN+TaW6zfldy9kaaWagwgVOeCV+R0fCrCyVAa5mKlAS7ZXPHS8LadZFvkeOc
 OJVhlwBUtUO3L1Gq/bu/shyJT/o10aYGxr3CqgF2gQgA58PzqWjKBOOF1lmfd6nbmdwW
 KPJjrVn557j+Z/95YslK+uzaRIvtXVucDIKbx7SD/pyE+f3Fw9CqkKSs+hmWxna2+gb0
 U1dR6ct2Y3kuuAb9THnZqswc+qEb+XDpXRXKB/6KnJsXwjlwrbafcMO8b8u88Ij2yPaW
 TsV5R5nInFMEezpTj0+s4ALPTpkPWXDmQZm8ZYrCPADVDFvbTGBqXkqk0hHTC7I+YRK+
 Kpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHoTHrUgBZpaOPEfBJAi/HMPT06pVs2AARTKGv//H+s=;
 b=z8qwSOd9MdOHBSlf/4NnwzDhyczbYuOYBvriq6bKHea0muxYFNvG3LggXxDtIVMdRM
 +HUQOfiDY9p4OVklztzw71IO+wsz6no6+StlH7sHRA/r1R+BGqGE+slgqUH3iaLfd/Uu
 x7bfcSjm7dD8haSrU9OJbTs1KXGkxPwKEDa929y/rEtOtWOGKpzMcqekvCicbLNoQgwY
 Tp8zCQ7FyEN5Mj1tngMmQ7O8Yq/dPTB9or7KKyedVZ3u7AH0TEt5fXa6Tb4YB5MEjwAf
 vNHnpKintLL4otKNAOW97ShOVfh2EbBupnitxeF/v8u8JzdilmbPtzZDxUifvsBpBUrk
 nntQ==
X-Gm-Message-State: AO0yUKVfFssjWpFN1gagYWf0g+6LywFRX4x6klQMOkPpYw/LkV8mqyUB
 AohjnnURhuKdcE+qsb2E4rqcfQ==
X-Received: by 2002:a17:90b:3802:b0:234:6c1a:8d9b with SMTP id
 mq2-20020a17090b380200b002346c1a8d9bmr24451990pjb.0.1677475809908; 
 Sun, 26 Feb 2023 21:30:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 43/76] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Sun, 26 Feb 2023 19:24:32 -1000
Message-Id: <20230227052505.352889-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6VGD/zfIPiZB

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1

