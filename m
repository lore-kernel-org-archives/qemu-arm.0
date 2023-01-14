Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp144883ejc;
        Fri, 13 Jan 2023 21:47:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskDYkceqTKGnKfVdKO/F10uRrJK2SevNsSA8boQfYJSz6kOeQNqErzyv2GNfcyfImU4bLB
X-Received: by 2002:a05:622a:4006:b0:3a9:818f:db3d with SMTP id cf6-20020a05622a400600b003a9818fdb3dmr120121625qtb.53.1673675244266;
        Fri, 13 Jan 2023 21:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673675244; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyFDxu2R8JEWeUmMZ+dY8L1Kd4oDzN8ahe7R/ldH6PG3dmUK77NfJsWBmgofWjsqD5
         Uv8X71I4DY2bmhqH/AwWYkq2y76ANle+wlHGVq9d9lFX9N5aDLO9CqvAhNKQfOwBMsmo
         1wkWg5iRicaTEPWLc57QY8LX3DvA2Mmq9UC0vE4iVe2qyVlDemgHX1Oc60Kd+lPHhpDM
         SHyE0PhUQJThRrESl+TdxeBnHVLqr+LJuOB8zDrp5iqkPYdYKozqjoybP9ABT3ioPKR3
         EnqtPJR3vJr+iQO7bpYrMKWb1lPd9hP+d0+ZY+OT03KsU8SgKJFPOY4BC2ks8dPEJxZN
         3gjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/mbN3+megQV7wMPAFNHtDNlxBkE+G0lgdWOpxoeUgDU=;
        b=vu4FWNCmSW7r4rT2vI0d7MgsWGXF9KtppJ951wfoiUCnkzHJAX699TDVfVo3HCDwa5
         jY+qI64rpgLIxg+GlR4CQ+J8m0sso2QXnHimdlI5caJi3cUyEYMMBjAUQNCyyFZYAaYC
         aYTqwBuh9HkuxDeO+SlGd0R2XkopdQgbzfQymUoeoWReCkMkZ6I8J2PV23z0Y2ez2tgg
         BK0ya0I9WuoWE8q9lJpufFRTA3WRXlpcOsCyMIAYvqINzV+ZmT2CEGMx5Wv1jS+CJydM
         HZfSaUQYn9iLcjwbBF5/obRwm7Oon7I9OtdEMdQehiqMX8Gr+aY0KaxfS4pNFnA9iGRS
         bNgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q35kCQri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t124-20020a372d82000000b006eeac30a358si13231764qkh.378.2023.01.13.21.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 21:47:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q35kCQri;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGZNZ-00074D-OF; Sat, 14 Jan 2023 00:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGZMr-0006ul-Nj
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 00:46:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGZMp-0007Cd-5P
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 00:46:12 -0500
Received: by mail-pf1-x433.google.com with SMTP id w2so2195777pfc.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 21:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/mbN3+megQV7wMPAFNHtDNlxBkE+G0lgdWOpxoeUgDU=;
 b=q35kCQri3o488D5jXlgQ6NmxmM8zaDgQ/DuNHNtc7P66YwxA84AnuvJw+H9ac3zOul
 QjWhXlulcyS/veOEDUWK9VMTxdBNnVY979hUcb2YI772NNznWM6Z2JQ/666yi/LIyZ/L
 imuwjk4LTuEHDQxD3Fij/hh81E0t8kJaonw1aB+FllXUMHAdOnGQ+D+E3Qb7EloUzoOG
 erUmwj+t60tKlmzoDmLwy6aTZWV4qvONn7iAqax/WuYuA5QcwQMCCCbTg6/n0OUuFjtu
 HK6H8L2CatpLvx9IdVLuvXyR8UhXgUFu1efBPrnV6Si/DJtNgoTHCuiaNjvzpf2COMec
 t/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/mbN3+megQV7wMPAFNHtDNlxBkE+G0lgdWOpxoeUgDU=;
 b=1fWq5790HlOm6SPCSd8/MIoePZjg9JCNLgGlhS/3Z6Kt7jH2u0hqX/1WoisZBuIEPD
 6+oT987xRXswqnnizR0ziE0br+s+b7pq3gE4Ah8yCnaUkVNRiav1dqzChCw7tahw3yau
 xbA0rxqtIsbijfAcGjYYuDKHHihrjmsmRvteAisajbXdao/h+1dPdMXZs0ZzGIJyNe5W
 AQ5IXPIKIeLo0T6cr3axIvnuft5ZMc0eTJ1iSpehUse2YYupMZEhOtfh2v6zkjR6kQ4M
 ixh2L1OlIBqhdFk97QykTh+ryGAtgqsDkO/Grl2/wJxnB+/T9ORcjkMP1To5hfumzAUR
 tZNQ==
X-Gm-Message-State: AFqh2krkVBY8jrX+bxv5Wgnk/EJ6knJ+baKE29PdCWz2WoIFAToR1PMk
 zhgGLLHjVvzdaTpqpSFceT3ZX4/X+YJ06Ms9
X-Received: by 2002:aa7:8209:0:b0:581:3328:b468 with SMTP id
 k9-20020aa78209000000b005813328b468mr61413716pfi.6.1673675169464; 
 Fri, 13 Jan 2023 21:46:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79611000000b00575b6d7c458sm2883310pfg.21.2023.01.13.21.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 21:46:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix in_debug path in S1_ptw_translate
Date: Fri, 13 Jan 2023 19:46:05 -1000
Message-Id: <20230114054605.2977022-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DRwO+r6qpXVI

During the conversion, the test against get_phys_addr_lpae got inverted,
meaning that successful translations went to the 'failed' label.

Cc: qemu-stable@nongnu.org
Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..57f3615a66 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -238,8 +238,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             };
             GetPhysAddrResult s2 = { };
 
-            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                    false, &s2, fi)) {
+            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                   false, &s2, fi)) {
                 goto fail;
             }
             ptw->out_phys = s2.f.phys_addr;
-- 
2.34.1

