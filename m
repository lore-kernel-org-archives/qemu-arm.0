Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4237236lfb;
        Tue, 8 Dec 2020 10:07:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYTeGqqpfEY6Zrvr22tBIE6qK4q1gpGof0T5/Mt0ngj/LFY45pvPBT/rH2smFcE5Yhe0/c
X-Received: by 2002:a25:6801:: with SMTP id d1mr31172461ybc.9.1607450868164;
        Tue, 08 Dec 2020 10:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450868; cv=none;
        d=google.com; s=arc-20160816;
        b=bLeS/HauFnvbtIcg2Ru1d/pe38lGxKeaO6SWyJAWxNbr9PcQ8TQSKS6/iatFITGgjm
         /cSHqT7N8dmELv/dNN7KLGVIlZkdMBqhtosglm+d5gFzb9RZrIdRMvTtYsu44n5csMyM
         w8FSWE5n08kbjSD/9VVBUnVLgqVCx/nWwVoHRIHmhsGRnJYdp/e2lxVpkps1zVbKtdtG
         9fRBI2Pcx6o4Y1ngrgLrB3+xq/Tiv+wlMJv9MKy9Gzpcng18eZlc0u3KUW4em/FrirPw
         Wjri8OcBtaZtUcI4ByIpW79N67BUIzvI3fQ9JxPni4x5pkeI+nRPLRnLw5vnI0MfdCzt
         Q4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8zjW4PjT9eWoc73I7yU10h5NKHpQH6qDD0fJsI6BkIQ=;
        b=MQbl9ztIRMpLnwKG2FxDDUpJm5xyibsnkIk2QToerJmpRHOXHGFqudhxQdy2dJRPvn
         Hc0gfptLfOi8yjpLoiI4HuWKfRGNY8c/ALGfGL40WpZgRF3/QLcRkUAOuE6qeA7VHLI1
         VZPtiD03cvDnkrWz/PXuhQrJPJT7ScT61beyPj5epA7AgCt0K+mQLRGMVxl9BcmzXrAy
         LNS1LhHtXvWQUPkM5ikK8bAM4dBWFWZB5D/dv18OL3aqv7M+YwEZA2aJ/gbCxH5u/3YW
         +BpWAhHW2ODEbuOcbx1G8fJ0DWfGMi3p9paMNFEWaSL1DcodNljekce5kMcXTmQz2hYQ
         OdKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tc1DJmUX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si9307004ybo.105.2020.12.08.10.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:07:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tc1DJmUX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhOt-0003zD-HI
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIz-0007dk-3d
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:41 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIx-0006Mw-6k
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:40 -0500
Received: by mail-ot1-x342.google.com with SMTP id b18so16651451ots.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8zjW4PjT9eWoc73I7yU10h5NKHpQH6qDD0fJsI6BkIQ=;
 b=tc1DJmUX2oSWl1IMBWjyQPLBSJXxAwOxVLwAZ2kJzZxHaQ7/syeEAEYNFdQrYT0VmV
 JKlJ+kD480Se3eZhlDavlXUIxI/ojcQkAdGAc4whWv5X+m1Ha733mKKNS0LPLkuBFjN9
 xFOFtrSdatP1Kz5cdJKoNgTk6/yZBlEEKcTqyKXKupdG0uSa8rZoqGlBUe43EpP1D58A
 4Yn7qEgplxLiP5ksPUDOX+H44Jo9COsOclZdhkwTNCBmDCQf1bsKuxXfyU51Qa0ajcKk
 OCtec1sgTt9dD7c1r8IkPm8esl4ZezC7EHQna76EzQ6FKv3tUJBYk57LW46oocQebOME
 Zj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8zjW4PjT9eWoc73I7yU10h5NKHpQH6qDD0fJsI6BkIQ=;
 b=DFPqPjmDtbKSK8QbJvPABHJ+CvZkZFT0h0RH9uJ7mYSfKXh+GcQZbCI94qIX3RoZM0
 2IKwQQg3PGHdydMtyVwqRvHmXs7M1m4YhrQvUqGaNGRKsqXIEoL9x3ck5iqgEpIWCcue
 jc61C635ghACXkTFg+gyIRQOlchBxdXjLHcBjGNE3YyUoVktzuMiUZCfdAnP36LCBf4k
 OJQBM+mjzlGnVcnbGzsIKRMQP7rASycsIZh29BdIQGHNcTY4fZl1KrAzYWBRXzPw97J6
 fduvMkJ0pA/a8PpSR4IdLWleWxn59leriLu2c2BrNqguzbohKdDQkzR6s0Pd6z9I17Ob
 Yj9A==
X-Gm-Message-State: AOAM533OzDQ/+SA/fI1AXgAxMgiBGXdMDbg6NQdtiaJ9X/812ways1uD
 8Yqh9dw/Xp6IuB2pnWU8tkjYBMeeFYWJ8+sP
X-Received: by 2002:a9d:4b03:: with SMTP id q3mr3978761otf.88.1607450497801;
 Tue, 08 Dec 2020 10:01:37 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] target/arm: Enforce alignment for RFE
Date: Tue,  8 Dec 2020 12:01:04 -0600
Message-Id: <20201208180118.157911-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
X-TUID: rk/C0CrhOkTI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6c76bc521d..a8bedbb45f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8259,10 +8259,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1

