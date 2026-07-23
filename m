Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54CDC531F7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 16:44:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmwWm-0002lB-Dg; Thu, 23 Jul 2026 12:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wmwWi-0002kQ-Pv
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 12:44:05 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wmwWh-0005Bl-E8
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 12:44:04 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6aae019c09bso225406eaf.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784825039; x=1785429839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZkscVaxdQvVhxUJyZVSsi7S1C4lss52kon2LTZOK+hA=;
 b=YtoTy2eGweVIRI8alnZe6A0QLdmJTN7uDDMqC5G5Jq57Db8vJsGmG3qhVZmQEP1rh5
 EtbVIr64uJEqHjItZiF8pstepyCXURv12DCljJFybXKvmoOV08I02YPr5DrZmEBT4sqY
 oukJj3pTXRlf+JMMnyUswlhu8ghuDUzTb8ds9xCGeGRRnlKwuVidN66G2sENtJ1giErK
 UVv9g1+kubwlIpvwDav9F45FleCPd3NCnu8f/MHBcSAvSNnVmhJuXRBDIy6pR3VKbCYd
 jzAWFCxEWSGidCTnXMkhSJJgwFqa3Fo3vEYqeQQdQOHKx/hN/CBx9aSLqAkqIR1qOMXV
 37lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784825039; x=1785429839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZkscVaxdQvVhxUJyZVSsi7S1C4lss52kon2LTZOK+hA=;
 b=CCFHiNjBDXroTzs8e9or0HkqiMNqeC30Zuf2/TXZCb5qyPZYuOaMNa2PM+qukdVfRe
 WWaif74OXu22t2m9JMAZMdgxQqAkALENVCDmByl/wj6PHkcSPWthCygttMTaRr7R2K/s
 rWDTXAxo/clxU0U1lzKM84Vb0G8r6U2ZVD4MCfb9pZxUcH46VrwpMfoIpV/Tty6yIrKq
 VLxF/8Wbb8Sih4rlc8fEft6QooWM55UOP0X3fw8QmFrvQokDXHIQh0Qxmpvof/PoerJ5
 BffAQibmPnke2IX18j8Rb5JaOkPKBiN0FSAKGJXMg6p3dSflVXbtaeoimczXmuXH0Otq
 kGVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqSkoz/Tx2sQachJj2YbCBptsYEdd0/9QWHOkJ2LPKxs5vnsqNCYs0ZJ6lBFMtIzFrOrwo+PtGQA==@nongnu.org
X-Gm-Message-State: AOJu0YzORmqq8tyXlY5beS+86vJMk0Ed7cH9XtU3e/q5EBJWqFplpVNf
 QUFBlkRxyliyDm72IOkPMpqFvQ25q6URD6xd4UpNIMWKbZinYuof+zDn
X-Gm-Gg: AR+sD12taBEjA+ORpFWKjLMCL4aDEpBkwVvzU3NlveK6mVQOLZ4TUDK6dE7gYizk5Wm
 5WwoQQug3Bxee4xHW07pCSj06tiiIY8A7KQ9Hv2ImyV3dmq43swD2+wcTco+M2DRtOQmUHkKOsd
 bzT0j8PqB7rzftgBk3mDdmCEXTCwg0PGWV3PewlyxVXtZFg2ccrDyZ+346WnMLm/V31dXF8ZaOK
 iZiiQIazPNCXmuSWcx/PSU3/Yfhp+UM0DShcA5gSp7rmu2YlahEySgK35azHYgtLRBW/KsPG6GS
 3xUWipp5Nw+RAnXZpLjEvsGv5KXtU47kIHGFL2094A6zFV0iV6yHxY9yVVFotiuBIXAomA05bhP
 xfX1wQWEpfezwVFOtoS1xKPtCAxvIyPaHQNXI1Rdmnh2iruLb/A3SlkFENCL/jeys5mXlxtFUM4
 pnVJPGaIwU9t6T+tpVWAmhzt5QWUAcbBJOzA==
X-Received: by 2002:a05:6820:1628:b0:6a3:c6f8:4ca4 with SMTP id
 006d021491bc7-6aad3f90df4mr1639787eaf.6.1784825039198; 
 Thu, 23 Jul 2026 09:43:59 -0700 (PDT)
Received: from HPE-2MQ6131DV6.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ee29db2830sm3884183a34.2.2026.07.23.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 09:43:58 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH] hw/misc/mps2-scc.c: fix scc_partno() and cfg7 write
Date: Thu, 23 Jul 2026 11:43:57 -0500
Message-Id: <20260723164357.1462-1-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Increase the extract32 length from 8 to 12. The Primary part number is
defined as bits[15:4] by the "SSE-310 with M85 and U55 FPGA"
documentation. For example for the mps3-an547, 0x547 is 12 bits but we
only return 8 bits right now.

Change the CFG7 write function to modify the correct variable.

Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 hw/misc/mps2-scc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 7877b31479..554b504c72 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -57,7 +57,7 @@ REG32(ID, 0xFFC)
 static int scc_partno(MPS2SCC *s)
 {
     /* Return the partno field of the SCC_ID (0x524, 0x511, etc) */
-    return extract32(s->id, 4, 8);
+    return extract32(s->id, 4, 12);
 }
 
 /* Is CFG_REG2 present? */
@@ -299,7 +299,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
             goto bad_offset;
         }
         /* AN536: Core 1 vector table base address */
-        s->cfg6 = value;
+        s->cfg7 = value;
         break;
     case A_CFGDATA_OUT:
         s->cfgdata_out = value;
-- 
2.34.1


