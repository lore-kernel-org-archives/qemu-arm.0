Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4238426lfb;
        Tue, 8 Dec 2020 10:09:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKqM+ygruF+lTGVntV1gX+Nm52pJBeSL9JdEiNfLxPB+AHLgIVAzMvhGu01hOBoJusUagn
X-Received: by 2002:a25:d257:: with SMTP id j84mr1361231ybg.479.1607450961714;
        Tue, 08 Dec 2020 10:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450961; cv=none;
        d=google.com; s=arc-20160816;
        b=zzbi7vpTA9ClfxmAFi1AkkuMrrbbUtUf2FAEMZ+2NfJJ5OKaMnsS4B/z9IK9dT2zOW
         DgDD3rSHJKBdbehSO/LSiNIGQ+HE6SCS2j3KymigoBX8KmGBRQDRmN6eZ/BNwLRuczQa
         7mGgPybGC6RxaS7Ypk2SRfxMIEB/xWjll/OBqsR0nXzkFxZeFvLIecO1U+ihtYzOI36Y
         Ey5newUtpijM8C2LgM5kxSLYjzDGtoctdQKzMRkv20i3uEsF+PWjAlZQItxsDcsf9XxJ
         o7cW4tkScZqjl2ehCgz9nbrM6qJSYfx3DqZnhFCr6lKKvrKENF8KCSqb8AEaOGB3Fc9H
         zj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eOhAHCW00JObSCY/rSv+9NXC22vyXoa7uj8AYdXLfgI=;
        b=v38ttPO5Rho8SRR58+WLmYpPlBaASt48rVoV1Ubd0v3dHxOAT/DhAdpNm6I+4Gskc9
         MYejL4xqHisD9q3YlK0uHw6IrMRtk/R+0ySwqHO0LKqM9jmVTjo9KcbK8o0GFFBafG1N
         ONMtYQInnlxIs/nAWmXO6bxvQxORnpnOAcagsL8FU2TzMZ2in/G+Kvhga5NJTt0VV5Gr
         /hD7NM1bT0pf2K1CA1IN6zOMxBCb9oqr+JhgIHB70a2bF5UODqqagrV+nWcMbjuvLDJ2
         GL523W4TSap7nLPhqE7kQ7rchgIeKlx5Eg+K2Uldd9OuQbNZzzUuI9fWRerwsttZFTaL
         9zpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qM3Bi5GK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si765204ybc.421.2020.12.08.10.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qM3Bi5GK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhQP-0005G2-3B
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIy-0007de-OU
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:41 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIv-0006MY-UT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:40 -0500
Received: by mail-oi1-x242.google.com with SMTP id l200so20280908oig.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOhAHCW00JObSCY/rSv+9NXC22vyXoa7uj8AYdXLfgI=;
 b=qM3Bi5GKQf9muZHpSYP/1xwnGfbBGA4DjdVfG5jIVRKTojhuiNR+v36xp+EdI+wkFG
 47iowSrWTFk6HVrdNKZjWex21cM7pe2by9ZLMDZ4ahtvirPGqEFbkcoLmsWQBvxAVbLW
 FXu1kl0//TX+ZeBOjgnrjW/jKUFghvF+XM76fY9BE9UwWZeBKal5QVwTocX0nFtMh743
 Ltxa7m4uUaTTk/ba4RxmezAFuvC8mCAj82OZfBP06VT2BAX3WUzgBYqVFJCjXaVRwuLS
 Nl4685FsseB1Pi+k7CLLGB9ggtHkq/MtfS2fEb+kldyPmqmVW4SLZvqDDXM/fHVZtt/0
 xbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOhAHCW00JObSCY/rSv+9NXC22vyXoa7uj8AYdXLfgI=;
 b=Rfpi8oCRDFMJNxQO1vFpXTtOo6Q9Y9VzEUPLy5+PXwc0/Mo9JOj2NJoLx+4u03TWAc
 nVpurf5+RDQdno7/o1kuAnFVNtDHa7PN4HF3w4f/8aeFZRllaiHsuRobwir3VA1EfI7i
 yn5dI9/peljlnjZtPkmivGAlaeAHyGWwijgERsc+DweI/tF3csm6caQtMu8kVyNn51fQ
 3nBO8nzn64KXdGGQ7DWvgPcLvl2YOr6E3kaC68IhmWjqrY3ezd4y4D0n0+d5cwVI3Vex
 utP5o+sW6g5tlVu0n/59O2WX416K0tpX3U9nnK9Xi0f7TBOzMZZrut3gxBbFvRrSseUY
 C9hw==
X-Gm-Message-State: AOAM530UeacyUkWRl24zNYMn+pAnqWRf3qZj9LzXSSyA/42DMRNf6vRc
 teWf46qLit+hWCP35GM8JlSPOJP3D8ABmS80
X-Received: by 2002:aca:4989:: with SMTP id w131mr3621219oia.83.1607450496633; 
 Tue, 08 Dec 2020 10:01:36 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/24] target/arm: Enforce alignment for LDM/STM
Date: Tue,  8 Dec 2020 12:01:03 -0600
Message-Id: <20201208180118.157911-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eoJc4D1srFRH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1bfa209884..6c76bc521d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7824,7 +7824,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7899,7 +7899,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1

