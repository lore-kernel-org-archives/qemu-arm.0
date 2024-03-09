Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp367825ejc;
        Sat, 9 Mar 2024 11:23:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUO86Lv2Z8nEycdiKOCGOgmOx+o7OAJ4uC/grcYNbCV3AwvR2Uv64gJeOSGCSEq1we0ZrtZg2J4FBRfmNspyqFYbxwrNaVt
X-Google-Smtp-Source: AGHT+IHmHxc6oetPgF8w/cU2NbI0fOnpY4spzJdyYWd4Z2iLzOOGNeJ8CoKJgk+JRUChexZ0JEkX
X-Received: by 2002:a0c:f8cc:0:b0:690:ba29:bad3 with SMTP id h12-20020a0cf8cc000000b00690ba29bad3mr2568180qvo.12.1710012202204;
        Sat, 09 Mar 2024 11:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012202; cv=none;
        d=google.com; s=arc-20160816;
        b=XJgQkFZFTxR45AENMXii1R8iEmA+AeKDU4WSdwbHG9zNJdG3p2+71reW7SC4exQ0NA
         qfjlCW0bkLpxLFUKHR8bmCW+LdSy/XWZWmBwN9GOl6ffGE00mkbuxe9l7AmZeBS42PXg
         VC0PHELf5/KaRIhTljdxkBW9BjaJgYFtAEtM7rWYtaFGIYogg0MV+//tI2X+yak5nAmi
         WW+/GZmXPrCMxXCQGpOCecKzuNB1YbBH/PBzvUnhGq6MO1yqn0PkrNRHYVZ7a88OlAjC
         13sPlYiiRiKfb9EgjTJQHs2hcYeIPqMGqJ5wC0rNV5l6gOT5nnUPuK1zUwiWdRtsiFpD
         vdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hXABjAaMhxHgVCCn4BlGHy0+qqoq0gDIyiPdTnOnZyc=;
        fh=Qftd5BqVDk9KndWU0Fapdh90yCHq01eL/NlnGpzAu88=;
        b=VbZ552NkdbKRWET1S5sGZIMHYavtA6AlPFCGbmSAP3WkAonM1ihqNEDDsRCzIgg32z
         PB7MnlwZEzQuM/dKVkP15U0D9Oq0TB6B9yiuP+H3R+7Mmzt6BF4kl/bEaCcjZtB5HNbX
         X/OOwvTtR3W8Jpwc2MZxVvsWGzwm3i29hffjjwAdSlFFAAPJXOdCGxSbaRN6zDgxJcby
         3KjvDlm2C4rxes74MTSUQ1Myq8e4CBM2l4HgB/90my9ZWgMWohMbZUz/ZOfNKNLLxoWy
         o3CN89mferTVrQz286I3Az7+ow6LHP1hUEGKMmzf8CqO8fVwwxZdaqVPNeUWby/GKQtu
         35dA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfsMsTYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020ad45c86000000b00690ca2ec976si210028qvh.408.2024.03.09.11.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfsMsTYk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2HF-0000Bq-NC; Sat, 09 Mar 2024 14:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HE-0000B9-7b
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:36 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2HC-0002Sc-Nk
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:22:35 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a45bdf6e9c2so372656666b.0
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012153; x=1710616953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXABjAaMhxHgVCCn4BlGHy0+qqoq0gDIyiPdTnOnZyc=;
 b=mfsMsTYkDCpgjf2QMCF2eoAcYTW4ZyH08BAH20vmzKCLBsafDfXyM29j4rw9LIXOIp
 Qg4s6KzOEXV6AwBmGF9ZrB2sfT0kPXUVt0KBKkuJLVjvimqXOjnQmACaqfAcIzX8UoHb
 PKNFiK9jVQNKdkHJt9qow0RjOX382GViTFkKUH1nFZLImaTLiGC27cLjZ+R/uVGfQEV6
 Bc1ZsC2wZeENotgdiXhULYMVlPp4rtrHjJ5VFBI4gEMrP04nlAmaVk7B15pGBoNNQmB7
 sy9TexOj/3dLAqhM6YMHgx8/dWaVs5Vt6iVsEcNkD5AKgsLCbR+Qc8HzOoI+AOgT4t9C
 zfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012153; x=1710616953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hXABjAaMhxHgVCCn4BlGHy0+qqoq0gDIyiPdTnOnZyc=;
 b=qd5JGVYEpi0JT2M64GNMpj9tsSQTNWQUOLlJsz/qKqVXryTJq6CIXvjsFUYxSAv8HS
 qpDqvusHoSvaxjigk5Exg/5CccUZ9ERtUVGq+51mDJHLzVMBirjJre9hPZoY757SsRwp
 7cxGoXRvf41qXwu7ukW8AXGM+ABi9ijrChBRqkWFkMRSOQuSbmHkHTKWmmtLWFPkfUFH
 z8PhopT911XUkfO2ZcGxB15Dw134+J54PkrCwOv62m2B4P206ZMzRIvkcrjMzx8atjcA
 oBFMG8W3sMMmJFYYG5Br2UPKeNqqBXLf/W9ujQfCprxbxyKqXHwsUvnXkOvbRy+BzKca
 foCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbzpcoHlMEaVr2PD8VQPNZt3rduv4/zZivSgqKb5NpeWI36PAgjsatLB082x6EUSZcD37QZtds17rAf0ECs6EcwHEI
X-Gm-Message-State: AOJu0Yzp7XCnYMP7HVp23AV386j6O1J2gxgO3A0UlUoMmRFMnukvgIt3
 KF8QtCbuFhYw1Vxt2WU1031TVDL9fMjHs9E1B980PydjPN+o5HZDg/CvU4/+kV8=
X-Received: by 2002:a17:906:4f02:b0:a44:446b:e99e with SMTP id
 t2-20020a1709064f0200b00a44446be99emr1256763eju.31.1710012153357; 
 Sat, 09 Mar 2024 11:22:33 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 sd21-20020a170906ce3500b00a45f3524ac3sm1161512ejb.118.2024.03.09.11.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PULL 03/43] sysemu/xen-mapcache: Check Xen availability with
 CONFIG_XEN_IS_POSSIBLE
Date: Sat,  9 Mar 2024 20:21:30 +0100
Message-ID: <20240309192213.23420-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: 3dpdCLGGbXNz

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN accelerator.
Use it in order to use "sysemu/xen-mapcache.h" in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-4-philmd@linaro.org>
---
 include/sysemu/xen-mapcache.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..10c2e3082a 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -10,10 +10,11 @@
 #define XEN_MAPCACHE_H
 
 #include "exec/cpu-common.h"
+#include "sysemu/xen.h"
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_IS_POSSIBLE
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-- 
2.41.0

