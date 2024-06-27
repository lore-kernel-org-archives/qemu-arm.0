Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309779njb;
        Thu, 27 Jun 2024 09:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsXrSRciB3GraH1XfD1G67anCkDN8DV4rsEymxpnVX4ByXzeWSC7AJpOLNMPdRfR6GFsAGjYVEKfDvCT3KA0GPZlx3Uia9
X-Google-Smtp-Source: AGHT+IHEvA273xyXACEXHZj2GTzrDkhYOHnM8XDcy4I1SDz8gPZz2GMJta2FzIIIsjPhAmB4kV4G
X-Received: by 2002:a0c:e08f:0:b0:6b5:613:5acd with SMTP id 6a1803df08f44-6b5409e013bmr150018516d6.31.1719505467385;
        Thu, 27 Jun 2024 09:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505467; cv=none;
        d=google.com; s=arc-20160816;
        b=Kx+dUIPnYLIpMXBTjzyNe8WMaxzNZkUbvJtRvk7R+qEA5+DZoKnmFGYpfZiO6TZ7f7
         uItzD6g6Q+KFx0yBGpS0ZnTTLarQ2sdMlahXkdiSHILZnLS0FPrZm1z/eJuFTIOpAxX3
         t9c7DXmChJV3nw17Q3Y4fuw6zEPiB8mjmxF4h+AnkRnObJsW94/SJgQYipEbjrMGsQ8F
         x7QaSJAkBqaDo+f/yr4lKWbanog7fXVwBIq6PIbSwIDvwtXJis22hZqyKzTtBq974mCB
         xamoOD+YmugbD+Ll1P0huol50/Dr6jVRab5IhpsiZlf7+XjMXkf1rYn9wvoRUfUkgCX/
         udVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8X6AtOCpBUXAQ/1xHubY59Be7qdcbmyzPDPReyo42Nc=;
        fh=MS7+CsthrGX+7O+OZ1po6GQYA2KoTIDjvX87spD+pxw=;
        b=z4G1M7805Kwv4OGJFv2SEi0MFWW+oeJb+d3ikJNj97036UiHrndKH45creySLsKDPn
         Ml0tXfn/zPu6mMlN3fXMZTmAiyK2C5QNCYIvHwU/+PPJeuKikDIXRPaD30YOCeQnCibs
         L6ml6a7IFzT++aeBKLu79Nyz1Uf1rqw9OiznRgUlSvDRTrx9Z09dY2qceAsncbRKvrAI
         yZtoQitImJr7sx0T1r6kKYBUGzRCVI30lfkHr/hRyWq8yB0zeQ8OE8ItVhOFOaEBfoG3
         iaiPCLg6Xa17J5BREGotxtJvrNN1jKWiXSOpKACr1vA2veHQF5lirK0wZYuNPqXNM0H7
         6vUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDZhQmln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b592654083si16080746d6.193.2024.06.27.09.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDZhQmln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMruq-00052U-HK; Thu, 27 Jun 2024 12:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrun-0004oi-WA
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMruk-0008Ng-BJ
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:24:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-424acfff613so25428435e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505441; x=1720110241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8X6AtOCpBUXAQ/1xHubY59Be7qdcbmyzPDPReyo42Nc=;
 b=lDZhQmlnBgasyBcj7jL/oMVauEXD9X2Y2rsmp+UadHuV97/s1Eh3FHwyp3hgCMuCej
 SsAALmXkLtX4DC7I5wDGyE5b7PMMbH94WFnUoRFmVudWkw8Ka8FYQ3LiUToVlgLleG2j
 xgCZww43gkC3dK8tL1sOMOz8qBy7BE//cGvFgGFzOB7CJa03h7G2q8+dCHNy7mIOatHd
 jrKxlaXiejTZ2C3G+8EMFKQvTyPVkVFENEb1h+lfhnHaDPAre49mEd0nzxdGEFqqVAlu
 ZXe0N1ZQ7u6FSxW6TyFiFa6zft6vfHILVUA3C8aOSP4KoIkZbCz/RI27oUhOrKUda4Nc
 DaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505441; x=1720110241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8X6AtOCpBUXAQ/1xHubY59Be7qdcbmyzPDPReyo42Nc=;
 b=TZUHllct+UNRczzLjASriHN0I6A6oxpKHHG+AUAvKeQfh2cXEHSyttOJu8Ah1DzIqQ
 XnG/pFd/f3Mo9hsybHd116WQ8NbS4H0lr4/+CujoPgBFpzmoBWHLzs5R9Ps+OowdkEGj
 NxgooVzefNidWLA0mXyMkNGj8oNlC0cj8I78lCv1r4fU07jRbWqES4uI10DWooO0Td36
 S9tt6SzD0RyNTxO3PWzubdcu63NeGVGTgtlXqI1qCJocUVFjDxIn0bpJJO/ZpYDHucls
 lqsfJmdeq4H9ynUl7LcPv4QZMvAaStZGXQqCii0+iI0TuFJ/aHS8kDcK0UYNvgFB8ssE
 uRMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs+bZvkOmCee6zv5LVH65j3bOzBnLw14C4YuyZVsm0k/meHmJtxb/VjG+Zaab7JWbRpTjCL+ZtzK0Mzldw6vIPND/p
