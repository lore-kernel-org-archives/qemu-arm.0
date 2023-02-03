Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1642501ejb;
        Fri, 3 Feb 2023 10:10:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+tLKxQcPuaNQOxlRC9zzwnKn00MsO6uQjqK8zIG9ehzaUlnju4309YZa2TsDhGt1yPBXeJ
X-Received: by 2002:a67:e191:0:b0:3fb:d6b5:49ec with SMTP id e17-20020a67e191000000b003fbd6b549ecmr6039231vsl.23.1675447819910;
        Fri, 03 Feb 2023 10:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447819; cv=none;
        d=google.com; s=arc-20160816;
        b=N0iQ1gcKZ3ZlFPu6YscMpnJdGpnAnkVSBk/nP5aUbWi3HrR/gjAKp3UdqnWNmC7rEF
         Vnii3UMIKlz1pbia2GrkMZRoLnonlF0TzF2xYpdyC4aMZJbwu/v7h7m2Mpr1+kMwZe8G
         a4d5t/2m1fDEtwJyAqJ6tqyJNzLijj8UrVvyqGzSe3f+P1A2D7atmjJ8CvxuQ2wDCnZl
         33KIatrL0Eaq4IsDbU5SDqEKVpjeFtzbkLsZEst8XeX0KfQxd6dz8efOgsi+vRhzwvN7
         jd/xJUJTz8NGk7mzo3YdHq0AhA2cDOGQWIJtarw4YCgG+4HSDo43+1ePA7/sz6lOhpT+
         vYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
        b=FO8TcUphhSjqj9X5VO7HZGVPA8gMj9oZwa77HKoF2I2Pt1FcB+0QVDBO6ZAzfJbjaW
         psjPOfOdDeXNMkUp5omcDtT0EEJvQ8iRb4+HQRebmL5hu7agFP3/5n+PP7XOY6da88wg
         kdS9BcQos38PC1gVhJh1p15cLYBoBPFNdXG/PG/4+Qo/AqFmgRLT4JHVTN/+JL0335ck
         APaLBziKQOV1rArpgKYs6lOcKgywyImMlo7ceUAJpX/Eam195gYpbrB859zMqGVHOMnM
         SlZUvwk1gFuDYsAkrWuCxB1ihY4/b55UbbPv0yFWyPWN2O6TutL7lPtyRtEIYk+QhsBY
         +Paw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1WjmgwM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a67f6c9000000b003ccb62aee1fsi867079vso.410.2023.02.03.10.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:10:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1WjmgwM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0VY-0007iq-Oj; Fri, 03 Feb 2023 13:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VX-0007f3-QR
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VW-0008GL-5G
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso4499882wms.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=m1WjmgwMPOsNtLA5YA0t19cIA3HGnEQVECoOhLU6AGpzzoZQbcGqpC0JvenMkr52s3
 +nXpucNnq828lAZTK+n3yA3GMjt4hoBXVPrlEm8NOds3KrxM6x63NJxhDptUlqTEof2H
 5Pv9svm6Qdyjxjr7FFrxZ1nUGGg6V2EOysUSqxPFc+SlY3JDuIsbW9K0ftIHSjOWo2Aj
 rAQv87SvACTrrEY82Ch7p3q9Dij2pnj6OQfJAUI0Wyo4cV9hc/bCA3j25ofvY9GVqEDV
 m375OaiEzlgiKCsxl/n5c5MDU5+Tc9HIYlEZ9iH8QtFK3YcukSCoVH5tWdwmnCyVnyar
 nezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=8I0TqfvqOHrOmgBrxZRL0g2iYL8P6dyTHmcohpMVPlEA92p33U0zYJPzp6JEQ6N4zP
 XaNlYBpjphwzbpiBDlXI3sLFBofNc7kRRLYWMyejP+GBh81Ac5Zi5TeYTVLQye0Iwgf+
 109Ty4wRANyx7knprzg0dHzz1O9wK5EspfFuF2m6uN5oYgmi47tf4Ba8B5x69qDnmncV
 Xs/H+HLHYE1e0B2vVEdfWzPasumyLp5RiH+QdCqdMrab37uBseYmBAdD/Q76qIyTIM/K
 /TBpdxlCWcl/tYxHK2jkeidrfpBeM1J3HcZCblcwGXXLxVl9jrF14aTylvtfxX04A2NP
 KmzA==
X-Gm-Message-State: AO0yUKVvRSvo8VmLFinaHdtmSpe56CzLxfXBK3m2OTZ4w+/M/JlZB0F4
 XErMs+rtuaELaJ2q8edjpNowGg==
X-Received: by 2002:a1c:f307:0:b0:3dc:50be:9206 with SMTP id
 q7-20020a1cf307000000b003dc50be9206mr11541740wmq.4.1675447792935; 
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d4449000000b002c3cf230b60sm2184162wrr.73.2023.02.03.10.09.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [RFC PATCH 07/19] hw/scsi: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:02 +0100
Message-Id: <20230203180914.49112-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j6Dnc9MwSjrb

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-bus.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..a8003126c4 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -347,11 +347,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
         object_unparent(OBJECT(dev));
         return NULL;
     }
-    if (!object_property_set_bool(OBJECT(dev), "share-rw", share_rw, errp)) {
-        object_unparent(OBJECT(dev));
-        return NULL;
-    }
-
+    qdev_prop_set_bit(dev, "share-rw", share_rw);
     qdev_prop_set_enum(dev, "rerror", rerror);
     qdev_prop_set_enum(dev, "werror", werror);
 
-- 
2.38.1

