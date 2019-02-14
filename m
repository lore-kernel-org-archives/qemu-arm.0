Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp508890wrp;
        Wed, 13 Feb 2019 20:01:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbZT8f5aaq7y4TmTTx+uG3ksEZQnkwNroBu8jeV7tzMHVP+2Khydg7dO+Bze6UpiT0uR8DN
X-Received: by 2002:a0d:eb42:: with SMTP id u63mr1367624ywe.162.1550116883584;
        Wed, 13 Feb 2019 20:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550116883; cv=none;
        d=google.com; s=arc-20160816;
        b=JBlsx4suufygM8VS6dy3qOwRnwkH+DLiHIDZBlf1HhIUhyIQudWjkVnsXOhWcaC2z/
         3NMeNWPHvU7lGjYne6Y7XIVtGW7NOBZPKKF+xW/PGSqZYoBkdvKsonGgCnbmiaFSMRVL
         oeHEEn1fBdbk+2c+sxedX+8Ic4EBOgSr4yX1Hbaag8v3bQaU+mh0Kf8e7LpaXtv2TO9J
         WcTWAdMRiLzqZ48VDyluwCC5fgFBXeMCDOVrQRG6qUv5KoIIGoFb90YQx21N6I8tTN0c
         OKvySKuxdixrJxmquqPoutYRduOtp8txUwl/NjZBzHZ4SMTDu7ziC5DMgOuozKDMy0/5
         7Okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=cbskW479OhNUzyJNbm1VlQPK+6mCdYvQdwJmmMsXd+Q=;
        b=Ob6f+oVXFkF/nRXLmUyx52tK01Z7uxXAYFbZYzPKUoUHJWkgeAvo7JFWeHH6+KQ5OQ
         G2hbtdjtWcUq28lIWkQ2WBGLkTmd43BG3wp/CqwLD5gvluCXJbCwa/JlCwD6I/VN0IuP
         3KLVEviBF62TECKQn95kthWhmiAJbpVWtSj6cD4Zyplm+4kLqZpLfxnIN8ktgc8dR8qd
         gRKYpHPTTl1qJTKkRpPq9O63gX16977vRcrorqCAlBKGL/T1zPaOpuadKI3QlSccyi7d
         IvAoTmWz0UnXnn8cSYDn7fuHMmQeaNYLaLx+TZcR99/HsirxscZu3KsVuDTaZLH+zyS5
         2tJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LCl+ylO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si717316ywb.239.2019.02.13.20.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 20:01:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LCl+ylO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gu8DC-0000pw-VM
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 23:01:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu89f-000721-9r
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:57:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gu7wL-00077Y-Mc
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:43:59 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gu7wL-00072l-Bj
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 22:43:57 -0500
Received: by mail-pf1-x443.google.com with SMTP id h1so2340086pfo.7
	for <qemu-devel@nongnu.org>; Wed, 13 Feb 2019 19:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cbskW479OhNUzyJNbm1VlQPK+6mCdYvQdwJmmMsXd+Q=;
	b=LCl+ylO6PbH9k5bY860RPQnrt57dxg0qBaRmREX3iYhTgfa9pCH7MFxQWgC7om83o7
	boIn8uV+IBsxwiYo0pWqVQiDyjci9/SqDr94cBflTOx/KNFIpGY9/DSOIOd+vaayxgnC
	tbtloiH0CF5st5JAlead43XtL0+cz4cLagXdfD1Iv+Sf+uzZM6jnPf6kXiI/Lyg8YUEB
	3z3/IPKf0rlJOzF6wmaPsAl6qTlCN1Zuu3vTDigmzgk//XFNxGFqvGTG3h4imXih4x7a
	SDeZFJSc5ZDYXfJLa9CocesK5O/xjNXy20DjNvz8L58BkqpKxx/Gqm4y0VgOIFwmyKWn
	PQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cbskW479OhNUzyJNbm1VlQPK+6mCdYvQdwJmmMsXd+Q=;
	b=GRSrwYjU0u9pVtvfHtmsIX3356MpBqDmmVa8NiaShB8HcCcpKkSSJ7hzJpu6GsAjBu
	RoMxnJDyd88wLpV6/bqw4G03cBnwR8FlWQvh1t8LaPRw4iu+0HZa2jQLdAxdFGlYXmXI
	5ByTcu+A8aTpGXCaAW1wJqhClNIqWQy3Kl9NCNpVZQmNHVqCeutns1i5mdxt2kAvXsQr
	tjC5X35qltDFuC0U2J2VbNvPVq6lV8pbg5ayuPSHYIOUl0cy5A/THCDKBAkDADVmfja4
	zLvRttwJUgynHJf+y7pFkGoHwm8rNVvTRfA7yudEKvmc46khbfIWBrqWD38k8h+bohsL
	tC3g==
X-Gm-Message-State: AHQUAubStKeLcqttl1sgzxa5909JlK6p73RQ0j4qrROTwetvEqPU3/tR
	ctX6pRnX6RDD6UvvLSTsg+wRB5zMOV0=
X-Received: by 2002:a62:be0c:: with SMTP id l12mr1764171pff.51.1550115833004; 
	Wed, 13 Feb 2019 19:43:53 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id o2sm972713pgq.90.2019.02.13.19.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Feb 2019 19:43:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 19:43:45 -0800
Message-Id: <20190214034345.24722-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190214034345.24722-1-richard.henderson@linaro.org>
References: <20190214034345.24722-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 4/4] target/arm: Enable ARMv8.2-FHM for -cpu max
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
X-TUID: mZ4ir6rlboCI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 1 +
 target/arm/cpu64.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index edf6e0e1f1..f4aa6202f5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2002,6 +2002,7 @@ static void arm_max_initfn(Object *obj)
 
             t = cpu->isar.id_isar6;
             t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+            t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
             cpu->isar.id_isar6 = t;
 
             t = cpu->id_mmfr4;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eff0f164dd..bffce337a4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -308,6 +308,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
@@ -345,6 +346,7 @@ static void aarch64_max_initfn(Object *obj)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 1);
+        u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         cpu->isar.id_isar6 = u;
 
         /*
-- 
2.17.2

