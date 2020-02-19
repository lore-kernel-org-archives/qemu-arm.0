Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp323959lfp;
        Wed, 19 Feb 2020 02:26:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqx3UuNAjqT8OC7XUO8PPoh8U7Bc/IKaXnCjlemWnBDsL3fvrqAfGMv7EGJaTFGGGFByMaB1
X-Received: by 2002:ac8:1e8e:: with SMTP id c14mr19976657qtm.330.1582108006143;
        Wed, 19 Feb 2020 02:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582108006; cv=none;
        d=google.com; s=arc-20160816;
        b=P+k2bBzMGGc/yCIAHrVphf7sNi31x3EDSw3+azJvW2GAAOWKCOVQSPEldn/44K4KrF
         1EA9f9KiCdvF1E3LDYF54H8GtjutJLcKmE868GwRYshWvdCxprSti6j/GX8UIO6OSKvn
         DQT7ym1wFerok21vYPAQ8CM/xI/EpBnID6jQMW7q3o2UY12E4Gn4QWWjBDtaj6/AXf/V
         /9cOVf0UMIv/is2ScWlZlFD+a8Q/nfyJ9SFcc/vGkkAY7v34OdJlLUbZzcVFlCHF6dp4
         ffvUkc7NMKN3u629xtUL5vGhRjcaLGBSCgwSUePYerXiqv+OX7fu9CY0TKy6KpsE6IQq
         0oeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=AFBtQbzSZ3PMNSmpJvwECSfX31pRzI3YPAMuFQu593k=;
        b=PUnmXmvQxRS2E8XyIfeBho82M2ddp20KpCnDsKz1LLaHIHb83cGGAFIsnIJRzlyEq6
         zWxYsTGgFxnca1fbh/XrxjN9wXrckZk/dYyD5INPnJuQnc0LZnFUOhfXyMEMGqeOiju3
         o7Fc05sK8C2LOAPNarvgaf2PqUHrPplz8ZvDKjxk2BKHlwuc4sJIAJD8a9Qonmw0TJBR
         /dz72l823/zrhvFVDWt1UfITsT/xqEE+0bHWRj6XX1zDAU4Ll41WVVGWm2pvZM933z6q
         KPGB0oxFpWhq8UXJzYkvY82N5ClwkuDma9S5K7VdLNObah7bww2c+5o/hcbNIvc3iSEe
         pmQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si788065qth.23.2020.02.19.02.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MZ3-0005XS-IH
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPw-0003jI-5X
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPu-0005XX-Jj
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:19 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34575)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPp-0005N6-QG; Wed, 19 Feb 2020 05:17:14 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6LMN-1jWvt50T6H-016gGs; Wed, 19 Feb 2020 11:16:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] hw/nios2:fix leak of fdevice tree blob
Date: Wed, 19 Feb 2020 11:16:11 +0100
Message-Id: <20200219101612.1033925-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V4NW0Cfty6gcVkThdoEhaGL1nZCXMiXRMOUudoULVW+euwTxQSJ
 70VGnLGFEyow/yWgzGydQoK4mih2hDHqrxAVPDO5/Et85fzhS9p317woqhGdjIu9hpJij/d
 roY8bpX11SuJ+zVFK0MXuNwkMk7A74iF1zZfJpGqInesuu1yF0+QrptL8FD5cZ89D+123LT
 U7v1SaAMYxD6auoNpuz9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qo6RIilQvSI=:MR/4+Kac0ZOkyA9zF0wV3N
 JtCAMYarL6x7pbPFkge74S9pezob3grjmKKLq5Oab59NErOnrDVC9ybRI8K2MBDT4qNECzTGS
 NGHiigfzKACRBWzzGnH0Lq9UG2Q8bRvUi/RrbxHYD7/Kfidu2Y5EPmy1p8UCOcNsceDz64Ytu
 LXbNoDSGyS9o7K0WdZfFIyNCBung3TYObfjszEkDmTS46bkU//YY78YCSEJjE84fbZw9lb7jI
 Zv8oUtDC052XioqJ0MvvtW5g0NL7YuKk9tdI+VyT426UG6r/Gb0fvqQH5/j5pp8gIXpwiOs03
 QVsGNLc7x8PJJSflv/z8DXNMgIosVRKHQhHbe+uhRE8JQ5TzKHN7DE8sq/8E67XSeLM9VyZ/g
 JfaXsRY4UiUwBN3y1RHOkQsPmL5xAwWEnJHOikl/Ns/1WX5PwiqZ3y+////uob3U1Q/BrasjM
 x7hfD6OiK+g5HEGEBGpgl6fu9CSZvtdRsIv7NKNfkPEyHI5oLvrcgyR92WweK67TfH41189i7
 fTIJGF8srSzi05o0Fl/XMaQThZ6ILFD7DxbQRSjK7CZA0/vwAUkhAeZV/dPmDsDELcqPwNrB9
 Hij57OdqbUlcIBoLKfXIVD20PBAtgbXDWqxsrvqnA+Xi7SbxugzL6/lDQ50VazYvTuQzcBZMg
 JTzGQKMLI+2kZQra+tFQz8JVDPJ+EQD16Gtlo1/+Gi7QC2dSCp6ZgV9pVWLgjjR4FReOAd/T4
 7LEvW5AeFYfYC/6De/OdJOpaa3Xra15hOfL1niubUG+qqtUhyl1usxecLls7237KCp+KpQSrF
 lhC1kwqKcGkLLjPU1Mgu/yLsm5PwpfOWFsJ895pLUMJxcheNTVWIrVi6a2oEn7dnyU35XEO
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DV8++W0OTh00

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200218091154.21696-2-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nios2/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 46b834987691..88224aa84c8b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -109,6 +109,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
+    g_free(fdt);
     return fdt_size;
 }
 
-- 
2.24.1

