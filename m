Received: by 10.28.71.27 with SMTP id u27csp4678261wma;
        Tue, 27 Feb 2018 02:49:35 -0800 (PST)
X-Google-Smtp-Source: AH8x227Zc5e/ltJdTJJfSpWLaUVY2zF9T5Zpx6aY0RzfUeAMMU+RJzyQbxjLihLz9vCnTBet5FSM
X-Received: by 10.129.40.196 with SMTP id o187mr9175658ywo.497.1519728575162;
        Tue, 27 Feb 2018 02:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728575; cv=none;
        d=google.com; s=arc-20160816;
        b=S6/5MYb45qZ6T6EZ3aZOeDaIE0wit9e8M9hP8y5MCCSQLs8E30hGHhQUHEHBUEpVRg
         xiXYsM1ZT3Vc3Qgqz6+fYvDqw6DAfhQwrdfah1/9+dg5Szb8Sd4bQKACASBhdGJ0B1nK
         Ues2RaHoI0xlZjw93cogAcMsBKG8iQPFzTcWWh6SpF3VDYyAEbbtClZUB8KahL9eP6BP
         B7yVzvCIaBIon8QJvCFlxfWVuqZaiKwhYooeVV76M2Yl/HDWmCOi25+qJHYYn14A8yCB
         gBJSDX8u72gwcurrkzOog0GJu2J/DIiXmJoIOk0BHu/+P3NspQDrjeehzdNyyvrUU9LC
         T1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zxiumG5yKtpafwO9NwXhkvNlQBAThKuZqf9U2cg8vUc=;
        b=wmmBjVGWt1AeRADIigPSaWb8O5f4V74RCHWofF6WgrprHLV7T/R6lokaDbgIyVhxR1
         5eghi5rYT5Gy6F/fxyze1iCIBxwSWDMRsMQJepujAmwboY0zXucrxByNEa/y5CvUJuSe
         2I4obKhgLT/rNlKWCT70DxIXmYLwvMifaJP0M0Hxh6aFNkdFWsTCMR4/NOC3ueAMA/pq
         pe9NA3RwJ9zj/QMkC8sYgQzHrbaUc3gHlDOs0mJniLFkvwjQ3SEUtk9UfzTcFmIbkbaV
         t/dNG3YY6Lnh5OMVBrushsQX+bocLoePk6ikJ1SN755fU3k6ojvU1hPlL/b1AKUwoFMZ
         C/7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQKkaIRi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si1830217ywt.436.2018.02.27.02.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQKkaIRi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcpC-0006L2-HI
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:49:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcor-0006JJ-8x
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcop-0004A1-JD
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:12 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:44426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcop-00049S-B0
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:49:11 -0500
Received: by mail-lf0-x242.google.com with SMTP id v9so26818977lfa.11
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zxiumG5yKtpafwO9NwXhkvNlQBAThKuZqf9U2cg8vUc=;
	b=QQKkaIRitQQwh8B9wCarcA00y9eWsIyltP8NHq7DEBXrpOtLLoHTty+b38e1qJUJXj
	MtvcayV9phbAEC67+jD3fvmWfj+EdMAzUsDhaNRH5cUCQfYO6r9HYP20ZmWUy8J++Obb
	1PxgIt5IYvnehMrd1KrnPT4kdKh44I/uTx3g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zxiumG5yKtpafwO9NwXhkvNlQBAThKuZqf9U2cg8vUc=;
	b=Me5rQjSvEBoljFcMnLp9ffNmRyC+K+dkcGkzCQsjWjhh4qc6pljGlA9PfoM9HOV7Ic
	S6Ng/pkbkq3sGjWg3UQhJU21eWNdhrKOyWh1yY7UTSiRMUIUEReIErso3Sm+F22ffJ0q
	+usJX/+sGnql5U1UVOuk4xwE164N0XR+tt9taFSh1hqPMejmhpz9Lu+kNkNjwd6GnzDa
	CRY1IOBecLh84TxW+KYOQLXY+x9Nyp4l18YMgbg4OHILRALqnpG9Vb7q29lTiUHlpVq9
	x01aLXGfNF5nYIrC23Un8Ty3lh2PaWWeOlQEHRltBz2eHfP7o7rMwJPxT6cJowCUWR9d
	FCrg==
X-Gm-Message-State: APf1xPAPQ/561AtnGvDH6BQ/u6Hn+TFVMFPDuDQAIwUdcHkEI6V7B6EG
	DjD+4npxrPt52/5yn1nTvYIzNW56TLI=
X-Received: by 10.25.193.23 with SMTP id r23mr9068471lff.45.1519728549999;
	Tue, 27 Feb 2018 02:49:09 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:48:59 +0100
Message-Id: <20180227104903.21353-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-arm] [PATCH 1/5] i2c: Fix some brace style issues
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
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHN8V8KMoFHU

From: Corey Minyard <cminyard@mvista.com>

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 hw/i2c/core.c        | 3 +--
 include/hw/i2c/i2c.h | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 59068f157eb5..9a54b61c1dbd 100644
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
index 24e95d015589..8fd449f645f0 100644
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
2.14.3

