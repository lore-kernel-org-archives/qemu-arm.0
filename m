Received: by 10.223.161.27 with SMTP id o27csp230124wro;
        Mon, 23 Oct 2017 13:12:12 -0700 (PDT)
X-Received: by 10.129.179.129 with SMTP id r123mr1439168ywh.163.1508789532359;
        Mon, 23 Oct 2017 13:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789532; cv=none;
        d=google.com; s=arc-20160816;
        b=v1B0dunKtBbmtASrwLJt/zxcyfxqn91H/Jh1PVWZGJ82M8rBk33DkfGTCnRUFs9lEZ
         y/wxTaSqX9vQFKZ1+aGBehYGbGZ0bEgZTxdxjQ/RwVqaM7uOaAtfA8kiNUOpp++Qglr/
         knL08v84+N5kbVR+594/3LLJyrHbiy+WyZzJ7/1OqcO+B1vz6/DOPGSxmvrbufbSIhKk
         kATD60FzHleERjH8/C+Pf0Q/DO4W3T7wZWF1P6iCmydhEaHKXghuVLcNLWMn6vnOHnfD
         lPRs8PhlEPsGfwYxdGecGQsLZ5ZNvGz4D+acmwSLvz7RCvYDptTvLNWXcaStNfetBNhm
         uKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uYdPAHXlUYZEXoWG1xtc+4tWTdMDFGtaZFeA++rHdBk=;
        b=Jwgr85IMhfClXIss3/dALfcxVRLjaU50xhtF2JtSOsCUa0QwOCU2Dav6r+d6+wwMlH
         zRpNFY2M/iKg3QGC2dVp2B012a300OH2MpkLEEhqXV/9JHsREQ/8F7/cDu6AuXWEGbRz
         MbwZsGAY5Fs9iQ1hmO9Xg5WLKPukvfwcZi+DuM0zypgsD/RsAtPDF9Bx6wkaQknCYF2m
         ScAur/FIg93E9nm4aTwzoF70WI6SZUK0MePrc9SEme+oxAFmHoeHtgArGVM+QrMHAkpv
         bUPKWc/FMOdyLAEqe8kWq90Zw7yr4wCK3MmncUnGMEtTpf36QVghsfjpDEiYDZosaEmg
         O4Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsCWyZK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 187si414106ybg.231.2017.10.23.13.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsCWyZK9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j51-0000mP-OO
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:12:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4F-00009V-EI
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4E-0002TU-Fm
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:23 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:47826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4E-0002T7-AN; Mon, 23 Oct 2017 16:11:22 -0400
Received: by mail-pg0-x242.google.com with SMTP id r25so12629885pgn.4;
	Mon, 23 Oct 2017 13:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uYdPAHXlUYZEXoWG1xtc+4tWTdMDFGtaZFeA++rHdBk=;
	b=AsCWyZK9kDkRkGIM6e9zdlx6Ohaqlq/VEh6SKKDKYRJz0JhmuRoN9lzklg1A+qDJ36
	vr8v5zOdjcIUL+wiN9w+NpslkmXOv/LJlZUgZtNBqHsDvhSwQpz1fnueUGxAkvy8a968
	0Bb2s+Rl36Y+5kj4a1U04acuN12cwlFX8rNFbko7jeT13ARdPjYEGGdiH3eU9RPqbA3H
	PlUuAigS94SyIwVjBLDYHPma3SZ95nP5IPZQ+iXb08o2+hIlP1QYouiqw4mNH4ggN3Oj
	5gGDgqidcN+QuWxVsC2pJ+CqaOoybb0DtFH4/7VfjtF+9vKi17Lyaw3vyDmom3K01dD+
	kvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uYdPAHXlUYZEXoWG1xtc+4tWTdMDFGtaZFeA++rHdBk=;
	b=KssqgRcUTTnr+oYavVNmYP3nW2Adb0zeG8FA96TG/KQ597Nv+4VYrHWjxuVOBp4z+L
	jtdJTM9itMNrGkEZ/rW54eElGqpHaLifT5nkj859UoOSwvRlcAwkhD/UaXJ3lmIjjBQQ
	20vy8oSPvPbhQCXzGVYgSCIpxUJ6GC06h4//y5XRyqBN9+HdVtL+/lC8QuYQ0RDVGW1d
	ZXF9Ng0uOvMutbdeZf+KMZtZeDAY7Cg0xpHlyyD4QubicLL+F0AOQkjttBA46m1ANhqC
	K3N+LYqTZzZc+xtDHIRGrrt2MozSQ1qjgECgUR8tLIjR6ncoGox7+ShXGEUeW78oN8hi
	ivPA==
X-Gm-Message-State: AMCzsaWmqV0ssUH2eydl8/bYjHiegOZ3AVR99BRF3wTAOFoIu+m2QH8b
	L8pKF+2xQniyLyX7n2BJwS2MMM3l
X-Google-Smtp-Source: ABhQp+TfBmDG0lhlBxJsc3OPu9t2rWY0x7iAwOjh6CtS0fEyyc0PjfUJd2HAOHFrgezRoSpQzsDwLQ==
X-Received: by 10.99.97.139 with SMTP id v133mr12104183pgb.300.1508789481181; 
	Mon, 23 Oct 2017 13:11:21 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:20 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:34 -0700
Message-Id: <20171023201055.21973-7-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v2 06/27] imx_fec: Emulate SHIFT16 in ENETx_RACC
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
X-TUID: wbDSByBaDRid

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
index 18de508e8c..131e7fd734 100644
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
index 0fcc4f0c71..e482d1c13b 100644
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
2.13.5

