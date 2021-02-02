Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp509334lfo;
        Tue, 2 Feb 2021 14:57:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2+h6yf9iySqD2wKy6nSH/bMM+uHuievWgPU8K51+SOMgHCSHBcT9+VT8EIpvXsu6SqFG4
X-Received: by 2002:a25:d186:: with SMTP id i128mr349418ybg.46.1612306652168;
        Tue, 02 Feb 2021 14:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612306652; cv=none;
        d=google.com; s=arc-20160816;
        b=1B794L94m3FlDEeeu5MaFg7jWj53KCcnAUlG1MkZCzYwYVnbGRmu8kzGZeA0d0TghD
         leggcOoujgulHI+95kJtsxiXvwMNlMRNmRbG91YSzUpsVPJGyXfAwBS2Yo5JpMYFMQ5s
         9D++MAqv/Dfgh2UNZz4jHmw7O0HphlPCBDOPeHyC0gEL7A6kdOjre8HCz6haNqiyZR+U
         ESwODSWT7ZxXw4sVqEzMqGGLQ+e+SdlmabspeXW9F/ZphX56eFFZizIgiTyO/2MQytUb
         DCGV3JlK5/HbP0GttSgD0avwU3LBhcT3GSUbQOCVTtj2xZGUqoec8oS917GYNWsNkXso
         zx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:mime-version:message-id:subject:to:from:date
         :dkim-signature;
        bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
        b=ChpN0iwR3oWe5VfrWumvnLpEtXx5i6NJt5qT9tPtuQtqjBiNfTv2D6wtYppsmubZVs
         HKOsWm7L7oaHWvDdmZH7OXIXfjHSFyz1TCxJXv0ulR9qZ8PlILL+jtnoEipivTuo2FNI
         QMjcRQ+Ktt4rqtclLxMGc5HLCkRf/JgF+b815Kug1O0f5OquhSLrqP8GSwgkuGt0Ic6o
         6Hy4SxpO5uVdFH40qgF4GTBCEYA3KhcO05pKudx44hwb7hLwFsypQyLeR/gJ5debXsPk
         2VNTMWSn0doEDEH5IbPA+uIOIBSBK6kzKHmtqIzlC79sJ7SY+27m7dxre5NR5j5EXg0p
         ZdAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYRlw4Tz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c141si302283ybf.205.2021.02.02.14.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 14:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYRlw4Tz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l74bz-0005il-HV
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 17:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74aW-0004qJ-Tm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74aU-0001ue-QR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612306557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=BYRlw4TztqHdAW+jSF8ej/8ENCRBS65/HvAwMXLK2ixHlYolsJGDXcK0JH9psvqgLa17YB
 DstSkM2t+Z5ivWECg3jOEz1N7tH7cMTdIYeDShtVWQTD5W8GfBolEgWBePnnvIkyIg/aJQ
 BvGDbunPDnwIxOknpYHvn0dK9seZdRo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-u70gNYaFOje7ydqaiLEUZw-1; Tue, 02 Feb 2021 17:55:55 -0500
X-MC-Unique: u70gNYaFOje7ydqaiLEUZw-1
Received: by mail-wr1-f71.google.com with SMTP id e15so13257786wrm.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=ki81VLBx01ACCaGFUPz5jOg/wtp/jtZns6+Mk3wKvXLdMv2FAsuBfIhp90O72wKIuK
 qwzKbYb5BfS7xv0m/axaVdxFHMvPmMTOMZQzZO9mYZLXr57PYjsWKwz6JwY8FwHUb+zf
 aJqPbMOUOP91VhlEW17EZ9TfqUaoq+TA/NxEgUyOHo19Dae/JJzJCparVswLlt9MiN9k
 mcLgtVLo7SaWVI+Onef+TiO9lzW+IgpzwbgJn1MmaF2m+Yn1xwOKNJ5lSA/gOK1hCRqr
 dSlcxUXqGPlldAIAZ29WYUMB6V8Q0jjerLj8rx6W2vNZl2acOBvB/iANAKe3Hjc4vuYy
 QeJw==
X-Gm-Message-State: AOAM531vkn4/qj/XDSyniV8IpLttH5Quf8xgw+52KA2EfFlg/Ix/RFKq
 1+WVvXvENCUT7Y7a4xc9bnFU8nn9lG+3l4bN/voefrLVejwPNDbPj74REch9A4pjZCmBh/hFlOE
 atKJm/jCgv9cD/OGRd+KOKHvRaB0aUMQNEzAXhbhNsgYeWJq8yKMCnGLWa7SE
X-Received: by 2002:a5d:6685:: with SMTP id l5mr321608wru.176.1612306554047;
 Tue, 02 Feb 2021 14:55:54 -0800 (PST)
X-Received: by 2002:a5d:6685:: with SMTP id l5mr321592wru.176.1612306553847;
 Tue, 02 Feb 2021 14:55:53 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id i7sm111002wru.49.2021.02.02.14.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 14:55:53 -0800 (PST)
Date: Tue, 2 Feb 2021 17:55:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi: use constants as strncpy limit
Message-ID: <20210202225548.1607168-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0XPKcd9TMEik

gcc is not smart enough to figure out length was validated before use as
strncpy limit, resulting in this warning:

inlined from ‘virt_set_oem_table_id’ at ../../hw/arm/virt.c:2197:5:
/usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
‘__builtin_strncpy’ specified bound depends on the length of the
source argument [-Werror=stringop-overflow=]

Simplify things by using a constant limit instead.

Fixes: 97fc5d507fca ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecb0e14816..f538194e32 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2107,7 +2107,7 @@ static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
         return;
     }
 
-    strncpy(vms->oem_id, value, len + 1);
+    strncpy(vms->oem_id, value, 6);
 }
 
 static char *virt_get_oem_table_id(Object *obj, Error **errp)
@@ -2128,7 +2128,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
                    "User specified oem-table-id value is bigger than 8 bytes in size");
         return;
     }
-    strncpy(vms->oem_table_id, value, len + 1);
+    strncpy(vms->oem_table_id, value, 8);
 }
 
 
-- 
MST

