Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5673580lfm;
        Tue, 28 Apr 2020 08:49:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypKUd8iuwfKVnWJQUVLUiIDrQH26JbxBR4iOX+AMa+uqhAPiFoz0mvgVSNGIy3jw1Qw550/J
X-Received: by 2002:ac8:44c1:: with SMTP id b1mr26697856qto.156.1588088948552;
        Tue, 28 Apr 2020 08:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588088948; cv=none;
        d=google.com; s=arc-20160816;
        b=jLu2Q3gyCPtzHBshWLl2btqqn5b/C8vnn2tkh/iOyUJE87Fwu5XliiTfKgWQmJVcko
         QY7jyGGqNnzvv/yW+bkznmxIkLX6RIfT+sf+81p3do5bTUR9u0LBgl2wIbVwfSu0BO3j
         GS3TO/T3c8sNFNPjlHgk+vlTyXAtlDo6kyHWdWIAIgYBhNalWDzpUE0JhjzsjKMOOrhW
         REjedDtQXLyRYdB/l9WE7hLzMy7HN0Bwkajd1cyE7fb6wRSYjWEilQ30/U3IcX0oV9go
         ywd5EbHD0xF0W9ZFAc3yuONHgIddQNe3WpGuBGuKvnvNM/FqvukRxGJJ+gPNOCfpEYjg
         JS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WekwITYydgUniyXF2jacUDLRb2z7FsHSDmau6DFbuNI=;
        b=m9MxfaZYR5OeEDAk70WxChGEkKSRM1WHa4id6gAGpuTJeOA47EFq36hhU5euLiIJeD
         VsWn2z9GmeSWr7yMQldWwM6rttyow6/ZruG3j2Ua3I+7Xqkxc89nBhbL8Z80bUeOEguS
         ewQM2Rj3Lneb33vf99HUW+Vns8+Ek47VZ6fFKSIB96Kx4Tmb2yFQL7HoN42PAn7ZI07d
         Y4WipMlyDpSZYXR/S2FtNYHzw8tvKYIWkcQNorpSLuWGQ2ILorRb/yGbwezjafaXbU8O
         prgai/thQ8iPYcn8AFb65nW5uCVBRKzbxKMACYbbB6mxFtiQ5IllOEEdhvXpAi0PNlQU
         tZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArA3p1NN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si11399859qtt.84.2020.04.28.08.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 08:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ArA3p1NN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTSTr-0004jR-QZ
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 11:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTSTe-0004Zx-7r
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 11:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTSTZ-0005dq-Dg
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 11:48:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTSRk-0003dE-N2; Tue, 28 Apr 2020 11:46:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id r26so3440949wmh.0;
 Tue, 28 Apr 2020 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WekwITYydgUniyXF2jacUDLRb2z7FsHSDmau6DFbuNI=;
 b=ArA3p1NNIcKpe2Ppg66K5N3H6H8M6FQbh170ipLfbW+PFfLvxdIgr21zr3DoWVuYxC
 GyHhuhn1ECyvONSwIUDNs+U7CVVGbOYQdKpnnGHBR/WMRW8qCQhVIJj7weiLKP0mNjQK
 Upu7e7PdG+LSq+Q+MKHSITiPL9OwNHxLIzbt9u3DJcDhq0e2wR+k+HgB6e8lEaug3Mlb
 3n3mu/0xLdEoDOiFVBvhdiB+WJ44hQ4ld0e4+UIzbR72FOsuWAMsWuJUrLMSgmTNeCUv
 Cn1mMxJXTserHMzisV+PhKa3H+4QN6Yl7iLkGxMB/FPP2bF59iKKtzyB0GftYNsa5dtU
 6bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WekwITYydgUniyXF2jacUDLRb2z7FsHSDmau6DFbuNI=;
 b=EhfIviKSxtBFjepT42DhWIczCF/KVA2AE1XnC9wqh1i9HUu4ZaklGWQ8PKLq/AYlPn
 Y9jxMMMg+UNPttN+6b4h/dpagS0kLZI7MrnCqnuoL4wqcUNqhBHdEYUuOgk0Hg4Y6s3N
 DLFg9tem2FWQbTM6gLjk5cYohakTDSzYOkOEuEI8U9CwrmOldRFl1auWIffJcLZC69bt
 jcTopITrTV4xtQbRQKusnbJmEvG/FSBsdHDzRDL/9f9BI8fEY72wpTYPqcOSXl2fyWE+
 FwhDXjtPDz2zof2HjAB4c4RXH90yNYzYLXAvvzpKfSM9d6bE5hg2r0lT6Yg1wN9fseYm
 eHMA==
X-Gm-Message-State: AGi0PuYUCAqN0COooBEfZRB9I7mXnOpVqSFzFSo0YCHwqJ95GH2Kiwts
 rsVPIYPIuvxfAXjHta0L3lCTT08Y8WM=
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr5448147wme.77.1588088812969; 
 Tue, 28 Apr 2020 08:46:52 -0700 (PDT)
Received: from x1w.redhat.com (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id p7sm27339428wrf.31.2020.04.28.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:46:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz: Use TYPE_IOTKIT instead of hardcoded string
Date: Tue, 28 Apr 2020 17:46:50 +0200
Message-Id: <20200428154650.21991-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8i3DJYUrx0d

By using the TYPE_* definitions for devices, we can:
 - quickly find where devices are used with 'git-grep'
 - easily rename a device (one-line change).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index a8dea7dde1..2c43041564 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -395,7 +395,7 @@ static void mps2tz_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
+    sysbus_init_child_obj(OBJECT(machine), TYPE_IOTKIT, &mms->iotkit,
                           sizeof(mms->iotkit), mmc->armsse_type);
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), OBJECT(system_memory),
-- 
2.21.1

