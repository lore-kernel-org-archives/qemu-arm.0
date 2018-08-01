Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp697687wru;
        Wed, 1 Aug 2018 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfpotushH6ObxN+N3XX6dChrJ9HNNjVGmg451a+gRKwuHo25MxPAKzE4GYhWOFMGoJwg3L8
X-Received: by 2002:ac8:493:: with SMTP id s19-v6mr24359795qtg.159.1533126698436;
        Wed, 01 Aug 2018 05:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533126698; cv=none;
        d=google.com; s=arc-20160816;
        b=S8GhCmWLkeCu+MtyZkuWAeFaB7O0DgC1+/L+P9ydgx6K5XGrSfywAOZ+zdFOWBFM/A
         cSwkkzueT6y4dYATqi5EyJa74U06ZtXq0JiysLethaj9xJCMqbQY90atubUeAG3aIJNU
         NKEjERFxM9QtP6Q9qO5pU+HrV7lSxAAN3ZrRznmkNsit2+Reuz719kTA8EcZVAVqeMHX
         0imq/qx55FYCfXlSifng8yvkxhLq2vXRDT+3ulYjY3Yl7djg6KdFy/bQuKqNsTo7VvLe
         LrXsyFCzojZ5uI27L/tTbE43OZL94hGYJ/dkuKmESnLWqyUQezHshGn7SgxZq9dRlazF
         vKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QmJi8veTXHAPWn+vDwupbHDsSR7WDss7mhFB9JuugSg=;
        b=W9P26j4+v98RSM1Ko9RlmgTdHl91xdmrXRTBRNZXG+Sf8np79sMkl8zDY2X/yiygub
         z45NTZQNE0E89VNd4xi2mlp84W//0nnvka/h63+kVGIV8PmJl9Gjb/igS21skZ73kiYZ
         EtCXL1Ea6VVuvxc8qaxZKxvbv+N1hjRAYFAueDlFCjpElxjV6l8PMONdlFfB64M952Uh
         cuJC4wMFq9+thpKc7fkdIZcJhgFbZthlMjO1beI9Rt116G+wHfFHcCeG1TBxdsA9KZ+m
         UKZ/ZoSAs8FOUTgveCa6drK2YvqVgYoHKGvwM75NfcJao2IW1qMLdzeQd600lWkY1a9K
         bK+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N/UnTB4v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si912315qtq.357.2018.08.01.05.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 05:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N/UnTB4v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkqHx-0005my-RH
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 08:31:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHh-0005lI-Q6
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHg-0004QX-AU
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:21 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:38533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkqHg-0004QD-5I
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:20 -0400
Received: by mail-ua0-x232.google.com with SMTP id o11-v6so12543512uak.5
	for <qemu-arm@nongnu.org>; Wed, 01 Aug 2018 05:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QmJi8veTXHAPWn+vDwupbHDsSR7WDss7mhFB9JuugSg=;
	b=N/UnTB4vz3xLRmov3Y8C2xfh+t3d204KdPltZiu5trecaOytG2VAbCprMF1XvBzZo/
	Yh9KKWWq1GDabJX4nw9yOLYW3zEfjMyH1G/+gJ6sD5eqd8yOi9CMc87502eCS7dhlU3y
	Hm/2RgfXLPXBgG2pj3LAuwwIEH4YiF05AkcmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QmJi8veTXHAPWn+vDwupbHDsSR7WDss7mhFB9JuugSg=;
	b=apGpBnH71u1l0UACaP0r0I13wy1+pASwA8dSPrLQMH6DFzNqn9vQhvmqjhSB8DXz/s
	GWDjVxaZE072OJpIzSDAKtS1gph2/p4B5FQ3cVeprQevdg/2ZrpoC/bw7Kz7n0mDAmGG
	JGC4rHtHQDU+tdujmf5spFgjRVulePP6PJTbWE0R0xC57MIkFet2dwGG6/t9cpQzOKLQ
	aTpr6pVd2v/Z42xvL1UR7/cl4qc2nSYbk+Tp7R731BSVnRPKF30PsZ0d/O/9ZFgsjWB0
	fouGwCK8T+MmCg49k0s7KYPEZKlhzRlhJtvWzvTOXWGhF531pZ5QCg70LTh8P6JJDJAj
	v/Aw==
X-Gm-Message-State: AOUpUlGtFSywPISoSEteEsk3rt5fHAAcu9CNWWcXKVUceLHpQS4m1r4z
	oZoZiGHyyRFu18Yd/Y+1u4HpKA==
X-Received: by 2002:a9f:37c8:: with SMTP id
	q66-v6mr18092449uaq.180.1533126679418; 
	Wed, 01 Aug 2018 05:31:19 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	f60-v6sm4247847uaf.10.2018.08.01.05.31.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 05:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2018 08:31:08 -0400
Message-Id: <20180801123111.3595-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::232
Subject: [Qemu-arm] [PATCH 1/4] target/arm: Fix sign of
 sve_cmpeq_ppzw/sve_cmpne_ppzw
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KE3F5r46pes

The normal vector element is sign-extended before
comparing with the wide vector element.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 54795c9194..9bd0694d55 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2436,13 +2436,13 @@ uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
 #define DO_CMP_PPZW_S(NAME, TYPE, TYPEW, OP) \
     DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_4, 0x1111111111111111ull)
 
-DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, uint8_t,  uint64_t, ==)
-DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, uint16_t, uint64_t, ==)
-DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, uint32_t, uint64_t, ==)
+DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, int8_t,  uint64_t, ==)
+DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, int16_t, uint64_t, ==)
+DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, int32_t, uint64_t, ==)
 
-DO_CMP_PPZW_B(sve_cmpne_ppzw_b, uint8_t,  uint64_t, !=)
-DO_CMP_PPZW_H(sve_cmpne_ppzw_h, uint16_t, uint64_t, !=)
-DO_CMP_PPZW_S(sve_cmpne_ppzw_s, uint32_t, uint64_t, !=)
+DO_CMP_PPZW_B(sve_cmpne_ppzw_b, int8_t,  uint64_t, !=)
+DO_CMP_PPZW_H(sve_cmpne_ppzw_h, int16_t, uint64_t, !=)
+DO_CMP_PPZW_S(sve_cmpne_ppzw_s, int32_t, uint64_t, !=)
 
 DO_CMP_PPZW_B(sve_cmpgt_ppzw_b, int8_t,   int64_t, >)
 DO_CMP_PPZW_H(sve_cmpgt_ppzw_h, int16_t,  int64_t, >)
-- 
2.17.1

