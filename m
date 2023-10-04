Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2816995ejb;
        Wed, 4 Oct 2023 10:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDpWcQivd4MI34/l/5DWovOBg1u94sjq/Bjmp87AaGESL1fq18Jx+XVNhO02WHFe9Cf4i2
X-Received: by 2002:a1f:6d84:0:b0:48f:8891:296b with SMTP id i126-20020a1f6d84000000b0048f8891296bmr2731458vkc.0.1696440752130;
        Wed, 04 Oct 2023 10:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440752; cv=none;
        d=google.com; s=arc-20160816;
        b=QxLGmRGmXQ0AV7W0U5RRHlN28/tXFWJoG4ghEI6UvVw0p9RTlkakPq1BLVRPh6sT34
         29wOjx/6vgJOHVrZB1mqwWCJLqK6Q1LGFFu6abRFeuNEA8N9SKPhBQuS5w9OHpOULDnq
         BdJoYfkO9+PnXneGrqBoVjV6CAGKkp7k2e4MAVGiXtJFDguQcS/S3ngkQ7NJRf2fDPqs
         7zFS2zw8U8zex9otTxTxwmRsAl6uwRnYQlYJnEUGUE/Iqjbp629zvPpgNJG52a3T9V6l
         JYHVTq/EHsxBKFyJrq0DXp6WELW1IleGf1jolUiA8wmVciunqgZvVSRYzXKinUSt3bzw
         WlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
        fh=RLjMdrD0xkVqRXYK6T+wVMkB3iYvrfgMsf3ZYSWqt/g=;
        b=PMa//2zomg1LjWsgM7Ojnl0ZR5JUDJq8TOjRAK+hIsT7pM7ISyhGZi6CEV/hKuQFiX
         z4mKeIGFt1Fnk0D4hO8w6zoOWOP2nuInX8Ehsjw5PREpuZce6l9im4zbW/mcy0tsJy0R
         Nsz0uqlZKmmZd9yFkamefxJm+5O6rpLJ/a866MslYAM1K+czIdaSjBDE3nqWJyT/xi8t
         nc1xN9oiY6xt8o5zS7wvaoMyFpociwMPTj7iVxJm7NODBp5sjB1zG2IdcMFja7mO/xQE
         wsOwiIcZRtnmaywNCq3ov3/BWX5uQuH8Y3+uU5XB3GUTGJ3FHLNxYFLG2aS+d5yJWLSB
         mcUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSp17taa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05622a145500b0041981f6b2e5si1718485qtx.566.2023.10.04.10.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSp17taa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5jY-0003BH-AJ; Wed, 04 Oct 2023 13:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jW-00039H-0P
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jU-0000wN-94
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-327b7e08456so108756f8f.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440742; x=1697045542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
 b=VSp17taar6VbWZfp9AnJdLculXNb7EzI8Dnwscv462lHqLzlYqw/y4CyFkunO52/dE
 cxPizSyaUzKfJrRTlWCUMkKSO8IoVKOe9lFeJ62WykY8apykTO7EerUUAxQAYperJGcI
 CbGBc439kYpxUy04d2iXe+BmI6JzixbKIv6LVGJ2Px6y8WtizoEoo5NvVZC23HvQZurw
 yXOWufh8COCAVsQeYzDx+L+xwLwPJJCIoS6nFphY5RorLQcwd2jTrMXxlO05dQA9IQ7a
 JxkRcbdF5s4FezaXNdyQmQEY8LEHO9Vp95TGjZ76wQYX1CvrbWPUvLbrIcjN1fEM/4wD
 Razg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440742; x=1697045542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBDxOWnGC99luImlqjntVhvHvQ5f4z9cF2Uz6KLOjxk=;
 b=IPY8e7VMVb2a2cNau3GaPdcYBiY4gH4cb2xVn+8mfPnZJyemGORCVuLW9aoj9ZdHZQ
 3X+iwL443v3hrxkzXV4aa65ryajamNzvUzxRGI0SuQYza3nsWRzjManeFvirn/kgqFAH
 /D5cvlRKzckZvNWdkXWgZ3E913ZZXfPLAhACs5UU2Ibj/g4ETSyypZELR+lZpwtFCRNZ
 YOiyVYEVo7CFQ2+NpeuMD1QwItsYNzOMuYwra8JFcnHyYJZXV44Z7gH6R47Q1siCx2n0
 +5gCWlu1CX3SYNSos305OV7lFCi8wS8DtBPdnlrXZW3iFFKQfpQi6gzsgsbO95Q/t19F
 FJvQ==
X-Gm-Message-State: AOJu0YynfjKx5RrZNamO9+fh4RA6fpQ241g2juWNRs4SYgH/wPWEvPsm
 WKiI6zUp8XUqTOEEj5i3/o75BA==
X-Received: by 2002:a5d:6991:0:b0:320:976:f940 with SMTP id
 g17-20020a5d6991000000b003200976f940mr2718283wru.13.1696440742687; 
 Wed, 04 Oct 2023 10:32:22 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 d9-20020adff849000000b003248a490e3asm4502639wrq.39.2023.10.04.10.32.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 03/21] qapi: Inline and remove QERR_DEVICE_IN_USE definition
Date: Wed,  4 Oct 2023 19:31:38 +0200
Message-ID: <20231004173158.42591-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: Ln337oSKmqN7

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 blockdev.c                | 2 +-
 chardev/char-fe.c         | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 168177bcd7..daa889809b 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_DEVICE_IN_USE \
-    "Device '%s' is in use"
-
 #define QERR_DEVICE_NO_HOTPLUG \
     "Device '%s' does not support hotplugging"
 
diff --git a/blockdev.c b/blockdev.c
index e5617faf0f..da39da457e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2345,7 +2345,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
     }
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
-        error_setg(errp, QERR_DEVICE_IN_USE, device);
+        error_setg(errp, "Device '%s' is in use", device);
         return;
     }
 
diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 7789f7be9c..7d33b3ccd1 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -217,7 +217,7 @@ bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp)
     return true;
 
 unavailable:
-    error_setg(errp, QERR_DEVICE_IN_USE, s->label);
+    error_setg(errp, "Device '%s' is in use", s->label);
     return false;
 }
 
-- 
2.41.0

