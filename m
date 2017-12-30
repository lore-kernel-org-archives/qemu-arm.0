Received: by 10.223.134.117 with SMTP id 50csp8213937wrw;
        Sat, 30 Dec 2017 14:58:27 -0800 (PST)
X-Google-Smtp-Source: ACJfBostrbbdv1fUah3qz9uiieFDced+/e/shamaRPJjtClDDtg0qDW0ixBdnze/sD4lklSZIOWn
X-Received: by 10.37.130.142 with SMTP id r14mr11530102ybk.21.1514674707067;
        Sat, 30 Dec 2017 14:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514674707; cv=none;
        d=google.com; s=arc-20160816;
        b=yBLoEXAdtKUHokRe9z+5vY3fl1L38tGD0LeeskWvYWZxKFkaS1egop3ssoptEJR3SX
         Vq73RYNsBeGAdkTZR7ZUBoeDPbZWvYh3c8aNFe+B+dI6FFEffdwEFhHPL4SnVs8bOB02
         p0D4RKsTueSg/0bJ3y6iJgoXAq1Sr1g008scUhio4Aje2kC6De4iTg9UZVPoEM0gKKRq
         ehQgpWC1b4qqJHhMpbG+qqUg083dgqYzR6ygpoUog9IzsMt6Zr76OzQNNDW539OJEgaO
         iLdviJB9FYpCyTPiSkTjR6Y5BQ9S0paSXT2z+1lv6u7e0ae4QK+fWDd1b7fR5L8+5p/k
         MLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=KEnRJJ4fzNv0J3U9z9AyBpjs0q/YL9xB6CKfO3VqI9U=;
        b=jgGUe0qjwSqDYfb9ox2itlECRQ8J1etMtYL/AXQ2r3jQVD8sH6fO5d4WK9e12uPPj9
         6gGs8SLSWwmh5IP5pUlLq2hBeqScrYWrqj0us1g/iLL/b4azKpzWra0rucSRk+zrFQBP
         VvMXidCsQhql2RZsqn0YQS2EfqR7B/y882NfttGVZtWsKwqgaX6Mp7zK4dmGrdWNrTPM
         uccEUAUEmvlVDxk4RkfxOkn363OgyIsP0CGMxXvhdIcENrnZpu06G6eJ3Qfw7cmNPvSJ
         mKpvQdVcnu4JRws7jOAhqd2a8TGygakhLmtne3xa+mboIN15TE5sBNhTWTKgmTuEf5Gb
         WivQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si687897ybj.692.2017.12.30.14.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Dec 2017 14:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eVQ5C-0006Fz-Jv
	for alex.bennee@linaro.org; Sat, 30 Dec 2017 17:58:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@dinsnail.net>) id 1eVQ49-0005ln-Ji
	for qemu-devel@nongnu.org; Sat, 30 Dec 2017 17:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@dinsnail.net>) id 1eVQ46-0007sQ-IB
	for qemu-devel@nongnu.org; Sat, 30 Dec 2017 17:57:21 -0500
Received: from heinz.dinsnail.net
	([2a01:238:43b4:3200:9392:5dcc:2f0e:a960]:47794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@dinsnail.net>)
	id 1eVQ46-0007nU-CZ; Sat, 30 Dec 2017 17:57:18 -0500
Received: from localhost (p5DD4EE12.dip0.t-ipconnect.de [93.212.238.18])
	by heinz.dinsnail.net (8.14.9/8.14.9) with ESMTP id vBUMueWC023797
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 30 Dec 2017 23:56:40 +0100
From: Michael Weiser <michael.weiser@gmx.de>
To: qemu-arm@nongnu.org
Date: Sat, 30 Dec 2017 23:56:22 +0100
Message-Id: <20171230225622.97409-1-michael.weiser@gmx.de>
X-Mailer: git-send-email 2.14.3 (Apple Git-98)
X-dinsnail-net-MailScanner-Information: Please contact the ISP for more
	information
X-dinsnail-net-MailScanner-ID: vBUMueWC023797
X-dinsnail-net-MailScanner: Found to be clean
X-dinsnail-net-MailScanner-SpamScore: ss
X-dinsnail-net-MailScanner-From: michael@dinsnail.net
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:238:43b4:3200:9392:5dcc:2f0e:a960
Subject: [Qemu-devel] [PATCH v2] target/arm: Fix stlxp for aarch64_be
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Weiser <michael.weiser@gmx.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wit/rrOWBJEl

ldxp loads two consecutive doublewords from memory regardless of CPU
endianness. On store, stlxp currently assumes to work with a 128bit
value and consequently switches order in big-endian mode. With this
change it packs the doublewords in reverse order in anticipation of the
128bit big-endian store operation interposing them so they end up in
memory in the right order. This makes it work for both MTTCG and !MTTCG.
It effectively implements the ARM ARM STLXP operation pseudo-code:

data = if BigEndian() then el1:el2 else el2:el1;

With this change an aarch64_be Linux 4.14.4 kernel succeeds to boot up
in system emulation mode.

Signed-off-by: Michael Weiser <michael.weiser@gmx.de>
---
 target/arm/helper-a64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

v2:
- make it work for MTTCG as well by catering to the 128bit expectation

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index b84ebcae6e..3adb88db6a 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -506,8 +506,10 @@ static uint64_t do_paired_cmpxchg64_be(CPUARMState *env, uint64_t addr,
     Int128 oldv, cmpv, newv;
     bool success;
 
-    cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    newv = int128_make128(new_lo, new_hi);
+    /* high and low need to be switched here because this is not actually a
+     * 128bit store but two doulbewords stored consecutively */
+    cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
+    newv = int128_make128(new_hi, new_lo);
 
     if (parallel) {
 #ifndef CONFIG_ATOMIC128
-- 
2.15.1

