Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3325082lfb;
        Thu, 23 Dec 2021 04:23:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZLHCdim4c4jaoNBvgsGkWnOl88yfqGb/MXGv3QcQjohzaeJyufJV2WSR3kFmt67GQ/6ic
X-Received: by 2002:a25:b3c2:: with SMTP id x2mr2984656ybf.565.1640262211062;
        Thu, 23 Dec 2021 04:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262211; cv=none;
        d=google.com; s=arc-20160816;
        b=rX5mLFuyxCyLQqJak/lt8BMy2MPU2ghXUvj9t7Hp3vu1wvhVg2e2vzEyBsAWaPYpoN
         YqFdf7k3uLEdZ04ThMp9NgQ4Qz1zt3OJ4YMNDBEs1s/9Gfu7dZkiWmotwxv5DURzaza5
         qITLMoi/g26pq9w1da4mTWQCCGxEVVB1MWT6NtLxEIeNy7+scww8whAY+4QVl/KouEDz
         sACfa19opwOvNI3N6JdF8VdJzhMVeb4wzdahmNZ2NySyG2BxCBEVItPv8RwqIuX9zQQk
         qFmMZtSVphoJ97H8Dx6D9NAI9O+dpVc93SZ5fFqXoYtDSVE8s0eGhxVRdyEm0Rq8QbBd
         ycsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cIMQ6+5zcOJyU3/jxVV3Bhh/HwifxZgqMUUJxuhYIK8=;
        b=RRPO9jNd407lArNXI4/ITABCotpfYX8amik3BrziQJDNuT4zCzgDJ9njSXGy1lrSTf
         vb3tpMEYMh2uhh8mNsf+4ZP9spFbqgItixHZUdaNMV/nqQ7f9VQrVRWPwC0Fy/xNaryP
         L8CdxCpnhRm5Imt6Dtq7/d1HmE1visw70zhlscqcX+0GjcfQmeHn2wReIyhkmiXyYAMg
         HXpbQQDPomA6bUw5zEnVePbQj0Jwrcz73h5ZZ3+6r+69hBUpm7VBJKfLq0ga49Sh4ABK
         bgww/Tu+E94v1YoygcEHW9J1GZ5BWg5Bs07C0Az1v232yOveX90SPxTLLaDp7mvs+5pL
         Z3bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CoUhDRpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si5484592ybm.324.2021.12.23.04.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CoUhDRpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0N86-0000JX-FK
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mk0-0001cT-PB
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjz-0000u1-AQ
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIMQ6+5zcOJyU3/jxVV3Bhh/HwifxZgqMUUJxuhYIK8=;
 b=CoUhDRpZJ8CTtfZdXdxP0OcGsC6x3LADYcUl/2J5JC0xQ1Suhag4RgdqU6fKdwyNUxvsMB
 3qWXqff5uMAlh4EkhzP6bkqDg98rOAwOtLssVrtBh1TlRbGjE5xZCJIV1aIOBolBiqac3q
 vXnHHMX0ZldVsaXWU8R494xMxxTY6F8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-GpR33aRNNhS7YzCmLJFBUg-1; Thu, 23 Dec 2021 06:58:28 -0500
X-MC-Unique: GpR33aRNNhS7YzCmLJFBUg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so1222311wrb.9
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIMQ6+5zcOJyU3/jxVV3Bhh/HwifxZgqMUUJxuhYIK8=;
 b=Gg9t7C4bLb0zlDcUut17N9iRyG2qyLsO2nR1KvE7bBPuCo1hhohXRFi3dZre5Ms1ZD
 O4CQNHEVs0BPojbJFjl8qiFX/lnIeFOnZXRCnaN3BYJ/Ovdic9HT6rTbZOgqS1a+lyVz
 +x+PfQZ4ITTqOH5ni/lMNlDD87p94v132Wb7Rm1pUutKB6L+o0CUfKBkBRutY6Jv0UAu
 jqsi5aipgM2WucyXccvdAGeyYI4JAS5wgdbQxG5bf78TcTIt3B249NKrma1DfaEEh9J9
 kp4DKeMR7MCz2rn2m6NUaUYZOKr9jMyVjXxza11dMrGr+esPTkbSwdzkmsWzpLCoTpiB
 Fqzw==
X-Gm-Message-State: AOAM531Nh/5xEX3THmSdEMQGOvQ+3ia+V8sMZrqyNQ+XMUI9FpxG4FC+
 fa3+MSx4SSsSLy4WsN/V0Xq00a0FBbkAtydG27s4xaiAY/OnAOGAwl29pvX76YMh6h4BguH5AjO
 cYAeePH8NTZoH
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr1453659wmj.3.1640260707523;
 Thu, 23 Dec 2021 03:58:27 -0800 (PST)
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr1453641wmj.3.1640260707375;
 Thu, 23 Dec 2021 03:58:27 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id l13sm5229854wrs.73.2021.12.23.03.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] dma: Let dma_buf_rw() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:41 +0100
Message-Id: <20211223115554.3155328-11-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XY0WBHSGyCU

Let devices specify transaction attributes when calling dma_buf_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7f37548394e..fa81d2b386c 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 
 
 static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir)
+                           DMADirection dir, MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
-                      MEMTXATTRS_UNSPECIFIED);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1

