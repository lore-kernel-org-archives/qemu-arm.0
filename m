Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1263266lfc;
        Mon, 9 Mar 2020 08:20:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vusAnBwSv70Mc2jchlgMQ06DTu2a/3hGa5Tcw3wsveey07wF3kkVlGXLWKsYltMLIlkvr0d
X-Received: by 2002:ac8:351c:: with SMTP id y28mr14641566qtb.379.1583767241530;
        Mon, 09 Mar 2020 08:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767241; cv=none;
        d=google.com; s=arc-20160816;
        b=ik0aEEDv8o1eSe4Y5Mfmpl/QVFGDrMAVmHA/5Krn00oQ8phHdEYHQ2p8ZQtMFe2o3S
         UTx5KmVPawoDT6hb+OxTwIbQbUR9F0dmlfy409qtY/gZ3mbJ5SFTMKhqwD+SzgktJ0QR
         BOtl0/MX885M9ai5CDw7Q0ec8KRfcMUfCvS8BhAJSGhZMH1MqxY99axG2v0Rr+9kxGqj
         Ma7r4zGGi1X1xkOtfRJsQiPNm9TmmL4FiaewaGJQMSGkyX+rHZHJaOYCwrnDHTzKhNiZ
         /viGe0hw2x4DlFJOTk3hnSbe0568l4ir9zalcuDjZxjzema8T4aGwhmrN+K4F6CE31yz
         tqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Q9XoAptUGoIWUJT4R0/40og24OMPNg5CmsmGGOvuEBQ=;
        b=xkjvlq43VW+uCc9hJ5tA5glkl92n4BuXU6mCg7QQoBLi1B95oKUhFWuQx6WdEia6CI
         6sOeJiBTq54XsOaWBIh0g/9IBTFxlcPlguMcY7a2POWw3Xl8OrZGWxtdV0nJaLA7DzU4
         r5z0lpqNrAteOYLofoyCDyDimrM/LcrjQ8aQrqwL4TGPVvLL1WUZqqtqDBlTkdp4arNv
         lY5S2gW6omGMCuzSyG//yEUFluXXHEQOlp6ZzSW6OmetUPziW1RRI9Fz8yK2UosokFgC
         TZqhLG7inXvKnHMBhQMw8rxgZoGvqQhp17x+gfp6yfMmFfQq9Dw+Kg0cMonsk/1oYnwa
         oGAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si5806582qtq.284.2020.03.09.08.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:20:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKCu-0007XR-RM
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2v-0000DF-DB
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2m-0007zC-QO
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:14 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38419)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2m-0007yY-As; Mon, 09 Mar 2020 11:10:12 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1My3AX-1jYBjR1Hm3-00zVGb; Mon, 09 Mar 2020 16:09:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] hw/i386/ioapic_internal: Remove unused
 "hw/i386/ioapic.h" header
Date: Mon,  9 Mar 2020 16:08:14 +0100
Message-Id: <20200309150837.3193387-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u3cPHvNvPGZ71fbGyaPeuOYlBQ264xiRTyGLhSmLmH67HijXfLa
 Y/qoXbhDzpPStZaVi8UaZJHHsBWYEYYo4GbKgMgSUSzEmvFukXni5rNTb74DFo151g7oIxi
 dpsTu61sW3Wtu1cntATyfaBQ1zSOTP7c5tLLEKT6h+m28jrS6w/F4c2ae0QzxhHS0Y8rfUr
 AyJ0kIDUuVP4xkFH2c3WA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MIrVBrtyA2c=:o3LjRP0DEiWUwk9amWDB/8
 LvmxIIbSkJi+oVil9V4+sj2po18yeoP0ZdBYcJlNUkLUMRusu6NlHxNG5g8xnz4/N5Lw5/UDa
 U/AMdA1HG++9XdJPUIB9EpzeYICB2F/Fn7CWl1tn1NJGyP0BpyNAqAZczbqLMwrwJy1SnPx8R
 N2HwHd8deHULP2tzUO4d8gATrp65MeKWmt0vGxN9S9ZEPe7C5EZJBjt3Z+vkb3g8fof2O8u4m
 3yg6Qqrp+9qcGm4Q7QDSZvYDrdFF3gA2Hm47Cx5dB6AtfCIvsKQKzMEDDcIzoYWCrTtx4Hh0j
 ZjsPA/+hNVp2YS4SMbbvySVyskubCOYgfBB2CISmX0mWoD0jeLQfZ0DsjT8TtQWuQ+wGDH76c
 4Ivo+aQVKcF06BSUQ94OVN3FFSjqYzKQzRWXsS2gDJmqR1WXoB8evoS7rRPnQW9xRPq5AGARd
 O9jNqsfg2G29v0fT01Xw/G+tfTtzt/dU7LchYctnZDOW/P+Iyibl4ST6ddi7lQFL/ql03EOj/
 Gz/EGXp/w4+kUrqQL9PLZ3awYU8oiHN04Pt+P66bekr6sD5mMVQcrlKAaqvJ5zpo/eaI9Ueaf
 De+tPClMoGMYg/IswaS6fmezKptwNOafBN3/k8Ok9/xH+qT/qZ8FDazpaVxdZzJmfRzwaq5Ig
 ab1CkZwoL4MRqEyyZfm5Ft1nHArvR51vRVVXK5+dfua2MUPc5Pf2mkjSEYWsJVT+i7UyjBlAJ
 1q24dxVpAGwkYWMLrTCKofEcI9QsrXdjMrBOke77JtOVixNNzkjnakYzV21DUN4cYfymwENXe
 X2Dzz+hOuA0iTrV6ryhcNjZXva4icWSW+jk08jK6NRIw6UbreyCqETJeWugpaSh2c4RnfqX
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
X-TUID: L54m7YHO/YVY

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The "ioapic_internal.h" does not use anything from
"hw/i386/ioapic.h", remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/i386/ioapic_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index d46c87c51030..fe06938bda47 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -23,7 +23,6 @@
 #define QEMU_IOAPIC_INTERNAL_H
 
 #include "exec/memory.h"
-#include "hw/i386/ioapic.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 
-- 
2.24.1

