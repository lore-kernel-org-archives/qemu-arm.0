Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8953547lfc;
        Fri, 19 Feb 2021 03:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxID75sjU/E93/4o6UlPFANrtZBAbK3R24sLZZaXMBkxIoxufOIY2rr7JQd5OxwDWAqjFFG
X-Received: by 2002:a25:4981:: with SMTP id w123mr13160903yba.123.1613735600316;
        Fri, 19 Feb 2021 03:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735600; cv=none;
        d=google.com; s=arc-20160816;
        b=j5WzRfoDGpwLAl+BR8w08irP9qunXFM3wFVbZjoz0xkIPhCHEbYHBUDbwyk6yIkVvl
         4SPVN20rXrOCi1YX6DByWxgafEW+rsKtq2iB9N2c6mJqCK/a136zfUPSgOyXaid3rdSz
         dAdJayftsbsGAtEoeGzATk15PIJqxNbwaEnCv2OXwkvCuJOxJn1dQaNXqEpjeU28SuFq
         ASoI2dmURgBhZJdXEGPe+oj1CLeDxog2V9TldHNgeF0EQ+C6gVCUQ3tsm038K+atODuk
         AFfHfhr7Pi9iKHxjzTT9RhfSrbFVg5lOMymwrNzh4FdelCFQt7gyxjepnzWGlBwB9RKP
         /afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ehU3rFuRVd4QZVwHIfWveB91vZLKzZIejCbnvo8QfBg=;
        b=qIW3i+HqqLY5biOtVGSxgaVksmieBvALXgYHPnKwWR80D1oOrGnz2rsJE+2yVPj+YV
         8P+RjwyUF3VMZNaBQ0dOD9YhjhcD85yavxvyLm57H17SWwz3QCr6lgLBTi+ej/CttxlL
         6zXWF4IVglNGS7QUIaaRZclvuDYgpia8iLjbuWzS2uJIlsLfFIReShXyJspcVuKxBnLw
         E+NxtaGlBjcWNMTG4RybbIwb0cOhuulsAfibuC7bLexwG0+ekyi/cKocAj7GWp+Mg7AC
         Ia51Krn2b3ajU3wUich6zq5XuTJvuexUlJKunpSBWlns1QJc6Uc9ns0VPEOSu9lebjAd
         Ts9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bINQD5hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t62si2420598ybi.34.2021.02.19.03.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bINQD5hv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4LX-0004wk-Na
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4Jm-0003kl-QI; Fri, 19 Feb 2021 06:51:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:32770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD4Jl-00051E-0e; Fri, 19 Feb 2021 06:51:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id 7so8031481wrz.0;
 Fri, 19 Feb 2021 03:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ehU3rFuRVd4QZVwHIfWveB91vZLKzZIejCbnvo8QfBg=;
 b=bINQD5hvj0P81p6E1UpMuB8p0R4+IHraVebKu0VlGnCqp4OZPTJKxQzVbLLtKEkoNU
 PB79Ed3vdKCJFk56uMk5DObvWIMAA/DMvavKdW5cBZyCNElRnazsw+WbLiZxTShyZP7C
 MxMFebi0q8YJo+1V6uoSGVinEFYCHrkQnO2mP9VZfORwCrHKNqg8BaUPjCV4WiuDl4R2
 03I2xLL2EyoyYgCbeY9iy2AoO3HX7+S3j09JYxCg/+yqwkmSODi/e9CELXCUiQWj185y
 9Eq5UMbB1FjFZbmRxocwDjpxOvD4HI9U89lMxI+Y3paHojmBloooVEXTLXMmfsEYHVyi
 d3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ehU3rFuRVd4QZVwHIfWveB91vZLKzZIejCbnvo8QfBg=;
 b=SI8jhNCuIgDyICrtkt8hISrTSjoJRCFjh9mqVP3VsuOG8KWHAtkQ0aq5XSbBAcD0md
 N7wWOtPJAyX4GKLzM8JpgnnlGuKp8eBHb8paZqmTI7z72XK2KbjHv+ZDdeT1BY7C6++H
 jc+H1OQWafkNL/e4Sk8sb/Yv7V/6wd+tKhUKmWAFdR4FseC5WP11H6Lbt3KCspLy5tlr
 +M+cOvFF877NJPUKd5s7tUYJh3K9qtn1EyBX2rkn3jgXZ4SB9DFZGIXgSjGv9ooYWKnr
 UgKrAZ2qjZsMlzUxRatuvucVqGvwviyouRCFOOXabtmgVYqTnFN7CW8b6WC2TUNi3+3U
 3bYQ==
X-Gm-Message-State: AOAM532jW8nqyabwafOVfzIngSwHnFDb9sZs8clkFH31Hb0RhqLtUIzc
 ZRaF7ClnkQAqDpsGOTOs07kiWy9pE+w=
X-Received: by 2002:adf:de91:: with SMTP id w17mr346705wrl.341.1613735486298; 
 Fri, 19 Feb 2021 03:51:26 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm11934542wmd.4.2021.02.19.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:51:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
Date: Fri, 19 Feb 2021 12:51:23 +0100
Message-Id: <20210219115123.1938686-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w1bWhoELJ9eT

We hint the 'has_rpu' property is no longer required since commit
6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
option") which was released in QEMU v2.11.0.

3 years later we feel safe enough to remove it without using the
usual deprecation policy.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/xlnx-zynqmp.h | 2 --
 hw/arm/xlnx-zynqmp.c         | 6 ------
 2 files changed, 8 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387a173..0678b419a23 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -115,8 +115,6 @@ struct XlnxZynqMPState {
     bool secure;
     /* Has the ARM Virtualization extensions?  */
     bool virt;
-    /* Has the RPU subsystem?  */
-    bool has_rpu;
 
     /* CAN bus. */
     CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 881847255b4..46030c1ef81 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -443,11 +443,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (s->has_rpu) {
-        info_report("The 'has_rpu' property is no longer required, to use the "
-                    "RPUs just use -smp 6.");
-    }
-
     xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
     if (err) {
         error_propagate(errp, err);
@@ -646,7 +641,6 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
     DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
     DEFINE_PROP_BOOL("virtualization", XlnxZynqMPState, virt, false),
-    DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
-- 
2.26.2

