Received: by 10.28.4.212 with SMTP id 203csp5139351wme;
        Tue, 1 May 2018 11:05:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp3LlwEeiRO1vU63qxfaOLCPoIUUhc3Lk/Tuf6XBNBO6X+y12SF4dEQ5TV1qHJ5cGhA8ghr
X-Received: by 10.55.31.77 with SMTP id f74mr12622999qkf.444.1525197920744;
        Tue, 01 May 2018 11:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525197920; cv=none;
        d=google.com; s=arc-20160816;
        b=Fv1TXeVbvJLUtHZx6kYpT7u0jMm7R7FxMR0gA23P/vCG96gKNBgQQvXyOL5rPsKwex
         YkEHUovUAkOtkRwsRrhQDNh2XR0nFMlqzQkFcp0+1nFJRDy3or9GPcbJfX5OBHII+jw1
         VEsEbuE4FRTlsR9XZWC/P3Uloc/sAQvqr0QjYQxnL5//2cNlISmZ/Np7L6Ijamx7SZFJ
         Y0897zUC7sOmdsgX2x3J5C2pCn2xi6uLxQjwhNciVE0r38fMmvKnkxhjL+OQH1VtBudw
         RzRMpBBUzHpgQ35PvWPAoJbpOUbWpGfKmUkYHfP2qdjTwUoMczGg+zv8ZeUTKXJ1835Q
         PKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=1BZd8qt69qVsAYir59uUIsDXmGXzpo1zdM1CqHLvln0=;
        b=s52Ez0EycWSKGAsmfQqSkuqfKc93OM5e4SEmvVLDsvkDDRatsc551R1iHk55ngIurY
         e0AhtjeaCFuz+4TxwpTB3AE8BhQa/zMlqyc9nGIIVAnr9YshgtOsc2uYDN/HKXj2+zLI
         LuN3oRdwKInB71BzsmZoQgMyb28S1/qT9OI++4YynTRz3T7szjYNn17MAi3riZArrSZU
         lh9TraWO3+K9k3ko43CDA+zO1XeK6z6mcXU41N92BxgUBKtv2E0FPbTiIyX47lt4U6VI
         Wzq14tnum5a5o0rECvNh/3WeY9OPcxp1LuQ8HqQPStwlq+RV29/7X8NnoLMqMh/Nu3nw
         L+6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cpsbgN4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i15-v6si6545071qta.298.2018.05.01.11.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 11:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cpsbgN4w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDZeS-0008Ii-9c
	for alex.bennee@linaro.org; Tue, 01 May 2018 14:05:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZeC-0008HU-FE
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZe9-0000Yw-SB
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:04 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:42413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fDZe9-0000YL-Ll
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:01 -0400
Received: by mail-pg0-x243.google.com with SMTP id p9-v6so5874785pgc.9
	for <qemu-arm@nongnu.org>; Tue, 01 May 2018 11:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1BZd8qt69qVsAYir59uUIsDXmGXzpo1zdM1CqHLvln0=;
	b=cpsbgN4wCvlh5AiaCipr8uLhp202mZDfEhwjZUhGaoMlAsCPAVWm0YkN7PHewXdNyq
	FsU51h0yVchr6OmWXuzzjjDE8L5GmRiFgocBWbnPiOEjJJVRtk2VvWnYNt/eQ8scU36c
	q6Qu2+haPioQQcjwS8BV/vn9TLTURsz4nET3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1BZd8qt69qVsAYir59uUIsDXmGXzpo1zdM1CqHLvln0=;
	b=QYwjMUZGE5hrlAon4rCYtgSeZhnDEVi6EAwOb4vj67Y+g8c7w2vKo/dxoQLLNbZkZT
	pRJ5kd1bf3+YnWREB9tq6WK+HiEDWpJD9GV3rcAk+LmCj+RIvVu+k5NPxTfd+T782N5q
	jwp6V4wZXaEgtG4zP35mp1GSVP0kk7a7Rn6NvlEUBoNCp8gtSMy7vtpCiWU4TIW0z+uA
	FHDqkRpk5fPTMRrZ4X4yvlJRs3GJToBQVWJxqF4IuuxjhNEOS5ubpofKryzUOMz6c2ID
	DKGK2Rj6mFXtC+nRIa2QrL/7I8acOEjrTiBaRNFsXnUcj7LnWe5Knx8IUUSHnYBVtiWo
	i97w==
X-Gm-Message-State: ALQs6tA9QATl0Vpvjz7ehRAEA24TfHxFPfSajaLMCAwpRDDIfkhD+5Wr
	Cv6eErXNDCstPJLAlaHr02Ej8NoPVm4=
X-Received: by 2002:a63:8c0e:: with SMTP id
	m14-v6mr13896306pgd.320.1525197900555; 
	Tue, 01 May 2018 11:05:00 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j5sm23732224pfe.119.2018.05.01.11.04.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 11:04:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 11:04:54 -0700
Message-Id: <20180501180455.11214-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180501180455.11214-1-richard.henderson@linaro.org>
References: <20180501180455.11214-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Tidy conditions in
 handle_vec_simd_shri
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i+SUqsxKfc0e

The (size > 3 && !is_q) condition is identical to the preceeding test
of bit 3 in immh; eliminate it.  For the benefit of Coverity, assert
that size is within the bounds we expect.

Fixes: Coverity CID1385846
Fixes: Coverity CID1385849
Fixes: Coverity CID1385852
Fixes: Coverity CID1385857
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bff4e13bf6..97950dce1a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9019,11 +9019,7 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
         unallocated_encoding(s);
         return;
     }
-
-    if (size > 3 && !is_q) {
-        unallocated_encoding(s);
-        return;
-    }
+    tcg_debug_assert(size <= 3);
 
     if (!fp_access_check(s)) {
         return;
-- 
2.14.3

