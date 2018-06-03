Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2136937wre;
        Sat, 2 Jun 2018 17:08:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJCOBwWmxvd7QD1QO30MuBB6Ge/o19ZS3KTvSZmAcuVylHUe1mpXpUlJXQ+S4LLm3O5aHkx
X-Received: by 2002:ac8:491:: with SMTP id s17-v6mr15853072qtg.46.1527984538092;
        Sat, 02 Jun 2018 17:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984538; cv=none;
        d=google.com; s=arc-20160816;
        b=CAU5bldq2yEtzcLR3sVe5O/2eSZ4lBSr8aVyed5J2n/7Qz5dz23r/32k0/ZIUvX2zi
         RODedj5DpUqcn/LNR/qiJYq0uoCxLg01RtnXbnMrVtvbze152N0+KZPeynKPFD4yLHZJ
         KHbj3J/nTAhfiJ45uAE1E9wuUjzIA8tjRhwzTFJAqpi5RZbkrOOhN1dn3/j21lTTA890
         mKx7yrMElRrJ8nQEfOcjDrRljWszV/biXfbFFijcJu05VwtRIYsI58giOyDdOmTaX3sk
         xmn0V7DjhE0So04Xz9ADGJmAnEpwrmvI9LHAhij5+yv8viug1ZEK3kdWnjmrZ5JMKldA
         m8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ce44WCVkMMagK/1JB1LR6V+RdskOBCGMcjXomGJKki0=;
        b=iV963SD4tXWC66ClWgS+7neAzuuRf+JX5Mzm1VEMDwX2VeenDYXvTxmxT3A7gKzYe9
         BGWzI9ozXIZ4aee/ZcDucWSVNk8IuXDGi191SkkCdIC7RUraG5sTsIt+fkn+CWFVcukx
         xXY2I2lQx4bCgFcwE93oIU8GakzzEqcD+1rFP/m6jFoQTb6gE3nf419MTAvUFfh1mt9B
         ASZjWwaZpvUuz3fK2uTN6JBrXdx7ZQCv4Y7s2/LRo57wa7IN+XB8imd5vf/xnXUbD10o
         GB5B9FJOkMshNev7UW8Eey1ByZcpc/5/mANwCyDtMuhGWzMkjoPB3MdY6xw21gi8x3d0
         zetg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f29HmJzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o19-v6si704578qki.30.2018.06.02.17.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f29HmJzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGZt-0003qG-Hx
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:08:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZe-0003oZ-Cu
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZd-0002sq-F3
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:42 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZb-0002rf-FM; Sat, 02 Jun 2018 20:08:39 -0400
Received: by mail-qk0-x244.google.com with SMTP id 185-v6so22648499qkk.11;
	Sat, 02 Jun 2018 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ce44WCVkMMagK/1JB1LR6V+RdskOBCGMcjXomGJKki0=;
	b=f29HmJzfINibmDQY/+zenBE15BMPpgWsCfrFqmPe52kueUpeMJsH3JlybI8tHHzB7W
	eHCvAK0VSl77LZIhCwJP8r2WXwTvhL3YcPGi67AwYoqpeJi+/LQA9ShhBlQSNAi05zAs
	dYL0k3BQ6+fxY1PUS9YfaRvF2jarJDHbVEQEbowGXUIpHb0MYjrHYZmj4MWv/CkZximO
	/xiS4/zxikAHTReq7T07CV9CJ0X9+Ws8Nbh3H+lW0S9U4gbInGRFNBE1BbOuImQGBw2Q
	G7mRrSRyXUG4A3N51ysLmJSO6UlRNWFRKRa9HOGe4Pq5d4WqnE4a01Q+MT7Q3BWrzRyY
	fAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ce44WCVkMMagK/1JB1LR6V+RdskOBCGMcjXomGJKki0=;
	b=jlNbWNlzwjV/a4yhS4fFJaMiTYv0hwSkZAwfccR75RDM6A7YEDBRPsAKVraCkyQ0R4
	B1M/UITQxM5h2xtrpUNSOFciHhvb8/X5lHKHqkoEq/vWwUxyw9KX/ib7ivmgfGqJKXt1
	bH+EwLyPq2BHBlzxsIN0phFXL5TFoTmEfRLFwxIEHbpzy/bcn//OpPiZbZOxCXRX+suT
	5w0jB+oBllT2qgy1ZoswGROKkpPeSVmhTB7qG8XgrQyycZZln6NccCbi8SnXtg/omPPq
	nvEd6ofkaAFWrZt/IwvoQSPz50H7QTVy6GuAkjm1wnTHhxCxyZYDj5We2CQoIHBWHeRB
	1vcg==
X-Gm-Message-State: APt69E21f0W4dttsr/W8tli9KxfWdrr1nIdkM6XGGw9jTol4hLQdORPK
	UU/ErxZyQVXvYyyw89+Okvg=
X-Received: by 2002:a37:10a4:: with SMTP id
	36-v6mr14884188qkq.349.1527984519062; 
	Sat, 02 Jun 2018 17:08:39 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:20 -0300
Message-Id: <20180603000827.30872-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH 1/8] sdcard: Update the Configuration Register
 (SCR) to Spec Version 1.10
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
X-TUID: XIPSxQR1EvoO

This register now matches the description of the header:

 * SD Memory Card emulation as defined in the "SD Memory Card Physical
 * layer specification, Version 1.10."

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7af19fa06c..e1218d1fb6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -310,8 +310,8 @@ static void sd_ocr_powerup(void *opaque)
 
 static void sd_set_scr(SDState *sd)
 {
-    sd->scr[0] = (0 << 4)       /* SCR version 1.0 */
-                 | 0;           /* Spec Versions 1.0 and 1.01 */
+    sd->scr[0] = (0 << 4)       /* SCR structure version 1.0 */
+                 | 1;           /* Spec Version 1.10 */
     sd->scr[1] = (2 << 4)       /* SDSC Card (Security Version 1.01) */
                  | 0b0101;      /* 1-bit or 4-bit width bus modes */
     sd->scr[2] = 0x00;          /* Extended Security is not supported. */
-- 
2.17.1

