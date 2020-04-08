Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp701624lfi;
        Wed, 8 Apr 2020 08:31:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKkBtGJb3pr7Vbv8+/06x0n8zIxKtwoLZFYPVcjKxeMABCd+NZeRrPXMvfyhRZlwcrhyU8D
X-Received: by 2002:a67:fa0d:: with SMTP id i13mr6537289vsq.219.1586359881623;
        Wed, 08 Apr 2020 08:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586359881; cv=none;
        d=google.com; s=arc-20160816;
        b=dJaMpNTM2JqhbdViC885HH7xwlW9kp4xYTgkDqrFzE5SY+k0k7p2Zks4P55P/gdYAK
         5Woh5dLx8r20g8A+UhEdqjfCFN2E3BMOfBqBdnV+MyivdtO5pDdppBPwrsKDiUkEiwgF
         nvSJ4KfhaYQWxH+g6bhok8Uec0NdcRCNkFjvJIB1gkLOd/Apm2bjDSoIkGbVBIHPot0y
         2Woqx/Bz3Exgd6k6oj99nUDvvF0+93poC+4l18eCkmJkbe/NO6DCr3vcbQWkxIEYobFY
         cBS2mC0AI7bm2qIEWRaJ69tRE+Sbr7lbrYjZr6odPMW7UALnS7iBnCMsst0RxgwM8MmB
         /+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4xCqZslqJJsRTWjQvpE6afDY6HgYOaHKQ9Wpk6HYXYU=;
        b=WdlVZ1mnwEzeQDZ9uwdd2Eulv+lYQY1uOW0dBnCndt9nHO539CIRVeYJRA4ZCFZpnO
         TtGSyXr6HsJhKud9bxeirCxRWHRvaSl/1sJQ2U6i0fzG8QoRoVBT54h0sAvEGMoOTSzW
         dwO0b9gi/gF9O45uQZY/NU91kr+3TNn0rDJ2rCHpJhQ+iVaFdOBObds8/8eFtQAl9Qn8
         LERkoEmau27G3u15sErFM0sQ/doPX/MLsMX1ZDKBsec+vzXRwZU7QI4bbqS3wg0tlZG9
         d/tiiF4c3W3wFt8WcG+GBB4x52sQ+H7OAJP8PHY2PZ/crvhz/4TJVr8h3VCMSZniyjs0
         FzoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x76si549217vsx.77.2020.04.08.08.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 08:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMBtO-0001AK-0l
	for alex.bennee@linaro.org; Wed, 08 Apr 2020 10:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60771)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fredrik@strupe.net>) id 1jM9Ny-0004co-9U
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 08:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fredrik@strupe.net>) id 1jM9Nx-0001fZ-Ad
 for qemu-arm@nongnu.org; Wed, 08 Apr 2020 08:00:50 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51155)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fredrik@strupe.net>)
 id 1jM9Nx-0001et-4p; Wed, 08 Apr 2020 08:00:49 -0400
Received: from consensus.lan (cm-84.210.220.251.getinternet.no
 [84.210.220.251]) (Authenticated sender: fredrik@strupe.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8299F20000E;
 Wed,  8 Apr 2020 12:00:47 +0000 (UTC)
From: Fredrik Strupe <fredrik@strupe.net>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fail on invalid size for VMUL (float)
Date: Wed,  8 Apr 2020 13:59:55 +0200
Message-Id: <20200408115953.1158-2-fredrik@strupe.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408115953.1158-1-fredrik@strupe.net>
References: <20200408115953.1158-1-fredrik@strupe.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.70.178.232
X-Mailman-Approved-At: Wed, 08 Apr 2020 10:41:16 -0400
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
Cc: Fredrik Strupe <fredrik@strupe.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F65aEMSd34zk

Bit 1 of VMUL (float)'s size field encodes the opcode and must be 0,
with 1 making it undefined. Thus, make VMUL (float) instructions
with size=0b10 or size=0b11 (size >= 2) undefined.

(U is 1 for VMUL, while it is 0 for VMLA/VMLS.)

Signed-off-by: Fredrik Strupe <fredrik@strupe.net>
---
 target/arm/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dfe9dbbcfd..4268eed9b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5237,6 +5237,11 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         }
         case NEON_3R_FLOAT_MULTIPLY:
         {
+            /* Size bit 1 of VMUL (float) encodes the op and must be 0 */
+            if (u && size >= 2)  {
+                return 1;
+            }
+
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
             gen_helper_vfp_muls(tmp, tmp, tmp2, fpstatus);
             if (!u) {
-- 
2.20.1

