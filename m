Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7232388wrx;
        Thu, 7 Mar 2019 06:54:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwie3fKsDob0vLQdWRp15xHIv90gNRwNQoT6ozsl55XUvgfwrZ1/0K4j8n6Oa3A7Ipidnq
X-Received: by 2002:a25:850a:: with SMTP id w10mr11253730ybk.495.1551970447232;
        Thu, 07 Mar 2019 06:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551970447; cv=none;
        d=google.com; s=arc-20160816;
        b=kow/v6JpR8/gBQClRjq8I8YdD81T+yULTm71tDOZxzxehbDlNjmjuv61vJEjz4jwRm
         ZUttuDtfW3uvzGSdBrl4RENE18kFaSgt6KbQN81uUQO9Eq6d3sWgd7cDxip2yh747PgD
         TuW3y3IDvd2FLIkVZCYuysJi4lCMsPGC8E0ONP2rrvml6BlRIncPr8JcOCITKRZh0YuU
         ibcHIs+ndrKLpjrLVVtVBOBvpl45IzvLtUxD/Bc3sebN+8RXiOl4Yl9OHEAXJ+Z+Q1gf
         3wbycBND6w3uhzR7Xwae8bA6gQ3fwpnFN0Kmez8eFs3T1rTRJKcO5seWqIytPtwrlAWY
         MnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=swairKUpkVUyv6vQDUxZREMTyQpkwikTQdcjVzA2r4A=;
        b=OfcNYE/wOzYkg+w8iMsFuf0l/+5a49LLp6KBNPBKWkne8wuKypx4TPgkSrqT2Njqmk
         CjbxOaemI/n/bM/IITC3wNloWJr08FD44IRjKTkUxTRjksnRBRgCuXoEI5d3ePxkIqw+
         besa02qQr6l7Cz5VZbc/EoAbuobBsi/YJALPKErY4F1ZxLNhguM0ST0lz0jOmm4iZKh6
         /voLcgxRKdznHGS1lP/6c3ukDB0WT4w2U/qwl2clI0Lrt3c1056JOspvXIVh7OTV1+2O
         Shw8ZJ7XgYjz26g8CjnkoSkH1tjyLDKoxEpOUFZNeEmFqfP86TX5AYSVCRJ8MnunalKH
         yAzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZZne0/wM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si2655343ywa.452.2019.03.07.06.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZZne0/wM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uPO-0000Gs-Lw
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h1uDR-0006w2-2k
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:41:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h1uDM-0003a1-Bd
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:41:45 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h1uDM-0003ZW-4J
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:41:40 -0500
Received: by mail-pf1-x444.google.com with SMTP id s22so11582034pfh.4
	for <qemu-arm@nongnu.org>; Thu, 07 Mar 2019 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=swairKUpkVUyv6vQDUxZREMTyQpkwikTQdcjVzA2r4A=;
	b=ZZne0/wMGGVwzNeAw9hh7z4Y4Dkwu9/icJlwFltEoqE1pO9tqjMd+LBkrNiq8jktBI
	eEkoov7+5688ALcz4rTIsO54MaKBMsCT5WDSNv9+Cn0n1x19oXV+zetMG8lBwy0SK86V
	ybmTF9AP0CXMVDpUWSvRaCW1YZgxpSmdL+nvWSJy4lZ7/hgw+X7jist7DYzSjYI1TTn+
	fDVexlaArXtDN/ZoZFZTrb/P+HF5qfg8QAvTxasHKUOQVhMag7UIIgCuTtBuCVCQtroy
	XA7So2wIP7glU5QJo3Vg7+W6eTRiz4cqAOO0mf4GAQ+TyrBXuWRlMfQmYH31nDKw5kRE
	Dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=swairKUpkVUyv6vQDUxZREMTyQpkwikTQdcjVzA2r4A=;
	b=ee9eXXqO89qxJ/gAXm4DQDtfuOwZEhz7UIjI2laf2HxBNCzYXwrAl97CC95S7l0f/4
	z/zcF3U/DCeykTg57OkKBNwDWT8AsUI/ygI3mVJdZL4eSxRC3vVic9fFHBCaauhLof65
	9OdgVIIQ1upN2oWrsaWdA+I0Lks4jzYSPDOwIUadV52+hR+H/aDMBlaS3LlSKKFMzbxg
	w0qohUwPOKgZln6ljDhKJoxxOEJfmL0+V+CqWGKmebJzRA9pxF4DAWY2iUY36uQb/mnc
	VYTMunPHi2C3UdCzp5SAESlA/lLoTLEAFIzMw5s8do0Ha9UcIpYLZe91BScK3X0cjxX4
	t/LA==
X-Gm-Message-State: APjAAAW8SVMJYcUp6bWPpgjzeOg2cB2Ai0n3+XMrjtu/fKPMZX8KoT4i
	RdKrQ+dxaq+VsB+cAstQI0DOGQ==
X-Received: by 2002:a62:57dd:: with SMTP id i90mr13163514pfj.154.1551969699261;
	Thu, 07 Mar 2019 06:41:39 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id p2sm6222838pgs.7.2019.03.07.06.41.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Mar 2019 06:41:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 06:41:26 -0800
Message-Id: <20190307144126.31847-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190307144126.31847-1-richard.henderson@linaro.org>
References: <20190307144126.31847-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH 9/9] target/arm: Simplify BFXIL expansion
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	david@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDz89hKBuwt3

The mask implied by the extract is redundant with the one
implied by the deposit.  Also, fix spelling of BFXIL.

Cc: qemu-arm@nongnu.org 
Cc: Peter Maydell <peter.maydell@linaro.org> 
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 54fe94c436..39e0512d21 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4043,8 +4043,8 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
             tcg_gen_extract_i64(tcg_rd, tcg_tmp, ri, len);
             return;
         }
-        /* opc == 1, BXFIL fall through to deposit */
-        tcg_gen_extract_i64(tcg_tmp, tcg_tmp, ri, len);
+        /* opc == 1, BFXIL fall through to deposit */
+        tcg_gen_shri_i64(tcg_tmp, tcg_tmp, ri);
         pos = 0;
     } else {
         /* Handle the ri > si case with a deposit
@@ -4062,7 +4062,7 @@ static void disas_bitfield(DisasContext *s, uint32_t insn)
         len = ri;
     }
 
-    if (opc == 1) { /* BFM, BXFIL */
+    if (opc == 1) { /* BFM, BFXIL */
         tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, pos, len);
     } else {
         /* SBFM or UBFM: We start with zero, and we haven't modified
-- 
2.17.2

