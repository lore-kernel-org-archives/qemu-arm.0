Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1254241lfc;
        Mon, 9 Mar 2020 08:12:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsKu5WZ/8IIOAiQ29G/DaWB0wa6Q1o/oU4w2sqxd3le8hCPDX6XIIo2iIeL+4OxHeUiJxBI
X-Received: by 2002:aed:31e2:: with SMTP id 89mr15102646qth.35.1583766736995;
        Mon, 09 Mar 2020 08:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766736; cv=none;
        d=google.com; s=arc-20160816;
        b=dG6RjZzFXLS4KUI7R7914b2YlC3MqjJsZfydSUW3XIRQrALy8CzaOnD5/bgqamIBoK
         2cXI1cvjqM9UyV2QWvpSea+N4MKBgHSl1RNl+kqmviKzV8ghGP+0pAQ/Zz2rxzpdes+Z
         fVhK8Tpx7vljsjcRTz+HrDhpsi6S1R8/GvK5MriPyvwqececoS4SYtu/yshhmGDNHCyR
         pVG+TT58CaYVIYSiiBoHfUYBC2byVlP6SWuFg1eRiKqtom7hfrWjMS1wUZs0U0xcZv3a
         2aNmvB50jK3/6uUwZNwOnFVYQPQg7vM4TsLV90ODkjI5L2rMPDk+cPItUl6vhXmt2du0
         mwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8AxNPFUOhN48RtnT3O1mgfAtP0L6t2F92Mqv0VJcv3A=;
        b=N0I2fDQz8CPa3ojhoIW+8huVbhORuocqLw2Zt8AW7s3sFgH8KhNV1/jHVd7LsuYJfb
         HCceL73Rvl39n9MHXleCxCq6G2pljRSmjzCvPxX3buaVWAWPRMHgswJhendD3ZFE924q
         iL2ShVRS9yYLGPBJ5V+mLqMgPhnQEx5uejrrU7Lt0SyM9Qm6r+eQInD+HXDCXipW6oI2
         eCLOvBgyxy0PAKzMsEA08dbBO/H3X8BcBoHjZ9zpiKHIzICTUDG7XlECpf9O6Qsm0leA
         7XESeb67Hf0XyLjlgpZWsZpix2Hlwjn10QBt6TjKQCTm4O8np/vlTgKwU+SRxYk3jobN
         wECg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu10si4679432qvb.13.2020.03.09.08.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:12:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK4m-00039F-C3
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2d-0008ER-8Q
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2c-0007rC-4u
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:03 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:33815)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2U-0007iF-TR; Mon, 09 Mar 2020 11:09:55 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0X4c-1jWGih02Fg-00wT7y; Mon, 09 Mar 2020 16:09:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] hw/usb/dev-storage: Remove unused "ui/console.h" header
Date: Mon,  9 Mar 2020 16:08:16 +0100
Message-Id: <20200309150837.3193387-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cx4oEENfxr2esELXcSzclJo1ER6icxlnYhY9ZGi8Hz1d0GQw3/J
 V3O8tJqht91pGcTQkOnoKk2gaJ3MEQhwcCuCxma5dLH2fGpYBzuiIjAkk2djRj8xuvgKUK5
 FEtpQUeaqrZP1Kilxgjn5td/+H4RHB1hM1EYmBjG20ped+UMXbcq8XRLava2nvAqORnu9qD
 tjzauQTLhL51KPtlXORug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:neaUZy5AqdU=:ZxWR/fHhRlXmI8Ju/HKRUJ
 /8aRdKLbKre+x7HHGW2sq4nuiF8rwxXP+iAeJqpG7MU/qFRae00K8wDu07lxyGY3RgwYkhj1A
 J+A5yzcc6+CM59lShCT7gzckvbSEClR4XEdj3sf6rRWMEffEvIzpSbDUyRmX8KpDgP0awjUxu
 W29kueU4rEWxv9ydm+Uh01fW+DOt5m6QMYT9QhbpbxbVgg03Qe/qMyRBnKAbLGcLbDjEQsgQf
 k+F8hPsFkWzPlCiTU7yQq8ofB9Y3Akwq8ftyEySGE2QmbJMtOjUwVtgBl3bKpvtIBNClo1t86
 pWvtdhg6rKRiT+AgNuWwZFarmgqyBrEr9AC/OmUhm742hJ/kRw8ZqJOm4lGRrdiNgXp+2EsaM
 Uu4IsQX9o6Ps15JHrx/oNwuLhH763tEg7+R7UXOLxRg6HtS25EyyA4RUEnfae4aaD3Q5sEibW
 Nyy4EyaXY3UCsH8uSGgKZ4IFrIfqr9gcPWtoq46/oGZwGOFa8C9562S+26fp8QwlV4SbedHAH
 jp2Mg6CSy5mC3CeXRu5Hv+1vdO2BjnqM3gNgXPZ0DDq9XlzPCCIyL3IgA3TsNekcOTbcv/+vS
 urwoKZ0YtKaRyhR97XE/zUJt+uVur/UxIYLEIgJgPGnL+/xdvrjmGZz9ne2kCJfGZgbbvgNcN
 bJGVk73Rk/Hg6Z+VpiqOICixyNG+vNkrUxoEhYRsw2vO7m6KSiYYpphSgAFxLBj4h+Ua3bOIw
 Me8CVhqYmc2c/vDYdTmL1kXNVxRg93J6Hr2M/ITzFGYiQXhdsJWcT6k0/P35AKjfq4TLjz/Bs
 FYZWfBsBPRX0ZX8fJxyD5X7Nn3KRa4SppXZz9DNFibkODng+z2nO5j+sS6RDFNSyBbAw0XL
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qmy+j/uSn5N8

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The USB models related to storage don't need anything from
"ui/console.h". Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/dev-storage.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 90da008df18c..4883c1d89e0c 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -17,7 +17,6 @@
 #include "desc.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
-#include "ui/console.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
-- 
2.24.1

