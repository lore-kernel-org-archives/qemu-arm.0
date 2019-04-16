Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3893326wrx;
        Tue, 16 Apr 2019 05:58:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9+jjPf41RBwybP2D/5zl/yg3mL2SnIzGI0o5Zri2vCkMU9z4/NcUIeqDNrOeLKT/aipkN
X-Received: by 2002:adf:c788:: with SMTP id l8mr51288990wrg.143.1555419504616;
        Tue, 16 Apr 2019 05:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419504; cv=none;
        d=google.com; s=arc-20160816;
        b=mREXw7PYx7Xk4BP5hByQaLSQ43leuoHkT1BtRWhCJ2sfJaQCQOXUGuFC5Hz26DZDQ8
         cCqOIY65WuDgcZXmcnVpdQinr3MAQxrienOPi1nbo+WJqw3Q7Cv5kJVOYJ/c4+kfM5rO
         3/Brw+ZRZOuM8vGfvEd3Z7lpscIA3aptCt9jXU8ilLdMKJB0JIgAnrw9vglrX/T7/XZ+
         23KW9YNNWZIETdo9d0QKITb94iuYtVjm7p9U09DBVNyvExxM0e8EjDxrDl8LMluYdKfX
         5DKgErDV3NWsg7wvHkrP9iH0v4ZYNg/OZZBv2Bk9O+7qwJ6ATBDAPflDsrH6C0zvlP58
         mkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oi+/NMTgWcniQ1uRjJ9edfUCRKrBUoRB3Mi7KKBbAVI=;
        b=Vtiqm3XkSDacnVDCWN42uBQD3WrwTFEbmrzgnXMMSyExAnZQ++DU5EHdH5o6QniukL
         7Xe/qMYXcc3qywzTO77fYKFOKFLYPz2/xQtmbL3sy2e0jkYqIVgdq86XcMyhGacK2d1o
         AmyVzFaYGxJ0EZqcHHVUfVph99ooRalrMAIKUVuJR7OSsSy2ILTF/GsDyut8As0b9/aS
         bNFvaioQyCCob1CqPKiev09OZoNAzd1b2gmoPuHH6PSskB87kuaFa5GfE3ElI0xXxU7n
         Zc1P70y8Oq2KrstqOPrCaMd2ZWO8AElL81i+xg7QNZtR+ejwc15eln8OZGV7zpcT58g2
         0NFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RKFUdtwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x73si12858150wmf.12.2019.04.16.05.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RKFUdtwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNfL-0004cF-Lc
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:58:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNes-0004MI-Ju
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNep-000111-ND
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNeo-0000zf-Tn
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id k17so22245256wrx.10
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oi+/NMTgWcniQ1uRjJ9edfUCRKrBUoRB3Mi7KKBbAVI=;
	b=RKFUdtwEX2Jd/yW0RWC4jOR3ZIXgW0xHANLvgIA7VoFGH89Ev9CSnzAeqFP+F1ISqp
	T1J49VMgozfR9y8fYsj6GshFPt38dRNtirdH3l4AIUL97l1FiZT2QSeSsiS+Z5mO0F9Q
	14o+k8bo+mQdEfJsuePghsBiBTE8xEKCewAtWrcGxJTTE+E+r3yI9fUl+gqExegOR2AI
	5hkPjbmQANE12RaSXrXtnmCY8o35v9wY6Ru8ThqWvcQxQ4kddRiNhJFjW1XeJ0ctZ4aM
	aB9RblAyHG2MiAFJ1vaidRZJ63VV6+XJ0wr/pZLIt5xr+Bvg/GNRGYRxtBaSKr00e0BE
	hxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oi+/NMTgWcniQ1uRjJ9edfUCRKrBUoRB3Mi7KKBbAVI=;
	b=J8dFNnJkLD5ZlnWtTjj265IreSBXvNl7qyK7Z7zUxmX6KgqhIQTThvB6e+Eorjh37a
	O1Cf/nHdnjil8czB0Xq/zVzIJ38hkITj9VZatj4oUeEZAO1maG0ctCoZQpcQvzPM15Vo
	tIpqJCWCWMckF74RbMGZjUzmmOjnUICREI6RVekv6nWjL2oVHiVgwa5M/QSHzcwxJ9JM
	tMv0XuX0rHOZCnocnvQX+85vYdC4ZQvh7ynM2BnccsZhxHgS4f5PrI0blPAPR8/1X/qr
	+TFkPfUWDklTg+H1Gp4G0zkXC78YTIW4baVPKe7pOYYUO0S2KrgLpocuQNAGmY1xuvRt
	4dNg==
X-Gm-Message-State: APjAAAV39JmGoROuuQrGlBIYtbZYhUz7X7IsGesUWUc7/iYVnxAHELWk
	yImMfP6mM6Uhk3jP70LTTDhDSeg6Ya8=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr18982199wrq.218.1555419469079;
	Tue, 16 Apr 2019 05:57:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:19 +0100
Message-Id: <20190416125744.27770-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 01/26] target/arm: Make sure M-profile FPSCR RES0
 bits are not settable
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRM5pjkboEhH

Enforce that for M-profile various FPSCR bits which are RES0 there
but have defined meanings on A-profile are never settable. This
ensures that M-profile code can't enable the A-profile behaviour
(notably vector length/stride handling) by accident.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 2468fc16294..7a46d991486 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -105,6 +105,14 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         val &= ~FPCR_FZ16;
     }
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /*
+         * M profile FPSCR is RES0 for the QC, STRIDE, FZ16, LEN bits
+         * and also for the trapped-exception-handling bits IxE.
+         */
+        val &= 0xf7c0009f;
+    }
+
     /*
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
-- 
2.20.1

