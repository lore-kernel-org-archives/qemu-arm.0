Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4251825lfi;
        Mon, 6 Apr 2020 11:04:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypKknez8aoUsi6l0NCK3vj8ww2tfUbM+Duu36J9DpF7bORAguqKLux4k2g9UFhTLbx/XcTzJ
X-Received: by 2002:a05:620a:709:: with SMTP id 9mr23170527qkc.355.1586196244093;
        Mon, 06 Apr 2020 11:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586196244; cv=none;
        d=google.com; s=arc-20160816;
        b=XvdNmw+13mRUPbAuvlGpRB6AqWCXvFJ7tJkCA7nFmGQ9wVFa0WQXPAvfSfzsKKXzmB
         2reGImmmdVdjb4LktfwUeeNMn0hZpuqOVvuFUPo/nhYFBgDY4ErDxQzrKN5DP4I0Oug8
         gC86W6S9wh4HDg2e+tt5InjMDV8ZQSq0sTBIFFaG6yBQiXHoskYHYEJRoLNPbwYACTWJ
         UASoV3893mtRQVIZecVcxtZ0GhicUdYo2MFANg/5LDPxr+rYVbNgi7HrNgtuwD9JAohU
         wfWcDiW1eB5WDQkvG4p70GPK2Esdlg8mU32hxCSh2CWMujvhlEC7V6cn4wtWVaBZnXaM
         AEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
        b=QZ/hCI+B8y4kPFptn8DzqPh4wMzYOPLV5lDGaoYM43nqGD/ygUmTOwJU6SSrZKzxCu
         tC9p2r39dfGyACmQ2eHHMPcZmV3lnfd0ClXvXe2fZQ6fo26dI0LSDSsY/wJYjZt6tYIK
         GeJj9S1Xhx8bI+ECXBMoSl5LznUTRieHs9NJ4H5001sEKQqLMrz0knFMsYidFssDcm6t
         mwhrRzd5kSynqPk6xmB8fd7UvUzlb7KmDPA5JGs9ifH64jj7JbejmLciFNCPT7Aa9A/M
         bKorze7S96fInUnthDM9x+jTGno5Hx5cDr3J7poj7UV3rMfutzl425nbvwBDimkBVBqg
         Z+wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GG0uoRxU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19si227973qtu.277.2020.04.06.11.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GG0uoRxU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLW6N-0003ZZ-GP
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrF-0002IU-VO
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrE-0003FW-JW
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrE-0003Ch-2u; Mon, 06 Apr 2020 13:48:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w10so515426wrm.4;
 Mon, 06 Apr 2020 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=GG0uoRxUc8+VfK7SEVrlqHXsr7G6RT3PJlLFsn6OGv/t2KmIJPUbKP/whI/BTlWqnO
 1qxz/Itc2t7BK9pKeOkjDP+OZrLaapNGCwHA2LWy/q7G8PV+V9vh/ic3XmnYhJffKiaT
 WcrXEmAzgarapZSoF3Hq6rr0y+94bE4CCk0/sQxjYEiEWy2AEC20KzoHLOm7p+O31bW3
 gvAf4lEdziS8z4xnndf4riyap4R1nazyl4+x3ZF4swdiH8MEY8J80gN59vaQNPztuqVw
 b7j+75uDJrOCK+8cc8rgCX/ykrR3zAlhBgnNaxN71zsvGpAZUvWLzDAzvx6Oc8kT4TuH
 TMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iPAKPkoi+HJFf28A5mZBn3JxaePmMb+vKpWg/g7b+Dc=;
 b=tkk1vMzhnrcwxlc7RqdW4nwmGGl1p0NryRgkJQ1gxTRuuB408VSipDDwM17WeSWqCR
 by0hR7aDGKBH18bUJNJvE4noeWSRgue2UYgPqNSUul5EtXROEakM1LPBJ3Ipp/DJQGk2
 mLHbnbLVhHxb+yFDkGPQea/0jdp/lXNek47CiMTXLmmXpga5Sa+vF3wbIq3eBbJQRLcq
 42Ux/IKwedTJ6rdrRiZ6qr5ahE7QYVv08Mmhfmw93Z0Q4hvIOjJA4Fm2KW5LiJPSAyys
 HEE+tngv7fZNW14DKX0moee/Sg55dEKp7tehHnh9JlUcsVcR7UeM87GrYjS2d7BfsxXd
 m0vQ==
X-Gm-Message-State: AGi0PuaLPg/+gvE1g3wRaaGwMONxLjG2ZRkc0gJZYQyYTgAzVpAodwUm
 jvwoUBgspUnU0Ki31aCQ+b9RbZT8Q74=
X-Received: by 2002:adf:a347:: with SMTP id d7mr350873wrb.21.1586195302796;
 Mon, 06 Apr 2020 10:48:22 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 27/54] hw/arm/stm32f*05_soc: Add missing
 error-propagation code
Date: Mon,  6 Apr 2020 19:47:16 +0200
Message-Id: <20200406174743.16956-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0iKjQCZwh6tA

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 6 +++++-
 hw/arm/stm32f405_soc.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 76b0b0e9be..b1be4fde40 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -106,7 +106,11 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 4f10ce6176..2b8a84a695 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -121,7 +121,11 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(system_memory),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.21.1

