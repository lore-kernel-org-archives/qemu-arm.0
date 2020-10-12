Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1155250lfa;
        Mon, 12 Oct 2020 08:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO0ntM+WvnRkyQOlmdTrwhEC9aUgl0aA1zz6aflKdvIKMPbbuwsA1HOt4JZEBowIJGZW8T
X-Received: by 2002:a25:2687:: with SMTP id m129mr32574642ybm.425.1602517491699;
        Mon, 12 Oct 2020 08:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517491; cv=none;
        d=google.com; s=arc-20160816;
        b=L8+7rgGeUlnupUh9JWN1XujhbYtp6yG9pi0gh/XPfwZ5k7mBdKOMTlh8qVtm9q2OCh
         CY07J7dJFwFHhMkNFs3eZiCisu6un1UJQTpMSlpDptOUr8Yid+2yZW8+9UytGaayB16t
         oBIBDh3CkxUQ3JlJwE4ZqlgEPiFNdfg+RuOxKqBNFHncEYjtgY/MdpAxTAaj9k+PV7zc
         jh4u6oMdcKGG4TO0ToX0mjGpyKfAde3nKVnYg1VpgVOxbr64qZIUF+KhBZKTCXJqXq0Z
         b/F8HpEmrPzUkmtJHVJBXH8fKuAJvY+TjG+CtCv7sMc57OBHKE8mIOhZvmNrceTBPfgZ
         ot3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bcorSBZXkBkW1mp/hqFvB6M1vX2DnTHEzjvxS98edmI=;
        b=wsxSh08z4EHKAUnKOlOZXzlVzBXXn/93ApUjwLRltuh5liGj/NUDpaf7kZ+CXei5zr
         +ecmlcsQu2Gv8VVHXHYI1dltASUglbP8NZan2rhZcvb0xcKyd6TGObE3hb+VTAX7Xuhf
         tSd5O4H2oljWrjn+uKfIbWeylDxKkP98WYUu8BKAnkmrbzBDNGd6IMk3FohQNC6RPMva
         1Cpp8/qX3kf7sS8ZX2XftsS/eJkIiiJvmxahEuTHxJ9XHJjt/8J1bT+O0slYVYh0qEZT
         h/MUYLSj5saQbRvJnJBek6rRsQsfyT4N4KTmdwCZspq5u7ioWIm9LmaSc88b3PBqHJ1H
         e61g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDjU0n6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g206si14916185ybg.441.2020.10.12.08.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDjU0n6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS00J-0003h6-0g
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqj-0007Dc-2d
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:34177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007Mg-Bk
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:56 -0400
Received: by mail-wm1-x32f.google.com with SMTP id l15so14002920wmh.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bcorSBZXkBkW1mp/hqFvB6M1vX2DnTHEzjvxS98edmI=;
 b=ZDjU0n6i8Sv1A44uNzJhuxDJVq2BVk4udSxqhvl38awFaZoQFo49xDBI0z8zLTtfQt
 LQ6k1qQTN4JRVdqAgUSWWAfmzbFbyANL2abgbjAtpiy8UVkAq2pOPRtTPRWw4TEFOoEJ
 FkyazT/T0Z2vcrSrdOh0Ti2kMjtWCEwdkt/5mIWxWF+RQWMbS7g6suApGiBJgUYWv4h0
 S+unk0M6QB240smfCTD8tYSKA3KNRycPE9gRzDLErqiAJBaISOEByXo/M0i9bwivwFad
 kDut0U/eQAM70gRgiSH+Abg6eXxs9LM2HhcH80BIvqcBI/i7tm7/3JXeb8wm8kwMxA/0
 PsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bcorSBZXkBkW1mp/hqFvB6M1vX2DnTHEzjvxS98edmI=;
 b=mIPWKib8VSJanaBZ2ZHJiLO34JtmcsI6FNVmAgfhvJ8xj7xoXdNvpsvSw2gFD/ac5I
 IOtD0p/qZFdYoxeKU6cc4024g2EHWR2KpjUWGRdvJObllhfjwJKDRfLq6sVUAmOAQZ9Q
 Zub4jslx4afuwJeuSf2kDloxpD7hDcuWYNyyaafV6XMXs7x07OZnQ9OZ4/qseZwalbzf
 3old54G6i3vD72Fo8kY7yEc8gkbe78TKnLUpuzU8hFAgH6bUYk1m5UB+kanu1jsou9DI
 wc0S/xnawb2SuHLZywELkzPy6YZfHa6UTjINzDnGyEzcWGkIvZf+FECCaPuMMs61bnqA
 QzVA==
X-Gm-Message-State: AOAM5316yW2ebP0f0rgvN3xwMUI2DKV8/AoEV90ftdETNpkRcgG5NQTb
 dIaExJ335X1VveyofpFqRhsz8U7XMcNqllsU
X-Received: by 2002:a1c:e256:: with SMTP id z83mr10909949wmg.37.1602516881543; 
 Mon, 12 Oct 2020 08:34:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] qapi/machine.json: Fix missing newline in doc comment
Date: Mon, 12 Oct 2020 16:33:50 +0100
Message-Id: <20201012153408.9747-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7rdnxo2aUi6V

In commit 176d2cda0dee9f4 we added the @die-id field
to the CpuInstanceProperties struct, but in the process
accidentally removed the newline between the doc-comment
lines for @core-id and @thread-id.

Put the newline back in; this fixes a misformatting in the
generated HTML QMP reference manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not very important but I've suggested for-5.1 as it's a safe
docs fix. You can see the misrendered doc at
https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#index-CpuInstanceProperties

 qapi/machine.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index f59144023ca..daede5ab149 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -825,7 +825,8 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within node/board the CPU belongs to (Since 4.1)
-# @core-id: core number within die the CPU belongs to# @thread-id: thread number within core the CPU belongs to
+# @core-id: core number within die the CPU belongs to
+# @thread-id: thread number within core the CPU belongs to
 #
 # Note: currently there are 5 properties that could be present
 #       but management should be prepared to pass through other
-- 
2.20.1

