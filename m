Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1272857lfc;
        Mon, 9 Mar 2020 08:30:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvcLE8lTVkBzqDVA2wpG2PZsSuU2c6sXouTY6NH4wx8uoRWLo4iZd2ENdQelz4Q9gQKPOFM
X-Received: by 2002:a05:6214:1408:: with SMTP id n8mr14605198qvx.189.1583767849170;
        Mon, 09 Mar 2020 08:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767849; cv=none;
        d=google.com; s=arc-20160816;
        b=0U4cFs98hFVPhKx0/pO3IFRZJIjSyvaPRcrVrnVfJTEpSfuN1uFhnvf/tw1oCvAbVm
         MJq9lw8/2vQs/T0W5TOeXSbT1VQDzvWL8Y9Jz/F9nbO9tdZmL1a7b2yDKMAdEMJ8J7pp
         O4k01mL34g2aN6P7VWzkj7IVCFKRya7vWF5oRuxfdyGeB6ItupMxLI/EhXlwTSJvgMkj
         us9ljqVH4PkJ8d6m5GvOQzB5I6j9zsvM7eLy1kABOJydZjZ8JmhGP/bykrsHYSnoyONk
         n2RwSgtjaA3gVBfhEq8hfs0t1LCFLvt5B3fQdKiQxXluagbDw8g+/9pZjsyMk1VcBzTA
         CLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GaegJFcvNA6SPAwxzq+V8HyssZanPbiHcJyOl48XlYY=;
        b=pXgUHdmMvKEA4MZ8uGlywlvVvIi8ovqqtEw4bR0NKPXnMZWrJooGpAjPq2Q0fCFp0f
         JmtVO3okM3Zd8zTiWmc2ut+XE8J9SgYiKUSFptrxwIsdMxt+IkkFP580uwm3Qws2i18B
         T0s13mBK8wGl3BBi47VxTgixqaxZy8MwmPbO0zhdlB79OMVct7v/uEWhSi9USMBnudL2
         gHSNdKh0sKP7xZ9ZDRqXqseByJuL7Zd016pEtNfPghY7P1I9oJP769OXJnS9cL6hEsj5
         99ZziWIc+nSpUPy/2qnPHlEufcqvlIx4w1RCwi3tn49my/vgkIby4GCUk1ESCsashHj6
         x9Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si4251013qkl.292.2020.03.09.08.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKMi-0004i9-HL
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34667)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3e-0001LQ-2Z
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3c-0000Al-Tq
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:11:05 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:32827)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3a-00007m-6F; Mon, 09 Mar 2020 11:11:02 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxUfn-1jZqAI2tKr-00xr6l; Mon, 09 Mar 2020 16:09:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Date: Mon,  9 Mar 2020 16:08:33 +0100
Message-Id: <20200309150837.3193387-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VR7JvRspay92/RpC3019xh/+yKSsaZhhChauw/DzrILMmPwVQbl
 KT4mJuwv7zsMg8kFmidAhL99c1eGnnbg5NNW/kWiba09T5ch/Xk+uCGHmODaXNx4gqY9foN
 MHoIHGw1idZjYnPtI+UwJ0/GC0NKFMGfrCLc4/0mWRW2Ci0UJzNhUSWtgfS1YWnWTBrFo5J
 WgnNnY1Gd1b1rSq0R9iNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d/Zn4yl+QlE=:bGwabL+x5posZ6fqHJw5as
 cbs5eAUKfZbTwBoLi20DntdUpuY1+oivFuvbLrQ3Sqy7FFk6BSHr1InaA+3IInPAYXrYZObX6
 Ss7HORg+et8/6Ve5saonFY7g+ytd6/EthYjPSeE0Ot9S1VmimpI2JVz0zNdBZESUrulqkrBVR
 ZULkjXUwca+BMN1wUILV/jYp+hGhsc2nMa4ZYWgVBtqOjCX0z0dg7+9pcAZIa/UjtI3Kg3LRJ
 Y2J9VZ1UcEbEllt/+H3gkuwni7WU0+c4IQTw7lYV2wdWpHN6y0IITPCbCAPRNimU/JEnVe2mH
 Qbb15PdX8Scgp0zU6WxwjhCXQAdifK2y3I0CQBdpac4sRwX9fbzjMS0XLY+S1L27FHyS3S+Wi
 7kqNnpN6n4uNt65GW1Y2xpyjFZ5gQcRajJ/BVAr9HLZrxHpoFi+GtjPvaGRD9U+DbfVxisMLM
 VPhupl0DIfC67sSmh91aao/kkmxhD1ie+stKIgVMI7Oobcrr61Ntl/I5ZW3o10meYsZ/Cz5Gg
 5z2QnwAUwXpg9OXWYIOlVhBwhzroe2TZvzOoNQu8dM0zSHpH+Vvhg4/hOYSHMp1b15N1nLmVl
 hYuUxGiE/XVYIid6DntY0XMzHlaToiQ9QkaH7gSawR+FmKpopFR+T253t2zKGlNHdH5Miw7ke
 kP04ynScr7SwHy0/ZAT1iFfGrRd2dqOSm4hbV9EY0g4Eo1ysEjYzYbspsc0HplGPYqFb6vBmI
 pguoy+EqZy+Ll4xvB6p1meABu/CAZ8YvuLf0DofO2CeWnvyXOxlHDrRJgTpRm2L10mGjqIvmT
 dAQR4AAmHLyZiElb9iF33OIfDetvDh/kRUEI7e/yDVhNkVQ2tvMCozg2+AsKadReuG9lIt4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Francisco Iglesias <frasse.iglesias@gmail.com>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Euler Robot <euler.robot@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N0kF04CsNZCX

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never read
            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
            ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20200302130715.29440-11-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/dma/xlnx-zdma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 1c1b142293a6..2d9c0a0d5e19 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -372,7 +372,7 @@ static uint64_t zdma_update_descr_addr(XlnxZDMA *s, bool type,
 static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
 {
     uint32_t dst_size, dlen;
-    bool dst_intr, dst_type;
+    bool dst_intr;
     unsigned int ptype = ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, POINT_TYPE);
     unsigned int rw_mode = ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, MODE);
     unsigned int burst_type = ARRAY_FIELD_EX32(s->regs, ZDMA_CH_DATA_ATTR,
@@ -386,17 +386,17 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
     while (len) {
         dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                               SIZE);
-        dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
-                              TYPE);
         if (dst_size == 0 && ptype == PT_MEM) {
             uint64_t next;
+            bool dst_type = FIELD_EX32(s->dsc_dst.words[3],
+                                       ZDMA_CH_DST_DSCR_WORD3,
+                                       TYPE);
+
             next = zdma_update_descr_addr(s, dst_type,
                                           R_ZDMA_CH_DST_CUR_DSCR_LSB);
             zdma_load_descriptor(s, next, &s->dsc_dst);
             dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                                   SIZE);
-            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
-                                  TYPE);
         }
 
         /* Match what hardware does by ignoring the dst_size and only using
-- 
2.24.1

