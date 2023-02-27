Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4289449ejc;
        Sun, 26 Feb 2023 21:29:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8RdPaN7TIUwU9ZcF/gD+APbzp1+chWVWGD1uvsRWhdOfcAYbXrPoYhnYqv43GarMWNznSh
X-Received: by 2002:a05:6214:27c4:b0:56d:3d6c:84d4 with SMTP id ge4-20020a05621427c400b0056d3d6c84d4mr42546308qvb.24.1677475767241;
        Sun, 26 Feb 2023 21:29:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475767; cv=none;
        d=google.com; s=arc-20160816;
        b=E3jcD3ZXhqTE4NZEBANswYHzy9HXkwgw6gQL3oqyU4AHQcfWHFVrkQlOQwUF4oQBUg
         oG1hA52U3+p4qHIYY+gsP9MzFP/ZEvJ/rweusk6I4Pv+lR3cDKviDvn0DIhkP7rMyUSR
         hp8ydldPGH4Cfo2VvvFuNgFeQGnDgC9tFrIR7fqyJjQMkeolL8MKCYA7yKjAE3i3KnT0
         kDClzZSx9qZpePJz/DoTQo571tSPTALxO0bdQiqGt7rn4WwHMfj/08AL9CYzxLeG1stA
         VASrnVOSB7s5mmWOrSOKiSyu4ukWGfffAD791mMwrdaQB/MabF4kokyj/v7cQm3sgC6C
         z2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
        b=bsbDk387kgqkCk/BuUXTnjb1bcKVByCQVwDbyTbelK+cEjFTdba0yv7lCRF332J/77
         rn8efgSws5bm4CnjZ1Fk916Nc2bUWVYNDhcOmppAKFHTIOjt6MU2yZTWhPJ8n8l4X/q8
         /U8HyVZqb83yU1CYK76NiJtevlFfqw26FWbtX8V1yWiwqUAY4LASAl88clx4+1W2B5yv
         aOmaV0gDRfdHsrczb//tufp015RUm2Eo53v0nNZ078kUCMuFdWe59lAi6IExwY/fXrny
         V+3yGfOWjGpU9aVgOjbCeCcN7nH/l0akVlW+JeFt4sYMPjqYN7Up4pop+5La31oRi6Yd
         CdBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pb2kbo47;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a454c00b0073baa1d934esi6413774qkp.689.2023.02.26.21.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pb2kbo47;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW1k-0007hb-SV; Mon, 27 Feb 2023 00:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1Q-0007DB-VI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1O-0007X0-MU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:26:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so4854927pjg.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=pb2kbo47HbvRUUNVkcNeUOtIqlWwf+DS4XGfQ8tzQfe9OtQpRnodhBoB9GMTVapI80
 Nm1umsGT9uAdU3Oy+UOieeyzrQXsRxqZJJjJC+r4I+4C7Mx/KC5ztwjn9Z1vSRLyC2ip
 uB/PXHbWywghcgZ1i/5/U/4LOpyLs95nuNmdPO2iQngNIaDA8pnR06JHzZOzJAEloxnH
 JuhiRMw/Wh7QCBAeHhYRMOOi/YvnQMOVzXUT0PqJK66OwmZcW+ieQ9X6TKdj2JM7S87y
 b/jD5bc88xWq+BJJdS2RYRwZ9t/y/LadW2yoRHHcQEscSlFvQQX+pwtpZzHHknPtryr0
 LqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fUKDP/sNQLKaEx4yocSZm1dTXssXHt62OOCODiQNZGU=;
 b=e8z1J6c4zfNjz4d6A+45TuL9oIDsl3KkuXD5kUOmuf9d0Px/7HdZRsxZi6waok5w4r
 VSWtKkCq8FAXnPkrWKMRczTECcnn5YgVc3fOWnVMCMbZ+KxxHBVCcP9QBaeyGNJaMTh2
 pDEphnmBePXVtbTbRIEDMx4/FNzmRpEz3qPgcfRts2fikeBIdshbrtW812q5FI6BtWXW
 46/WK2HkpYeB3hTtcpS0urU6dONIcLbU1IRF6DAROYVTeiluGEqiPSjAvWQriDZgMdyq
 EFQjNHivLP4WX11zUovZ8f04mIyZ5X0E8HjsmaSPXmuY+g7nHn7JZornsomENRZzZxUA
 cOIA==
X-Gm-Message-State: AO0yUKVeIZ8zYNxhIOj/rYTlvzKpWSuXdyKZZXYU/oqbDIxPNCFWv0al
 R5L7U0L1AknYu4xuDjNBD4F8HjDza446UR9n0qI=
X-Received: by 2002:a17:903:42cd:b0:19c:d452:b282 with SMTP id
 jy13-20020a17090342cd00b0019cd452b282mr9040245plb.12.1677475557365; 
 Sun, 26 Feb 2023 21:25:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 17/76] target/arm: Drop tcg_temp_free from translator.h
Date: Sun, 26 Feb 2023 19:24:06 -1000
Message-Id: <20230227052505.352889-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pZ4lZ2ZiYGMc

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index d7fdbc1e3e..3dbff87349 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -331,7 +331,6 @@ static inline void set_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_ori_i32(p, p, bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* Clear bits within PSTATE.  */
@@ -344,7 +343,6 @@ static inline void clear_pstate_bits(uint32_t bits)
     tcg_gen_ld_i32(p, cpu_env, offsetof(CPUARMState, pstate));
     tcg_gen_andi_i32(p, p, ~bits);
     tcg_gen_st_i32(p, cpu_env, offsetof(CPUARMState, pstate));
-    tcg_temp_free_i32(p);
 }
 
 /* If the singlestep state is Active-not-pending, advance to Active-pending. */
-- 
2.34.1

