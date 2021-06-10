Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp902763lfa;
        Thu, 10 Jun 2021 15:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAEDR1NWGHmLcWzeWhZUDvOh1vE5WEyYJVnNxJGvrc2yZBjcPQECXjzGsN2SG9cmpEmeXW
X-Received: by 2002:ac8:7d51:: with SMTP id h17mr1191278qtb.100.1623365235963;
        Thu, 10 Jun 2021 15:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623365235; cv=none;
        d=google.com; s=arc-20160816;
        b=H/2Fa4BT3aFFL7CCU4aa4Wk2whDS5warpISlxZd9bjk6sbUieAbEQWEmbKSn2Hsaig
         lm4Jkj6a2pSsbBprH9DYBLIjfBSBlzWTyx2SvxAjkQbDrDEDheY4wXgXRBcPDEPEN9rq
         SBHu2H7lTBlySg/nXzM2uSVy2YPGg/qeZN6c9PXIWAeJhCrJwmcyPOFEMNqUlDFfzctu
         Z2jgv54yb3rEei80+tusJutf+vLlkU1GLK1kJkgn/bNAQlLCtN6+9L5HhqY60NxhS9PP
         XhcKkFe176F27LplM0bpQSCN3WMqBxDykIVHh5XpOx70puHJzwY8tL00QnQM1e+Y6e+u
         qkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=wvxRMqfJIHGsgZmgszSQ7W5LLXajZs5jSF9Asi0/x34=;
        b=muV9z9VvVOO4qk6L8oW0rnba9kx1vHg8awrRVnfAcizAHWKYiv2Xf8orVRQO2fO/xT
         yhW+W1aylbeSZM3Az0aJDwXnlRcRXxw0cDuRFbJY4YMWeNK/P6VynUOxdeh1DjXGlzAH
         BfiiAUfrfvEpZqv1yyIEethePtca7HFIzaJVdb4QrMNUHfHZkStwAOUfWn+GcPIJXUPA
         NWfimEQxPhO3uzrfNuC/SCyhdarZhSVt4znksyWEOq/J6ePRXkpjPVGqzkov5nMw5wa3
         l3otmZXhxlKCd8sW/mKkyhw2bJy6IdDQ/D04hFFWWGvetVXQtUv41FbxKVChBKGKguy4
         4jCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@suse.de header.s=susede2_rsa header.b="lQY/jdlc";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=fail header.i=@suse.de header.s=susede2_rsa header.b="lQY/jdlc";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da10si2795881qvb.63.2021.06.10.15.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 15:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@suse.de header.s=susede2_rsa header.b="lQY/jdlc";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       dkim=fail header.i=@suse.de header.s=susede2_rsa header.b="lQY/jdlc";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrTSF-00081x-9m
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 18:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lrTRD-0007LE-OV; Thu, 10 Jun 2021 18:46:11 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lrTRC-0005cb-7J; Thu, 10 Jun 2021 18:46:11 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC3101FD2F;
 Thu, 10 Jun 2021 22:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623365166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wvxRMqfJIHGsgZmgszSQ7W5LLXajZs5jSF9Asi0/x34=;
 b=lQY/jdlcqmt59gCS+T4vZBfiJcgbN1dal2aKLsCSax0lzRWVbpnOZ2vUet09l+fC9BiafW
 lBiYba/TpuU1StZJAlVbH8C3oshyrRGm1XyJ5dO3kYYrRv36PuZDrSHThwp14SXUUQcZ6S
 GPYU+SUHJWq0sOP8lt5hXW2RhiHKe48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623365166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wvxRMqfJIHGsgZmgszSQ7W5LLXajZs5jSF9Asi0/x34=;
 b=/8dXXoKT5NOKnfdz9kkszDJyRKEvFOf/ts/D3Kc99aDNralt8NQuYIf70sOuntn/Za50HT
 98+0bUgTvxaKTPAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 205B6118DD;
 Thu, 10 Jun 2021 22:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623365166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wvxRMqfJIHGsgZmgszSQ7W5LLXajZs5jSF9Asi0/x34=;
 b=lQY/jdlcqmt59gCS+T4vZBfiJcgbN1dal2aKLsCSax0lzRWVbpnOZ2vUet09l+fC9BiafW
 lBiYba/TpuU1StZJAlVbH8C3oshyrRGm1XyJ5dO3kYYrRv36PuZDrSHThwp14SXUUQcZ6S
 GPYU+SUHJWq0sOP8lt5hXW2RhiHKe48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623365166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wvxRMqfJIHGsgZmgszSQ7W5LLXajZs5jSF9Asi0/x34=;
 b=/8dXXoKT5NOKnfdz9kkszDJyRKEvFOf/ts/D3Kc99aDNralt8NQuYIf70sOuntn/Za50HT
 98+0bUgTvxaKTPAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id pHhfNCyWwmBKTAAALh3uQQ
 (envelope-from <jziviani@suse.de>); Thu, 10 Jun 2021 22:46:04 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Fix tcg_out_op function signature
Date: Thu, 10 Jun 2021 19:44:50 -0300
Message-Id: <20210610224450.23425-1-jziviani@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S2b2YzWLq0hI

Commit 5e8892db93 fixed several function signatures but tcg_out_op for
arm is missing. This patch fixes it as well.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 tcg/arm/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f4c9cb8f9f..5157143246 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1984,7 +1984,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 static void tcg_out_epilogue(TCGContext *s);
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+                const TCGArg args[TCG_MAX_OP_ARGS],
+                const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2, a3, a4, a5;
     int c;
-- 
2.31.1

