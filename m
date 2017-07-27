Received: by 10.25.44.15 with SMTP id s15csp1500903lfs;
        Wed, 26 Jul 2017 19:57:59 -0700 (PDT)
X-Received: by 10.55.21.223 with SMTP id 92mr4150595qkv.199.1501124278916;
        Wed, 26 Jul 2017 19:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501124278; cv=none;
        d=google.com; s=arc-20160816;
        b=IHCwFmZUSkKLvB98ZOZa3hBIov1jJ87acpC8VQgCoEQdSyninwE7Xs2WV1Yq6EhMJU
         HVK7Dfy9FI2NT2vTUk2piZOhKQqqMAPHe+hYJc49UChr9CW7RveHL7SbmDyJqzCDELPu
         UGlNrJhfoPC2apLWlPTQnDsi+yiKdkbgtLfMsIEb04ZNBkCQWMbD346eh5vYXc2z8VNf
         6ox1nXcGPunL1wseGTF5UbwDfmhNCgsLIcmgDwYJb3t0eD87ZPrOTBncSIH4enx+0hGb
         pCdeHvAPr38+X7aBOwz5oLvwBEsFo6VwNQaULyrphRkM2LKh5AlYRvi9E3V+mR8uyj5U
         ljjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ayOHY3oVaYXRTdSJhc5n/47OYoN/gdbRSnnFUHp1NYI=;
        b=vRuPMpXzf8CQeMYj9w019sx6jc+TBmRP6RpbS8MpLQ7bMnAaSw0uLo6vzSJsOR2KHy
         JtlhEwK5K3zImoTEuH1etXjptsUwTi0tNsQfe2Lma9QTus710CtRrvHqjVM86kagBo4U
         TGqzQBn5YsoHlrk3dsZFU0yxhujaAEWXOj5yjGHk55GYCvdV8V+QD/p64Eod5gzJ77UJ
         Pt9Emtletth/Z3hX573O0KB4JiRIwztoofXe2cmzPt9pvAzq3tlzxQVSlpDKR8sqdkIS
         q3VrbqIqACfZ818hAGgVJ5zJYi4vKzPD8NMTsOGEdbtvTTJDDRqYiqvtncm93INpw29e
         2p1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=bDReCoq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si14221952qkb.68.2017.07.26.19.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Jul 2017 19:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=bDReCoq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1daYzs-00031g-83
	for alex.bennee@linaro.org; Wed, 26 Jul 2017 22:57:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYm4-00069S-2O
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 22:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYm3-0008PY-CL
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 22:43:40 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlz-0008Ma-MS; Wed, 26 Jul 2017 22:43:35 -0400
Received: by mail-qk0-x242.google.com with SMTP id v76so5570784qka.5;
	Wed, 26 Jul 2017 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ayOHY3oVaYXRTdSJhc5n/47OYoN/gdbRSnnFUHp1NYI=;
	b=bDReCoq6b+p10Ho/yIn2pCOtnFrfLwFXFxULcMWuY8Ed/2emNd6kOV4wH5lQ9PM++l
	z4O541Z3f8XvFBntAtbwmFZULZFZSUuzWljgGh0CeeIYVaRi1BuTFAPgz7t72LhmxtQj
	oDkf5q7hdaRClcM3y4Rc1BE6VHn3hkbDl67mK8l1KxLnrDiXtnHjhVmlSLf5E2aSOyQc
	TZ31dLO/TEBQ2vEpMpYAcvaNSPTMxWP76iwA/wEzroDDj8HlPQTBfjTQYcOF9jpNCxE+
	ClAw9pi+8hfl82bxjCHrMEv6sTuCJR0aHfeTNnQkzE/aWY095XO+goOveUV+WIRquuY2
	o7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ayOHY3oVaYXRTdSJhc5n/47OYoN/gdbRSnnFUHp1NYI=;
	b=E5a/2Df95TZRSFB11gFIb9zd1LTL3+c7KaFlzNptA2gfrhi1T9NRqt8MZxATvsPaS7
	d5S9sZjKhLkFOnA9lYULCPAA8JyiZhJEPwfX169m2vnVZ4JNpyhJTRQM2g/skBeAEJE6
	WAoGGvp3XTe7aOIrn1lIHDaOu0Rwpu1HvaVhq3ZfRJcZgLI1XTb+/JSwKsXKT+5be8UZ
	2LYxtsbesIhdFdrotY9qvweiq3skCcBwpEn/48nN45ck/uwjx7Y0kvCJI0uaolXkWTUn
	v6fv3ZEFabp3F2llW9FVp0CBGJ6sm8sfcigVi0UxAme8ElZaGVHIhI0kUDrWkC+zfHPC
	hU+A==
X-Gm-Message-State: AIVw113nBmqtwZDwdle9v6XvSoTod79h/dYb3ahHONrtxT65kRZGXBmn
	3SGPjs1Bmo5wxA==
X-Received: by 10.55.156.9 with SMTP id f9mr4069641qke.141.1501123415206;
	Wed, 26 Jul 2017 19:43:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Wed, 26 Jul 2017 23:42:24 -0300
Message-Id: <20170727024224.22900-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH for 2.10 v2 20/20] i2c/exynos4210: fix write to
 I2CADD register, bit 0 is not mapped
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22oX3ou6//xX

From the Exynos4210 User Manual [1]:

14.4.1.3 I2CADDn (MULTI-MASTER I2C-Bus Address Register)
  [7-1] slave address, latched from the I2C-bus.
  bit [0] is not mapped.

[1]: Exynos_4_Dual_45nm_User_Manaul_Public_REV1.00-0.pdf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/exynos4210_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index c96fa7d7be..e6a9ca8f03 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -243,7 +243,7 @@ static void exynos4210_i2c_write(void *opaque, hwaddr offset,
         break;
     case I2CADD_ADDR:
         if ((s->i2cstat & I2CSTAT_OUTPUT_EN) == 0) {
-            s->i2cadd = v;
+            s->i2cadd = v & ~1;
         }
         break;
     case I2CDS_ADDR:
-- 
2.13.3

