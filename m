Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1970232lfq;
        Sun, 17 Jan 2021 11:34:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5upiPMP5giusLA/aUpfDGihxz5Zao90f//JEBwrgVxMv7SScFQkYL9uNB12TpxaD+bgzE
X-Received: by 2002:a25:ce4c:: with SMTP id x73mr25343060ybe.93.1610912073891;
        Sun, 17 Jan 2021 11:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610912073; cv=none;
        d=google.com; s=arc-20160816;
        b=cQPJl5Q3h9Uoo4nYtAySVeC4vpPs9ALNMzTYZNsYE9g1iM4D8d0S84xL8AjVfzLYxs
         8ee7Vpho1Uv90GTe2UkWlUT9SrQvAK2W699iTst9k2a58lwOrquzDE8Ms5gQtyflgSgZ
         /PSBsF2OjLSycHD5ijBrSDr/YwvcHI+yPlfZ0j8/LXLPOG7xRAdMyI9aU3UvwXeauHma
         G9+2JtxPOaMK6flVOv0HJdIA08/MieMEBHeHFj2H09Cd4N6JAzw70fOlg9OkUkxkzDNz
         ug/67eYCGBAwqLD8ITh7ULKv1DYza9A+4h3yhRO3QCgkJdBSfLMH/JKEw8DpN+1YD6g1
         QXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gddpL1/dTBK1hhWCBYVWNUJWRgr6oC/oPS+FjqFdg/8=;
        b=U9Im+PcrvJ6O3ZcoQ0G1qRwVpbjsrzz8Q1JPECRx1sd8L4z0FpR8Nw+uWTVf03vrJq
         WLDmwOzvUMgP6qMxoUdKb706/naey2mgjXjKWpvSWNa0DT4DR6cOxQ6efHvv/RuonCxJ
         BRfUiBfKPhLxjlHk89edXAleV7MZ2bECgQcl2OffDWrZ4K0nYm/29cLXeSnc5OrGeTZP
         xt7rT5OZmfZc61qQkkSHcEdRme4e1zVApGUTcQyG3xQgZhD+IErrKdz7XikhYG22Gba4
         ZBPM1HWFMXUOQ0c8v/4MUM06wl21BrRCySYQE+7a4PXnH/dUvJLqjhS1dgx5+T0bHN2C
         629A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MEj8ltNQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si15312701ybg.242.2021.01.17.11.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MEj8ltNQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Don-0006uF-7p
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg9-0007ra-8q; Sun, 17 Jan 2021 14:25:39 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg7-0005F3-Iz; Sun, 17 Jan 2021 14:25:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id m187so5480459wme.2;
 Sun, 17 Jan 2021 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gddpL1/dTBK1hhWCBYVWNUJWRgr6oC/oPS+FjqFdg/8=;
 b=MEj8ltNQAsGz6HhkTJgapNBfe0IqX1RUk87fpo+4ZlDjM4zgtCwgkEp9nUF+pxxhY5
 sbyps4aVG5XlxrBzXquYrG2TR2iiSM/PNhQkbTXhFF5W3NawOAc/6X5Be2TNMXrnKtNk
 QX5ZXm/JIPt+jd5VS/tC8RnG0RWuxJ9lh64ISrq5awvS34PUSg/uElvpNEVBJmjlhEdg
 sX2E+eYmia7cJDGxZSYaeKK/cFW+qVUgVfEpK9X9ZlVXG1WEwTd457arKjZpJNcyEoxf
 kYHOJmt554sLczGB2utJUktB12+lAFG5uYhb/oksuibma+K8nJyjTR4Jw+oWWbgiq5Ts
 u/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gddpL1/dTBK1hhWCBYVWNUJWRgr6oC/oPS+FjqFdg/8=;
 b=EfJl9tznZJeNSaWXRQGePu5mTSLX+nSspYiUi2/i1z6iuT9T/SoOK3ccHl7XVXCLEN
 UuQWLwc4XhqKK18QumRG49s7Q0Iii0Qckm+tRfJBRv+MZEDGPGxFbGeJ+TZDmumEAoyD
 G3FxWcQrHO5hhRVqmdTEcOoz630rKoLxlX3D4twVfd0gcqqLJqzwOmAump4TEadWu0YB
 AhpXtY7btcLN7IQpu2+LhJRC5XR1z2hhrJW3Ty6SE5n6dCPBdDrCabcRWrS08/9BlV5n
 sMTjXKfPpjO9dEKA4KYY8+zQOWjFXncav0J7fa0KUbW8jUhgevSQ+OptLQZw0WtDicTm
 Sp9Q==
X-Gm-Message-State: AOAM5328r8Gjs/8BHjrQ241aaWDidtebeJVSjPyHexv81aM8rc5vLJ4X
 dsGg3onsgYV8+hCniM9UIAI=
X-Received: by 2002:a05:600c:2a47:: with SMTP id
 x7mr15892217wme.145.1610911533975; 
 Sun, 17 Jan 2021 11:25:33 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z63sm22476855wme.8.2021.01.17.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/20] hw/cpu/a9mpcore: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:34 +0100
Message-Id: <20210117192446.23753-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nO3D9hqa2a0A

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/cpu/a9mpcore.h | 3 ++-
 hw/cpu/a9mpcore.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/cpu/a9mpcore.h b/include/hw/cpu/a9mpcore.h
index e0396ab6af7..234ac13be2c 100644
--- a/include/hw/cpu/a9mpcore.h
+++ b/include/hw/cpu/a9mpcore.h
@@ -25,10 +25,11 @@ struct A9MPPrivState {
     SysBusDevice parent_obj;
     /*< public >*/
 
+    /* Properties */
     uint32_t num_cpu;
-    MemoryRegion container;
     uint32_t num_irq;
 
+    MemoryRegion container;
     A9SCUState scu;
     GICState gic;
     A9GTimerState gtimer;
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579b..2e1d2d46b5b 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -175,6 +175,7 @@ static void a9mp_priv_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = a9mp_priv_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, a9mp_priv_properties);
 }
 
-- 
2.26.2

