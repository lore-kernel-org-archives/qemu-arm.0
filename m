Received: by 10.223.172.38 with SMTP id v35csp4137103wrc;
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
X-Received: by 10.55.12.133 with SMTP id 127mr20820476qkm.251.1505764306379;
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764306; cv=none;
        d=google.com; s=arc-20160816;
        b=S1DZ3LIoWAujHFNjiC5p0k9XWlbD+/2gqYA3OrEeJwX4wzdN+T7Y8XfhdhtPTo61ae
         VYplqJSRlYOui9ebcq6DiQ6/FBN904ecToe9uk69Am/zJ4WdEseZryaQVLDx1jFlQT4E
         n3tSMAg7DZNXp/3eluzhBw0Zfvy66cL+6rA0yEPJb5Ag3NG+/Anh+sLThFMTlXW27BmX
         3CEzr5zg/a5QvXwtjhKtsGViCciGHLVN+iBtRiualSOkY6hCJoNNK/jsZVG9kfECOmeD
         KdyniCreo5xFhCiMCJqe3uIDXD7SZrJyBZttrEFuXGwqGF4hfLAXyfbvm/uWRoHu+2cI
         a7iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fqyxREB/kyB4rLmYAfwHoD8/bcback+XMLXwJhswt3g=;
        b=vtwc8KS92Cw0PpX3gtUdTmKuVbRn9JyTDbBFjLGy9/QkVTBjlGftzak1WggK8ZHC2l
         0QkwlHBR9I4UCWiWHC+TV8B4ZFeWwzcB4GoStKQdTcwf8b/Ck17AGIc+NVsLcQ/bGiDm
         2/IdcCQPSh0U0p511qsxmfU3TWtOye0lfrXPmZpA1G+MBrpanZu8BBj/QbCv5qBlpi08
         jrS/M89IognhbxdWo2l7F+9YJKF40oBwI8OJHS0MFofYl6e8UFqX1GOTO/nIPzQrbGTI
         0ycxb3k1Y3F0zVpozdsVEfCaHt+PDSKFIIQYZILVT3GnrML54gXGcjqsYuVnELG5fJ/W
         BE7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XcViKd/i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n189si7596565qkc.112.2017.09.18.12.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XcViKd/i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du252-0006lH-1J
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24o-0006k2-TE
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24m-0006F0-Qq
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:30 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:38190)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24m-0006EG-LT; Mon, 18 Sep 2017 15:51:28 -0400
Received: by mail-pg0-x242.google.com with SMTP id m30so769240pgn.5;
	Mon, 18 Sep 2017 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fqyxREB/kyB4rLmYAfwHoD8/bcback+XMLXwJhswt3g=;
	b=XcViKd/ix2EM8U4XBY3NPtSSicRXCejfizUgbfEFhjK+53/fD609VCeuG5N5KQhNr2
	HfXJ02Yaa9eUk8piYrgWX0i+FbDlTSi7/pAs65bO0gYWRhIL0XPZQW/2TBOe5GtUXjb5
	+Dkei8H0j/hSgpplXky9ZWFZkxyF7FxXimBGwhUmrAPfUjJpvcqrZgGu3BRDrXOT4UQJ
	nZu4h/C47Hh7LSGHrjl7ZFBe9s4F98mE0FZe57IZA3Y3urvhUGtJO+OvIUKHvE0TV2Ms
	CD+K8Ei0MQmniSrLUIG0tXIgBLxmcQB78lVOK5RbV2mPmbqrijwAv1lTxObcR8g2Qzor
	YGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fqyxREB/kyB4rLmYAfwHoD8/bcback+XMLXwJhswt3g=;
	b=a33+2n7ReqvK12YICxff9QmdGXWarJOJLM5EzRbm1JnyszFE4ogM/TmVxVYrfbFiC5
	0rrqynC0rSkFMN+ZqsYoJmsk+YfgWs/VpKGWtwOlaV3S7MU/vVW6+QQDhbly2DfT3i16
	lTO2Lapa+x4DJ8aaWBl94DuyPN4imVxFSnx3WWTR5Qt1ppzf43hDuSjeazumIk0A60BA
	r2tLhQEOqqyXbE245aLEX8dTq5Uw/3onQfqaGrquofLSNk5D9yGe4rYf9dNgyGEooL2Y
	YyqGMnYqApwtPTsYpGubpwTxIdBhcD0C6zWLDM4rssadrSXKwRojyBsjnujpX9m5WPWe
	9EgQ==
X-Gm-Message-State: AHPjjUgBSsV2Ym/N0u7Ml7lw3gn63oCbTkggMRemIj3A0hH1AUFHBluf
	Q5zjstUpPQSye40gN0s=
X-Google-Smtp-Source: ADKCNb4qmc7gVXVS1qu693uWcLRpCSSs/4iax0kO7frxyEwN3OnGiEwviLwzCHQwb4bCnbgG99OquA==
X-Received: by 10.84.129.193 with SMTP id b59mr36843429plb.147.1505764286313; 
	Mon, 18 Sep 2017 12:51:26 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:25 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:45 -0700
Message-Id: <20170918195100.17593-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 02/17] imx_fec: Do not calculate FEC
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00xxy3y8lSmU

Save some computation time and avoid calculating CRC's frame

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 88b4b049d7..75822344fc 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1032,9 +1032,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     IMXENETBufDesc bd;
     uint32_t flags = 0;
     uint32_t addr;
-    uint32_t crc;
     uint32_t buf_addr;
-    uint8_t *crc_ptr;
     unsigned int buf_len;
     size_t size = len;
 
@@ -1048,8 +1046,6 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
 
     /* 4 bytes for the CRC.  */
     size += 4;
-    crc = cpu_to_be32(crc32(~0, buf, size));
-    crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncted.  */
     if (size > ENET_MAX_FRAME_SIZE) {
@@ -1090,9 +1086,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
         buf += buf_len;
         if (size < 4) {
+            const uint8_t zeros[4] = { 0 };
+
             dma_memory_write(&address_space_memory, buf_addr + buf_len,
-                             crc_ptr, 4 - size);
-            crc_ptr += 4 - size;
+                             zeros, 4 - size);
         }
         bd.flags &= ~ENET_BD_E;
         if (size == 0) {
-- 
2.13.5

