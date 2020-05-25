Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1676051lfc;
        Sun, 24 May 2020 20:46:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK9Ca0XelfhCp78ADrHocUaH7WhPkTYVkmFh+CMGiaOHIoKdqEKmH06o+wf8NBMuY/AT6Z
X-Received: by 2002:a37:a9d7:: with SMTP id s206mr11417383qke.6.1590378377254;
        Sun, 24 May 2020 20:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590378377; cv=none;
        d=google.com; s=arc-20160816;
        b=tzZ5QAKrHRaKKSyZ++Y4oFkT78/xUZP1y8lOQ275EHtmuLP8wOyRywxjQWqeZgYbVB
         6FxzFoM89JUmJghpbTwK80qpcYKlaf0Q7kLL4H44bX06cXNEM+MI7G2/eoMyVqjjkEvG
         oi9CwA2lStV04SPL9prV0hy7T9KFt4Wf8tNbS0lKiwGvehBw7X+/MI4zUuup9OyMehpL
         W1RksV/PdgwcarKX1Ze7q9ukFlUjGr9dE86QlZQxeBtAwEIJFcLIP+T34+deRymM03RA
         wPkTdHSsjt3p3PF97ZqlEadtYVcg0xLGbH8gJlV1bbIrpRo9wvZjLCG8B3L3HFr7a85p
         xazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=db/d0pBfWleUK7liSAo4LtpX/4+ln+wNp6AlFQFcv74=;
        b=gC17W4a/Vac3s7TQiFCmpgSpzQe/XsThYeSNeskU0NSVQcJTiC4SPfbXQ/MF3f6urP
         FBDzQ0jHWZ4hBzAxBXSQrmgCiwvvobPYCTh+ycALjimdUUWCb+qqoOx3c1z/jtDsX5hN
         ZiCug33UbwuavCWZbsBeILPWXYA7ylmmv+CddreusQTnSodMhbSDFXf5raWKBCA8ncJy
         fxZ49m9c8IBB1XFy13PJsDCbB0okWCZ7Oa94wCjFOweotRl3MyIPQZONZ4bAiqSfEAdO
         gXezXYq2qZra9t1AQOL/aoV1nilmjemVHm/ZeBsi23WKsWf+Exl2xD90ZIFUkfN2FVVv
         GkBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o9bak53e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si9544876qkg.332.2020.05.24.20.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 20:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o9bak53e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jd448-00087f-Lk
	for alex.bennee@linaro.org; Sun, 24 May 2020 23:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd42y-00087Q-ES; Sun, 24 May 2020 23:45:04 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jd42x-0006v8-QX; Sun, 24 May 2020 23:45:04 -0400
Received: by mail-wm1-x343.google.com with SMTP id u13so5351792wml.1;
 Sun, 24 May 2020 20:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=db/d0pBfWleUK7liSAo4LtpX/4+ln+wNp6AlFQFcv74=;
 b=o9bak53eRsisYbEBkvwpBMJZm5yvs45djVC33gB0OaoBcDrzCgIS8v1PrAWhv4QYmv
 EtpVBVhfkXmOAlvR/F0G+xNx5/DzfAOyYInLpYtAP2/CxmVHvvxuWTnBghWQ++igUBxM
 W4mxy5u70983w6XtaIA0cxsFKr3SAdSVAW5umLbdibCgqcFeWFRk/HCcnxe9zV0aHq4G
 uhQS5S0445jdM3SW9Rpn2isFP4eCSxdo5D5v1PVrCwt6Hc1/JxIO6EdeRJzJNHTCBLre
 756DXT7qQXibVpRFMOsIvURJM/Zfy0hFct9JqZY+EyKVMso+mlqTKm1IByH6X5/OLmbq
 Bk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=db/d0pBfWleUK7liSAo4LtpX/4+ln+wNp6AlFQFcv74=;
 b=k3ilFcCFuSoYz8I6Q8XzuWF1KB3qaBQLdiemY2KKPWkR9eYsUIPu0q8TcvJK0wnLo5
 B5nJyQjSgVWDtBfbTYoj0hMvI+odPl7Kfs+LZE8W+YFDEu7JDSDFJnCwQxSLwVNFc11U
 DX2IgA+cqolchETSa2cmNvqdQwai4R2VrRQv5dYFuPxXaDdiH43TOpCRjNBp7qQCOIZ1
 cML6jKT3kFNUbDwzbZ9r5KvyKtbXX8HHDGeAQxfL8NHRzWTdnC8UuqTe/U0W/0dkJN7J
 GYh49R0sZ80QkAafVnhOIJ0Fq8RXgUaStcm3lyXDfzXPQLToy1rFNAjTFQalHB70PFVZ
 g6zw==
X-Gm-Message-State: AOAM53080SZxj+xEPO8N0ovNryCdeVPchfdghQUF00FPnVvEKVgSvfqb
 GOAmrMQehadQujGtGAF5TMNeQjL9eyI=
X-Received: by 2002:a1c:a5d2:: with SMTP id o201mr16184821wme.27.1590378301297; 
 Sun, 24 May 2020 20:45:01 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id n9sm17555150wmj.5.2020.05.24.20.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 20:45:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/display/xlnx_dp: Fix memory region size,
 improve logging
Date: Mon, 25 May 2020 05:44:55 +0200
Message-Id: <20200525034459.28535-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p1jwR6s3Cvf+

A collection of cleanup patches written while fuzzing
the Xilinx Display Port device.

Philippe Mathieu-Daudé (4):
  hw/misc/auxbus: Use qemu_log_mask(UNIMP) instead of debug printf
  hw/display/dpcd: Fix memory region size
  hw/display/dpcd: Convert debug printf()s to trace events
  hw/display/xlnx_dp: Replace disabled DPRINTF() by error_report()

 hw/display/dpcd.c       | 20 +++++---------------
 hw/display/xlnx_dp.c    | 14 ++++++++------
 hw/misc/auxbus.c        |  2 +-
 hw/display/trace-events |  4 ++++
 4 files changed, 18 insertions(+), 22 deletions(-)

-- 
2.21.3

