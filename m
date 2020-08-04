Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp53949lfy;
        Mon, 3 Aug 2020 17:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7P2il0BjQRKCOUqpwVzeR8D4h0ndVnplu02szGIon+3uviYnj3Z9k48x+clY0j/LEsIXr
X-Received: by 2002:a25:db49:: with SMTP id g70mr26675445ybf.155.1596500948336;
        Mon, 03 Aug 2020 17:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596500948; cv=none;
        d=google.com; s=arc-20160816;
        b=X+q9cy8VEPUqnbCtEUVzdL/sNL8TiPcXWhK5WlMUWcZKSW7Fv01dW323QcE4YoT9XA
         BWpn4vlx2LcGfLw4ZfgSkSR7FuCcvEeeW3XQBuRQivmVe+LYLlQEWFCuJM6pZGNkWlFI
         xb4TPfIaphqg8oOp9sZF0GdItVBYZXpeezG9GXSrRdqBuj3qUMr5Jqlu9rLQDVm7TIgA
         W9NXX5PTice8EnRu57T1fEMijRG1/uVk83VTAnz7kQ9oEr7c57f/68rV6DnFnTS0R+Om
         ibD13+5LpLplulaYJhc4VBjz7bD3+DRtieWU0gGowAQ8Z8MxrLH4N8HvanfCA3AwUQTI
         5abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=xqQGOC1I8/LJEKXsAn6LIqZnaJheV9poec5ecJcapYc=;
        b=Eeu7l7B12PUQtuwvDU+YR1dAtgNVPFoIj0MFCXbZYNNU7oB04fSnVVLyEZ6Ao7S+IO
         C63/5C/GAqQjlCYPB5wkwvEpAeSjPytY1b5vdY26oBdUr75Y3eip+WVFEw5Bk8jOwrHW
         CROzxmc4GKp7IdtSemo9ifHNg27D80QXesUjSRQFVD39N2WmrlAU3EjuWz2yWlXYezRu
         FDipyy5Xc/ucP5PnGUXgHZXS9a5lpz8bkaB6Q0vFryDuIZzrJZ5KDA+BcPrgoMFqmg+r
         +DMzN5hAJFC7vf9LGyoU/Vci1S6IFshXzKi1b8lhtZELrZ7w2gp+cTWX7F2sPZg4gg6x
         7qPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ha8gFfo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si16385126ybn.396.2020.08.03.17.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 17:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ha8gFfo1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2kpH-0002mP-Oo
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 20:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x6soXwMKCMAviimuumrk.iuswks0-gxstutmt0.uxm@flex--pcc.bounces.google.com>)
 id 1k2kp9-0002lj-0h
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:28:59 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:40307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x6soXwMKCMAviimuumrk.iuswks0-gxstutmt0.uxm@flex--pcc.bounces.google.com>)
 id 1k2kp7-0006p2-9y
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:28:58 -0400
Received: by mail-qt1-x849.google.com with SMTP id r9so28121194qtp.7
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 17:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xqQGOC1I8/LJEKXsAn6LIqZnaJheV9poec5ecJcapYc=;
 b=ha8gFfo1JR3XksH6aVZxPAg/K4TUcq5E2q98umkm4HTyTvmaNwBHNuHD/dlY2eeVw6
 jiJ6mnBS/X0sjPekaBOmAdOT85mYJ//nrXDPR7gdRZgYfC0mu+sI+mGSPjH0HhgaX/5H
 OIRMr5qb/Ar3G0cD1Vowuxa89u6MzzZ2kbdDVPiBdDA0ccbCCV9IL9PtgUDyMFiDd5b/
 uGwgq0WvJs9JmdOl6jN0F4ifZqRme/aTTC8qxEJI/h5AucxOTGH31axXzYhc2ZvWhj1R
 K8BGcu5hupPJmnJLyU/Xrg7LjsjSI6TOXbYIp9eaqGbDn+Q7m7QSzAWnmBL3qppHUXEa
 7xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xqQGOC1I8/LJEKXsAn6LIqZnaJheV9poec5ecJcapYc=;
 b=KCxQk1y1mRNTPk3upZFfv6FATiGGfXkeuN/C6Q1KrBjtz/Iu1Db3/FkeH5sIGQvmXq
 pouCuYul6Tmizi0zra8Vddu5IvNZSzZbK2NHy3NIYOYo9YFf/8Mm7IU0AhHuZKvrchQ7
 txBC7ByEDive+c/m8RwbZBFaoMc9oX4UU5G62TIDenmgeFYx6ta5SNNlrAyvz5fdLduK
 dFzGTifB6TQHI9+oFIVOw7V6T2Jv9htuWjPkEyP3lJC9vqqeLkvr4Hh05Z1zf+f5OeDB
 PfoDvXTkA1ezZiT6/HdlUB5bzOQg6dF/jzvl5QcrToBdu3KyvrFS1MkgRoZ+t49+ha9G
 isvQ==
X-Gm-Message-State: AOAM533ZeNpwKf2EkM3hnF/5S5LcK6zjBjoyQLmJhOkn+4tymFFfbB11
 W+Njxvc6x5RHV4hCYg2HUwmLMt4=
X-Received: by 2002:a0c:b2d6:: with SMTP id d22mr19104308qvf.209.1596500935249; 
 Mon, 03 Aug 2020 17:28:55 -0700 (PDT)
Date: Mon,  3 Aug 2020 17:28:49 -0700
Message-Id: <20200804002849.30268-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH v2] target/arm: Fix decode of LDRA[AB] instructions
From: Peter Collingbourne <pcc@google.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3x6soXwMKCMAviimuumrk.iuswks0-gxstutmt0.uxm@flex--pcc.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RL1sanJ2YqKh

These instructions use zero as the discriminator, not SP.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
v2:
- fixed commit message

 target/arm/translate-a64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8c0764957c..c996ca1393 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3429,9 +3429,11 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     if (s->pauth_active) {
         if (use_key_a) {
-            gen_helper_autda(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
+            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
+                             new_tmp_a64_zero(s));
         } else {
-            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
+            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
+                             new_tmp_a64_zero(s));
         }
     }
 
-- 
2.28.0.163.g6104cc2f0b6-goog

