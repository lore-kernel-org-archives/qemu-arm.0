Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4288727ejc;
        Sun, 26 Feb 2023 21:28:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/j9Mf+kjkfz/WFDhnzJsjtQ6eJPuMBPzdzt0aktph+mPoNOpduVM8e/wRLngyZN53AJicz
X-Received: by 2002:ad4:5ae4:0:b0:568:c5e3:a0ce with SMTP id c4-20020ad45ae4000000b00568c5e3a0cemr50571852qvh.20.1677475684301;
        Sun, 26 Feb 2023 21:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475684; cv=none;
        d=google.com; s=arc-20160816;
        b=EmxxFmOr6Ss96tLp4M7d7Dat/TI2rnu87JU3uS5+r/F8oIsW4pyKXSjqLRQ5W0rLZB
         qBdDLyEySwf7pp9Vz6zFHYQILN6QJRDzgLLmtxyRDUwyMh9Ri9Yb8dvySuQQ0YqkRYBQ
         wux2ZuyJ4OpiMoYECUpkV23mK7nCUM16rFxavYc0vuCsV5ZmhVitVs/9WgtVIsCIA94E
         McrzFqFK9SkghdtlkVFzcsXrGM/qVpn2NQURa74sICF5qcmGyt4TPvch6h26favEd3LD
         SEnmqUcsiGVZwNVcYQEL28hBSIbucUcuxdRBcWGT7U4Ahqqi8F9/Ii/gieEgplg6q8Xy
         f/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
        b=pLuWpEb0pv+Lphk82oj2HSTYykhuN5J4g5TkF6X+NbYZ4BNaRUZS1Q1RbGN3ujsoZd
         Y39bEtYODhhhPzs8qv1OSUbcFIstr2EMwFXH0aSnfe+gdXQRl1ZxtLwezfBhhm48iWnf
         PgNkBxe/CB7TKECCkHZ0uGSayQwIq92kRembPfYZGcriQrBUWLCwEgt+DJ1y8d+I7Gqq
         SJ6TxZokpVGYsenai6uw5oWvr4Fy+MAfE5I+2pS7AXvj69DVz65xbCOuR4RRPzpElTMX
         SagztxvicJbirxfuJmPfSleJdz8UgAWBebRuxyAe7aAoxyWUFJ2Ji2vLjv1Kz/+OdgwQ
         ANyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDnEChFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020a05620a445500b0073185aef96bsi6306842qkp.241.2023.02.26.21.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:28:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDnEChFG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW2h-0002dj-Al; Mon, 27 Feb 2023 00:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000ZQ-Bx
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2J-0007zw-IG
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:57 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so10678201pjn.1
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=YDnEChFGZP6yT99BLe5B2vrbT8rKkEDDJPm8gI44g6SZllPaJM38yCofbRlDlqNfcH
 mixQ2IGdye33oYHp5P3JMms82cCJewRSMm/nt+KPhMKPBHbk6WIHTxUKT9Fn6y5XbfpW
 qsmBQtq0WVhdohU4OZyUEJHHV9ZKmjjtxVn+v7FmMoScQSMrCCptgdiE22v2qmfjDwN2
 Bo0CMCkF4vTWFOfH5ZOFwlarujWzykrDKuCh+ObjTTm8VFrdNqscp/qdpy7zUoObXis/
 yGj+PUTdOaO/X+pGyCYIqNseU+MuzRCAVT7q4EorFjceSIdAy7/LZNNaT7clv1kGS0vz
 GGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6y4zpHlwmASZL3Wsq/COyCHbhwEv63XD2IWNIuyt6k=;
 b=w3AjY6635s5ULXGyiBm0lEqMhAfx2U040yL2kD6t2YgyvVXeZOmduQlkM+ullsBf/E
 GhE2pNRDIwNJV0pL6WmFT0GC0wsUvb4ycCKi7/At5fyAcCaGnBBcYwA9sJ3miotP7h4z
 qHEMKVBnjb6Epsh1LeMMHbBEiRRoC0Ta+IzRUMZbO2howf8NvQy+47kUrB9hGJnnZRiK
 jhfXU3GNPYLB84TU/+GOnAcBSNnNFATCM77Iapog5L6lnHrpkhCi9J3u3X59/RbxKNDo
 PuuHZvZcyl8S8SWefSFdj6FKMUgIUKasDBGn+vcUGSmc3zDDa0xDjKWEwo+ixDl3px+b
 D5Kg==
X-Gm-Message-State: AO0yUKWuF8bt90Iilq5aIHtGXKMM57i8FtSXS9Yew+cyBOJj/DsR9brE
 JnpEIXu4btYr0YfA9MKSEJZZJg==
X-Received: by 2002:a17:903:5d0:b0:19c:f096:bbef with SMTP id
 kf16-20020a17090305d000b0019cf096bbefmr5658932plb.49.1677475614022; 
 Sun, 26 Feb 2023 21:26:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 38/76] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Sun, 26 Feb 2023 19:24:27 -1000
Message-Id: <20230227052505.352889-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: mstP9kjbjkGU

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1

