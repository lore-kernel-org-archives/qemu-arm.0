Received: by 10.25.44.15 with SMTP id s15csp807544lfs;
        Fri, 7 Jul 2017 19:53:18 -0700 (PDT)
X-Received: by 10.200.38.244 with SMTP id 49mr60495136qtp.236.1499482398039;
        Fri, 07 Jul 2017 19:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499482398; cv=none;
        d=google.com; s=arc-20160816;
        b=WIqCiyNIBcFeP3S/kcJDsCnGePxL7yEo58Pfkh5hMxEkfkMrFkfv5efwZ5+ibtfjJI
         m/QDNTHT43usm3GFvOCokgrDhP5eiZaXoKswjOOvP2GemUMtQpDDnAHVtVKhQFnxeV6J
         35CMqNrb63XYvlCRwOa1j/9+ADi2Eh0kR4VVtGfofMf6eJ3T2rOGDYx6gtpYtlSC0CpW
         ii3SVSVLMTyj4jUV0ODPin2xgkj1TxmUv5UdnLGn/6xh7o524osdDm9c15W5WWloK7i6
         Fwtyj8XpJT7/dVCwFy85eLgl/EZVxulD6MEYq0CRga5Vg9qYIpURxpdnkSy+twv6ffGC
         zJbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=x0B4mLaLsw+VQCgKtBesMCfDp7aZy9g1E3kvsYp90rQ=;
        b=Fa/0+KA4BASfkklyaLNBfpFzwGOVLlP7aStQONz+aBDhPnaHwZpGrd1t/dBNSpZYII
         7ARD5WXD/pLJjvg/eVv5tvc5nAJIgkYsMTD7GcQe7NKoQInLgxQXOaGyYpX0vuy76paP
         zjfw8ZLB2bTnyOYXV9PIv4blneA+kPtWvoy+vdwcGYWRbwJEJ7LtlhG24ePMnDX7PjTT
         DRYKl1V1/5ihU5CEGzJL5nLBayucoZv/VmpoPC3xh6dkmRjfpECU6Dejua3tBid8/c/e
         lIiCOpm80OEtOoi+dUd1CpulYzHAlffQgILYUQEJDXXsjYNloB5qZy4dghHsP0D2osqo
         vwSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=VY2W6oFu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s35si5016751qtd.218.2017.07.07.19.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 19:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=VY2W6oFu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTfrv-0003BB-BG
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 22:53:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpq-0001cU-F1
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpp-00055f-NS
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:51:06 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dTfpm-000531-Fq; Fri, 07 Jul 2017 22:51:02 -0400
Received: by mail-qt0-x243.google.com with SMTP id m54so6452869qtb.1;
	Fri, 07 Jul 2017 19:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x0B4mLaLsw+VQCgKtBesMCfDp7aZy9g1E3kvsYp90rQ=;
	b=VY2W6oFufWceuAYVeuns0aUvdvku568ir8jnmctnVPp7VIIc5XiLr/KZCg5jy7iheJ
	ctyR68TbBD3DOyBUSk+l7Sh2OIaDZnwd1zMz2qDcr5FlbkbfpVZxm+35GYuAd1LV7Edv
	h/GKghjPmMATAM0QI0jEKjHWCcD9iytNfLL6IVAJI5FPA+Qfy2uWkX+fS3bYtBqnp0J2
	jqk3qUYI6X6So7mOloiuvomrwZl72Raz424ZmhdmaT6N8DtJRQ3Osbg66GPynt5Zw8Na
	8FfgRnc60PeiFAy2GjUNF6f09AU51/xBqXJjTeXZv4/tEIDvdWAYbgzrDfoHfJD34UHp
	65gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=x0B4mLaLsw+VQCgKtBesMCfDp7aZy9g1E3kvsYp90rQ=;
	b=nucCpGcnk07aTECFuOmes2LOHteqPlXt2AvZfu2lXQdRujDcoZHYTeF+fUiPuyYzx7
	XRNiNYLw+4N3GVmy4uM6bSG1CONQDLRTmEUOvcDjgPxbsemug7oQqI10xJZI/z/UGLjc
	PB19pnUAnAmVK36aApW21l+yoA+Qy8QRercuCsohRV6mLOq7GSefDx7xYHRz5o0N/XOi
	4c/Ynd/SBqGUgX9aTlDIQK2m47F5ep0YmnNB0NZks6pcxk9diJTMzenZqOXZYdW9fPWa
	kBWSHJ2c18h+8o6fMhGXOw8SR3oCZa+jFfq3HtxpDw+fsLN8V+NE7+vrot6Jjmi4yL8a
	VlYg==
X-Gm-Message-State: AKS2vOzpVbd5T1TAcNAWKt8AciFXZEKpEAM1Nw2vE6Ta4KGDnxAW4XCp
	ENJ2xCxDAkseEEQkJWA=
X-Received: by 10.200.50.249 with SMTP id a54mr69633899qtb.91.1499482261748;
	Fri, 07 Jul 2017 19:51:01 -0700 (PDT)
Received: from bigtime.twiddle.net.com (rrcs-66-91-136-156.west.biz.rr.com.
	[66.91.136.156]) by smtp.gmail.com with ESMTPSA id
	q90sm3793925qki.11.2017.07.07.19.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 19:51:01 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jul 2017 16:50:30 -1000
Message-Id: <20170708025030.15845-4-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170708025030.15845-1-rth@twiddle.net>
References: <20170708025030.15845-1-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH 3/3] linux-user/sh4: Reduce
 TARGET_VIRT_ADDR_SPACE_BITS to 31
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
Cc: aurelien@aurel32.net, riku.voipio@iki.fi, laurent@vivier.eu,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CilEjjEuHMmE

The real kernel has TASK_SIZE as 0x7c000000, due to quirks with
a couple of SH parts.  But nominally user-space is limited to 2GB.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/sh4/cpu.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index e3abb6a..3121d1e 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -45,7 +45,11 @@
 #define TARGET_PAGE_BITS 12	/* 4k XXXXX */
 
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#ifdef CONFIG_USER_ONLY
+# define TARGET_VIRT_ADDR_SPACE_BITS 31
+#else
+# define TARGET_VIRT_ADDR_SPACE_BITS 32
+#endif
 
 #define SR_MD 30
 #define SR_RB 29
-- 
2.9.4

