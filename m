Received: by 10.223.159.74 with SMTP id f10csp3056064wrg;
        Mon, 11 Dec 2017 13:34:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBovCz8H9aS9pQaDisj4ji9+D0fe5J8acO6VNTiJRl9A0mY1b2fb+kVD425M4yOKdOrNfH8Ko
X-Received: by 10.13.241.135 with SMTP id a129mr1380634ywf.269.1513028094022;
        Mon, 11 Dec 2017 13:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028094; cv=none;
        d=google.com; s=arc-20160816;
        b=zIf7M8v+BfYRULkUdUmSQFwLfs79adi5eDSmEXi4Qcydre3QhLMyc4nWuCDzwxSfOU
         KdvEvSGf6hZ0azy9ITvNP8Tz0l5GoR9ObLZOtuSqeQj4rs+4ghcp0N0mXk/T11JGbL2h
         Vl6+K5ztOtiZxrwk9LQlJJtELmnk9aW33xqQGTnqqQW0wp4DYCJDRHgvDQKSbWLjk4SF
         xy1cqVryQ4WAaY9BNH8kqfILe82M6ysUgFTG1cSQH7RTsCx13H7YsRN2w5PT5rMsNsJg
         /vgi9nnMYxDttA86I182fj8IltXc/vsgJQlpE2S6R6z3HNlQsSyyk/Mc35axLTQMZ7RR
         +fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
        b=tvFQhWLndmR54oUBTYZbyVcCjtrv04SEDTYbQxwr4Mpsha7UP3eJXumqwsIVFKQ2SI
         Tqfc8ZSSWgcMUHo7dz9Z1J/+BEJof+jSYVIEEyd8KqbRpHTNOpntkkG0mzLPpXOf88B2
         IX4pByjFdJfpxAH/P6FZdqnjxUiQSHHttKocXoY+Q1t1diVTJx7eTNJppoOlC2C2h4Yj
         TxJoyeN4vI0smBNa1mQcXGSFO9E7ApijbpkOstlwGDrr6299M+RhaM5kh+962Y16f12D
         NjNaVR4/do5RXMKmOmGiJ+OTlK+6OncJmywZpzLJ+9D7MOxoVcfj7uMqEFJRoT0VgGEP
         aUVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MBXbYmB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t195si3118653ywg.596.2017.12.11.13.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:34:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MBXbYmB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOViv-0004PS-C4
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:34:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf7-0000jr-TH
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf6-0004B1-Ky
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:30:57 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:42787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf6-00048u-FR; Mon, 11 Dec 2017 16:30:56 -0500
Received: by mail-pf0-x241.google.com with SMTP id d23so12532175pfe.9;
	Mon, 11 Dec 2017 13:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=MBXbYmB2pfKASG2jZrIOeB4DG8GKRpvbZTi51fpzPemSzeHcolYbn3h8HkwqEbnhi4
	RPNW5c0Vhv9mMDLXSXqNN0EwiZ2QvFN5XN2EYOtAmEmK5UuIwozmgsIsaOvytRga3KMX
	BN1bjgRbk/7VBvmNrm5c0NHuFvyAjmIKhBi2vDaM4lP1bQDuaxpvNCvJX65cQW3Yoddn
	vOZcIyZZHY6WLwR0I6TeP9VV3RDZa3/gTWciLj2H7718KDWxQXGTpmlqg/ufQGI209O7
	bhzrmF2HOgTC+GyZ6Bf39M0b+G08jod4UcQ7Gf5iIQ1AdZwC+DNF9MIySfucY1pubtHt
	BcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E08NgLB+iZxe+FQ8+m6OK1RQdn04+8BR1I1ixtM1hXU=;
	b=KdP/HB59QEEoEdGwZj9HMybjOMWoU5DoxWLCCNO0rr1IiV39eXQ97JQtRppx22e0LD
	O81Svmh89YePe0VHT+c8dw8gYkojv/BnC5pn4fShkVi98tYdauETugmJ5TKe5kJUZ0W+
	lew6YbiznLYulGGO+XQtvBG1uoHAE3AWBuVPwLZzpPGJPmPgckceF+bBc71zib8pi083
	Qvt8xdA4VpYevvUvulPCOFgAPA4F8Gpw3Yc5ieEdyv0WV9H0AzEcyjsbOMPSj1HJegKJ
	jtoS6PLhSyF9g5gZ22tEU85z31KebNps0G0S20pgcZFjyU/wHO1sT8U8vn1QBkxTwEvu
	OrHg==
X-Gm-Message-State: AKGB3mL6UEm2ZveKS+PsdoS7bN/UwRcYhxZj2bS4MagvYwPEo4+QNpQE
	/bgRtVEiPt2FtUNSy3OwX/cybOLe
X-Received: by 10.159.253.144 with SMTP id q16mr1714601pls.104.1513027855146; 
	Mon, 11 Dec 2017 13:30:55 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:54 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:01 -0800
Message-Id: <20171211213007.7353-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH 07/13] imx_fec: Emulate SHIFT16 in ENETx_RACC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K4IIM28TfPpz

Needed to support latest Linux kernel driver which relies on that
functionality.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 23 +++++++++++++++++++++++
 include/hw/net/imx_fec.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6feda18742..825c879a28 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1037,6 +1037,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     uint8_t *crc_ptr;
     unsigned int buf_len;
     size_t size = len;
+    bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
 
     FEC_PRINTF("len %d\n", (int)size);
 
@@ -1051,6 +1052,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc = cpu_to_be32(crc32(~0, buf, size));
     crc_ptr = (uint8_t *) &crc;
 
+    if (shift16) {
+        size += 2;
+    }
+
     /* Huge frames are truncted.  */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
@@ -1087,6 +1092,24 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
             buf_len += size - 4;
         }
         buf_addr = bd.data;
+
+        if (shift16) {
+            /*
+             * If SHIFT16 bit of ENETx_RACC register is set we need to
+             * align the payload to 4-byte boundary.
+             */
+            const uint8_t zeros[2] = { 0 };
+
+            dma_memory_write(&address_space_memory, buf_addr,
+                             zeros, sizeof(zeros));
+
+            buf_addr += sizeof(zeros);
+            buf_len  -= sizeof(zeros);
+
+            /* We only do this once per Ethernet frame */
+            shift16 = false;
+        }
+
         dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
         buf += buf_len;
         if (size < 4) {
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index a390d704a6..af0840a0fa 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -170,6 +170,8 @@
 #define ENET_TWFR_TFWR_LENGTH  (6)
 #define ENET_TWFR_STRFWD       (1 << 8)
 
+#define ENET_RACC_SHIFT16      BIT(7)
+
 /* Buffer Descriptor.  */
 typedef struct {
     uint16_t length;
-- 
2.14.3

