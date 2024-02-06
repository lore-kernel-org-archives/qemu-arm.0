Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1530816ejb;
        Mon, 5 Feb 2024 19:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFwEeLh8AOy7eIDnLmWIig138S+a46WRz+Rcnon8cRwFifXP1FLkUvKnnBtdQzL755aQka
X-Received: by 2002:a05:620a:2489:b0:785:8a10:9af4 with SMTP id i9-20020a05620a248900b007858a109af4mr3304693qkn.6.1707188793595;
        Mon, 05 Feb 2024 19:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707188793; cv=none;
        d=google.com; s=arc-20160816;
        b=c8IOfW8TKf95cm3Yx8jcYpYtAiDfTUJjMNMqt3J8xtOJXsFmT0vbYCFQVsnQ4KZ8SY
         kEVs1ln8FUsFrZp3Zn7lNc8LmspDu09ATRDKhYdls2pxszUvuZaPQOLxaDcL7hHM78FB
         kpwCTnfJ7Mkan0TH+FTKMPkWpy73Nx5tShfFebLxd062fly9sRstSuBONnZQm30jljyO
         dx10JWv2cat5icoxcJffMTk8nRjvPtX6FAtXnL1fdD7r4EEPTiyz2FvHX5QwCprn1Tpd
         X8MVhgqNhh7tX4W02ElyKatW3eo0FhwLuNxb2TQNbzLjoNsDdTGqtQ8oo7kPaGlWR7PT
         0ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E6bw+vo5JatBKfHw3dI0irsDkK5JENn8mMxMtSK3thY=;
        fh=DeKJyjVlod2OXEYO5sIq8atfwFfRjbTaYGLA1ePH7NI=;
        b=kvX4mA8Y+Ef7NTechdYNiwQRzW3hmVjvoSZTDgWuMGzLhFsJC66HAJ/JcMo+vefkBN
         dSoqdPvGWy4NDGYEq3BAawsTWu2CAT4vLJ7KWpMCt8kGjwmt6v28ud24igrBLIlSWhLz
         pm24CXQp+BHpaCHOtYbQMvXCbYgAJkMiDiwCWmtnSEyBKWZcI2q77X73fcO4SCDfdmcK
         +oX2cJcsh6YU86dj2PNlcBhz91ILNeuD0hK0Cn2JvL2lxsH2nOrwKR2Rt3H+aWFuZuB6
         2yv0kSFO8QkWIQ3sE3uqa+7qcqpyktmXrRi5vgNW/a4qwSZfUfQxWRUG+PaPDnc3SCBF
         +MSw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztsMqqUa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWJtZlAyExCRcBtZI2YCUB5u3+B69XagLsxGi+N5i3e/bi3FoEopJlB+lquW1m2L/R/omL1M7EWVY/UFoEEzPCsEw3ZiOlM
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05620a229400b00783fb5cf4d6si1326725qkh.614.2024.02.05.19.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 19:06:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztsMqqUa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXBmU-0006vA-M6; Mon, 05 Feb 2024 22:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmS-0006sm-Tt
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:52 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmP-0003Ck-U7
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:52 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6e055c89dd9so104467b3a.1
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 19:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707188735; x=1707793535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6bw+vo5JatBKfHw3dI0irsDkK5JENn8mMxMtSK3thY=;
 b=ztsMqqUa5uQOI/phLa1S4y1yJ8B/sxXDQ0fwHY+8IfAtNMyeLVMjGpEW7leDPCCM7i
 iFRz5K7V49sNzyI4DY8tw5ED1zdsB/6pNefdEN1SGu7WwkgTl2cYK9ZRCiVC1kf7wrZx
 vIk2p0x6BkoXaZN0mXGX1I+1cA5qfolptwl5jZ8PnsKPw9KmJcOw5+xy1bzdx0gDmMHx
 l0Kbx+bqcLkuNhX0veSJod7Dk4g2tKA+Y7/Y+xRVMcdncrYohZ2+bD+IFu0X0+9Z9aiC
 22PgSyXipKjCdpkKkscSa9bkKRouAHqC2ENeMGAw9GkDA6Wc1Ykp19oWrDLj38I3xoIi
 duKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707188735; x=1707793535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6bw+vo5JatBKfHw3dI0irsDkK5JENn8mMxMtSK3thY=;
 b=ThPpHRGbaFLx2O2sB3KEbVCy4FSPReunMuIaiTT25SUyBJizExbnl6+bpXax2Qlh2i
 jbrRdtDcag07QD1swywGGQZUgnjXqvLmn/Y7pehLZVfWYPISvMWKGi3ScfRkxOxCvel7
 e3iB+kol7BATF4fg8YM3PfBx9RbHFF8/TjBkeCybHyXxTeNok5HU1AcO+SBd2iGI66fn
 EeSyEKD5tqY0bdDK75P6o5UNQOZ8qQE3LZJX5P8FYhE8YgP7n7gAjuLB2Wr2yT3R7msj
 4BsYpGRrQAfjyEtpxRxAyDMw9Cv+2KwUW2YgoR1wGBPIi2ZDYH8mzJkeCZ/raKQi5qD6
 hN0A==
