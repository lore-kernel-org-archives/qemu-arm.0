Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5433117lfp;
        Mon, 17 Feb 2020 13:09:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiXl9KBFyNn4mLDXie4mcq3IRLrAk93jJwPN4JXIrBOBY+u2LXxtfDC/N6bZpuzFmqtBaf
X-Received: by 2002:a05:620a:6d4:: with SMTP id 20mr15916961qky.81.1581973795739;
        Mon, 17 Feb 2020 13:09:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581973795; cv=none;
        d=google.com; s=arc-20160816;
        b=Qy6K6q93HSSOof8/VoC9AvLhdLaTuDCINsTqlKFVpVsPDwJc7eOKP/fJ232wJdLXeV
         HrN+tJTkpc/KzUt/YNfVYpO1Xzac+kG3a71ZltBMHig+37q3HXD2I8LIorUsHyCql7YM
         sKt6V9pOQLr9zUPeElG+iBVUk9qHVYX8o0hTcCKvztGxi62Wy1oeAssmQiNinSztuV22
         StOiPHouZSTAHNceIKxBUDjWZu82l6CvA6wOCo7EPCAhsMU1kHDNrfecpCJPcpdn9wQP
         +8hYTynfbrXCCKxVCugiU+qP2aCFXrNjf++6X0e7nICmnb5dwevFWZTIq7BkEHRPLqUd
         WEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=GQgJidPFXL9L+5VnERG3WiMD3P/4Nq4D9jL2IVB/SHk=;
        b=mBCOqL6aFX1tUwJl3vYpsIPP5gqb8Cv6ZD3Rm9jqzvV66Rt78pz57epJc9d4T30yua
         UGwZ54amB2KWJe6YXyoWLhqULv/3KF940w4zBu87TqOxJj59KEKy1pPHeu/O4AOiZ3QA
         VlexwgOo8ekortjtZDnYlQDxirNaM9Y9/FJh/7FAblHeY+HR4eZWaGfmfP/Lssnm8faZ
         zV4SA2oFdg+yPKysqm3ZlxcmeK4pAZBSDDCjAvYSpCnP6DIWyou/8FrdqIBt35syJjif
         eNMGl9Y+xu93/vU1oizr2i/T9S9camSCT/lFPqqld6bGXfTzJgKG3HF9U7wXqvqhr29o
         INQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HFLzAI0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j194si930082qke.294.2020.02.17.13.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 13:09:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HFLzAI0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3neN-0004vq-7V
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 16:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3ndb-0003f3-Ua
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:09:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3ndb-0008SC-0h
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:09:07 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36826)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nda-0008Re-Rf; Mon, 17 Feb 2020 16:09:06 -0500
Received: by mail-pg1-x542.google.com with SMTP id d9so9862349pgu.3;
 Mon, 17 Feb 2020 13:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=GQgJidPFXL9L+5VnERG3WiMD3P/4Nq4D9jL2IVB/SHk=;
 b=HFLzAI0Qz2d9N2KTZKMjXm/yrQNnfkPwI22PNo2Tbt/FX4R0TjCJBrC88mBMYIuFOi
 RMj+6OQTwxEVd4gvGHCy+o6yG4N2uAGms7NFTbCTggjLFT279LQulPDQ7nPViHYL+Pjx
 ORqmWuIXXV9drPQn9jwkEWN5qOrhB+A2cm89+uMkS8wDPOxSgSP9DCRuBhLvg7fYZFfL
 YGgilcVnHgcPQymtbrq4KaCyQt0g8DeHhv5R6R/sS55HQhANjzZRITFCRcIsDWvj1r+P
 IV/Y6/2jeEyPqgC5lO/0wBNUVwSOhuh9dpLtR/9S65j3CIzFRDW+VTdhmoL64IMaZ65h
 aRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=GQgJidPFXL9L+5VnERG3WiMD3P/4Nq4D9jL2IVB/SHk=;
 b=SPZB6x5mb3LKsOu5osu2HCJM/zWE7HxDfM3a3jb7Vrr1pRsuiRZ+YthEpjoOWaYCuI
 4/ZIbpwsvu2OSRjaklIZ/eYBinXHKvVyA9Fg5S72YydBlDQu3KBhyV6Jkrj2wlwb1zYC
 R+ZCIHdnyjoVM1wh7t9KaceBeITZtdi7gzVeSdZJOx5+WJAQUfGqosoKpMSHgOTfrTVl
 vy/APJxFMz0SZFIT1H9fMW8Glq3MbsPcA+z3Wh/s1jRS/MdcIaTWjmsrcq8+nYRbroMA
 VkTYC+KqOWtgnycf5JpSECiSbtpZdvQY4sDv9y44TY0KI+F+mkRuWEC+HQBaEZMtWHsA
 zfmQ==
X-Gm-Message-State: APjAAAWXW0c0FC5FFl2qg9dvYIPpjZfN+tLPhfgTnq4vK/ny0UVcnl/K
 3ouNMD3edBjfEEy4zFqP8co=
X-Received: by 2002:a63:d845:: with SMTP id k5mr18675513pgj.183.1581973745917; 
 Mon, 17 Feb 2020 13:09:05 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e9sm344058pjt.16.2020.02.17.13.09.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 13:09:05 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] z2: Make providing flash images non-mandatory
Date: Mon, 17 Feb 2020 13:09:03 -0800
Message-Id: <20200217210903.18602-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0oDFM5KWmnAO

Up to now, the z2 machine only boots if a flash image is provided.
This is not really necessary; the machine can boot from initrd or from
SD without it. At the same time, having to provide dummy flash images
is a nuisance and does not add any real value. Make it optional.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/z2.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 34794fe3ae..4bb237f22d 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -314,12 +314,6 @@ static void z2_init(MachineState *machine)
     be = 0;
 #endif
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    if (!dinfo && !qtest_enabled()) {
-        error_report("Flash image must be given with the "
-                     "'pflash' parameter");
-        exit(1);
-    }
-
     if (!pflash_cfi01_register(Z2_FLASH_BASE, "z2.flash0", Z2_FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 4, 0, 0, 0, 0, be)) {
-- 
2.17.1

