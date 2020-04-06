Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4240182lfi;
        Mon, 6 Apr 2020 10:52:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypKeavJRjMnYHcOT/Zfi5khKIgakKVBGwJzZflmOYbQfKVQyscSczlS/PqooF4BFyCU1nZ1Y
X-Received: by 2002:a37:7c81:: with SMTP id x123mr22378400qkc.287.1586195551070;
        Mon, 06 Apr 2020 10:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195551; cv=none;
        d=google.com; s=arc-20160816;
        b=Mo2x5pqSFZ7CHEJxQCyceHW1Q15Z7PLD+fZns05irheDybKG1dQys7wOIFpmYk9/2h
         SpLH/FqQasP1LeY8opv0ZE6YaH86wT7tMaYAKCNNa7yCYIyp/rR/pAPItvEUHTyAc4jF
         768l6+X72aUfmiMrBxQjQ8vNZUG9IUYxekeNs68SqqWlTI+KWq0kz+qXwEWeFsT4gy/B
         b8FQ6LkH2U+Xg3fUHkIkjLKYM2aDDxMXE/YS4IhGc9U88DBEGFu8GPAr8HHmq0LhGP5j
         qBTFFLTOp9G+YEYCCzOdrqF0BdY3pE5eC1e23psU+5byvQe1Rlv1h6YLG7MhPzKmrci5
         niLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
        b=ZXEe0yCMaUPrAisagHWHcb7Cz4u/Zdg029CS3Pv8J68lXVSiuRALnffpsuCiFikqVL
         asjXsvXs5qOZ2zKjjZqQwbmtKSrfxMVfQvlV9bQjpAYslzOrnfBNwYmGjuUYi4SPFwFX
         smjX3ezqb2zPldYaME0KPbIduxw0km/ISlKGxaiZbcgO3VniFE6jy+vhSqUPPxSUTTZJ
         UNA2j5CUf49mxbXKLn+WE9aeKshqWLfxEJBNWTJdoS0fFZ37SLj54r+Z3F3XYokSqj07
         q8NYobw1WZW+gc0jGZfD/8DQPyEVlSMo0xsWyVk6DsE6Yv/cS06iJhuUNYzyQI/s4ayv
         JrKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IdbN0w1D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si339637qvx.170.2020.04.06.10.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IdbN0w1D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVvC-00005N-Dm
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqr-0001c4-CN
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqp-0001ib-9N
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqp-0001eG-2n; Mon, 06 Apr 2020 13:47:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id 65so540387wrl.1;
 Mon, 06 Apr 2020 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
 b=IdbN0w1DfyFRmQULHoZhV0M1iy18Px58Xe4QSa0+fV5j/PXebmm4iK0aPGHkG7QhHt
 75WYS/AlPf9ngiydKa/rTdmkMFYPcVlSzH1fWv7gD9LQnEH6aC6bHjcTdrG76n3QqtCO
 S2u8cmvqj5Kj2GsWsmTDWKIgAPfJCAoMmjHSO83NsBEY4J+6GJ5riYheTxeLop8pdnH8
 Her01QU6fJVAJmCa7n4Hwmv5RhVaFQYKcGFpc0ceNNQykLbvLNIJ+ovQJJ/TBan7xOvz
 2xB6baViv8MUF2K2wAFaXctRTt+RhKRAKBv75omLW3kPGDlhECyK2MYylMHL/i7CycHP
 JdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
 b=ClYKBfo9iKIctdKAaI6mnPIYsk998QmgkUb2iZkAVwimHgEotLZm2JiRfTgRbZSfjD
 PGtYXu8FJwTxe7lRAn6r2sfm3AmMxafmzn2ttCEAi4kdT/pW5fv1Vd7FDvYm+o2tyAns
 qqyWXC7UFLlMVA2gB/m8NHEfUhg1743HMQcT8BxAudpBUoB1uPWmhLx6vgphcF+qLCe/
 SAeGT4L7X79nzQ/ORrYlAlN9SVbCkDg/y/mcciPD+RI4rhXn3zdnsUoOABDZNdqyyIBb
 UylXsO7enS59a1MuWuDANNVxANdHuD1wL8hq+4EUUn6VYOkNjyW4gHxxIg/85OegrELp
 AOGA==
X-Gm-Message-State: AGi0PuZ9esMufHiZB38FSuxnk48nCVyBHBO+YM/MgryM7CI26NDUbmdS
 ktyNbi0hLcvr1SoRk6/bYwMKEm7tkCo=
X-Received: by 2002:adf:a308:: with SMTP id c8mr390720wrb.302.1586195277554;
 Mon, 06 Apr 2020 10:47:57 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 08/54] hw/arm/fsl-imx6: Simplify checks on
 'smp_cpus' count
Date: Mon,  6 Apr 2020 19:46:57 +0200
Message-Id: <20200406174743.16956-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:SABRELITE / i.MX6" <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PpbKEHejzF4v

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/fsl-imx6.c
  Fatal error: exception Coccinelle_modules.Common.Timeout

While reviewing we notice the smp_cpus count is already limited
by MachineClass::max_cpus:

  static void sabrelite_machine_init(MachineClass *mc)
  {
      mc->max_cpus = FSL_IMX6_NUM_CPUS;
      ...
  }

So remove the check in realize(), but still assert in init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 13f1bf23a6..3d37352b08 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -37,10 +37,12 @@
 static void fsl_imx6_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->smp.cpus;
     FslIMX6State *s = FSL_IMX6(obj);
     char name[NAME_SIZE];
     int i;
 
+    assert(smp_cpus <= FSL_IMX6_NUM_CPUS);
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
@@ -121,12 +123,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     unsigned int smp_cpus = ms->smp.cpus;
 
-    if (smp_cpus > FSL_IMX6_NUM_CPUS) {
-        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
-                   TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
-        return;
-    }
-
     for (i = 0; i < smp_cpus; i++) {
 
         /* On uniprocessor, the CBAR is set to 0 */
-- 
2.21.1

