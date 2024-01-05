Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796912ejo;
        Fri, 5 Jan 2024 07:53:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1EjfxgEh3JLPPgPg69qODeUjZGU1beJJrBl/xUht0eazvL8kDLOBnyRphNC9WgqixzDeF
X-Received: by 2002:a05:620a:8516:b0:781:9a8b:9fe2 with SMTP id pe22-20020a05620a851600b007819a8b9fe2mr2208091qkn.40.1704470012906;
        Fri, 05 Jan 2024 07:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470012; cv=none;
        d=google.com; s=arc-20160816;
        b=x1DftDidFjEOEyQPJpZM4JO4hPB101jxVK/akHc/Smcj36rkHw7Ucj6vjOei0rHLia
         1iqFidRCsBsvitO+pzNqg7ueiiPgYbRXoGP+DZqe6aZQeBtHyyYEVlUHnRAiN/lFwJIP
         zH0EYPXX30d/hb6gjTccgqL4x+gUXdjWWPOiFieVjvHs8oRaQdXfvg7LvNxqv3HK1YJ0
         OslNS10bZ/gFHJCDUxbrm9O4YZQGs8fCPpRfmkNvY4DR5V1Sc+cZYeEVnEnaSQhf2T7G
         oZE7Edz98kyuOJBj5qBMozt46P0zu/jnsR91GgS06Dg44iM57bWKO045qUWMlcdYZnMj
         CuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z5/v+dvKjgkiKWiEWELJXJdh6CxKEAYCa0IE+244Hh8=;
        fh=g6/8fu8e9GIV7auJ5exiaeUZJw/Dl0DeOjMzgfSn96E=;
        b=IIOrUwgQtUkCJEz50lWaKPLSIAiLnN4MCwnSC30c77ASXSOg12kewnwZl2aCcNWxGs
         MSH9kCmiGGLGMFLqwQEDICxQ92ZWZonCB3e5LVcJgAJDOzIQcL8D4SiV0uPC59UgSeT/
         wvnosIy9VM7wQusJ51tBgiriYBDDIpl3QbJP1499NwqqL6oKbt8S0MBvRYR1u4mKS+nB
         vmj8WV84x/YVbdZTvlPHSPiO+fI4tBv/qfai7+IGa5T4tCcjcKEfLwLjGR+4xBhzrrDF
         F7+pg8Zvs5/I9oH7G1Kh9yHxpr0ovPp8RMOMA9XGySaTBM1YUq6Lya5MG+iLLNiWoiY7
         riaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGmMTmsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05620a44cb00b00781d107f9fcsi2095744qkp.641.2024.01.05.07.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGmMTmsP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmTY-0003tH-HL; Fri, 05 Jan 2024 10:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSL-0008R8-KX
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:59 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSI-0000zK-7e
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336f2c88361so1526416f8f.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469791; x=1705074591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5/v+dvKjgkiKWiEWELJXJdh6CxKEAYCa0IE+244Hh8=;
 b=QGmMTmsPzG09YP9RTv3wX7hL7BH1ePk48LweT5ro7lTtu1EO15dnbc0Z7nwii5Uxlv
 gAW8H1cVZTlXlUlS+OxOd+rST3K69Lolv8+WWSp2MLaik+gKY0wkGMOaSnad4wKvOwaY
 wbSeFAQWo/UyO2VJ0uxalm2g6PT1ouLlhmkAdqCjMfVnxOq8wODyPkFXzSUNMSEWhuzG
 C9NYGv5GTiIkFuNPID2YoDeML53hhQRqvubhLYm5Es18EQyRCbEUR8bcbSDT014IfI4V
 HvbV6s43a0bbTa/59PAjyk8xD3Nn0gw0cbe58Nf0eksTU3spwYiD0joNdjXsVmIMmveD
 rDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469791; x=1705074591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5/v+dvKjgkiKWiEWELJXJdh6CxKEAYCa0IE+244Hh8=;
 b=B/klf/jffS1YdYdrbhAuBsDBTd5Oc3aVtSHlLDTSAy1aufUJzrrkhi0LcTi+tcHm7U
 fmZ2Es6ae5nz1rJlcoPuWvHrfms3dQgRsdGQfhtTIQOIWz7df4OuxYXDJwy8SFYY4xjV
 bvfeiyG/IqRGPVJKh5CYf8fY7eoYIMXct36409X+mcgz+itNDw6+xoBYwCWZjrEHaR/0
 Gx1eFGvCnzPmiISKw1huR/RmtygcyCSJN1eu3aVSadGIndA1Gj8wd+2VtjBk2j/hqhuO
 FadlkxylGHltMLZTwUJymkPEeCqq/rCVok0rR2A9jHeVzv2dXHU9aNgfjUy4f0xJxL1w
 GxaQ==
X-Gm-Message-State: AOJu0YxFK+B9L+nD2Z+Uzo38UV6MjkXIgdwL568YXU55xKRlwjxmdaIf
 9WgUriaXE9CabsQVcqwnTCjhuGriBEztn86q/288xIMCOZI=
X-Received: by 2002:a05:600c:3488:b0:40d:8514:fb5 with SMTP id
 a8-20020a05600c348800b0040d85140fb5mr1225021wmq.21.1704469791170; 
 Fri, 05 Jan 2024 07:49:51 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b0040e398f8cafsm1647488wmb.31.2024.01.05.07.49.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 66/71] hw/misc: Simplify memory_region_init_ram_from_fd() calls
Date: Fri,  5 Jan 2024 16:42:59 +0100
Message-ID: <20240105154307.21385-67-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: G0XqNBUVrwyj

Mechanical change using the following coccinelle script:

@@
expression mr, owner, arg3, arg4, arg5, arg6, arg7, errp;
@@
-   memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp);
    if (
-       errp
+       !memory_region_init_ram_from_fd(mr, owner, arg3, arg4, arg5, arg6, arg7, &errp)
    ) {
        ...
        return;
    }

and removing the local Error variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-24-philmd@linaro.org>
---
 hw/misc/ivshmem.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 62af75e862..a2fd0bc365 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -476,7 +476,6 @@ static void setup_interrupt(IVShmemState *s, int vector, Error **errp)
 
 static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
 {
-    Error *local_err = NULL;
     struct stat buf;
     size_t size;
 
@@ -496,10 +495,9 @@ static void process_msg_shmem(IVShmemState *s, int fd, Error **errp)
     size = buf.st_size;
 
     /* mmap the region and map into the BAR2 */
-    memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s), "ivshmem.bar2",
-                                   size, RAM_SHARED, fd, 0, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!memory_region_init_ram_from_fd(&s->server_bar2, OBJECT(s),
+                                        "ivshmem.bar2", size, RAM_SHARED,
+                                        fd, 0, errp)) {
         return;
     }
 
-- 
2.41.0

