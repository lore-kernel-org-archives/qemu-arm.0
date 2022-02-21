Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2599265lfq;
        Mon, 21 Feb 2022 01:50:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKB5G0VTZcsx0GarlDXlKp6QVwMPde2B53lu9AhajP1wgG1T//5K6oePEkwHZJ7mOOxeAm
X-Received: by 2002:ad4:5389:0:b0:42d:a3cf:1b67 with SMTP id i9-20020ad45389000000b0042da3cf1b67mr14674048qvv.129.1645437027162;
        Mon, 21 Feb 2022 01:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645437027; cv=none;
        d=google.com; s=arc-20160816;
        b=veycRS7tW4I38Ri4BuzAjXQh5SVAWiq/TtFBy1vKf2MBDu0/xaGlCPojVg0Rf2vSrw
         cKT9noDhRFuK8xPb0L9P0UPRR5EbhVT5RUL0qvJQcghUIS/CRvhvkGxQDcVU5Hkr5tMe
         9zczd9a24N3sjpHNYL4FRhJk3OKEfvgvcQGJ70tnymlo2vQTo1Tc4uRENXHoGOSATDuC
         ujY0UfPPF5YjsAJT4dCjDEvoWwe4oTz0+a3lywdFFx/cgNLognvgqGg8Bl+IRX+KBlXw
         FbZZ/9VIyAF8K3YrbDdRNMOFaqTncn3TtvOxpz/UrI3LSH3C459aOFanmf4mvZWXugXu
         Mglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7VoKaf7Ak3GnWDSeqTu+jT8G56c8Do90Fo0z2JjU+DI=;
        b=MO/qzz+ZsMZvsHnj9crgKKQt6exvpeTrd1969mdC2cQehCZS+ZDuht9nfnx4FrpXo9
         e92oNFVdv8omU2l3Y6U8QPQTFO2qez7VkOz4Obb9ixDtFbPRhkp/Z7zI4Zr1hNFjjMZk
         I3A+Iv4oqnRTUfaR52KL2E9TM0nrv9Cz8cPGLFzrXY+uaxKTcythohJOVc+O6EdNvXWn
         6/Ys1ITkncL2oYSEjteWfEngzX3hyiz83QXnHIoqLxQmImXbcPI/jlm3U2SiAEGUvOxh
         TmIEMQa9CKV6IiBFHsHr6XqAcRw7KMlPoZk2hLyYZaG49Rucq6Zdxoq4A0J4FNd61Gdn
         sdUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbtD7x6o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si11368712qvk.369.2022.02.21.01.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 01:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbtD7x6o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nM5Ks-0005IG-JE
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 04:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM5CY-0004on-9K
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:41:50 -0500
Received: from [2a00:1450:4864:20::42e] (port=46729
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM5CW-0003F5-9l
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:41:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id x5so21101699wrg.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VoKaf7Ak3GnWDSeqTu+jT8G56c8Do90Fo0z2JjU+DI=;
 b=qbtD7x6o9V33BSZRPvYk0pgmI7tCuRRtk+8pujO6Qhd4n7sQrlziPSxiDSx9feeeSc
 Jf4RpLJiHMb5EXrsGkhu1sTCube07+4VRLUc+FH1lIm+WFrYbZvGj3JslMq/U/w/F/j3
 V2UwZ+vvq7dApnj75vLDUxjWZ9baZtd3VpFIbqxw47yJYY0XVz3m2q5/VL+UsQp9y0mO
 vkwHUOxMHaHSmAduAwvKTQlucOs6FjQ97JBQZkcxjiY3MPfUfaSsoV9/shdGVlZqELh2
 wCKy3BhZn1VliT7hmMdw2+8kEjV6X8IpfbINbZJmInBGulmqWpiGbIpiYwo5o2wtl7y9
 h/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VoKaf7Ak3GnWDSeqTu+jT8G56c8Do90Fo0z2JjU+DI=;
 b=OMY0FLf3+TqNiN+RerGcye0xqA3JOiTAFS+1gDgQeAi1CSE1hLV+0TYxkt5xQcxgPW
 3HJE2bvvUIx02pVoIYXtZPQrG1wMa/+EWFj/Ns6+IEaWNWwNheHn+S8Gm58arHsBQuha
 lShOXBnhA4RXUYVC9Fj1ww0mub3o5HYyrP6+C/ZP+Fo02nMpXETSwRGK7maCrDmzhdAA
 vWPvYPWgzi9fNd0y2unmJfG+Ha6MC7oscVA0/Rul1hV9nViC/3dTBwx+cv3ozUUxxg5D
 p8I7mc9ui7hsyjUFyri0kAt5jDPV9Cvq5u9Co7Ud5y587hlcND8pLf8mkntOEMAqPYbb
 AzOg==
X-Gm-Message-State: AOAM533AfraqEfS3P62K53mBo4MZSfQoSTQQC1nORbRq3AowGjCzvD2S
 7KWxM9NrDpZifZ1+OIMiZmw/Yw==
X-Received: by 2002:adf:c382:0:b0:1e3:1be3:cc38 with SMTP id
 p2-20020adfc382000000b001e31be3cc38mr14941602wrf.368.1645436506679; 
 Mon, 21 Feb 2022 01:41:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b00354d399ef32sm7309517wmq.39.2022.02.21.01.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:41:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/mps2-tz.c: Update AN547 documentation URL
Date: Mon, 21 Feb 2022 09:41:44 +0000
Message-Id: <20220221094144.426191-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zYtyt4n+JHlN

The AN547 application note URL has changed: update our comment
accordingly. (Rev B is still downloadable from the old URL,
but there is a new Rev C of the document now.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec7..5ff47e1dbae 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -32,7 +32,7 @@
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
  * Application Note AN547:
- * https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
+ * https://developer.arm.com/documentation/dai0547/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
-- 
2.25.1

