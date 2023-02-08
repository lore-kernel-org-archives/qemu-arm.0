Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6825005ejb;
        Wed, 8 Feb 2023 11:31:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/JFAVevIuFohxpF/GD0Pco1jPLstfGJvna/YCFHgsXdg6Q72Wg/5gBOUsK/WA+SjjEq1vd
X-Received: by 2002:ac8:66d2:0:b0:3b9:bc8c:c1fd with SMTP id m18-20020ac866d2000000b003b9bc8cc1fdmr24299379qtp.8.1675884707414;
        Wed, 08 Feb 2023 11:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675884707; cv=none;
        d=google.com; s=arc-20160816;
        b=ujloP/qc3Gj9X78HDrByMzv5r+IiRR68EsC9VQbqvnI/tNBi4TrCS17fuCmLCO+tJr
         +69uC4D4D0M0mQbq3xevTTn9M4/qOqQjJ1qAvaHbx32wUFxFj25m7xt6wSei7S79v6nB
         p6K8AbDA85Dlo2VW/0qiCYGcHyW530J+lKipfYDRIw3CdOfXp5UCGXH+Jvt4Rgcy4Pca
         GN2VOUYIuogP8n5ctP5EgkoZjErJ0RC/5E6eCx8EljXfUMHsMp6ltjbjsRx8A+lsGPLI
         /Sa1q9bflga3ZW7u3P5oG5/BMJpZhOIA/m3/JIzkPFq9Az9zwYG4G8Z/XCalzGBFq/Bc
         gMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=QQQW5av6Kh1UtYK3rJBakCy3kRUaqqQloZ6W9QwpKQM=;
        b=0oQru/R6PXScNeMMzOVoHi/Xjszfb7vrCOwUhKLX8dH7NSUzkp/DdYVAhjcTBtz1dy
         Z9oreuS5RdEP4RlQiSrcgFtBOvPTiApgonAcx36HYuMZhFe/9GAH2/VffJMwm2ZC1ppP
         0pOAUQgQGivDOvbnb3VT0x4anV2SMYYJTTTjSgoxuP0wsBvD/LR0Nz0VEmrBHbLR6bkb
         25rGPTn/IxTi+UqzSbphDqSV/+5K6uiUKcneyfHO1oNQ994dSWUFGrESNTJvroMqc54n
         PUFiGbkTb/1E55365MjJnrwoTJClFGNhEjRD0EfSEgBD9C2ey9q16Y4G57EuFGKojkg8
         VaHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FBwFf+a0;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05620a449100b007301dd82ed3si13328790qkp.548.2023.02.08.11.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 11:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FBwFf+a0;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPq8I-0007Bu-AC; Wed, 08 Feb 2023 14:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq85-00075z-9K; Wed, 08 Feb 2023 14:29:18 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq83-0006L4-1r; Wed, 08 Feb 2023 14:29:16 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78321203D3;
 Wed,  8 Feb 2023 19:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQQW5av6Kh1UtYK3rJBakCy3kRUaqqQloZ6W9QwpKQM=;
 b=FBwFf+a0tu1ieaTRtj18d7TW5pbYX6tl2Wn6QBUnSCrPjW53ce8DGbCaf9VSgqh8LZBeGg
 xCFbFuwtorb4PEYti4iU0CjCXP2gjIuXjuKOhr64qVnNH6WNHdKINVwVHcodF5JgVQx9Bj
 ACuUyI2iVXfwG7NPzvEqPX+10kBKTxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884553;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQQW5av6Kh1UtYK3rJBakCy3kRUaqqQloZ6W9QwpKQM=;
 b=cOgoDgNC2xoZJZdssKCxJUmoEWhOporDunw6Az7+tm9yuzmiTondNdLCfDB69L8GPWu98a
 2kF7aCCVFLuzxeCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEC0113425;
 Wed,  8 Feb 2023 19:29:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qBOOKQf442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v2 07/10] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102
 machine
Date: Wed,  8 Feb 2023 16:26:51 -0300
Message-Id: <20230208192654.8854-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
References: <20230208192654.8854-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: s8ry/NiTRivq

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 296d4f5176..552e3d04ee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -405,6 +405,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index ce4f433976..0ec6def4b8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -136,5 +136,4 @@ config USB_DWC3
 
 config XLNX_USB_SUBSYS
     bool
-    default y if XLNX_VERSAL
     select USB_DWC3
-- 
2.35.3

