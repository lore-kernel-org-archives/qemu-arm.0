Received: by 10.28.71.27 with SMTP id u27csp44459wma;
        Mon, 19 Feb 2018 07:20:45 -0800 (PST)
X-Google-Smtp-Source: AH8x227oRPsS9ykXNeu9Wv16iiRfe34ZDtKx+ndfhl3GkZjro47I8HdCRdEdbciHzJ5Y5dfHnUEv
X-Received: by 10.13.212.214 with SMTP id w205mr3646986ywd.231.1519053645402;
        Mon, 19 Feb 2018 07:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053645; cv=none;
        d=google.com; s=arc-20160816;
        b=X6RM1oSXitPLSDqm/hTqsv/k0RYVzc+whGeuihzxWOHfiARKpIEVat0+yUmh1+NCuc
         r9jcnhxkm8FA3iRAuoFmVBhVMbafrCNshPHN2atc2/i8y42eEnYx+iutYvJYZ3jcsnth
         U4gWKP1ShbBlKA28xI2d4bvlmGfolaEwRn2CTtFr9DJ3xS0DQXjN3lRG0g4UtFFXYVka
         FZWyYpxy72DEXk78AFLkoemkxR0WyQjEp4TmZZimH8awqc5CZp8GCLlhqrkWjU8KlBzs
         voPHfL8FQ4hvBEzp3p0I1S8BZj8Y95DN0EMf4QxN61c4Y2QBcx91OwiFpN5BkY5crO+0
         whiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=WLty3MdEjt/HHkvtV23r1UdhxiVMkXWYQTxzyYM+EZo=;
        b=j1rI982OTUHlsMFfnjie5nVZBeiH4F58DsVYGttoqsoy0iysmg1kllqZyixLHISNlu
         267AT78Rtwq5AxqqqRGBoEO7ddj1Q2GQFM8SJ/FOi6/4aRUfKDHWIUkjYuumvkoUHB2t
         ZpvDc8Mv+cTNxVxbTmxysuaD3/dplXSS2WgjFAuY/jZzNvv5xI3xhg02nctCqFQv/ycV
         retT2Yv7qmhmZWjodltSO81woruVv72EGeEaVVOflV+XJbpqUhuoaqGI9nVsIhP1aJYr
         1bfasYXrW9T38iUAF/63v3GysiDQiVur3JVJ14KxIiBmCKb1nTpgalGQct1BcMiz5Is7
         Gezg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X/cliwqI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p76si907998yba.333.2018.02.19.07.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X/cliwqI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennFE-00039Y-S2
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:20:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEp-00038q-E6
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEo-0008Up-F6
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:19 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ennEk-0008SC-9F; Mon, 19 Feb 2018 10:20:14 -0500
Received: by mail-ot0-x243.google.com with SMTP id b15so2796813otf.3;
	Mon, 19 Feb 2018 07:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WLty3MdEjt/HHkvtV23r1UdhxiVMkXWYQTxzyYM+EZo=;
	b=X/cliwqI3zhuUSCptLwPE3GNWbUVHvAGy8dKH8vIe2lQp45rz4DQf2r2G7ksARGmc3
	ljNShhR2rnfViUMpDrbbqq6zi+v+Nk1u2RoRQI8tcrhaQ/Na9oqcPwSfKvQYQStIuax2
	6MhJKw1gC90CN0VD3XsixQXqG/11QIJtUzdrEkc9qH+sda6sGxpHW9VY7RUVVddCTG6J
	1HP0PAImHkeKqMXqVscMkAvy5KeA9++Esu3v0qLJwDa/1o/lfAldtIWFmLTcwwxY8E1g
	/jE9npYPzbkWIIr6AKhrPvTcA9tcMKGnALx7k54GMS8FyoJeYwb0U/is1XWDxU1k4xBX
	UW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=WLty3MdEjt/HHkvtV23r1UdhxiVMkXWYQTxzyYM+EZo=;
	b=RbZ3vhcARIU/vA/zmqUNFydUe2WmGFvOQ1kwQ2wh24G6ke300XXpFRawWOwAbfijQ9
	rcSqZnjR1r3fIaCTDzGo/KnqqwezBleSAgkScy6Piw5KqczIRHsmva12D78CchRjyy4+
	ck783o5bO9wcz075x5BPdtrsHyWIZr2+/hmVCvWs8hM1LPXC5hSJxMEqfOc0XigRdmdb
	3gM722G/jESxEv0G2+BDN/JCXSdF4rAdTWsRtMH65mQeZQx1tFc8htGv+Zu/rqiTQLtQ
	0Urhs2U0m6NuYHWo5UJ7TtculXk/lLW+uvPLyL+Nw4Z9xAzEzQoCC+IhR8odASbZRrEL
	Pybg==
X-Gm-Message-State: APf1xPDsUMuMGGp3uC9I/xj6lCev98V29Ck1d+wjdJZTJzB9Y7OlKMoH
	yjKAuwIkDqjhVhalSxeWyA==
X-Received: by 10.157.0.220 with SMTP id 28mr3875otk.201.1519053613517;
	Mon, 19 Feb 2018 07:20:13 -0800 (PST)
Received: from serve.minyard.net ([47.184.168.85])
	by smtp.gmail.com with ESMTPSA id
	s101sm12900305ota.27.2018.02.19.07.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 07:20:11 -0800 (PST)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPA id 2133AB5D;
	Mon, 19 Feb 2018 09:20:10 -0600 (CST)
Received: by t430.minyard.net (Postfix, from userid 1000)
	id F1696300081; Mon, 19 Feb 2018 09:20:08 -0600 (CST)
From: minyard@acm.org
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 19 Feb 2018 09:20:05 -0600
Message-Id: <1519053606-9817-2-git-send-email-minyard@acm.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519053606-9817-1-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: [Qemu-devel] [PATCH 1/2] i2c: Fix some brace style issues
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sbifakXTLDQa

From: Corey Minyard <cminyard@mvista.com>

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 hw/i2c/core.c        | 3 +--
 include/hw/i2c/i2c.h | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 59068f1..9a54b61 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -19,8 +19,7 @@ struct I2CNode {
 
 #define I2C_BROADCAST 0x00
 
-struct I2CBus
-{
+struct I2CBus {
     BusState qbus;
     QLIST_HEAD(, I2CNode) current_devs;
     uint8_t saved_address;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 24e95d0..8fd449f 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -25,8 +25,7 @@ typedef struct I2CSlave I2CSlave;
 #define I2C_SLAVE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(I2CSlaveClass, (obj), TYPE_I2C_SLAVE)
 
-typedef struct I2CSlaveClass
-{
+typedef struct I2CSlaveClass {
     DeviceClass parent_class;
 
     /* Callbacks provided by the device.  */
@@ -50,8 +49,7 @@ typedef struct I2CSlaveClass
     int (*event)(I2CSlave *s, enum i2c_event event);
 } I2CSlaveClass;
 
-struct I2CSlave
-{
+struct I2CSlave {
     DeviceState qdev;
 
     /* Remaining fields for internal use by the I2C code.  */
-- 
2.7.4

