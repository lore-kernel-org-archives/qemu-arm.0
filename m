Received: by 10.28.71.27 with SMTP id u27csp869692wma;
        Fri, 19 Jan 2018 07:26:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBosIJHaOsn5v7T1jk+NAZRkxxBnbg7RvCrQBuspPHbshFSk6F1wwtYkRFCo8UozQITyaz2pM
X-Received: by 10.13.250.3 with SMTP id k3mr9820380ywf.21.1516375606842;
        Fri, 19 Jan 2018 07:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375606; cv=none;
        d=google.com; s=arc-20160816;
        b=Ms7sUHJJKjga+AZMuU59ybFvCU71cHgWhfxzytNzlndBqRMxFl/l+6qFlZ+HZDPpQA
         oE7bQylfDbIp7uN3KSKnndvyxc255ia/M029R4k5fF/qnz+HL25fcexChdKTYTbb1H4W
         N2FKX34kvwMMb0hiAhm2JDcgVykTlnTiEzlSF0giBVv6C5hv5aJFBFVdhhmtejx471Po
         d1fx5Bsh5AINLx2McNiBOIlBnW/JxEOmlKzyb9Py+ypZ4MfwoNX7tPhZOli1gDOP5ard
         MdbfKOf0NPqyzY6pVyKEKkDdbhNED4DrzfXJA8qAWs24g9ypFlIGs+7oGDjkUjp/vGbY
         zWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=/1yy+PZp83/D6IQzU9CswALrOhM370SmjN4JsrvP2T8=;
        b=jsMHBFnnU0J1gnhmTXF3QjsfGo9pSS0VVTIGCgdw73qI4anf9VXASgb+rV8/sdM1ns
         TyKqe+O0gBDNWWy7Nyftnv13FRisWc7wXwCxY70wu1tnmTDez43B/rUlGFkqHPZ3QfYI
         F7ietz8+Zxv899BrkE4f6V4qu20+tRhHkHjYIpbSiC9csY8pSo3wXlOOyxiPGXlcrqss
         JiYiQgBlfjA3toOPJvVmaPmZT6U1oqKuqM6UkQdiOHfWj9WujK5f02TxiL4AfrYKXbmk
         5vaFpsKiZwQPjrnjH3aRVz53V1kS87tn5n/7gmin+Csc25iEooR3qhXSWg59LGG6IpkF
         shMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7a9JZIa8;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tSpuIPYz;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tSpuIPYz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k131si2229614ywb.646.2018.01.19.07.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7a9JZIa8;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tSpuIPYz;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=tSpuIPYz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=greensocs.com
Received: from localhost ([::1]:55400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYZ4-0001km-Af
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:26:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7U-0002n0-73
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ecY7Q-0003jd-AZ
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:58:16 -0500
Received: from greensocs.com ([193.104.36.180]:39271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ecY7Q-0003iJ-07; Fri, 19 Jan 2018 09:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E0338319FD9;
	Fri, 19 Jan 2018 15:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373882;
	bh=v+8I3H1qOqPd2WU9LWyfosRG0vDqmGje0yEI+Fsyyg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7a9JZIa8ayVlAqcYbgJU2tVEH293HQOLYeKYyg27d+BCLrnx6BNDo+r8gI3MMllf6
	Zoml2ETjJYhlFvW9Rc2PRzTWtldiF4/hZDBRr1x5JAqQf9ll+CLzDUnIpvpZ1U/ne4
	Lc2I1w6ObaXPySbcxY7yCydUd1yH6+mK6OZp7qo8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tSpuIPYz;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=tSpuIPYz
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFFmqKY4nc5C; Fri, 19 Jan 2018 15:58:01 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 56E995E2F8; Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=v+8I3H1qOqPd2WU9LWyfosRG0vDqmGje0yEI+Fsyyg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tSpuIPYzP4aWXyPfcXrerPQtWwfMfEF6crRt9Ie1vgtOjTwhNkM6RUdZrG0RfovLk
	w85GBNHGTpBfRWm2KJLmRpE47vDM2hP/6mwx6wvG7t6uIUhayVSEqSp3Tg3/Hvw06R
	C3zkx9LxvbwXlgGiLVcaknbVieDAevb08YgIyews=
Received: from michell-laptop.hive.antfield.fr (tima-dhcp-h14.imag.fr
	[147.171.132.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 109C9319FC8;
	Fri, 19 Jan 2018 15:58:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1516373880;
	bh=v+8I3H1qOqPd2WU9LWyfosRG0vDqmGje0yEI+Fsyyg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tSpuIPYzP4aWXyPfcXrerPQtWwfMfEF6crRt9Ie1vgtOjTwhNkM6RUdZrG0RfovLk
	w85GBNHGTpBfRWm2KJLmRpE47vDM2hP/6mwx6wvG7t6uIUhayVSEqSp3Tg3/Hvw06R
	C3zkx9LxvbwXlgGiLVcaknbVieDAevb08YgIyews=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Jan 2018 15:57:54 +0100
Message-Id: <20180119145756.7629-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20180119145756.7629-1-luc.michel@greensocs.com>
References: <20180119145756.7629-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
X-Mailman-Approved-At: Fri, 19 Jan 2018 10:23:16 -0500
Subject: [Qemu-arm] [PATCH 2/4] hw/intc/arm_gic: Fix C_RPR value on idle
 priority
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S4pWpB71HchX

From: Luc MICHEL <luc.michel@git.antfield.fr>

When there is no active interrupts in the GIC, a read to the C_RPR
register should return the value of the "Idle priority", which is either
the maximum value an IRQ priority field can be set to, or 0xff.

Since the QEMU GIC model implements all the 8 priority bits, the Idle
priority is 0xff.

Internally, when there is no active interrupt, the running priority
value is 0x100. The gic_get_running_priority function returns an uint8_t
and thus, truncate this value to 0x00 when returning it. This is wrong since
a value of 0x00 correspond to the maximum possible priority.

This commit fixes the returned value when the internal value is 0x100.

Note that it is correct for the Non-Secure view to return 0xff even
though from the NS world point of view, only 7 priority bits are
implemented. The specification states that the Idle priority can be 0xff
even when not all the 8 priority bits are implemented. This has been
verified against a real GICv2 hardware on a Xilinx ZynqMP based board.

Regarding the ARM11MPCore version of the GIC, the specification is not
clear on that point, so this commit does not alter its behavior.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 hw/intc/arm_gic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index dad383ea12..713de3084f 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -504,6 +504,11 @@ static void gic_set_cpu_control(GICState *s, int cpu, uint32_t value,
 
 static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
 {
+    if ((s->revision != REV_11MPCORE) && (s->running_priority[cpu] > 0xff)) {
+        /* Idle priority */
+        return 0xff;
+    }
+
     if (s->security_extn && !attrs.secure) {
         if (s->running_priority[cpu] & 0x80) {
             /* Running priority in upper half of range: return the Non-secure
-- 
2.16.0

