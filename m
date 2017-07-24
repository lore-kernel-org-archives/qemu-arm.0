Received: by 10.25.44.15 with SMTP id s15csp4195879lfs;
        Mon, 24 Jul 2017 11:47:40 -0700 (PDT)
X-Received: by 10.200.3.80 with SMTP id w16mr22499322qtg.325.1500922060136;
        Mon, 24 Jul 2017 11:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500922060; cv=none;
        d=google.com; s=arc-20160816;
        b=inoFcfiMCHGM8dGvVQtklD2ov/J/8mDQDQo8Vvbtt/4CczZX9/YKlWqo36kD0N9GQA
         TG6aZ+DXIxihcou58mxK7vptHI39ipx0faRibM706O8lSGY22tW9BwI0bjbamZQG4Kz5
         WNt6Tdznvd12Cstoa1p7/vqK/G/OxOVx321I0+syq0E/On7GBno1/Ha7LG+LEJFjkBo+
         vY/xeeLCz+ysF8h3MfGFlHfN4mfdTTuJZq2qoLC76Ah0XVgA1EFCRwYMF3zDz8fyyRK7
         D+6r8uD7z8qPuQReC8oB5jo2Npl46iv+yHsfS5p00OVDXShcGgSdtlI8nJ2CjKcNdDyN
         YKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=NTAK9W79+iqAA6Kr5BAWdSwRBWdgv2jcG1b/j7mz1M0=;
        b=E2kS2znYYez221yi87XKQ6Kuy5BgsKRpZJ1ijmRRD8TcKE4EkgqBW9uOI50SYfAK/l
         Tkv7dB0hYwR+gjvgGFmcmEU6ezaoeISvXLR30QDtIiSG0/xPTrTwF3bPKK+6xKSXdgS+
         f+znVU3VNeUJWomPagzL6KL2x7Q8A62sfjxyd6DW2YzuZv/eM2APMy/foH06t9g85kUv
         3kdw3EbDOLDzsy2Z6mk4GlHa3M2vwcomf+0r5F1qPEwXGFjg/5bJSgRSUK3bDKxkQ/b+
         NsSnEH7fWjFj13BJwRw9jusgBuwYouJkBQkwjCRcCardYUQ7qRKSAPchQTfJOZLisuK3
         x/Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=DfZttV65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si9297363qkf.482.2017.07.24.11.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 11:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=DfZttV65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZiOH-0007bR-Aw
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 14:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6S-0000jL-6R
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6Q-0005Mz-0V
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:29:12 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:32996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6P-0005MH-T8; Mon, 24 Jul 2017 14:29:09 -0400
Received: by mail-qk0-x242.google.com with SMTP id d145so8120924qkc.0;
	Mon, 24 Jul 2017 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NTAK9W79+iqAA6Kr5BAWdSwRBWdgv2jcG1b/j7mz1M0=;
	b=DfZttV65RcmZnlymw4wDiv1zGJN2DVCkmngR/gThJOl7l0CM2jnMgW7mfYhIn73/Bp
	b8XXVxvgK8LQCtio7bo0QdAJpP5aVvGH7QWmg0e0eFsFG9jtP9oEgQY/Q2Srct8XD8W5
	6MKxqOm9pCm6n6NrUm/J2qpprKuK/cmSvK8jNItLtf/dAV/QrYu5dnMtzx3gdR+zx9CF
	m8+Cql+gCSVWfZyvuAUzhNfJgEHoqliZ4v/gwUVpAazgEA/i6Hy5kv5ReEWvF9xgLng0
	w0Sy5R3CE79mNxHcWUidXMvXI34zVFcTB1VsGuavuyV5zOmuDyoCC7Ck291UkdBX/Ydo
	tmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NTAK9W79+iqAA6Kr5BAWdSwRBWdgv2jcG1b/j7mz1M0=;
	b=ptNfdWPAl5/bea5SNgzp5OnNVquJlmZDtYmiPVCO6O4EtWEll16XLyBId3raOcGBlt
	0jkEElnnV05lHcLTKfTdX6hvo8lc7FojKqrSYamcaJAphuoDNdhrikcxZp4BJZFT/T1C
	2lfXBiDdWmR8MVI16MtN/ND2lm8Sjc4LSt5/ADWCjd5Nq6Zf1qyr8CMKmZfhZlCwYRgO
	HfPexxGqSQQspweVqTSk4/fOqz0rLtScv8ZsWniBlhynbYGMAmtS1xbMFDjlJf4wMyl7
	HDZ4OD4/kKqlAiDCteOWuWj6OwEjpTpHPeRbv7HTeZPQ/eEF4UgOgtmHYUGMBognSnzI
	j/4g==
X-Gm-Message-State: AIVw112MyLFLHYr4+V2AhplFMPxNEAy/DRAvrrRiXDQGGhkoZ9yDkEKz
	urGlsuUtuQiH9A==
X-Received: by 10.55.183.65 with SMTP id h62mr1113412qkf.35.1500920949426;
	Mon, 24 Jul 2017 11:29:09 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 15:27:37 -0300
Message-Id: <20170724182751.18261-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9arhmuHFJhc

Use error_report() + exit() instead of error_setg(&error_fatal).

hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node_path') results in a null pointer dereference
    if (node_path[1]) {
        ^~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/sysbus-fdt.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index d68e3dcdbd..ad0cc49b19 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -315,15 +315,14 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
                                    &error_fatal);
     if (!node_path || !node_path[0]) {
-        error_setg(&error_fatal, "%s unable to retrieve node path for %s/%s",
+        error_report("%s unable to retrieve node path for %s/%s",
                    __func__, dt_name, vdev->compat);
-    }
-
-    if (node_path[1]) {
-        error_setg(&error_fatal, "%s more than one node matching %s/%s!",
+        exit(1);
+    } else if (node_path[1]) {
+        error_report("%s more than one node matching %s/%s!",
                    __func__, dt_name, vdev->compat);
+        exit(1);
     }
-
     g_free(dt_name);
 
     if (vbasedev->num_regions != 5) {
-- 
2.13.3