X-Gm-Message-State: AOJu0YyZf16iPU+QxL6/L86vJqYf6Wq9AZK0pIDDEFwrYk2g0R8jeCiF
 J5e0Z5GXX8pj3ozilNEZxDffLgwjwe4sA1HGlszuRdbOHgtzYX+gHoElb5V9yWo=
X-Received: by 2002:a62:e405:0:b0:6da:bcea:4cd4 with SMTP id
 r5-20020a62e405000000b006dabcea4cd4mr2011390pfh.16.1707188735655; 
 Mon, 05 Feb 2024 19:05:35 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV0nu4hV+42c5XWycC7UIfEGNXkD17R62Y7zKc7Qm/ASx7oHtrMviJt830t6SVB19nHbpf6SJiZvUcpqxMiH2SnX0a54qyuQ4rd
Received: from stoup.. ([43.252.112.200]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b006e025030700sm627478pfh.190.2024.02.05.19.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:05:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v2 1/6] linux-user/aarch64: Extend PR_SET_TAGGED_ADDR_CTRL for
 FEAT_MTE3
Date: Tue,  6 Feb 2024 13:05:22 +1000
Message-Id: <20240206030527.169147-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
References: <20240206030527.169147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: f1biOuH9SWzW

When MTE3 is supported, the kernel maps
  PR_MTE_TCF_ASYNC | PR_MTE_TCF_SYNC
to
  MTE_CTRL_TCF_ASYMM
and from there to
  SCTLR_EL1.TCF0 = 3

There is no error reported for setting ASYNC | SYNC when MTE3 is not
supported; the kernel simply selects the ASYNC behavior of TCF0=2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 5067e7d731..49bd16aa95 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -173,21 +173,22 @@ static abi_long do_prctl_set_tagged_addr_ctrl(CPUArchState *env, abi_long arg2)
     env->tagged_addr_enable = arg2 & PR_TAGGED_ADDR_ENABLE;
 
     if (cpu_isar_feature(aa64_mte, cpu)) {
-        switch (arg2 & PR_MTE_TCF_MASK) {
-        case PR_MTE_TCF_NONE:
-        case PR_MTE_TCF_SYNC:
-        case PR_MTE_TCF_ASYNC:
-            break;
-        default:
-            return -EINVAL;
-        }
-
         /*
          * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
-         * Note that the syscall values are consistent with hw.
+         * Note that SYNC | ASYNC -> ASYMM with FEAT_MTE3,
+         * otherwise mte_update_sctlr_user chooses ASYNC.
          */
-        env->cp15.sctlr_el[1] =
-            deposit64(env->cp15.sctlr_el[1], 38, 2, arg2 >> PR_MTE_TCF_SHIFT);
+        unsigned tcf = 0;
+        if (arg2 & PR_MTE_TCF_ASYNC) {
+            if ((arg2 & PR_MTE_TCF_SYNC) && cpu_isar_feature(aa64_mte3, cpu)) {
+                tcf = 3;
+            } else {
+                tcf = 2;
+            }
+        } else if (arg2 & PR_MTE_TCF_SYNC) {
+            tcf = 1;
+        }
+        env->cp15.sctlr_el[1] = deposit64(env->cp15.sctlr_el[1], 38, 2, tcf);
 
         /*
          * Write PR_MTE_TAG to GCR_EL1[Exclude].
-- 
2.34.1

