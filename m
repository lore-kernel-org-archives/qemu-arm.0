Received: by 10.28.91.67 with SMTP id p64csp994896wmb;
        Wed, 28 Feb 2018 11:44:30 -0800 (PST)
X-Google-Smtp-Source: AG47ELuaKm5iy0i8V5kA2/hgjo4cnehJiwgp4/ZRLENNTJ/inryNDATXcCFEGnCRiti9AUcQW+K0
X-Received: by 2002:a25:c7cd:: with SMTP id w196-v6mr13336161ybe.193.1519847070168;
        Wed, 28 Feb 2018 11:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519847070; cv=none;
        d=google.com; s=arc-20160816;
        b=ogB8UO05HpaUIMoOdp54fYQMDgA6E1vb6iNyhRje+kFW+/8rgrIPOqNfKojqEwrilz
         090ygO8JE7GTrdlrAC1AUbCq0JVjwYyWkPOz0RAtsYGfqpx5Aem3oaMZL/pLJmts57U9
         p8Fpl6YM4xPQa6iCahnSARbXjb4YxzlWDyjCyQihY9uv20w8g4raS1Bf2WQzUGzTevvx
         0pZoVjYhz8TW36BV/qKQgdQZuwyWcFIsZU/dQZdQ4Uvr+TBqNfOLa2sj3N00/naBzkI8
         fp2R0d4oU35rauPdlsCjblyg/NhkVPzJOT6RZnnP/us8S7cC+tekvuiBvQJJKFxBqaw2
         sFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=G8wDRM28kIfKn4QAnTQXP7Nr7iSo1v6usJSUJDiitjY=;
        b=X10duzlgiX/FZ9iIm8LMfe6HLhF1e655soVAWlGn9QWhMJe0oX4Im3lGEt4RDTcfm2
         jON2GgEgHp3IIiMm50YoMZsnQxpvg7fOAQn6GquHM2coQetKVTWLk+L8tHrC2B/3HCxf
         Ywanozr9X+evfHNUg9r53cHgtF5Xvlx2Z5U7KLGUTo+xDWeRdeXLuUjTfobICKzYig1B
         1kn02p4HS9jgB3PgvQy2NUQP+YjtkgRkp2H0ElIi2sziZFwQWL2YhJqlp3+MDso3YL4t
         88Mgbyt7kAXjnJ6RvQKomvlHgeDxJxqtH/1d1IOJVq3Hbh+htOtQ5i2NSCfPqLa+mrLj
         L43w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ky/BiErS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r187si162472ywb.209.2018.02.28.11.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ky/BiErS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7eP-0005de-Kn
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:44:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SB-0003Yf-Nn
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SA-0006VC-RT
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:51 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:36888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7SA-0006Ug-Lj
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:50 -0500
Received: by mail-pl0-x244.google.com with SMTP id ay8-v6so2120098plb.4
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G8wDRM28kIfKn4QAnTQXP7Nr7iSo1v6usJSUJDiitjY=;
	b=Ky/BiErSijmkbBjXnVW0X2kDLLF2HkcYkRWayi1dKCWKcuRyeiwFBeiMlXTvgY9dLo
	hjeMv8CzsgdwKQwQK86xAiOaSc6npScr0gLupPKG664pGgr8/a4HQ7D4aP2pJbUowF8I
	SqOM1BaQ2lx4soeoI1zQ8XGEFA4i8wxi+L0/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G8wDRM28kIfKn4QAnTQXP7Nr7iSo1v6usJSUJDiitjY=;
	b=Dcts0fhlS1R3i0vLi8hQXj33aHhtBLJiFbTCS06alqa+H4y7fLuohQgavQAT5lsSz3
	9JxN1dgHxiTOedDRJPsHnjoupeK/lqgVes+MoCEJMvgduKLZBBPHnLDZmamHuiEbxmi0
	DmPnmo5Ap8MvyUtiKYXcBVCZXc7XAqNxmK/YTkaLBHM1QdlEbcdS5n33z3YhvU6ToPgq
	jXXmZzD3pqQ8sNXxAvTBhQ0Y8vIxTPDcU73/60nqqoqu5uJC+YEnEXooYvj5CP0fevaT
	LTQ6zTq8i/S4AIwWXR6rxLmvkEzEvZ2OyrZfwm6BQGGVbBgKKxeTkgEOPu80NvHjuNn6
	PDHA==
X-Gm-Message-State: APf1xPBDRwUUqGHLAaoLYktmpdMMNBT51oqT6QvYpQc0efZC9V4FvN+v
	eCd04S0TL1fMMb8jrXcRsdfONJREawY=
X-Received: by 2002:a17:902:a512:: with SMTP id
	s18-v6mr18972966plq.296.1519846309446; 
	Wed, 28 Feb 2018 11:31:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:24 -0800
Message-Id: <20180228193125.20577-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH v3 15/16] target/arm: Decode t32 simd 3reg and
 2reg_scalar extension
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x8XqsoVeKlSZ

Happily, the bits are in the same places compared to a32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3ad8b4031c..ba6ab7d287 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10774,7 +10774,19 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                                default_exception_el(s));
             break;
         }
-        if (((insn >> 24) & 3) == 3) {
+        if ((insn & 0xfe000a00) == 0xfc000800
+            && arm_dc_feature(s, ARM_FEATURE_V8)) {
+            /* The Thumb2 and ARM encodings are identical.  */
+            if (disas_neon_insn_3same_ext(s, insn)) {
+                goto illegal_op;
+            }
+        } else if ((insn & 0xff000a00) == 0xfe000800
+                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
+            /* The Thumb2 and ARM encodings are identical.  */
+            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
+                goto illegal_op;
+            }
+        } else if (((insn >> 24) & 3) == 3) {
             /* Translate into the equivalent ARM encoding.  */
             insn = (insn & 0xe2ffffff) | ((insn & (1 << 28)) >> 4) | (1 << 28);
             if (disas_neon_data_insn(s, insn)) {
-- 
2.14.3

