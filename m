Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1951522wrq;
        Sun, 10 Feb 2019 17:24:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbVRrnkj4qF+G24veBl4SgSwfKJAdTd5g/eUGpzow+g6LgBsqAbLB/tGnudEcXK+C71dHYD
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr24201073wrt.209.1549848283914;
        Sun, 10 Feb 2019 17:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549848283; cv=none;
        d=google.com; s=arc-20160816;
        b=guWDv5vjMT8ThjjFHR0gJwwFbOV8YElLsmYM76W8ai/1J2D1Wu8vloky/GFaQOclqW
         xZ40HJHxY8qGkj2WeMbn6KuzrLtCr78cAYloys6CVtEzSOce/DHJYVls7RlTuaN6zTcr
         aklc4GKGeroueYohfnRYlaG/OLmIZZOkIDH5tQu3Hyd4xcJqhBF2TX5fCTl3E65cjFXp
         NOpALw25lQt8+EgK8FxCOLnaSwIcq5Rm8IheWXJBgGC76wj6MDZ2sUnwUA0M8XoNnbEy
         cHEYbtLqJE2axhPvj1mYe18K3wqYsDAZaOPzk5p9zzMPTj0CreJeC9k+jiu2P8xf2glg
         qr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7HsOcQyaMevodOsm6h2V5NoXxK7MjvAqlm4dwXNbUE0=;
        b=QmVAjPl6+jnFtf74lXiCKxJH+5TfypP/RZHt01PSGqVdKYIkiKDX2ViXpnfBMHvQ+B
         1HdTkhiNP61jvX6GUueKp5kr70QKqwFSWm1ZawNDP579RrNTAwrQ/jKz3bdgXVnlnu1M
         jSDmjFlrSUnrquxmb1/4YRnrePUNblXhNoM3ARsdN77PtUOe/R7k/4s+k63WFxwtQY4K
         QkJVEz39xy3PdCgsQHKrM0VpdqyPiYJXmEDC28DDCfElpDzVOZbybbEAnIgZX0U7GsIH
         CGC9OFJXv6kelCBewoZjprHseC9LhdXXmtHE7YdLH8KPSKqmKuDERWU5RlDXaDhSZiSY
         QtFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hazg7KQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si2229071wrv.289.2019.02.10.17.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:24:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hazg7KQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Kw-0000eZ-Jq
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05w-0005xO-6v
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05t-0000Bn-C8
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:12 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008Jg-RO
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:09 -0500
Received: by mail-pl1-x641.google.com with SMTP id a14so4492056plm.12
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7HsOcQyaMevodOsm6h2V5NoXxK7MjvAqlm4dwXNbUE0=;
	b=hazg7KQhTZgxswEpm5yJjmAMfTbG7j/FcXuwRaLquCo3kaZdQpB/E/33P2w64PGymB
	cMyF6wmmXlg6+V52JA9IQaWThN4xAyyl0QpNkjsG+ujVfWQTnZh7V9b5M4hcCe9OqyS9
	0zXuNDRI9Hk89T8aHKzy7Hov3gcNrGPf3OpRUr39rYxq8i/TeHBNhJhM1YxndjeTC3cr
	jUvy5f+TWYdnyq6SiIlg3G8VloTn2PQBw7Cn3Dhoo6E2/x5GYC+FCAhBeyRyH7bbdFuH
	gqdhYM7xBRrp//2aIR00NMpd8ZZp7BPe0oqFnc6tKZN4utkCtrrprn2hy+HNKLLhqZBF
	SOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7HsOcQyaMevodOsm6h2V5NoXxK7MjvAqlm4dwXNbUE0=;
	b=HpONsgkFNf2qSVJ5SexIJwjFUUYStaWULaP29xutNJBd/NHOSZohAJjgVl3dptnyc0
	lv4kpzl3klL89GAvXjw6cHqZuctNICVr1hbE42CZ1aA85K9KhnHTQipjPTx+rq0dFwfc
	Sl0aSO1xtN+eYWFoaacnxWOsRcTA6ymcFsGAF8XL8QhyjGR+Pjp4vn2zCFIZeRB5XBjf
	Zqe8724+0gD3Rh6WuqJOr0emeBafP1t0U3aswn8ieTvTMRTSshD0QQ4fvzJtYNLOLbvo
	NhRwB9aSr8OMf71EZZfmR2RuU3D2USPyB/J7yxSu+nY/EaBEKif2tnSJ1mgCXIzJXN3F
	BdNw==
X-Gm-Message-State: AHQUAuZs+QOPtZZfLl/jhY5mg2ORVG3hs3DIp+91vvm/GN1K51DqiKEA
	USmsfbiWWpB18Khn99Dq7vKJRmp4YRs=
X-Received: by 2002:a17:902:1008:: with SMTP id
	b8mr34155918pla.252.1549847333992; 
	Sun, 10 Feb 2019 17:08:53 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:20 -0800
Message-Id: <20190211010829.29869-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v2 17/26] target/arm: Implement the access tag
 cache flushes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pF7jaOvmOM6v

Like the regular data cache flushes, these are nops within qemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2d9c070bb3..74bace81e4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5772,6 +5772,54 @@ static const ARMCPRegInfo mte_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_NO_RAW,
       .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    { .name = "IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
     REGINFO_SENTINEL
 };
 #endif
-- 
2.17.2