X-Gm-Message-State: AOJu0YzPrrq2ySzfmodtKDXZiWmswdBE1t05ahevoWexpTFIOOxFWVEd
 HfSXcpqSOW7vJ3uKn6o046Fi4FUTt6GwW01Cs4xUbFPgxpQBkUwXR9SF2ftq+W4=
X-Received: by 2002:a05:600c:4f07:b0:421:dd8c:35a3 with SMTP id
 5b1f17b1804b1-4248cc586d0mr116166515e9.26.1719505440758; 
 Thu, 27 Jun 2024 09:24:00 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8246b1dsm76798185e9.6.2024.06.27.09.23.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:24:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Date: Thu, 27 Jun 2024 18:22:21 +0200
Message-ID: <20240627162232.80428-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: nZpeiFYwX8R3

"General command" (GEN_CMD, CMD56) is described as:

  GEN_CMD is the same as the single block read or write
  commands (CMD24 or CMD17). The difference is that [...]
  the data block is not a memory payload data but has a
  vendor specific format and meaning.

Thus this block must not be stored overwriting data block
on underlying storage drive. Keep it in a dedicated
'vendor_data[]' array.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
RFC: Is it safe to reuse VMSTATE_UNUSED_V() (which happens
to be the same size)?

Cc: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>
---
 hw/sd/sd.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 464576751a..1f3eea6e84 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -142,6 +142,8 @@ struct SDState {
     uint64_t data_start;
     uint32_t data_offset;
     uint8_t data[512];
+    uint8_t vendor_data[512];
+
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
@@ -656,6 +658,7 @@ static void sd_reset(DeviceState *dev)
     sd->wp_switch = sd->blk ? !blk_is_writable(sd->blk) : false;
     sd->wp_group_bits = sect;
     sd->wp_group_bmap = bitmap_new(sd->wp_group_bits);
+    memset(sd->vendor_data, 0xec, sizeof(sd->vendor_data));
     memset(sd->function_group, 0, sizeof(sd->function_group));
     sd->erase_start = INVALID_ADDRESS;
     sd->erase_end = INVALID_ADDRESS;
@@ -771,7 +774,7 @@ static const VMStateDescription sd_vmstate = {
         VMSTATE_UINT64(data_start, SDState),
         VMSTATE_UINT32(data_offset, SDState),
         VMSTATE_UINT8_ARRAY(data, SDState, 512),
-        VMSTATE_UNUSED_V(1, 512),
+        VMSTATE_UINT8_ARRAY(vendor_data, SDState, 512),
         VMSTATE_BOOL(enable, SDState),
         VMSTATE_END_OF_LIST()
     },
@@ -2029,9 +2032,8 @@ void sd_write_byte(SDState *sd, uint8_t value)
         break;
 
     case 56:  /* CMD56:  GEN_CMD */
-        sd->data[sd->data_offset ++] = value;
-        if (sd->data_offset >= sd->blk_len) {
-            APP_WRITE_BLOCK(sd->data_start, sd->data_offset);
+        sd->vendor_data[sd->data_offset ++] = value;
+        if (sd->data_offset >= sizeof(sd->vendor_data)) {
             sd->state = sd_transfer_state;
         }
         break;
@@ -2165,12 +2167,11 @@ uint8_t sd_read_byte(SDState *sd)
         break;
 
     case 56:  /* CMD56:  GEN_CMD */
-        if (sd->data_offset == 0)
-            APP_READ_BLOCK(sd->data_start, sd->blk_len);
-        ret = sd->data[sd->data_offset ++];
+        ret = sd->vendor_data[sd->data_offset ++];
 
-        if (sd->data_offset >= sd->blk_len)
+        if (sd->data_offset >= sizeof(sd->vendor_data)) {
             sd->state = sd_transfer_state;
+        }
         break;
 
     default:
-- 
2.41.0

