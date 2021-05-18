Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp724284lfm;
        Tue, 18 May 2021 12:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY6fW+0nP2y/4KWpR+na74DlEWp1KQunSqc5NwQGjcONSeEzT0URe9A08RDgf38zqtj6pK
X-Received: by 2002:a05:6602:18:: with SMTP id b24mr5694420ioa.1.1621367347658;
        Tue, 18 May 2021 12:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367347; cv=none;
        d=google.com; s=arc-20160816;
        b=XuXNn9AJw3uQVIes1bGFEzYx024KG/PwCHJYzUf21bWXjhcCRg7Htdu5xr6YpOZ2z7
         lLFzvbZO3Na4B4rWQLPeaoMa2MdtBpr8ZoFRnmZ/PSO/RzjGialBVMz3M2P6XvPravOC
         XYvoiqY+sq46lEhxP9MxSsnmEyednIMenL+LU6tRAe163bs8WauvM9J3/3xmOg9n1k6Y
         HiGM8EMrTWWnco9Qfa+z8chT+x3U9DjWFhhuR/Xuqfc8n2F3NkhGa+CYCbhKLngwiNcN
         KiBRXY9MN2RE3aBe4tj++F8yVbn6YZa6bzlKkgTCjGZM5A4Euz43OJFhPfK7aFbfG7nc
         htOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
        b=eJvxHo7sIuNQLt7hcXJvK+PBcpcLZ2HoWczv1fKQInbW+guCGzx+yrBEszCGNsBedo
         LchmIT6P8SJLDudpguJwltBUNFOXUSY/tgm5sLVmfytQJJN+fgm/1eggGDhJBwE7RvZq
         1Sl08crKLzCRf9xbnjvup8ZkTLB/Z8gy4hUMyEINOoqWE9GKlXqih/nsmdIaAaLLqZiX
         vIY8BXhb/IrksFW3Xxgmwi9ATgeqHAYU7RPzy3wWgbqDwLG284vluUPh+35incsRr2C1
         ebY0lnbsA6620Ot9ALxdorVsL3NNtj7a6+/XWona06e5jx0sExeM3y6IFeeIMaMPdhgu
         Tyvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Sk77cjIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si22655023jav.99.2021.05.18.12.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Sk77cjIG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5iF-0003Li-0h
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yhmkYAcKCJkO7GMNK79HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1lj5gj-0007xo-Iw
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:47:33 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yhmkYAcKCJkO7GMNK79HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1lj5gb-000799-RV
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:47:33 -0400
Received: by mail-qt1-x849.google.com with SMTP id
 h12-20020ac8776c0000b02901f1228fdb1bso4648641qtu.6
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=Sk77cjIGQyY9yV3nr7g6YR0KnAHpng7S9Qf4iEH7CG2Oc6CZboVJGQgxCLKeg6x1vK
 iUy5WDpCQfFQxDW2JDo/hzw5ZHFQUn4P83Xhxhq4UKDwg6y+lkoleVjgNwIkX0xvDq4U
 sD4C+aoF7XVnRCb+6/2aMI5jIPCLumLRiba5BvHFFnPfPaKkyb+tZEv5DrG+zj6T2Yfr
 qfsFplwmMbQVR40jZhSLsBsT0ixITgfqiGWNM0G7lecw+PpAqkS2Kkt/nDn/Pq0Dk4my
 8E18Hi74alLZqsWVHjKd3v8I8kYaXItaqHsXny7ZU1EXrcoHCLXZxyuVNkJoroMDXIqH
 RPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=EZRqAVHEgIU9PgolxuCnjZj+W7Py7n0bUR3muK816M36TaeIwToPbVfOH+re2ec+xX
 tau0+zJuaqE1apnLaSyPyfDB+0cV1RV5KCabm5HvD7uLT5vH9rDzpRVH37FL7GbeKHA6
 am+jSV5M+Zo/RTEYZY1y1PiaslS3N6kiSF8/dlXNL3mm0tSOyaxYnIYRNydTt6iIFbD+
 J3+bqaYkvJoIis0XoUqEKQJt1JNl0fzxErzzOaqg+l9hMp8h7sa//MuJ1sR7HZ2MmBQ3
 tjMsIfNCJXZbsA1hrLxelBGUVUNjNZKdd2+M1pucxz+9Uz05ktuW4M5rhT2x5+vrEYG9
 m+AA==
X-Gm-Message-State: AOAM532+ywyRP0e7HDFQ3e09BSlrR5p9w3zC1zOEWjHnt0Dp66eJPz6s
 szhkNrUxchSPBSr+7NdRBjSN0ZqShthP
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a0c:cdc8:: with SMTP id
 a8mr7897551qvn.12.1621367242071; Tue, 18 May 2021 12:47:22 -0700 (PDT)
Date: Tue, 18 May 2021 12:47:04 -0700
In-Reply-To: <20210518194704.764241-1-venture@google.com>
Message-Id: <20210518194704.764241-3-venture@google.com>
Mime-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 2/2] hw/arm: quanta-gbs-bmc add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3yhmkYAcKCJkO7GMNK79HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--venture.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0I6hAZdcUSOY

Add a comment and i2c method that describes the board layout.

Tested: firmware booted to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 34a214fe79..d9de375826 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -238,6 +238,65 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gbs_i2c_init(NPCM7xxState *soc)
+{
+    /*
+     * i2c-0:
+     *     pca9546@71
+     *
+     * i2c-1:
+     *     pca9535@24
+     *     pca9535@20
+     *     pca9535@21
+     *     pca9535@22
+     *     pca9535@23
+     *     pca9535@25
+     *     pca9535@26
+     *
+     * i2c-2:
+     *     sbtsi@4c
+     *
+     * i2c-5:
+     *     atmel,24c64@50 mb_fru
+     *     pca9546@71
+     *         - channel 0: max31725@54
+     *         - channel 1: max31725@55
+     *         - channel 2: max31725@5d
+     *                      atmel,24c64@51 fan_fru
+     *         - channel 3: atmel,24c64@52 hsbp_fru
+     *
+     * i2c-6:
+     *     pca9545@73
+     *
+     * i2c-7:
+     *     pca9545@72
+     *
+     * i2c-8:
+     *     adi,adm1272@10
+     *
+     * i2c-9:
+     *     pca9546@71
+     *         - channel 0: isil,isl68137@60
+     *         - channel 1: isil,isl68137@61
+     *         - channel 2: isil,isl68137@63
+     *         - channel 3: isil,isl68137@45
+     *
+     * i2c-10:
+     *     pca9545@71
+     *
+     * i2c-11:
+     *     pca9545@76
+     *
+     * i2c-12:
+     *     maxim,max34451@4e
+     *     isil,isl68137@5d
+     *     isil,isl68137@5e
+     *
+     * i2c-14:
+     *     pca9545@70
+     */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -282,6 +341,7 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
                           drive_get(IF_MTD, 0, 0));
 
+    quanta_gbs_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1.751.gd2f1c929bd-goog

