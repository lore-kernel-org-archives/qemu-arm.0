Received: by 10.223.159.74 with SMTP id f10csp2941986wrg;
        Mon, 18 Dec 2017 09:54:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBovEUWXohITHPsESv3MABRl38VXpcv2vqqBtu1yI3WWZRi2mz8Z1jK6E46EdnOGmueL4pEGz
X-Received: by 10.129.52.9 with SMTP id b9mr487309ywa.54.1513619667752;
        Mon, 18 Dec 2017 09:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619667; cv=none;
        d=google.com; s=arc-20160816;
        b=LBktv1gjJlUcAbZzFfnhBSTORQBYlY0rwwyJpdnPkR6ukdHn1tiM9kt0h74sYT5Kpo
         6Qfr1a55PsXawjG1z6oyYERVYvO96UmbVrCjZYo6OPLlFkpoVyb8ciS+ReLd9OfBaX97
         h3+WJcCTEBt7t2b3rcnAstOwP1kV5g/gB0+B12QorBNJQ38JafXUtE87g1r7kbnTCt+W
         gydzuk8nahCXeKAT842ABqHGj3vzeUrHReTfGG5n4crQzsvTHWW7ET83HQXsND4AFvRy
         kmBrLhr5BmZnBRTPItY8hcXQ2GhGkYH4SKUhItyxih46xMiTe50SL2bpTe3ta4M1cvWl
         LpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=W93ah91u8A5c8lGsoOsfCn5H4dV1elhaDMwT3JRL7sY=;
        b=T13XTRVIARIur3tS57iYIRa9asggThPrGjC/rZ0fAOY3sMl0uLcfYSX8XE9//tRy7D
         x3ulDt+dI0WA+RcW513xGQmoi/SruDxmLowwJYKRMdGX/KJ4FbQFJotH57PfefqhhoT7
         LzgHFMXVdQUDieLG70wcN0mZhZw02FZTlX+pDLqkzn03YhcfeQxMPB2vtSf8vdQSNOGH
         7sRp9iq+V52ML9xxc4Kwc8CDU8s860Q14wgsSR6PW3AjlmNeKVtNam5lLAiC2+7V5Ecd
         lz4Gx+DR0jOe9fy/AVIU+PnTqIL3X3E+ZPIL6G4s7aPApzidyoB9EsFKQ5E3KlokHRrz
         UyAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UOwvzZZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si884223yba.739.2017.12.18.09.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UOwvzZZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzcR-0007PA-5W
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:54:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFF-0002XS-Bs
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFD-0004bI-UX
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:29 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFD-0004Yg-B0
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:30:27 -0500
Received: by mail-pl0-x241.google.com with SMTP id bd8so5216086plb.9
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W93ah91u8A5c8lGsoOsfCn5H4dV1elhaDMwT3JRL7sY=;
	b=UOwvzZZAyIqvy6/gvivLJHEGEnIuczgjDk2f2nv9Nz/EWOkt2d9efpG0IZ37+afEg+
	ez33E7X0rc6iZMcjwuo12dFYkc0O84SqQXGBmBUufULwXAMrYFXiqIdbYNaYjsPlyUBw
	BZFSmX88a34qJIyEuvzmWHw99p/jFmvGYcoas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W93ah91u8A5c8lGsoOsfCn5H4dV1elhaDMwT3JRL7sY=;
	b=hOQumjBTCWPOR7yHiMpPReZEQJTWZMW4y5QeeSInKl1DqY3oiuM2fK0RM1aLCwsmUy
	tnhY+NAww/rZOvzfBb6c7QsOuEPc+7uzrPnobaALUr6atvqu8ZbGtzEaB0tCKjuOE6UH
	mWRr0dk0aiiDFhSL9wstlmssnQQb9KVyoMR0M/qeCSuDB8jZrRep9+qmStled9lZ2ygf
	e9cTyvyQLkXtiq7h14vcbC2TcTMONIs9v1VYZwbwyO/vnAA35qPjbhzTBqNe4QZ07779
	kqrCUrlZtoh9VxbfXc5lCSndXLG3carpXoDzDuOWKSCaQIzakGDEysikDtiuo8LEf5Gu
	zNFg==
X-Gm-Message-State: AKGB3mJFiGmGzSueYi5wbhW574tSFL3N0/tz8hBwkCwgnrRWLerdhKyP
	9FU5eJ2MSAMVZKrT8ARYOTZURg==
X-Received: by 10.84.245.15 with SMTP id i15mr452074pll.402.1513618226396;
	Mon, 18 Dec 2017 09:30:26 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:14 -0800
Message-Id: <20171218173022.18418-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH 1/9] target/arm: Mark disas_set_insn_syndrome
 inline
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
X-TUID: wW/ovOlv7cRG

If it isn't used when translate.h is included,
we'll get a compiler Werror.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index cd7313ace7..3f4df91e5e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -108,7 +108,7 @@ static inline int default_exception_el(DisasContext *s)
             ? 3 : MAX(1, s->current_el);
 }
 
-static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
+static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 {
     /* We don't need to save all of the syndrome so we mask and shift
      * out unneeded bits to help the sleb128 encoder do a better job.
-- 
2.14.3

