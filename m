Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp280044lfj;
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi7LTrJUMEhaGkbIY7UKLRMIZnU8hd5WmHZPtG1FER4qssuUeAZxZXTSIJIvAE5VrEBCG8
X-Received: by 2002:a05:620a:29cf:b0:6a0:5fac:2f41 with SMTP id s15-20020a05620a29cf00b006a05fac2f41mr3649089qkp.241.1652447644244;
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652447644; cv=none;
        d=google.com; s=arc-20160816;
        b=nCiOAmwjyY6m6S3w4JAB/wonmsGJYrGKij++2zqQAv+cwNmVwmT1539Mhfqce7uhDQ
         y31KOoIi8X0VSUVnQTWgE5kD911XY/DTH/FDapdvSvaQqz9NtZDlULyvjeWBqwzyrP2K
         goRILdazxesBJKAb9vgUqgARDtDnnW2gz2I4Oo3ko0qjE+rVlNSA+Fj7maieh/p0Fkta
         llihtcIJDxB2fDq0GHDsw9cNz8JBwDjMslYVuTVgyXbO+NkXa5swTPlutFl2WQNLmNxm
         63ek+IGD/5wdlWVz+2eOkeTJZRr9tCFmAEHjvlWNefzA4I6tiK2TARs6fdoMvcxleGIr
         b39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=p+hSbF0om2aDK+Z1zx6muSTyYyK6/1V794Z4po7WaWA=;
        b=XPCcclToMyL9s08USg7VgRAhAGOI3xLZF8zrSz6a0DQoT2wHPTU9dhZFLoQ7EJHbqG
         MyYccX/KTKBai4aY+jIpVayZmW7NmI31jSSnAI49EPFMfmFoKUp5/7wavD12gYPCFNN/
         Z0AhnlsCjecRWE7aic3QCiH3qcJQXFuT2WBK91IEUVKmc/zoXpmYH+39qHauQk74jbPM
         vMKCdfTmGgyfO3VMEWqL0ucGjk+Ys7FLsmACs3A4pj2GHerWvhHgiBXBR3gg+aS73XLw
         Oyr08KVbMg/cKEVPRPpxIcQUPw5ShrgukU8qS1/4uUL4+N66m4MW2+4cCPUqreqlGNn+
         Barg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arQU0WJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im9-20020a056214246900b0045a85fbf829si1311953qvb.435.2022.05.13.06.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 06:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arQU0WJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npV7L-0005jx-ML
	for alex.bennee@linaro.org; Fri, 13 May 2022 09:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6l-0005i2-6B
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:13:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6g-0007d5-RM
 for qemu-arm@nongnu.org; Fri, 13 May 2022 09:13:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id q20so4795543wmq.1
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+hSbF0om2aDK+Z1zx6muSTyYyK6/1V794Z4po7WaWA=;
 b=arQU0WJgZFikVeN3ThaeJm2M9D5M+3xAdaXtzY56E3aiSWbrjrgS1E0dfFrr8jPbyO
 uJrf4MsPrd0WyUM5iQRt4LCB4yL2Ep9gBAeQHCwJyHafMfoFyajTAwRRz0UWlaaXYgY7
 MoKZ41XUMT+v6lIgqnwudCYBereeqKYEwkkMxaitQXa6H9kGko6QNc/CLsV+x7puuNV/
 xX+7u07s5UtSdgG+Roy+vGXUkzfGrQ172M41XR7g+6Ply+wiwhKOjVtcXaoTnvaDagoR
 xaeV5evumvuEnsl6oqOj9zyor9CcdW1TlahZhnw91jrMzG5FCq1DTvCvUONs+iCBRHQE
 ycFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p+hSbF0om2aDK+Z1zx6muSTyYyK6/1V794Z4po7WaWA=;
 b=DuRcwvtQLzNNsz/mZsoZNpufzSSSgjUDTmfpLCaDaB+IYefd9eP279ltkV9CkkTSK0
 ucfDfGKWgA5pf/xzPfhM/o2aeMCk9cF8AtbBRuXEdB9ERfZNzDrVBOZztGUaxJaxQ9Dt
 YThOy+vCCqkgW5smumyteC/UPHRoNevenz7YbZGGASIF/pc39a3/2xm7n/CJ0ADgdV4G
 ithTL8FfnCR85flzlpmcdXVh41XwP1XpX2JL11uZBzgMsd9pb7DD5nS7kfsUWUuOxwI5
 bTrD0RM5IefmaW/dzxE4hYf4X44V1FrYrtyJf6vTPPPybCnttSKNahwKNbz0MBX4rKYU
 xcow==
X-Gm-Message-State: AOAM531RsgaHIUuAaa49sQQVLvSQ0VOgLByzr0PB0EdSG/hUEPt7jIEH
 Vruukyj2JhqNIYva6cxjT0MepjVUGqhTmw==
X-Received: by 2002:a05:600c:4e91:b0:394:8d30:d6dd with SMTP id
 f17-20020a05600c4e9100b003948d30d6ddmr4541790wmq.21.1652447598962; 
 Fri, 13 May 2022 06:13:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b0039456fb80b3sm5214887wmf.43.2022.05.13.06.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:13:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/virt: fix dtb nits spotted by dtc
Date: Fri, 13 May 2022 14:13:14 +0100
Message-Id: <20220513131316.4081539-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eus39mvIKy3q

If you dump the DTB generated by the virt board using
  -machine dumpdtb=file.dtb
and then decompile it with
  dtc -I dtb -O dts -o file.dts file.dtb
dtc will complain about some harmless but wrong constructs
in the dtb:

Warning (unique_unit_address): /flash@0: duplicate unit-address (also used in node /secflash@0)
Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

This series fixes those nits.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/virt: Fix incorrect non-secure flash dtb node name
  hw/arm/virt: Drop #size-cells and #address-cells from gpio-keys dtb
    node

 hw/arm/virt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.25.1

