Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9074695lfc;
        Fri, 19 Feb 2021 06:44:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB8ZEPKuiw5kqF7FPD8aV0IZ8znztFigNF+h/qTaH6ON6m2KayGck/JOuZbxTGTzxvP0Me
X-Received: by 2002:a25:3fc1:: with SMTP id m184mr15204453yba.105.1613745881730;
        Fri, 19 Feb 2021 06:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613745881; cv=none;
        d=google.com; s=arc-20160816;
        b=0cNdaGTF+70311uvT2C5cytXHSIDzeGCDnZ35C6HWgKMh0PSv+EV1HIKu2F1a/BpHd
         BUtPN045TVSD4jSt/rSLrv2cgfXMeyLUvdQLOKhBLaiZdy/T2P4k8a+zc1kMJC70ORPC
         CLxldwoVySBahivx+55SSDAVPTy76C+r8iQZMScRwiL9WxFYBaW7dpQEKySh8fQ2Z4PB
         hRv3+AMA65yIT1mQyhBjkNZLYQDGmGFunuvn2TGuPqbA8QORJA59/e/eNW7fS2myb470
         KBpLyyHA5nDf5hS9wpRH2GyQH7XS0WUP6FgzaG6Xhaz091Vyjxhn8SubAHoW4xOIk4mG
         RhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aHCgSRZLeBErlxsFQTR8al0Db1JIpta/9oAzTWbZfz0=;
        b=iTKkFW+5gvaKQkhnyy8/QcQE4MlxOX17BrwTfqCNSuQnWvvkTdkjPTzCEwTgVq0Q70
         t/9hxBD7bFZu4GOQIksVKZx0q/6MGl09A3M9nRy9dsdUa08IYaHtyCeIUIlTer+r/6Ik
         XVeDomBOsbovG/rEOmu9p/lib5gDANXw6xMDPzZrC5Be3FQ87lAhM/TIYGt2eXZaV6dq
         WAbRk2PJONyjJKhjOZEISFZ7BuInLjgYkdgWb9mBKsxXRuXBLyrIg09c2Qdnm5yuy3zD
         uQPxMwUrKFiWEqUF8UI2+EduO/M0UDpTdREPoapZO63s0TJ43VOxoHWfufaHv3J5ldqs
         KW1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dME+3uf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t62si2743322ybi.34.2021.02.19.06.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dME+3uf2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD71M-0000gE-TV
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD70e-0000cc-0I; Fri, 19 Feb 2021 09:43:56 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD70c-0002LC-EK; Fri, 19 Feb 2021 09:43:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b3so8871994wrj.5;
 Fri, 19 Feb 2021 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHCgSRZLeBErlxsFQTR8al0Db1JIpta/9oAzTWbZfz0=;
 b=dME+3uf2unXI3bFqf152S2zkPGamHWDasjHkpnz0XsqQ4lo2GTcJc8VP9yn1eUvGtz
 QfW+Em4/8EuQySdzLQyMx/SrB9SIpcCxCVZvi+zyn1ZVKqjQxx8sSNkJq7Ctc03uYA+9
 Kh+Ir74tVNmEkC2uMj6x1+fbNp9GPkw3yqMCIsiuc0kSa9IxQEfM8/TVPZEkws7Vcg65
 L62hgtReQAVK09BPs0LiUjAbeV/azI1pN+MCmxVOsTbREdNRm+Jwj266p4DQWSZM61uB
 s/zumAH5jCugMO5EF+JmIcwwgowAonDNIlIrm42iawapG6PXVLrQNpeNwg6+5QlHHdNv
 7j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=aHCgSRZLeBErlxsFQTR8al0Db1JIpta/9oAzTWbZfz0=;
 b=nfF6M+B7O93nrsDSXyBiBJVmJ2dgYTiNbNHG441as/cFx7gwSs+tkedxLY+P4r3hZI
 Ytl6ZgBa0MJ5XGn/nkO63fVlVncKXEL3fogGpgXxDnANUhFdQVcZOD5A0zcIDPkHoVnw
 sWlUOMF0kaR0iPU1+HC5QTOdtzIIRn1ZXO/x+udHPnaYGUgY1jvdQCDbTm8ze4rAHBEr
 4FTrG5yMTDboAhRt92SQwfelvIv+5rFp4MBCcLah1rmYmTW3TPfvCY3TaE/aauq4ETAo
 bvpDlClklMdI/AjIdqoFjwlWjWfCOnVXQfKG07tpJUNN3tt0PdQ83YgqSTZZRKFhpE2x
 aEYw==
X-Gm-Message-State: AOAM533sdd7cjzOjGA/MozROmso9QzENiXcsKip6rW9LRCpjE8skiFr8
 iLLiQ3DkNL1AYFNuzg5CVrRPDs2I9ao=
X-Received: by 2002:adf:ce06:: with SMTP id p6mr7924067wrn.406.1613745831840; 
 Fri, 19 Feb 2021 06:43:51 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v11sm14007744wrr.3.2021.02.19.06.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:43:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
Date: Fri, 19 Feb 2021 15:43:49 +0100
Message-Id: <20210219144350.1979905-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-TUID: ClQjHifwPpMW

We hint the 'has_rpu' property is no longer required since commit
6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
option") which was released in QEMU v2.11.0.

Beside, this device is marked 'user_creatable = false', so the
only thing that could be setting the property is the board code
that creates the device.

Since the property is not user-facing, we can remove it without
going through the deprecation process.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Reworded per Peter suggestion
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

