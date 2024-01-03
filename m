Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp561622ejh;
        Wed, 3 Jan 2024 07:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGQzq7ubm/ttp+PGeCueKUW15W9XdZeda10NuwKK93WolhC50J/7tDpAMvQhkqO8Pjug/B
X-Received: by 2002:ad4:4ea3:0:b0:680:c798:1ce5 with SMTP id ed3-20020ad44ea3000000b00680c7981ce5mr2503015qvb.94.1704297297739;
        Wed, 03 Jan 2024 07:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704297297; cv=none;
        d=google.com; s=arc-20160816;
        b=K5W8f52vHF+XzO6ik2jRqWvqAY3ny17isZ6Z9gJYXT0/qAhqxU8zbYk/3KvRuJqMyw
         MPlflkO3ycCcdOg+a1FmKoqGRMRxCOHnhF4bx65M153fs3zRXnYeuAPi//sw9FqQPH9c
         yoaPQkzaKhMLVDcq7Mm1emu2QqRPElOPvKVaURGec+STyXtUFyo2x5il2tBm5FAu1PKJ
         a2ZdYkITtb+V+kaeDIcWuwrx2tJ8GpxIkwNl7TGP61set1n12G6GrGHESQcT749PNZtt
         gbC0U9U5b8P6PDqbkXhi7jLgm9WRTgGBTNZLrZHWPL3bRQbx9VSEjW5kKXg5tc+Dt7Ig
         DzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=XUsZkBPZcywubYVV0MJna251RDK09X3MEzKU8A5AJ28=;
        fh=HXATX5/62pMJVs80a2Hs0Qv0Y5F0Xlxx6Qu533NYerI=;
        b=0f9htIMc75U0E+qWN7hMSUJgx+Xv2pFXJEoTgDGAhFdsWerfmPiHHrZpDK9UifXgAK
         Hzu6603f0jX4MiTs4CyWAZzIv4xkiY37dHE4ZmKUW6+4A6wUwM+27ebdvz567tRdW8GL
         JvN0w++z+F5zFkQ3gPl29hiVNK/n6DfejPsjGJYbj6d0wTUj54QAM6pUnGk/McaExKjM
         6ondh1rM3mbh7bDHWWVRiBZQVAPRwptQqnZ/rZZfBEvtFh5VFgCd4O01NRF3Ko/MsTej
         SHLJRrqjuJdgnMwQaSVCETNPOB/l94Cv+lc+K7kAp66Slo/Q5KVJhj/TmwaqhNeg3Lny
         b+IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a0ce08c000000b0067f8600c0eesi28954197qvk.366.2024.01.03.07.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 07:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rL3Z8-0004MR-D8; Wed, 03 Jan 2024 10:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z5-0004Kf-Ry; Wed, 03 Jan 2024 10:53:55 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z2-00052E-LO; Wed, 03 Jan 2024 10:53:55 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id A063080027;
 Wed,  3 Jan 2024 16:53:43 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Anton Kochkov <anton.kochkov@proton.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v2 2/3] hw/arm/armv7m: alias the NVIC "num-prio-bits" property
Date: Wed,  3 Jan 2024 16:53:36 +0100
Message-ID: <20240103155337.2026946-3-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240103155337.2026946-1-sam@rfc1149.net>
References: <20240103155337.2026946-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5mffJspKrUC5

A SoC will not have a direct access to the NVIC embedded in its ARM
core. By aliasing the "num-prio-bits" property similarly to what is
done for the "num-irq" one, a SoC can easily configure it on its
armv7m instance.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 hw/arm/armv7m.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d10abb36a8..4fda2d1d47 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -256,6 +256,8 @@ static void armv7m_instance_init(Object *obj)
     object_initialize_child(obj, "nvic", &s->nvic, TYPE_NVIC);
     object_property_add_alias(obj, "num-irq",
                               OBJECT(&s->nvic), "num-irq");
+    object_property_add_alias(obj, "num-prio-bits",
+                              OBJECT(&s->nvic), "num-prio-bits");
 
     object_initialize_child(obj, "systick-reg-ns", &s->systick[M_REG_NS],
                             TYPE_SYSTICK);
-- 
2.42.0

