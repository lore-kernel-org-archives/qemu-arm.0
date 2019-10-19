Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2721727wrm;
        Sat, 19 Oct 2019 16:55:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZfJsx3ikegvmqV8lx5jausW0NPbOWW2StqxeOrI4I/0ASX7HR1bDimZiqkLW2qSkH4d1B
X-Received: by 2002:a05:6402:13d6:: with SMTP id a22mr17341612edx.165.1571529320170;
        Sat, 19 Oct 2019 16:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529320; cv=none;
        d=google.com; s=arc-20160816;
        b=j/6AUKzbZzPpAWLcOw46buSjmzR2a8f72mL3F501UJbc9ykHTyJchLaknI9Jc/FJON
         DfBL2qtX8fYm17syRGi59MaV3U250Lqhsb0tpqGI/zcv/DoPX2vNoxKEmruIwv2a4VVo
         D3+Dpc3MKEIyeOmMmhGN19I+G3IZoz1KuqPoD2/b4wdW8EGjzf0nz++Oy8/xYQt5hkE6
         MqVbEWZ/eFDuGkaQrmCLV+htz9HtUFvIu8kErLJ4rMjuITRnc2S7wuTgIq5NHk+RWyoZ
         C/fcT2L/BSOc36IEw9DaUVJEEK0ZU/mATIR/DS8sW1v2dM2PdgCh/ygQEuGxaACZbyrP
         vf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bG9RMPIGC9ljNya02ZnuD6xFZnx6LHmfx6JD2fgLckE=;
        b=xxJgbvXTmaIJcfeZDfyUrjkvJViyk7t6I0sgfMitw10ycOAH9EN3gjZ3yERJ5dHHEb
         /QCtwlKUYlSbYIz31wycNpXU5jcQnwZNxWProSpRkj8c0LPaPvIFp2Zb+023STj/8UDv
         yCmOVD5mciokWaWjcpcNXsZ65HoKw1KR4rLowh3ewbJi+Mni5wJ9xKeax+Q4CbDagxgj
         i0SJu8Lbz7QDnwDyg4UEkvz6TC08IiLY3m9xSw8byGf9177G6jF4VumUDM6YDbRAJvjq
         m2UVmxvPSNOXukcFAgFRDXQ6fN++3gVPT7jeWQEvlW2xnl3Zyq+kvSNSAPP+aDSgbgZ3
         cwNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adqvvPr6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si7599333edy.95.2019.10.19.16.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:55:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adqvvPr6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLyZ4-0001QW-LQ
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRk-0000Y1-KM
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRj-0005h4-Gp
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:44 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRj-0005gV-Ar; Sat, 19 Oct 2019 19:47:43 -0400
Received: by mail-wm1-x344.google.com with SMTP id g24so376050wmh.5;
 Sat, 19 Oct 2019 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bG9RMPIGC9ljNya02ZnuD6xFZnx6LHmfx6JD2fgLckE=;
 b=adqvvPr6OvliCpivqvTDkGK5pQwwU3ewhTuLsLRCQEk84kVmVPjdrMkB0UNfCg7zlB
 oBcYILWfOQZ5/xZYuqggf1n4qHUx22Lc4oLoSjP6lV7GDKAz1h1VMG+cWnwhvkwF0XP9
 lQ3CeE3jffuGat5ctNihyts9U1Xo/aIOiy+HMP54f/qmasHdf3gJL9j2lcTpxhfZ3Omy
 5UwntNzjxICuMpA7S8Sf8cuXtSWhqtTOZ6Ka4Q436UZnmW9UpQQsJfl17/ry9G43NJ7f
 Ns0nopxdld0vPWVvKNwQHCE21zoUayIkXKNf7zp1vISoauT3CbkT4UQxcr2rcuqTZFb9
 Xg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bG9RMPIGC9ljNya02ZnuD6xFZnx6LHmfx6JD2fgLckE=;
 b=Fc1uG7ml7wE9H+TPyRdbSi0aL6fehvn5mFo4nIOXZEImvIhn0z56cS1LBaB4D0ABg+
 PPZhOon46O7suX3ElkzQJg+BIz0vZWRKlgwkWenyLNcD+G5aAVPVR50CmB19/R/ZGXOi
 CEsLaU8yPz6LpoUME85xNDjxf/QM2aO33Gpa1hUaEmlj4FLO6bKXXf3iDTuCgKMNnTBD
 EG4EsiEcSKMnJaekbjxlBp9yzAZvKTZMWtt3plldKPXD/mvy1kSHnFS2wBAhJxK5nXx5
 bfg+mYWDeHKV+Rq24i6gBobiQ1VgQhpJoXaQwNCtuH/wbVSt0S4mkJVHSmpWVE+FpBUE
 cOSA==
X-Gm-Message-State: APjAAAXjzQe4crn2UhMaMjYsG7VPALakgJecBoSlnWYB+ZK2+tvGlDOv
 i6blnOm/IP53hQx9M590QqP5sOfG
X-Received: by 2002:a1c:9c0c:: with SMTP id f12mr7379593wme.133.1571528862229; 
 Sat, 19 Oct 2019 16:47:42 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] hw/arm/highbank: Use AddressSpace when using
 write_secondary_boot()
Date: Sun, 20 Oct 2019 01:47:13 +0200
Message-Id: <20191019234715.25750-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNo1gl5xbBLf

write_secondary_boot() is used in SMP configurations where the
CPU address space might not be the main System Bus.
The rom_add_blob_fixed_as() function allow us to specify an
address space. Use it to write each boot blob in the corresponding
CPU address space.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/highbank.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f1724d6929..518d935fdf 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -78,7 +78,8 @@ static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
     for (n = 0; n < ARRAY_SIZE(smpboot); n++) {
         smpboot[n] = tswap32(smpboot[n]);
     }
-    rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot), SMP_BOOT_ADDR);
+    rom_add_blob_fixed_as("smpboot", smpboot, sizeof(smpboot), SMP_BOOT_ADDR,
+                          arm_boot_address_space(cpu, info));
 }
 
 static void hb_reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
-- 
2.21.0

