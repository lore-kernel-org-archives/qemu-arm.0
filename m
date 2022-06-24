Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp343516lft;
        Fri, 24 Jun 2022 07:01:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxmGSanStWTgfr/HU8cTdBrdw0mBuKoK17EukmCOhmIf5Bv3MBoQ2onUc7hHqjo5lH+K4/
X-Received: by 2002:ac8:5d87:0:b0:305:bbf:cd85 with SMTP id d7-20020ac85d87000000b003050bbfcd85mr12846877qtx.618.1656079274196;
        Fri, 24 Jun 2022 07:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079274; cv=none;
        d=google.com; s=arc-20160816;
        b=F4yOGBjbUsePHyUMQ0vFdaxz3dX8n0nZFBWUbYtLnzlLaTVnIOpotYOaH53O2DxjD7
         hGTFAa7BKrTsKTGYV/1akSq73L17B7zLxc1QajyCwThCg7FVE7rm0rwPsWk/yh+lw/wT
         lqx2cYBLrru7b9/YhY71Us9oZfVfFuOtjji1f0zY+X1SamxYPe8Yj/7z5JR8WRoyogpC
         AWEsqM/OTJ9uuLKbUCW3BbHXQFyWrh21nTOz75tjsKE5PvXEyZ2eaGMod3NmR3XePBd6
         tzwYaVvCoUfXCFWw4Ms2BgBf9Jhd+pq3T2SoNxPSxRChkyaNAYnkrCmwVSFkK4R4KUqy
         Urlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AFbbUAzjgac/ZmziWUEJTg0l2q+ZflJgQ34UTmWNZms=;
        b=Zrz7fR4B/2C3XtXQYhd7hyWy7gw2sf3l0PJkL7H7o/q6T47d+3V7ALX4OoxJtjw4fY
         hy6vPJgQ9cjb098s7545aTgSKvKt0zs9qDzB0Vrb71K6YLqQ8x4vkd6J5eektvzgUNZj
         Nt5NsS+5Gqo3f7mbBQ5W+i67oojEOzVA5Nm9CJ253uvJwMwcDDnPq6u1B7IV3a/egNxM
         C++Ouxecf3OcAN09jQyDwFEwQA5K6ADufCHr39eJ+Z+k3DfNJU608CIgWI5frsvrkpuH
         ZvB9Uoy32NM+qwlXfEGl0js4IQWu5RIUmvRMkB8wACfpteWXadUETtKEnxAqSMrfGm5/
         JLdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=n77N9iU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020a05620a40c100b006a7284f0cd2si2285111qko.672.2022.06.24.07.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=n77N9iU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4js1-000530-MI
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaI-0001KN-QS; Fri, 24 Jun 2022 09:42:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaH-0005Eb-9i; Fri, 24 Jun 2022 09:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFbbUAzjgac/ZmziWUEJTg0l2q+ZflJgQ34UTmWNZms=; b=n77N9iU32lucTv7ItQFrkOPeRn
 yyfS25IHwri5nD7peqf0zR8z5bgVCEyLv/lbUEOt+CmFm23WSPCBBFEQ8vh7PghqOVsc6VzNH1XwA
 V1MPkOjn2V9sxkR+993DnR9hjOsr8ukyAjABGaVqwL5wxzTiYWFc2i8fUj9HX2piRXaKIOnLahrPV
 qAoLK/1QWEJsbgCx/NJ55mEJVxhIMmGTJ/35FEfJhLO+a13zW1zixz+0dj+C2J3jGUhhkVRY3Nr93
 x69SN6YMjBKkPLsUapwWmp6C2lDUAQADRLhgdqL8NnNOWAH53gixDiLbltP3N0N44NpPFTxUMRlE1
 S9mQduwssFme47P/4JHX/0xmAIiy33dxMPsu0CtzUyzeXBBnR3iLomtDRIulJVmnNdaQcIJ7jqlFA
 H5GKdcgcpvs6JQXZIoekhtewxTvZUss98s757fYwUeIcPs1/XlxgIcXuh6g2mFkWJ+RhkWrtfVint
 iSnJpWDkJdTk8wssAswLnd1NancViah7Z6PCIkxrIl9ezR3eZ0fTiDEvi9mQq0NC2Jf3OZFLtlpbh
 FcN+fZo6+XwuWrd16esGSIaM6ynIdNIK7gTBpoPxSA/zllj1chX+OIwduZqNzmqfuY96+bX2snuNa
 97goHO54MryO1L8YGpxSdQmYsnmVtnRB7WyiRs1ZY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYf-00037t-Pi; Fri, 24 Jun 2022 14:41:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:34 +0100
Message-Id: <20220624134109.881989-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 19/54] pckbd: move KBDState from pckbd.c to i8042.h
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mSbYQ0CeM1jL

This allows the QOM types in pckbd.c to be used elsewhere by simply including
i8042.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pckbd.c         | 24 ------------------------
 include/hw/input/i8042.h | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index c18a1a7fae..7b14cd007e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -146,30 +146,6 @@
 #define KBD_OBSRC_MOUSE         0x02
 #define KBD_OBSRC_CTRL          0x04
 
-typedef struct KBDState {
-    uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
-    uint8_t status;
-    uint8_t mode;
-    uint8_t outport;
-    uint32_t migration_flags;
-    uint32_t obsrc;
-    bool outport_present;
-    bool extended_state;
-    bool extended_state_loaded;
-    /* Bitmask of devices with data available.  */
-    uint8_t pending;
-    uint8_t obdata;
-    uint8_t cbdata;
-    uint8_t pending_tmp;
-    void *kbd;
-    void *mouse;
-    QEMUTimer *throttle_timer;
-
-    qemu_irq irq_kbd;
-    qemu_irq irq_mouse;
-    qemu_irq a20_out;
-    hwaddr mask;
-} KBDState;
 
 /*
  * XXX: not generating the irqs if KBD_MODE_DISABLE_KBD is set may be
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index e070f546e4..84b5aa7f23 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -11,6 +11,31 @@
 #include "hw/isa/isa.h"
 #include "qom/object.h"
 
+typedef struct KBDState {
+    uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
+    uint8_t status;
+    uint8_t mode;
+    uint8_t outport;
+    uint32_t migration_flags;
+    uint32_t obsrc;
+    bool outport_present;
+    bool extended_state;
+    bool extended_state_loaded;
+    /* Bitmask of devices with data available.  */
+    uint8_t pending;
+    uint8_t obdata;
+    uint8_t cbdata;
+    uint8_t pending_tmp;
+    void *kbd;
+    void *mouse;
+    QEMUTimer *throttle_timer;
+
+    qemu_irq irq_kbd;
+    qemu_irq irq_mouse;
+    qemu_irq a20_out;
+    hwaddr mask;
+} KBDState;
+
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
-- 
2.30.2

