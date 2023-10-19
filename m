Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802199ejb;
        Thu, 19 Oct 2023 14:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi07TSU62tCLP6wlqYU48nwZ4yt65o3ju8+3SVuhN8djgylCOoiZPg2JNYic2erdQDvoc8
X-Received: by 2002:a25:8e09:0:b0:d9a:c4df:cd8e with SMTP id p9-20020a258e09000000b00d9ac4dfcd8emr9772ybl.33.1697750641190;
        Thu, 19 Oct 2023 14:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750641; cv=none;
        d=google.com; s=arc-20160816;
        b=XekGCXr9pV8OMBBmtURBLGI9ayDbEtIAPDUK4gKmGxuQJGUDJJb4MvxcAwpJX6e6W/
         Okjb5MpG5r+zebfqwiqkrkCye7MDr1neALx2RkxMK92+RGrpz5XPFs47wYKq9ymsCU/j
         KrllqM4zmeWSbs/rz8EDvQFuNqpDUSJ7qny9bqgV5v7EZ7LUxmlmsDBckrkz3npsO852
         WrbVnByr++LcBMl+ooak8avD1rEVHhHSuwwJQezaRIJO31QGmdQ3Qlwg6jRB+BwJc2oC
         L+OmrA/IFD1pVUfcomJFDnIJipFSrUgKjQ7MF6CYpAWWFGDkHkdTxVUrctZzwruBCPfW
         v3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/hpCEMkB9kpmbEy5heZ/fa+AI3RvYUKVxbgc0+G8NZg=;
        fh=QhaOZ6QGfjKMzLeDMQRTnibOKy2NlfDG446TAiedCIU=;
        b=Yeqt1NKv3D63vGmhDOmY3mgLfJWa3dS77AO9BVU+fy/24bBS9m2aHMQhtAjKiGiOkb
         xCydt/yqCyAcwykA7QRfkD699qV/DbN48pAeryl0zcMzA4Hw38A2j/gQdq0S1Lrsk1Yq
         IPY28ttLUzF6rGT65SQea8HxqZSUTCnPJ2YR9RwsEi1d24f9hJUmNxVNGVRoQmN+Xmp7
         yPFiQfhd53boUlqwGKC5r2L1nYGBaY5x251wiRQo4CFmT+PJ4ocIc20KTBJ4gBSthURo
         MA0a3pgGUuHWavNG87pcaDEeosFHVe0UEULKVlEU8DPzH4NSo1jDq27yN34hUeYFGTzX
         NQqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwJrf++Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pg2-20020a0562144a0200b0065afa9743aesi366063qvb.460.2023.10.19.14.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwJrf++Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaPc-0004mJ-CH; Thu, 19 Oct 2023 17:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPa-0004lF-UR
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaPY-0004IZ-Ob
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:18:34 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso959645e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750310; x=1698355110; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hpCEMkB9kpmbEy5heZ/fa+AI3RvYUKVxbgc0+G8NZg=;
 b=HwJrf++QMtiTSWXfbskBoxt9VMCIBD9kmt2R+4hVwzo2PAnyCbScwzHhK0/xHH3U4z
 r9iFV6mTh69YBMQSXiIhcnG1D5tU7MJTmEQKuccxao9I2CVrH3SW0bp2FJtCyXaTFjmn
 d0RQha9znx50V0Bd0MY0xoc8ANYky/BGHi00tR0AIF/hGrf5HC1XfuFP//lM0kotB3Wd
 /AtD2GCtFi5UHJmgCpeYXVI0x1f9ui3v8AN6zoZs8fInsII8K6odNG96flTfHtWogJKp
 3l9NkWsNA7RC2Od8r0fmCzUkfbuD5UMeMMXHvqF94aKB/dlruDfX5foLco4OuSR0ihkn
 rmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750310; x=1698355110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hpCEMkB9kpmbEy5heZ/fa+AI3RvYUKVxbgc0+G8NZg=;
 b=hT26JSnc0yYyRmGSIwLJcTOzgRat7OHUXNkD1B2nvE9oEOY6ZEt4a4IRfeaWL7oQ03
 tDVHRCecWjE0K7zDR9POk3z/eVZxUnfdVYRAepBVkTXl4r863c5nzhJSIC3oCMAT7FT9
 4jhRr3bP9c+LwAB4gHhFkNMWxu9BM4TbdpXDRNyLfAD2CIFf3DlvSbGjCIKhvyvAy097
 XqB6pKv+oFoF5gimrmFGHu4QcPEwihRK3Bj0u0NfKvFnNZEeFLbwQbHvnBq9bsXYy1av
 oCw3aWJCFNL7EyPjkhjO69x7hzmkzdXinR4SsicHzkuxmvT62p7M1IYT59SruX1S8+Y4
 +BrA==
X-Gm-Message-State: AOJu0YyBxtkPwmhGMEo2o52FaydHOK6BRt1M7BFYMA01cm5vY7xDT9a+
 D7S7LEOw8f7/FWfWrK6UtbLu4w==
X-Received: by 2002:a05:600c:3b0f:b0:405:39b4:3145 with SMTP id
 m15-20020a05600c3b0f00b0040539b43145mr74847wms.2.1697750310609; 
 Thu, 19 Oct 2023 14:18:30 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 fm12-20020a05600c0c0c00b004030e8ff964sm5343291wmb.34.2023.10.19.14.18.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:18:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/46] MAINTAINERS: Split vt82c686 out of fuloong2e
Date: Thu, 19 Oct 2023 23:17:27 +0200
Message-ID: <20231019211814.30576-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0/mR01D/cWXB

From: BALATON Zoltan <balaton@eik.bme.hu>

The VIA south bridges are now mostly used by other machines not just
fuloong2e so split off into a separate section and take maintainership.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20231015141517.219317456A7@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bd4fe378d..5f7d8ed866 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1322,10 +1322,7 @@ M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 F: hw/mips/fuloong2e.c
-F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
-F: hw/usb/vt82c686-uhci-pci.c
-F: include/hw/isa/vt82c686.h
 F: include/hw/pci-host/bonito.h
 F: tests/avocado/machine_mips_fuloong2e.py
 
@@ -2481,6 +2478,15 @@ S: Maintained
 F: hw/isa/piix4.c
 F: include/hw/southbridge/piix.h
 
+VIA South Bridges (VT82C686B, VT8231)
+M: BALATON Zoltan <balaton@eik.bme.hu>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Maintained
+F: hw/isa/vt82c686.c
+F: hw/usb/vt82c686-uhci-pci.c
+F: include/hw/isa/vt82c686.h
+
 Firmware configuration (fw_cfg)
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.41.0

