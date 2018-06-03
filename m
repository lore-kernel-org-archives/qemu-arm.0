Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2136974wre;
        Sat, 2 Jun 2018 17:09:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKVOwOvkKktLgZCTxinawoBuknWSKicbjraaFXp7mGcaw/nm3LOIDMNpiX/9BKtCiO2hQuW
X-Received: by 2002:aed:3ce8:: with SMTP id e37-v6mr15984863qtf.295.1527984540640;
        Sat, 02 Jun 2018 17:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984540; cv=none;
        d=google.com; s=arc-20160816;
        b=WlOx1CiK7ewvTewKUCdKpcKeWE21few2jLjxrrcefNnmKF7Jr1HIyzRaZnoLXlSjib
         ax5uByMIOZkEgWVglT6jlxYaDBBWiSGFSbqVaxWiJK7jHr3/7ddFFEKvnA4Wv9rP+4Xh
         1aVuReU2tgmmN1MFFAuJzIRlst5Tm+okas5JQXmFS4jXpX3QPD4IkC8IPc1DSovPcFPc
         MNVBByH4Bx4oeyvQ/3Y6M+vnGrjGbek2sUYm+Y1bR2T1h6mlkXh4AB9Bk5MItcX0yTlv
         IlqHZCo/+TaLhGKTXhn7aMRMH9qFEcLE3WINtyS7sBoM7oyBsrUhV1RKM7KdhqHB+YYI
         f1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Kfb3Zgxde4K04GDGwPruMPMUzW7ywonlxLgymJq+28w=;
        b=MwvDlxvT5oDC9TNPUUsC8CMJurF2ifp7uX1Qju1WMeyB2Wi3BQ3OERH49SMCDv3eB/
         voKF20IHPH5bV10A0G7Q6buEEsctvs0KZdpvA2I8C8ra9btcpyA1SNc3/IpE3mFdCu3b
         HFgSv2QrVAu5uHdiA7ZpiUbLOc0T5g6P9vHK+Y3B6oN93SYIVHI63lZ9j+iiRuknIVAo
         vHfoA9SHnQlzb+kjwItY5kg0XL6swSl2nLX20MRm/NGji0E2HeEpkxauWFu0TZP6W8vH
         l9AnYIrnV1dptUd+k3ls90dc+Vj1yQljkJ0OFe/o5XPvQM0U8IEavte7If8WJe3+V7gy
         ILUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j7A33qYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r51-v6si8513839qvr.205.2018.06.02.17.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j7A33qYC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGZw-0003sn-3C
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:09:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZi-0003rr-5J
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZh-0002uf-5Z
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:46 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZf-0002th-4A; Sat, 02 Jun 2018 20:08:43 -0400
Received: by mail-qk0-x242.google.com with SMTP id k86-v6so22643674qkh.13;
	Sat, 02 Jun 2018 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Kfb3Zgxde4K04GDGwPruMPMUzW7ywonlxLgymJq+28w=;
	b=j7A33qYCntLxv7I4151KpWX6l/dP9xS9460anu+HpXPyZFdc8DpK3EOdK/aUjyrguF
	87wXp/BQFv8YGLcqRn9a5YDXkiGyDS70TdoU8KX80AcCNyE7v4DjebWM2fM2id1bsz2+
	JTh+ZJufx0Vq9Oe2svdDfnHKafgvS3weFK0Br1LvpUmtVTZpv2BTmnxBP8kBWd1x+hSs
	gUnPI6Auyx06CsS5FYHOYTO/wTUbqYX6f6ob16sfAksliec8uJzZozMaeQULg8wBP3KT
	RKgK4b3DN29UIkW3AGVumSXvejQInwx03TsCphm5W3CVlAYb3VVCi+RJSIth0TvZGYR3
	4lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Kfb3Zgxde4K04GDGwPruMPMUzW7ywonlxLgymJq+28w=;
	b=gb7QXY+lDUWRcVFXRg4UQ0fystpVhK3ypHGvzIlti9kJ8iVHGvUm3YrhUh+2c89T+L
	S1N1M5C4/KP8Z3GapxanbQXqoCjTAHYzS762CJCrgvasfIrqk35CkIOnKV5xlgi5lxje
	5fl/4+IJhy1t1QCdBpANYC8Sk/Hnx8hyFXQA43ha6EbrMXqJTJgfdUsqLhKC5shyh5v+
	t2sljgHU5bTKAsfw0gtocD9YX0U+oI0vHs7MeiUZ/WPCaeIqQs5GEyvCAqicudtwyeSc
	eyzjFdavHYvASMxJN/nCeqgOZ3+CU3GQ9cTgHuDKawFtjRo1IAxU48uC7q/zSxkBUSJi
	lFSQ==
X-Gm-Message-State: APt69E0PfQjsx3XcOb3x8PE+qjqbqlzllNouPw63yqg5hgIpznFChqSf
	/Qcx0bDYvhF1v4phdh0jG/0=
X-Received: by 2002:a37:1624:: with SMTP id
	g36-v6mr14241620qkh.327.1527984522674; 
	Sat, 02 Jun 2018 17:08:42 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:21 -0300
Message-Id: <20180603000827.30872-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH 2/8] sdcard: Allow commands valid in SPI mode
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vaY/Zvd+oN2

From the "Physical Layer Simplified Specification Version 1.10"
  Chapter 7.3 "SPI Mode Transaction Packets"
    Table 57: "Commands and arguments"

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e1218d1fb6..80e70dd93e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -960,8 +960,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
 
     case 6:	/* CMD6:   SWITCH_FUNCTION */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->mode) {
         case sd_data_transfer_mode:
             sd_function_switch(sd, req.arg);
@@ -1190,9 +1188,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1217,9 +1212,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1259,9 +1251,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 27:	/* CMD27:  PROGRAM_CSD */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1371,9 +1360,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Lock card commands (Class 7) */
     case 42:	/* CMD42:  LOCK_UNLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
-- 
2.17.1

