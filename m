Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp629369lfg;
        Fri, 28 Feb 2020 04:54:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqx016QQfYKKnlQ26Othu3CdptT+c3L1XmngTs1g68xQMauS5BmMZMuel8Uuw18IIyO4soR2
X-Received: by 2002:a05:620a:9d7:: with SMTP id y23mr4262091qky.107.1582894450862;
        Fri, 28 Feb 2020 04:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582894450; cv=none;
        d=google.com; s=arc-20160816;
        b=GexyhCQp36yc+FsdIRr0N9cX65ht4t6+MKjLASzIzQCnKmgh/GHTroDnfMX1YaE6lO
         D1rfwEs6IqpMK1ub8ZfJhMvU/j+JZpJ7LFbWB8qNWazYavMstzdWCAlm5LPY7n1oWMF8
         nrAwg9URLuc2DouChv9PsDnDwawvY3IT8ITlh7i6mYc4PgkSZzIbwZ4KCsxhRhIOlIcY
         j6CsjNd8dg4o+KTIUGhubYogCE8civdzrOe7xouUjL3XiHLFNs+wB8nnNX8mEwktfcsF
         Uk78tEC9Q9Gp71+CHZ7ZjgVo/5EHC76N18Bm91mw6BNMYIXkEXUAzNBgh1+cvMuExqgx
         qohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hCU51xFXYmUd1xKOruip+g6P/RBBcNpYeEW6REUohy8=;
        b=K9pJAsVecNf3hNPBgRVurUZ8kG17odJstBlszZfGV/c1kND9yMDGoJahAPgPVtI3HK
         PnDHJNdiOyIeDyzXhGR15URl3Hm9XQJMtvQO0jSnRq3g+e4AtterHlCa1G+gtJCp/BKi
         RgJTBxtJGh80xsQ2hwBAqZimc2Lthh1vre2JDZ03NbSxFPr5V3IpMvjarL/uo453J1oD
         tPvHSKo5HjO70sVgfh4YFGDHf5A+O6EL9zPOr/93lbX2rldOJv+1X6SFdUOMmVe2xcEr
         OumMUIe3Lu42Sqq3vX2xtlZYnRMFwh1KfSPj+fEbfznajAx+/oh2oJVIpBA2Qb5QulC+
         4Acg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WbpE7AC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si1323258qkn.141.2020.02.28.04.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 04:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WbpE7AC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7f9e-00050A-9i
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 07:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7f9V-0004xC-LM
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7f9U-0002nL-Iq
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:01 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7f9U-0002n8-Fd
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582894440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCU51xFXYmUd1xKOruip+g6P/RBBcNpYeEW6REUohy8=;
 b=WbpE7AC8HEHpMaktFAnWGHPIcy3C+xdp4CLUl3WifWcmSRSXYt89cyfYnt8CBeXEgOWmEJ
 kbaDOxgdwV2f2lcbXStm5fZoq5mKH0ed7zepBrGYj9LqLTaQyXI+sS96pp1X4dFQ+KxgFH
 /Rgp0TpcxG4ih5riPq7g7ArRmC1+6u4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-A8v_t1mQN1GaDuZwEnzOaA-1; Fri, 28 Feb 2020 07:53:58 -0500
X-MC-Unique: A8v_t1mQN1GaDuZwEnzOaA-1
Received: by mail-wr1-f70.google.com with SMTP id y28so1266649wrd.23
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 04:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=om0orcuUNcgbjYJFBk5NZd23kX2WFadmaS0vRzXLejY=;
 b=CEdlcovxhEgGjAahnRbt8zUyDcmTD7nxVoh4wzDpsJGjg2UOLbXFgIaBX7a3Qvlua/
 YeSRi9WkHt1z2pWa5Y1ciqrdCGrMipbZS7y+WbcEQuWEKUyYEy7wwtpUNTe07AG1j7Fi
 lgZ1d+jMNjIFx73CaOF6r8Rn6dNfYw5Jl/CiUjURWXEWBH/FnZicZkfwyvqPZ5IGECuF
 1DH8PZsiSBKpY7jbpCSk54bkbuLL03zIlZzRSZw6pEr2YH8QGyPnz1+ahVkFgrqPpFdg
 yfSXIpmjfKpwNdXTPWC5LYOR2ReMAiaqD3DFB+SQI9ijRBHj+V7rG7bifZV5Q929zDjz
 n8vw==
X-Gm-Message-State: APjAAAW5FOYxy2skNKG4FMX9fPjUY1XsxObTwwGrE4PKyXwYby4/fUnC
 uGn6Q4RctWaDqJFEthtawDSsJMzMR5DgoGpPjxe0Ra8E1vTw9esJHw9Oh3n2Gyoo9qd6SEwGyQj
 zWOu4s67Se2jh
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr4981726wrt.403.1582894437410; 
 Fri, 28 Feb 2020 04:53:57 -0800 (PST)
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr4981711wrt.403.1582894437156; 
 Fri, 28 Feb 2020 04:53:57 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id d9sm12398979wrx.94.2020.02.28.04.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:53:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/arm/gumstix: Simplify since the machines are
 little-endian only
Date: Fri, 28 Feb 2020 13:53:47 +0100
Message-Id: <20200228125351.29482-2-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 207.211.31.81
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NUCHs1ObVQdR

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

As the Connex and Verdex machines only boot in little-endian,
we can simplify the code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
v2: Do not use target_words_bigendian(), arm-softmmu is only
    little endian (Peter Maydell)
---
 hw/arm/gumstix.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index f26a0e8010..3a4bc332c4 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,7 +51,6 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem =3D get_system_memory();
=20
     uint32_t connex_rom =3D 0x01000000;
@@ -66,14 +65,9 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
=20
-#ifdef TARGET_WORDS_BIGENDIAN
-    be =3D 1;
-#else
-    be =3D 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
@@ -87,7 +81,6 @@ static void verdex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    int be;
     MemoryRegion *address_space_mem =3D get_system_memory();
=20
     uint32_t verdex_rom =3D 0x02000000;
@@ -102,14 +95,9 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
=20
-#ifdef TARGET_WORDS_BIGENDIAN
-    be =3D 1;
-#else
-    be =3D 0;
-#endif
     if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               sector_len, 2, 0, 0, 0, 0, be)) {
+                               sector_len, 2, 0, 0, 0, 0, 0)) {
         error_report("Error registering flash memory");
         exit(1);
     }
--=20
2.21.1

