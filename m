Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp321670lfp;
        Wed, 19 Feb 2020 02:23:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyweUBVHzjnMLVb0OFFqzdQmKEr0RzBV6cSbiu5dGrh66OgeLoI98bFJQBxwam/d3LsykD9
X-Received: by 2002:ad4:4949:: with SMTP id o9mr19771113qvy.189.1582107813616;
        Wed, 19 Feb 2020 02:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107813; cv=none;
        d=google.com; s=arc-20160816;
        b=Gnf2Ehv+M9JrI4+jgMBnCRHt6vUwUD1pPC3sxtvGwIs/B86uP+lcPrsaCoRM6njkzi
         D+GHLjTjTcN2P75OIHjR6F79aqb5cvWXg05RQ1tJIh1jOagz6vlxDCUbc4SO9U38HS+a
         JJzmqppXpKQLd9LgSEZS+N6DH69dNBm5gc5JU/krayJ4mPVMI1CPNXzEGgkU2Xg3a8Ke
         WjAC2YyPf5vP3EBVmJeTjuWJd+qOef2DLzLScYyfrzgpt+D0oAbCgo3c40G3J+bvgu5O
         sxkTQPTIm2orvD24dcvfIEMAmgCBK0etL273lGcQRArfDw7JCvyfANOKShy9cOkKKdZC
         IurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=J4Zt3pR9u9TMVh80kCuYFtCHnwg2Z7n01pc7XlDtFm8=;
        b=HYxTZA21vY96H0tVEsE/LpLH+T/arioaUvPRA/U33lng7eEu0QBu0ywniRr657U7Tg
         34k9iatKGpGFZrqw2RgfwE9CmImQ3zf2jMpQcPv0CruHFYvTr7pqoIXjUV0Lkj0Ehvbd
         VfVHVTK3YDBJPi641uBonUVEPGiLolAXJ/Lg0rJhclVICWv87eYbV/j1JVqgFDaTiQo3
         +e9A0raDv6K4UrQFB5zqE/FQ3W9oQCQZfylS7JR5Jd4zAaKSKUsKQEhHyfxiVC+JYO85
         7xupn6g92aNrfWtRNunWSxfwmAu91JYDp6mGtr2ZuyjyZbxwOM1YQfuHwZg/A+Z0qhDc
         7/VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si738370qta.317.2020.02.19.02.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MVw-0007JI-Uu
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ8-0004Ax-Rp
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MQ3-0005oo-Sb
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:17:32 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43541)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPu-0005VQ-Iy; Wed, 19 Feb 2020 05:17:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1McHM2-1jaONM07IK-00cgh9; Wed, 19 Feb 2020 11:16:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] hw/xtensa/xtfpga:fix leak of fdevice tree blob
Date: Wed, 19 Feb 2020 11:16:12 +0100
Message-Id: <20200219101612.1033925-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2d2DdnBIT4QzL6xniwXm6iBbRodr9Z9EJgRhZyD11lTxEOZi5ih
 jzkXcdw805ZSlb6qs8qrMskTlO9hiW7BdZveZ84yjog/lIFx1wRSYviWMpcjXcPI0zgAubW
 NXKwC90SodKEbaHPzlw6hOApbQf9VEM90b94R7XuCuiutC24oWen4Tz8gyudsuQGxB/EIfE
 FbJTPSbTwBM0rX0y4XZuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ARdIMovQ8QM=:/udeQ+opwPyE+3PMD2T7+V
 LV1U6CoLgQ6itRUERxmiE70V3DBGdEpWWaMs9IB3K6bXN4f1/BByhpLE9O+36Ar4pPe1HwvIH
 TOXgnrH/qnnWVCIEUe2rTH/h5wIPATlnj8sdzWb3qJnGHJZ1fRNH4dLx6zppMCTxCYZvpJgOe
 eeV55IDrlwpTr72z5x2LI88zvd0sInaReVNpp89HjCf9P/99WQHaqVEx4viTpHCpes20Fpcmz
 4wm76XRFL//ozV/V+TRQ19ouAd8LfuFNYkXoNkj5Yq8BSsVlRdhruTH2zHfjDJovglTb0OzMZ
 zeo7Lq5T1YgbRPBaO2nPSCQR51p0qEXqEpgsDMvKlj/1gSV5Eza8uHgoZ+KK+guCQcJl3xKs0
 RTUIs7GaNcJsmJo3cxdvpO7MKCX5BNeEtx3SrgwjXIqT3LogOnNGwtU0C1Z9m4jwYEbElEUgV
 zJZeSSJ8nQ+wjcYatF3hE+tJ9PDd3TVFob3RXuGDkZS0mD72NS8RYRhJ8eWXWPUUpNcW71ngP
 f8shO4TBD2W8uoShLtCpe9Bz+f0vMkL1z9/8Aihhy2A3tVFesQi1WzcjgLdGsn8j8gdY593Rk
 PTUKcEhlHnId5M9KkGzPxjXGpLsLFnWCXVIiPu+OasCTE+UTfmQkcB9WIbRBfLMUqAFJWO4Dk
 IIhi8BzCaYWpWqzuwa5955FTb9kYgtchip15rCD4ZxPV2cTKHQ99wOE6H6Utlnvj7osOJsEG9
 5J3rPAECW7z7U6AMb754HNcxu3XmyQuhRV3ujJdcV2iE6tK4S2omcn6b0pE9sopU03yXkm+oF
 ZHND4497IU9FXGHMi6zCtg9ZP+50YP7QCiwPQQPY+4+/yUo1ouO6KBbko3Kj7FFOmaNhqDz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8X4FkjNe3kf7

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200218091154.21696-4-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xtensa/xtfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 8e2dd1327a46..60ccc74f5f1d 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -380,6 +380,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
+            g_free(fdt);
         }
 #else
         if (dtb_filename) {
-- 
2.24.1

