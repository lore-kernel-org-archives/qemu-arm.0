Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1135916ejb;
        Thu, 30 Mar 2023 03:19:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHfdjnZshIrUwQ7D9jWgZrFdKKVeFF9JsltS9kcKSZFuJ6T9Ym0vEo00h+IfQbNUUX6hE4
X-Received: by 2002:a05:622a:d4:b0:3e4:daf6:d8db with SMTP id p20-20020a05622a00d400b003e4daf6d8dbmr31035560qtw.38.1680171564065;
        Thu, 30 Mar 2023 03:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680171564; cv=none;
        d=google.com; s=arc-20160816;
        b=pT3v+jfJ2s62YDrxzumT23HLsWTeibLs8aX4Eb3ItAxX7f4UxiGDR2G9zCMwETnY8k
         iBJxMMHujOwlNpJXbpKdht8Qpc5m1n+N9Ir1JxQR2y6g3qfwZ71CfjRqBrxydVwVFxzq
         AFI+CE3jxaO74B4zW29CTGSmt4G/eq754ixxqwVmryb1TGbK/usrIzQjYHmt+US6rzkq
         Yqhbc/FNpJAeJbcrZabmDk6puiReH5UfZaoJBZpPi6IhJPnbYhV1c67uVgljjbqfzHAU
         iXfcSzU37QoV8aRIDcNy6TzJ1Wh9Tz4Xrd2jLbezsJK0OYeub2hUhW6i2a+K1L99ycHo
         wdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=33H26SmKB1RHJAPoW14amug925cmsjB3S/B1b0LxD4Q=;
        b=uWqidtwutodNk3duL8kG4Oqc+lE1EooXlObwn86YeYEiAPw+tHIMPs4KvPGVI/3VjP
         dN92lNqJS2c++B9gLCzMt+JyFM7AnVNXoRXKqon0jLsWflfzjv/RilSm2RzfofeAZsJI
         MkZlk2MvWdhex+dC5l9h/j+V+DitzwUylrscAHtcFO2KOxXTL7U5Gpqkag8pLuRNhNx+
         FsxZgberj4+h1yMQ7oTcVvoOluZ6nshqVQebMEZuW0YUapPdkCHt6/ulbXh8ZbZOfVaD
         zkKMRmm564tJ1+/llt/hKo25JT9yK/UQ98Bb9itWcX9p93jd82mQUoFSlhLTTbXBCnBO
         DMvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIEMywrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac84e52000000b003bfbfdb9660si7717361qtw.11.2023.03.30.03.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 03:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIEMywrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phpN5-0000N3-OV; Thu, 30 Mar 2023 06:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpN4-0000Lc-4a
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 06:19:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpN2-0001Rk-68
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 06:19:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id m2so18506083wrh.6
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33H26SmKB1RHJAPoW14amug925cmsjB3S/B1b0LxD4Q=;
 b=IIEMywrROY5LVN417eyUDyH1NwAsGkG6WKj7Eb+AprpUAoJJbBPV0PAHGUiVeC5G8+
 Cw8kKm0bpequcW6SrO8IbvNyhWXtDhnbtU9dHpU5ywKKtRp5cKDj/tNo/8tF5h3Yx8JK
 cwb7v1WSiHtLynJLiMGyt5V2MeC6x0HOtdkpDTqhcnxdYz5ykSkHf/TsXF9/QcZvAcdC
 J0v6M/v+WuiFZDyDiw6XIEpAN5162szk93moHXh/3N9q3fhUCp/JJPYpx2K7sOI2zqbq
 9GU/WAYifzdZbcb/CnA3u5zssh8t8yiVOsL4lIzCZKpx0VkdOYOOfmH9UkUxABqfT7CE
 MCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33H26SmKB1RHJAPoW14amug925cmsjB3S/B1b0LxD4Q=;
 b=NVXM3IV/Dv6EfgEQ7hOTPoGwj9QMAsLLB3HYdq1Wl485+R0Bjux1/z4GG6nE7ziv+W
 uL3X/1XmeKoi+pagbGIkvVBmWIDHcIdn+SuGskY3Y3CMOgSu9KaGuRhVaYj1iftV4Iza
 kp1NQF4Q9IkQcZNUYj2VlSp0+8y9ZAlpVNqwe1l/LiEC0NFvCN6AvtBT2nYiqWnlb6gh
 x5a7DLQGruLBYdV92fTGrmntA+LVSanvu6WxNwGJJHyd2/27zQuz9mMFh+6ki4k/Qa9y
 WMFkESa6z83xgxeByAZnNDkYl3w2bKU+6Of3L1jpawgBGr/KkAqc78/hxaA3f/4Z2Tq0
 p8mw==
X-Gm-Message-State: AAQBX9fGj0+cZob/iIl2J8FEnvpBLUdxQ1u7eZJxB3/e3v5YGnQofqEA
 AWWRdXQFoE64DgWbskusFSdupUBJciIQNZ+HCsA=
X-Received: by 2002:adf:fe07:0:b0:2c9:d91b:a6ff with SMTP id
 n7-20020adffe07000000b002c9d91ba6ffmr18360240wrr.21.1680171542353; 
 Thu, 30 Mar 2023 03:19:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b002c559843748sm32395801wrq.10.2023.03.30.03.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:19:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Date: Thu, 30 Mar 2023 11:19:00 +0100
Message-Id: <20230330101900.2320380-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CDOXcjUl26v3

In commit 049edada we added some code to handle HSTR_EL2 traps, which
we did as an inline "conditionally branch over a
gen_exception_insn()".  Unfortunately this fails to take account of
the fact that gen_exception_insn() will set s->base.is_jmp to
DISAS_NORETURN.  That means that at the end of the TB we won't
generate the necessary code to handle the "branched over the trap and
continued normal execution" codepath.  The result is that the TCG
main loop thinks that we stopped execution of the TB due to a
situation that only happens when icount is enabled, and hits an
assertion. Explicitly set is_jmp back to DISAS_NEXT so we generate
the correct code for when execution continues past this insn.

Note that this only happens for cpreg reads; writes will call
gen_lookup_tb() which generates a valid end-of-TB.

Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: just unconditionally set is_jmp to DISAS_NEXT.
---
 target/arm/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 2cb9368b1ba..3c8401e9086 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4623,6 +4623,12 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
 
             gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
+            /*
+             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
+             * but since we're conditionally branching over it, we want
+             * to assume continue-to-next-instruction.
+             */
+            s->base.is_jmp = DISAS_NEXT;
             set_disas_label(s, over);
         }
     }
-- 
2.34.1

