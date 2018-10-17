Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1305843wrt;
        Wed, 17 Oct 2018 14:40:54 -0700 (PDT)
X-Google-Smtp-Source: ACcGV614CtOXUU+F6A5IBC/qIVDD8xK2W4rj2y9/BVl6TE51gG8jeEIu12tnQSD2As2u+e+yrAzN
X-Received: by 2002:aed:2022:: with SMTP id 31-v6mr25662562qta.252.1539812453991;
        Wed, 17 Oct 2018 14:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539812453; cv=none;
        d=google.com; s=arc-20160816;
        b=zlW803pV1ohKsD6y6zaX53mAxGrvMl6HtSikMZWZ60J2/ep/5iTX8s/tidB/hcphMf
         YhZY671rhvQFe5gE6LR6FsHbBJUvBQrBLn/IbZr+HOzhfBOqz1mVjZw3ZgacJm5p9AgL
         jRTgRynq44RKTzzxlikSetZS1np9+MYyy1RQq00zjV/qJavT2BUu3guET2QJpi6CRuUi
         0GBJiGkEXUlsTerBKyubphiMPeevL2OVAC8v6PN8bFjGAcr3EeCRsSSm0GAvsVn/rzE/
         USbgd5G1tT+1+XWGbyu34pChZYj6X5ZH7qgYj3DAq2EjsQqCiekdOkxSJC4vIeZYJdja
         d5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
        b=fweKvXb9UQ91nlKhUozTpevooy7Jv9p/FWUJJA6SgL4zvtZPYXED945VDhXW/9cAs9
         fEREIGvrWQoVMBbIDrja+lwcN0/Ku/yAxQKlKw1R/zymnZTQ2TRXjsxuhKRHdkajDEsF
         /EitANx4sIHbY3XonGlJ4WzqxbxIsiR0jUFU8Yep2oYcfI9y0uW6gUxSYaAeLMLGQTMh
         JOTAEqMxzRZiX6cOxD7GjlGc6v+v9KszSNxES7Oj+TG3F6HI3P6nAy3Q79QyErLVOxPb
         ODB/4F3A4m2mHyZS8SbukAlcV9r1C3ilo1w5bZBkHhopWgB5+kIpN21WnIfkI0B7VFbU
         r17g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pgsJnZDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68-v6si1033319qkd.9.2018.10.17.14.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 14:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pgsJnZDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCtYj-0007L3-BX
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 17:40:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXk-0007II-Mj
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gCtXj-00084r-DA
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:39:52 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gCtXi-0007ti-LM; Wed, 17 Oct 2018 17:39:50 -0400
Received: by mail-lj1-x243.google.com with SMTP id o14-v6so25777844ljj.2;
	Wed, 17 Oct 2018 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
	b=pgsJnZDAs8eE26rzRUh4GTf1YCy3gr5D0kRsInnCwhRR6Uv9q1AXVZh/EiqVzjfP0+
	ldHyWKy5apzqTro+U/G/IosMGLQEZ2PCOSVbYpW02dEq911BRN0yj1GfwycIuqPZVAme
	2vxouwN22UQsNqGBwR7Mhv8tUez4kzxLGbDSSetBP8FEdQZzwXmsi9nKs3TGGV6zVall
	ZRXLvvzoqVNp9Ak3zFnN94wc8ZMxdKwATIpOmxYN2/Nvy8ahtWH1yu0kJkvRnLyXEbKs
	rdZbZVQVWKyZRcZp92t/4T7UvvEXXcHT6E4bTy+pxwmZAFRlUnLd29gbGdgswo8avs7P
	miMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
	b=NY5URBVXFD3ALMM5/XWDKzv1+MFQ6BxBL6AxhOczpSFjKd4Xa9xWYbkbANwWZ02mW1
	iNPrsTa4VwZjIagIqOtjhFNXKj8Kz8x4E36bs8Zjze++jyVnKLDQALVPW01wXiSxw7bk
	EfHIU8Kn9cUwCJ0KurO6+DGlFrc7fnVTtYzqicgGtFdvLkqF1BpcfNEZMYl3Ciiq8FQp
	rC5qVAkNk1/fAt20sHud5QC+IgTp3QgF6mwYQnBpSRiciJ4NsVebv8wqOR1FnkD1tG4c
	UY1S/xstHlmTsZdEI9DbdBsSJyhYxKpic7sJYvcVEa/so5l/O072hhQt9PsqggMEQu08
	YoaA==
X-Gm-Message-State: ABuFfojetHWnXz3wR+652I+IIM9GJuECGCnHsQrD4e2Mxw8VNH5Tqp2j
	00/gpy8hK2kOngC3O3Z8TCaU2Zqq
X-Received: by 2002:a2e:810e:: with SMTP id
	d14-v6mr4761619ljg.170.1539812378786; 
	Wed, 17 Oct 2018 14:39:38 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	25-v6sm4115380lfv.43.2018.10.17.14.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:39:37 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Oct 2018 23:39:30 +0200
Message-Id: <20181017213932.19973-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181017213932.19973-1-edgar.iglesias@gmail.com>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-devel] [PATCH v3 2/4] net: cadence_gem: Announce 64bit
 addressing support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mD5967hszR4A

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce 64bit addressing support.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 16a8455128..d95cc27f58 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -142,6 +142,7 @@
 #define GEM_DESCONF4      (0x0000028C/4)
 #define GEM_DESCONF5      (0x00000290/4)
 #define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF6_64B_MASK (1U << 23)
 #define GEM_DESCONF7      (0x00000298/4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
@@ -1300,7 +1301,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x0;
+    s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
 
     if (s->num_priority_queues > 1) {
         queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
-- 
2.17.1

