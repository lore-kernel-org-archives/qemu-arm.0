Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp1411200ejo;
        Sat, 6 Jan 2024 10:15:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdld0qBCpmruTLGcEajjcC4QhYYldJQ41f675caHuSKaC+/BDj/baDLTOd/KOXV5XbBgmp
X-Received: by 2002:a05:622a:1819:b0:429:8791:c804 with SMTP id t25-20020a05622a181900b004298791c804mr1106489qtc.48.1704564952040;
        Sat, 06 Jan 2024 10:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704564952; cv=none;
        d=google.com; s=arc-20160816;
        b=thbQLRZwWVJ1sbCcKIXA2aKnxeYViC856i3dkHgtVvZLg4ObvZCPE1/EmCiRfKjEIN
         rJcRZ852RKGyzrqWwXC8JrcdRB8CiK2QWG3BM+zWL/xt5IzQB/hnj/LrfFHl4wU3L8yN
         ktlIWL9cE4mjlRW1X4RQii2ABATLLaPG5q11wlw7dQ/EW3FKkTBlskOhJEIOnhSpimOp
         xSlXJHg8CXL4IGTOKrGNUNgoaw3I5IXD8/e6QlXM6Ykhm2iDIdYQI5aEGMffFtZGG361
         W05L2tWO3Ah3INBWYVbnm/kW/kQJ93OljG4axTJk0XbBTqTxsrvK0wo8nbP1T/4/K5y8
         d1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pwne6ZRdjiy0KdXBJMIAxtpZ6iYOY3k5ka8VghVZA2w=;
        fh=R87mPwhYHu0gF5afZtbOsfEVx9y6lHOQHbd5WAm8bKQ=;
        b=FqQ6rNl+/PJBO4eiETdfsfHA0eBcBwB17RWfH3uPjZ0g6l1ELgDy3S8AR0NMR5xo6n
         QIVKkYZdX4Wh0J/DX6o5XqTNZoKs/3q0uzsLqhM2sHkjgYwmZLi9GYp7Qo9EKUOF7loC
         rPKPKb70DLiGgv417/0J6djpeEAC3eE6Cby6MtLdJqx/bm5OjbZKAJHBt6ctQqkC+OLt
         dL/SvpeggabYU18GY+rG1CBQqDUwnIuvqqwwCpecni4wXGQgagJuX6RLudr8y5OjfIaK
         Vsn4/OHwBIvtw0RK6SMzFgwETo/F7HxxILVKoAAsUWXgZvuqPciA3amH5bXLWmuh4G5o
         RTIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=yLEYvFld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca5-20020a05622a1f0500b004254e18956asi4346034qtb.98.2024.01.06.10.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jan 2024 10:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rfc1149.net header.s=smtp header.b=yLEYvFld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMBCT-0006N4-3P; Sat, 06 Jan 2024 13:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rMBCR-0006MG-Md; Sat, 06 Jan 2024 13:15:11 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rMBCP-0001vz-S1; Sat, 06 Jan 2024 13:15:11 -0500
Received: from 127.0.0.1 (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by zoidberg.rfc1149.net (Postfix) with ESMTPSA id 6152A80027;
 Sat,  6 Jan 2024 19:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfc1149.net; s=smtp;
 t=1704564904; bh=oUHxTnxbJvmbEvqdnnqwZEZn9kWgtC+tyGXnlDxve3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=yLEYvFldTrVhoUyXhSBunjIXabEi7otSSKeJUDbtwa67DXed7zA3oked6YwF8Q35O
 3TvznjLfB02ciVDDx+fvglBOxguG0hlslc0yQbl6ZGfohjFi4HEJP0YIsRHtLrM/63
 TY3Xg43Ou9ig3NmXs4OVZt7zfHaCJ1FNeWtBBPaLTMwBbHk/gmSfVYMxmixBbi8B8H
 DYreBykkpctFN36ccDsdzuGE0Wlp+VzMWKgV7x/KvPlcJXaHkyCofaSUfOKspN1DrB
 bdb+lfVtWqyU2rN0+NXtwH4UdGHeDAEX+H2fMd11VcTyKy1Mql7MG4rIyLNRgnBzlu
 50YFwaTIcFaoQ==
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v3 2/3] hw/arm/armv7m: alias the NVIC "num-prio-bits" property
Date: Sat,  6 Jan 2024 19:15:02 +0100
Message-ID: <20240106181503.1746200-3-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240106181503.1746200-1-sam@rfc1149.net>
References: <20240106181503.1746200-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ic5Y4bBXbiWI

A SoC will not have a direct access to the NVIC embedded in its ARM
core. By aliasing the "num-prio-bits" property similarly to what is
done for the "num-irq" one, a SoC can easily configure it on its
armv7m instance.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c         | 2 ++
 include/hw/arm/armv7m.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index e39b61bc1a..1f21827773 100644
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
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index e2cebbd15c..5c057ab2ec 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -43,6 +43,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
  *   a qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET).
  * + Property "cpu-type": CPU type to instantiate
  * + Property "num-irq": number of external IRQ lines
+ * + Property "num-prio-bits": number of priority bits in the NVIC
  * + Property "memory": MemoryRegion defining the physical address space
  *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
  *   devices will be automatically layered on top of this view.)
-- 
2.42.0

