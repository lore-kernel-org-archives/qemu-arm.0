Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2536917wrt;
        Sun, 13 Jan 2019 17:22:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7dNTGe1FYBokPtAufED3TLL9XRFmKyhbOLpgIzlXT5cwsojmp50WM50VLeMfdxo+rzCtQW
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr10221138wmh.92.1547428962470;
        Sun, 13 Jan 2019 17:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428962; cv=none;
        d=google.com; s=arc-20160816;
        b=1K4SSZBHC+P0+CViXANQQlbnTP4h9bIkkoHn/71lIkqoflMx55rP2z5OE2I/a2SRMe
         0dneC55o/XSMiuZoycijsuZe6QJoT+k1Oy2hpmcdqBg4A9EJ8BoSWRHZMU/bgoyDdsu4
         rB6Qo4OZ8VH2bBGSYwW0wiulpxMgs2VB6yqUvYRR5P8mf3ejvQGtN+vtkTZJo8++MT+2
         ZxbcXlz79LYzUClsbv5juO1TAfxTv8LZI4NoNEWl0vEM0yDPzOzCwNih13RTtEG4V4RU
         jZqXenKCxs4SNxde0pzB9ZOTiKLPRw34in5IsKOW2aeDefAnHwAPCRFQbFfukfhYoPH0
         j0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4pgO9l4pPYepnr4R2SXCI+iXxa1cmas+CwINdPmAQ/g=;
        b=YpHPbHsceJqphq6MjY7tW5JCATJhGpXjFCm7frBZ+cKiICbig84XmxVjNxPDhaM6uc
         vwAkQlDj2kBVD5zhN7qYMiOMYlgCmu8HP5m6D0CYvbqgxfkXF60f9YtsY4aCvMPj+YbV
         gmW26fQn+vH8v6IEMAoknQ7tuYCBOnk5vVamHpQDjadzMx9qqaxuPl8t1Ijtr+tZTCwu
         KExY6LEINPHfhZyt+XYIriKgtTbFbu2i6owX+NxIaq5gn0vPsQ9LUOCr1KHLz130vju8
         rBBJs4n8TTdIvq53b8eXIEP4mDCHdMSgoIkxczI9gchSsllxS3a6Udf24JeHJGY/Quzc
         MvaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kOEj26De;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si17807268wmr.17.2019.01.13.17.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kOEj26De;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqxc-0004yq-GA
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnW-0005uT-RC
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnW-00015W-4i
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:14 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnV-00014v-Vy
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:14 -0500
Received: by mail-pg1-x535.google.com with SMTP id w6so8737363pgl.6
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4pgO9l4pPYepnr4R2SXCI+iXxa1cmas+CwINdPmAQ/g=;
	b=kOEj26DeVSlM6xgaMBBlq19G749tCkGM8RuLMu1oabRf/UIxDuQaAGcIJ8J/LI3bGZ
	9sEhJoi8xH2tylD7D7UVhBsAX4prjRdkVmfY4O/oIbBnXORYZA53jVNmgBbMDsR0ap23
	hwgAnoW3Lv7zJO5Ja+PvDJE8s65Gh1P8xqjXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4pgO9l4pPYepnr4R2SXCI+iXxa1cmas+CwINdPmAQ/g=;
	b=RHrwvxw5q7KpVWSQ8asR1y9Nn2xp8c68mjV+Ml2FOJwFG1J9V+Ybvpe04n0GMc7MWN
	/t6zDJtLBL8JiGwadVFNqI07755AgME7sKZuKnZGGQz7EcwRU5Qmz04f2UwHjH59eYzS
	Oj383U99bRjfS4rp1u1Vw3P8TJDiJJxcRmEBRe8wxD+3YeLSLV2GpFxIB8bU8cdnuLPu
	HUnDJOLVqeccP7ha8yp8YxeKixNCQysRl/mJuDZAd3/vl2+qCHJDdIqF+aYzwbt21ySP
	aC1M9G2+AxC3eJ0gMUA+UFPjT5XjDJ8vy0b7oHLAkdJfl01bZIAvDpvunARA6Qkj81qB
	vhpA==
X-Gm-Message-State: AJcUukfkGXuWAIOd0t+A+whcm4jsD/FfQAF360Ac1hzkoZrDHSL+tPpY
	oB/Q+IFE8/NmN4h/Rvq3kVz/jmx29dKEaQ==
X-Received: by 2002:a63:3287:: with SMTP id
	y129mr21159951pgy.337.1547428332622; 
	Sun, 13 Jan 2019 17:12:12 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:18 +1100
Message-Id: <20190114011122.5995-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::535
Subject: [Qemu-devel] [PATCH 13/17] target/arm: Set PSTATE.TCO on exception
 entry
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
X-TUID: L0vbDXB9whOF

R0085 specifies that exception handlers begin with tag checks overridden.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df43deb0f8..1e9ccf0b2e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8830,7 +8830,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
-    pstate_write(env, PSTATE_DAIF | new_mode);
+    pstate_write(env, PSTATE_DAIF | PSTATE_TCO | new_mode);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
 
-- 
2.17.2

