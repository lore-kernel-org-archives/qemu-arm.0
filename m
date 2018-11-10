Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp982736wrw;
        Sat, 10 Nov 2018 04:18:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5eQS2hZcw0BbDOeYpJ+28Rb8W2jRQIZg86q8OH2xc3/IyW1l+7DirbqBSA8zig7uFDxXyzm
X-Received: by 2002:ac8:555a:: with SMTP id o26-v6mr12193846qtr.298.1541852300832;
        Sat, 10 Nov 2018 04:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541852300; cv=none;
        d=google.com; s=arc-20160816;
        b=slVhUWJ4Iws7/qemsLV5UxFi5KGq/Hm3biW2eJg4a/LRMCmeGJbMxHK8HRF9GVnaBm
         /lG7neOVh1eBRBEzFvvVJsbN9cKhJlAeLjFbtfhy3GAyhqWLAz7p8JbR9+Ci8ZEDKjg9
         Vi7lPY2YsKVa5CkoZuOBZRsIOpNUjvwB+xk7QXdAy2og9zzH8OMsNjchleCydJdmdr4y
         Uoe5Xtsl/Bex8dA5869pNpzxisGO1o0g2bVKlZC0+g2Zpl6QwueuP9FM52bt4PDOsMMP
         9oVr5knxybCpH0TjdIQx7VUZ9dn3l8GWYgHWMjI7LgLH39c+7IHyb+S2YZ2W/iUiVsD8
         DeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=B48D4kOsfnmAh37pMAswdqhut0UjZT0xdqajHGi8fDE=;
        b=g34I+UP66jMt7830CPx+iGeb/xnBTCR7ZmMw57uWGOZHfaONYygJ/35TMrARW2Bh7G
         yH+hjkvDMyW+43KzGxGX0ICbkQgY4xcdI96IAUdWz7H7q6s+WJhl7KJzximTCpBbULBY
         XJg6Aq5bvDnVlymKYdUNKOea0JzJhOulLWagohaBh0XgC7BAD2XXLo4NqPhA/bRJDuqj
         FieqXlR+pz3W8ya+GGz81y0lwCj/M+6UpapcfHHR6YAeElatSciW4OPn+JH/EUDtETLJ
         HWPHQTETd1cA80ayHU/YkEocGUChCPGTUokooNPWbtf21BinC5yL/UPKDqoI6HvJ5nC1
         nwFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T/KWhgZF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t27si1857120qtb.192.2018.11.10.04.18.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 04:18:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T/KWhgZF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLSDU-0008BA-8O
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 07:18:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gLSDL-00082x-OJ
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 07:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gLSDG-00026F-19
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 07:18:11 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gLSDE-0001t1-BD
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 07:18:05 -0500
Received: by mail-wr1-x442.google.com with SMTP id b13so4522791wrx.6
	for <qemu-arm@nongnu.org>; Sat, 10 Nov 2018 04:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=B48D4kOsfnmAh37pMAswdqhut0UjZT0xdqajHGi8fDE=;
	b=T/KWhgZFYczn1Dr9SvifWWCOh/+6NbbVFUNyh+HSqScTlynogPfOWcXBO9qcSnK1xj
	ZLP+N71zahq+jRd3gpa7wX+qJSfHVG5tk91AbCTGDN4r4QHGbRSnnDY6+WB3pXAGhw0S
	+RPXWBdWzSJ+5Kp7MzaDvsyXGcv+huFYlfuxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B48D4kOsfnmAh37pMAswdqhut0UjZT0xdqajHGi8fDE=;
	b=Sn9Gv6QPoNzzsGRP0RRbNZ2jm1deGEvSjB9KIPrGE6Lc++eVSGz/HmljBi3hY9m80G
	NC0AR4q/T93AlMWNKrnJZIPNE/Dl23ynOT+JdUjxFWXhrMKoz4vuT9K11Op2WCd8HWoA
	NgqsIO1kVixHHTp4/wjwLBTQzCueDfUQ39v2tkAgNbHDe/GW8gf2Q8G+5cI3tIMIeHYc
	tbI0V8dfDv4mdw5wVdTcFC/sMViMe8tVeAIOkFgJfXVDjJsRh39lPeKrLQ/Xx5XEgTaE
	6bw+0xyWZ1XOzfZAGyzB+m9IaCxqCXEB+ZTl0rwQc8IZXiUq02cdCHWn4BSHYeTtNmpr
	EHDw==
X-Gm-Message-State: AGRZ1gItgOKSpSLL2XaT180GdohcrVGoByoetp26bp+hl88rSsdqeo2z
	9dUUQ9zdrS+r0Y7UuKf8VC/VTw==
X-Received: by 2002:adf:f712:: with SMTP id
	r18-v6mr12671026wrp.166.1541852281962; 
	Sat, 10 Nov 2018 04:18:01 -0800 (PST)
Received: from cloudburst.twiddle.net
	(201.red-2-142-29.dynamicip.rima-tde.net. [2.142.29.201])
	by smtp.gmail.com with ESMTPSA id
	r19-v6sm3609875wmh.0.2018.11.10.04.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Nov 2018 04:18:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 13:17:11 +0100
Message-Id: <20181110121711.15257-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH for-3.1] target/arm: Fix typo in
 tlbi_aa64_vmalle1_write
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
X-TUID: XzMruB1lozkJ

This would cause an infinite recursion or loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96301930cc..a327988c66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3155,7 +3155,7 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     CPUState *cs = ENV_GET_CPU(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbi_aa64_vmalle1_write(env, NULL, value);
+        tlbi_aa64_vmalle1is_write(env, NULL, value);
         return;
     }
 
-- 
2.17.2

