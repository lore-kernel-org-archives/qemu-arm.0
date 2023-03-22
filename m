Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5583593ejb;
        Wed, 22 Mar 2023 10:57:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9B3AJio8o4QPryOGOjedCZl7AvEtas0vuh0zP4IgJAU7CLHMdQRJfg7j2sxrCW28uePFYX
X-Received: by 2002:ac8:5c0f:0:b0:3df:6b5:d12c with SMTP id i15-20020ac85c0f000000b003df06b5d12cmr7134839qti.32.1679507847578;
        Wed, 22 Mar 2023 10:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679507847; cv=none;
        d=google.com; s=arc-20160816;
        b=n0KLbzLOtAB4/fQysUGUI7/e0F3AQ5oqiQiet2+XvZ9W9c8XIXAGeBDGSxb52gOQMW
         CRTUZ/MA3mOHMYKCb5onrrre5OOnKsVXf7YNgoLHqq+szNTRiVs/RwdCPtYVukbXmCLe
         sGP7zi/a+6dz9reELp7wY63hHIU6scFEpIHYYheQfWpxN8aE3nE6c5PVQLOAMLOXaaUq
         mS5k3xx/Hlhr4B4OXBmV+4FZgWXxihjvkievU05xinCDu0VjsS9QPFWE1+JQh2ENM3t7
         zZM12AkPHevg5Q0sQUPhZ/hgpaNLzhrhdoXmsgIz9q+UUIbZ+1DdG+SPV5fBHaZazYs0
         Rn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=5/Dadg8m/Nn6NEOd+UqaKmTnByQM0BpngrWfhpbEyYg=;
        b=LhQJo9lGTh8edYtstQkKJeS/iXtq9e5OT9LpfzkkehGjUSkhjrLnar1sn2zfQSsWWj
         f0l9B4zqOVsess56eSwalSktBcyKsc/6CyJv97b0elXi9TUtc+UUtVQ9JJKhlqUCGUcO
         rIzjgH0Hnij+y422/16eB7TSCl3oED9MN6cuosYBsbWpBHwRE6r94LExETNedjBKU8ve
         lMvPXryZto/SrDogivlsRfrOwLzQrW7QbJ+flrjf7piugHlRmAtgj4Ft7AcblhUO/tnj
         uOb+oBrHxtyzgGtTvSp2m2Dfsfr/GoeF6HJscHmYU/LQThGdGT7TnKd3wk5GuNbc+hZa
         /FqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=F1itLqKh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac84e53000000b003e1f7e67ee2si6160780qtw.50.2023.03.22.10.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 10:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=F1itLqKh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf2hZ-0000Ba-7a; Wed, 22 Mar 2023 13:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com>)
 id 1pf2hX-0000B2-EV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:43 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com>)
 id 1pf2hV-0002H6-Sv
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 13:56:43 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-536d63d17dbso197694457b3.22
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5/Dadg8m/Nn6NEOd+UqaKmTnByQM0BpngrWfhpbEyYg=;
 b=F1itLqKhKt9whbHkXAzqNSS6zyDHCFIxRjbLNZINzTpJa8BCd9hvDypXX7pxdWglam
 QZVABlGCcn9409/bor2HXCP38XGldAVfDJvgu7HgFYDVOLj2CYoOGTNFRk6+e2ZZ+473
 rPHNfSP4QU4SzN+SZvQnINk6NFtimfQQ98sGq8deUMmZAd1NpQbfoWehh6pQF2WjVT2/
 avBfiuyE7wRW8PgAnrD3ziQfeWWIos888NyPyRgLQt0PHhoKSU18dBafcUjKagIrnrFa
 P8TrO0WNXYxDfpr7vMpP91xPOMYpqgH7BNO8RNKVZGoUi/AGOj7BqQklOhtev72iWSwV
 lIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5/Dadg8m/Nn6NEOd+UqaKmTnByQM0BpngrWfhpbEyYg=;
 b=drY64ufKXD9nZLJ3ZTtVJgSPv7dhihRiGwybZUM4xSu1sQJItSJ/PStaLtvI4aek1e
 o0sNdGiDSLFMnqX72AGPD2Nk9FF1zortjSEaFXnCH4269iPUPcIlYwKzGB99WUpASqGd
 xO5ltWJf3qwWI9ddMxD1EB52Q1cSvhn1jekFHrYYhVTNkfBDeI6amttnI41z+CA8DVtK
 JKeKbZy6kA9VbAkwI+dXIoB1OdvgHoBmH+0QTsYn6tbfKvQIaNOfbReYdQD0lPCwhK9z
 dFbAvrrsoFjVD1MrJH1Tirx7JlleJlhPHx/VH2wUwW3cw4LKT1CtFIZ17QKbC3Q4FlXQ
 347Q==
X-Gm-Message-State: AAQBX9e0hy38tvdmfmVIW7xT8TjFz1avfuweSh7hd8ZMlugODE7HBP/G
 x7friQtIluNBNx/hEvaVG1z9crDt78w=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:1141:b0:91d:98cd:bfe4 with SMTP id
 p1-20020a056902114100b0091d98cdbfe4mr407835ybu.10.1679507796245; Wed, 22 Mar
 2023 10:56:36 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:13 +0000
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Mime-Version: 1.0
References: <20230322175513.1550412-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-6-titusr@google.com>
Subject: [PATCH 5/5] hw/i2c: pmbus: add VCAP register
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3VEEbZAYKCmscRcdbaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K3ysfMopDQZa

VCAP is a register for devices with energy storage capacitors.

Reviewed-by: Benjamin Streb <bstreb@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 8 ++++++++
 include/hw/i2c/pmbus_device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 18e629eaac..ef0314a913 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -903,6 +903,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_READ_VCAP:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VCAP) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vcap);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_VOUT:                 /* Read-Only word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmbus_send16(pmdev, pmdev->pages[index].read_vout);
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index ad431bdc7c..f195c11384 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -243,6 +243,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_VIN_RATING          BIT_ULL(13)
 #define PB_HAS_VOUT_RATING         BIT_ULL(14)
 #define PB_HAS_VOUT_MODE           BIT_ULL(15)
+#define PB_HAS_VCAP                BIT_ULL(16)
 #define PB_HAS_IOUT                BIT_ULL(21)
 #define PB_HAS_IIN                 BIT_ULL(22)
 #define PB_HAS_IOUT_RATING         BIT_ULL(23)
-- 
2.40.0.rc1.284.g88254d51c5-goog

