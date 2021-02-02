Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp513806lfo;
        Tue, 2 Feb 2021 15:04:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxgZWKN3LvOLtjU1Myc7dnlrMvK9VaiQ4Z+JCiA8KRdDDysXfafGQ3LleU/Iy5m8fcKRWC
X-Received: by 2002:a25:a527:: with SMTP id h36mr332926ybi.400.1612307095825;
        Tue, 02 Feb 2021 15:04:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612307095; cv=none;
        d=google.com; s=arc-20160816;
        b=aYfmQxSi0OsMJGNiXJxGzvxgRenUAOG2jHrimTlCpXZ5UXRiE2jWgO3hMD3eQob8sv
         6k83wGz4HqoiNCvxjHmOPxzLBUE7DIBPgG1/pcaOXx6sKVpTfWbzp/AlhapcsAsv6sWK
         xYDWfst5oBTvoB+rFF9ZMM8CZtsLqCvY5T+Klo4BwtVcidcokgwj4es8O7ivKKe586o0
         ONDEHmhcfKXvCH2JRMEY4+UBVqu7ozG3FNMR8WHupbj2u5zRtT6y6WxBgg4t2dsIgzTy
         NmnJagFWYeVWly5CO/YK7iMUPY1M9XTQiPNxCpryl5iWt7Ac2PcGiemF+l9U/X1iOgaB
         ih/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:mime-version:message-id:subject:to:from:date
         :dkim-signature;
        bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
        b=Z2scIZGiNQpdee+b0btsgy2RocfqiadaNr4BuUydvZENMGHV5Dv7PbPZ53zOJp5GNZ
         yRrOOAzxSGlSWSMGqGFGLbLizXW7bvz/y7FBp+Vn7y2v0jaLTZKR4thiraAg3X/sp4IJ
         zRJcV2G0YzvLDjYptADytguDL0ofGKkkkM+iVWUxIvcqVLgos4QRLBzHxGiA76D9NUgE
         0lsSD5FwM6kD7lNYvV6GEMVucEeJG590zOFziXLT8FVYus0cOLoiSoa0mMHramuooFHN
         rkbNc+Vrvv9xuJwunfVfu6NnBtoAyWP5ytx95xB5s02kjiKaob9EAmRb2pARWsFkDEgu
         LxKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ew/xlNWH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c205si355708ybf.432.2021.02.02.15.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 15:04:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Ew/xlNWH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l74j9-0004uU-7s
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 18:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74bJ-0005Zn-4T
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 17:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74bE-0002K0-AS
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 17:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612306603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=Ew/xlNWHrRzh+2jnXa0RNhmGD5CreDPRh0m+JzMaOwIgy2Ix5DRvSR5TqKs0ORh0i0/7ah
 GipyVNYu9nZI+CmxakKqyf92PNTu62JL47dJxuBU871c2dlWJhJM6/tcQQdvG+62KmfN4c
 7U5BQ7BDfr2+jFtPYvxRNBhHiUrxd7M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-1KNnMjpOOgGy8oSzz55R9Q-1; Tue, 02 Feb 2021 17:56:42 -0500
X-MC-Unique: 1KNnMjpOOgGy8oSzz55R9Q-1
Received: by mail-wm1-f69.google.com with SMTP id y9so2123087wmi.8
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 14:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=gCcjiMFShXaOEekrfF0FLx+6S2dt/jpY7hKZDJL06BMfK3o00efiioFw2NutItFgbU
 XzTXecipAYYkdk2+le5kboXVbFWsyPLGVQIJAwGHDqI4xki1i+Wte338B8Jjug1co7f0
 l/PaCy+za6/Qqam+YaNpJXiKxSL3EAzUiz91h+dhTXjysW0Dak6fC/ueoSrcmhakvrco
 +G+Ic81yrz1cVuhbNSEksSPBg6Gv7tB7jF3jX915L2o+yMLdfi7EJPPJ8VnjGe4MSxsJ
 s+DStiUC/bfLEFhkmXnWO9Ap9taedI95KKt0FspKN9ApZ0PGYa934LTwMwWAo/LVL38T
 gJbg==
X-Gm-Message-State: AOAM533HDJn6XwOixI381cTxP5aYF9PV203B0A/jB2cWTojLcr7ZStPb
 UpoZtNUnDNlW6BLNgetCs8VUn0nhENan5Y7nM4SYc9Oli2ahmyMmRY1XGUlq4H8ZFcu4VkZp6Vf
 SA7O+cvFDCWHM
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr183898wmq.175.1612306601134; 
 Tue, 02 Feb 2021 14:56:41 -0800 (PST)
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr183887wmq.175.1612306600967; 
 Tue, 02 Feb 2021 14:56:40 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id h18sm98819wru.65.2021.02.02.14.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 14:56:40 -0800 (PST)
Date: Tue, 2 Feb 2021 17:56:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi: use constants as strncpy limit
Message-ID: <20210202225636.1607306-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAfvs+r0DRLJ

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

