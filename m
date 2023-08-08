Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877513ejb;
        Mon, 7 Aug 2023 20:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGZDzOmIV4F77gU/yWPFBMXUeH1A5HKeRtGnidUJ23qbpd37WoVo9Goqp8zgLqlj9xgMoW
X-Received: by 2002:a05:620a:1990:b0:76c:b7f0:2bc9 with SMTP id bm16-20020a05620a199000b0076cb7f02bc9mr9421099qkb.16.1691464473177;
        Mon, 07 Aug 2023 20:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464473; cv=none;
        d=google.com; s=arc-20160816;
        b=cmW43t3FFR8rFnNfk0kz/PvoehnAlM/Uj7q2F0v5X/GT93f4ANv6+8LclU4HTh2EwH
         ZQtqYbau6JEs3FFrFQpHwQfbEndSx0HyFHN9Phq1eqAyp5ChImhtRMoYO7Sq/1R1sJ1A
         LRbnPg7XAZV4W7bhhTczlqQkhYWnkMI8zHvW7FZo6fl8+a/z7Gyn3T7dAz3XwInp6JFU
         nAc2GkSyB0/Di+sp8WJljqUPQh5ISX/aQFA/3fSm7XY7Xls3IW1Tb5s5LL6wguacpZU+
         py/qh+Jwpk+BEcMHoAeuTNj8JsxbUuHQ6yS+A8Hxu/FqDwRwDoDqT9ZKvAJDEHGAUlJA
         n9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M3BMcTIxC4jryFhKIftrtUmJSSMRdVn7/PIMdJhKjDA=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=WrYgwuQDVNpl1e+PAUd51SoEeO4VM+mNGeFnuTX9bUdhuqGpfhpH7Li2cHRyUuSR3S
         OvcKFZzx9OqZhjOdK6NGoNcfzsgcVbx4rMxmnQeBw1OadKvQCERlIso+iPlOxYlyiKCC
         zncxDZiGMgKe4e1vC6ip0qTDbjM7j1SAeEmkJY0Sn/R1HnKqlx3yg95TNiov+bBv6f2a
         ME+aIBrjGHQKXMSN+hXx54FvZ2/vzt+brUGIhmmOPlmxVaVx15ASoj5vEkhQ+E3i9Tae
         34XLDpJT+cMV+jThW2ROtjavnFC6E4ttjKXyZDP1DTMYqk/IFRPZHfgBGeLl0bQLeUu5
         QsvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syR2BKyf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a269a00b007672b4ff13fsi5677757qkp.604.2023.08.07.20.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=syR2BKyf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD8V-00008t-KK; Mon, 07 Aug 2023 23:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8U-00006r-LZ
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:11:54 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8O-00008J-Lv
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:11:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bc7e65ea44so3267805ad.1
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464307; x=1692069107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3BMcTIxC4jryFhKIftrtUmJSSMRdVn7/PIMdJhKjDA=;
 b=syR2BKyf65dJnm3TjsUeVihiPqYTiBAbyuSX0qI7XLlhRbosiqZL1/kXp7kAOE1vDl
 0go6JgpHCMXSa/S2NDdmt592c3caPtHfos3uRjwIw+mn7IaweAp/SLn52Q3zIUrXAPpg
 hoxd6E2wlatCYgs/zrBbmiyUAFvE6T5XPv4jPsR8meORvk09O8UMrE7GRMlRmtkvQWfF
 TNf6HpulxGKoCOYiTe834muIT7xzqfksiayGdm8NBlkpfhmBmOAd1GSYb0dR59a+SZrE
 BM1q8ry59NnZyEb/KZBbXEuj7Sn+JEiDwPOU/rUzakGpHYtuQA+s7uKDKn1Vj4m6PmPG
 Fm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464307; x=1692069107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3BMcTIxC4jryFhKIftrtUmJSSMRdVn7/PIMdJhKjDA=;
 b=GNzr8sRZKjCK7D3Khl+rOaoAO2TUpJO4U4lh0p9lfQDl3yJ7TCCu/EHZwOveQnm2n0
 lhlVvVCgTtj82pSv7H3+a9ZD2kKsXRlF9YOY+WxvK2GM+Og4yCXPyYZAMSQSpLO+6R7I
 hTlLI3/1zdkTaOEBLthjeeTBCj86XaPaKfSPUQOUTuiOnUB6hwVWENdyMrjmQ72Ulwlw
 CuR8xPFpKcKxE2cBqSld4n5VCVPL+Mz99AXIs2upKLbhhzz44dDk5PQ37g/h1V3ZWjsI
 or+SFYusEHctiRkPIl8p9Fk/cJSRr/ORI1PHqj/8qw5VDXPY/Seq5ybr/pQopwjAsaBa
 j5uQ==
X-Gm-Message-State: AOJu0Yz8bLYS3t9o5AISQkg/u22nWXTObBfqUGNpOIazLCbqfF+QWuzO
 2ITuolCmT17xMR/CqKSk9nOMO4xhu0g349piKi0=
X-Received: by 2002:a17:902:c781:b0:1b9:c61c:4c01 with SMTP id
 w1-20020a170902c78100b001b9c61c4c01mr8540090pla.9.1691464307167; 
 Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 03/24] target/alpha: Use tcg_gen_movcond_i64 in gen_fold_mzero
Date: Mon,  7 Aug 2023 20:11:22 -0700
Message-Id: <20230808031143.50925-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: HWnvk7qzNVp8

The setcond + neg + and sequence is a complex method of
performing a conditional move.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 846f3d8091..0839182a1f 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -517,10 +517,9 @@ static void gen_fold_mzero(TCGCond cond, TCGv dest, TCGv src)
 
     case TCG_COND_GE:
     case TCG_COND_LT:
-        /* For >= or <, map -0.0 to +0.0 via comparison and mask.  */
-        tcg_gen_setcondi_i64(TCG_COND_NE, dest, src, mzero);
-        tcg_gen_neg_i64(dest, dest);
-        tcg_gen_and_i64(dest, dest, src);
+        /* For >= or <, map -0.0 to +0.0. */
+        tcg_gen_movcond_i64(TCG_COND_NE, dest, src, tcg_constant_i64(mzero),
+                            src, tcg_constant_i64(0));
         break;
 
     default:
-- 
2.34.1

