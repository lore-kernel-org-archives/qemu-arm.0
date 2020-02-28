Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp630732lfg;
        Fri, 28 Feb 2020 04:55:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwbhsaa6n7dJXiD4+alMWoso/DsZuc+XTLqpm/HVXURZY5J5Ds4kJUHQezAJI6OGQimt8z3
X-Received: by 2002:ac8:2fd4:: with SMTP id m20mr3883973qta.313.1582894541963;
        Fri, 28 Feb 2020 04:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582894541; cv=none;
        d=google.com; s=arc-20160816;
        b=YExqbC0NK40+2Nf9HGiWdR83ANFOISY/t3UX31QKQdam/fCWtJpqQBOgSNlxhkWhCc
         OiRf4r7THUAhJW5eiglHtZykYsxY1Ulvh1tGqtTBaaLNUtmC42lgrQnWWDCfR1IJp3Qi
         o4CAvjnPGDhXmIu51ZMriBZfzJoeQ9uzX+HKzHKp+j24Ostc+lqoYhhFpJ3hbkLCGUtn
         F8WV75UHrdgCI3mJDpRFLkmJPTBSfIHJDmkhT2M/YB1Zcy1LyIOsO+gS5/5JL4+SqzqZ
         8d2k+zA11PyZjDoUp0EkHnLb6JOC48KHzgc7cNthYVQOgoaFog8oTDNukG9ZMZvSwNGp
         Or0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NGU4cckMOQBBSno3d5GnmeEO95k4ubXtwQS7BoucsBw=;
        b=DDHABI/ic12MMBt27d39AlNVOMbSMzTA1e/nSZsUbYyVCcgansycUugNBmtCr5OSM+
         8XzF4iOVIBl8uBJNQEdQNo7NNxDqmg7qX5sjTRb5oU2vSlz5XyuFBktmUWoLIxjd6N4a
         td6OTurRFH2sR3E/03vaGC/vU3ok2wmZQTrpB3R0EIzYPETBacxoMZ8K0XaE8B+lb3Qz
         O4gy1fmeXAWvE9yD2So4iw5UGqcgEeZtSNcxF+VlM+S2tGh6UXwSX0j0HJJOZL/lb8WR
         2gEqZ4ZwkvXPwQa/15bl18QUonuOzwkQBMzAUM9nVEah/k7oEs0y/LiE2clNeIXsPpdG
         TGhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OmqD9rVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si1330486qkj.21.2020.02.28.04.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 04:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OmqD9rVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7fB7-0007rg-DU
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 07:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7f9Z-000522-Cw
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7f9Y-0002oh-EP
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57168
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7f9Y-0002oZ-As
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582894444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGU4cckMOQBBSno3d5GnmeEO95k4ubXtwQS7BoucsBw=;
 b=OmqD9rVS1HM96Yh1mLzDv0AoAbfAjlXh7QBQWQ/mTBXuWQvojMgBdkCj5HqNxdJ54d7gOE
 xHr/JRUxfkWOiRh4R+tJpjSpoBXq53Gj82lV+gTshT6xJXduWZrwzLmsIznaCXUqW4tpkS
 bc/xp5w8TbtaDXjsBruDrnIPNgXHb6o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-fdOqb7pnNq653ZKwaU0oTg-1; Fri, 28 Feb 2020 07:54:02 -0500
X-MC-Unique: fdOqb7pnNq653ZKwaU0oTg-1
Received: by mail-wm1-f71.google.com with SMTP id g26so662222wmk.6
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 04:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/dnD18K5Rg50i85S9IuEqrMYly3TKELwfFapxO4Kdxw=;
 b=CTay/3uUGakqW9y+E8/UZiPw8bdY35pfA5rkCs6KihixPrdLbbKmAeBO0dWrF3tJFQ
 960E4c7rxwFmDrNldE5q/4SBPkDyzIeCCcxO5+7BEzMieVn7riRQb6hetSZwOWB2Acva
 RRidORPgsdW6lmUfiv4Yl0pfFLucpix5FzfrFksTt0kEufOEfhiRpiQ5IBkSDX4wRBMM
 5IwSGJqgkXh/sV6hq0Jm9thNPm7SK8jGJMwD0RFrwmGn5kf8+nNxjw98o8vhNXAqnBh4
 MgwUowahW8OtOez+3nRsMSKYY9RASarLpSxRnMu9l5fsP47/HCjMKngzZI6aTaZI/x2v
 OYVw==
X-Gm-Message-State: APjAAAXWuI4FSw3rVv1kno6Uf7XVMaRa+XPyUqSDYK2T9E3URUQJ4P6T
 AL6rU1mo/EUj8Fq1/Sm7pgv2dO1sF0YmwdbXV575AHGKmRc7BNPKHXxfrZaQf/atSZoQBbh70/s
 7YKzlL5myPFkC
X-Received: by 2002:a7b:c119:: with SMTP id w25mr4905039wmi.112.1582894441010; 
 Fri, 28 Feb 2020 04:54:01 -0800 (PST)
X-Received: by 2002:a7b:c119:: with SMTP id w25mr4905028wmi.112.1582894440828; 
 Fri, 28 Feb 2020 04:54:00 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id d9sm12398979wrx.94.2020.02.28.04.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:54:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/arm/omap_sx1: Simplify since the machines are
 little-endian only
Date: Fri, 28 Feb 2020 13:53:49 +0100
Message-Id: <20200228125351.29482-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228125351.29482-1-philmd@redhat.com>
References: <20200228125351.29482-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OhIr9FD44bjl

We only build the little-endian softmmu configurations. Checking
for big endian is pointless, remove the unused code.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/omap_sx1.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 2bebab4171..de5ff447dc 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -114,7 +114,6 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     DriveInfo *dinfo;
     int fl_idx;
     uint32_t flash_size =3D flash0_size;
-    int be;
=20
     if (machine->ram_size !=3D mc->default_ram_size) {
         char *sz =3D size_to_str(mc->default_ram_size);
@@ -154,17 +153,11 @@ static void sx1_init(MachineState *machine, const int=
 version)
                                 OMAP_CS2_BASE, &cs[3]);
=20
     fl_idx =3D 0;
-#ifdef TARGET_WORDS_BIGENDIAN
-    be =3D 1;
-#else
-    be =3D 0;
-#endif
-
     if ((dinfo =3D drive_get(IF_PFLASH, 0, fl_idx)) !=3D NULL) {
         if (!pflash_cfi01_register(OMAP_CS0_BASE,
                                    "omap_sx1.flash0-1", flash_size,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, be)) {
+                                   sector_size, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -187,7 +180,7 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
         if (!pflash_cfi01_register(OMAP_CS1_BASE,
                                    "omap_sx1.flash1-1", flash1_size,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, be)) {
+                                   sector_size, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
--=20
2.21.1

