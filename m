Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp977648wrp;
        Wed, 4 Sep 2019 10:13:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0WRJ0PdyJyWvIysQ+x1k2q89cMJIHBdLK6/uEdUIYyvR9tnp/eHAvMsy4VJePw91Q3ufn
X-Received: by 2002:ac8:47cf:: with SMTP id d15mr18467391qtr.253.1567617229353;
        Wed, 04 Sep 2019 10:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617229; cv=none;
        d=google.com; s=arc-20160816;
        b=lrUY6zXoIXlre/4lnOdLajYsVWX1L/iEbz3Bemfq7sd2qMhSpemVtTJ1HCZA1eMdVd
         lnpyO+e7x5i35N7yyw/Iz0xRdVlVKT5eGLRb97h+g3ws6qZeLRg2IqJJpvgRYrOP9oBO
         y7/u2g7+V3l4hsFFhJ/jW1h1Isgkvr38ZEy6F2dUjUz/IueK/DPZCML5InYQ/k9+Ne5i
         FQ/VmsxuKf4xy7RvizQOQc3aZIo8Cu+RkxJdEE7G+BsrEdh0qFnsYoueqhndCDR5nNKf
         uQ02umZ1ccGdB0gXQn6jv1IBpGFBTpzqCOfL+2QLlfd3wdu5CNIdiD8f5t3/v4/Js20Y
         l+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
        b=UT6NSq9HkR+gs4ioMZAWzO1utsDojPxEzxMDKMEfBP3NgSjnpEe+laQH+MCE5X3/+4
         SGP3CrThOf/qgKnGpaLyxvO85idnEuLZrcX+DWX97DpJq6RCNISobKBeorcZp8EjfbJn
         s0ZaBNZZW9fro/meTxMrnWX3WtuqzzBlCo0FXvoFHe6VJaQMxdkMYYiUzlXmTy+Pq5/6
         ZFf5eXQyxU0sn3LmDIntMPxv/mIzMjmH84fBG5MdjSahVBMjDbdZF50/AHHu7K80jocN
         BxlLc0HbzanWFis2oaHmDbfWSOOjpXjTPbDCERkqDryEpCDmnoSxqyBGt9B3w1jLuwsK
         yDdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F5QoSQQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m42si7380993qtk.217.2019.09.04.10.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 10:13:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F5QoSQQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Yqq-0001LZ-9x
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 13:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqS-0001Ib-6b
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqR-0006zW-20
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 13:13:24 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i5YqO-0006yF-U7; Wed, 04 Sep 2019 13:13:21 -0400
Received: by mail-wm1-x342.google.com with SMTP id r195so4717309wme.2;
 Wed, 04 Sep 2019 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
 b=F5QoSQQn9lWthvpWyrS2ePfhHwzA6EJHxfekKenJN0c18EnLqz3KAhcG3ZIBCf4E/q
 xE1skhSM/IMpFgWWUFs6xfJEiucb/V7b6gjmdxWvq7iTPq/XHo5HY40sx0s31zf3m/oh
 02Bb2Sj29VaQ288BVZ75cPJewS39PX3o2fSqNUE1ZVDDaJAnoDBKnQ5gtWJlDGI/x5GX
 DcaVwU+lRM2nnrDj/re8zdzLBXfgY46FkrqxRAXTZwbQwmvDRhnQk0GIrs4aUHd6Jp7Y
 PIBPD2F+nKER7Esxkn58oJH6ALphmkjExJ417wAsJrf66NJyaMpVmmbUypjpIh6kprfc
 Lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=voiG7DWCSdFTStaEL19HrjsIseLBzBfq9/zOs+pAh+4=;
 b=OvS4Kxx+Q1skfZ+WPy+a1/ee1TAOxQ2pIV2aREpA0qepmha6SQ0ui5SltW6WorgeXe
 xcBbAeVgtOgVmEzsZJys9RT8l23SsQTHhltJ6l1WYgtd8I0kGkX2Kml+ww+jjPXri5Kc
 aiFlWYs8RvSXJQ3zhCg/kaOxBAVCXJDVeqiZtblmBhRSYq14GeXBQUOcGCosZOtkOsaB
 DXkYHcj85jT8v6IQi2D+GcS+X3+99B9hPbUKSSKxCX0/rlEyqrtITyW1DfxqzMe5mitl
 XE0rj9nC3PSYRFrbDoW9CaQpDRrbVQLTYiOZowljGfEsWZ4t+RV1dVHo34qrOdsJiA1B
 uDCg==
X-Gm-Message-State: APjAAAVTtczqZHj/5bpqqUJ51VZ4Vd+FpELB9sCIbrHIZDKl67Q4BwcR
 59OQOiJp9yInwJ0vgAzDC10=
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr5520752wmd.104.1567617199881; 
 Wed, 04 Sep 2019 10:13:19 -0700 (PDT)
Received: from x1w.redhat.com ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id p19sm2339512wmg.31.2019.09.04.10.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 10:13:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>,
 =?UTF-8?q?Zolt=C3=A1n=20Baldaszti?= <bztemail@gmail.com>
Date: Wed,  4 Sep 2019 19:13:02 +0200
Message-Id: <20190904171315.8354-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 01/14] hw/arm/raspi: Use the IEC binary prefix
 definitions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 407xcf8GjqcH

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 74c062d05e..615d755879 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->default_ram_size = 1 * GiB;
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
@@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
     mc->max_cpus = BCM283X_NCPUS;
     mc->min_cpus = BCM283X_NCPUS;
     mc->default_cpus = BCM283X_NCPUS;
-    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->default_ram_size = 1 * GiB;
 }
 DEFINE_MACHINE("raspi3", raspi3_machine_init)
 #endif
-- 
2.20.1

